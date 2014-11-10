Maps = {'@4685402', '@4664013', '@4659007', '@4590128', '@4590114', '@4590098', '@4590090', '@4590082', '@4434919', '@4082213', '@2969962', '@2873573', '@2462332', '@2454924', '@2449267', '@1870464', '@2396838', '@4007168', '@1124454', '@452653', '@2113338', '@2199656', '@3820670', '@159709', '@3147428', '@3051156', '@172357', '@3617459', '@413242', '@2932610', '@317521', '@155582', '@460646', '@156966', '@200017', '@489046', '@584430', '@1193841', '@187059', '@169710', '@458677', '@188821', '@308787', '@474113', '@3049560', '@1233889', '@1233889', '@249255', '@436128', '@382841', '@219032', '@1641473', '@497021', '@364544', '@504567', '@504166', '@2703778', '@2406202', '@355562', '@166138', '@426398', '@442098', '@776051', '@923878', '@1937184', '@437313', '@416324', '@528954', '@392150', '@421185', '@484159', '@470160', '@398828', '@273581', '@182878', '@4652489', '@4679376', '@4666553'}
Shop = {Grounds = {['Wood'] = {0, 0, P = {0.3, 0.2}}, ['Sand'] = {75, 7, P = {0.1, 0.2}}, ['Earth'] = {100, 5, P = {0.3, 0.2}}, ['Grass'] = {150, 6, P = {0.3, 0.2}}, ['Stone'] = {500, 10, P = {0.3, 0}}, ['Colorful'] = {750, 12, P = {0.3, 0.2}}, ['Chocolate'] = {1000, 4, P = {20, 0.2}}}, ['Resize'] = {200, 200}}
PDB = {}
PS = {['Squalleze'] = 5, ['Mrorko'] = 5}
Grounds = 0
Sps = 0

tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
system.disableChatCommandDisplay('p', true)
system.disableChatCommandDisplay('s', true)

eventShop = function(P)
	local T = ''
	for G in pairs(Shop.Grounds) do
		if PDB[P].Inventory[G] and PDB[P].GroundU ~= Shop.Grounds[G][2] and Shop.Grounds[G][2] ~= 12 then
			T = T .. '<br><bl>» ' .. G .. ' : <v><a href="event:Equip_' .. G .. '">Equip</a>'
		elseif PDB[P].Inventory[G] and PDB[P].GroundU ~= Shop.Grounds[G][2] and Shop.Grounds[G][2] == 12 then
			T = T .. '<br><bl>» ' .. G .. ' : <v><a href="event:Equip_' .. G .. '">Equip</a> - <a href="event:Edit">Edit</a>'
		elseif PDB[P].GroundU == Shop.Grounds[G][2] and Shop.Grounds[G][2] ~= 12 then
			T = T .. '<br><bl>» ' .. G .. ' : <v>Equiped'
		elseif PDB[P].GroundU == Shop.Grounds[G][2] and Shop.Grounds[G][2] == 12 then
			T = T .. '<br><bl>» ' .. G .. ' : <v>Equiped - <a href="event:Edit">Edit</a>'
		elseif not PDB[P].Inventory[G] then
			T = T .. '<br><bl>» ' .. G .. ' : <v><a href="event:Buy_' .. G .. '">Buy ' .. Shop.Grounds[G][1] .. '</a>'
		end
	end
	return T
end

eventNewPlayer = function(P)
	if not PDB[P] then
		PDB[P] = {
			ID = #PDB + 1,
			PeL = PS[P] or 0,
			HaM = tfm.get.room.playerList[P].inHardMode,
			Coins = PS[P] + 99999 ^ 9 or 0,
			GroundU = 0,
			GroundN = 'Wood',
			Colorful = 3294800,
			Inventory = {['Wood'] = true},
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
	isAlive = 0
	Grounds = 0
	Sps = 0
	for _ in pairs(tfm.get.room.playerList) do
		isAlive = isAlive + 1
		if tfm.get.room.playerList[_].isShaman == true then
			PDB[_].HaM = tfm.get.room.playerList[_].inHardMode
			PDB[_].Profil.Rounds[1] = PDB[_].Profil.Rounds[1] + 1
		end
	end
end

eventPlayerDied = function(P)
	isAlive = isAlive - 1
	if tfm.get.room.playerList[P].isShaman == true then
		tfm.exec.setGameTime(5)
	end
end

eventLoop = function(C, R)
	if isAlive == 0 or R <= 0 then
		tfm.exec.newGame(Maps[math.random(#Maps)])
	end
end

eventPlayerWon = function(P)
	isAlive = isAlive - 1
	if tfm.get.room.playerList[P].isShaman == false then
		for _ in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[_].isShaman == true then
				for __ = 1, PDB[_].HaM + 1 do
					PDB[_].Profil.Saves[__] = PDB[_].Profil.Saves[__] + 1
					PDB[_].Coins = PDB[_].Coins + (1 * (PDB[_].HaM + 1))
				end
			end
		end
	else
		PDB[P].Profil.Rounds[2] = PDB[P].Profil.Rounds[2] + 1
	end
end

eventChatCommand = function(P, C)
	if C == 'p' then
		ui.addTextArea(2, string.format('<font size="20">%s</font><br><br>Saves:<br><tab><bl>» Normal : <v>%s<br><tab><bl>» Hard: <j>%s<br><tab><bl>» Divine: <r>%s<br><br><n>Rounds:<br><tab><bl>» Played: <v>%s<br><tab><bl>» Completed: <v>%s', P, PDB[P].Profil.Saves[1], PDB[P].Profil.Saves[2], PDB[P].Profil.Saves[3], PDB[P].Profil.Rounds[1], PDB[P].Profil.Rounds[2]), P, 290, 100, 220, 200, 768, 768, .8, true)
		ui.addTextArea(3, '<a href="event:pc"><p align="center"><font color="#808080" size="12">Close</font></p></a>', P, 295, 276, 210, nil, 0x808080, 0x404040, .2, true)
	elseif C == 's' then
		ui.addTextArea(2, string.format('<font size="20">Shop</font><br><br>Grounds:%s<br><p align="right"><n>Coins : <j>%s</a>', eventShop(P), PDB[P].Coins), P, 290, 100, 220, 200, 768, 768, .8, true)
		ui.addTextArea(3, '<a href="event:pc"><p align="center"><font color="#808080" size="12">Close</font></p></a>', P, 295, 276, 210, nil, 0x808080, 0x404040, .2, true)
	end
end

eventTextAreaCallback = function(I, P, C)
	if C == 'pc' then
		ui.removeTextArea(2, P)
		ui.removeTextArea(3, P)
	elseif string.sub(C, 1, 4) == 'Buy_' then
		G = string.sub(C, 5)
		if Shop.Grounds[G] and not PDB[P].Inventory[G] then
			if PDB[P].Coins >= Shop.Grounds[G][1] then
				PDB[P].Coins = PDB[P].Coins - Shop.Grounds[G][1]
				PDB[P].Inventory[G] = true
				eventChatCommand(P, 's')
			end
		end
	elseif string.sub(C, 1, 6) == 'Equip_' then
		G = string.sub(C, 7)
		PDB[P].GroundU = Shop.Grounds[G][2]
		PDB[P].GroundN = G
		eventChatCommand(P, 's')
	elseif C == 'Edit' then
		ui.addPopup(1, 2, 'Enter with ground color:<br>Example : #FADE55', P, 300, 150, 200, true)
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

eventSummoningEnd = function(p, o, x, y, a, xs, ys, t, e)
	if o == 0 then
		if PDB[p].HaM < 1 then
			Grounds = Grounds + 1
			tfm.exec.addPhysicObject(Grounds, x, y, {type = PDB[p].GroundU, width = 100, height = 10, angle = a, friction = Shop.Grounds[PDB[p].GroundN].P[1], restitution = Shop.Grounds[PDB[p].GroundN].P[2], color = PDB[p].Colorful})
			tfm.exec.removePhysicObject(Grounds - 2)
		elseif PDB[p].HaM > 0 then
			Grounds = Grounds + 1
			tfm.exec.addPhysicObject(Grounds, x, y, {type = PDB[p].GroundU, width = 100, height = 10, angle = a, friction = Shop.Grounds[PDB[p].GroundN].P[1], restitution = Shop.Grounds[PDB[p].GroundN].P[2], color = PDB[p].Colorful})
			tfm.exec.removePhysicObject(Grounds - 1)
		else
			print(error())
		end
	elseif o == 24 then
		Sps = Sps + 1
		if Sps > 2 then
			tfm.exec.killPlayer(p);
			tfm.exec.chatMessage('<R>Alert! You used the maximum number of spirits per round.', p);
			tfm.exec.chatMessage('<CH>The shaman used the maximum number of spirits per round.');
		else
			tfm.exec.chatMessage('<J>Alert! You used a spirit. Remainder: ' .. 2 - Sps, p);
		end
	elseif o ~= 0 and o ~= 24 then
		tfm.exec.killPlayer(p)
		tfm.exec.removeObject(t.id)
	end
end

for _ in pairs(tfm.get.room.playerList) do
	eventNewPlayer(_)
end

tfm.exec.newGame(Maps[math.random(#Maps)])
