-- Created by Squalleze --
binary = {}
binary.encode = function(str)
	local out = {}
	for k in string.gmatch(str, ".") do
		local value = k:byte()
		local bin = ""
		repeat
			bin = (value % 2) .. bin
			value = math.floor(value / 2)
		until value == 0
		table.insert(out, ("0"):rep(8 - #bin) .. bin)
  end

	return table.concat(out)
end

binary.decode = function(str)
	local out = {}
	if #str % 8 ~= 0 then
		error("Invalid binary input", 0)
	end
	for k in string.gmatch(str, "........") do
		table.insert(out, string.char(tonumber(k, 2)))
  end

	return table.concat(out)
end

-- Example
print(binary.decode("010010000110010101101100011011000110111100100000011101110110111101110010011011000110010000100001"))
print(binary.encode("Squalleze"))
