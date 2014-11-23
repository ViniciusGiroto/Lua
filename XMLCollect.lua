-- Created by Squalleze --
Xml = nil

eventNewGame = function()
	Xml = tfm.get.room.xmlMapInfo.xml
end

eventChatCommand = function(P, C)
	if type(tonumber(C)) == 'number' then
		C = tonumber(C)
		print(Xml:gsub('<', '&lt;'):sub(C * 2000 + 1, C * 2000 + 2000))
	end
end
