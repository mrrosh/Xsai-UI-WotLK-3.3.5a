
ParrotDB = {
	["namespaces"] = {
		["CombatEvents"] = {
			["profiles"] = {
				["Default"] = {
					["Outgoing"] = {
						["Skill DoTs"] = {
							["tag"] = "[Amount]",
						},
						["Skill damage"] = {
							["tag"] = "[Amount]",
						},
					},
					["modifier"] = {
						["overheal"] = {
							["enabled"] = false,
						},
						["overkill"] = {
							["enabled"] = false,
						},
					},
					["Incoming"] = {
						["Heals over time"] = {
							["tag"] = "([Skill] +[Amount]",
						},
						["Heals"] = {
							["tag"] = "([Skill] +[Amount]",
						},
					},
				},
			},
		},
		["Display"] = {
			["profiles"] = {
				["Default"] = {
					["font"] = "CAFETA__",
					["stickyFont"] = "CAFETA__",
				},
			},
		},
		["ScrollAreas"] = {
			["profiles"] = {
				["Default"] = {
					["areas"] = {
						["Notification"] = {
							["stickyDirection"] = "UP;CENTER",
							["direction"] = "UP;CENTER",
							["stickyAnimationStyle"] = "Pow",
							["xOffset"] = -338.0385559874637,
							["size"] = 150,
							["animationStyle"] = "Straight",
							["yOffset"] = 94.93832221449122,
						},
						["Incoming"] = {
							["direction"] = "DOWN;LEFT",
							["stickySpeed"] = 5,
							["xOffset"] = -340.7109366515942,
							["yOffset"] = -157.5059950231429,
							["stickyDirection"] = "DOWN;RIGHT",
							["iconSide"] = "RIGHT",
							["speed"] = 5,
							["stickyAnimationStyle"] = "Pow",
							["animationStyle"] = "Straight",
							["size"] = 260,
						},
						["Outgoing"] = {
							["direction"] = "DOWN;CENTER",
							["stickySpeed"] = 5,
							["xOffset"] = 219.13550236096,
							["yOffset"] = -32.96523952855728,
							["stickyDirection"] = "DOWN;LEFT",
							["speed"] = 5,
							["stickyAnimationStyle"] = "Pow",
							["animationStyle"] = "Straight",
							["size"] = 261,
						},
					},
				},
			},
		},
		["Triggers"] = {
			["profiles"] = {
				["Default"] = {
					["triggers"] = {
						{
							["name"] = "Heimzahlen!",
							["sticky"] = true,
							["color"] = "ff00ff",
							["class"] = "WARLOCK",
							["icon"] = 34939,
							["conditions"] = {
								["Self buff gain"] = "Heimzahlen",
							},
						}, -- [1]
						{
							["name"] = "Blackout!",
							["sticky"] = true,
							["color"] = "ff00ff",
							["class"] = "PRIEST",
							["icon"] = 15326,
							["conditions"] = {
								["Target debuff gain"] = "Blackout",
							},
						}, -- [2]
						{
							["name"] = "! Clearcast !",
							["sticky"] = true,
							["color"] = "00ffc8",
							["class"] = "MAGE;PRIEST;SHAMAN",
							["icon"] = 34754,
							["conditions"] = {
								["Self buff gain"] = "Clearcast",
							},
						}, -- [3]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Gegenangriff",
							},
							["name"] = "Gegenangriff!",
							["sticky"] = true,
							["color"] = "ffff00",
							["class"] = "HUNTER",
							["icon"] = 27067,
							["conditions"] = {
								["Incoming Parry"] = true,
							},
						}, -- [4]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Hinrichten",
							},
							["name"] = "Hinrichten!",
							["sticky"] = true,
							["color"] = "ffff00",
							["class"] = "WARRIOR",
							["icon"] = 25236,
							["conditions"] = {
								["Enemy target health percent"] = 0.19,
							},
						}, -- [5]
						{
							["name"] = "! Frostbite !",
							["sticky"] = true,
							["color"] = "0000ff",
							["class"] = "MAGE",
							["icon"] = 12497,
							["conditions"] = {
								["Target debuff gain"] = "Frostbite",
							},
						}, -- [6]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Hammer des Zorns",
							},
							["name"] = "Hammer des Zorns!",
							["sticky"] = true,
							["color"] = "ffff00",
							["class"] = "PALADIN",
							["icon"] = 27180,
							["conditions"] = {
								["Enemy target health percent"] = 0.2,
							},
						}, -- [7]
						{
							["name"] = "Einschlag!",
							["sticky"] = true,
							["color"] = "ff0000",
							["class"] = "MAGE",
							["icon"] = 11103,
							["conditions"] = {
								["Target debuff gain"] = "Einschlag",
							},
						}, -- [8]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Fass!",
							},
							["conditions"] = {
								["Outgoing crit"] = true,
							},
							["disabled"] = true,
							["class"] = "HUNTER",
							["color"] = "ff0000",
							["sticky"] = true,
							["icon"] = 34026,
							["name"] = "Fass!!",
						}, -- [9]
						{
							["secondaryConditions"] = {
								["Trigger cooldown"] = 3,
							},
							["name"] = "Niedrige Gesundheit!",
							["color"] = "ff7f7f",
							["class"] = "DRUID;HUNTER;MAGE;PALADIN;PRIEST;ROGUE;SHAMAN;WARLOCK;WARRIOR",
							["conditions"] = {
								["Self health percent"] = 0.4,
							},
							["sticky"] = true,
						}, -- [10]
						{
							["secondaryConditions"] = {
								["Trigger cooldown"] = 3,
							},
							["name"] = "Niedriges Mana!",
							["color"] = "7f7fff",
							["class"] = "DRUID;HUNTER;MAGE;PALADIN;PRIEST;SHAMAN;WARLOCK",
							["conditions"] = {
								["Self mana percent"] = 0.35,
							},
							["sticky"] = true,
						}, -- [11]
						{
							["secondaryConditions"] = {
								["Trigger cooldown"] = 3,
							},
							["name"] = "Niedrige Begleitergesundheit!",
							["color"] = "ff7f7f",
							["class"] = "HUNTER;MAGE;WARLOCK",
							["conditions"] = {
								["Pet health percent"] = 0.4,
							},
						}, -- [12]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Mungobiss",
							},
							["name"] = "Mungobiss!",
							["sticky"] = true,
							["color"] = "ffff00",
							["class"] = "HUNTER",
							["icon"] = 36916,
							["conditions"] = {
								["Incoming Dodge"] = true,
							},
						}, -- [13]
						{
							["name"] = "Einbruch der Nacht!",
							["sticky"] = true,
							["color"] = "7f007f",
							["class"] = "WARLOCK",
							["icon"] = 18095,
							["conditions"] = {
								["Self buff gain"] = "Schattentrance",
							},
						}, -- [14]
						{
							["conditions"] = {
								["Self buff gain"] = "Woge des Lichts",
							},
							["name"] = "Freier",
							["class"] = "PRIEST",
							["color"] = "ff0000",
							["sticky"] = true,
							["icon"] = 25364,
							["disabled"] = true,
						}, -- [15]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Überwältigen",
							},
							["name"] = "Überwältigen!",
							["sticky"] = true,
							["color"] = "7f007f",
							["class"] = "WARRIOR",
							["icon"] = 11585,
							["conditions"] = {
								["Outgoing Dodge"] = true,
							},
						}, -- [16]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Toben",
								["Buff inactive"] = "Toben",
								["Minimum power amount"] = 20,
							},
							["name"] = "Toben!",
							["sticky"] = true,
							["color"] = "ff0000",
							["class"] = "WARRIOR",
							["icon"] = 29801,
							["conditions"] = {
								["Outgoing crit"] = true,
							},
						}, -- [17]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Rache",
								["Warrior stance"] = "Defensive Stance",
							},
							["conditions"] = {
								["Incoming Block"] = true,
								["Incoming Dodge"] = true,
								["Incoming Parry"] = true,
							},
							["disabled"] = true,
							["class"] = "WARRIOR",
							["color"] = "ffff00",
							["sticky"] = true,
							["icon"] = 30357,
							["name"] = "Rache!",
						}, -- [18]
						{
							["secondaryConditions"] = {
								["Spell ready"] = "Riposte",
							},
							["name"] = "Riposte!",
							["sticky"] = true,
							["color"] = "ffff00",
							["class"] = "ROGUE",
							["icon"] = 14251,
							["conditions"] = {
								["Incoming Parry"] = true,
							},
						}, -- [19]
						{
							["name"] = "Waffe des Mahlstroms!",
							["sticky"] = true,
							["color"] = "0000ff",
							["class"] = "SHAMAN",
							["icon"] = 51532,
							["conditions"] = {
								["Self buff stacks gain"] = "Waffe des Mahlstroms,5",
							},
						}, -- [20]
						{
							["name"] = "Todestrance!!",
							["sticky"] = true,
							["color"] = "ff0000",
							["class"] = "DEATHKNIGHT",
							["icon"] = 50466,
							["conditions"] = {
								["Self buff gain"] = "Todestrance!",
							},
						}, -- [21]
						{
							["name"] = "Gefrierender Nebel!",
							["sticky"] = true,
							["color"] = "0000ff",
							["class"] = "DEATHKNIGHT",
							["icon"] = 59052,
							["conditions"] = {
								["Self buff gain"] = "Gefrierender Nebel",
							},
						}, -- [22]
						{
							["name"] = "Tötungsmaschine!",
							["sticky"] = true,
							["color"] = "0000ff",
							["class"] = "DEATHKNIGHT",
							["icon"] = 51130,
							["conditions"] = {
								["Self buff gain"] = "Tötungsmaschine",
							},
						}, -- [23]
						{
							["conditions"] = {
								["Incoming Parry"] = true,
								["Incoming Dodge"] = true,
							},
							["disabled"] = true,
							["class"] = "DEATHKNIGHT",
							["color"] = "0000ff",
							["sticky"] = true,
							["icon"] = 56816,
							["name"] = "Runenstoß!",
						}, -- [24]
						{
							["name"] = "Pyro ! -> PEW PEW !",
							["color"] = "ff40ff",
							["conditions"] = {
								["Self buff gain"] = "Hot Streak",
							},
							["class"] = "DRUID;HUNTER;MAGE;PALADIN;PRIEST;ROGUE;SHAMAN;WARLOCK;WARRIOR",
							["sticky"] = true,
						}, -- [25]
					},
				},
			},
		},
	},
	["account"] = {
		["firstTimeWoW21"] = true,
	},
	["profiles"] = {
		["Default"] = {
			["gameDamage"] = true,
		},
	},
}
