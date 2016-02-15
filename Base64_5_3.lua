-- Created by Squalleze
base64 = {
	base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="
}
base64.encode = function(str)
	local str = {string.byte(str, 1, #str)}
	local out = {}
	local b

	for i = 1, #str, 3 do
    b = (str[i] & 0xFC) >> 2
    table.insert(out, base64.base:sub(b + 1, b + 1));
    b = (str[i] & 0x03) << 4
    if (i + 1 <= #str) then
    	b = b | ((str[i + 1] & 0xF0) >> 4)
  		table.insert(out, base64.base:sub(b + 1, b + 1));
    	b = (str[i + 1] & 0x0F) << 2
			if (i + 2 <= #str) then
      	b = b | ((str[i + 2] & 0xC0) >> 6)
  			table.insert(out, base64.base:sub(b + 1, b + 1))
      	b = str[i + 2] & 0x3F
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
  	table.insert(inChars, k)
  end

  for i = 1, #inChars, 4 do
		for _i = 1, 4 do
      b[_i] = base64.base:find(inChars[i + _i - 1]) - 1
		end
		decoded[j] = ((b[1] << 2) | (b[2] >> 4)) & 0xFF
		j = j + 1
    if b[3] < 64 then
      decoded[j] = ((b[2] << 4) | (b[3] >> 2)) & 0xFF
			j = j + 1
      if b[4] < 64 then
        decoded[j] = ((b[3] << 6) | b[4]) & 0xFF
				j = j + 1
			end
		end
	end

	return string.char(table.unpack(decoded));
end

-- Example
print(base64.decode("T2zDoSBtdW5kbyE="))
print(base64.encode("Squalleze"))
