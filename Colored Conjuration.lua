-- Created by Squalleze --
Conjurations = {}
Color = 0x00FFFF
Li = 0
Time = 10

eventMouse = function(P, X, Y)
	X_ = (X + 5) % 10
	Y_ = (Y + 5) % 10
	Li = Li + 1
	Conjurations[Li] = (Time * 1000) + os.time()
	if X_ > 5 then
		X = X - (X_ - 10)
	else
		X = X - X_
	end
	if Y_ > 5 then
		Y = Y - (Y_ - 10)
	else
		Y = Y - Y_
	end
	tfm.exec.addPhysicObject(Li, X, Y, {type = 12, color = Color, friction = .3, restitution = .2})
end

eventLoop = function(C, R)
	for C, C_ in pairs(Conjurations) do
		if C_ <= os.time() then
			tfm.exec.removePhysicObject(C)
		end
	end
end

eventNewPlayer = function(P)
	system.bindMouse(P, true)
end

for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end
