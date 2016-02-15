tfm.exec.disableAutoNewGame()
maps = {0, "@6320438", "@6066061", "@5553609", "@6352283", 70}
lastMaps = {}

selectMap = function()
	local id = math.random(1, #maps)

	if #lastMaps == #maps then
		lastMaps = {}
	end

	while (id == (nextMap or {}).id or lastMaps[id]) do
		id = math.random(1, #maps)
	end

	return {id = id, code = maps[id]}
end

eventLoop = function(elapsedTime, remainingTime)
	if remainingTime <= 0 or (function() local out = true for k, v in next, tfm.get.room.playerList do out = out and not v.isDead if not v.isDead then break end end return not out end)() then
		tfm.exec.newGame(nextMap.code)
	end
end

eventNewGame = function()
	lastMaps[nextMap.id] = true
	nextMap = selectMap()
end

nextMap = selectMap()
tfm.exec.newGame(nextMap.code)
