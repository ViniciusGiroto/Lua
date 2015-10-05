-- Created by Squalleze
table.foreach({"nil", "number", "string", "boolean", "table", "function", "thread", "userdata"}, function(_, t)
	_G['is' .. t] = function(v) return type(v) == t, type(v) end
end)
