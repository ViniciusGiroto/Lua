-- Created by Vinicius G.
local str = string

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

str.replace = function(input, search, replace, mode, limit)
	limit = limit or #input
	local out, rtype, lw, r = input, type(replace), {}, 0

	local rep = function(...)
		r = r + 1
		return (rtype == 'table' and ((mode ~= 2 and replace[lw[(mode or 0) + 1]] or (mode == 2 and (replace[lw[2]] or replace[lw[1]]) or '')) or '') or (rtype == 'function' and (replace(...) or '') or replace))
	end

	if type(search) == 'table' then
		for i, v in ipairs(search) do
			lw = {i, v}
			out, total = out:gsub(v, rep, limit)
			limit = limit - total
		end
	else
		out = out:gsub(search, rep, limit)
	end

	return out, r
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

function str:replace_line(line, newline)
	local extra = 0
  local a, b = 1, 1
  local i = 0
  for d, e in self:gmatch '()[^\n]*()' do
    i = i + 1
    a, b = d, e
    if i == line then break end
  end
  extra = line - i
  return string.format('%s%s%s%s', self:sub(1, a - 1), string.rep('\n', extra), newline, self:sub(b))
end
