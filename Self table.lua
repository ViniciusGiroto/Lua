-- Created by Squalleze
t = function(l)
	return setmetatable(l, {__index = table})
end
