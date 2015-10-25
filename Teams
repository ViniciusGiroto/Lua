-- Created by Squalleze
teams = function(n)
	local v, teams = 0, {}
	table.foreach(tfm.get.room.playerList, function(p)
		t, v = v % n + 1, v + 1
		teams[t] = teams[t] or {}
		table.insert(teams[t], p)
	end)

	return teams
end
