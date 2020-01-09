
PitBullDB = {
	["disabledModules"] = {
		["Default"] = {
			["CombatFader"] = true,
			["EstimatedHeals"] = true,
			["Highlight"] = true,
			["InteractLines"] = true,
			["Portrait"] = false,
			["BarFader"] = true,
			["Spark"] = true,
		},
		["badrasta 1280x768"] = {
			["Portrait"] = false,
		},
	},
	["namespaces"] = {
		["BarFader"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["target"] = {
							["smooth"] = true,
							["fade"] = true,
						},
						["player"] = {
							["fade"] = true,
							["smooth"] = true,
						},
					},
					["fadetime"] = 0.1,
				},
				["badrasta 1280x768"] = {
					["color"] = {
						0, -- [1]
						0.8, -- [2]
						0, -- [3]
						0.5, -- [4]
					},
					["groups"] = {
						["target"] = {
						},
						["player"] = {
						},
						["targettarget"] = {
						},
					},
					["fadetime"] = 0.5,
				},
			},
		},
		["MasterLooter"] = {
			["profiles"] = {
				["Default"] = {
					["raid"] = {
						["disable"] = true,
					},
					["player"] = {
						["disable"] = true,
					},
					["party"] = {
						["disable"] = true,
					},
				},
			},
		},
		["CombatIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["groups"] = {
						["target"] = {
							["disable"] = true,
						},
						["party"] = {
							["disable"] = true,
						},
						["player"] = {
							["disable"] = true,
						},
					},
				},
				["Default"] = {
					["groups"] = {
						["party"] = {
							["disable"] = true,
						},
						["target"] = {
							["disable"] = true,
						},
						["player"] = {
							["disable"] = true,
						},
					},
				},
				["badrasta 1280x768"] = {
					["groups"] = {
						["target"] = {
							["disable"] = true,
						},
						["player"] = {
							["disable"] = true,
						},
						["targettarget"] = {
							["disable"] = true,
						},
						["party"] = {
							["disable"] = true,
						},
					},
				},
			},
		},
		["RaidTarget"] = {
			["profiles"] = {
				["Default"] = {
					["maintank"] = {
						["disable"] = true,
					},
					["pet"] = {
						["disable"] = true,
					},
					["player"] = {
						["disable"] = true,
					},
				},
			},
		},
		["Spark"] = {
			["profiles"] = {
				["badrasta 1280x768"] = {
					["color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						0.3, -- [4]
					},
					["enable"] = true,
				},
			},
		},
		["Power"] = {
			["profiles"] = {
				["Default"] = {
					["targettargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["partytarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
							},
							["mana"] = {
								0.611764705882353, -- [1]
								0.4901960784313725, -- [2]
								0.203921568627451, -- [3]
							},
							["energy"] = {
								1, -- [1]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["party"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["mainassist"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["focus"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["target"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["raid"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
						["hideNoMana"] = false,
					},
					["raidtarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.3843137254901961, -- [1]
								0.4745098039215686, -- [2]
								1, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["focustarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["targettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
						["hidden"] = false,
					},
					["partypet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["player"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["pet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["maintanktargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.3843137254901961, -- [1]
								0.4745098039215686, -- [2]
								1, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["maintank"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.1882352941176471, -- [1]
								0.4431372549019608, -- [2]
								0.7490196078431373, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["maintanktarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.3843137254901961, -- [1]
								0.4745098039215686, -- [2]
								1, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
					["raidpet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.1764705882352941, -- [2]
								0.2941176470588235, -- [3]
							},
							["mana"] = {
								0.3843137254901961, -- [1]
								0.4745098039215686, -- [2]
								1, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8627450980392157, -- [2]
								0.09803921568627451, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
						},
					},
				},
			},
		},
		["Layout-ABF"] = {
			["profiles"] = {
				["Default"] = {
					["partytarget"] = {
						["classTextCustom"] = "",
						["powerBarHeight"] = 1,
						["portraitSide"] = "top",
						["healthTextStyle"] = "Percent",
						["classTextStyle"] = "Hide",
						["powerTextPosition"] = "hide",
						["portraitHeight"] = 12,
						["healthBarHeight"] = 3,
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["pet"] = {
						["classTextCustom"] = "",
						["powerBarHeight"] = 1,
						["nameTextSize"] = 1.21,
						["healthTextSize"] = 1.25,
						["powerTextCustom"] = "",
						["powerTextStyle"] = "Hide",
						["classTextStyle"] = "Hide",
						["powerTextPosition"] = "hide",
						["classTextPosition"] = "hide",
						["healthTextStyle"] = "Percent",
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["targettarget"] = {
						["classTextCustom"] = "",
						["powerBarHeight"] = 1,
						["nameTextSize"] = 1.24,
						["healthTextSize"] = 1.22,
						["portraitSide"] = "right",
						["healthTextStyle"] = "Percent",
						["classTextStyle"] = "Hide",
						["powerTextPosition"] = "hide",
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["player"] = {
						["powerTextSize"] = 1.2,
						["powerBarHeight"] = 2,
						["nameTextSize"] = 1.44,
						["healthTextSize"] = 1.44,
						["auraSide"] = "top",
						["healthTextStyle"] = "Absolute",
						["classTextSize"] = 1.16,
						["healthTextCustom"] = "[Status:SureHP:PercentHP:Percent]",
						["healthBarHeight"] = 3,
						["combatTextPosition"] = "healthBar-center",
						["castBarHeight"] = 5,
						["nameTextCustom"] = "[Name] [AFKDND:Angle]",
					},
					["maintanktarget"] = {
						["healthTextStyle"] = "Percent",
						["healthBarHeight"] = 12,
						["powerBarHeight"] = 1,
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["maintank"] = {
						["healthTextStyle"] = "Percent",
						["powerBarHeight"] = 1,
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["target"] = {
						["combatTextPosition"] = "healthBar-center",
						["powerBarHeight"] = 2,
						["nameTextSize"] = 1.44,
						["healthTextSize"] = 1.44,
						["auraSide"] = "top",
						["healthTextStyle"] = "Absolute and Percent",
						["classTextSize"] = 1.2,
						["portraitHeight"] = 6,
						["healthBarHeight"] = 3,
						["healthTextCustom"] = "[~Status?FractionalHP:Short] || [Status:PercentHP:Percent]",
						["powerTextSize"] = 1.2,
						["nameTextCustom"] = "[Name] [AFKDND:Angle]",
					},
					["raid"] = {
						["classTextCustom"] = "",
						["powerBarHeight"] = 1,
						["nameTextSize"] = 1.15,
						["healthTextSize"] = 1.15,
						["auraSide"] = "topright",
						["healthTextStyle"] = "Percent",
						["classTextStyle"] = "Hide",
						["powerTextPosition"] = "hide",
						["healthTextCustom"] = "[Status:PercentHP:Percent]",
					},
					["maintanktargettarget"] = {
						["healthBarHeight"] = 12,
						["powerBarHeight"] = 1,
					},
					["party"] = {
						["combatTextPosition"] = "healthBar-center",
						["powerBarHeight"] = 2,
						["nameTextSize"] = 1.44,
						["healthTextSize"] = 1.44,
						["healthTextStyle"] = "Absolute",
						["healthTextCustom"] = "[Status:SureHP:PercentHP:Percent]",
						["healthBarHeight"] = 3,
						["powerTextSize"] = 1.21,
						["debuffSide"] = "bottom",
						["classTextSize"] = 1.17,
					},
				},
			},
		},
		["MasterLooterIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["party"] = {
						["disable"] = true,
					},
					["raid"] = {
						["disable"] = true,
					},
					["player"] = {
						["disable"] = true,
					},
				},
				["Default"] = {
					["party"] = {
						["disable"] = true,
					},
					["raid"] = {
						["disable"] = true,
					},
					["player"] = {
						["disable"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["party"] = {
						["disable"] = true,
					},
					["player"] = {
						["disable"] = true,
					},
					["raid"] = {
						["disable"] = true,
					},
				},
			},
		},
		["Health"] = {
			["profiles"] = {
				["Default"] = {
					["party"] = {
						["customColors"] = {
							0.7686274509803921, -- [1]
							0.6352941176470588, -- [2]
							0.3137254901960784, -- [3]
						},
						["customColor"] = true,
					},
					["maintanktarget"] = {
						["classColor"] = false,
						["hostilityColorNPCs"] = true,
						["hostilityColor"] = true,
					},
					["player"] = {
						["customColors"] = {
							0.4156862745098039, -- [1]
							0.403921568627451, -- [2]
							0.4156862745098039, -- [3]
						},
						["customColor"] = true,
					},
					["target"] = {
						["customColors"] = {
							0.4156862745098039, -- [1]
							0.403921568627451, -- [2]
							0.4156862745098039, -- [3]
						},
						["customColor"] = true,
					},
					["maintank"] = {
						["classColor"] = false,
					},
					["pet"] = {
						["classColor"] = false,
						["happinessColor"] = false,
					},
					["targettarget"] = {
						["customColors"] = {
							0.8313725490196078, -- [1]
							0.2941176470588235, -- [2]
							0.1137254901960784, -- [3]
						},
						["customColor"] = true,
					},
				},
			},
		},
		["CombatText"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["groups"] = {
						["player"] = {
							["font"] = "bad large",
							["fontheight"] = 12,
							["ignore"] = false,
						},
						["party"] = {
							["fontheight"] = 15,
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["font"] = "bad large",
							["fontheight"] = 18,
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
							["fontheight"] = 8,
						},
					},
				},
				["Default"] = {
					["groups"] = {
						["party"] = {
							["fontheight"] = 15,
							["ignore"] = true,
						},
						["player"] = {
							["font"] = "bad large",
							["fontheight"] = 12,
							["ignore"] = false,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["font"] = "bad large",
							["fontheight"] = 18,
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
							["fontheight"] = 8,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
					},
				},
				["badrasta 1280x768"] = {
					["groups"] = {
						["player"] = {
							["font"] = "bad large",
							["ignore"] = false,
							["fontheight"] = 12,
						},
						["maintank"] = {
							["font"] = "Friz Quadrata TT",
							["fontheight"] = 13,
							["ignore"] = true,
						},
						["focus"] = {
							["font"] = "Friz Quadrata TT",
							["fontheight"] = 13,
							["ignore"] = true,
						},
						["target"] = {
							["font"] = "bad large",
							["ignore"] = true,
							["fontheight"] = 18,
						},
						["raid"] = {
							["font"] = "Friz Quadrata TT",
							["fontheight"] = 8,
							["ignore"] = true,
						},
						["pet"] = {
							["font"] = "Friz Quadrata TT",
							["fontheight"] = 13,
							["ignore"] = true,
						},
						["party"] = {
							["font"] = "Friz Quadrata TT",
							["ignore"] = true,
							["fontheight"] = 15,
						},
					},
				},
			},
		},
		["InteractLines"] = {
		},
		["ReadyCheckIcon"] = {
			["profiles"] = {
				["badrasta 1280x768"] = {
					["target"] = {
						["disable"] = false,
					},
					["player"] = {
						["disable"] = false,
					},
					["targettarget"] = {
						["disable"] = false,
					},
				},
			},
		},
		["MetaLayout"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["targettargettarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Name"] = {
								["size"] = 1.28,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["style"] = "Percent",
								["custom"] = "[Status:PercentHP:Percent]",
								["size"] = 1.28,
							},
							["Power"] = {
								["hidden"] = true,
							},
						},
					},
					["partytarget"] = {
						["bars"] = {
							["healthBar"] = {
								["height"] = 8,
							},
							["powerBar"] = {
								["height"] = 2,
							},
						},
						["icons"] = {
							["raidTargetIcon"] = {
								["size"] = 0.88,
								["position"] = "frame-edgetopleft",
							},
						},
						["texts"] = {
							["Health"] = {
								["style"] = "Percent",
								["custom"] = "[Status:PercentHP:Percent]",
								["size"] = 1.26,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["style"] = "Class Colored",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["size"] = 1.26,
							},
							["Power"] = {
								["hidden"] = true,
							},
						},
					},
					["pet"] = {
						["bars"] = {
							["healthBar"] = {
								["height"] = 12,
							},
							["powerBar"] = {
								["height"] = 2,
							},
							["blankSpace"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["hp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Standard",
								["position"] = "powerBar-left",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["hidden"] = true,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Absolute",
								["position"] = "powerBar-right",
								["custom"] = "[CurMP]/[MaxMP]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Percent",
								["position"] = "healthBar-right",
								["custom"] = "[Status:PercentHP:Percent]",
								["hidden"] = true,
								["size"] = 1.21,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "healthBar-center",
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["hidden"] = false,
								["size"] = 0.75,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [[CastEndTime-CurrentTime]:Round>=0)]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["targettarget"] = {
						["bars"] = {
							["healthBar"] = {
								["height"] = 3,
							},
							["blankSpace"] = {
								["height"] = 1,
								["alpha"] = 0.9,
								["bgAlpha"] = 0.45,
							},
							["portrait"] = {
								["side"] = "right",
							},
							["powerBar"] = {
								["height"] = 3,
							},
							["expBar"] = {
								["height"] = 1,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["Power"] = {
								["custom"] = "[~HasNoMP?CurMP:Short:Color(81BEF7)] || [MaxMP:Short:Color(0174DF)]",
								["position"] = "frame-edgebottom",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
							},
							["Class"] = {
								["custom"] = "",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 0.9500000000000001,
							},
							["name mid"] = {
								["position"] = "frame-outbottom",
								["style"] = "Hide",
								["size"] = 2.25,
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["Health"] = {
								["hidden"] = true,
								["style"] = "Custom",
								["custom"] = "[CurHP:Short:HideZero:HPColor] || [Dead?Text(Dead):Gray!Offline?Text(Offline):Gray!MaxHP:Short:Color(38610B)]",
								["position"] = "frame-outbottomright",
							},
							["combatText"] = {
								["position"] = "healthBar-outright",
							},
							["status"] = {
								["position"] = "frame-edgebottomleft",
							},
							["Experience"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["custom"] = "[Name or Status:ClassColor]",
								["style"] = "Custom",
								["position"] = "healthBar-center",
							},
							["hp perc"] = {
								["position"] = "healthBar-left",
							},
						},
					},
					["player"] = {
						["bars"] = {
							["portrait"] = {
								["height"] = 12,
								["side"] = "right",
								["reverse"] = true,
							},
							["blankSpace"] = {
								["height"] = 1,
								["alpha"] = 0.9,
								["bgAlpha"] = 0.45,
							},
							["healthBar"] = {
								["height"] = 12,
							},
							["powerBar"] = {
								["height"] = 10,
							},
							["expBar"] = {
								["height"] = 1,
							},
						},
						["debuffSide"] = "bottomright",
						["buffSide"] = "left",
						["auraSide"] = "top",
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Hide",
								["position"] = "frame-inbottomright",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "frame-edgetop",
								["custom"] = "[if HasThreat then Threat:Short]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Custom",
								["position"] = "frame-outbottomleft",
								["custom"] = "[MaxMP:Short:PowerColor]/[Status or MP:Short:PowerColor]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "[~IsMouseOver?FractionalRep] [~IsMouseOver?PercentRep:Percent:Paren!RepName]",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "[~IsMaxMP?Status:PercentMP:Percent]",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "frame-intop",
								["custom"] = "[Name] [AFKDND:Angle]",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[HP:Short:HPColor]/[MaxHP:Short:HPColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-left",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "health",
								["custom"] = "[Dead] [~IsMaxHP ? Status:PercentHP:Percent]",
								["position"] = "powerBar-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.85,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
					["party"] = {
						["buffSide"] = "right",
						["bars"] = {
							["healthBar"] = {
								["height"] = 10,
							},
							["powerBar"] = {
								["height"] = 5,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.71,
							},
						},
						["texts"] = {
							["Threat"] = {
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
								["size"] = 1.23,
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
							},
							["Class"] = {
								["hidden"] = true,
								["size"] = 1.14,
							},
							["range"] = {
								["position"] = "frame-edgeright",
							},
							["name mid"] = {
								["custom"] = "[Outline][~IsMaxHP?PercentHP:Short:Percent:HPColor]",
								["hidden"] = false,
								["position"] = "healthBar-right",
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["Health"] = {
								["custom"] = "[Outline][~IsMaxHP?CurHP:VeryShort:HideZero:HPColor]",
								["position"] = "healthBar-outright",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.18,
							},
							["status"] = {
								["position"] = "healthBar-left",
								["custom"] = "[Status]",
								["size"] = 1.14,
							},
							["name midd"] = {
								["position"] = "frame-intop",
							},
							["Name"] = {
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["size"] = 1.28,
							},
						},
					},
					["maintanktarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["custom"] = "[PercentHP:Percent]",
								["style"] = "Custom",
								["size"] = 1.19,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["size"] = 1.02,
							},
						},
					},
					["focus"] = {
						["bars"] = {
							["portrait"] = {
								["side"] = "center",
							},
							["expBar"] = {
								["height"] = 1,
								["position"] = 3,
							},
							["healthBar"] = {
								["height"] = 1,
								["position"] = 8,
							},
							["blankSpace"] = {
								["height"] = 1,
								["position"] = 6,
							},
							["threatBar"] = {
								["position"] = 5,
							},
							["druidManaBar"] = {
								["position"] = 2,
							},
							["powerBar"] = {
								["height"] = 2,
								["position"] = 7,
							},
							["repBar"] = {
								["position"] = 4,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["Threat"] = {
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["range"] = {
								["position"] = "frame-outbottom",
							},
							["name mid"] = {
								["position"] = "healthBar-right",
								["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
								["hidden"] = false,
								["size"] = 1.26,
							},
							["Health"] = {
								["hidden"] = true,
							},
							["combatText"] = {
								["position"] = "healthBar-outleft",
							},
							["Experience"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["position"] = "frame-outtop",
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["size"] = 0.75,
							},
						},
					},
					["target"] = {
						["buffSide"] = "top",
						["debuffSide"] = "top",
						["auraSide"] = "top",
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 1,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 12,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 2,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 8,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 10,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 5,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 4,
							},
							["blankSpace"] = {
								["bgAlpha"] = 0.45,
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 1,
								["alpha"] = 0.9,
								["hidden"] = true,
								["reverse"] = false,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 6,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 3,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 9,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 10,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Custom",
								["position"] = "powerBar-left",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "[Classification] [Level:DifficultyColor] [(if IsPlayer then\n    Class\nend):ClassColor] [DruidForm:Paren]",
								["hidden"] = false,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-right",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["hidden"] = true,
								["size"] = 1.3,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "[TalentTree]",
								["position"] = "powerBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[(Status or MP:Short:PowerColor)]/[MaxMP:Short:PowerColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "power",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[MaxHP:Short:HPColor]/[HP:Short:HPColor]",
								["position"] = "frame-outbottomleft",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Outline Name] [(AFK or DND):Angle]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "powerBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["raid"] = {
						["buffSide"] = "left",
						["debuffSide"] = "bottom",
						["bars"] = {
							["healthBar"] = {
								["height"] = 7,
							},
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["auraSide"] = "topleft",
						["icons"] = {
							["leaderIcon"] = {
								["position"] = "frame-outleft",
								["size"] = 0.5,
							},
							["raidTargetIcon"] = {
								["position"] = "frame-center",
								["size"] = 0.72,
							},
						},
						["texts"] = {
							["Threat"] = {
								["position"] = "frame-inbottomright",
								["hidden"] = true,
								["size"] = 1.07,
							},
							["buff"] = {
								["position"] = "healthBar-center",
								["style"] = "Hide",
								["hidden"] = false,
								["size"] = 0.55,
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["hidden"] = true,
							},
							["Class"] = {
								["custom"] = "[RaidGroup]",
								["hidden"] = true,
								["style"] = "Custom",
								["size"] = 1.16,
							},
							["range"] = {
								["position"] = "healthBar-outleft",
								["custom"] = "[Range?Text(r)]",
								["size"] = 0.64,
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["Health"] = {
								["custom"] = "[if HP = MaxHP then\n    MaxHP:VeryShort:HPColor\nelse\n    HP:VeryShort:HPColor\nend]",
								["style"] = "Custom",
								["size"] = 0.92,
							},
							["combatText"] = {
								["position"] = "frame-outleft",
							},
							["status"] = {
								["position"] = "healthBar-left",
								["custom"] = "[(HasAura('Prayer of Fortitude') or HasAura('Power Word: Fortitude') ? 'F ':Color('FFFFFF')) (HasAura('Arcane Brilliance') or HasAura('Arcane Intellect') ? 'I ':Color('00FFFF')) (HasAura('Gift of the Wild') or HasAura('Mark of the Wild') ? 'M ':Color('FFAA00'))]",
								["hidden"] = false,
								["size"] = 0.6699999999999999,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["position"] = "frame-center",
								["style"] = "Custom",
								["custom"] = "[Status or Name:ClassColor]",
								["size"] = 0.92,
							},
						},
					},
					["maintank"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["style"] = "Custom",
								["custom"] = "[~Dead?~IsMaxHP?PercentHP:Round:Percent:HPColor]",
								["size"] = 1.05,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["style"] = "Class Colored",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["size"] = 1.02,
							},
						},
					},
					["maintanktargettarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["style"] = "Custom",
								["custom"] = "[PercentHP:Percent]",
								["size"] = 1.19,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["size"] = 1.02,
							},
						},
					},
				},
				["Default"] = {
					["targettargettarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["style"] = "Percent",
								["custom"] = "[Status:PercentHP:Percent]",
								["size"] = 1.28,
							},
							["Name"] = {
								["size"] = 1.28,
							},
						},
					},
					["partytarget"] = {
						["bars"] = {
							["healthBar"] = {
								["height"] = 8,
							},
							["powerBar"] = {
								["height"] = 2,
							},
						},
						["icons"] = {
							["raidTargetIcon"] = {
								["size"] = 0.88,
								["position"] = "frame-edgetopleft",
							},
						},
						["texts"] = {
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["style"] = "Class Colored",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["size"] = 1.26,
							},
							["Health"] = {
								["style"] = "Percent",
								["custom"] = "[Status:PercentHP:Percent]",
								["size"] = 1.26,
							},
						},
					},
					["targettarget"] = {
						["bars"] = {
							["portrait"] = {
								["side"] = "right",
							},
							["healthBar"] = {
								["height"] = 3,
							},
							["expBar"] = {
								["height"] = 1,
							},
							["blankSpace"] = {
								["bgAlpha"] = 0.45,
								["height"] = 1,
								["alpha"] = 0.9,
							},
							["powerBar"] = {
								["height"] = 3,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["hp perc"] = {
								["position"] = "healthBar-left",
							},
							["Class"] = {
								["custom"] = "",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 0.9500000000000001,
							},
							["name mid"] = {
								["style"] = "Hide",
								["position"] = "frame-outbottom",
								["size"] = 2.25,
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["status"] = {
								["position"] = "frame-edgebottomleft",
							},
							["Power"] = {
								["custom"] = "[~HasNoMP?CurMP:Short:Color(81BEF7)] || [MaxMP:Short:Color(0174DF)]",
								["position"] = "frame-edgebottom",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["Name"] = {
								["custom"] = "[Outline][(Name or Status:ClassColor)]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
							},
							["combatText"] = {
								["position"] = "healthBar-outright",
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
							},
							["Health"] = {
								["custom"] = "[CurHP:Short:HideZero:HPColor] || [Dead?Text(Dead):Gray!Offline?Text(Offline):Gray!MaxHP:Short:Color(38610B)]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = true,
							},
							["Experience"] = {
								["hidden"] = true,
							},
						},
					},
					["pet"] = {
						["bars"] = {
							["healthBar"] = {
								["height"] = 12,
							},
							["blankSpace"] = {
								["height"] = 1,
							},
							["powerBar"] = {
								["height"] = 7,
							},
						},
						["texts"] = {
							["buff"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Standard",
								["position"] = "powerBar-left",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["hidden"] = true,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Absolute",
								["position"] = "powerBar-right",
								["custom"] = "[if HasMP then FractionalMP]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["hppercent"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "healthBar-center",
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["hidden"] = false,
								["size"] = 0.75,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Percent",
								["position"] = "healthBar-right",
								["custom"] = "[Status:PercentHP:Percent]",
								["hidden"] = true,
								["size"] = 1.21,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [[CastEndTime-CurrentTime]:Round>=0)]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
					["player"] = {
						["auraSide"] = "top",
						["debuffSide"] = "bottomright",
						["bars"] = {
							["healthBar"] = {
								["height"] = 12,
							},
							["portrait"] = {
								["side"] = "right",
								["reverse"] = true,
								["height"] = 12,
							},
							["expBar"] = {
								["height"] = 1,
							},
							["blankSpace"] = {
								["bgAlpha"] = 0.45,
								["height"] = 1,
								["alpha"] = 0.9,
							},
							["powerBar"] = {
								["height"] = 10,
							},
						},
						["buffSide"] = "left",
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Hide",
								["position"] = "frame-inbottomright",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "frame-edgetop",
								["custom"] = "[if HasThreat then Threat:Short]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Custom",
								["position"] = "frame-outbottomleft",
								["custom"] = "[Outline MaxMP:Short:PowerColor]/[Status or MP:Short:PowerColor]",
								["hidden"] = false,
								["size"] = 0.9500000000000001,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "[~IsMouseOver?FractionalRep] [~IsMouseOver?PercentRep:Percent:Paren!RepName]",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "[~IsMaxMP?Status:PercentMP:Percent]",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["hppercent"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[Outline HP:Short:HPColor]/[MaxHP:Short:HPColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.9500000000000001,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "frame-intop",
								["custom"] = "[Name] [AFKDND:Angle]",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-left",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "health",
								["custom"] = "[Dead] [~IsMaxHP ? Status:PercentHP:Percent]",
								["position"] = "powerBar-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.85,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
					["party"] = {
						["buffSide"] = "right",
						["bars"] = {
							["healthBar"] = {
								["height"] = 10,
							},
							["powerBar"] = {
								["height"] = 5,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.71,
							},
						},
						["texts"] = {
							["buff"] = {
								["custom"] = "[Outline (HasAura('Dalaran Intellect') or HasAura('Dalaran Brilliance') HasAura('Arcane Brilliance') HasAura('Arcane Intellect') ? \".\":Color(\"66ccff\"))]\n",
								["position"] = "healthBar-left",
								["hidden"] = false,
								["size"] = 1.6,
							},
							["Class"] = {
								["hidden"] = true,
								["size"] = 1.14,
							},
							["range"] = {
								["position"] = "frame-edgeright",
							},
							["name mid"] = {
								["custom"] = "[Outline][~IsMaxHP?PercentHP:Short:Percent:HPColor]",
								["position"] = "healthBar-right",
								["hidden"] = false,
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["status"] = {
								["custom"] = "[Status]",
								["position"] = "frame-intopleft",
								["size"] = 1.14,
							},
							["name midd"] = {
								["position"] = "frame-inright",
							},
							["Threat"] = {
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
								["size"] = 1.23,
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
							},
							["Health"] = {
								["custom"] = "[Outline][~IsMaxHP?CurHP:VeryShort:HideZero:HPColor]",
								["position"] = "healthBar-outright",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.18,
							},
							["Name"] = {
								["style"] = "Custom",
								["position"] = "healthBar-center",
								["custom"] = "[Outline][Name]",
								["size"] = 1.28,
							},
						},
					},
					["maintanktargettarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["size"] = 1.02,
							},
							["Health"] = {
								["style"] = "Custom",
								["custom"] = "[PercentHP:Percent]",
								["size"] = 1.19,
							},
						},
					},
					["focus"] = {
						["bars"] = {
							["healthBar"] = {
								["position"] = 8,
								["height"] = 1,
							},
							["portrait"] = {
								["side"] = "center",
							},
							["expBar"] = {
								["position"] = 3,
								["height"] = 1,
							},
							["blankSpace"] = {
								["position"] = 6,
								["height"] = 1,
							},
							["threatBar"] = {
								["position"] = 5,
							},
							["druidManaBar"] = {
								["position"] = 2,
							},
							["powerBar"] = {
								["position"] = 7,
								["height"] = 2,
							},
							["repBar"] = {
								["position"] = 4,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["Class"] = {
								["hidden"] = true,
							},
							["range"] = {
								["position"] = "frame-outbottom",
							},
							["name mid"] = {
								["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
								["position"] = "healthBar-right",
								["hidden"] = false,
								["size"] = 1.26,
							},
							["Threat"] = {
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Experience"] = {
								["hidden"] = true,
							},
							["combatText"] = {
								["position"] = "healthBar-outleft",
							},
							["Health"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["position"] = "frame-outtop",
								["size"] = 0.9,
							},
						},
					},
					["target"] = {
						["auraSide"] = "top",
						["debuffSide"] = "top",
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 1,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 12,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 2,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 8,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 10,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 5,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 4,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 0.45,
								["height"] = 1,
								["alpha"] = 0.9,
								["hidden"] = true,
								["position"] = 7,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 6,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 3,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 9,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 10,
							},
						},
						["buffSide"] = "top",
						["icons"] = {
							["leaderIcon"] = {
								["size"] = 0.66,
							},
						},
						["texts"] = {
							["hp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Custom",
								["position"] = "powerBar-left",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "[Classification] [Level:DifficultyColor] [(if IsPlayer then\n    Class\nend):ClassColor] [DruidForm:Paren]",
								["hidden"] = false,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-right",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["hidden"] = true,
								["size"] = 1.3,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "[TalentTree]",
								["position"] = "powerBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[Outline (Status or MP:Short:PowerColor)]/[MaxMP:Short:PowerColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.9500000000000001,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "power",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["hppercent"] = {
								["styleType"] = "health",
								["custom"] = "[Outline][PercentHP:Percent]",
								["position"] = "powerBar-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.7,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Outline Name] [(AFK or DND):Angle]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[Outline MaxHP:Short:HPColor]/[HP:Short:HPColor]",
								["position"] = "frame-outbottomleft",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.9500000000000001,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
					["maintank"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["style"] = "Class Colored",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["size"] = 1.02,
							},
							["Health"] = {
								["style"] = "Custom",
								["custom"] = "[~Dead?~IsMaxHP?PercentHP:Round:Percent:HPColor]",
								["size"] = 1.05,
							},
						},
					},
					["raid"] = {
						["auraSide"] = "topleft",
						["debuffSide"] = "bottom",
						["buffSide"] = "left",
						["bars"] = {
							["healthBar"] = {
								["height"] = 7,
							},
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["icons"] = {
							["leaderIcon"] = {
								["position"] = "frame-outleft",
								["size"] = 0.5,
							},
							["raidTargetIcon"] = {
								["position"] = "frame-center",
								["size"] = 0.72,
							},
						},
						["texts"] = {
							["Combo"] = {
								["position"] = "frame-center",
							},
							["Class"] = {
								["style"] = "Custom",
								["custom"] = "[RaidGroup]",
								["hidden"] = true,
								["size"] = 1.16,
							},
							["range"] = {
								["custom"] = "[Range?Text(r)]",
								["position"] = "healthBar-outleft",
								["size"] = 0.64,
							},
							["name mid"] = {
								["position"] = "frame-outtop",
							},
							["Cast"] = {
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
							},
							["status"] = {
								["custom"] = "[Outline][(HasAura('Dalaran Intellect') or HasAura('Dalaran Brilliance') HasAura('Arcane Brilliance') HasAura('Arcane Intellect') ? \".\":Color(\"66ccff\"))]",
								["position"] = "frame-inbottomleft",
								["hidden"] = false,
								["size"] = 2.4,
							},
							["Threat"] = {
								["position"] = "frame-inbottomright",
								["hidden"] = true,
								["size"] = 1.07,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Health"] = {
								["custom"] = "[Outline][Status]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["size"] = 0.92,
							},
							["combatText"] = {
								["position"] = "frame-outleft",
							},
							["buff"] = {
								["style"] = "Hide",
								["position"] = "healthBar-right",
								["hidden"] = false,
								["size"] = 0.55,
							},
							["CastTime"] = {
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["hidden"] = true,
							},
							["Name"] = {
								["style"] = "Custom",
								["position"] = "frame-outright",
								["custom"] = "[Outline][Name:ClassColor]",
								["size"] = 0.92,
							},
						},
					},
					["maintanktarget"] = {
						["bars"] = {
							["powerBar"] = {
								["height"] = 1,
							},
						},
						["texts"] = {
							["Threat"] = {
								["hidden"] = true,
							},
							["Power"] = {
								["hidden"] = true,
							},
							["Class"] = {
								["hidden"] = true,
							},
							["Name"] = {
								["size"] = 1.02,
							},
							["Health"] = {
								["custom"] = "[PercentHP:Percent]",
								["style"] = "Custom",
								["size"] = 1.19,
							},
						},
					},
				},
				["badrasta 1280x768"] = {
					["targettargettarget"] = {
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Name]",
								["position"] = "healthBar-left",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1.28,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Percent",
								["position"] = "healthBar-right",
								["custom"] = "[Status:PercentHP:Percent]",
								["hidden"] = false,
								["size"] = 1.28,
							},
						},
					},
					["partytarget"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 8,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.88,
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Percent",
								["position"] = "healthBar-right",
								["custom"] = "[Status:PercentHP:Percent]",
								["hidden"] = false,
								["size"] = 1.26,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Class Colored",
								["position"] = "healthBar-left",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["hidden"] = false,
								["size"] = 1.26,
							},
						},
					},
					["pet"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 12,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 1,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["buff"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Standard",
								["position"] = "powerBar-left",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["hidden"] = true,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Absolute",
								["position"] = "powerBar-right",
								["custom"] = "[CurMP]/[MaxMP]",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [[CastEndTime-CurrentTime]:Round>=0)]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "healthBar-center",
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["hidden"] = false,
								["size"] = 0.75,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Percent",
								["position"] = "healthBar-right",
								["custom"] = "[Status:PercentHP:Percent]",
								["hidden"] = true,
								["size"] = 1.21,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["maintanktarget"] = {
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[PercentHP:Percent]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1.19,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Name]",
								["position"] = "healthBar-left",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1.02,
							},
						},
					},
					["raid"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 7,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["debuffSide"] = "bottom",
						["buffSide"] = "left",
						["auraSide"] = "topleft",
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 0.5,
								["position"] = "frame-outleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 0.72,
								["position"] = "frame-center",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "frame-inbottomright",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1.07,
							},
							["buff"] = {
								["styleType"] = "none",
								["style"] = "Hide",
								["position"] = "healthBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 0.55,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Custom",
								["position"] = "powerBar-left",
								["custom"] = "[RaidGroup]",
								["hidden"] = true,
								["size"] = 1.16,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "[Range?Text(r)]",
								["position"] = "healthBar-outleft",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 0.64,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[if HP = MaxHP then\n    MaxHP:VeryShort:HPColor\nelse\n    HP:VeryShort:HPColor\nend]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.92,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-outleft",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "[(HasAura('Prayer of Fortitude') or HasAura('Power Word: Fortitude') ? 'F ':Color('FFFFFF')) (HasAura('Arcane Brilliance') or HasAura('Arcane Intellect') ? 'I ':Color('00FFFF')) (HasAura('Gift of the Wild') or HasAura('Mark of the Wild') ? 'M ':Color('FFAA00'))]",
								["position"] = "healthBar-left",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 0.6699999999999999,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Custom",
								["position"] = "frame-center",
								["custom"] = "[Status or Name:ClassColor]",
								["hidden"] = false,
								["size"] = 0.92,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["party"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 10,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["buffSide"] = "right",
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.71,
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1.23,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1.14,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-edgeright",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["custom"] = "[Outline][~IsMaxHP?PercentHP:Short:Percent:HPColor]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[Outline][~IsMaxHP?CurHP:VeryShort:HideZero:HPColor]",
								["position"] = "healthBar-outright",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.18,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "[Status]",
								["position"] = "healthBar-left",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.14,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Custom",
								["position"] = "healthBar-center",
								["custom"] = "[Name]",
								["hidden"] = false,
								["size"] = 1.28,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-intop",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
					["maintanktargettarget"] = {
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Custom",
								["position"] = "healthBar-right",
								["custom"] = "[PercentHP:Percent]",
								["hidden"] = false,
								["size"] = 1.19,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Name]",
								["position"] = "healthBar-left",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1.02,
							},
						},
					},
					["focus"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 8,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 1,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 6,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.66,
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[~HasNoThreat?Threat:Short]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-outbottom",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1.26,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Name] [(AFK or DND):Angle]",
								["position"] = "frame-outtop",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 0.75,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "healthBar-outleft",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[HP]/[MaxHP]",
								["position"] = "healthBar-right",
								["style"] = "Smart",
								["hidden"] = true,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["target"] = {
						["comboSide"] = "inbottomright",
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 12,
								["position"] = 2,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["reverse"] = false,
								["height"] = 2,
								["position"] = 1,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["position"] = 8,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 5,
								["position"] = 9,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["position"] = 4,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["blankSpace"] = {
								["position"] = 7,
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["hidden"] = true,
								["alpha"] = 0.9,
								["bgAlpha"] = 0.45,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["position"] = 6,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 1,
								["position"] = 3,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 10,
								["position"] = 5,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["reverse"] = false,
								["height"] = 2,
								["position"] = 10,
								["alpha"] = 1,
								["bgAlpha"] = 1,
							},
						},
						["debuffSide"] = "top",
						["buffSide"] = "top",
						["auraSide"] = "top",
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.66,
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["hp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Custom",
								["position"] = "powerBar-left",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "[Classification] [Level:DifficultyColor] [(if IsPlayer then\n    Class\nend):ClassColor] [DruidForm:Paren]",
								["hidden"] = false,
								["size"] = 1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-right",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["hidden"] = true,
								["size"] = 1.3,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "[TalentTree]",
								["position"] = "powerBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "threatBar-right",
								["custom"] = "[Threat]/[MaxThreat]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[(Status or MP:Short:PowerColor)]/[MaxMP:Short:PowerColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Outline Name] [(AFK or DND):Angle]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "powerBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["Health"] = {
									["style"] = "Informational",
								},
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[MaxHP:Short:HPColor]/[HP:Short:HPColor]",
								["position"] = "frame-outbottomleft",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "power",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["maintank"] = {
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "left",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["bgAlpha"] = 1,
								["height"] = 2,
								["alpha"] = 1,
								["hidden"] = true,
								["position"] = 8,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = true,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[MP]/[MaxMP]",
								["position"] = "powerBar-right",
								["style"] = "Absolute",
								["hidden"] = true,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "[Classification] [Level:DifficultyColor] [SmartClass:ClassColor] [DruidForm:Paren] [SmartRace]",
								["position"] = "powerBar-left",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[CastName] [CastTarget:Paren]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["style"] = "Custom",
								["position"] = "healthBar-right",
								["custom"] = "[~Dead?~IsMaxHP?PercentHP:Round:Percent:HPColor]",
								["hidden"] = false,
								["size"] = 1.05,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[CastDelay:Round] [CastEndDuration:Round >= 0]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Class Colored",
								["position"] = "healthBar-left",
								["custom"] = "[Name:ClassColor] [AFKDND:Angle]",
								["hidden"] = false,
								["size"] = 1.02,
							},
						},
					},
					["player"] = {
						["buffSide"] = "left",
						["debuffSide"] = "bottomright",
						["bars"] = {
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 12,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["portrait"] = {
								["deficit"] = false,
								["side"] = "right",
								["reverse"] = true,
								["height"] = 12,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["position"] = 1,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["position"] = 8,
								["height"] = 1,
								["alpha"] = 0.9,
								["hidden"] = true,
								["bgAlpha"] = 0.45,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 10,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["auraSide"] = "top",
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.66,
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["Combo"] = {
								["styleType"] = "combo",
								["custom"] = "",
								["position"] = "frame-outright",
								["style"] = "Standard",
								["hidden"] = false,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["style"] = "Hide",
								["position"] = "frame-inbottomright",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["custom"] = "[Outline][(~Dead ? ~IsMaxHP ? PercentHP:Percent:HPColor)]",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["style"] = "Absolute Short",
								["position"] = "frame-edgetop",
								["custom"] = "[if HasThreat then Threat:Short]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["style"] = "Custom",
								["position"] = "frame-outbottomleft",
								["custom"] = "[MaxMP:Short:PowerColor]/[Status or MP:Short:PowerColor]",
								["hidden"] = false,
								["size"] = 1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["custom"] = "[~IsMouseOver?FractionalRep] [~IsMouseOver?PercentRep:Percent:Paren!RepName]",
								["position"] = "repBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[HP:Short:HPColor]/[MaxHP:Short:HPColor]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["style"] = "Custom",
								["position"] = "healthBar-left",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["hp perc"] = {
								["styleType"] = "health",
								["custom"] = "[Dead] [~IsMaxHP ? Status:PercentHP:Percent]",
								["position"] = "powerBar-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.85,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["custom"] = "",
								["position"] = "expBar-center",
								["style"] = "Standard",
								["hidden"] = true,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["style"] = "Standard",
								["position"] = "frame-intop",
								["custom"] = "[Name] [AFKDND:Angle]",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "[~IsMaxMP?Status:PercentMP:Percent]",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
						},
					},
					["targettarget"] = {
						["bars"] = {
							["portrait"] = {
								["deficit"] = false,
								["side"] = "right",
								["position"] = 1,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["healthBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 2,
								["height"] = 3,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["castBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 9,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["fullBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 10,
								["height"] = 5,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["expBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 5,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["blankSpace"] = {
								["reverse"] = false,
								["deficit"] = false,
								["side"] = "center",
								["position"] = 8,
								["height"] = 1,
								["alpha"] = 0.9,
								["hidden"] = true,
								["bgAlpha"] = 0.45,
							},
							["threatBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 7,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["druidManaBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 4,
								["height"] = 1,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["powerBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 3,
								["height"] = 3,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
							["repBar"] = {
								["deficit"] = false,
								["side"] = "center",
								["position"] = 6,
								["height"] = 2,
								["bgAlpha"] = 1,
								["alpha"] = 1,
								["reverse"] = false,
							},
						},
						["icons"] = {
							["restIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["leaderIcon"] = {
								["position"] = "frame-edgetopleft",
								["size"] = 0.66,
							},
							["totemTimersFrame"] = {
								["size"] = 1,
								["position"] = "frame-outtopleft",
							},
							["raidTargetIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetop",
							},
							["voiceIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
							["masterIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopleft",
							},
							["readyCheckIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomright",
							},
							["combatIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgebottomleft",
							},
							["pvpIcon"] = {
								["size"] = 1,
								["position"] = "frame-edgetopright",
							},
						},
						["texts"] = {
							["hp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "healthBar-left",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Class"] = {
								["styleType"] = "class",
								["custom"] = "",
								["position"] = "healthBar-right",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 0.9500000000000001,
							},
							["range"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name mid"] = {
								["styleType"] = "none",
								["style"] = "Hide",
								["position"] = "frame-outbottom",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 2.25,
							},
							["Cast"] = {
								["styleType"] = "cast",
								["custom"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
								["position"] = "castBar-left",
								["style"] = "Standard Name",
								["hidden"] = false,
								["size"] = 1,
							},
							["status"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-edgebottomleft",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["name midd"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Threat"] = {
								["styleType"] = "threat",
								["custom"] = "[Threat]/[MaxThreat]",
								["position"] = "threatBar-right",
								["style"] = "Absolute Short",
								["hidden"] = false,
								["size"] = 1,
							},
							["Power"] = {
								["styleType"] = "power",
								["custom"] = "[~HasNoMP?CurMP:Short:Color(81BEF7)] || [MaxMP:Short:Color(0174DF)]",
								["position"] = "frame-edgebottom",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1.1,
							},
							["Reputation"] = {
								["styleType"] = "reputation",
								["style"] = "Standard",
								["position"] = "repBar-center",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["DruidMana"] = {
								["styleType"] = "druidMana",
								["custom"] = "[~IsMana ? FractionalDruidMP]",
								["position"] = "druidManaBar-right",
								["style"] = "Absolute",
								["hidden"] = false,
								["size"] = 1,
							},
							["mp perc"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["buff"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "frame-center",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Experience"] = {
								["styleType"] = "experience",
								["style"] = "Standard",
								["position"] = "expBar-center",
								["custom"] = "",
								["hidden"] = true,
								["size"] = 1,
							},
							["combatText"] = {
								["styleType"] = "none",
								["custom"] = "",
								["position"] = "healthBar-outright",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
							["Combo"] = {
								["styleType"] = "combo",
								["style"] = "Standard",
								["position"] = "frame-outright",
								["custom"] = "",
								["hidden"] = false,
								["size"] = 1,
							},
							["CastTime"] = {
								["styleType"] = "cast",
								["custom"] = "[if not CastStopDuration then Concatenate('+', CastDelay:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
								["position"] = "castBar-right",
								["style"] = "Standard Time",
								["hidden"] = false,
								["size"] = 1,
							},
							["Health"] = {
								["styleType"] = "health",
								["custom"] = "[CurHP:Short:HideZero:HPColor] || [Dead?Text(Dead):Gray!Offline?Text(Offline):Gray!MaxHP:Short:Color(38610B)]",
								["position"] = "frame-outbottomright",
								["style"] = "Custom",
								["hidden"] = true,
								["size"] = 1,
							},
							["Name"] = {
								["styleType"] = "name",
								["custom"] = "[Name or Status:ClassColor]",
								["position"] = "healthBar-center",
								["style"] = "Custom",
								["hidden"] = false,
								["size"] = 1,
							},
						},
					},
				},
			},
		},
		["Portrait"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["targettargettarget"] = {
						["hidden"] = true,
					},
					["partytarget"] = {
						["hidden"] = true,
					},
					["pet"] = {
						["hidden"] = true,
					},
					["targettarget"] = {
						["style"] = "2D",
						["hidden"] = true,
					},
					["player"] = {
						["hidden"] = false,
						["fallback2D"] = "3D",
					},
					["party"] = {
						["hidden"] = true,
					},
					["maintanktargettarget"] = {
						["hidden"] = true,
					},
					["focus"] = {
						["hidden"] = false,
						["fallback3D"] = "2D",
					},
					["target"] = {
						["hidden"] = false,
						["fallback2D"] = "3D",
					},
					["raid"] = {
						["hidden"] = true,
					},
					["maintank"] = {
						["hidden"] = true,
					},
					["maintanktarget"] = {
						["hidden"] = true,
					},
				},
				["Default"] = {
					["targettargettarget"] = {
						["hidden"] = true,
					},
					["partytarget"] = {
						["hidden"] = true,
					},
					["targettarget"] = {
						["style"] = "2D",
						["hidden"] = true,
					},
					["pet"] = {
						["hidden"] = true,
					},
					["player"] = {
						["fallback2D"] = "3D",
						["hidden"] = false,
					},
					["party"] = {
						["hidden"] = true,
					},
					["maintanktarget"] = {
						["hidden"] = true,
					},
					["focus"] = {
						["hidden"] = false,
						["fallback3D"] = "2D",
					},
					["target"] = {
						["fallback2D"] = "3D",
						["hidden"] = false,
					},
					["maintank"] = {
						["hidden"] = true,
					},
					["raid"] = {
						["hidden"] = true,
					},
					["maintanktargettarget"] = {
						["hidden"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["targettargettarget"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["partytarget"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["pet"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["maintanktargettarget"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["raid"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["party"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["maintanktarget"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["focus"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = false,
						["fallback3D"] = "2D",
					},
					["target"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "3D",
						["fullBody"] = false,
						["hidden"] = false,
						["fallback3D"] = "3D",
					},
					["maintank"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
					["player"] = {
						["fallbackClass"] = "Class",
						["style"] = "3D",
						["fallback2D"] = "3D",
						["fullBody"] = false,
						["hidden"] = false,
						["fallback3D"] = "3D",
					},
					["targettarget"] = {
						["fallbackClass"] = "Class",
						["style"] = "2D",
						["fallback2D"] = "2D",
						["fullBody"] = false,
						["hidden"] = true,
						["fallback3D"] = "3D",
					},
				},
			},
		},
		["Banzai"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["color"] = {
						nil, -- [1]
						0.2274509803921569, -- [2]
						0.196078431372549, -- [3]
					},
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = false,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = false,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
					},
				},
				["Default"] = {
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = false,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = false,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
					},
					["color"] = {
						nil, -- [1]
						0.2274509803921569, -- [2]
						0.196078431372549, -- [3]
					},
				},
				["badrasta 1280x768"] = {
					["color"] = {
						1, -- [1]
						0.2274509803921569, -- [2]
						0.196078431372549, -- [3]
						1, -- [4]
					},
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = false,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = false,
						},
						["target"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
					},
				},
			},
		},
		["RangeCheck"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["groups"] = {
						["party"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = false,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
					},
					["opacity"] = 0.25,
				},
				["Default"] = {
					["opacity"] = 0.55,
					["groups"] = {
						["pet"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = false,
						},
						["raid"] = {
							["ignore"] = false,
						},
					},
				},
				["badrasta 1280x768"] = {
					["interval"] = 0.7,
					["opacity"] = 0.25,
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = false,
						},
					},
					["enabled"] = true,
				},
			},
		},
		["CastBar"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["channelingcolor"] = {
						0.5843137254901961, -- [1]
						0.7568627450980392, -- [2]
						0.6, -- [3]
					},
					["completecolor"] = {
						0.4313725490196079, -- [1]
						0.5607843137254902, -- [2]
						0.5882352941176471, -- [3]
					},
					["groups"] = {
						["pet"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
					},
					["failcolor"] = {
						nil, -- [1]
						0.007843137254901961, -- [2]
					},
				},
				["Default"] = {
					["channelingcolor"] = {
						0.5843137254901961, -- [1]
						0.7568627450980392, -- [2]
						0.6, -- [3]
					},
					["groups"] = {
						["player"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
					},
					["completecolor"] = {
						0.4313725490196079, -- [1]
						0.5607843137254902, -- [2]
						0.5882352941176471, -- [3]
					},
					["failcolor"] = {
						nil, -- [1]
						0.007843137254901961, -- [2]
					},
				},
				["badrasta 1280x768"] = {
					["channelingcolor"] = {
						0.5843137254901961, -- [1]
						0.7568627450980392, -- [2]
						0.6, -- [3]
					},
					["timetextcolor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["groups"] = {
						["targettarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["targettargettarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["player"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["partytarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["focustarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["pet"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["raid"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["partypettarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["party"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["focus"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["target"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["maintank"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
						["raidtarget"] = {
							["iconPosition"] = "left",
							["showIcon"] = true,
							["ignore"] = true,
						},
					},
					["completecolor"] = {
						0.4313725490196079, -- [1]
						0.5607843137254902, -- [2]
						0.5882352941176471, -- [3]
					},
					["spelltextcolor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
					},
					["castingcolor"] = {
						1, -- [1]
						0.7, -- [2]
						0, -- [3]
					},
					["backgroundcolor"] = {
						0.5, -- [1]
						0.5, -- [2]
						0.5, -- [3]
						0.8, -- [4]
					},
					["failcolor"] = {
						1, -- [1]
						0.007843137254901961, -- [2]
						0, -- [3]
					},
				},
			},
		},
		["EstimatedHeals"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["party"] = {
							["ignore"] = true,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["player"] = {
							["text"] = false,
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
					},
				},
			},
		},
		["Aura"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["zoomAura"] = false,
					["cooldownTextAlpha"] = 1,
					["targettargettarget"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
						["frameHighlight"] = "Never",
					},
					["colors"] = {
						["buffs"] = {
							0.2431372549019608, -- [1]
							["nil"] = {
								nil, -- [1]
								0, -- [2]
							},
							[3] = 0.1254901960784314,
							["Own"] = {
								0, -- [1]
								0, -- [2]
							},
						},
						["debuffs"] = {
							["nil"] = {
								nil, -- [1]
								0.3372549019607843, -- [2]
								0.1254901960784314, -- [3]
							},
							["Disease"] = {
								0.6862745098039216, -- [1]
								0.3058823529411765, -- [2]
							},
							["Poison"] = {
								0.3764705882352941, -- [1]
								[3] = 0.2470588235294118,
							},
							["Magic"] = {
								0.4235294117647059, -- [1]
								0.7215686274509804, -- [2]
							},
							["Curse"] = {
								0.5529411764705883, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
							},
						},
					},
					["partytarget"] = {
						["hiddenBuffs"] = true,
						["frameHighlight"] = "Never",
						["debuffsize"] = 15,
						["hidden"] = true,
						["maxdebuffs"] = 3,
						["hiddenDebuffs"] = true,
						["highlightStyle"] = "normal",
						["buffFilter"] = false,
						["debuffFilter"] = false,
					},
					["raid"] = {
						["grow"] = 1,
						["flip"] = true,
						["maxdebuffs"] = 0,
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Will of the Forsaken"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Shadowform"] = false,
							["Fade"] = false,
							["Touch of Weakness"] = false,
							["Power Infusion"] = false,
						},
						["buffsize"] = 15,
						["maxbuffs"] = 2,
						["buffdirection"] = "Left then Up",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["hiddenBuffs"] = true,
						["snap"] = false,
						["split"] = true,
					},
					["targettarget"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
						["frameHighlight"] = "Never",
					},
					["party"] = {
						["buffsize"] = 14,
						["highlight"] = {
							["Buffs"] = false,
						},
						["flip"] = true,
						["snap"] = false,
						["maxdebuffs"] = 7,
						["debuffsize"] = 14,
						["aura2OffsetX"] = -145,
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Will of the Forsaken"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Power Infusion"] = false,
							["Touch of Weakness"] = false,
							["Shadowform"] = false,
							["Fade"] = false,
						},
						["debuffdirection"] = "Left then Down",
						["aura2OffsetY"] = -5,
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["highlightStyle"] = "thinborder",
						["maxbuffs"] = 0,
						["split"] = true,
					},
					["maintanktarget"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
					},
					["player"] = {
						["grow"] = 1,
						["highlight"] = {
							["Debuffs"] = false,
						},
						["debuffsize"] = 20,
						["hiddenWeaponBuffs"] = true,
						["sort"] = false,
						["buffsize"] = 24,
						["frameHighlight"] = "Never",
						["hiddenBuffs"] = true,
						["snap"] = false,
						["hidden"] = true,
						["debuffFilter"] = false,
						["buffFilter"] = false,
						["debuffdirection"] = "Left then Down",
						["hiddenDebuffs"] = true,
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["buffFilterSelection"] = {
							["Blessed Recovery"] = false,
							["Cannibalize"] = false,
						},
						["maxbuffs"] = 20,
						["maxdebuffs"] = 0,
					},
					["maintanktargettarget"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
					},
					["focus"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
					},
					["target"] = {
						["grow"] = 1,
						["highlight"] = {
							["Debuffs"] = false,
							["Buffs"] = false,
						},
						["split"] = true,
						["debuffsize"] = 18,
						["buffFilterSelection"] = {
							["Inner Fire"] = false,
							["Power Infusion"] = false,
							["Levitate"] = false,
							["Touch of Weakness"] = false,
							["Fade"] = false,
							["Silverwing Flag"] = false,
							["Will of the Forsaken"] = false,
							["Focused Casting"] = false,
							["Pain Suppression"] = false,
						},
						["buffsize"] = 18,
						["aura2OffsetY"] = 2,
						["debuffSide"] = "top",
						["auraOffsetY"] = 2,
						["buffSpacing"] = 1,
						["maxdebuffs"] = 8,
						["debuffdirection"] = "Left then Up",
						["snap"] = false,
						["buffdirection"] = "Right then Up",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["buffSide"] = "top",
						["maxbuffs"] = 8,
						["aura2OffsetX"] = 138,
					},
					["maintank"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["buffsize"] = 11,
						["hidden"] = true,
					},
					["cooldown"] = false,
					["pet"] = {
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["hidden"] = true,
					},
				},
				["Default"] = {
					["targettargettarget"] = {
						["frameHighlight"] = "Never",
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
					["partytarget"] = {
						["debuffsize"] = 15,
						["frameHighlight"] = "Never",
						["hidden"] = true,
						["buffFilter"] = false,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
						["maxdebuffs"] = 3,
						["highlightStyle"] = "normal",
						["debuffFilter"] = false,
					},
					["party"] = {
						["flip"] = true,
						["debuffsize"] = 14,
						["buffsize"] = 14,
						["debuffdirection"] = "Left then Down",
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["snap"] = false,
						["highlight"] = {
							["Buffs"] = false,
						},
						["split"] = true,
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Power Infusion"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Will of the Forsaken"] = false,
							["Touch of Weakness"] = false,
							["Shadowform"] = false,
							["Fade"] = false,
						},
						["aura2OffsetY"] = -5,
						["maxdebuffs"] = 7,
						["aura2OffsetX"] = -145,
						["maxbuffs"] = 0,
					},
					["maintanktarget"] = {
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
					["focus"] = {
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
					["target"] = {
						["grow"] = 1,
						["debuffsize"] = 18,
						["buffsize"] = 18,
						["auraOffsetY"] = 2,
						["buffSpacing"] = 1,
						["debuffdirection"] = "Left then Up",
						["buffdirection"] = "Right then Up",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["snap"] = false,
						["fontSize"] = 11,
						["highlight"] = {
							["Debuffs"] = false,
							["Buffs"] = false,
						},
						["split"] = true,
						["maxdebuffs"] = 8,
						["aura2OffsetX"] = 138,
						["aura2OffsetY"] = 2,
						["debuffSide"] = "top",
						["buffSide"] = "top",
						["buffFilterSelection"] = {
							["Inner Fire"] = false,
							["Power Infusion"] = false,
							["Levitate"] = false,
							["Pain Suppression"] = false,
							["Fade"] = false,
							["Silverwing Flag"] = false,
							["Focused Casting"] = false,
							["Will of the Forsaken"] = false,
							["Touch of Weakness"] = false,
						},
						["maxbuffs"] = 8,
					},
					["raid"] = {
						["grow"] = 1,
						["flip"] = true,
						["buffsize"] = 15,
						["buffdirection"] = "Left then Up",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["snap"] = false,
						["hiddenBuffs"] = true,
						["split"] = true,
						["maxdebuffs"] = 0,
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Power Infusion"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Shadowform"] = false,
							["Fade"] = false,
							["Touch of Weakness"] = false,
							["Will of the Forsaken"] = false,
						},
						["highlightStyle"] = "normal",
						["maxbuffs"] = 2,
					},
					["cooldownTextAlpha"] = 1,
					["targettarget"] = {
						["frameHighlight"] = "Never",
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
					["colors"] = {
						["buffs"] = {
							0.2431372549019608, -- [1]
							["nil"] = {
								nil, -- [1]
								0, -- [2]
							},
							[3] = 0.1254901960784314,
							["Own"] = {
								0, -- [1]
								0, -- [2]
							},
						},
						["debuffs"] = {
							["Disease"] = {
								0.6862745098039216, -- [1]
								0.3058823529411765, -- [2]
							},
							["nil"] = {
								nil, -- [1]
								0.3372549019607843, -- [2]
								0.1254901960784314, -- [3]
							},
							["Curse"] = {
								0.5529411764705883, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
							},
							["Magic"] = {
								0.4235294117647059, -- [1]
								0.7215686274509804, -- [2]
							},
							["Poison"] = {
								0.3764705882352941, -- [1]
								[3] = 0.2470588235294118,
							},
						},
					},
					["player"] = {
						["grow"] = 1,
						["debuffsize"] = 20,
						["buffsize"] = 24,
						["debuffdirection"] = "Left then Down",
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["maxbuffs"] = 20,
						["hiddenBuffs"] = true,
						["highlight"] = {
							["Debuffs"] = false,
						},
						["maxdebuffs"] = 0,
						["buffFilterSelection"] = {
							["Blessed Recovery"] = false,
							["Cannibalize"] = false,
						},
						["sort"] = false,
						["debuffFilter"] = false,
						["hiddenWeaponBuffs"] = true,
						["buffFilter"] = false,
						["snap"] = false,
					},
					["zoomAura"] = false,
					["maintank"] = {
						["buffsize"] = 11,
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
					["cooldown"] = false,
					["maintanktargettarget"] = {
						["hidden"] = true,
						["hiddenBuffs"] = true,
						["hiddenDebuffs"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["cooldownText"] = false,
					["targettargettarget"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Never",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["partytarget"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 15,
						["buffsize"] = 16,
						["frameHighlight"] = "Never",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["buffFilter"] = false,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["maxdebuffs"] = 3,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["hiddenDebuffs"] = true,
						["frame2Width"] = 160,
						["hiddenWeaponBuffs"] = false,
						["auraSide"] = "bottom",
						["highlightStyle"] = "normal",
						["snap"] = true,
						["debuffFilter"] = false,
					},
					["party"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = true,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 14,
						["buffsize"] = 14,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = false,
						["debuffdirection"] = "Left then Down",
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["snap"] = false,
						["hiddenBuffs"] = false,
						["fontSize"] = 8,
						["highlight"] = {
							["Buffs"] = false,
						},
						["split"] = true,
						["hiddenDebuffs"] = false,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = -145,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = -5,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["frameWidth"] = 160,
						["frame2Width"] = 160,
						["maxdebuffs"] = 7,
						["auraSide"] = "bottom",
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Will of the Forsaken"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Fade"] = false,
							["Shadowform"] = false,
							["Touch of Weakness"] = false,
							["Power Infusion"] = false,
						},
						["highlightStyle"] = "thinborder",
						["hiddenWeaponBuffs"] = false,
						["maxbuffs"] = 0,
					},
					["maintanktargettarget"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["focus"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["target"] = {
						["grow"] = 1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 18,
						["buffsize"] = 18,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 2,
						["buffSpacing"] = 1,
						["hidden"] = false,
						["debuffdirection"] = "Left then Up",
						["buffdirection"] = "Right then Up",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["snap"] = false,
						["hiddenBuffs"] = false,
						["fontSize"] = 8,
						["highlight"] = {
							["Buffs"] = false,
							["Debuffs"] = false,
						},
						["split"] = true,
						["maxdebuffs"] = 8,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 138,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 2,
						["debuffSide"] = "top",
						["buffSide"] = "top",
						["buffFilter"] = false,
						["frameWidth"] = 160,
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
						["buffFilterSelection"] = {
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Pain Suppression"] = false,
							["Fade"] = false,
							["Silverwing Flag"] = false,
							["Touch of Weakness"] = false,
							["Power Infusion"] = false,
							["Will of the Forsaken"] = false,
						},
						["hiddenWeaponBuffs"] = false,
						["hiddenDebuffs"] = false,
						["highlightStyle"] = "border",
						["debuffFilter"] = false,
						["maxbuffs"] = 8,
					},
					["raid"] = {
						["grow"] = 1,
						["auraOffsetX"] = 0,
						["flip"] = true,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 15,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = false,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Left then Up",
						["highlightType"] = {
							["Buffs"] = false,
						},
						["maxbuffs"] = 2,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = true,
						["maxdebuffs"] = 0,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["hiddenWeaponBuffs"] = false,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["auraSide"] = "bottom",
						["frameWidth"] = 160,
						["frame2Width"] = 160,
						["buffFilterSelection"] = {
							["Renew"] = false,
							["Power Infusion"] = false,
							["Inner Focus"] = false,
							["Pain Suppression"] = false,
							["Prayer of Mending"] = false,
							["Netherstorm Flag"] = false,
							["Blessed Recovery"] = false,
							["Prayer of Spirit"] = false,
							["Inner Fire"] = false,
							["Focused Casting"] = false,
							["Levitate"] = false,
							["Cannibalize"] = false,
							["Divine Spirit"] = false,
							["Silverwing Flag"] = false,
							["Power Word: Shield"] = false,
							["Will of the Forsaken"] = false,
							["Touch of Weakness"] = false,
							["Fade"] = false,
							["Shadowform"] = false,
						},
						["aura2OffsetX"] = 0,
						["highlightStyle"] = "border",
						["hiddenDebuffs"] = false,
						["snap"] = false,
					},
					["cooldownTextAlpha"] = 1,
					["weaponBuffSpellIcon"] = true,
					["pet"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["targettarget"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Never",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["zoomAura"] = false,
					["player"] = {
						["grow"] = 1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 20,
						["buffsize"] = 24,
						["frameHighlight"] = "Never",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Left then Down",
						["buffdirection"] = "Left then Down",
						["highlightType"] = {
							["Debuffs"] = false,
						},
						["snap"] = false,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["highlight"] = {
							["Debuffs"] = false,
						},
						["split"] = false,
						["debuffFilter"] = false,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["buffFilterSelection"] = {
							["Blessed Recovery"] = false,
							["Cannibalize"] = false,
						},
						["sort"] = false,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["maxdebuffs"] = 0,
						["frameWidth"] = 160,
						["frame2Width"] = 160,
						["aura2OffsetX"] = 0,
						["auraSide"] = "bottom",
						["hiddenWeaponBuffs"] = true,
						["maxbuffs"] = 20,
						["highlightStyle"] = "border",
						["buffFilter"] = false,
						["hiddenDebuffs"] = true,
					},
					["colors"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = false,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["buffs"] = {
							0.2431372549019608, -- [1]
							["Weapon"] = {
								1, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["nil"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							[3] = 0.1254901960784314,
							["Own"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
						},
						["snap"] = true,
						["hiddenBuffs"] = false,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = false,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["weaponBuffItemQuality"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["debuffs"] = {
							["nil"] = {
								1, -- [1]
								0.3372549019607843, -- [2]
								0.1254901960784314, -- [3]
								1, -- [4]
							},
							["Poison"] = {
								0.3764705882352941, -- [1]
								1, -- [2]
								0.2470588235294118, -- [3]
								1, -- [4]
							},
							["Curse"] = {
								0.5529411764705883, -- [1]
								0.3450980392156863, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Magic"] = {
								0.4235294117647059, -- [1]
								0.7215686274509804, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Disease"] = {
								0.6862745098039216, -- [1]
								0.3058823529411765, -- [2]
								0, -- [3]
								1, -- [4]
							},
						},
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["filter"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["extraEnemyDebuffs"] = {
						},
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = false,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["buffs"] = {
						},
						["snap"] = true,
						["hiddenBuffs"] = false,
						["extraFriendDebuffs"] = {
						},
						["split"] = false,
						["hiddenDebuffs"] = false,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["hiddenWeaponBuffs"] = false,
						["sort"] = true,
						["invert"] = true,
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["maxdebuffs"] = 6,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["extraBuffs"] = {
						},
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["frame2Width"] = 160,
						["extraFriendHighlights"] = {
						},
						["aura2OffsetX"] = 0,
						["auraSide"] = "bottom",
						["enemyDebuffs"] = {
						},
						["highlightStyle"] = "border",
						["friendDebuffs"] = {
						},
						["fontSize"] = 8,
					},
					["cooldownTextColor"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = false,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = false,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = false,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["maintank"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 11,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
					["cooldown"] = false,
					["maintanktarget"] = {
						["grow"] = -1,
						["auraOffsetX"] = 0,
						["flip"] = false,
						["borderType"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["debuffsize"] = 16,
						["buffsize"] = 16,
						["frameHighlight"] = "Cureable by me",
						["auraOffsetY"] = 0,
						["buffSpacing"] = 0,
						["hidden"] = true,
						["debuffdirection"] = "Right then Down",
						["buffdirection"] = "Right then Down",
						["snap"] = true,
						["hiddenBuffs"] = true,
						["fontSize"] = 8,
						["split"] = false,
						["hiddenDebuffs"] = true,
						["border"] = {
							["Buffs"] = true,
							["Debuffs"] = true,
						},
						["aura2OffsetX"] = 0,
						["sort"] = true,
						["invert"] = true,
						["aura2OffsetY"] = 0,
						["debuffSide"] = "right",
						["buffSide"] = "bottom",
						["buffFilter"] = true,
						["debuffFilter"] = true,
						["hiddenWeaponBuffs"] = false,
						["maxdebuffs"] = 6,
						["maxbuffs"] = 6,
						["frameWidth"] = 160,
						["highlightStyle"] = "border",
						["frame2Width"] = 160,
						["auraSide"] = "bottom",
					},
				},
			},
		},
		["PvP"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
					},
				},
			},
		},
		["PowerBar"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["mainassisttarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["targettargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = false,
					},
					["partytarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mainassisttargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["party"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mainassist"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["focus"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["target"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1058823529411765, -- [1]
								0.2627450980392157, -- [2]
								0.4941176470588236, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["customBGColor"] = true,
						["customColor"] = true,
					},
					["raid"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
						["hideNoMana"] = false,
					},
					["raidtarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["maintanktarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["maintanktargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["partypettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["focustarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mouseover"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["partypet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mouseovertarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["player"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1058823529411765, -- [1]
								0.2627450980392157, -- [2]
								0.4941176470588236, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["customBGColor"] = true,
						["customColor"] = true,
					},
					["pettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["targettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["pet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["maintank"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["focustargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["raidpet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
				},
				["Default"] = {
					["mainassisttarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["targettargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = false,
					},
					["partytarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mainassisttargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["party"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["maintanktarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["raidpet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["target"] = {
						["customBGColor"] = true,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1450980392156863, -- [1]
								0.3568627450980392, -- [2]
								0.6784313725490196, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["customColor"] = true,
					},
					["raid"] = {
						["hideNoMana"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["raidtarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mainassist"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["maintanktargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["partypettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["focustarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mouseover"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["partypet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["mouseovertarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["player"] = {
						["customBGColor"] = true,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1450980392156863, -- [1]
								0.3568627450980392, -- [2]
								0.6784313725490196, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["customColor"] = true,
					},
					["pettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["targettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["pet"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["maintank"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
					["focustargettarget"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
					},
					["focus"] = {
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								nil, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["hidden"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["mainassisttarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["targettargettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["partytarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["mainassisttargettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["party"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["mainassist"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["raidpet"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["target"] = {
						["customBGColor"] = true,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1058823529411765, -- [1]
								0.2627450980392157, -- [2]
								0.4941176470588236, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = true,
					},
					["raid"] = {
						["customBGColor"] = false,
						["hideNoPower"] = false,
						["hideNoMana"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["raidtarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["focus"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["partypettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["maintanktargettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["focustarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["mouseover"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["partypet"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["mouseovertarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["player"] = {
						["customBGColor"] = true,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["mana"] = {
								0.1058823529411765, -- [1]
								0.2627450980392157, -- [2]
								0.4941176470588236, -- [3]
							},
							["runicPowerBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["focusBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.1686274509803922, -- [1]
								0.1686274509803922, -- [2]
								0.1686274509803922, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = true,
					},
					["pet"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["targettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["pettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["maintank"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
					["focustargettarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = false,
						["customColor"] = false,
					},
					["maintanktarget"] = {
						["customBGColor"] = false,
						["hideNoMana"] = false,
						["hideNoPower"] = false,
						["customColors"] = {
							["rage"] = {
								0.8862745098039215, -- [1]
								0.3803921568627451, -- [2]
								0.2666666666666667, -- [3]
								0.8196078431372549, -- [4]
							},
							["rageBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["mana"] = {
								0.5882352941176471, -- [1]
								0.7450980392156863, -- [2]
								0.996078431372549, -- [3]
							},
							["runicPowerBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focus"] = {
								1, -- [1]
								0.8235294117647058, -- [2]
								0, -- [3]
							},
							["manaBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["focusBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
							["energy"] = {
								1, -- [1]
								0.8274509803921568, -- [2]
								0.3254901960784314, -- [3]
								0.6941176470588235, -- [4]
							},
							["energyBG"] = {
								0.04313725490196078, -- [1]
								0.04313725490196078, -- [2]
								0.04313725490196078, -- [3]
							},
						},
						["colorByClass"] = false,
						["hidden"] = true,
						["customColor"] = false,
					},
				},
			},
		},
		["HideBlizzard"] = {
			["profiles"] = {
				["badrasta 1280x768"] = {
					["player"] = true,
					["focus"] = true,
					["target"] = true,
					["party"] = true,
					["castbar"] = true,
					["aura"] = false,
				},
			},
		},
		["ReputationBar"] = {
			["profiles"] = {
				["Default"] = {
					["customBGColors"] = {
						0.04313725490196078, -- [1]
						0.04313725490196078, -- [2]
						0.04313725490196078, -- [3]
					},
				},
			},
		},
		["HealthBar"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["targettarget"] = {
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["customColor"] = true,
						["hostilityColor"] = false,
					},
					["party"] = {
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["customColor"] = true,
					},
					["targettargettarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["raid"] = {
						["classColor"] = false,
						["customBGColors"] = {
							0.5490196078431373, -- [1]
							0.3686274509803922, -- [2]
							0.3294117647058824, -- [3]
						},
						["customColors"] = {
							0.2627450980392157, -- [1]
							0.3137254901960784, -- [2]
							0.2941176470588235, -- [3]
						},
						["customColor"] = true,
					},
					["partytarget"] = {
						["classColor"] = false,
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["focustarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["mouseover"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["partypettarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["mouseovertarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["player"] = {
						["classColor"] = false,
						["customBGColor"] = true,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
						["customColor"] = true,
					},
					["maintanktarget"] = {
						["classColor"] = false,
						["hostilityColor"] = true,
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["customColor"] = true,
					},
					["focus"] = {
						["classColorPvP"] = true,
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["hidden"] = true,
						["hostilityColor"] = false,
					},
					["target"] = {
						["classColorPvP"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["customColor"] = true,
					},
					["maintank"] = {
						["classColor"] = false,
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["customColors"] = {
							0.2627450980392157, -- [1]
							0.3137254901960784, -- [2]
							0.2941176470588235, -- [3]
						},
						["customColor"] = true,
					},
					["pet"] = {
						["classColor"] = false,
						["customBGColor"] = true,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["happinessColor"] = false,
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
						["customColor"] = true,
					},
					["raidtarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
				},
				["Default"] = {
					["pet"] = {
						["customBGColor"] = true,
						["customColor"] = true,
						["classColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["happinessColor"] = false,
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
					},
					["mouseover"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["targettargettarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["raid"] = {
						["customColor"] = true,
						["classColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.5490196078431373, -- [1]
							0.3686274509803922, -- [2]
							0.3294117647058824, -- [3]
						},
					},
					["partytarget"] = {
						["classColor"] = false,
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["focustarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["targettarget"] = {
						["customColor"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["partypettarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["mouseovertarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["party"] = {
						["customColor"] = true,
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["maintanktarget"] = {
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = true,
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["focus"] = {
						["hidden"] = true,
						["hostilityColor"] = false,
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = true,
					},
					["target"] = {
						["customColor"] = true,
						["classColorPvP"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["maintank"] = {
						["customColor"] = true,
						["classColor"] = false,
						["customColors"] = {
							0.2627450980392157, -- [1]
							0.3137254901960784, -- [2]
							0.2941176470588235, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
					["player"] = {
						["customBGColor"] = true,
						["customColor"] = true,
						["classColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
					},
					["raidtarget"] = {
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
					},
				},
				["badrasta 1280x768"] = {
					["pet"] = {
						["customBGColor"] = true,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["happinessColor"] = false,
						["classColorPvP"] = false,
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
					},
					["player"] = {
						["customBGColor"] = true,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.1686274509803922, -- [1]
							0.1686274509803922, -- [2]
							0.1686274509803922, -- [3]
						},
						["classColorPvP"] = false,
					},
					["targettargettarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["maintank"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = false,
						["customColors"] = {
							0.2627450980392157, -- [1]
							0.3137254901960784, -- [2]
							0.2941176470588235, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["partytarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = false,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["focustarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["targettarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["focus"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = true,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = true,
					},
					["mouseovertarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["party"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["maintanktarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = true,
						["customColors"] = {
							0.2862745098039216, -- [1]
							0.3803921568627451, -- [2]
							0.4313725490196079, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["partypettarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["target"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColorPvP"] = true,
						["hostilityColor"] = false,
						["customColors"] = {
							0.7019607843137254, -- [1]
							0.7019607843137254, -- [2]
							0.7019607843137254, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColor"] = true,
					},
					["raid"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = true,
						["classColor"] = false,
						["hostilityColor"] = false,
						["customColors"] = {
							0.2627450980392157, -- [1]
							0.3137254901960784, -- [2]
							0.2941176470588235, -- [3]
						},
						["customBGColors"] = {
							0.5490196078431373, -- [1]
							0.3686274509803922, -- [2]
							0.3294117647058824, -- [3]
						},
						["classColorPvP"] = false,
					},
					["mouseover"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
					["raidtarget"] = {
						["customBGColor"] = false,
						["hostilityColorNPCs"] = false,
						["hidden"] = false,
						["customColor"] = false,
						["classColor"] = true,
						["hostilityColor"] = true,
						["customColors"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["customBGColors"] = {
							0.04313725490196078, -- [1]
							0.04313725490196078, -- [2]
							0.04313725490196078, -- [3]
						},
						["classColorPvP"] = false,
					},
				},
			},
		},
		["Combat"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["target"] = {
							["disable"] = true,
						},
						["player"] = {
							["disable"] = true,
						},
						["party"] = {
							["disable"] = true,
						},
					},
				},
			},
		},
		["VoiceIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["groups"] = {
						["focus"] = {
							["disable"] = true,
						},
						["party"] = {
							["disable"] = true,
						},
					},
				},
				["Default"] = {
					["groups"] = {
						["focus"] = {
							["disable"] = true,
						},
						["party"] = {
							["disable"] = true,
						},
					},
				},
				["badrasta 1280x768"] = {
					["groups"] = {
						["player"] = {
							["disable"] = false,
						},
						["focus"] = {
							["disable"] = true,
						},
						["target"] = {
							["disable"] = false,
						},
						["targettarget"] = {
							["disable"] = false,
						},
						["party"] = {
							["disable"] = true,
						},
					},
				},
			},
		},
		["VisualHeal"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["targettarget"] = {
							["enabled"] = false,
						},
					},
				},
				["badrasta 1280x768"] = {
					["outgoingColorN"] = {
						0, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["groups"] = {
						["mainassisttarget"] = {
							["enabled"] = false,
						},
						["partytarget"] = {
							["enabled"] = false,
						},
						["pettarget"] = {
							["enabled"] = false,
						},
						["mainassisttargettarget"] = {
							["enabled"] = false,
						},
						["player"] = {
							["enabled"] = true,
						},
						["maintanktargettarget"] = {
							["enabled"] = false,
						},
						["target"] = {
							["enabled"] = true,
						},
						["targettarget"] = {
							["enabled"] = true,
						},
						["maintanktarget"] = {
							["enabled"] = false,
						},
					},
					["outgoingColorF"] = {
						1, -- [1]
						0, -- [2]
						0, -- [3]
						0.65, -- [4]
					},
					["incomingColor"] = {
						0.4, -- [1]
						0.6, -- [2]
						0.4, -- [3]
						0.75, -- [4]
					},
					["autoLuminance"] = true,
				},
			},
		},
		["LeaderIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["raid"] = {
						["disable"] = true,
					},
				},
				["Default"] = {
					["raid"] = {
						["disable"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["player"] = {
						["disable"] = false,
					},
					["raid"] = {
						["disable"] = true,
					},
				},
			},
		},
		["CombatFader"] = {
			["profiles"] = {
				["Default"] = {
					["groups"] = {
						["targettarget"] = {
							["outAlpha"] = 0.5,
							["ignore"] = false,
						},
						["player"] = {
							["outAlpha"] = 0.5,
						},
					},
				},
			},
		},
		["ExperienceBar"] = {
			["profiles"] = {
				["badrasta 1280x768"] = {
					["bgColors"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						["ignore"] = false,
					},
					["colors"] = {
						0, -- [1]
						0, -- [2]
						1, -- [3]
						["ignore"] = false,
					},
					["target"] = {
						["ignore"] = false,
					},
					["restColors"] = {
						1, -- [1]
						0, -- [2]
						1, -- [3]
						["ignore"] = false,
					},
					["targettarget"] = {
						["ignore"] = false,
					},
					["player"] = {
						["ignore"] = true,
					},
				},
			},
		},
		["RaidTargetIcon"] = {
			["profiles"] = {
				["Default"] = {
					["player"] = {
						["disable"] = true,
					},
					["targettargettarget"] = {
						["disable"] = true,
					},
					["focus"] = {
						["disable"] = true,
					},
					["raid"] = {
						["disable"] = true,
					},
					["pet"] = {
						["disable"] = true,
					},
					["party"] = {
						["disable"] = true,
					},
				},
			},
		},
		["Highlight"] = {
			["profiles"] = {
				["Default"] = {
					["party"] = {
						["hidden"] = true,
					},
					["partytarget"] = {
						["hidden"] = true,
					},
					["pet"] = {
						["hidden"] = true,
					},
					["target"] = {
						["hidden"] = true,
					},
					["raid"] = {
						["hidden"] = true,
					},
					["targettarget"] = {
						["hidden"] = true,
					},
					["player"] = {
						["hidden"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["target"] = {
						["showTarget"] = false,
						["hidden"] = false,
					},
					["player"] = {
						["hidden"] = false,
						["showTarget"] = true,
					},
					["targettarget"] = {
						["showTarget"] = false,
						["hidden"] = false,
					},
					["targettargettarget"] = {
						["showTarget"] = false,
						["hidden"] = false,
					},
				},
			},
		},
		["ThreatBar"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["colors"] = {
						0.6235294117647059, -- [1]
						0.5529411764705883, -- [2]
						0.1490196078431373, -- [3]
					},
					["player"] = {
						["ignore"] = true,
					},
					["pet"] = {
						["ignore"] = true,
					},
					["focus"] = {
						["ignore"] = true,
					},
				},
				["Default"] = {
					["pet"] = {
						["ignore"] = true,
					},
					["player"] = {
						["ignore"] = true,
					},
					["colors"] = {
						0.6235294117647059, -- [1]
						0.5529411764705883, -- [2]
						0.1490196078431373, -- [3]
					},
					["focus"] = {
						["ignore"] = true,
					},
				},
				["badrasta 1280x768"] = {
					["colors"] = {
						0.6235294117647059, -- [1]
						0.5529411764705883, -- [2]
						0.1490196078431373, -- [3]
					},
					["player"] = {
						["ignore"] = true,
					},
					["pet"] = {
						["ignore"] = true,
					},
					["focus"] = {
						["ignore"] = true,
					},
				},
			},
		},
		["RestIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["disable"] = true,
				},
				["Default"] = {
					["disable"] = true,
				},
				["badrasta 1280x768"] = {
					["disable"] = true,
				},
			},
		},
		["Rest"] = {
			["profiles"] = {
				["Default"] = {
					["disable"] = true,
				},
			},
		},
		["PvPIcon"] = {
			["profiles"] = {
				["badrasta1280x1024"] = {
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = true,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
					},
				},
				["Default"] = {
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = true,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
					},
				},
				["badrasta 1280x768"] = {
					["groups"] = {
						["targettargettarget"] = {
							["ignore"] = true,
						},
						["partytarget"] = {
							["ignore"] = true,
						},
						["pet"] = {
							["ignore"] = true,
						},
						["party"] = {
							["ignore"] = true,
						},
						["maintanktargettarget"] = {
							["ignore"] = true,
						},
						["player"] = {
							["ignore"] = true,
						},
						["maintanktarget"] = {
							["ignore"] = true,
						},
						["focus"] = {
							["ignore"] = true,
						},
						["target"] = {
							["ignore"] = true,
						},
						["raid"] = {
							["ignore"] = true,
						},
						["maintank"] = {
							["ignore"] = true,
						},
						["targettarget"] = {
							["ignore"] = true,
						},
					},
				},
			},
		},
	},
	["profiles"] = {
		["badrasta1280x1024"] = {
			["groups"] = {
				["mainassisttarget"] = {
					["hidden"] = true,
				},
				["targettargettarget"] = {
					["height"] = 27,
					["width"] = 136,
				},
				["partytarget"] = {
					["direction"] = "up",
					["spacing"] = 31,
					["height"] = 35,
					["hidden"] = true,
					["width"] = 123,
				},
				["mainassisttargettarget"] = {
					["hidden"] = true,
				},
				["party"] = {
					["height"] = 20,
					["width"] = 160,
					["border"] = "Blizzard Tooltip",
					["hspacing"] = 18,
				},
				["mainassist"] = {
					["hidden"] = true,
					["width"] = 295,
				},
				["focus"] = {
					["height"] = 20,
					["border"] = "Blizzard Dialog",
					["width"] = 110,
				},
				["target"] = {
					["height"] = 45,
					["border"] = "Blizzard Dialog",
					["width"] = 295,
				},
				["raid"] = {
					["spacing"] = 1,
					["nameSort"] = false,
					["height"] = 11,
					["border"] = "Blizzard Tooltip",
					["width"] = 155,
				},
				["focustarget"] = {
					["hidden"] = true,
				},
				["pet"] = {
					["height"] = 16,
					["border"] = "Blizzard Tooltip",
					["hidden"] = true,
					["width"] = 155,
				},
				["partypet"] = {
					["hidden"] = true,
				},
				["player"] = {
					["height"] = 45,
					["border"] = "Blizzard Tooltip",
					["width"] = 295,
				},
				["targettarget"] = {
					["height"] = 15,
					["border"] = "Blizzard Tooltip",
					["width"] = 120,
				},
				["maintanktargettarget"] = {
					["direction"] = "up",
					["height"] = 18,
					["hidden"] = true,
					["border"] = "Blizzard Tooltip",
					["width"] = 104,
				},
				["maintank"] = {
					["direction"] = "up",
					["spacing"] = 1,
					["height"] = 18,
					["border"] = "Blizzard Tooltip",
					["hidden"] = true,
					["width"] = 110,
				},
				["pettarget"] = {
					["hidden"] = true,
				},
				["maintanktarget"] = {
					["direction"] = "up",
					["spacing"] = 1,
					["height"] = 18,
					["hidden"] = true,
					["border"] = "Blizzard Tooltip",
					["width"] = 104,
				},
			},
			["clusters"] = {
				["raid5"] = {
					["y"] = -16.04191530523667,
					["x"] = -693.477149719206,
				},
				["raid6"] = {
					["y"] = -80.10540662728488,
					["x"] = -693.9118819903097,
				},
				["raid4"] = {
					["y"] = 46.48354856522268,
					["x"] = -695.1504877125141,
				},
				["raidMAINTANKtargettarget"] = {
					["y"] = -323.5165405273438,
					["x"] = 454.7994995117188,
				},
				["partytarget"] = {
					["y"] = -296.3219909667969,
					["x"] = -707.9836120605469,
				},
				["raid7"] = {
					["y"] = -144.0424491448278,
					["x"] = -694.4332920163732,
				},
				["raid3"] = {
					["y"] = 111.7855477388836,
					["x"] = -695.150078435494,
				},
				["partypet"] = {
					["y"] = 195.047607421875,
					["x"] = 362.9010620117188,
				},
				["raidMAINTANKtarget"] = {
					["y"] = -319.7657012939453,
					["x"] = 589.9540405273438,
				},
				["raidMAINASSIST"] = {
					["y"] = 275.6922607421875,
					["x"] = -60.01397705078125,
				},
				["raid1"] = {
					["y"] = 243.9481085674026,
					["x"] = -695.0874412567919,
				},
				["raid8"] = {
					["y"] = -195.7179970116104,
					["x"] = -693.9137504288789,
				},
				["party"] = {
					["y"] = 251.2658081054688,
					["x"] = -657.5822219848633,
				},
				["raid"] = {
					["y"] = 434.168701171875,
					["x"] = -726.7398490905762,
				},
				["raid2"] = {
					["y"] = 176.2986743539569,
					["x"] = -695.888485358059,
				},
				["raidMAINTANK"] = {
					["y"] = -320.703857421875,
					["x"] = 722.9899291992188,
				},
			},
			["settings"] = {
				["fontsize"] = 11,
				["font"] = "bad large",
				["colors"] = {
					["HUNTER"] = {
						0.6392156862745098, -- [1]
						1, -- [2]
						0.5098039215686274, -- [3]
					},
					["WARRIOR"] = {
						0.8274509803921568, -- [1]
						0.7529411764705882, -- [2]
						0.5882352941176471, -- [3]
					},
					["PALADIN"] = {
						0.9607843137254902, -- [1]
						0.5490196078431373, -- [2]
						0.7294117647058823, -- [3]
					},
					["frameBorder"] = {
						nil, -- [1]
						0.9490196078431372, -- [2]
						0.996078431372549, -- [3]
						0, -- [4]
					},
					["mana"] = {
						0.5764705882352941, -- [1]
						0.7803921568627451, -- [2]
						0.9803921568627451, -- [3]
					},
					["midHP"] = {
						0.7647058823529411, -- [1]
						[3] = 0.00392156862745098,
					},
					["hostile"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["focus"] = {
						0.796078431372549, -- [1]
						0.7254901960784314, -- [2]
						0.5019607843137255, -- [3]
					},
					["DRUID"] = {
						nil, -- [1]
						0.4901960784313725, -- [2]
						0.0392156862745098, -- [3]
					},
					["dead"] = {
						0.2549019607843137, -- [1]
						0.2784313725490196, -- [2]
						0.3215686274509804, -- [3]
					},
					["rage"] = {
						0.6235294117647059, -- [1]
						0.3803921568627451, -- [2]
						0.3764705882352941, -- [3]
					},
					["civilian"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["maxHP"] = {
						0.1333333333333333, -- [1]
						[3] = 0.1607843137254902,
					},
					["frameBG"] = {
						0.0196078431372549, -- [1]
						0.0196078431372549, -- [2]
						0.0196078431372549, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.192156862745098, -- [1]
						0.4666666666666667, -- [2]
						0.196078431372549, -- [3]
					},
					["disconnected"] = {
						0.2666666666666667, -- [1]
						0.2862745098039216, -- [2]
						0.2588235294117647, -- [3]
					},
					["minHP"] = {
						nil, -- [1]
						0.2627450980392157, -- [2]
						0.1607843137254902, -- [3]
					},
					["MAGE"] = {
						0.4823529411764706, -- [1]
						[3] = 1,
					},
					["WARLOCK"] = {
						0.7333333333333333, -- [1]
						0.6431372549019607, -- [2]
						1, -- [3]
					},
					["neutral"] = {
						0.8470588235294118, -- [1]
						0.7764705882352941, -- [2]
						0.3529411764705882, -- [3]
					},
					["PRIEST"] = {
						0.7411764705882353, -- [1]
						[3] = 0.996078431372549,
					},
					["SHAMAN"] = {
						0, -- [1]
						1, -- [2]
						0.996078431372549, -- [3]
					},
					["energy"] = {
						0.8941176470588235, -- [1]
						0.8666666666666667, -- [2]
						0.6588235294117647, -- [3]
					},
					["ROGUE"] = {
						nil, -- [1]
						0.9607843137254902, -- [2]
						0.4117647058823529, -- [3]
					},
				},
				["texture"] = "Ruben",
			},
			["units"] = {
				["targettarget"] = {
					["y"] = -400.063726160339,
					["x"] = -0.2487932611774712,
				},
				["player"] = {
					["y"] = -457.4384184788644,
					["x"] = -156.1720166050865,
				},
				["targettargettarget"] = {
					["y"] = -397.5970153808594,
					["x"] = 247.5613403320313,
				},
				["focus"] = {
					["y"] = 567.701512693304,
					["x"] = -0.8023445887486271,
				},
				["target"] = {
					["y"] = -457.1354093126338,
					["x"] = 158.8277263878059,
				},
				["focustarget"] = {
					["y"] = 3.0517578125e-005,
					["x"] = -364.7765808105469,
				},
				["pettarget"] = {
					["y"] = 3.0517578125e-005,
				},
				["pet"] = {
					["y"] = -359.8209991364032,
					["x"] = -171.9349271781628,
				},
			},
		},
		["Default"] = {
			["settings"] = {
				["font"] = "CAFETA__",
				["fontsize"] = 15,
				["locked"] = true,
				["colors"] = {
					["HUNTER"] = {
						0.6392156862745098, -- [1]
						1, -- [2]
						0.5098039215686274, -- [3]
					},
					["WARRIOR"] = {
						0.8274509803921568, -- [1]
						0.7529411764705882, -- [2]
						0.5882352941176471, -- [3]
					},
					["PALADIN"] = {
						0.9607843137254902, -- [1]
						0.5490196078431373, -- [2]
						0.7294117647058823, -- [3]
					},
					["frameBorder"] = {
						nil, -- [1]
						0.9490196078431372, -- [2]
						0.996078431372549, -- [3]
						0, -- [4]
					},
					["midHP"] = {
						0.7647058823529411, -- [1]
						[3] = 0.00392156862745098,
					},
					["disconnected"] = {
						0.2666666666666667, -- [1]
						0.2862745098039216, -- [2]
						0.2588235294117647, -- [3]
					},
					["minHP"] = {
						nil, -- [1]
						0.2627450980392157, -- [2]
						0.1607843137254902, -- [3]
					},
					["WARLOCK"] = {
						0.7333333333333333, -- [1]
						0.6431372549019607, -- [2]
						1, -- [3]
					},
					["energy"] = {
						0.8941176470588235, -- [1]
						0.8666666666666667, -- [2]
						0.6588235294117647, -- [3]
					},
					["maxHP"] = {
						0.1333333333333333, -- [1]
						[3] = 0.1607843137254902,
					},
					["neutral"] = {
						0.8470588235294118, -- [1]
						0.7764705882352941, -- [2]
						0.3529411764705882, -- [3]
					},
					["mana"] = {
						0.5764705882352941, -- [1]
						0.7803921568627451, -- [2]
						0.9803921568627451, -- [3]
					},
					["hostile"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["focus"] = {
						0.796078431372549, -- [1]
						0.7254901960784314, -- [2]
						0.5019607843137255, -- [3]
					},
					["dead"] = {
						0.2549019607843137, -- [1]
						0.2784313725490196, -- [2]
						0.3215686274509804, -- [3]
					},
					["rage"] = {
						0.6235294117647059, -- [1]
						0.3803921568627451, -- [2]
						0.3764705882352941, -- [3]
					},
					["civilian"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["frameBG"] = {
						0.0196078431372549, -- [1]
						0.0196078431372549, -- [2]
						0.0196078431372549, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.192156862745098, -- [1]
						0.4666666666666667, -- [2]
						0.196078431372549, -- [3]
					},
					["PRIEST"] = {
						0.7411764705882353, -- [1]
						[3] = 0.996078431372549,
					},
					["ROGUE"] = {
						nil, -- [1]
						0.9607843137254902, -- [2]
						0.4117647058823529, -- [3]
					},
					["SHAMAN"] = {
						0, -- [1]
						1, -- [2]
						0.996078431372549, -- [3]
					},
					["MAGE"] = {
						0.4823529411764706, -- [1]
						[3] = 1,
					},
					["DRUID"] = {
						nil, -- [1]
						0.4901960784313725, -- [2]
						0.0392156862745098, -- [3]
					},
				},
				["texture"] = "LiteStepLite",
			},
			["clusters"] = {
				["raid5"] = {
					["y"] = -16.04191530523667,
					["x"] = -693.477149719206,
				},
				["raid6"] = {
					["y"] = -80.10540662728488,
					["x"] = -693.9118819903097,
				},
				["raid4"] = {
					["y"] = 46.48354856522268,
					["x"] = -695.1504877125141,
				},
				["raidMAINTANKtargettarget"] = {
					["y"] = -323.5165405273438,
					["x"] = 454.7994995117188,
				},
				["partytarget"] = {
					["y"] = -296.3219909667969,
					["x"] = -707.9836120605469,
				},
				["raid7"] = {
					["y"] = -144.0424491448278,
					["x"] = -694.4332920163732,
				},
				["party"] = {
					["y"] = 251.2658613510277,
					["x"] = -657.5821994312103,
				},
				["raidMAINTANK"] = {
					["y"] = -320.703857421875,
					["x"] = 722.9899291992188,
				},
				["raidMAINTANKtarget"] = {
					["y"] = -319.7657012939453,
					["x"] = 589.9540405273438,
				},
				["raid3"] = {
					["y"] = 111.7855477388836,
					["x"] = -695.150078435494,
				},
				["raid1"] = {
					["y"] = 258.774280066895,
					["x"] = -686.191684840379,
				},
				["raid8"] = {
					["y"] = -195.7179970116104,
					["x"] = -693.9137504288789,
				},
				["raidMAINASSIST"] = {
					["y"] = 275.6922607421875,
					["x"] = -60.01397705078125,
				},
				["raid"] = {
					["y"] = 352.130111574071,
					["x"] = -709.936746835307,
				},
				["raid2"] = {
					["y"] = 176.2986743539569,
					["x"] = -695.888485358059,
				},
				["partypet"] = {
					["y"] = 195.047607421875,
					["x"] = 362.9010620117188,
				},
			},
			["groups"] = {
				["mainassisttarget"] = {
					["hidden"] = true,
				},
				["targettargettarget"] = {
					["width"] = 136,
					["height"] = 27,
				},
				["partytarget"] = {
					["hidden"] = true,
					["width"] = 123,
					["direction"] = "up",
					["spacing"] = 31,
					["height"] = 35,
				},
				["mainassisttargettarget"] = {
					["hidden"] = true,
				},
				["party"] = {
					["border"] = "Blizzard Tooltip",
					["width"] = 160,
					["height"] = 20,
					["hspacing"] = 18,
				},
				["maintanktarget"] = {
					["direction"] = "up",
					["hidden"] = true,
					["width"] = 104,
					["spacing"] = 1,
					["height"] = 18,
					["border"] = "Blizzard Tooltip",
				},
				["focus"] = {
					["scale"] = 1.1,
					["border"] = "Blizzard Dialog",
					["width"] = 110,
					["height"] = 20,
				},
				["target"] = {
					["border"] = "Blizzard Dialog",
					["width"] = 295,
					["height"] = 45,
				},
				["raid"] = {
					["width"] = 110,
					["nameSort"] = false,
					["border"] = "Blizzard Tooltip",
					["groupStyle"] = "flatGroup",
					["spacing"] = 1,
					["height"] = 19,
					["groupFilter"] = {
						nil, -- [1]
						nil, -- [2]
						nil, -- [3]
						nil, -- [4]
						nil, -- [5]
						false, -- [6]
						false, -- [7]
						false, -- [8]
					},
				},
				["maintanktargettarget"] = {
					["direction"] = "up",
					["hidden"] = true,
					["width"] = 104,
					["height"] = 18,
					["border"] = "Blizzard Tooltip",
				},
				["focustarget"] = {
					["hidden"] = true,
				},
				["pet"] = {
					["scale"] = 1.15,
					["border"] = "Blizzard Tooltip",
					["width"] = 210,
					["height"] = 30,
				},
				["partypet"] = {
					["hidden"] = true,
				},
				["player"] = {
					["border"] = "Blizzard Tooltip",
					["width"] = 295,
					["height"] = 45,
				},
				["mainassist"] = {
					["hidden"] = true,
					["width"] = 295,
				},
				["pettarget"] = {
					["hidden"] = true,
				},
				["maintank"] = {
					["direction"] = "up",
					["border"] = "Blizzard Tooltip",
					["width"] = 110,
					["hidden"] = true,
					["spacing"] = 1,
					["height"] = 18,
				},
				["targettarget"] = {
					["border"] = "Blizzard Tooltip",
					["width"] = 120,
					["height"] = 15,
				},
			},
			["units"] = {
				["pet"] = {
					["y"] = -221.6952583638029,
					["x"] = -444.137815602123,
				},
				["player"] = {
					["y"] = -327.3601175675831,
					["x"] = -155.0000938353282,
				},
				["targettargettarget"] = {
					["y"] = -397.5970153808594,
					["x"] = 247.5613403320313,
				},
				["focus"] = {
					["y"] = -284.3830628849226,
					["x"] = -471.8715905355228,
				},
				["target"] = {
					["y"] = -327.0574305744391,
					["x"] = 159.9995551336741,
				},
				["focustarget"] = {
					["y"] = 3.0517578125e-005,
					["x"] = -364.7765808105469,
				},
				["targettarget"] = {
					["y"] = -269.9859210929475,
					["x"] = 0.922901885287885,
				},
				["pettarget"] = {
					["y"] = 3.0517578125e-005,
				},
			},
		},
		["badrasta 1280x768"] = {
			["settings"] = {
				["colors"] = {
					["HUNTER"] = {
						0.6392156862745098, -- [1]
						1, -- [2]
						0.5098039215686274, -- [3]
					},
					["WARRIOR"] = {
						0.8274509803921568, -- [1]
						0.7529411764705882, -- [2]
						0.5882352941176471, -- [3]
					},
					["PALADIN"] = {
						0.9607843137254902, -- [1]
						0.5490196078431373, -- [2]
						0.7294117647058823, -- [3]
					},
					["MAGE"] = {
						0.4823529411764706, -- [1]
						[3] = 1,
					},
					["mana"] = {
						0.5764705882352941, -- [1]
						0.7803921568627451, -- [2]
						0.9803921568627451, -- [3]
					},
					["midHP"] = {
						0.7647058823529411, -- [1]
						[3] = 0.00392156862745098,
					},
					["hostile"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["focus"] = {
						0.796078431372549, -- [1]
						0.7254901960784314, -- [2]
						0.5019607843137255, -- [3]
					},
					["DRUID"] = {
						nil, -- [1]
						0.4901960784313725, -- [2]
						0.0392156862745098, -- [3]
					},
					["dead"] = {
						0.2549019607843137, -- [1]
						0.2784313725490196, -- [2]
						0.3215686274509804, -- [3]
					},
					["rage"] = {
						0.6235294117647059, -- [1]
						0.3803921568627451, -- [2]
						0.3764705882352941, -- [3]
					},
					["civilian"] = {
						0.8431372549019608, -- [1]
						0.1882352941176471, -- [2]
						0.1529411764705883, -- [3]
					},
					["SHAMAN"] = {
						0, -- [1]
						1, -- [2]
						0.996078431372549, -- [3]
					},
					["frameBG"] = {
						0.0196078431372549, -- [1]
						0.0196078431372549, -- [2]
						0.0196078431372549, -- [3]
						1, -- [4]
					},
					["friendly"] = {
						0.192156862745098, -- [1]
						0.4666666666666667, -- [2]
						0.196078431372549, -- [3]
					},
					["disconnected"] = {
						0.2666666666666667, -- [1]
						0.2862745098039216, -- [2]
						0.2588235294117647, -- [3]
					},
					["minHP"] = {
						nil, -- [1]
						0.2627450980392157, -- [2]
						0.1607843137254902, -- [3]
					},
					["maxHP"] = {
						0.1333333333333333, -- [1]
						[3] = 0.1607843137254902,
					},
					["WARLOCK"] = {
						0.7333333333333333, -- [1]
						0.6431372549019607, -- [2]
						1, -- [3]
					},
					["neutral"] = {
						0.8470588235294118, -- [1]
						0.7764705882352941, -- [2]
						0.3529411764705882, -- [3]
					},
					["PRIEST"] = {
						0.7411764705882353, -- [1]
						[3] = 0.996078431372549,
					},
					["ROGUE"] = {
						nil, -- [1]
						0.9607843137254902, -- [2]
						0.4117647058823529, -- [3]
					},
					["energy"] = {
						0.8941176470588235, -- [1]
						0.8666666666666667, -- [2]
						0.6588235294117647, -- [3]
					},
					["frameBorder"] = {
						nil, -- [1]
						0.9490196078431372, -- [2]
						0.996078431372549, -- [3]
						0, -- [4]
					},
				},
				["font"] = "bad large",
				["fontsize"] = 11,
				["texture"] = "Ruben",
			},
			["clusters"] = {
				["partypet"] = {
					["y"] = 195.047607421875,
					["x"] = 362.9010620117188,
				},
				["partytarget"] = {
					["y"] = -296.3219909667969,
					["x"] = -707.9836120605469,
				},
				["raidMAINTANK"] = {
					["y"] = -320.703857421875,
					["x"] = 722.9899291992188,
				},
				["raidMAINTANKtargettarget"] = {
					["y"] = -323.5165405273438,
					["x"] = 454.7994995117188,
				},
				["raid6"] = {
					["y"] = -80.10540662728488,
					["x"] = -693.9118819903097,
				},
				["raid7"] = {
					["y"] = -144.0424491448278,
					["x"] = -694.4332920163732,
				},
				["raidMAINASSIST"] = {
					["y"] = 275.6922607421875,
					["x"] = -60.01397705078125,
				},
				["raid4"] = {
					["y"] = 46.48354856522268,
					["x"] = -695.1504877125141,
				},
				["raidMAINTANKtarget"] = {
					["y"] = -319.7657012939453,
					["x"] = 589.9540405273438,
				},
				["party"] = {
					["y"] = 251.2658081054688,
					["x"] = -657.5822219848633,
				},
				["raid1"] = {
					["y"] = 243.9481085674026,
					["x"] = -695.0874412567919,
				},
				["raid8"] = {
					["y"] = -195.7179970116104,
					["x"] = -693.9137504288789,
				},
				["raid3"] = {
					["y"] = 111.7855477388836,
					["x"] = -695.150078435494,
				},
				["raid"] = {
					["y"] = 434.168701171875,
					["x"] = -726.7398490905762,
				},
				["raid2"] = {
					["y"] = 176.2986743539569,
					["x"] = -695.888485358059,
				},
				["raid5"] = {
					["y"] = -16.04191530523667,
					["x"] = -693.477149719206,
				},
			},
			["groups"] = {
				["mainassisttarget"] = {
					["hidden"] = true,
				},
				["targettargettarget"] = {
					["height"] = 27,
					["width"] = 136,
				},
				["partytarget"] = {
					["direction"] = "up",
					["spacing"] = 31,
					["height"] = 35,
					["hidden"] = true,
					["width"] = 123,
				},
				["mainassisttargettarget"] = {
					["hidden"] = true,
				},
				["party"] = {
					["height"] = 20,
					["width"] = 160,
					["border"] = "Blizzard Tooltip",
					["hspacing"] = 18,
				},
				["maintanktarget"] = {
					["direction"] = "up",
					["spacing"] = 1,
					["height"] = 18,
					["hidden"] = true,
					["border"] = "Blizzard Tooltip",
					["width"] = 104,
				},
				["focus"] = {
					["height"] = 20,
					["border"] = "Blizzard Dialog",
					["width"] = 110,
				},
				["target"] = {
					["height"] = 45,
					["border"] = "Blizzard Dialog",
					["width"] = 295,
				},
				["raid"] = {
					["spacing"] = 1,
					["nameSort"] = false,
					["height"] = 11,
					["border"] = "Blizzard Tooltip",
					["width"] = 155,
				},
				["focustarget"] = {
					["hidden"] = true,
				},
				["targettarget"] = {
					["height"] = 15,
					["border"] = "Blizzard Tooltip",
					["width"] = 120,
				},
				["partypet"] = {
					["hidden"] = true,
				},
				["player"] = {
					["height"] = 45,
					["border"] = "Blizzard Tooltip",
					["width"] = 295,
				},
				["mainassist"] = {
					["hidden"] = true,
					["width"] = 295,
				},
				["pet"] = {
					["height"] = 16,
					["border"] = "Blizzard Tooltip",
					["hidden"] = true,
					["width"] = 155,
				},
				["maintank"] = {
					["direction"] = "up",
					["spacing"] = 1,
					["height"] = 18,
					["border"] = "Blizzard Tooltip",
					["hidden"] = true,
					["width"] = 110,
				},
				["pettarget"] = {
					["hidden"] = true,
				},
				["maintanktargettarget"] = {
					["direction"] = "up",
					["height"] = 18,
					["hidden"] = true,
					["border"] = "Blizzard Tooltip",
					["width"] = 104,
				},
			},
			["units"] = {
				["pettarget"] = {
					["y"] = 3.0517578125e-005,
				},
				["player"] = {
					["y"] = -327.36010872533,
					["x"] = -155.0001117726644,
				},
				["targettargettarget"] = {
					["y"] = -397.5970153808594,
					["x"] = 247.5613403320313,
				},
				["focus"] = {
					["y"] = 425.9040590159669,
					["x"] = -3.146094657544648,
				},
				["target"] = {
					["y"] = -327.0574305744391,
					["x"] = 159.9995551336741,
				},
				["focustarget"] = {
					["y"] = 3.0517578125e-005,
					["x"] = -364.7765808105469,
				},
				["pet"] = {
					["y"] = -359.8209991364032,
					["x"] = -171.9349271781628,
				},
				["targettarget"] = {
					["y"] = -269.9859210929475,
					["x"] = 0.922901885287885,
				},
			},
		},
	},
	["currentProfile"] = {
		["Bàdrasta - Crushridge"] = "badrasta1280x1024",
	},
	["account"] = {
		["firstTimeWoW21"] = true,
		["customLayouts"] = {
			["players"] = {
				["name"] = "players",
				["pbRevision"] = 56911,
				["bars"] = {
					["portrait"] = {
						["side"] = "left",
						["position"] = 1,
					},
					["castBar"] = {
						["position"] = 8,
					},
					["healthBar"] = {
						["height"] = 3,
						["position"] = 2,
					},
					["expBar"] = {
						["height"] = 1,
						["position"] = 4,
					},
					["blankSpace"] = {
						["hidden"] = true,
						["position"] = 7,
					},
					["threatBar"] = {
						["position"] = 6,
					},
					["powerBar"] = {
						["height"] = 3,
						["position"] = 3,
					},
					["fullBar"] = {
						["height"] = 5,
						["position"] = 9,
					},
					["repBar"] = {
						["position"] = 5,
					},
				},
				["icons"] = {
					["restIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
					["masterIcon"] = {
						["position"] = "frame-edgetopleft",
					},
					["leaderIcon"] = {
						["position"] = "frame-edgetopleft",
						["size"] = 0.66,
					},
					["pvpIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["raidTargetIcon"] = {
						["position"] = "frame-edgetop",
					},
					["voiceIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["combatIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
				},
				["texts"] = {
					["combatText"] = {
						["position"] = "healthBar-left",
					},
					["Threat"] = {
						["styleType"] = "threat",
						["style"] = "Absolute Short",
						["custom"] = "[Threat]/[MaxThreat]",
						["position"] = "threatBar-right",
					},
					["Health"] = {
						["styleType"] = "health",
						["position"] = "frame-outbottomright",
						["custom"] = "[CurHP:Short:HideZero:HPColor] || [Dead?Text(Dead):Gray!Offline?Text(Offline):Gray!MaxHP:Short:Color(38610B)]",
						["size"] = 1.12,
					},
					["Combo"] = {
						["styleType"] = "combo",
						["style"] = "Standard",
						["position"] = "frame-outright",
					},
					["Reputation"] = {
						["styleType"] = "reputation",
						["style"] = "Standard",
						["position"] = "repBar-center",
					},
					["Name"] = {
						["styleType"] = "name",
						["position"] = "frame-outbottom",
						["style"] = "Hide",
						["size"] = 1.1,
					},
					["Power"] = {
						["styleType"] = "power",
						["position"] = "frame-outbottomleft",
						["custom"] = "[~HasNoMP?CurMP:Short:Color(81BEF7)] || [MaxMP:Short:Color(0174DF)]",
						["size"] = 1.1,
					},
					["name mid"] = {
						["position"] = "healthBar-right",
						["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
						["size"] = 1.26,
					},
				},
			},
			["mini"] = {
				["name"] = "mini",
				["pbRevision"] = 56911,
				["bars"] = {
					["portrait"] = {
						["side"] = "left",
						["position"] = 1,
					},
					["castBar"] = {
						["position"] = 8,
					},
					["healthBar"] = {
						["height"] = 3,
						["position"] = 2,
					},
					["expBar"] = {
						["height"] = 1,
						["position"] = 4,
					},
					["blankSpace"] = {
						["hidden"] = true,
						["position"] = 7,
					},
					["threatBar"] = {
						["position"] = 6,
					},
					["powerBar"] = {
						["height"] = 3,
						["position"] = 3,
					},
					["fullBar"] = {
						["height"] = 5,
						["position"] = 9,
					},
					["repBar"] = {
						["position"] = 5,
					},
				},
				["icons"] = {
					["restIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
					["masterIcon"] = {
						["position"] = "frame-edgetopleft",
					},
					["leaderIcon"] = {
						["position"] = "frame-edgetopleft",
						["size"] = 0.66,
					},
					["pvpIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["raidTargetIcon"] = {
						["position"] = "frame-edgetop",
					},
					["voiceIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["combatIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
				},
				["texts"] = {
					["Threat"] = {
						["styleType"] = "threat",
						["custom"] = "[Threat]/[MaxThreat]",
						["style"] = "Absolute Short",
						["position"] = "threatBar-right",
					},
					["Name"] = {
						["styleType"] = "name",
						["style"] = "Standard",
						["position"] = "frame-center",
						["custom"] = "[Name] [AFKDND:Angle]",
						["size"] = 1.25,
					},
					["Combo"] = {
						["styleType"] = "combo",
						["style"] = "Standard",
						["position"] = "frame-outright",
					},
					["Reputation"] = {
						["styleType"] = "reputation",
						["style"] = "Standard",
						["position"] = "repBar-center",
					},
					["combatText"] = {
						["position"] = "healthBar-outleft",
					},
					["name mid"] = {
						["position"] = "healthBar-right",
						["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
						["size"] = 1.26,
					},
				},
			},
			["rasta"] = {
				["name"] = "rasta",
				["pbRevision"] = 61101,
				["bars"] = {
					["healthBar"] = {
						["side"] = "center",
						["position"] = 2,
						["height"] = 12,
						["hidden"] = false,
						["reverse"] = false,
					},
					["portrait"] = {
						["position"] = 1,
						["side"] = "left",
						["hidden"] = false,
						["reverse"] = false,
					},
					["castBar"] = {
						["reverse"] = false,
						["side"] = "center",
						["hidden"] = false,
						["position"] = 9,
					},
					["fullBar"] = {
						["side"] = "center",
						["position"] = 10,
						["height"] = 5,
						["hidden"] = false,
						["reverse"] = false,
					},
					["expBar"] = {
						["side"] = "center",
						["position"] = 5,
						["height"] = 1,
						["hidden"] = false,
						["reverse"] = false,
					},
					["blankSpace"] = {
						["side"] = "center",
						["position"] = 8,
						["height"] = 1,
						["hidden"] = false,
						["reverse"] = false,
					},
					["threatBar"] = {
						["reverse"] = false,
						["hidden"] = false,
						["side"] = "center",
						["position"] = 7,
					},
					["druidManaBar"] = {
						["side"] = "center",
						["position"] = 4,
						["height"] = 1,
						["hidden"] = false,
						["reverse"] = false,
					},
					["powerBar"] = {
						["side"] = "center",
						["position"] = 3,
						["height"] = 10,
						["hidden"] = false,
						["reverse"] = false,
					},
					["repBar"] = {
						["reverse"] = false,
						["hidden"] = false,
						["side"] = "center",
						["position"] = 6,
					},
				},
				["icons"] = {
					["restIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
					["masterIcon"] = {
						["position"] = "frame-edgetopleft",
					},
					["leaderIcon"] = {
						["position"] = "frame-edgetopleft",
						["size"] = 0.66,
					},
					["pvpIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["raidTargetIcon"] = {
						["position"] = "frame-edgetop",
					},
					["voiceIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["combatIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
				},
				["texts"] = {
					["Threat"] = {
						["styleType"] = "threat",
						["custom"] = "[~HasNoThreat?Threat:Short]",
						["style"] = "Absolute Short",
						["position"] = "threatBar-right",
					},
					["Power"] = {
						["styleType"] = "power",
						["position"] = "frame-outbottomleft",
						["custom"] = "[~HasNoMP?CurMP:Short:Color(81BEF7)] || [MaxMP:Short:Color(0174DF)]",
						["size"] = 1.1,
					},
					["Reputation"] = {
						["styleType"] = "reputation",
						["custom"] = "[~IsMouseOver?FractionalRep] [~IsMouseOver?PercentRep:Percent:Paren!RepName]",
						["style"] = "Standard",
						["position"] = "repBar-center",
					},
					["DruidMana"] = {
						["styleType"] = "druidMana",
						["custom"] = "[~IsMana ? FractionalDruidMP]",
						["style"] = "Absolute",
						["position"] = "druidManaBar-right",
					},
					["name mid"] = {
						["position"] = "healthBar-right",
						["custom"] = "[Outline][~Dead?~IsMaxHP?PercentHP:Percent:HPColor]",
						["size"] = 1.26,
					},
					["Cast"] = {
						["styleType"] = "cast",
						["style"] = "Standard Name",
						["custom"] = "[Alpha([[CastStopTime-CurrentTime+1]:1])][CastStopMessage:Text([CastName] [CastTarget:Paren])]",
						["position"] = "castBar-left",
					},
					["Name"] = {
						["styleType"] = "name",
						["style"] = "Standard",
						["position"] = "frame-outbottom",
						["custom"] = "[Name] [AFKDND:Angle]",
						["size"] = 1.25,
					},
					["combatText"] = {
						["position"] = "healthBar-left",
					},
					["CastTime"] = {
						["styleType"] = "cast",
						["custom"] = "[~CastStopTime?Text([CastDelay:Round(1):HideZero:Prepend(+):Red] [[CastEndTime-CurrentTime]:Round(1)>=0])]",
						["style"] = "Standard Time",
						["position"] = "castBar-right",
					},
					["Health"] = {
						["styleType"] = "health",
						["position"] = "frame-outbottomright",
						["custom"] = "[CurHP:Short:HideZero:HPColor] || [Dead?Text(Dead):Gray!Offline?Text(Offline):Gray!MaxHP:Short:Color(38610B)]",
						["size"] = 1.12,
					},
					["Combo"] = {
						["styleType"] = "combo",
						["style"] = "Standard",
						["position"] = "frame-outright",
					},
				},
			},
			["mt"] = {
				["name"] = "mt",
				["pbRevision"] = 44755,
				["bars"] = {
					["castBar"] = {
						["position"] = 8,
					},
					["healthBar"] = {
						["height"] = 5,
						["position"] = 2,
					},
					["expBar"] = {
						["position"] = 4,
					},
					["blankSpace"] = {
						["hidden"] = true,
						["position"] = 7,
					},
					["threatBar"] = {
						["position"] = 6,
					},
					["portrait"] = {
						["side"] = "left",
						["position"] = 1,
					},
					["powerBar"] = {
						["height"] = 1,
						["position"] = 3,
					},
					["repBar"] = {
						["position"] = 5,
					},
				},
				["icons"] = {
					["restIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
					["masterIcon"] = {
						["position"] = "frame-edgetopleft",
					},
					["leaderIcon"] = {
						["position"] = "frame-edgetopleft",
					},
					["pvpIcon"] = {
						["position"] = "frame-edgetopright",
					},
					["raidTargetIcon"] = {
						["position"] = "frame-edgetop",
					},
					["combatIcon"] = {
						["position"] = "frame-edgebottomleft",
					},
				},
				["texts"] = {
					["Health"] = {
						["styleType"] = "health",
						["custom"] = "[Status:PercentHP:Percent]",
						["position"] = "healthBar-right",
						["style"] = "Percent",
						["size"] = 1.19,
					},
					["combatText"] = {
						["position"] = "frame-center",
					},
					["Reputation"] = {
						["styleType"] = "reputation",
						["style"] = "Standard",
						["position"] = "repBar-center",
					},
					["Experience"] = {
						["styleType"] = "experience",
						["style"] = "Standard",
						["position"] = "expBar-center",
					},
					["Combo"] = {
						["styleType"] = "combo",
						["style"] = "Standard",
						["position"] = "frame-outright",
					},
					["Name"] = {
						["styleType"] = "name",
						["custom"] = "[Name]",
						["position"] = "healthBar-left",
						["style"] = "Standard",
						["size"] = 1.19,
					},
				},
			},
		},
	},
}
