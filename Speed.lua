-- Created by Squalleze
eventLoop = function()
	for k, v in pairs(tfm.get.room.playerList) do
		if v.movingLeft then
			tfm.exec.movePlayer(k, 0, 0, false, -25, 0, true)
		elseif v.movingRight then
			tfm.exec.movePlayer(k, 0, 0, false, 25, 0, true)
		end
	end
end
