T = {
	['EN'] = {
		['A'] = {
			'<j>You used a spirit. Remainder: <v>%s',
			'<j>You used all spirits.',
			'<r>You used the maximum number of spirits per round.',
			'<ch>The shaman used the maximum number of spirits per round.'
		},
		['H'] = {
			['Ta'] = {
				'How to play',
				'SiD\'s',
				'Commands',
				'Credits',
				'Updates'
			},
			['Te'] = {
				'To play you will <b>only</b> need to use de the arrows.<br>You can spawn arrows in every place in map. This arrows will spawn grounds to complete the map.<br>If you use normal mode You can spawn <b>two</b> grounds, if you use hard and divine mode you can spawn <b>one</b> ground and if you use divine, you have only 10 arrows.<br>Normal arrow: Grounds<br>Invisible arrow: Skills<br>You can use <b>two</b> spirits, if you use more or if you spawn shaman objects, you will die!<br>You can buy other grounds like grass, sand, ice, etc and buy skills like resize, box and extra spirits in the shop. To buy, you need get SiD\'s.',
				'You will get SiD\'s when you save the mices.<br>In <v>normal <n>mode 1 saved mice = 1 SiD<br>In <j>hard <n>mode 1 saved mice = 2 SiD\'s<br>In <r>divine <n>mode 1 saved mice = 3 SiD\'s',
				'!s open the shop<br>!p open your profile<br>!p [Name] open the profile of other person<br>!h or !help open the help text',
				'Squalleze: remake the minigame.<br>Mrorko: gave the idea to remake the minigame.<br><br>Note: this is a remake of Deux minigame developed by: Holypoop and Holz',
				'1.0 Minigame finished'
			},
			['Ti'] = {
				'How to play',
				'How to get SiD\'s',
				'Commands',
				'Credits',
				'Updates'
			}
		},
		['P'] = 'Saves:<br>&nbsp;<bl>» Normal : <v>%s<br>&nbsp;<bl>» Hard: <j>%s<br>&nbsp;<bl>» Divine: <r>%s<br><br><n>Rounds:<br>&nbsp;<bl>» Played: <v>%s<br>&nbsp;<bl>» Completed: <v>%s',
		['S'] = {
			['G'] = {'Wood', 'Ice', 'Trampoline', 'Lava', 'Chocolate', 'Earth', 'Grass', 'Sand', 'Cloud', 'Water', 'Stone', 'Snow', 'Rectangle', 'Circle', 'Invisible', 'Web'},
			['S'] = {'Spirit', 'Resize', 'Box', 'Portal'},
			['T'] = {
				'<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s %s">Free</a>',
				'<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s %s">Buy %s</a>',
				'<br>&nbsp;<bl>» %s : <v><a href="event:Equip %s %s">Equip</a>',
				'<br>&nbsp;<bl>» %s : <v>Equiped',
				'<br>&nbsp;<bl>» %s : <v>Equiped - <a href="event:Edit">Edit</a>',
				'<br>&nbsp;<bl>» %s : <v><a href="event:Unequip %s">Unequip</a>',
				'<j>You get a spirit. Now you have <v>%s <j>spirits!',
				'Enter with ground color:<br>Example : <font color="#FADE55">#FADE55</font>',
				'Ground color altered to <font color="%s">%s</font>',
				'<rose>Alert: <n>This code is invalid!'
			},
			['Ta'] = {
				'Grounds',
				'Skills'
			},
			['Te'] = {
				'<n>SiD\'s: <v>%s<br>%s',
				'<n>SiD\'s: <v>%s<br>%s'
			},
			['Ti'] = {
				'Grounds',
				'Skills'
			}
		}
	}
}
S = {
	G = {
		{0, 0, 0, {0.3, 0.2}},
		{1, 175, 0, {0, 0.2}},
		{2, 0, 4, {0, 1.2}},
		{3, 0, 4, {0, 20}},
		{4, 1000, 0, {20, 0.2}},
		{5, 100, 0, {0.3, 0.2}},
		{6, 150, 0, {0.3, 0.2}},
		{7, 75, 0, {0.1, 0.2}},
		{8, 0, 4, {0.3, 0.2}},
		{9, 0, 4, {0.3, 0.2}},
		{10, 250, 0, {0.3, 0}},
		{11, 0, 4, {0.05, 0.1}},
		{12, 550, 0, {0.3, 0.2}},
		{13, 0, 4, {0.3, 0.2}},
		{14, 0, 4, {0.3, 0.2}},
		{15, 0, 4, {0.3, 0.2}}
	},
	S = {
		{1, 100, 0},
		{2, 375, 0},
		{3, 350, 0},
		{4, 0, 4}
	}
}
M = {'@4685402', '@4664013', '@4659007', '@4590114', '@4590098', '@4590090', '@4590082', '@4434919', '@4082213', '@2969962', '@2873573', '@2462332', '@2454924', '@2449267', '@1870464', '@2396838', '@4007168', '@1124454', '@452653', '@2113338', '@2199656', '@3820670', '@159709', '@3147428', '@3051156', '@172357', '@3617459', '@413242', '@2932610', '@317521', '@155582', '@460646', '@156966', '@200017', '@489046', '@584430', '@1193841', '@187059', '@169710', '@458677', '@188821', '@308787', '@474113', '@3049560', '@1233889', '@1233889', '@249255', '@436128', '@382841', '@219032', '@1641473', '@497021', '@364544', '@504567', '@504166', '@2703778', '@2406202', '@355562', '@166138', '@426398', '@442098', '@776051', '@923878', '@1937184', '@437313', '@416324', '@528954', '@392150', '@421185', '@484159', '@470160', '@398828', '@273581', '@182878', '@4652489', '@4679376', '@4666553', '@5594828', '@5594833', '@5596658', '@5597191', '@4474208', '@5642192', '@5642237', '@5642338', '@4861317'}
Pi = {}
UtilUI = {}
Version, Inf, Pn, Ui = 1.81, 99999 ^ 9, 1, {}
Ps = {['Squalleze'] = {5, Inf}, ['Mrorko'] = {5, Inf}, ['Ninguem'] = {5, Inf}}
Pc = {0x18243A, 0x18243A, 0x2F7FCC, 0xBABD2F, 0xEB1D51}
local Ap, Nm, Gp, Pt = 0, M[math.random(#M)], {}, {0, 0, 0}

--## Events ##--
--### C
eventChatCommand = function(P, C)
	local Pp, Lp = Pi[P], tfm.get.room.playerList[P]
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = string.lower(A[1])

	if Pp.Uo[1] == C then
		_Ru(Pp.Uo[2], Pp.Uo[3], P)
	elseif not Pp.Uo[1] then
		if not A[2] then
			if C == 'p' then
				_Au(1, 1, C, P, string.format(_Tt()['P'], Pp.Ps[2][1], Pp.Ps[2][2], Pp.Ps[2][3], Pp.Ps[1][1], Pp.Ps[1][2]), P, 290, 100, 220, 200, true)
			elseif C == 's' then
				_Au(1, 2, C, _Tt()['S']['Ti'], {string.format(_Tt()['S']['Te'][1], Pp.SiDs, _Si(P, 1)), string.format(_Tt()['S']['Te'][2], Pp.SiDs, _Si(P, 2))}, P, 250, 75, 300, 250, true, _Tt()['S']['Ta'])
			elseif C == 'h' or C == 'help' then
				_Au(1, 2, C, _Tt()['H']['Ti'], _Tt()['H']['Te'], P, 250, 75, 300, 250, true, _Tt()['H']['Ta'])
			end
		elseif A[2] then
			if C == 'p' and _Pe(A[2]) then
				local F = _Nd(A[2])
				_Au(1, 1, C, P, string.format(_Tt()['P'], Pi[F].Ps[2][1], Pi[F].Ps[2][2], Pi[F].Ps[2][3], Pi[F].Ps[1][1], Pi[F].Ps[1][2]), P, 290, 100, 220, 200, true)
			end
		end
	end
	if A[2] then
		if C == 'np' and _Ec(P, 3, '>=') and _Mu(A[2]) then
			pcall(tfm.exec.newGame, A[2])
		elseif C == 'npp' and _Ec(P, 3, '>=') and _Mu(A[2]) then
			Nm = A[2]
		elseif C == 'adm' and _Ec(P, 5, '>=') and _Pe(A[2]) and _Ec(A[2], 5, '<') then
			Pi[_Nd(A[2])].Pl = 4
		elseif C == 'mc' and _Ec(P, 5, '>=') and _Pe(A[2]) and _Ec(A[2], 5, '<') then
			Pi[_Nd(A[2])].Pl = 3
		elseif C == 'dev' and _Ec(P, 5, '>=') and _Pe(A[2]) and _Ec(A[2], 5, '<') then
			Pi[_Nd(A[2])].Pl = 2
		elseif C == 'tran' and _Ec(P, 5, '>=') and _Pe(A[2]) and _Ec(A[2], 5, '<') then
			Pi[_Nd(A[2])].Pl = 1
		elseif C == 'ply' and _Ec(P, 5, '>=') and _Pe(A[2]) and _Ec(A[2], 5, '<') then
			Pi[_Nd(A[2])].Pl = 0
		end
		if A[3] then
			if C == 'sids' and tonumber(A[3]) and _Ec(P, 5, '>=') and _Pe(A[2]) then
				local P = _Nd(A[2])
				print(P)
				Pi[P].SiDs = Pi[P].SiDs + tonumber(A[3])
			end
		end
	else
		if C == 'np' and _Ec(P, 3, '>=') then
			pcall(tfm.exec.newGame, Nm)
		end
	end
end

--### K
eventKeyboard = function(P, K, D, X, Y)
	if K == string.byte('I') then
		eventChatCommand(P, 's')
	elseif K == string.byte('P') then
		eventChatCommand(P, 'p')
	elseif K == string.byte('H') then
		eventChatCommand(P, 'h')
	elseif K == 17 then
		Pi[P].Ct = D
		if Pt[4] and Pt[3] ~= 2 then
			if D and Pi[P].S[4] then
				Pt[2] = tfm.exec.addImage('H3Yj13D.png', '#' .. Pt[1], - 60.5, - 60.5, P)
			elseif not D then
				tfm.exec.removeImage(Pt[2])
			end
		end
	end
end

--### L
eventLoop = function(C, R)
	if R < 1 then
		_Im(R)
	end
	--_Im(Ap)
end

--### M
eventMouse = function(P, X, Y)
	local Ci = _Is(X, Y)
	if Pi[P].Ct and tfm.get.room.playerList[P].isShaman and Pi[P].S[4] then
		if Ci < 1 then
			if Pt[3] < 1 then
				Pt = {tfm.exec.addShamanObject(26, X, Y, 0, 0, 0, false), tfm.exec.addImage('H3Yj13D.png', '#' .. Pt[1], - 60.5, - 60.5, P), 1, {X, Y}}
			elseif Pt[3] < 2 then
				if (Pt[4][1] - X) ^ 2 + (Pt[4][2] - Y) ^ 2 <= (120 ^ 2) then
					tfm.exec.addShamanObject(27, X, Y, 0, 0, 0, false)
					tfm.exec.removeImage(Pt[2])
					Pt[3] = 2
				end
			end
		end
	end
end

--### N
eventNewGame = function()
	Ap, Gp, Pt = 0, {}, {0, 0, 0}
	_Sm()
	_Xc(tfm.get.room.xmlMapInfo.xml)
	for i, i_ in pairs(tfm.get.room.playerList) do
		Ap = Ap + 1
		if Pi[i].Pl > 0 then
			tfm.exec.setNameColor(i, Pc[Pi[i].Pl])
		end
		if i_.isShaman then
			Pi[i].Gm, Pi[i].Ps[1][1], Pi[i].Hs[2], Pi[i].Ms = i_.inHardMode + 1, Pi[i].Ps[1][1] + 1, 0, Pi[i].S
		end
	end
end

eventNewPlayer = function(P)
	local Ps_ = Ps[P] or {0, 0}
	if not Pi[P] then
		Pi[P] = {
			Ct = false,
			G = {[0] = true},
			Gc = 3294800,
			Gi = Pn,
			Gm = 0,
			Hs = {2, 0},
			Pl = Ps_[1],
			Pn = Pn,
			Ps = {
				{0, 0},
				{0, 0, 0}
			},
			S = {},
			Ms = {},
			SiDs = Ps_[2],
			Uo = {nil, 0, 0}
		}
		Pn = Pn + 1
	end
	for K, K_ in pairs({string.byte('I'), string.byte('P'), string.byte('H'), 17}) do
		tfm.exec.bindKeyboard(P, K_, true, true)
	end
	tfm.exec.bindKeyboard(P, 17, false, true)
	system.bindMouse(P, true)
end

--### P
eventPlayerDied = function(P)
	Ap = Ap - 1
	local Sm = 0
	for P, P_ in pairs(tfm.get.room.playerList) do
		if P_.isShaman and not P_.isDead then 
			Sm = Sm + 1
		end
	end
	if Sm < 1 then
		tfm.exec.setGameTime(5)
	end
	_Im(Ap)
end

eventPlayerWon = function(P)
	Ap = Ap - 1
	if not tfm.get.room.playerList[P].isShaman then
		for i, i_ in pairs(tfm.get.room.playerList) do
			if i_.isShaman then
				for j = 1, Pi[i].Gm do
					Pi[i].Ps[2][j] = Pi[i].Ps[2][j] + 1
				end
				Pi[i].SiDs = Pi[i].SiDs + Pi[i].Gm
			end
		end
	else
		Pi[P].Ps[1][2] = Pi[P].Ps[1][2] + 1
	end
	_Im(Ap)
end

eventPopupAnswer = function(I, P, A)
	if I == 1 then
		if A:len() == 7 and A:sub(1, 1) == '#' and tonumber('0x' .. A:sub(2)) then
			Pi[P].Gc = tonumber('0x' .. A:sub(2)) or Pi[P].Gc
			tfm.exec.chatMessage(string.format(_Tt()['S']['T'][9], A, A), P)
		else
			tfm.exec.chatMessage(_Tt()['S']['T'][10], P)
		end
	end
end

--### S
eventSummoningEnd = function(P, T, X, Y, A, Xs, Ys, O)
	if T == 0 then
		local G = _Gp(P, O.ghost)
		local Ci = _Is(X, Y)
		if Pi[P].Gm < 2 then
			Pi[P].Gi = - Pi[P].Gi
		end
		if Ci < 2 then
			tfm.exec.addPhysicObject(Pi[P].Gi, X, Y, {type = G[1][1], width = G['W'], height = G['H'], angle = A, friction = G[1][4][1], restitution = G[1][4][2], color = Pi[P].Gc})
		elseif Ci == 2 then
			tfm.exec.addPhysicObject(Pi[P].Gi, X, Y, {type = G[1][1], width = G['W'] * .25, height = G['H'] * .25, angle = A, friction = G[1][4][1], restitution = G[1][4][2], color = Pi[P].Gc})
		end
	elseif T == 24 then
		Pi[P].Hs[2] = Pi[P].Hs[2] + 1
		if Pi[P].Hs[2] < Pi[P].Hs[1] then
			tfm.exec.chatMessage(string.format(_Tt()['A'][1], Pi[P].Hs[1] - Pi[P].Hs[2]), P);
		elseif Pi[P].Hs[2] == Pi[P].Hs[1] then
			tfm.exec.chatMessage(string.format(_Tt()['A'][2]), P);
		else
			tfm.exec.killPlayer(P);
			tfm.exec.chatMessage(_Tt()['A'][3], P);
			tfm.exec.chatMessage(_Tt()['A'][4]);
		end
	else
		tfm.exec.killPlayer(P)
		tfm.exec.removeObject(O.id)
	end
end

--### T
eventTextAreaCallback = function(I, P, C)
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = A[1]

	if C == 'Close' then
		_Ru(tonumber(A[2]), tonumber(A[3]), P)
	elseif C == P then
		local I = tonumber(A[2])
		_Uu(1, 2, Ui[P].title, Ui[P].text, P, I, Ui[P].tabs)
	elseif C == 'Buy' then
		local I = tonumber(A[3])
		if A[2] == 'G' then
			for i, i_ in pairs(S.G) do
				if S.G[i][1] == I then
					if Pi[P].G[I] == nil and Pi[P].Pl >= S.G[i][3] then
						if Pi[P].SiDs >= S.G[i][2] then
							Pi[P].SiDs = Pi[P].SiDs - S.G[i][2]
							for j, j_ in pairs(Pi[P].G) do
								Pi[P].G[j] = false
							end
							Pi[P].G[I] = true
							_Uu(1, 2, _Tt()['S']['Ti'], {string.format(_Tt()['S']['Te'][1], Pi[P].SiDs, _Si(P, 1)), string.format(_Tt()['S']['Te'][2], Pi[P].SiDs, _Si(P, 2))}, P, 1, _Tt()['S']['Ta'])
						end
					end
					break
				end
			end
		elseif A[2] == 'S' then
			if S.S[I] and Pi[P].S[I] == nil and Pi[P].Pl >= S.S[I][3] then
				if I == 1 then
					if Pi[P].SiDs >= ((Pi[P].Hs[1] + 1) * S.S[I][1]) then
						Pi[P].Hs[1] = Pi[P].Hs[1] + 1
						tfm.exec.chatMessage(string.format(_Tt()['S']['T'][7], Pi[P].Hs[1]), P);
					end
				else
					if Pi[P].SiDs >= S.S[I][2] then
						Pi[P].SiDs = Pi[P].SiDs - S.S[I][2]
						for i, i_ in pairs(Pi[P].S) do
							Pi[P].S[i] = false
						end
						Pi[P].S[I] = true
					end
				end
				_Uu(1, 2, _Tt()['S']['Ti'], {string.format(_Tt()['S']['Te'][1], Pi[P].SiDs, _Si(P, 1)), string.format(_Tt()['S']['Te'][2], Pi[P].SiDs, _Si(P, 2))}, P, 2, _Tt()['S']['Ta'])
			end
		end
	elseif C == 'Equip' then
		local T, I = tonumber(A[2]), tonumber(A[3])
		if T == 1 then
			for i, i_ in pairs(Pi[P].G) do
				Pi[P].G[i] = false
			end
			Pi[P].G[I] = true
		elseif T == 2 then
			for i, i_ in pairs(Pi[P].S) do
				Pi[P].S[i] = false
			end
			Pi[P].S[I] = true
		end
		_Uu(1, 2, _Tt()['S']['Ti'], {string.format(_Tt()['S']['Te'][1], Pi[P].SiDs, _Si(P, 1)), string.format(_Tt()['S']['Te'][2], Pi[P].SiDs, _Si(P, 2))}, P, T, _Tt()['S']['Ta'])
	elseif C == 'Unequip' then
		local S = tonumber(A[2])
		Pi[P].S[S] = false
		_Uu(1, 2, _Tt()['S']['Ti'], {string.format(_Tt()['S']['Te'][1], Pi[P].SiDs, _Si(P, 1)), string.format(_Tt()['S']['Te'][2], Pi[P].SiDs, _Si(P, 2))}, P, 2, _Tt()['S']['Ta'])
	elseif C == 'Edit' then
		ui.addPopup(1, 2, _Tt()['S']['T'][8], P, 300, 150, 200, true)
	end
end

--## Script Functions ##--
--### A
_Au = function(I, Ty, N, Ti, T, P, X, Y, W, H, F, Ta)
	local At = ui.addTextArea
	if Ty == 1 then
		At(I, '<br>' .. T, P, X, Y + 7, W, H - 7, 0x324650, 0x27373F, 1, F)
		At(I + 1, '', P, X, Y, W, 12, 0x27373F, 0x27373F, 1, F)
		At(I + 2, '<b><font size="16"><v>' .. Ti .. '</font>', P, X, Y - 4, W, nil, 0x324650, 0x27373F, 0, F)
		At(I + 3, '', P, W + X - 9, Y + 3, 7, 7, 0x009D9D, 0x009D9D, 1, F)
		At(I + 4, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' 4">×</a></font>', P, W + X - 14, Y - 5, nil, nil, nil, nil, 0, F)
		Pi[P].Uo = {N, I, 4}
	elseif Ty == 2 then
		Ui[P] = {}
		for i = 1, #Ta do
			At(I + i, string.format('&nbsp;&nbsp;<a href="event:%s %s"><font size="12">%s</font></a>', P, i, Ta[i]), P, X + W, Y + 10 + (i - 1) * 30, nil, nil, 0x324650, 0x27373F, 1, F)
		end
		At(I + #Ta + 1, '<br>' .. T[1], P, X, Y + 7, W, H - 7, 0x324650, 0x27373F, 1, F)
		At(I + #Ta + 2, '', P, X, Y, W, 12, 0x27373F, 0x27373F, 1, F)
		At(I + #Ta + 3, '<b><font size="16"><v>' .. Ti[1] .. '</font>', P, X, Y - 4, W, nil, 0x324650, 0x27373F, 0, F)
		At(I + #Ta + 4, '', P, W + X - 9, Y + 3, 7, 7, 0x009D9D, 0x009D9D, 1, F)
		At(I + #Ta + 5, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. #Ta + 5 .. '">×</a></font>', P, W + X - 14, Y - 5, nil, nil, nil, nil, 0, F)
		Ui[P].id, Ui[P].title, Ui[P].text, Ui[P].tabs, Pi[P].Uo = I, Ti, T, Ta, {N, I, #Ta + 5}
	end
end

--### E
_Ec = function(Vo, Vt, F)
	if not tonumber(Vo) then
		Vo = Pi[_Nd(Vo)].Pl
	end
	local C = {['='] = Vo == Vt, ['~'] = Vo ~= Vt, ['>'] = Vo > Vt, ['<'] = Vo < Vt, ['>='] = Vo >= Vt, ['<='] = Vo <= Vt}
	return C[F]
end

--### G
_Gp = function(P, G)
	local A = {['H'] = 10, ['W'] = 100}
	for i, i_ in pairs(Pi[P].G) do
		if i_ then
			for j, j_ in pairs(S.G) do
				if j_[1] == i then
					A[1] = j_
					break
				end
			end
			break
		end
	end
	if G then
		if Pi[P].S[2] then
			A['W'] = A['W'] * 1.5
		elseif Pi[P].S[3] then
			A['W'], A['H'] = A['W'] * .3, A['H'] * 3
		end
	end
	return A
end

--### I
_Im = function(A)
	if A < 1 then
		tfm.exec.newGame(Nm)
	end
end

_Is = function(X, Y)
	local C, Is, Hc = nil, false, 0
	for i, i_ in pairs(Gp) do
		if i_.T ~= '13' then
			local Pr = {}
			for j in string.gmatch(i_.P, '[^,]+') do
				table.insert(Pr, tonumber(j))
			end
			local An = (Pr[5] / 180) * math.pi
			local Di, Si = i_.L / 2, i_.H / 2
			local P1, P2 = math.cos(An) * Di, math.sin(An) * Di
			local Ps = {X = {i_.X + P1, i_.X - P1}, Y = {i_.Y + P2, i_.Y - P2}}
			local An = ((Pr[5] + 90) / 180) * math.pi
			local P1, P2 = math.cos(An) * Si, math.sin(An) * Si
			local Px, Py = {Ps.X[1] + P1, Ps.X[1] - P1, Ps.X[2] - P1, Ps.X[2] + P1}, {Ps.Y[1] + P2, Ps.Y[1] - P2, Ps.Y[2] - P2, Ps.Y[2] + P2}
			local j = 4
			local Ip = false
			
			for i = 1, 4 do
				if (Py[i] < Y and Py[j] >= Y) or (Py[j] < Y and Py[i] >= Y) then
					if Px[i] + (Y - Py[i]) / (Py[j] - Py[i]) * (Px[j] - Px[i]) < X then
						Ip = not Ip
					end
				end
				j = i
			end
			
			if Ip then
				C, Is = i_.o, Ip
				break
			end
		elseif i_.T == '13' then
			if (i_.X - X) ^ 2 + (i_.Y - Y) ^ 2 <= (i_.L ^ 2) then
				Is, C = true, i_.o
				break
			end
		end
	end

	if Is then
		if C == '222222' then
			Hc = 3
		elseif C == '999999' then
			Hc = 2
		else
			Hc = 1
		end
	end

	return Hc
end

--### M
_Mu = function(M)
	if M:sub(1, 1) == '@' then
		if tonumber(M:sub(2)) then
			return true
		end
	end
end

--### N
_Nd = function(A)
	local S = 1
	if string.sub(A, 1, 1) == '+' then
		S = 2
	end
	local B = A:sub(1, S):upper() .. A:sub(S + 1):lower()
	return B
end

--### P
_Pe = function(P)
	if Pi[_Nd(P)] then
		return true
	end
end

--### R
_Ru = function(I, T, P)
	for i = I, I + T do
		ui.removeTextArea(i, P)
	end
	Ui[P] = {}
	Pi[P].Uo = {nil, 0, 0}
end

--### S
_Si = function(P, C)
	local T = ''
	if C == 1 then
		table.sort(S.G, function (k1, k2) return k1[2] < k2[2] end)
		table.foreachi(S.G,
		function (k, v)
			local i, n = v[1], _Tt()['S']['G'][v[1] + 1]
			if Pi[P].Pl >= v[3] then
				if Pi[P].G[i] == false then
					T = T .. string.format(_Tt()['S']['T'][3], n, 1, i)
				elseif Pi[P].G[i] and i ~= 12 and i ~= 13 then
					T = T .. string.format(_Tt()['S']['T'][4], n)
				elseif Pi[P].G[i] and (i == 12 or i == 13) then
					T = T .. string.format(_Tt()['S']['T'][5], n)
				elseif Pi[P].G[i] == nil and v[2] > 0 then
					T = T .. string.format(_Tt()['S']['T'][2], n, 'G', i, v[2])
				elseif Pi[P].G[i] == nil and v[2] < 1 then
					T = T .. string.format(_Tt()['S']['T'][1], n, 'G', i)
				end
			end
		end
		)
	elseif C == 2 then
		table.sort(S.S, function (k1, k2) return k1[1] < k2[1] end)
		table.foreachi(S.S,
		function (k, v)
			local i, n = v[1], _Tt()['S']['S'][v[1]]
			if Pi[P].Pl >= v[3] then
				if Pi[P].S[i] == false then
					T = T .. string.format(_Tt()['S']['T'][3], n, 2, i)
				elseif Pi[P].S[i] then
					T = T .. string.format(_Tt()['S']['T'][6], n, i)
				elseif Pi[P].S[i] == nil and v[2] > 0 and v[1] ~= 1 then
					T = T .. string.format(_Tt()['S']['T'][2], n, 'S', i, v[2])
				elseif Pi[P].S[i] == nil and v[2] < 1 and v[1] ~= 1 then
					T = T .. string.format(_Tt()['S']['T'][1], n, 'S', i)
				elseif v[1] == 1 then
					T = T .. string.format(_Tt()['S']['T'][2], n, 'S', i, ((Pi[P].Hs[1] + 1) * v[2]))
				end
			end
		end
		)
	end
	return T
end

_Sm = function()
	repeat
		Nm = M[math.random(#M)]
	until Nm ~= tfm.get.room.currentMap
end

--### T
_Tt = function()
	local A = tfm.get.room.community
	return T[A] or T['EN']
end

--### U
_Uu = function(I, Ty, Ti, T, P, S, Ta)
	local Ut = ui.updateTextArea
	if Ty == 1 then
		Ut(I, '<br>' .. T, P)
		Ut(I + 1, '', P)
		Ut(I + 2, '<b><font size="16"><v>' .. Ti .. '</font>', P)
		Ut(I + 3, '', P)
		Ut(I + 4, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' 4">×</a></font>', P)
		Pi[P].Uo = {Pi[P].Uo[1], I, 4}
	elseif Ty == 2 then
		for i = 1, #Ta do
			Ut(I + i, string.format('&nbsp;&nbsp;<a href="event:%s %s"><font size="12">%s</font></a>', P, i, Ta[i]), P)
		end
		Ut(I + #Ta + 1, '<br>' .. T[S], P)
		Ut(I + #Ta + 2, '', P)
		Ut(I + #Ta + 3, '<b><font size="16"><v>' .. Ti[S] .. '</font>', P)
		Ut(I + #Ta + 4, '', P)
		Ut(I + #Ta + 5, '<b><font color="#324650" size="16"><a href="event:Close ' .. I .. ' ' .. #Ta + 5 .. '">×</a></font>', P)
		Ui[P].id, Ui[P].title, Ui[P].text, Ui[P].tabs, Pi[P].Uo = I, Ti, T, Ta, {Pi[P].Uo[1], I, #Ta + 5}
	end
end

--### X
_Xc = function(X)
	local Fs = string.find(X, '<S>') + 2
	local Fe = string.find(X, '</S>') - 1
	local Gs = Fs

	_Cp = function(G)
		local P = {}
		for i, i_ in string.gmatch(G, '(%w+)="(.-)"') do
			P[i] = i_
		end
		return P
	end

	while Gs < Fe do
		if X:sub(Gs, Gs) == '<' then
			local Ge = string.find(X, '/>', Gs) + 1
			B = _Cp(string.sub(X, Gs, Ge + 1))
			table.insert(Gp, 1, B)
		end
		Gs = Gs + 1
	end
end

--## Start! ##--
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
debug.disableTimerLog(false)


for i, i_ in pairs({'p', 's', 'np', 'npp', 'adm', 'mc', 'dev', 'npp', 'ply', 'sids', 'h', 'help'}) do
	system.disableChatCommandDisplay(i_, true)
end

for i in pairs(tfm.get.room.playerList) do
	eventNewPlayer(i)
end
_Im(Ap)
