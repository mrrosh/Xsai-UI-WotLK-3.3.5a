
PerfectRaidDB = {
	["profileKeys"] = {
		["Tydor - Arthas"] = "Tydor - Arthas",
	},
	["global"] = {
		["sv_version"] = 185,
	},
	["profiles"] = {
		["Tydor - Arthas"] = {
			["highlight"] = {
				["mouseover"] = false,
			},
			["locked"] = true,
			["buffs"] = {
				{
					["buffname"] = "Innervate",
					["disptext"] = "Inn",
					["conds"] = "Mana",
					["color"] = "00FF33",
				}, -- [1]
				{
					["groupname"] = "Arcane Brilliance",
					["conds"] = "Mana",
					["color"] = "0068fd",
					["disptext"] = "Int",
					["buffname"] = "Arcane Intellect",
				}, -- [2]
				{
					["buffname"] = "Soulstone Resurrection",
					["disptext"] = "Ss",
					["conds"] = "All",
					["color"] = "CA21FF",
				}, -- [3]
				{
					["buffname"] = "Curse",
					["disptext"] = "Cu",
					["conds"] = "All",
					["color"] = "9800fe",
				}, -- [4]
				{
					["groupname"] = "Dalaran Brilliance",
					["conds"] = "All",
					["color"] = "006dfd",
					["disptext"] = "Int",
					["buffname"] = "Dalaran Intellect",
				}, -- [5]
			},
			["positions"] = {
				["PRHeader1"] = {
					["PosY"] = 608.4358099941657,
					["PosX"] = 0,
				},
			},
			["headers"] = {
				{
					["numColumns"] = 2,
					["scale"] = 1.1,
					["colSpacing"] = 0,
					["sortType"] = "NAME",
					["colAnchor"] = "LEFT",
					["filter"] = "1,2,3,4,5",
					["showRaid"] = 1,
					["groupBy"] = "GROUP",
					["maxUnits"] = 25,
					["alignright"] = 1,
				}, -- [1]
			},
		},
	},
}
