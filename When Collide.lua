-- Created by Squalleze --
onGround = function(ground, x, y)
    local properties = {}
    for v in string.gmatch(ground.P, '[^,]+') do
        table.insert(properties, tonumber(v))
    end

    x = x or 0
    y = y or 0

    local inside = false
    local offset = {}
    local width = tonumber(ground.L)
    local height = tonumber(ground.H)
    local gx = tonumber(ground.X)
    local gy = tonumber(ground.Y)

    if ground.T ~= 9 then
        width = width + collisionArea
        height = height + collisionArea
    end

    if ground.T ~= 13 then
        local angle = properties[5]

        local halfWidth = width / 2;
        local halfHeight = height / 2;

        local rad = math.rad(angle);
        local cos = math.cos(rad);
        local sin = math.sin(rad);

        local ax = (-halfWidth * cos - (-halfHeight) * sin) + gx;
        local ay = (-halfWidth * sin + (-halfHeight) * cos) + gy;
        local bx = ( halfWidth * cos - (-halfHeight) * sin) + gx;
        local by = ( halfWidth * sin + (-halfHeight) * cos) + gy;
        local cx = ( halfWidth * cos -   halfHeight  * sin) + gx;
        local cy = ( halfWidth * sin +   halfHeight  * cos) + gy;
        local dx = (-halfWidth * cos -   halfHeight  * sin) + gx;
        local dy = (-halfWidth * sin +   halfHeight  * cos) + gy;

        local j = 4
        inside = false
        offset = {{ax, ay}, {bx, by}, {cx, cy}, {dx, dy}}

        for i = 1, 4 do
            if (offset[i][2] < y and offset[j][2] >= y) or (offset[j][2] < y and offset[i][2] >= y) then
                if offset[i][1] + (y - offset[i][2]) / (offset[j][2] - offset[i][2]) * (offset[j][1] - offset[i][1]) < x then
                    inside = not inside
                end
            end
            j = i
        end
    else
        offset = {gx, gy}
        if (gx - x) ^ 2 + (gy - y) ^ 2 <= (width ^ 2) then
            inside = true
        end
    end

    return inside, offset
end

local grounds = {}

eventNewGame = function()
    local xml = (tfm.get.room.xmlMapInfo or {}).xml or ""
    grounds = {}

    xml:gsub("<S (.-)/>", function(arg)
        local attr = {}
        arg:gsub("([%-%w]+)=([\"'])(.-)%2", function(arg1, arg2, arg3)
            attr[arg1] = tonumber(arg3) or arg3
        end)

        table.insert(grounds, attr)
    end)
end

eventLoop = function(elapsedTime, remainingTime)
    _G.elapsedTime = elapsedTime
    _G.remainingTime = remainingTime
    whenCollide()
end

whenCollide = function()
    for k, v in pairs(tfm.get.room.playerList) do
        for i, g in ipairs(grounds) do
            if (g.c ~= 3 and g.c ~= 4) and (elapsedTime > 3000) then
                tfm.exec.lowerSyncDelay(k)
                if onGround(g, v.x, v.y) then
                    if g.T == 12 then
                        local c = tostring(g.o or ""):upper()
                        if c == "7FFF" then
                            tfm.exec.movePlayer(k, 0, 0, false, 0, -100, true)
                        elseif c == "FF0000" then
                            tfm.exec.killPlayer(k)
                        elseif c == "FFF000" then
                            tfm.exec.giveMeep(k)
                        elseif c == "FF00" then
                            tfm.exec.playEmote(k, 4)
                        elseif c == "0" then
                            tfm.exec.setVampirePlayer(k)
                        elseif c == "FFFFFF" then
                            tfm.exec.setPlayerScore(k, 1, true)
                        elseif c == "FF007F" then
                            tfm.exec.setNameColor(k, 0xFF007F)
                        end
                    end
                end
            end
        end
    end
end

--debug.disableEventLog(false)
tfm.exec.newGame("@6363895")
collisionArea = 34
