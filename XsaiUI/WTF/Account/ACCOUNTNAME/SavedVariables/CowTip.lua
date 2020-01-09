
CowTipDB = {
	["namespaces"] = {
		["HealthBar"] = {
			["profiles"] = {
				["Default"] = {
					["texture"] = "Ruben",
					["position"] = "BOTTOM",
					["size"] = 10,
				},
			},
		},
		["Appearance"] = {
			["profiles"] = {
				["Default"] = {
					["bgColor"] = {
						["other"] = {
							0.07843137254901961, -- [1]
							0.07843137254901961, -- [2]
							0.07843137254901961, -- [3]
							0.5600000023841858, -- [4]
						},
						["guild"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.6299999952316284, -- [4]
						},
						["hostilePC"] = {
							0.6588235294117647, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.550000011920929, -- [4]
						},
						["friendlyNPC"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.6200000047683716, -- [4]
						},
						["tapped"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.7599999904632568, -- [4]
						},
						["neutralNPC"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.7599999904632568, -- [4]
						},
						["faction"] = {
							0.2588235294117647, -- [1]
							0.2588235294117647, -- [2]
							0.2588235294117647, -- [3]
							0.5899999737739563, -- [4]
						},
						["friendlyPC"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.5799999833106995, -- [4]
						},
						["dead"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.5999999642372131, -- [4]
						},
						["hostileNPC"] = {
							0.2117647058823529, -- [1]
							0.2117647058823529, -- [2]
							0.2117647058823529, -- [3]
							0.7599999904632568, -- [4]
						},
					},
					["edgeSize"] = 10,
					["background"] = "tap3",
					["borderColor"] = {
						0.5019607843137255, -- [1]
						0.5019607843137255, -- [2]
						0.5019607843137255, -- [3]
					},
					["scale"] = 1.1,
					["padding"] = 1,
					["border"] = "Blizzard Dialog",
					["font"] = "CAFETA__",
				},
			},
		},
		["Position"] = {
			["profiles"] = {
				["Default"] = {
					["frameOffsetY"] = 30,
					["unitAnchor"] = "CURSOR_BOTTOMLEFT",
					["frameAnchor"] = "CURSOR_BOTTOMLEFT",
					["unitOffsetX"] = 25,
					["frameOffsetX"] = 25,
					["unitOffsetY"] = 30,
				},
			},
		},
		["Text"] = {
			["profiles"] = {
				["Default"] = {
					["lefts"] = {
						"[Outline][(IsPlayer ? Name:ClassColor ! Name:HostileColor)]", -- [1]
						"[Zone || (Exists(unit=Target) ? 'Target:')]", -- [2]
						"[(if Guild = 'player':Guild then Green end) Guild]", -- [3]
						"", -- [4]
						"", -- [5]
						"", -- [6]
						"", -- [7]
						"", -- [8]
						"", -- [9]
						"", -- [10]
						"", -- [11]
						"", -- [12]
						nil, -- [13]
						nil, -- [14]
						"", -- [15]
						"", -- [16]
					},
					["rights"] = {
						"[(if IsEnemy('mouseover') then Level ? DifficultyColor end) (if IsPlayer('player') then Level:ClassColor end)]", -- [1]
						"[(Target:IsPlayer ? ClassColor(unit=Target) ! (not Target:IsPlayer & Target:IsEnemy) ? Color(\"dddddd\")) (IsUnit('player', Target) ? ClassColor(\"\") '<<You>>' ! Target:NameRealm)]", -- [2]
						"[GuildRank]", -- [3]
						"", -- [4]
						"", -- [5]
						"", -- [6]
						"", -- [7]
						"", -- [8]
						"", -- [9]
						" ", -- [10]
						"", -- [11]
						"", -- [12]
						nil, -- [13]
						nil, -- [14]
						"", -- [15]
						"", -- [16]
					},
				},
			},
		},
		["PowerBar"] = {
			["profiles"] = {
				["Default"] = {
					["position"] = "LEFT",
					["texture"] = "DsmV7",
				},
			},
		},
		["Fade"] = {
			["profiles"] = {
				["Default"] = {
					["units"] = "hide",
				},
			},
		},
	},
	["profiles"] = {
		["Default"] = {
			["hidden"] = true,
		},
	},
	["disabledModules"] = {
		["Default"] = {
			["PowerBar"] = true,
		},
	},
}
