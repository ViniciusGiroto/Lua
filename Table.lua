-- Created by Squalleze
table.dump = function(list, o)
  o = (o or 0) > 0 and o or 0
  local out = {}
  for k, v in pairs(list) do
    table.insert(out, ("%s[%s] = %s"):format(("\t"):rep(o + 1), type(k) ~= "number" and ("\"%s\""):format(k) or k, type(v) == "table" and table.dump(v, o + 1) or ((type(v) == "number" or type(v) == "boolean") and tostring(v) or ("\"%s\""):format(tostring(v):gsub("\"", "\\\"")))))
  end

  local rt = ("{\n%s\n%s}"):format(table.concat(out, ",\n"), ("\t"):rep(o))
  return rt ~= ("{\n\n%s}"):format(("\t"):rep(o)) and rt or "{}"
end

table.filter = function(e, func)
  local out = {}
  table.foreach(e, function(a, b)
    local o = func(b, a, e)
    if o ~= nil then
      out[b] = o
    end
  end)
  return out
end

table.map = function(list, func)
  local map = {}
  for i, v in next, list do
    map[i] = func(v, i, list)
  end
  return map
end

table.random = function(list, func)
  local rand, x = {}, type(func) == 'function'
  for i, v in next, list do
    if not x or func(v, i, list) then
      table.insert(rand, v)
    end
  end
  return rand[math.random(1, #rand)]
end

table.reduce = function(list, callback, initial)
  local reduce, init = initial, initial ~= nil
  for k, v in next, list do
    if not init then
      reduce, init = v, true
    else
      reduce = callback(reduce, v, k, list)
    end
  end

  return reduce
end

table.inject = function(list, callback, initial)
  local reduce, init = initial, initial ~= nil
  for i, v in ipairs(list) do
    if not init then
      reduce, init = v, true
    else
      reduce = callback(reduce, v, i, list)
    end
  end

  return reduce
end

table.keys = function(list)
  local keys = {}
  for key in next, list do table.insert(keys, key) end
  return keys
end

table.values = function(list)
  local values = {}
  for _, value in next, list do table.insert(values, value) end
  return values
end

table.every = function(list, callback)
  local every, keys = true, 0
  for k, v in next, list do if not callback(v, k, list) then return false end keys = keys + 1 end
  return keys > 0
end

table.entries = function(list)
  local entries = {}
  for k, v in next, list do table.insert(entries, {k, v}) end
  return entries
end

table.some = function(list, callback)
  for k, v in next, list do if callback(v, k, list) then return true end end
  return false
end
