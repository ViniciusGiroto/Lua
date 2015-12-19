-- Created by Squalleze
sql = {}

eventNewGame = function()
    -- Round
    sql.currentRound = sql.currentRound + 1
end

eventLoop = function(elapsedTime, remainingTime)
    sql.elapsedTime = elapsedTime
    sql.remainingTime = remainingTime

    local out = {}
    for i, v in ipairs(sql) do
        local idk = out
        table.insert(idk, v())

        if #table.concat(idk, "   <G>|   ") < 200 then
            out = idk
        else
            break;
        end
    end

    ui.setMapName(table.concat(out, "   <G>|   ") .. "<")
end


-- Map name
table.insert(sql, function()
    if tfm.get.room.xmlMapInfo then
        return ("<J>%s <BL>- %s"):format(tfm.get.room.xmlMapInfo.author, tfm.get.room.currentMap)
    else
        return ("<J>%d"):format(tfm.get.room.currentMap)
    end
end)

-- Time
table.insert(sql, function()
    return ("<N>Time : <V>%02d:%02d"):format(math.max(sql.remainingTime, 0) / 60000, math.max(sql.remainingTime, 0) / 1000 % 60)
end)

-- Round
sql.currentRound = -1
sql.roundsPerTurn = 10

table.insert(sql, function()
    return ("<N>Round : <V>%d <N2>/ <V>%d"):format(sql.currentRound % sql.roundsPerTurn + 1, sql.roundsPerTurn)
end)

-- Shaman
table.insert(sql, function()
    local shamans = {}
    local colors = {"<font color='#98E2EB'>", "<font color='#FEB1FC'>", "<font color='#92CF91'>"}
    for k, v in pairs(tfm.get.room.playerList) do
        if v.isShaman then
            table.insert(shamans, colors[#shamans % #colors + 1] .. k)
        end
    end

    if #shamans == 1 then
        return "<N>Shaman : " .. shamans[1]
    elseif #shamans > 1 then
        return "<N>Shamans : " .. table.concat(shamans, " - ")
    else
        return
    end
end)

tfm.exec.newGame()
