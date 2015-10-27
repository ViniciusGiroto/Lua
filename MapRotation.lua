mapList = {
	["@136"] = {},
	["@3078"] = {},
	["@127419"] = {},
	["@142101"] = {},
	["@159204"] = {}
}

selectMap = function()
	local maps = {}
	for k, v in pairs(mapList) do
		table.insert(maps, k)
	end
	local map = maps[math.random(#maps)]

	return map, mapList[map]
end

eventNewGame = function()
	local tgr = tfm.get.room
	local tgrx = tgr.xmlMapInfo

	if nextMap[2].xml then
		tfm.exec.setUIMapName(("<j>%s <bl>- %s"):format(nextMap[2].author, nextMap[1]))
	else
		if mapList[tgr.currentMap] then
			mapList[nextMap[1]] = tgrx
		end
	end

	nextMap = {selectMap()}
end

eventLoop = function(c, r)
	local i = 0
	for k, v in pairs(tfm.get.room.playerList) do
		if not v.isDead then
			i = i + 1
		end
	end

	if i == 0 or r <= 0 then
		tfm.exec.newGame(nextMap[2].xml or nextMap[1])
	end
end

do
	tfm.exec.disableAutoNewGame(true)
	nextMap = {selectMap()}
	tfm.exec.newGame(nextMap[1]);
end
