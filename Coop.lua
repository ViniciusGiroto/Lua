-- Created by Squalleze --
Info, St = {}, {}
Shamans, Ts = 3, 0
Colors = {'98E2EB', 'FEB1FC', '92CF91', 'EDCC8D'}
tfm.exec.disableAutoShaman(true)

eventNewGame = function()
	Ts, St, Info = 0, {}, {}
	for P, P_ in pairs(tfm.get.room.playerList) do
		table.insert(Info, {Name = P, Score = P_.score})
	end
	table.sort(Info, function (k1, k2) return k1.Score > k2.Score end)
	table.foreachi(Info, function (k, v) if Ts < Shamans then Ts = Ts + 1 tfm.exec.setShaman(v.Name) tfm.exec.setNameColor(v.Name, tonumber('0x' .. Colors[Ts])) table.insert(St, string.format('<font color="#%s">%s', Colors[Ts], v.Name)) end end)
	tfm.exec.setUIShamanName(table.concat(St, ' - '))
end
