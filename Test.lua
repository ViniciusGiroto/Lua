math.inpolygon = function(x, y, ...)
  local offset = {...}
  local inside = false
  local j = #offset

  if j < 3 then
    error("A polygon have more than " .. j .. " points.", 0)
  end

  for i = 1, #offset do
    if (offset[i][2] < y and offset[j][2] >= y) or (offset[j][2] < y and offset[i][2] >= y) then
      if offset[i][1] + (y - offset[i][2]) / (offset[j][2] - offset[i][2]) * (offset[j][1] - offset[i][1]) < x then
        inside = not inside
      end
    end
    j = i
  end

  return inside
end

player = "Squalleze"
mode = 0
modeColor = {[0] = 0xFF, [1] = 0xFF0000}
points = {}
lol = 3
system.bindKeyboard(player, 32, false, true)
system.bindMouse(player, true)
tfm.exec.addPhysicObject(1, 0, 0, {type = 14, miceCollision = false, groundCollision = false})
ui.addTextArea(1, "", player, 10, 33, 5, 5, modeColor[mode], modeColor[mode], 1, true)

eventKeyboard = function(playerName, keyCode)
  if keyCode == 32 then
    mode = (mode + 1) % 2
    ui.addTextArea(1, "", playerName, 10, 33, 5, 5, modeColor[mode], modeColor[mode], 1, true)
  end
end

eventMouse = function(playerName, xMousePosition, yMousePosition)
  if mode == 0 then
    if #points < lol then
      table.insert(points, {xMousePosition, yMousePosition})
    end
    if #points == lol then
      tfm.exec.addJoint(#points + 1, 1, 1, {type = 0, point1 = table.concat(points[#points], ","), point2 = table.concat(points[1], ","), line = 1, color = 0, foreground = true})
    end
    if #points > 1 then
      tfm.exec.addJoint(#points, 1, 1, {type = 0, point1 = table.concat(points[#points - 1], ","), point2 = table.concat(points[#points], ","), line = 1, color = 0, foreground = true})
    end
  elseif mode == 1 then
    print(math.inpolygon(xMousePosition, yMousePosition, table.unpack(points)))
  end
end

eventChatCommand = function(playerName, command)
  if tonumber(command) then
    local a = math.floor(tonumber(command))
    if a >= 3 then
      lol = a
    end
  end
end
