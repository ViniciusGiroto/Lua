oldprint = print

print = function(...)
	local _ = {}
	table.foreach({...}, function(k, v) table.insert(_, tostring(v)) end)
	oldprint(table.concat(_, '\t'))
end
