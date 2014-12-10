-- Created by Squalleze --
Maps = {0, 1, 2, 3, 4, 5}
Nm, Ap, Sa, De = Maps[math.random(#Maps)], 0, 0, 0
tfm.exec.disableAutoNewGame(true)

eventNewGame = function()
	Ap, Sa, De = 0, 0, 0
	SnM()
	Mn()
	for P in pairs(tfm.get.room.playerList) do
		Ap = Ap + 1
	end
end

eventPlayerRespawn = function(P)
	Ap, De = Ap + 1, De - 1
	Mn()
end

eventPlayerDied = function(P)
	Ap, De = Ap - 1, De + 1
	Im(Ap)
	Mn()
end

eventPlayerWon = function(P)
	Ap, Sa = Ap - 1, Sa + 1
	Im(Ap)
	Mn()
end

eventLoop = function(C, R)
	Im(R)
	Mn()
end

SnM = function()
	repeat
		Nm = Maps[math.random(#Maps)]
	until Nm ~= tfm.get.room.currentMap
end

Im = function(A)
	if A < 1 then
		tfm.exec.newGame(Nm)
	end
end

Mn = function()
	local Cm, Te = tfm.get.room, nil
	if tonumber(Cm.currentMap) then
		Te = string.format('<j>%i   <g>|   <n>Info : <v>%i <g>/ <j>%i <g>/ <r>%i', Cm.currentMap, Ap, Sa, De)
	else
		Te = string.format('<j>%s <bl>- %s   <g>|   <n>Info : <v>%i <g>/ <j>%i <g>/ <r>%i', Cm.xmlMapInfo.author, Cm.currentMap, Ap, Sa, De)
	end
	tfm.exec.setUIMapName(Te)
end

Im(Ap)
