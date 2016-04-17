str = string

str.pad = function(input, padLength, padString, padType)
	input, padString, padType, padLength = tostring(input), str.split(tostring(padString or ' ')), padType or 1, math.floor(padLength)
	local out, len = input, padLength - #input

	if (len > 0) then
		local ext, cl, cr = len % #padString, '', ''
		local pad = table.concat(padString):rep(math.floor(len / #padString)) .. table.concat(padString, '', 1, ext);

		if (padType == 0) then
			cl = pad
		elseif (padType == 1) then	
			cr = pad
		else
			local lw, rw = math.floor(len / 2), math.ceil(len / 2)
			cl, cr = table.concat(padString):rep(math.floor(lw / #padString)) .. table.concat(padString, '', 1, lw % #padString), table.concat(padString):rep(math.ceil(rw / #padString)) .. table.concat(padString, '', 1, rw % #padString)
		end

		out = cl .. out .. cr;
	end
	
	return out;
end

str.shuffle = function(input)
	local split, out = str.split(input), {};

	for i, chr in next, split do
		local pos = math.random(1, #split);
		while (out[pos]) do
			pos = math.random(1, #split);
		end
		out[pos] = chr;
	end
	
	return table.concat(out)
end

str.split = function(input, length)
	input, length = tostring(input), length or 1;
	local out = {}
	-- Don't use this
	-- for k in input:gmatch(('.?'):rep(length)) do
	-- 	 table.insert(out, k)
	-- end
	for i = 1, #input, length do
		table.insert(out, input:sub(i, i + length - 1))
	end
	
	return out
end

str.str = function(input, needle, before)
	before, needle, input = before == true, tostring(needle), tostring(input)	
	return ({input:match('(.-)(' .. needle .. '.*)')})[(before and 1 or 2)];
end

str.title = function(a)
  return a:gsub('(%S+)', function(b) return b:lower():gsub('%a', str.upper, 1) end)
end

str.wordcount = function(input, format, charList)
	input, charList, format = tostring(input), tostring(charList or ''), format or 0;
	local out = format == 0 and 0 or {};
	
	for i, v in input:gmatch('()([%a' .. charList .. ']+)') do
		if format == 0 then
			out = out + 1
		elseif (format == 1) then
			table.insert(out, v);
		else
			out[i] = v;
		end
	end
	
	return out
end
