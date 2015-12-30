-- Created by Squalleze
tree = function(list, pos)
    local out = ""
    for i, v in pairs(list) do
        out = out .. "\n" .. string.rep("\t", pos or 0) .. i .. ": "
        if type(v) == "table" then
            out = out .. "{" .. tree(v, (pos or 0) + 1) .. "\n" .. string.rep("\t", (pos or 0)) .. "}"
        else
            out = out .. v
        end
    end
    return out
end
