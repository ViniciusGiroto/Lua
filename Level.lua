-- Created by Squalleze
lvl = {}
lvl.lvl = function(num)
	local last, total = 30, 0
	for i = 1, ((num >= 1 and num <= 200) and num or 200) do
		last = last + (i - 1) * ((i >= 1 and i <= 30) and 2 or (i <= 60 and 10 or (i <= 200 and 15 or 15)))
		total = total + last
	end
	
	return last, total
end

lvl.exp = function(xp)
	local last, total, level, remain, need = 30, 0, 0, 0, 0
	for i = 1, 200 do
		local nlast = last + (i - 1) * ((i >= 1 and i <= 30) and 2 or (i <= 60 and 10 or (i <= 200 and 15 or 15)))
		local ntotal = total + nlast
		
		if ntotal >= xp then
			level, remain, need = i - 1, xp - total, ntotal - xp
			break
		else
			last, total = nlast, ntotal
		end
	end
	
	return level, remain, need
end
