-- Tables --
PDB = {}
MDB = {}
PSS = {
	['F'] = false,
	['S'] = false,
	['T'] = false
}
PS = {
	['Squalleze'] = 5,
	['Bolodefchoco'] = 5,
	['Kingtenso'] = 4,
	['Miiilleenaaa'] = 4,
	['Nedior'] = 4,
	['Darkshamamn'] = 4
}
SS = {
	V = 'v1.0 Alpha',
	C = {A = '*', M = nil, CPL = 4},
	M = {T = 0},
	PL = {
		[-1] = {C = 0x000001, HC = '#000001', N = 'Banned'},
		[0] = {C = 0xC2C2DA, HC = '#C2C2DA', N = 'Player'},
		[1] = {C = 0x009D9D, HC = '#009D9D', N = 'Cool People'},
		[2] = {C = 0x2ECF73, HC = '#2ECF73', N = 'Moderator'},
		[3] = {C = 0xBABD2F, HC = '#BABD2F', N = 'Programmer'},
		[4] = {C = 0x2F7FCC, HC = '#2F7FCC', N = 'Administrator'},
		[5] = {C = 0xEB1D51, HC = '#EB1D51', N = 'Master'}
	}
}
TA = {
	['wc'] = {7, 9},
	['hc'] = {10, 11},
	['mc'] = {12, 13}
}
CS = {
	['help'] = {PL = -1, C = 'help', CC = '', D = 'Open this window', DC = ''},
	['kill'] = {PL = 0, C = 'kill', CC = ' [Player|' .. SS.C.A .. ']', D = 'Kill you', DC = ' or player'},
	['fly'] = {PL = 3, C = 'fly', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives fly to you', DC = ' or to player'},
	['speed'] = {PL = 3, C = 'speed', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives speed to you', DC = ' or to player'},
	['teleport'] = {PL = 3, C = 'teleport', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives teleport to you', DC = ' or to player'},
	['respawn'] = {PL = 0, C = 'respawn', CC = ' [Player|' .. SS.C.A .. ']', D = 'Revive you', DC = ' or player'},
	['cheese'] = {PL = 0, C = 'cheese', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives cheese to you', DC = ' or to player'},
	['win'] = {PL = 0, C = 'win', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives cheese and hole to you', DC = ' or to player'},
	['meep'] = {PL = 0, C = 'meep', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives meep to you', DC = ' or to player'},
	['shaman'] = {PL = 3, C = 'shaman', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives shaman to you', DC = ' or to player'},
	['vampire'] = {PL = 3, C = 'vampire', CC = ' [Player|' .. SS.C.A .. ']', D = 'Gives vampire to you', DC = ' or to player'},
	['unban'] = {PL = 5, C = 'unban', CC = ' Player', D = 'Unban player', DC = ''},
	['time'] = {PL = 3, C = 'time', CC = ' Seconds', D = 'Set map time', DC = ''},
	['map'] = {PL = 3, C = 'map', CC = ' Map', D = 'Load map', DC = ''},
	['ban'] = {PL = 5, C = 'ban', CC = ' Player [Minutes]', D = 'Ban player per [Minutes] or permanent', DC = ''},
	['pl'] = {PL = 5, C = 'pl', CC = ' Player PL', D = 'Set player pl', DC = ''},
	['msg'] = {PL = 3, C = 'msg', CC = ' Mensage', D = 'Send mensage to everybody in room', DC = ''},
	['alert'] = {PL = 3, C = 'alert', CC = ' Player|PL Mensage', D = 'Send alert to player', DC = ''},
	['ec'] = {PL = 3, C = 'editc', CC = ' Command NewName', D = 'Edit command name', DC = ''}
}

-- Variable reverse --
VR = function(V)
	local V = not V
	return V
end

-- Not differentiate --
ND = function(T)
	if string.sub(T, 1, 1) == '+' then
		local T = string.upper(string.sub(T, 1, 2)) .. string.lower(string.sub(T, 3))
		return T
	else
		local T = string.upper(string.sub(T, 1, 1)) .. string.lower(string.sub(T, 2))
		return T
	end
end

-- Player data --
PD = function(P)
	if not PDB[P] then
		PDB[P] = {
			ID = #PDB + 1,
			PL = PS[P] or 0,
			ST = 0,
			BT = 0,
			TA = true,
			PS = {
				['F'] = false,
				['S'] = false,
				['T'] = false;
			}
		}
	end
end

-- Execute with pcall --
EWP = function(P, E, U)
	local U = U or P
	local U = ND(U)
	if PDB[P].PL >= SS.C.CPL then
		if U == SS.C.A then
			for U in pairs(tfm.get.room.playerList) do
				pcall(E, U)
			end
		else
			pcall(E, U)
		end
	elseif U == P or U == SS.C.M then
		pcall(E, P)
	end
end

-- Players/Player skills reverse --
PSR = function(P, S, U)
	local U = U or P
	local U = ND(U)
	if U == SS.C.A then
		PSS[S] = VR(PSS[S])
		for U in pairs(tfm.get.room.playerList) do
			PDB[U].PS[S] = false
		end
	elseif U == SS.C.M then
		PDB[P].PS[S] = VR(PDB[P].PS[S])
	elseif PDB[U] then
		PDB[U].PS[S] = VR(PDB[U].PS[S])
	end
end

-- Permission level --
PL = function(P, L)
	local P = ND(P)
	if L then
		PDB[P].PL = L
		PL(P)
	elseif SS.PL[PDB[P].PL] then
		tfm.exec.setNameColor(P, SS.PL[PDB[P].PL].C)
		if PDB[P].PL < 0 then
			EWP(P, tfm.exec.killPlayer)
		end
	end
end

-- Map load --
ML = function(M)
	local M = ND(M)
	if MDB[M] then
		pcall(tfm.exec.newGame, MDB[M].X)
	else
		pcall(tfm.exec.newGame, M)
	end
end

-- Remove textarea --
RTA = function(P, C)
	for I = TA[C][1], TA[C][2] do
		pcall(ui.removeTextArea, I, P)
	end
end

-- Alert to all --
ATA = function(P, R, M)
	for A in pairs(tfm.get.room.playerList) do
		if (type(R) == 'string' and A == R) or (type(R) == 'number' and PDB[A].PL >= R) then
			ui.addTextArea(12, '<font color="' .. SS.PL[PDB[P].PL].HC .. '">[~' .. SS.PL[PDB[P].PL].N .. ' ' .. P .. '] </font>' .. M, A, 14, 34, 772, 352, 768, 768, .8, true)
			ui.addTextArea(13, '<a href="event:mc"><p align="center"><font color="#808080" size="12">Close</font></p></a>', A, 19, 363, 762, nil, 0x808080, 0x404040, .2, true)
		end
	end
end

-- Command permission --
CP = function(D, C, P)
	local T = 0
	if CS[D].C == C then
		T = 1
		if PDB[P].PL >= CS[D].PL then
			T = 2
			print(P .. ' has used command ' .. C)
		end
	end
	return T
end

-- Start textareas --
STA = function(P)
	ui.addTextArea(1, '<font color="#000000">' .. SS.V, P, 5, 379, nil, nil, nil, nil, 0, true)
	ui.addTextArea(2, '<font color="#000000">' .. SS.V, P, 5, 381, nil, nil, nil, nil, 0, true)
	ui.addTextArea(3, '<font color="#000000">' .. SS.V, P, 4, 380, nil, nil, nil, nil, 0, true)
	ui.addTextArea(4, '<font color="#000000">' .. SS.V, P, 6, 380, nil, nil, nil, nil, 0, true)
	ui.addTextArea(5, SS.V, P, 5, 380, nil, nil, nil, nil, 0, true)
	ui.addTextArea(6, '<br><ti><b><v><a href="event:help">?</a>', P, 771, 10, 14, nil, 768, 768, .8, true)
end

-- Player respawn --
eventPlayerRespawn = function(P)
	PL(P)
end

-- New game --
eventNewGame = function()
	SS.M.T = os.time()
	for P in pairs(tfm.get.room.playerList) do
		PL(P)
	end
end

-- New player --
eventNewPlayer = function(P)
	PD(P)
	PL(P)
	STA(P)
	system.bindMouse(P, true)
	tfm.exec.bindKeyboard(P, 17, true, true)
	tfm.exec.bindKeyboard(P, 32, true, true)
	tfm.exec.bindKeyboard(P, 27, true, true)
	ui.addTextArea(7, '<br /><p align="center"><font color="#5ACDD5" size="20"><b>Welcome to tribe</b></font><br /><font size="26" color="#CE931D">Orion Imperium</font></p><br /><br /><font color="#DDDDDD" size="14">Say <b>!help</b> to view tribe commands</font><br /><br /><bv>~ Based on:<br /><j><tab>- Panel 3.1 (Bolodefchoco)<br /><tab>- Control Panel 8.1.1 Alpha (Squalleze)<br /><br /><bv>~ Created by:<br /><j><tab>- Bolodefchoco and Squalleze', P, 204, 34, 392, 352, 768, 768, .8, true)
	ui.addTextArea(8, '<a href="event:help"><p align="center"><font color="#808080" size="12">Help</font></p></a>', P, 209, 333, 382, nil, 0x606060, 0x303030, .2, true)
	ui.addTextArea(9, '<a href="event:wc"><p align="center"><font color="#808080" size="12">Close</font></p></a>', P, 209, 363, 382, nil, 0x606060, 0x303030, .2, true)
end

-- Chat commands --
eventChatCommand = function(P, C)
	local R = PDB[P].PL
	local A = {}

	for V in string.gmatch(C, '[^%s]+') do
		table.insert(A, V)
	end

	local C = string.lower(A[1])

	if CP('fly', C, P) == 2 then
		PSR(P, 'F', A[2])
	elseif CP('speed', C, P) == 2 then
		PSR(P, 'S', A[2])
	elseif CP('teleport', C, P) == 2 then
		PSR(P, 'T', A[2])
	elseif CP('help', C, P) == 2 then
		local T = ''
		for M in pairs(CS) do
			if CS[M].PL <= R then
				if SS.C.CPL <= R then
					T = T .. '<br><tab><g>!' .. CS[M].C .. CS[M].CC .. ' <n>- ' .. CS[M].D .. CS[M].DC
				else
					T = T .. '<br><tab><g>!' .. CS[M].C .. ' <n>- ' .. CS[M].D
				end
			end
		end
		ui.addTextArea(10, '<bv>~ Commands:<br><tab><j>' .. SS.C.A .. ' = All in room or leave blank for you<br><tab>[...] = Not is required<br>~~~~~~~~~~' .. T, P, 14, 34, 772, 352, 768, 768, .8, true)
		ui.addTextArea(11, '<a href="event:hc"><p align="center"><font color="#808080" size="12">Close</font></p></a>', P, 19, 363, 762, nil, 0x808080, 0x404040, .2, true)
	elseif CP('kill', C, P) == 2 then
		EWP(P, tfm.exec.killPlayer, A[2])
	elseif CP('respawn', C, P) == 2 then
		EWP(P, tfm.exec.respawnPlayer, A[2])
	elseif CP('cheese', C, P) == 2 then
		EWP(P, tfm.exec.giveCheese, A[2])
	elseif CP('win', C, P) == 2 then
		EWP(P, tfm.exec.giveCheese, A[2])
		EWP(P, tfm.exec.playerVictory, A[2])
	elseif CP('meep', C, P) == 2 then
		EWP(P, tfm.exec.giveMeep, A[2])
	elseif CP('shaman', C, P) == 2 then
		EWP(P, tfm.exec.setShaman, A[2])
	elseif CP('vampire', C, P) == 2 then
		EWP(P, tfm.exec.setVampirePlayer, A[2])
	end
	if A[2] then
		if CP('unban', C, P) == 2 and PDB[ND(A[2])] and PDB[ND(A[2])].PL <= -1 then
			PL(A[2], 0)
		elseif CP('time', C, P) == 2 and type(tonumber(A[2])) == 'number' then
			tfm.exec.setGameTime(tonumber(A[2]))
		elseif CP('map', C, P) == 2 then
			ML(A[2])
		elseif CP('ban', C, P) == 2 and PDB[ND(A[2])] and PS[ND(A[2])] ~= 5 then
			local T = tonumber(A[3]) or (99999 ^ 9)
			PL(A[2], -1)
			PDB[ND(A[2])].BT = os.time() + T * 60000
		elseif CP('msg', C, P) == 2 then
			local M = string.gsub(table.concat(A, ' ', 2, #A), '<', '&lt;')
			ATA(P, -1, M)
		end
		if A[3] then
			if CP('pl', C, P) == 2 and PS[ND(A[2])] ~= 5 and tonumber(A[3]) >= 0 and tonumber(A[3]) <= 5 and PDB[ND(A[2])] then
				PL(A[2], tonumber(A[3]))
--			elseif C == CS['ban'].C and CS['ban'].PL <= R and PDB[ND(A[2])] and PS[ND(A[2])] ~= 5 and type(tonumber(A[3])) == 'number' and tonumber(A[3]) <= 360 then
--				PL(A[2], -1)
--				PDB[ND(A[2])].BT = os.time() + A[3] * 60000
			elseif CP('ec', C, P) == 2 then
				local AC = string.lower(A[2])
				local NC = string.lower(A[3])
				for M in pairs(CS) do
					if CS[M].C == AC then
						if not CS[M].C == NC then
							CS[M].C = NC
							ATA(P, CS[M].PL, 'Command ' .. AC .. ' has renamed to ' .. NC)
							system.disableChatCommandDisplay(NC, true)
						else
							ATA(P, P, 'Esse comando já existe.')
						end
					else
						ATA(P, P, 'Comando não encontrado.')
					end
				end
			elseif CP('alert', C, P) == 2 and PDB[ND(A[2])] or type(tonumber(A[2])) == 'number' then
				local R = tonumber(A[2]) or ND(A[2])
				local M = string.gsub(table.concat(A, ' ', 3, #A), '<', '&lt;')
				ATA(P, R, M .. '<br><p align="right">~Private Alert</p>')
			end
		end
	end
end

-- Loop --
eventLoop = function(C, R, E)
	for P in pairs(tfm.get.room.playerList) do
		if PDB[P].PL <= -1 and PDB[P].BT <= os.time() then
			PL(P, 0)
		end
	end

	if E == 'Vampire' and 30000 >= C then
		local PL = {}
		for P in pairs(tfm.get.room.playerList) do
			table.insert(PL, P)
		end
		EWP(PL[math.random(#PL)], tfm.exec.setVampirePlayer)
	end
end

-- Keyboard --
eventKeyboard = function(P, K, D, X, Y)
	if K == 32 and (SS.M.T + 3250) <= os.time() and (PSS['F'] or PDB[P].PS['F']) then
		tfm.exec.movePlayer(P, 0, 0, true, 0, -50, true)
	elseif K == 17 and PDB[P].ST <= os.time() and (PSS['S'] or PDB[P].PS['S']) then
		if tfm.get.room.playerList[P].isFacingRight then
			tfm.exec.movePlayer(P, 0, 0, false, 50, 0, true)
			PDB[P].ST = os.time() + 500
		else
			tfm.exec.movePlayer(P, 0, 0, false, -50, 0, true)
			PDB[P].ST = os.time() + 500
		end
	elseif K == 27 then
		if PDB[P].TA == true then
			for T = 1, 6 do
				ui.removeTextArea(T, P)
			end
			PDB[P].TA = false
		else
			PDB[P].TA = true
			STA(P)
		end
	end
end

-- Mouse --
eventMouse = function(P, X, Y)
	if PSS['T'] or PDB[P].PS['T'] then
		tfm.exec.movePlayer(P, X, Y, false, 0, 0, true)
	end
end

-- Text area callback --
eventTextAreaCallback = function(T, P, C)
	if TA[C] then
		RTA(P, C)
	elseif C == 'help' then
		eventChatCommand(P, 'help')
	end
end

-- Start fors --
for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end

for C in pairs(CS) do
	system.disableChatCommandDisplay(CS[C].C, true)
end
