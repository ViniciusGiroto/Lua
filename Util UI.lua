-- Created by Squalleze --
UtilUI = {}

ui.addUtilUI = function(I, Ty, Ti, T, P, X, Y, W, H, F, Ta)
	if Ty == 1 then
		ui.addTextArea(I, '<br>' .. T, P, X, Y + 7, W, H - 7, 0x324650, 0x27373F, 1, F)
		ui.addTextArea(I + 1, '', P, X, Y, W, 12, 0x27373F, 0x27373F, 1, F)
		ui.addTextArea(I + 2, '<b><font letterSpacing="-1" size="16"><v>' .. Ti .. '</font>', P, X, Y - 4, W, nil, 0x324650, 0x27373F, 0, F)
		ui.addTextArea(I + 3, '', P, W + X - 9, Y + 3, 7, 7, 0x009D9D, 0x009D9D, 1, F)
		ui.addTextArea(I + 4, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. I + 4 .. '">×</a></font>', P, W + X - 14, Y - 5, nil, nil, nil, nil, 0, F)
	elseif Ty == 2 then
		UtilUI[P] = {}
		for i = 1, #Ta do
			ui.addTextArea(I + i, string.format('&nbsp;&nbsp;<a href="event:%s %s"><font size="12">%s</font></a>', P, i, Ta[i]), P, X + W, Y + 10 + (i - 1) * 30, nil, nil, 0x324650, 0x27373F, 1, F)
		end
		ui.addTextArea(I + #Ta + 1, '<br>' .. T[1], P, X, Y + 7, W, H - 7, 0x324650, 0x27373F, 1, F)
		ui.addTextArea(I + #Ta + 2, '', P, X, Y, W, 12, 0x27373F, 0x27373F, 1, F)
		ui.addTextArea(I + #Ta + 3, '<b><font letterSpacing="-1" size="16"><v>' .. Ti[1] .. '</font>', P, X, Y - 4, W, nil, 0x324650, 0x27373F, 0, F)
		ui.addTextArea(I + #Ta + 4, '', P, W + X - 9, Y + 3, 7, 7, 0x009D9D, 0x009D9D, 1, F)
		ui.addTextArea(I + #Ta + 5, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. I + #Ta + 5 .. '">×</a></font>', P, W + X - 14, Y - 5, nil, nil, nil, nil, 0, F)
		UtilUI[P].id, UtilUI[P].title, UtilUI[P].text, UtilUI[P].tabs = I, Ti, T, Ta
	end
end

ui.updateUtilUI = function(I, Ty, Ti, T, P, S, Ta)
	if Ty == 1 then
		ui.updateTextArea(I, '<br>' .. T, P)
		ui.updateTextArea(I + 1, '', P)
		ui.updateTextArea(I + 2, '<b><font letterSpacing="-1" size="16"><v>' .. Ti .. '</font>', P)
		ui.updateTextArea(I + 3, '', P)
		ui.updateTextArea(I + 4, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. I + 4 .. '">×</a></font>', P)
	elseif Ty == 2 then
		for i = 1, #Ta do
			ui.updateTextArea(I + i, string.format('&nbsp;&nbsp;<a href="event:%s %s"><font size="12">%s</font></a>', P, i, Ta[i]), P)
		end
		ui.updateTextArea(I + #Ta + 1, '<br>' .. T[S], P)
		ui.updateTextArea(I + #Ta + 2, '', P)
		ui.updateTextArea(I + #Ta + 3, '<b><font letterSpacing="-1" size="16"><v>' .. Ti[S] .. '</font>', P)
		ui.updateTextArea(I + #Ta + 4, '', P)
		ui.updateTextArea(I + #Ta + 5, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. I + #Ta + 5 .. '">×</a></font>', P)
		UtilUI[P].id, UtilUI[P].title, UtilUI[P].text, UtilUI[P].tabs = I, Ti, T, Ta
	end
end

ui.removeUtilUI = function(I, T, P)
	for i = I, T do
		ui.removeTextArea(i, P)
	end
	UtilUI[P] = {}
end

eventTextAreaCallback = function(I, P, C)
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = A[1]

	if C == 'Close' then
		ui.removeUtilUI(tonumber(A[2]), tonumber(A[3]), P)
	elseif C == P then
		local I = tonumber(A[2])
		local Util = UtilUI[P]
		print(I)
		ui.updateUtilUI(1, 2, Util.title, Util.text, P, I, Util.tabs)
	end
end
