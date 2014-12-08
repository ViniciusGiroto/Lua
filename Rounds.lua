-- Created by Squalleze --
Round = {10, 0}

eventNewGame = function()
	local Cm, Te = tfm.get.room, nil
	Round[2] = Round[2] + 1
	if tonumber(Cm.currentMap) then
		Te = string.format('<j>%i   <g>|   <n>Round: <v>%i/%i', Cm.currentMap, Round[2], Round[1])
	else
		Te = string.format('<j>%s <bl>- %s   <g>|   <n>Round: <v>%i/%i',  Cm.xmlMapInfo.author, Cm.currentMap, Round[2], Round[1])
	end
	tfm.exec.setUIMapName(Te)
	if Round[2] == Round[1] then
		Round[2] = 0
	end
end
