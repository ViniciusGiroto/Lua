-- Created by Squalleze --
Time = 5

eventLoop = function(C, R)
	if math.ceil(R / 1000) % Time == 0 then
		for P in pairs(tfm.get.room.playerList) do
			tfm.exec.respawnPlayer(P)
		end
	end
end
