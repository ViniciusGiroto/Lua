-- Created by Squalleze --
List = {}
Vampire = {5, 0, true}

eventNewGame = function()
	Vampire, List = {Vampire[1], os.time(), false}, {}
	for P in pairs(tfm.get.room.playerList) do
		table.insert(List, P)
	end
end

eventLoop = function(C, R)
	if not Vampire[3] and C >= (Vampire[1] * 1000) then
		tfm.exec.setVampirePlayer(List[math.random(#List)])
	end
end

eventPlayerVampire = function(P)
	Vampire[3] = true
end
