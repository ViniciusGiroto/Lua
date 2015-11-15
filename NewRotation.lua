--
-- Created by IntelliJ IDEA.
-- User: Squalleze
-- Date: 11/15/2015
-- Time: 5:33 PM
--

maps = {
    "@136", "@3078", "@127419", "@142101", "@159204",
    XML = {}
}

tfm.exec.newXMLGame = function(xmlMapInfo)
    tfm.exec.newGame(xmlMapInfo.xml)
    ui.setMapName(("<J>%s <BL>- @%s"):format(xmlMapInfo.author, xmlMapInfo.mapCode))
end

eventLoop = function(c, r)
    local a = 0

    for k, v in pairs(tfm.get.room.playerList) do
        if not v.isDead then
            a = a + 1
        end
    end

    if a == 0 or r <= 0 then
        local map = maps[math.random(#maps)]
        if maps.XML[map] then
            tfm.exec.newXMLGame(maps.XML[map])
        else
            tfm.exec.newGame(map)
        end
    end
end

eventNewGame = function()
    local currentMap = tfm.get.room.currentMap
    local xmlMapInfo = tfm.get.room.xmlMapInfo
    if not maps.XML[currentMap] and xmlMapInfo then
        maps.XML[currentMap] = xmlMapInfo
    end
end

tfm.exec.disableAutoNewGame()
tfm.exec.newGame(maps[math.random(#maps)])
