Maps = {'@4685402', '@4664013', '@4659007', '@4590128', '@4590114', '@4590098', '@4590090', '@4590082', '@4434919', '@4082213', '@2969962', '@2873573', '@2462332', '@2454924', '@2449267', '@1870464', '@2396838', '@4007168', '@1124454', '@452653', '@2113338', '@2199656', '@3820670', '@159709', '@3147428', '@3051156', '@172357', '@3617459', '@413242', '@2932610', '@317521', '@155582', '@460646', '@156966', '@200017', '@489046', '@584430', '@1193841', '@187059', '@169710', '@458677', '@188821', '@308787', '@474113', '@3049560', '@1233889', '@1233889', '@249255', '@436128', '@382841', '@219032', '@1641473', '@497021', '@364544', '@504567', '@504166', '@2703778', '@2406202', '@355562', '@166138', '@426398', '@442098', '@776051', '@923878', '@1937184', '@437313', '@416324', '@528954', '@392150', '@421185', '@484159', '@470160', '@398828', '@273581', '@182878', '@4652489', '@4679376', '@4666553'}
Shop = {
	Grounds = {
		['Wood'] = {0, 0, P = {0.3, 0.2}}, 
		['Sand'] = {75, 7, P = {0.1, 0.2}}, 
		['Earth'] = {100, 5, P = {0.3, 0.2}}, 
		['Grass'] = {150, 6, P = {0.3, 0.2}}, 
		['Ice'] = {175, 1, P = {0, 0.2}}, 
		['Stone'] = {250, 10, P = {0.3, 0}}, 
		['Colorful'] = {550, 12, P = {0.3, 0.2}}, 
		['Chocolate'] = {1000, 4, P = {20, 0.2}}
	},
	AdmShop = {
		['Web'] = {0, 15, P = {0.3, 0.2}}, 
		['Wather'] = {0, 9, P = {0.3, 0.2}}, 
		['Trampoline'] = {0, 2, P = {0, 1.2}}, 
		['Lava'] = {0, 3, P = {0, 20}}, 
		['Cloud'] = {0, 8, P = {0.3, 0.2}}, 
		['Snow'] = {0, 11, P = {0.05, 0.1}}, 
		['Circle'] = {0, 13, P = {0.3, 0.2}}
	},
	Skills = {['Resize'] = {375}, 
		['Box'] = {350}, 
		['Spirit'] = {100, 1}
	}
}
PDB = {}
PS = {['Squalleze'] = 5, ['Mrorko'] = 5, ['Ninguem'] = 99999 ^ 9}
PSC = {['Squalleze'] = 99999 ^ 9, ['Mrorko'] = 99999 ^ 9, ['Ninguem'] = 99999 ^ 9}
isAlive, Ground, Sps, Np = 0, 0, 0, Maps[math.random(#Maps)]

tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
system.disableChatCommandDisplay('p', true)
system.disableChatCommandDisplay('s', true)
system.disableChatCommandDisplay('np', true)

ND = function(T)
	if string.sub(T, 1, 1) == '+' then
		local T = string.upper(string.sub(T, 1, 2)) .. string.lower(string.sub(T, 3))
		return T
	else
		local T = string.upper(string.sub(T, 1, 1)) .. string.lower(string.sub(T, 2))
		return T
	end
end

Grnd = function(P, S)
	if S == nil then
		local H = nil
		for G in pairs(PDB[P].Grounds) do
			if PDB[P].Grounds[G] == true then
				H = Shop.Grounds[G] or Shop.AdmShop[G]
				break
			end
		end
		return H
	elseif S then
		if PDB[P].Skills['Resize'] then
			return 1.5
		else
			return 1
		end
	else
		return 1
	end
end

Shp = function(P, C)
	local T = ''
	if C == 1 then
		T = '<br><br><n>Grounds:'
		for G in pairs(Shop.Grounds) do
			if PDB[P].Grounds[G] == false then
				T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v><a href="event:Equip 1 ' .. G .. '">Equip</a>'
			elseif PDB[P].Grounds[G] and Shop.Grounds[G][2] ~= 12 then
				T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v>Equiped'
			elseif PDB[P].Grounds[G] and Shop.Grounds[G][2] == 12 then
				T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v>Equiped - <a href="event:Edit">Edit</a>'
			elseif PDB[P].Grounds[G] == nil then
				T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v><a href="event:Buy ' .. G .. '">Buy ' .. Shop.Grounds[G][1] .. '</a>'
			end
		end
		if PDB[P].PL >= 5 then
			for G in pairs(Shop.AdmShop) do
				if PDB[P].Grounds[G] == false then
					T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v><a href="event:Equip 1 ' .. G .. '">Equip</a>'
				elseif PDB[P].Grounds[G] and Shop.AdmShop[G][2] ~= 13 then
					T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v>Equiped'
				elseif PDB[P].Grounds[G] and Shop.AdmShop[G][2] == 13 then
					T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v>Equiped - <a href="event:Edit">Edit</a>'
				elseif PDB[P].Grounds[G] == nil then
					T = T .. '<br>&nbsp;<bl>» ' .. G .. ' : <v><a href="event:Buy ' .. G .. '">Free</a>'
				end
			end
		end
	elseif C == 2 then
		T = '<br><br><n>Skills:'
		for S in pairs(Shop.Skills) do
			if PDB[P].Skills[S] == false then
				T = T .. '<br>&nbsp;<bl>» ' .. S .. ' : <v><a href="event:Equip 2 ' .. S .. '">Equip</a>'
			elseif PDB[P].Skills[S] then
				T = T .. '<br>&nbsp;<bl>» ' .. S .. ' : <v><a href="event:Unequip ' .. S .. '">Unequip</a>'
			elseif PDB[P].Skills[S] == nil and S ~= 'Spirit' then
				T = T .. '<br>&nbsp;<bl>» ' .. S .. ' : <v><a href="event:Buy ' .. S .. '">Buy ' .. Shop.Skills[S][1] .. '</a>'
			elseif S == 'Spirit' then
				T = T .. '<br>&nbsp;<bl>» ' .. S .. ' : <v><a href="event:Buy ' .. S .. '">Buy ' .. ((PDB[P].SPs + 1) * Shop.Skills[S][1]) .. '</a>'
			end
		end
	end
	return T .. '<br><br><br>'
end

eventNewPlayer = function(P)
	if not PDB[P] then
		PDB[P] = {
			ID = #PDB + 1,
			PL = PS[P] or 0,
			HaM = tfm.get.room.playerList[P].inHardMode,
			O = false,
			SiDs = PSC[P] or 0,
			Colorful = 3294800,
			Grounds = {['Wood'] = true},
			Skills = {},
			SPs = 2,
			Profil = {
				Saves = {0, 0, 0},
				Rounds = {0, 0}
			}
		}
	end
	tfm.exec.bindKeyboard(P, 80, true, true)
	tfm.exec.bindKeyboard(P, 73, true, true)
end

eventNewGame = function()
	isAlive, Ground, Sps, Np = 0, 0, 0, Maps[math.random(#Maps)]
	for _ in pairs(tfm.get.room.playerList) do
		isAlive = isAlive + 1
		if tfm.get.room.playerList[_].isShaman then
			PDB[_].HaM = tfm.get.room.playerList[_].inHardMode
			PDB[_].Profil.Rounds[1] = PDB[_].Profil.Rounds[1] + 1
		end
	end
end

eventPlayerDied = function(P)
	isAlive = isAlive - 1
	if tfm.get.room.playerList[P].isShaman then
		tfm.exec.setGameTime(5)
	end
end

eventLoop = function(C, R)
	if isAlive == 0 or R <= 100 then
		tfm.exec.newGame(Np)
	end
end

eventPlayerWon = function(P)
	isAlive = isAlive - 1
	if not tfm.get.room.playerList[P].isShaman then
		for _ in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[_].isShaman then
				for __ = 1, PDB[_].HaM + 1 do
					PDB[_].Profil.Saves[__] = PDB[_].Profil.Saves[__] + 1
					PDB[_].SiDs = PDB[_].SiDs + (PDB[_].HaM + 1)
				end
				break
			end
		end
	else
		PDB[P].Profil.Rounds[2] = PDB[P].Profil.Rounds[2] + 1
	end
end

eventChatCommand = function(P, C)
	local R = PDB[P].PL
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = string.lower(A[1])

	if C == 'p' and not A[2] and not PDB[P].O then
		PDB[P].O = true
		ui.addTextArea(2, string.format('<font size="20">%s</font><br><br>Saves:<br><tab><bl>» Normal : <v>%s<br><tab><bl>» Hard: <j>%s<br><tab><bl>» Divine: <r>%s<br><br><n>Rounds:<br><tab><bl>» Played: <v>%s<br><tab><bl>» Completed: <v>%s', P, PDB[P].Profil.Saves[1], PDB[P].Profil.Saves[2], PDB[P].Profil.Saves[3], PDB[P].Profil.Rounds[1], PDB[P].Profil.Rounds[2]), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, '<a href="event:pc"><p align="center"><font size="12">Close</font></p></a>', P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif C == 'p' and A[2] and PDB[ND(A[2])] and not PDB[P].O then
		PDB[P].O = true
		ui.addTextArea(2, string.format('<font size="20">%s</font><br><br>Saves:<br><tab><bl>» Normal : <v>%s<br><tab><bl>» Hard: <j>%s<br><tab><bl>» Divine: <r>%s<br><br><n>Rounds:<br><tab><bl>» Played: <v>%s<br><tab><bl>» Completed: <v>%s', ND(A[2]), PDB[ND(A[2])].Profil.Saves[1], PDB[ND(A[2])].Profil.Saves[2], PDB[ND(A[2])].Profil.Saves[3], PDB[ND(A[2])].Profil.Rounds[1], PDB[ND(A[2])].Profil.Rounds[2]), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, '<a href="event:pc"><p align="center"><font size="12">Close</font></p></a>', P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif C == 's' and not PDB[P].O then
		PDB[P].O = true
		ui.addTextArea(4, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P, 510, 270, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(5, '&nbsp;&nbsp;<a href="event:Grounds"><font size="12">Grounds</font></a>', P, 510, 110, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(6, '&nbsp;&nbsp;<a href="event:Skills"><font size="12">Skills</font></a>', P, 510, 140, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 1)), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif C == 'np' and R >= 5 then
		pcall(tfm.exec.newGame, A[2])
	end
end

eventTextAreaCallback = function(I, P, C)
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = A[1]

	if C == 'pc' then
		ui.removeTextArea(2, P)
		ui.removeTextArea(3, P)
		PDB[P].O = false
	elseif C == 'sc' then
		for i = 4, 8 do
			ui.removeTextArea(i, P)
		end
		PDB[P].O = false
	elseif C == 'Buy' then
		local I = A[2]
		if Shop.Grounds[I] and PDB[P].Grounds[I] == nil then
			if PDB[P].SiDs >= Shop.Grounds[I][1] then
				PDB[P].SiDs = PDB[P].SiDs - Shop.Grounds[I][1]
				for S in pairs(PDB[P].Grounds) do
					PDB[P].Grounds[S] = false
				end
				PDB[P].Grounds[I] = true
				ui.updateTextArea(4, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P)
				ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 1)), P)
				ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
			end
		elseif PDB[P].PL >= 5 and Shop.AdmShop[I] and PDB[P].Grounds[I] == nil then
			if PDB[P].SiDs >= Shop.AdmShop[I][1] then
				for S in pairs(PDB[P].Grounds) do
					PDB[P].Grounds[S] = false
				end
				PDB[P].Grounds[I] = true
				ui.updateTextArea(4, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P)
				ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 1)), P)
				ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
			end
		elseif Shop.Skills[I] and PDB[P].Skills[I] == nil then
			if I == 'Spirit' then
				if PDB[P].SiDs >= ((PDB[P].SPs + 1) * Shop.Skills[I][1]) then
					PDB[P].SPs = PDB[P].SPs + 1
					tfm.exec.chatMessage(string.format('<j>You get a spirit. Now you have <v>%s <j>spirits!', PDB[P].SPs), P);
					print(string.format('<j>You get a spirit. Now you have <v>%s <j>spirits!', PDB[P].SPs));
				end
			else
				if PDB[P].SiDs >= Shop.Skills[I][1] then
					PDB[P].SiDs = PDB[P].SiDs - Shop.Skills[I][1]
					for G in pairs(PDB[P].Skills) do
						PDB[P].Skills[G] = false
					end
					PDB[P].Skills[I] = true
				end
			end
			ui.updateTextArea(4, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P)
			ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 2)), P)
			ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
		end
	elseif C == 'Equip' then
		local T = tonumber(A[2])
		local I = A[3]
		if T == 1 then
			for G in pairs(PDB[P].Grounds) do
				PDB[P].Grounds[G] = false
			end
			PDB[P].Grounds[I] = true
		elseif T == 2 then
			for G in pairs(PDB[P].Skills) do
				PDB[P].Skills[G] = false
			end
			PDB[P].Skills[I] = true
		end
		ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, T)), P)
		ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
	elseif C == 'Unequip' then
		local S = A[2]
		PDB[P].Skills[S] = false
		ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 2)), P)
		ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
	elseif C == 'Edit' then
		ui.addPopup(1, 2, 'Enter with ground color:<br>Example : #FADE55', P, 300, 150, 200, true)
	elseif C == 'Grounds' then
		ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 1)), P)
		ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
	elseif C == 'Skills' then
		ui.updateTextArea(7, string.format('<n><font size="20">Shop</font>%s', Shp(P, 2)), P)
		ui.updateTextArea(8, '<a href="event:sc"><p align="center"><font size="12">Close</font></p></a>', P)
	end
end

eventPopupAnswer = function(I, P, A)
	if I == 1 then
		if A:len() == 7 and A:sub(1, 1) == '#' and tonumber('0x' .. A:sub(2)) ~= nil then
			PDB[P].Colorful = tonumber('0x' .. A:sub(2)) or PDB[P].Colorful
			tfm.exec.chatMessage(string.format('Ground color altered to <font color="%s">%s</font>', A, A), P)
			print(string.format('Ground color altered to <font color="%s">%s</font>', A, A))
		else
			tfm.exec.chatMessage('<rose>Alert: <n>This code is invalid!', P)
		end
	end
end

eventSummoningEnd = function(P, O, X, Y, A, XS, YS, T)
	if O == 0 then
		BoB = function(P)
			if T.ghost and PDB[P].Skills['Box'] then
				return {30, 30}
			else
				return {100 * Grnd(P, T.ghost), 10}
			end
		end
		local G = Grnd(P)
		if PDB[P].HaM < 1 then
			if Ground == 1 then
				Ground = 2
			else
				Ground = 1
			end
			tfm.exec.addPhysicObject(Ground, X, Y, {type = G[2], width = BoB(P)[1], height = BoB(P)[2], angle = A, friction = G.P[1], restitution = G.P[2], color = PDB[P].Colorful})
		elseif PDB[P].HaM > 0 then
			
			tfm.exec.addPhysicObject(1, X, Y, {type = G[2], width = BoB(P)[1], height = BoB(P)[2], angle = A, friction = G.P[1], restitution = G.P[2], color = PDB[P].Colorful})
		end
	elseif O == 24 then
		Sps = Sps + 1
		if Sps <= PDB[P].SPs then
			tfm.exec.chatMessage(string.format('<J>Alert! You used a spirit. Remainder: <v>%s', PDB[P].SPs - Sps, P));
		else
			tfm.exec.killPlayer(P);
			tfm.exec.chatMessage('<R>Alert! You used the maximum number of spirits per round.', P);
			tfm.exec.chatMessage('<CH>The shaman used the maximum number of spirits per round.');
		end
	elseif O ~= 0 and O ~= 24 then
		tfm.exec.killPlayer(P)
		tfm.exec.removeObject(T.id)
	end
end

for _ in pairs(tfm.get.room.playerList) do
	eventNewPlayer(_)
end

tfm.exec.newGame(Np)
