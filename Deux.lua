Maps = {'@4685402', '@4664013', '@4659007', '@4590128', '@4590114', '@4590098', '@4590090', '@4590082', '@4434919', '@4082213', '@2969962', '@2873573', '@2462332', '@2454924', '@2449267', '@1870464', '@2396838', '@4007168', '@1124454', '@452653', '@2113338', '@2199656', '@3820670', '@159709', '@3147428', '@3051156', '@172357', '@3617459', '@413242', '@2932610', '@317521', '@155582', '@460646', '@156966', '@200017', '@489046', '@584430', '@1193841', '@187059', '@169710', '@458677', '@188821', '@308787', '@474113', '@3049560', '@1233889', '@1233889', '@249255', '@436128', '@382841', '@219032', '@1641473', '@497021', '@364544', '@504567', '@504166', '@2703778', '@2406202', '@355562', '@166138', '@426398', '@442098', '@776051', '@923878', '@1937184', '@437313', '@416324', '@528954', '@392150', '@421185', '@484159', '@470160', '@398828', '@273581', '@182878', '@4652489', '@4679376', '@4666553'}
Shop = {
	Grounds = {
		['Wood'] = {0, 0, 0, P = {0.3, 0.2}}, 
		['Sand'] = {75, 7, 0, P = {0.1, 0.2}}, 
		['Earth'] = {100, 5, 0, P = {0.3, 0.2}}, 
		['Grass'] = {150, 6, 0, P = {0.3, 0.2}}, 
		['Ice'] = {175, 1, 0, P = {0, 0.2}}, 
		['Stone'] = {250, 10, 0, P = {0.3, 0}}, 
		['Colorful'] = {550, 12, 0, P = {0.3, 0.2}}, 
		['Chocolate'] = {1000, 4, 0, P = {20, 0.2}},
		['Web'] = {0, 15, 5, P = {0.3, 0.2}}, 
		['Water'] = {0, 9, 5, P = {0.3, 0.2}}, 
		['Trampoline'] = {0, 2, 5, P = {0, 1.2}}, 
		['Lava'] = {0, 3, 5, P = {0, 20}}, 
		['Cloud'] = {0, 8, 5, P = {0.3, 0.2}}, 
		['Snow'] = {0, 11, 5, P = {0.05, 0.1}}, 
		['Circle'] = {0, 13, 5, P = {0.3, 0.2}}
	},
	Skills = {
		['Resize'] = {375, 0}, 
		['Box'] = {350, 0}, 
		['Spirit'] = {100, 0}
	}
}
Texts = {
	['BR'] = {
		['Shop'] = '<n><font size="20">Loja</font>%s',
		['Close'] = '<a href="event:%s"><p align="center"><font size="12">Fechar</font></p></a>',
		['BuySPs'] = '<j>Você comprou um espírito. Agora você tem <v>%s <j>espírito!',
		['ICCd'] = '<rose>Alerta: <n>esse código de cor é inválido!',
		['SCCd'] = 'Cor do piso alterada para <font color="%s">%s</font>',
		['MSPR'] = '<r>Você usou o máximo de espíritos por rodada.',
		['SUMS'] = '<ch>O shaman usou o máximo de espíritos por rodada.',
		['USPs'] = '<j>Você usou um espírito. Restante(s): <v>%s',
		['Profil'] = '<font size="20">%s</font><br><br>Ratos salvos:<br><tab><bl>» Normal : <v>%s<br><tab><bl>» Difícil: <j>%s<br><tab><bl>» Divino: <r>%s<br><br><n>Rodadas:<br><tab><bl>» Jogadas: <v>%s<br><tab><bl>» Completadas: <v>%s',
		['Skl'] = '&nbsp;&nbsp;<a href="event:Skills"><font size="12">Habilidades</font></a>',
		['Grnd'] = '&nbsp;&nbsp;<a href="event:Grounds"><font size="12">Pisos</font></a>',
		['ExCC'] = 'Digite o código da cor:<br>Exemplo : <font color="#FADE55">#FADE55</font>',
		['Equip'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Equip %s %s">Equipar</a>',
		['Equiped'] = '<br>&nbsp;<bl>» %s : <v>Equipado',
		['EquipedC'] = '<br>&nbsp;<bl>» %s : <v>Equipado - <a href="event:Edit">Editar</a>',
		['Unequip'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Unequip %s">Desequipar</a>',
		['Buy'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s">Comprar %s</a>',
		['Free'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s">Grátis</a>',
		['Skills'] = '<br><br><n>Habilidades:',
		['Grounds'] = '<br><br><n>Pisos:',
		['Help'] = '&nbsp;&nbsp;<a href="event:Help"><font size="12">Ajuda</font></a>',
		['Credits'] = '&nbsp;&nbsp;<a href="event:Credits"><font size="12">Créditos</font></a>',
		['HelpB'] = '<n><font size="20">Help</font><br><br>',
		['CreditsB'] = '<n><font size="20">Créditos</font><br><br>&nbsp;<bv>» Squalleze <n>- desenvolvimento do minigame.',
		['ShopI'] = {
			['Wood'] = 'Madeira',
			['Sand'] = 'Areia',
			['Earth'] = 'Terra',
			['Grass'] = 'Grama',
			['Ice'] = 'Gelo',
			['Stone'] = 'Pedra',
			['Colorful'] = 'Colorido',
			['Chocolate'] = 'Chocolate',
			['Web'] = 'Teia',
			['Water'] = 'Água',
			['Trampoline'] = 'Trampolim',
			['Lava'] = 'Lava',
			['Cloud'] = 'Nuvem',
			['Snow'] = 'Neve',
			['Circle'] = 'Círculo',
			['Resize'] = 'Esticar',
			['Box'] = 'Caixa',
			['Spirit'] = 'Espírito'
		}
	},
	['EN'] = {
		['Shop'] = '<n><font size="20">Shop</font>%s',
		['Close'] = '<a href="event:%s"><p align="center"><font size="12">Close</font></p></a>',
		['BuySPs'] = '<j>You get a spirit. Now you have <v>%s <j>spirits!',
		['ICCd'] = '<rose>Alert: <n>This code is invalid!',
		['SCCd'] = 'Ground color altered to <font color="%s">%s</font>',
		['MSPR'] = '<r>You used the maximum number of spirits per round.',
		['SUMS'] = '<ch>The shaman used the maximum number of spirits per round.',
		['USPs'] = '<j>You used a spirit. Remainder: <v>%s',
		['Profil'] = '<font size="20">%s</font><br><br>Saves:<br><tab><bl>» Normal : <v>%s<br><tab><bl>» Hard: <j>%s<br><tab><bl>» Divine: <r>%s<br><br><n>Rounds:<br><tab><bl>» Played: <v>%s<br><tab><bl>» Completed: <v>%s',
		['Skl'] = '&nbsp;&nbsp;<a href="event:Skills"><font size="12">Skills</font></a>',
		['Grnd'] = '&nbsp;&nbsp;<a href="event:Grounds"><font size="12">Grounds</font></a>',
		['ExCC'] = 'Enter with ground color:<br>Example : <font color="#FADE55">#FADE55</font>',
		['Equip'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Equip %s %s">Equip</a>',
		['Equiped'] = '<br>&nbsp;<bl>» %s : <v>Equiped',
		['EquipedC'] = '<br>&nbsp;<bl>» %s : <v>Equiped - <a href="event:Edit">Edit</a>',
		['Unequip'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Unequip %s">Unequip</a>',
		['Buy'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s">Buy %s</a>',
		['Free'] = '<br>&nbsp;<bl>» %s : <v><a href="event:Buy %s">Free</a>',
		['Skills'] = '<br><br><n>Skills:',
		['Grounds'] = '<br><br><n>Grounds:',
		['Help'] = '&nbsp;&nbsp;<a href="event:Help"><font size="12">Help</font></a>',
		['Credits'] = '&nbsp;&nbsp;<a href="event:Credits"><font size="12">Credits</font></a>',
		['HelpB'] = '<n><font size="20">Help</font><br><br>Blá blá blá',
		['CreditsB'] = '<n><font size="20">Credits</font><br><br>&nbsp;<bv>» Squalleze <n>- developing the minigame.',
		['ShopI'] = {
			['Wood'] = 'Wood',
			['Sand'] = 'Sand',
			['Earth'] = 'Earth',
			['Grass'] = 'Grass',
			['Ice'] = 'Ice',
			['Stone'] = 'Stone',
			['Colorful'] = 'Colorful',
			['Chocolate'] = 'Chocolate',
			['Web'] = 'Web',
			['Water'] = 'Water',
			['Trampoline'] = 'Trampoline',
			['Lava'] = 'Lava',
			['Cloud'] = 'Cloud',
			['Snow'] = 'Snow',
			['Circle'] = 'Circle',
			['Resize'] = 'Resize',
			['Box'] = 'Box',
			['Spirit'] = 'Spirit'
		}
	},
}
PDB = {}
PS = {['Squalleze'] = 5, ['Mrorko'] = 5, ['Ninguem'] = 99999 ^ 9}
PSC = {['Squalleze'] = 99999 ^ 9, ['Mrorko'] = 99999 ^ 9, ['Ninguem'] = 99999 ^ 9}
isAlive, Ground, Sps, Np, Version = 0, 0, 0, Maps[math.random(#Maps)], 1.02

tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
system.disableChatCommandDisplay('p', true)
system.disableChatCommandDisplay('s', true)
system.disableChatCommandDisplay('np', true)
system.disableChatCommandDisplay('h', true)

TTs = function()
	local CMM = tfm.get.room.community
	if Texts[CMM] then
		return Texts[CMM]
	else
		return Texts['BR']
	end
end

ND = function(T)
	if string.sub(T, 1, 1) == '+' then
		local T = string.upper(string.sub(T, 1, 2)) .. string.lower(string.sub(T, 3))
		return T
	else
		local T = string.upper(string.sub(T, 1, 1)) .. string.lower(string.sub(T, 2))
		return T
	end
end

Grnd = function(P, G)
	local H = nil
	for G in pairs(PDB[P].Grounds) do
		if PDB[P].Grounds[G] then
			H = Shop.Grounds[G]
			break
		end
	end
	if G then
		if PDB[P].Skills['Resize'] then
			H['Width'] = 150
			H['Height'] = 10
		elseif PDB[P].Skills['Box'] then
			H['Width'] = 30
			H['Height'] = 30
		else
			H['Width'] = 100
			H['Height'] = 10
		end
	else
		H['Width'] = 100
		H['Height'] = 10
	end
	return H
end

Shp = function(P, C)
	local T = ''
	if C == 1 then
		T = TTs()['Grounds']
		for G in pairs(Shop.Grounds) do
			if PDB[P].PL >= Shop.Grounds[G][3] then
				if PDB[P].Grounds[G] == false then
					T = T .. string.format(TTs()['Equip'], TTs()['ShopI'][G], 1, G)
				elseif PDB[P].Grounds[G] and Shop.Grounds[G][2] ~= 12 then
					T = T .. string.format(TTs()['Equiped'], TTs()['ShopI'][G])
				elseif PDB[P].Grounds[G] and Shop.Grounds[G][2] == 12 then
					T = T .. string.format(TTs()['EquipedC'], TTs()['ShopI'][G])
				elseif PDB[P].Grounds[G] == nil and Shop.Grounds[G][1] > 0 then
					T = T .. string.format(TTs()['Buy'], TTs()['ShopI'][G], G, Shop.Grounds[G][1])
				elseif PDB[P].Grounds[G] == nil and Shop.Grounds[G][1] < 1 then
					T = T .. string.format(TTs()['Free'], TTs()['ShopI'][G], G)
				end
			end
		end
	elseif C == 2 then
		T = TTs()['Skills']
		for S in pairs(Shop.Skills) do
			if PDB[P].PL >= Shop.Skills[S][2] then
				if PDB[P].Skills[S] == false then
					T = T .. string.format(TTs()['Equip'], TTs()['ShopI'][S], 2, S)
				elseif PDB[P].Skills[S] then
					T = T .. string.format(TTs()['Unequip'], TTs()['ShopI'][S], S)
				elseif PDB[P].Skills[S] == nil and S ~= 'Spirit' then
					T = T .. string.format(TTs()['Buy'], TTs()['ShopI'][S], S, Shop.Skills[S][1])
				elseif S == 'Spirit' then
					T = T .. string.format(TTs()['Buy'], TTs()['ShopI'][S], S, ((PDB[P].SPs + 1) * Shop.Skills[S][1]))
				end
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
	for _, i in pairs(tfm.get.room.playerList) do
		isAlive = isAlive + 1
		if i.isShaman then
			PDB[_].HaM = i.inHardMode
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
		for _, i in pairs(tfm.get.room.playerList) do
			if i.isShaman then
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

	if not PDB[P].O and C == 'p' and not A[2] then
		PDB[P].O = true
		ui.addTextArea(2, string.format(TTs()['Profil'], P, PDB[P].Profil.Saves[1], PDB[P].Profil.Saves[2], PDB[P].Profil.Saves[3], PDB[P].Profil.Rounds[1], PDB[P].Profil.Rounds[2]), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, string.format(TTs()['Close'], 'Close 2 3'), P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif not PDB[P].O and C == 'p' and A[2] and PDB[ND(A[2])] then
		PDB[P].O = true
		ui.addTextArea(2, string.format(TTs()['Profil'], ND(A[2]), PDB[ND(A[2])].Profil.Saves[1], PDB[ND(A[2])].Profil.Saves[2], PDB[ND(A[2])].Profil.Saves[3], PDB[ND(A[2])].Profil.Rounds[1], PDB[ND(A[2])].Profil.Rounds[2]), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, string.format(TTs()['Close'], 'Close 2 3'), P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif not PDB[P].O and C == 's' then
		PDB[P].O = true
		ui.addTextArea(2, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P, 510, 270, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, TTs()['Skl'], P, 510, 110, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(4, TTs()['Grnd'], P, 510, 140, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(5, string.format(TTs()['Shop'], Shp(P, 1)), P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
	elseif not PDB[P].O and (C == 'h' or C == 'help') then
		PDB[P].O = true
		ui.addTextArea(2, TTs()['Help'], P, 510, 110, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(3, TTs()['Credits'], P, 510, 140, nil, nil, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(4, TTs()['HelpB'], P, 290, 100, 220, 202, 0x324650, 0x27373F, 1, true)
		ui.addTextArea(5, string.format(TTs()['Close'], 'Close 2 5'), P, 295, 278, 210, nil, 0x293A42, 0x324650, 1, true)
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

	if C == 'Close' then
		for i = tonumber(A[2]), tonumber(A[3]) do
			ui.removeTextArea(i, P)
		end
		PDB[P].O = false
	elseif C == 'Credits' then
		ui.updateTextArea(4, TTs()['CreditsB'], P)
		ui.updateTextArea(5, string.format(TTs()['Close'], 'Close 2 5'), P)
	elseif C == 'Help' then
		ui.updateTextArea(4, TTs()['HelpB'], P)
		ui.updateTextArea(5, string.format(TTs()['Close'], 'Close 2 5'), P)
	elseif C == 'Buy' then
		local I = A[2]
		if Shop.Grounds[I] and PDB[P].Grounds[I] == nil and PDB[P].PL >= Shop.Grounds[I][3] then
			if PDB[P].SiDs >= Shop.Grounds[I][1] then
				PDB[P].SiDs = PDB[P].SiDs - Shop.Grounds[I][1]
				for S in pairs(PDB[P].Grounds) do
					PDB[P].Grounds[S] = false
				end
				PDB[P].Grounds[I] = true
				ui.updateTextArea(2, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P)
				ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, 1)), P)
				ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
			end
		elseif Shop.Skills[I] and PDB[P].Skills[I] == nil and PDB[P].PL >= Shop.Skills[I][2] then
			if I == 'Spirit' then
				if PDB[P].SiDs >= ((PDB[P].SPs + 1) * Shop.Skills[I][1]) then
					PDB[P].SPs = PDB[P].SPs + 1
					tfm.exec.chatMessage(string.format(TTs()['BuySPs'], PDB[P].SPs), P);
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
			ui.updateTextArea(2, string.format('&nbsp;&nbsp;<n><font size="12">SiD\'s: <v>%s</font>', PDB[P].SiDs), P)
			ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, 2)), P)
			ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
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
		ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, T)), P)
		ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
	elseif C == 'Unequip' then
		local S = A[2]
		PDB[P].Skills[S] = false
		ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, 2)), P)
		ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
	elseif C == 'Edit' then
		ui.addPopup(1, 2, TTs()['ExCC'], P, 300, 150, 200, true)
	elseif C == 'Grounds' then
		ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, 1)), P)
		ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
	elseif C == 'Skills' then
		ui.updateTextArea(5, string.format(TTs()['Shop'], Shp(P, 2)), P)
		ui.updateTextArea(6, string.format(TTs()['Close'], 'Close 2 6'), P)
	end
end

eventPopupAnswer = function(I, P, A)
	if I == 1 then
		if A:len() == 7 and A:sub(1, 1) == '#' and tonumber('0x' .. A:sub(2)) ~= nil then
			PDB[P].Colorful = tonumber('0x' .. A:sub(2)) or PDB[P].Colorful
			tfm.exec.chatMessage(string.format(TTs()['SCCd'], A, A), P)
		else
			tfm.exec.chatMessage(TTs()['ICCd'], P)
		end
	end
end

eventSummoningEnd = function(P, O, X, Y, A, XS, YS, T)
	if O == 0 then
		local G = Grnd(P, T.ghost)
		if PDB[P].HaM < 1 then
			if Ground == PDB[P].ID then
				Ground = - PDB[P].ID
			else
				Ground = PDB[P].ID
			end
			tfm.exec.addPhysicObject(Ground, X, Y, {type = G[2], width = G['Width'], height = G['Height'], angle = A, friction = G.P[1], restitution = G.P[2], color = PDB[P].Colorful})
		elseif PDB[P].HaM > 0 then
			
			tfm.exec.addPhysicObject(PDB[P].ID, X, Y, {type = G[2], width =G['Width'], height = G['Height'], angle = A, friction = G.P[1], restitution = G.P[2], color = PDB[P].Colorful})
		end
	elseif O == 24 then
		Sps = Sps + 1
		if Sps <= PDB[P].SPs then
			tfm.exec.chatMessage(string.format(TTs()['USPs'], PDB[P].SPs - Sps, P));
		else
			tfm.exec.killPlayer(P);
			tfm.exec.chatMessage(TTs()['MSPR'], P);
			tfm.exec.chatMessage(TTs()['SUMS']);
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
