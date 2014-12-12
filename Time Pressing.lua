-- Created by Squalleze --
Pi = {}

eventNewPlayer = function(P)
	if not Pi[P] then
		Pi[P] = {0, 0}
	end
	tfm.exec.bindKeyboard(P, 32, true, true)
	tfm.exec.bindKeyboard(P, 32, false, true)
end

eventKeyboard = function(P, K, D, X, Y)
	if K == 32 then
		if D then
			Pi[P][1] = os.time()
		else
			Pi[P][2] = math.ceil((os.time() - Pi[P][1]) / 1000)
			print(Pi[P][2])
		end
	end
end

for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end
