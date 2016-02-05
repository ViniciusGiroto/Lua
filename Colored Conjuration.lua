-- Created by Squalleze
conjs = {}
color = 0xffbf00
time = 10

eventMouse = function(p, x, y)
	x = math.floor(x / 10) * 10 + 5
	y = math.floor(y / 10) * 10 + 5

	table.insert(conjs, (time * 1000) + os.time())
	if x > 0 and y > 0 then
		tfm.exec.addConjuration(x / 10, y / 10, 0)
	end
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
