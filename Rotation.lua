-- Created by Squalleze --
Maps = {0, 1, 2, 3, 4, 5}
Nm, Ap = Maps[math.random(#Maps)], 0
tfm.exec.disableAutoNewGame(true)

eventNewGame = function()
	Ap = 0
	SnM()
	for P in pairs(tfm.get.room.playerList) do
		Ap = Ap + 1
	end
end

eventPlayerRespawn = function(P)
	Ap = Ap + 1
end

eventPlayerDied = function(P)
	Ap = Ap - 1
	Im(Ap)
end

eventPlayerWon = function(P)
	Ap = Ap - 1
	Im(Ap)
end

eventLoop = function(C, R)
	Im(R)
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

Im(Ap)
