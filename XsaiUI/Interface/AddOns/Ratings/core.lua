local string_find = string.find
local string_match = string.match
local string_len = string.len
local string_sub = string.sub
local string_replace = string.replace
local string_lower = string.lower
local string_format = string.format
local string_gsub = string.gsub
local pairs = pairs
local next = next
local tonumber = tonumber
local select = select

RatingsDB = {
	forceLevel = nil,
	format = " ($V@$L)",
}

local SEPARATORS, PATTERNS, STATS
if GetLocale() == "enUS" then
	SEPARATORS = {
		[","] = true,
		[" and "] = true,
		["/"] = true,
		[". "] = true,
	--	[" for "] = true,
		["&"] = true,
	--	[":"] = true,
	}
	PATTERNS = {
		[" by (%d+)"] = true,
		["([%+%-]%d+)"] = false,
		["grant.-(%d+)"] = true,
		["add.-(%d+)"] = true,
		["(%d+)([^%d%%|]+)"] = false,
	}
	STATS = {
		{"defense rating", CR_DEFENSE_SKILL},
		{"dodge rating", CR_DODGE},
		{"block rating", CR_BLOCK},
		{"parry rating", CR_PARRY},
		{"ranged critical strike rating", CR_CRIT_RANGED},
		{"ranged critical hit rating", CR_CRIT_RANGED},
		{"ranged critical rating", CR_CRIT_RANGED},
		{"ranged crit rating", CR_CRIT_RANGED},
		{"critical strike rating", CR_CRIT_MELEE},
		{"critical hit rating", CR_CRIT_MELEE},
		{"critical rating", CR_CRIT_MELEE},
		{"crit rating", CR_CRIT_MELEE},
		{"ranged hit rating", CR_HIT_RANGED},
		{"hit rating", CR_HIT_MELEE},
		{"resilience", CR_CRIT_TAKEN_MELEE},
		{"ranged haste rating", CR_HASTE_RANGED},
		{"haste rating", CR_HASTE_MELEE},
		{"skill rating", CR_WEAPON_SKILL},
		{"expertise rating", CR_EXPERTISE},
		{"hit avoidance rating", CR_HIT_TAKEN_MELEE},
		{"armor penetration rating", CR_ARMOR_PENETRATION},
	}
elseif GetLocale() == "frFR" then
	SEPARATORS = {
		["/"] = true,
		[" et "] = true,
		[","] = true,
		[". "] = true,
	}
	PATTERNS = {
		[" de (%d+)"] = true,
		["([%+%-]%d+)"] = false,
		["(%d+) \195\160 "] = true,
		["(%d+) au"] = false,
	}
	STATS = {
		{"score de défense", CR_DEFENSE_SKILL},
		{"score d'esquive", CR_DODGE},
		{"score de blocage", CR_BLOCK},
		{"score de parade", CR_PARRY},
		{"score de coup critique à distance", CR_CRIT_RANGED},
		{"score de critique à distance", CR_CRIT_RANGED},
--~ 		{"ranged critical rating", CR_CRIT_RANGED},
--~ 		{"ranged crit rating", CR_CRIT_RANGED},
		{"score de coup critique", CR_CRIT_MELEE},
		{"score de critique", CR_CRIT_MELEE},
--~ 		{"critical rating", CR_CRIT_MELEE},
--~ 		{"crit rating", CR_CRIT_MELEE},
		{"score de toucher à distance", CR_HIT_RANGED},
		{"score de toucher", CR_HIT_MELEE},
		{"résilience", CR_CRIT_TAKEN_MELEE},
		{"score de hâte à distance", CR_HASTE_RANGED},
		{"score de hâte", CR_HASTE_MELEE},
		{"score de la compétence", CR_WEAPON_SKILL},
		{"score d'expertise", CR_EXPERTISE},
		{"expertise", CR_EXPERTISE},
		{"score d'évitement des coups", CR_HIT_TAKEN_MELEE},
		{"score de pénétration d'armure", CR_ARMOR_PENETRATION},
	}
elseif GetLocale() == "deDE" then
	SEPARATORS = {
		["/"] = true,
		[" und "] = true,
		[","] = true,
		[". "] = true,
		[" f\195\188r "] = true,
		["&"] = true,
		[":"] = true,
	}
	PATTERNS = {
		[" um (%d+)"] = true,
		["([%+%-]%d+)"] = false,
		["verleiht.-(%d+)"] = true,
		["(%d+) erhöhen."] = true,
		["(%d+)([^%d%%|]+)"] = true,
	}
	STATS = {
		{"verteidigungswertung", CR_DEFENSE_SKILL},
		{"ausweichwertung", CR_DODGE},
		{"blockwertung", CR_BLOCK},
		{"parierwertung", CR_PARRY},
		{"kritische distanztrefferwertung", CR_CRIT_RANGED},
		{"kritische trefferwertung", CR_CRIT_MELEE},
		{"kritische zaubertrefferwertung", CR_CRIT_SPELL},
		{"trefferwertung", CR_HIT_RANGED},
		{"trefferwertung", CR_HIT_MELEE},
		{"zaubertrefferwertung", CR_HIT_SPELL},
		{"abh\195\164rtung", CR_CRIT_TAKEN_MELEE},
		{"zaubertempowertung", CR_HASTE_SPELL},
		{"distanztempowertung", CR_HASTE_RANGED},
		{"angriffstempowertung", CR_HASTE_MELEE},
		{"nahkampftempowertung", CR_HASTE_MELEE},
		{"tempowertung", CR_HASTE_MELEE},
		{"waffenkundewertung", CR_EXPERTISE},
		{"r\195\188stungsdurchschlagwert", CR_ARMOR_PENETRATION},
	}
else
	DisableAddOn("Ratings")
	return
end

local Ratings = {}

do
	local hook_otsi = function (...) Ratings:OnTooltipSetItem(...) end
	local hook_otc = function (...) Ratings:OnTooltipCleared(...) end
	function Ratings:HookTooltip(tt)
		tt:HookScript("OnTooltipSetItem", hook_otsi)
		tt:HookScript("OnTooltipCleared", hook_otc)
	end
end

function Ratings:OnTooltipSetItem(tt)
	if not tt.ratings_set then
		tt.ratings_set = true
		self:HandleFontStrings(tt:GetRegions())
	end
end

function Ratings:OnTooltipCleared(tt)
	tt.ratings_set = nil
end

function Ratings:HandleFontStrings(...)
	for i = 1, select("#", ...) do
		local region = select(i, ...)
		if region.GetText and region:IsShown() then
			region:SetText(self:ReplaceText(region:GetText()))
		end
	end
end

do
	local function get_next_chunk(text, p)
		local lstart, lend
		for sep in pairs(SEPARATORS) do
			local s, e = string_find(text, sep, p, true)
			if s then
				if not lstart or lstart > s then
					lstart, lend = s, e
				end
			end
		end
		if not lstart then
			return string_sub(text, p), -1
		else
			return string_sub(text, p, lstart - 1), lend + 1
		end
	end

	local replacements = {}
	function Ratings:ReplaceText(text)
		if not text or not text:find("%d") then return text end
		local pos = 1
		while pos > 0 do
			local sub
			sub, pos = get_next_chunk(text, pos)
			replacements[sub] = self:GetReplacementText(sub)
		end
		while true do
			local sub, rep = next(replacements)
			if not sub then return text end
			replacements[sub] = nil
			text = string_replace(text, sub, rep)
		end
	end

	function Ratings:GetReplacementText(text)
		local lower_text = string_lower(text)
		for pattern, after in pairs(PATTERNS) do
			local value, partial = string_match(lower_text, pattern)
			if value then
				if tonumber(partial) then
					partial, value = value, partial
				end
				local check = partial or lower_text
				for _, info in pairs(STATS) do
					local stat, id = info[1], info[2]
					if string_find(check, stat, 1, true) then
						local bonus = self:GetRatingBonus(id, tonumber(value))
						if not bonus then return end
						if after then
							return string_replace(text, value, value .. bonus)
						else
							local s, e = string_find(lower_text, stat, 1, true)
							stat = string_sub(text, s, e)
							return string_replace(text, stat, stat .. bonus)
						end
					end
				end
			end
		end
	end
end

do
	local CombatRatingMap = {
		[CR_WEAPON_SKILL] = 2.5,
		[CR_DEFENSE_SKILL] = 1.5,
		[CR_DODGE] = 12,
		[CR_PARRY] = 15,
		[CR_BLOCK] = 5,
		[CR_HIT_MELEE] = 10,
		[CR_CRIT_MELEE] = 14,
		[CR_HIT_RANGED] = 10,
		[CR_CRIT_RANGED] = 14,
		[CR_HASTE_MELEE] = 10,
		[CR_HASTE_RANGED] = 10,
		[CR_HIT_SPELL] = 8,
		[CR_CRIT_SPELL] = 14,
		[CR_HASTE_SPELL] = 10,
		[CR_CRIT_TAKEN_MELEE] = 25,
		[CR_HIT_TAKEN_MELEE] = 10,
		[CR_EXPERTISE] = 2.5,
		[CR_ARMOR_PENETRATION] = 4.69512177,
	}

	local ratingMultiplier = setmetatable({},{
		__index = function (self, level)
			--[[
			The following calculations are based on Whitetooth's calculations:
			http://www.wowinterface.com/downloads/info5819-Rating_Buster.html
			]]
			local value
			if level < 10 then
				value = 26
			elseif level <= 60 then
				value = 52 / (level - 8)
			elseif level <= 70 then
				value = (262-3*level) / 82
			elseif level <= 80 then
				value = 1 / ((82/52)*(131/63)^((level-70)/10))
			end
			self[level] = value
			return value
		end,
	})

	function Ratings:GetRatingBonus(type, value)
		local F = CombatRatingMap[type]
		if not F then return end
		local level = RatingsDB.forceLevel or UnitLevel"player"
		local bonus = value / F * ratingMultiplier[level]
		if type <= 2 or type == 24 then -- SKILLS or EXPERTISE are not percentages
			return self:Format(bonus, level)
		else
			return self:Format(bonus, level, true)
		end
	end
end

do
	local format_table = {}
	function Ratings:Format(bonus, level, has_percent)
		if has_percent then
			format_table.V = string_format("%.2f%%", bonus)
		else
			format_table.V = string_format("%.2f", bonus)
		end
		format_table.L = tostring(level)
		return string_gsub(RatingsDB.format, "%$([A-Z])", format_table)
	end
end

Ratings:HookTooltip(GameTooltip)
Ratings:HookTooltip(ItemRefTooltip)
Ratings:HookTooltip(ShoppingTooltip1)
Ratings:HookTooltip(ShoppingTooltip2)

_G.Ratings = Ratings

do
	local panel = CreateFrame"Frame"
	panel.name = "Ratings"
	
	local function CreateTexture(parent, texture, mode)
		local t = parent:CreateTexture()
		t:SetTexture(texture)
		t:SetAllPoints()
		if mode then t:SetBlendMode(mode) end
		return t
	end
	
	local cb = CreateFrame("CheckButton", nil, panel)
	cb:SetPoint("TOPLEFT", 20, -20)
	cb:SetWidth(26) cb:SetHeight(26)
	cb:SetNormalTexture(CreateTexture(cb, "Interface\\Buttons\\UI-CheckBox-Up"))
	cb:SetPushedTexture(CreateTexture(cb, "Interface\\Buttons\\UI-CheckBox-Down"))
	cb:SetHighlightTexture(CreateTexture(cb, "Interface\\Buttons\\UI-CheckBox-Highlight", "ADD"))
	cb:SetCheckedTexture(CreateTexture(cb, "Interface\\Buttons\\UI-CheckBox-Check"))
	cb:SetDisabledCheckedTexture(CreateTexture(cb, "Interface\\Buttons\\UI-CheckBox-Check-Disabled"))
	
	cb:SetScript("OnClick", function (self)
		if self:GetChecked() then
			self.dependency:Enable()
			RatingsDB.forceLevel = self.dependency:GetValue()
		else
			self.dependency:Disable()
			RatingsDB.forceLevel = nil
		end
	end)
	
	local text = cb:CreateFontString(nil, "ARTWORK")
	text:SetPoint("LEFT", cb, "RIGHT", 0, 1)
	text:SetFontObject(GameFontHighlight)
	text:SetText"Force the level used for rating conversion"
	
	local slider = CreateFrame("Slider", nil, panel)
	slider:SetPoint("TOPLEFT", cb, "BOTTOMLEFT", 5, -15)
	slider:SetWidth(244) slider:SetHeight(17)
	slider:SetBackdrop{
		bgFile = "Interface\\Buttons\\UI-SliderBar-Background",
		edgeFile = "Interface\\Buttons\\UI-SliderBar-Border",
		tile = true,
		edgeSize = 8,
		tileSize = 8,
		insets = {
			left = 3,
			right = 3,
			top = 6,
			bottom = 6,
		},
	}
	local thumb = CreateTexture(slider, "Interface\\Buttons\\UI-SliderBar-Button-Horizontal")
	thumb:SetWidth(32) thumb:SetHeight(32)
	slider:SetThumbTexture(thumb)

	text = slider:CreateFontString(nil, "ARTWORK")
	text:SetPoint("BOTTOM", slider, "TOP")
	text:SetFontObject(GameFontHighlight)
	slider.text = text

	text = slider:CreateFontString(nil, "ARTWORK")
	text:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", -4, 3)
	text:SetFontObject(GameFontHighlightSmall)
	text:SetText(LOW)
	slider.low = text

	text = slider:CreateFontString(nil, "ARTWORK")
	text:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT", 4, 3)
	text:SetFontObject(GameFontHighlightSmall)
	text:SetText(HIGH)
	slider.high = text

	slider.Disable = function (self)
		local color = GRAY_FONT_COLOR
		getmetatable(self).__index.Disable(self)
		self.text:SetVertexColor(color.r, color.g, color.b)
		self.low:SetVertexColor(color.r, color.g, color.b)
		self.high:SetVertexColor(color.r, color.g, color.b)
	end

	slider.Enable = function (self)
		local color = NORMAL_FONT_COLOR
		getmetatable(self).__index.Enable(self)
		self.text:SetVertexColor(color.r, color.g, color.b)
		color = HIGHLIGHT_FONT_COLOR
		self.low:SetVertexColor(color.r, color.g, color.b)
		self.high:SetVertexColor(color.r, color.g, color.b)
	end

	slider:SetMinMaxValues(10, 80)
	slider:SetValueStep(1)
	slider:SetValue(RatingsDB.forceLevel or UnitLevel"player")
	slider.text:SetText(slider:GetValue())
	slider:SetOrientation"HORIZONTAL"
	
	slider:SetScript("OnValueChanged", function (self, value)
		self.text:SetFormattedText("Level %d", value)
	end)

	cb.dependency = slider
	
	local edit = CreateFrame("EditBox", nil, panel, "InputBoxTemplate")
	text = edit:CreateFontString()
	text:SetFontObject(GameFontHighlight)
	text:SetText"Format of the inserted text:"
	text:SetPoint("TOPLEFT", cb, "BOTTOMLEFT", 0, -50)
	edit:SetPoint("LEFT", text, "RIGHT", 5, 0)
	edit:SetWidth(180)
	edit:SetHeight(19)
	edit:SetFontObject(ChatFontNormal)
	edit:SetAutoFocus(false)
	edit:ClearFocus()
	edit:SetTextInsets(0,0,3,3)
	
	panel.cb = cb
	panel.slider = slider
	panel.edit = edit
	panel.refresh = function(self)
		if RatingsDB.forceLevel then
			self.slider:Enable()
			self.slider:SetValue(RatingsDB.forceLevel)
			self.slider.text:SetFormattedText("Level %d", RatingsDB.forceLevel)
		else
			self.slider:Disable()
		end
		self.edit:SetText(RatingsDB.format)
		self.edit:SetCursorPosition(0)
	end
	
	panel.okay = function (self)
		if self.cb:GetChecked() then
			RatingsDB.forceLevel = self.slider:GetValue()
		else
			RatingsDB.forceLevel = nil
		end 
		RatingsDB.format = self.edit:GetText()
	end
	
	InterfaceOptions_AddCategory(panel)
end