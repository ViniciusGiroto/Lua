-- Created by Squalleze --
PDB = {}

PD = function(P)
	if not PDB[P] then
		PDB[P] = {
			P = '';
		}
	end
end

eventNewPlayer = function(P)
	PD(P)
	tfm.exec.bindKeyboard(P, 37, true, true)
	tfm.exec.bindKeyboard(P, 37, false, true)
	tfm.exec.bindKeyboard(P, 39, true, true)
	tfm.exec.bindKeyboard(P, 39, false, true)
end

eventLoop = function(C, R)
	for P in pairs(tfm.get.room.playerList) do
		if PDB[P].P == 'Left' then
			tfm.exec.movePlayer(P, 0, 0, false, -25, 0, true)
			break
		elseif PDB[P].P == 'Right' then
			tfm.exec.movePlayer(P, 0, 0, false, 25, 0, true)
			break
		else
			break
		end
	end
end

eventKeyboard = function(P, K, D, X, Y)
	if K == 37 then
		if D == true then
			PDB[P].P = 'Left'
		else
			PDB[P].P = ''
		end
	elseif K == 39 then
		if D == true then
			PDB[P].P = 'Right'
		else
			PDB[P].P = ''
		end
	end
end

for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end
