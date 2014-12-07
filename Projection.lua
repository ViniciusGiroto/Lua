-- Created by Squalleze --
List = {}
Time = 5

eventNewPlayer = function(P)
	if not List[P] then
		List[P] = {nil, 0, 0}
	end
	for K, K_ in pairs({string.byte('Q'), string.byte('D'), 37, 39}) do
		tfm.exec.bindKeyboard(P, K_, true, true)
	end
end

eventKeyboard = function(P, K, D, X, Y)
	if K ~= List[P][1] or List[P][2] <= os.time() then
		if List[P][3] <= os.time() then
			if K == 37 or K == string.byte('Q') then
				List[P] = {K, os.time() + 500, os.time()}
			elseif K == 39 or K == string.byte('D') then
				List[P] = {K, os.time() + 500, os.time()}
			end
		end
	elseif K == List[P][1] and List[P][2] >= os.time() then
		local Pi = tfm.get.room.playerList[P]
		if K == 37 or K == string.byte('Q') then
			tfm.exec.movePlayer(P, Pi.x - 100, Pi.y, false, 0, 0, false)
			tfm.exec.displayParticle(35, Pi.x - 50, Pi.y, 0, 0, 0, 0, nil)
			List[P] = {nil, 0, os.time() + (Time * 1000)}
		elseif K == 39 or K == string.byte('D') then
			tfm.exec.movePlayer(P, Pi.x + 100, Pi.y, false, 0, 0, false)
			tfm.exec.displayParticle(35, Pi.x + 50, Pi.y, 0, 0, 0, 0, nil)
			List[P] = {nil, 0, os.time() + (Time * 1000)}
		end
	end
end

for P in pairs(tfm.get.room.playerList) do
	eventNewPlayer(P)
end
