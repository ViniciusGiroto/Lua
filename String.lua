-- Created by Squalleze
string.split = function(str, n)
  local out = {}
  for k in string.gmatch(str, (".?"):rep(n or 1)) do
  	table.insert(out, k)
  end
  return out
end

string.title = function(a)
  return a:gsub("(%S+)", function(b) return b:lower():gsub("%a", string.upper, 1) end)
end
