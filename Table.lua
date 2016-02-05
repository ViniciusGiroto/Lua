-- Created by Squalleze
table.dump = function(list, o)
  o = (o or 0) > 0 and o or 0
  local out = {}
  for k, v in pairs(list) do
    table.insert(out, ("%s%s = %s"):format(("\t"):rep(o + 1), type(k) ~= "number" and tostring(k) or ("[%s]"):format(k), type(v) == "table" and table.dump(v, o + 1) or ((type(v) == "number" or type(v) == "boolean") and tostring(v) or ("\"%s\""):format(tostring(v):gsub("\"", "\\\"")))))
  end

  local rt = ("{\n%s\n%s}"):format(table.concat(out, ",\n"), ("\t"):rep(o))
  return rt ~= ("{\n\n%s}"):format(("\t"):rep(o)) and rt or "{}"
end
