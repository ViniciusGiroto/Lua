-- Created by Vinicius Giroto
math.inpolygon = function(x, y, ...)
	local offset, inside = {...}, false
	local j = #offset

	if j < 3 then
		error("A polygon have more than " .. j .. " point(s).", 0)
	end

	for i = 1, #offset do
		if (offset[i][2] < y and offset[j][2] >= y) or (offset[j][2] < y and offset[i][2] >= y) then
			if offset[i][1] + (y - offset[i][2]) / (offset[j][2] - offset[i][2]) * (offset[j][1] - offset[i][1]) < x then
				inside = not inside
			end
		end
		j = i
	end

	return inside
end

math.format = function(number, decimals, decPoint, thousSep)
	number, decimals, decPoint, thousSep = {math.modf(number or 0)}, decimals or 0, decPoint or '.', thousSep or ',' 
	local int, decimal, out = tostring(number[1]):reverse(), tostring(number[2]):match('%.(%d+)'), ''
	
	for i = 1, #int do
		out = out .. int:sub(i, i) .. ((i % 3 == 0 and i ~= #int) and thousSep or '')
	end

	return out:reverse() .. (decimals > 0 and (decPoint .. (decimal .. ('0'):rep(decimals - #decimal > 0 and decimals - #decimal or 0)):sub(1, decimals)) or '');
end

math.round = function(number, precision, mode)
	local a, b = math.modf(number * 10 ^ (precision or 0))
	return ((((mode or 0) == 0 and b >= .5) or mode == 1) and math.ceil or math.floor)(number * 10 ^ (precision or 0)) / 10 ^ (precision or 0);
end
