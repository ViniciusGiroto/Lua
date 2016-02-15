-- Created by Squalleze --
base64 = {
	base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
}
base64.encode = function(str)
	local str = {string.byte(str, 1, #str)}
	local out = {}
	local b

	for i = 1, #str, 3 do
    b = bit32.rshift(str[i] % 0xFD, 2)
    table.insert(out, base64.base:sub(b + 1, b + 1));
    b = bit32.lshift(str[i] % 0x04, 4)
    if (i + 1 <= #str) then
    	b = bit32.bor(b, bit32.rshift(str[i + 1] % 0xF1, 4))
  		table.insert(out, base64.base:sub(b + 1, b + 1));
    	b = bit32.lshift(str[i + 1] % 0x10, 2)
			if (i + 2 <= #str) then
      	b = bit32.bor(b, bit32.rshift(str[i + 2] % 0xC1, 6))
  			table.insert(out, base64.base:sub(b + 1, b + 1))
      	b = str[i + 2] % 0x40
  			table.insert(out, base64.base:sub(b + 1, b + 1))
			else
      	table.insert(out, base64.base:sub(b + 1, b + 1))
				table.insert(out, "=")
			end
		else
    	table.insert(out, base64.base:sub(b + 1, b + 1))
			table.insert(out, "==")
		end
	end

	return table.concat(out)
end

base64.decode = function(input)
	if #input % 4 ~= 0 then
    error("Invalid base64 input", 0);
	end

  local decoded = {}
	local inChars = {}
  local j = 1
 	local b = {}

	for k in string.gmatch(input, ".") do
  	if k ~= "" then table.insert(inChars, k) end
  end

  for i = 1, #inChars, 4 do
		for _i = 1, 4 do
      b[_i] = base64.base:find(inChars[i + _i - 1]) - 1
		end
		decoded[j] = bit32.bor(bit32.lshift(b[1], 2), bit32.rshift(b[2], 4)) % 0x100
		j = j + 1
    if b[3] < 64 then
      decoded[j] = bit32.bor(bit32.lshift(b[2], 4), bit32.rshift(b[3], 2)) % 0x100
			j = j + 1
      if b[4] < 64 then
        decoded[j] = bit32.bor(bit32.lshift(b[3], 6), b[4]) % 0x100
				j = j + 1
			end
		end
	end

	return string.char(table.unpack(decoded));
end

-- Example
print(base64.decode("T2zDoSBtdW5kbyE="))
print(base64.encode("Squalleze"))
