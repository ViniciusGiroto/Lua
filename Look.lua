-- Created by Squalleze
look = function(l)
    local fur, acessories = l:match("(%d+)(.*)")
    local out = {tonumber(fur)}

    for a, b in acessories:gmatch("[;,](%d+)([_+%x]*)") do
        local add = {id = tonumber(a), colors = {}}
        for c in b:gmatch("[_+](%x+)") do
            table.insert(add.colors, c)
        end
        table.insert(out, add)
    end

    return out
end
