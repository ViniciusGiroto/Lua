-- Created by Squalleze --
Properties = {}

XMLPropertiesCollect = function(xml)
	local ls = string.find(xml, '<S>') + 2
	local le = string.find(xml, '</S>') - 1
	local sp = ls

	groundProperties = function(s)
		local p = {}
		for i, ii in string.gmatch(s, '(%w+)="(.-)"') do
			p[i] = ii
		end
		return p
	end

	while sp < le do
		if xml:sub(sp, sp) == '<' then
			local ep = string.find(xml, '/>', sp) + 1
			prop = groundProperties(string.sub(xml, sp, ep + 1))
			table.insert(Properties, prop)
		end
		sp = sp + 1
	end
end
