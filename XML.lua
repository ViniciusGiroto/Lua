-- Created by Squalleze
xml = {}
xml.parseargs = function(s)
    local out = {}
    string.gsub(s, "([%-%w]+)=([\"'])(.-)%2", function (w, _, a)
        out[w] = a
    end)
    return out
end

xml.mt = function(list)
    return setmetatable(list, {__index = {
        getElementsByTagName = function(self, tagName)
            local out = {}
            for index, value in ipairs(self) do
                if value.label == tagName then
                    table.insert(out, value)
                end
            end
            
            return out
        end,
        toXML = function(self)
            local out = ""
            if self.empty == 1 then
                local args = {}
                for key, value in next, self.xarg do
                    local bracket = tostring(value):find("\"") and "\"" or "'"
                    table.insert(args, ("%s=%s%s%s "):format(key, bracket, value, bracket))
                end
                out = out .. ("<%s %s/>"):format(self.label, table.concat(args))
            else            
                local args = {}
                local content = {}
                for key, value in next, self.xarg do
                    local bracket = value:find("\"") and "\"" or "'"
                    table.insert(args, (" %s=%s%s%s"):format(key, bracket, value, bracket))
                end
                for index, value in ipairs(self) do
                    table.insert(content, value:toXML())
                end
                out = out .. ("<%s%s>%s&lt;/%s>"):format(self.label, table.concat(args), table.concat(content), self.label)
            end
            return out
        end
    }})
end

xml.load = function(s)
    local stack = {}
    local top = xml.mt{}
    table.insert(stack, top)
    local ni, c, label, xarg, empty
    local i, j = 1, 1
    while true do
        ni, j, c, label, xarg, empty = string.find(s, "<(%/?)([%w:]+)(.-)(%/?)>", i)
        if not ni then break end
        local text = string.sub(s, i, ni - 1)
        if not string.find(text, "^%s*$") then
            table.insert(top, text)
        end
        if empty == "/" then  -- empty element tag
            table.insert(top, xml.mt{label = label, xarg = xml.parseargs(xarg), empty = 1})
        elseif c == "" then   -- start tag
            top = xml.mt{label = label, xarg = xml.parseargs(xarg)}
            table.insert(stack, top)   -- new level
        else  -- end tag
            local toclose = table.remove(stack)  -- remove top
            top = stack[#stack]
            if #stack < 1 then
                error("Nothing to close with " .. label)
            end
            if toclose.label ~= label then
                error("Trying to close " .. toclose.label .. " with " .. label)
            end
            table.insert(top, toclose)
        end
        i = j+1
    end
    local text = string.sub(s, i)
    if not string.find(text, "^%s*$") then
        table.insert(stack[#stack], text)
    end
    if #stack > 1 then
        error("unclosed "..stack[#stack].label)
    end
    return stack[1].label and stack[1] or (stack[1][1].label and stack[1][1] or {})
end
