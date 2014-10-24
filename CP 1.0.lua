PDB = {}
PSS = {['F'] = false, ['S'] = false, ['T'] = false}
MDB = {}
PS = {Squalleze = 5}
SS = {C = {A = '*', M = 'Me'}, M = {T = 0}, PL = {[-1] = 0x000001, [0] = 0xC2C2DA, [1] = 0x009D9D, [2] = 0x2ECF73, [3] = 0xBABD2F, [4] = 0x2F7FCC, [5] = 0xEB1D51}}

-- Variable reverse --
VR = function(V)
	local V = not V
	return V
end

-- Not differentiate --
ND = function(T)
	if T:sub(1, 1) == '+' then
		local T = string.upper(T:sub(1, 2)) .. string.lower(T:sub(3))
		return T
	else
		local T = string.upper(T:sub(1, 1)) .. string.lower(T:sub(2))
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
	if U == SS.C.A then
		for U in pairs(tfm.get.room.playerList) do
			pcall(E, U)
		end
	elseif U == SS.C.M then
		pcall(E, P)
	else
		pcall(E, U)
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
	else
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
		tfm.exec.setNameColor(P, SS.PL[PDB[P].PL])
		if PDB[P].PL < 0 then
			EWP(P, tfm.exec.killPlayer)
		end
	end
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
	system.bindMouse(P, true)
	tfm.exec.bindKeyboard(P, 17, true, true)
	tfm.exec.bindKeyboard(P, 32, true, true)
end

-- Chat commands --
eventChatCommand = function(P, C)
	local R = PDB[P].PL
	local A = {}

	for V in C:gmatch('[^%s]+') do
		table.insert(A, V)
	end

	local C = string.lower(A[1])

	if C == 'kill' and A[2] == nil then
		tfm.exec.killPlayer(P)

	elseif R >= 5 then
		if A[2] then
			if C == 'fly' then
				PSR(P, 'F', A[2])
			elseif C == 'speed' then
				PSR(P, 'S', A[2])
			elseif C == 'teleport' then
				PSR(P, 'T', A[2])
			elseif C == 'kill' then
				EWP(P, tfm.exec.killPlayer, A[2])
			elseif C == 'respawn' then
				EWP(P, tfm.exec.respawnPlayer, A[2])
			elseif C == 'cheese' then
				EWP(P, tfm.exec.giveCheese, A[2])
			elseif C == 'win' then
				EWP(P, tfm.exec.giveCheese, A[2])
				EWP(P, tfm.exec.playerVictory, A[2])
			elseif C == 'meep' then
				EWP(P, tfm.exec.giveMeep, A[2])
			elseif C == 'shaman' then
				EWP(P, tfm.exec.setShaman, A[2])
			elseif C == 'vampire' then
				EWP(P, tfm.exec.setVampirePlayer, A[2])
			elseif C == 'unban' and PDB[ND(A[2])] and PDB[ND(A[2])].PL <= -1 then
				PL(A[2], 0)
			elseif C == 'time' and type(tonumber(A[2])) == 'number' then
				tfm.exec.setGameTime(tonumber(A[2]))
			end

			if A[3] then
				if C == 'rank' and PS[ND(A[2])] ~= 5 and tonumber(A[3]) >= 0 and tonumber(A[3]) <= 5 and PDB[ND(A[2])] then
					PL(A[2], tonumber(A[3]))
				elseif C == 'ban' and PDB[ND(A[2])] and PS[ND(A[2])] ~= 5 and type(tonumber(A[3])) == 'number' and tonumber(A[3]) <= 360 then
					PL(A[2], -1)
					PDB[ND(A[2])].BT = os.time() + A[3] * 60000
				end
			end
		end
	end
end

-- Loop --
eventLoop = function(C, R)
	for P in pairs(tfm.get.room.playerList) do
		if PDB[P].PL <= -1 and PDB[P].BT <= os.time() then
			PL(P, 0)
		end
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
	end
end

-- Mouse --
eventMouse = function(P, X, Y)
	if PSS['T'] or PDB[P].PS['T'] then
		tfm.exec.movePlayer(P, X, Y, false, 0, 0, true)
	end
end

-- Start for --
for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end
