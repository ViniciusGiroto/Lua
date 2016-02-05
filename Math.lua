-- Created by Squalleze
math.inpolygon = function(x, y, ...)
  local offset = {...}
  local inside = false
  local j = #offset

  if j < 3 then
    error("A polygon have more than " .. j .. " point(s).", 0)
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
