-- Created by Squalleze
conjs = {}
color = 0xffbf00
time = 10

eventMouse = function(p, x, y)
	mx = (x + 5) % 10
	my = (y + 5) % 10

	if mx > 5 then
		x = x - (mx - 10)
	else
		x = x - mx
	end

	if my > 5 then
		y = y - (my - 10)
	else
		y = y - my
	end

	table.insert(conjs, (time * 1000) + os.time())
	tfm.exec.addPhysicObject(#conjs, x, y, {type = 12, color = color, friction = .3, restitution = .2})
end

eventLoop = function(c, r)
	for i, v in ipairs(conjs) do
		if v <= os.time() then
			tfm.exec.removePhysicObject(i)
		end
	end
end

eventNewPlayer = function(p)
	system.bindMouse(p, true)
end

for p in pairs(tfm.get.room.playerList) do
	eventNewPlayer(p)
end
