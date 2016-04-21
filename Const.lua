-- Created by Squalleze
metatable = {
	__consts = {},
	__index = function(table, key)
		if getmetatable(table).__consts[key] ~= nil then
			return getmetatable(table).__consts[key]
		end

		return rawget(table, key)
	end,
	__newindex = function(table, key, value)
		if getmetatable(table).__consts[key] ~= nil then
			error("You can't change a constant value")
		else
			rawset(table, key, value)
		end
	end
}

setmeta = function(list)
	local meta = {
		__consts = {}, --list,
		__newindex = function()
			error("You can't change a constant value")
		end,
		__index = metatable.__index
	}
	
	table.foreach(list, function(k, v)
		if type(v) == 'table' then
			meta.__consts[k] = setmeta(v)
		else
			meta.__consts[k] = v
		end
	end)
	
	return setmetatable({}, meta)
end

setmetatable(_G, metatable)

define = function(key, value)
	if getmetatable(_G).__consts[key] ~= nil then
		error('This constants already exists')
	else
		getmetatable(_G).__consts[key] = type(value) == 'table' and setmeta(value) or value
		return value
	end	
end
