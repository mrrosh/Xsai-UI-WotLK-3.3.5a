local f = CreateFrame("FRAME")
local LSM = LibStub("LibSharedMedia-3.0")
local widgetLists = AceGUIWidgetLSMlists
local db

local positions = {"TOP", "TOPRIGHT", "TOPLEFT",
					"BOTTOM", "BOTTOMRIGHT", "BOTTOMLEFT",
					"RIGHT", "LEFT", "CENTER"}
local formats = {"100/100", "100%", "100/100 (100%)"}

local defaults = {
	profile = {
		alpha = 1,
		scale = 1,
		font = "Friz Quadrata TT",
		bg = "brushed",
		bgColor = {r=.09, g=.09, b=.19},	--TOOLTIP_DEFAULT_BACKGROUND_COLOR
		border = "Seerah Solid",
		borderWidth = 2.5,
		inset = 0,
		classColor = true,
		itemColor = true,
		borderColor = {r=.6, g=.6, b=.6, a=1},
		healthBar = "TipTop Default",
		sbarbg = "TipTop Default",
		sbarbgcolor = {r=0, g=0, b=0, a=.4},
		topBar = false,
		raidIconSize = 16,
		raidIconPosition = "TOP",
		raidIconX = "0",
		raidIconY = "0",
		onCursor = false,
		anchor = "BOTTOMRIGHT",
		offsetX = "-2",
		offsetY = "109",
		showTargetText = true,
		you = true,
		showTalentText = true,
		healthText = true,
		textformat = "100%",
	},
}

local options = {
	name = "TipTop Options",
	type = "group",
	args = {
		header1 = {
			name = "Appearance",
			type = "header",
			order = 1,
		},
		font = {
			name = "Font",
			desc = "Select the font for the tooltip and health text.",
			type = "select",
			dialogControl = "LSM30_Font",
			values = widgetLists.font,
			get = function()
					return db.font
				end,
			set = function(self, font)
					db.font = font
					TipTop:SetUpTips()
				end,
			order = 2,
		},
		scale = {
			name = "Tooltip scale",
			desc = "The scale of the entire tooltip.",
			type = "range",
			min = .5,
			max = 2,
			step = .05,
			get = function() return db.scale end,
			set = function(_, scale) 
						db.scale = scale
						TipTop:SetUpTips()
					end,
			order = 3,
		},
		bgColor = {
			name = "Background Color/Alpha",
			desc = "The background color and transparency.\n\nIf you wish to use a custom background texture and do not want it colored, set this to white.",
			type = "color",
			hasAlpha = true,
			get = function() return db.bgColor.r, db.bgColor.g, db.bgColor.b, db.alpha end,
			set = function(_,r,g,b,a)
					db.bgColor.r = r
					db.bgColor.g = g
					db.bgColor.b = b
					db.alpha = a
					TipTop:SetUpTips()
				end,
			order = 4,
		},
		bg = {
			name = "Background",
			desc = "Texture to use as the tip's background.",
			type = "select",
			dialogControl = "LSM30_Background",
			values = widgetLists.background,
			get = function()
					return db.bg
				end,
			set = function(self, bg)
					db.bg = bg
					TipTop:SetUpTips()
				end,
			order = 5,
		},
		empty1 = {
			name = "   ",
			type = "description",
			order = 6,
		},
		header2 = {
			name = "Health Bar",
			type = "header",
			order = 7,
		},
		healthBar = {
			name = "Health bar texture",
			desc = "Texture to use for the status bar below the tooltip.",
			type = "select",
			dialogControl = "LSM30_Statusbar",
			values = widgetLists.statusbar,
			get = function()
					return db.healthBar
				end,
			set = function(self, healthBar)
					db.healthBar = healthBar
					TipTop:SetUpTips()
				end,
			order = 8,
		},
		topBar = {
			name = "Health bar on top",
			desc = "If checked, the health bar will be displayed above the tooltip instead of below.",
			type = "toggle",
			get = function() return db.topBar end,
			set = function()
						db.topBar = not db.topBar
						TipTop:SetUpTips()
					end,
			order = 8.5,
		},
		sbarbg = {
			name = "Background texture",
			desc = "Texture to use for the status bar's background.",
			type = "select",
			dialogControl = "LSM30_Statusbar",
			values = widgetLists.statusbar,
			get = function()
					return db.sbarbg
				end,
			set = function(self, sbarbg)
					db.sbarbg = sbarbg
					TipTop:SetUpTips()
				end,
			order = 9,
		},
		sbarbgcolor = {
			name = "Background Color",
			desc = "The color of the health bar's background.",
			type = "color",
			hasAlpha = true,
			get = function() return db.sbarbgcolor.r, db.sbarbgcolor.g, db.sbarbgcolor.b, db.sbarbgcolor.a end,
			set = function(_,r,g,b,a)
					db.sbarbgcolor.r = r
					db.sbarbgcolor.g = g
					db.sbarbgcolor.b = b
					db.sbarbgcolor.a = a
					TipTop:SetUpTips()
				end,
			order = 9.5,
		},
		healthText = {
			name = "Health text",
			desc = "If checked, health percentage will be displayed on the tooltip's status bar.",
			type = "toggle",
			get = function() return db.healthText end,
			set = function()
						db.healthText = not db.healthText
						if db.healthText == true then
							ttHealth:Show()
						else
							ttHealth:Hide()
						end
					end,
			order = 10,
		},
		textformat = {
			name = "Text format",
			desc = "Select how you would like health text displayed.",
			type = "select",
			disabled = function() return not db.healthText end,
			values = formats,
			get = function()
						for k, v in pairs(formats) do
							if db.textformat == v then
								return k
							end
						end
					end,
			set = function(_, textformat)
					db.textformat = formats[textformat]
					TipTop:HealthFormat(db.textformat)
				end,
			order = 10.5,
		},
		empty2 = {
			name = "   ",
			type = "description",
			order = 10.75,
		},
		header3 = {
			name = "Borders",
			type = "header",
			order = 11,
		},
		border = {
			name = "Border",
			desc = "Texture for the tooltip borders.",
			type = "select",
			dialogControl = "LSM30_Border",
			values = widgetLists.border,
			get = function()
					return db.border
				end,
			set = function(self, border)
					db.border = border
					TipTop:SetUpTips()
				end,
			order = 12,
		},
		borderColor = {
			name = "Border color",
			desc = "Color of the border when not class or item quality colored.",
			type = "color",
			hasAlpha = true,
			get = function() return db.borderColor.r, db.borderColor.g, db.borderColor.b, db.borderColor.a end,
			set = function(_,r,g,b,a)
						db.borderColor.r = r
						db.borderColor.g = g
						db.borderColor.b = b
						db.borderColor.a = a
						TipTop:SetUpTips()
					end,
			order = 13,
		},
		borderWidth = {
			name = "Border Width",
			desc = "Width of the border.",
			type = "range",
			min = 1,
			max = 24,
			step = .5,
			get = function() return db.borderWidth end,
			set = function(_, borderWidth) 
						db.borderWidth = borderWidth
						TipTop:SetUpTips()
					end,
			order = 14,
		},
		inset = {
			name = "Inset",
			desc = "The inset of the background from the border texture.",
			type = "range",
			min = 0,
			max = 10,
			step = .5,
			get = function() return db.inset end,
			set = function(_, inset) 
						db.inset = inset
						TipTop:SetUpTips()
					end,
			order = 14.5,
		},
		classColor = {
			name = "Class-colored borders",
			desc = "If checked, the border is colored by class when mousing over a unit",
			type = "toggle",
			get = function() return db.classColor end,
			set = function()
						db.classColor = not db.classColor
					end,
			order = 15,
		},
		itemColor = {
			name = "Item quality borders",
			desc = "If checked, the border is colored by item quality when mousing over an item",
			type = "toggle",
			get = function() return db.itemColor end,
			set = function()
						db.itemColor = not db.itemColor
					end,
			order = 16,
		},
		empty3 = {
			name = "   ",
			type = "description",
			order = 17,
		},
		header4 = {
			name = "Raid Icon",
			type = "header",
			order = 18,
		},
		raidIconSize = {
			name = "Raid icon size",
			desc = "Width and height of the raid icon on the tooltip",
			type = "range",
			min = 8,
			max = 32,
			step = 1,
			get = function() return db.raidIconSize end,
			set = function(_, raidIconSize) 
						db.raidIconSize = raidIconSize
						TipTop:SetUpTips()
					end,
			order = 19,
		},
		raidIconPosition = {
			name = "Raid icon position",
			desc = "What side of the tip you would like the icon located at.",
			type = "select",
			values = positions,
			get = function()
						for k, v in pairs(positions) do
							if db.raidIconPosition == v then
								return k
							end
						end
					end,
			set = function(_, raidIconPosition)
						db.raidIconPosition = positions[raidIconPosition]
						TipTop:SetUpTips()
					end,
			order = 20,
		},
		raidIconX = {
			name = "X Offset",
			desc = "Offsets from the icon's position left/right",
			type = "input",
			get = function() return db.raidIconX end,
			set = function(_,raidIconX)
						if raidIconX == nil or raidIconX == "" then
							raidIconX = "0"
						end
						db.raidIconX = raidIconX
						TipTop:SetUpTips()
					end,
			order = 21,
		},
		raidIconY = {
			name = "Y Offset",
			desc = "Offsets from the icon's position up/down",
			type = "input",
			get = function() return db.raidIconY end,
			set = function(_,raidIconY)
						if raidIconY == nil or raidIconY == "" then
							raidIconY = "0"
						end
						db.raidIconY = raidIconY
						TipTop:SetUpTips()
					end,
			order = 22,
		},
		empty4 = {
			name = "   ",
			type = "description",
			order = 23,
		},
		header5 = {
			name = "Position",
			type = "header",
			order = 24,
		},
		onCursor = {
			name = "On Cursor",
			desc = "Whether you want the tooltip attached to the cursor or not.\n\nNote: If checked, anchor and offsets below do not apply.",
			type = "toggle",
			get = function() return db.onCursor end,
			set = function()
						db.onCursor = not db.onCursor
					end,
			order = 25,
		},
		anchor = {
			name = "Tip Anchor",
			desc = "What side of the screen you would like the tooltip located at.",
			type = "select",
			disabled = function() return db.onCursor end,
			values = positions,
			get = function()
						for k, v in pairs(positions) do
							if db.anchor == v then
								return k
							end
						end
					end,
			set = function(_, anchor)
						db.anchor = positions[anchor]
					end,
			order = 26,
		},
		offsetX = {
			name = "X Offset",
			desc = "Offsets from the tooltip's anchor left/right",
			type = "input",
			disabled = function() return db.onCursor end,
			get = function() return db.offsetX end,
			set = function(_,offsetX)
						if offsetX == nil or offsetX == "" then
							offsetX = "0"
						end
						db.offsetX = offsetX
					end,
			order = 27,
		},
		offsetY = {
			name = "Y Offset",
			desc = "Offsets from the tooltip's anchor up/down",
			type = "input",
			disabled = function() return db.onCursor end,
			get = function() return db.offsetY end,
			set = function(_,offsetY)
						if offsetY == nil or offsetY == "" then
							offsetY = "0"
						end
						db.offsetY = offsetY
					end,
			order = 28,
		},
		empty5 = {
			name = "   ",
			type = "description",
			order = 29,
		},
		header6 = {
			name = "Extra Lines",
			type = "header",
			order = 30,
		},
		showTargetText = {
			name = "Target text",
			desc = "Whether you wish to view the mouseover unit's target in the tooltip",
			type = "toggle",
			get = function() return db.showTargetText end,
			set = function()
						db.showTargetText = not db.showTargetText
					end,
			order = 31,
		},
		you = {
			name = "Target emphasis",
			desc = "When checked, if the mouseover unit's target is you, it will be displayed as |c00E30016<<YOU>>|r.",
			type = "toggle",
			disabled = function() return not db.showTargetText end,
			get = function() return db.you end,
			set = function()
						db.you = not db.you
					end,
			order = 32,
		},
		showTalentText = {
			name = "Talent text",
			desc = "Whether you wish to view the mouseover unit's talent info in the tooltip",
			type = "toggle",
			get = function() return db.showTalentText end,
			set = function()
						db.showTalentText = not db.showTalentText
					end,
			order = 33,
		},
	},
}

local function OnInitialize()
	TipTop.db = LibStub("AceDB-3.0"):New("TipTopDB", defaults, "Default")
	db = TipTop.db.profile
	LibStub("AceConfig-3.0"):RegisterOptionsTable("TipTop", options)
	TipTop.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("TipTop", "TipTop")
end	
	LSM:Register("statusbar", "TipTop Default", "Interface\\AddOns\\TipTop\\bar2.blp")
	LSM:Register("statusbar", "TipTop Alt", "Interface\\AddOns\\TipTop\\bar1.blp")
	LSM:Register("border", "Seerah Solid", "Interface\\AddOns\\TipTop\\SeerahSolidBorder.blp")
	LSM:Register("background", "brushed", "Interface\\AddOns\\TipTop\\brushed.tga")
--end

	
f:SetScript("OnEvent", OnInitialize)
f:RegisterEvent("PLAYER_LOGIN")