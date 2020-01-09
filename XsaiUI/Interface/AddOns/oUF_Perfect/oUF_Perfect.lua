local colors = setmetatable({
	power = setmetatable({
		['MANA'] = {0, 144/255, 1},
	}, {__index = oUF.colors.power}),
}, {__index = oUF.colors})

local font = "Interface\\AddOns\\oUF_P3lim\\fonts\\font.ttf"
local upperfont = "Interface\\AddOns\\oUF_P3lim\\fonts\\upperfont.ttf"
local fontsize = 16
local fontsize2 = 16

local function menu(self)
	if(self.unit:match('party')) then
		ToggleDropDownMenu(1, nil, _G['PartyMemberFrame'..self.id..'DropDown'], 'cursor')
	else
		FriendsDropDown.unit = self.unit
		FriendsDropDown.id = self.id
		FriendsDropDown.initialize = RaidFrameDropDown_Initialize
		ToggleDropDownMenu(1, nil, FriendsDropDown, 'cursor')
	end
end

oUF.Tags['[smarthp]'] = function(u)
	local min, max = UnitHealth(u), UnitHealthMax(u)
	return UnitIsDeadOrGhost(u) and oUF.Tags['[dead]'](u) or (min~=max) and format('|cffff8080%d|r|cff0090ff %.0f|r%%', min-max, min/max*100) or max
end

oUF.Tags['[smartpp]'] = function(u)
	local min, max = UnitPower(u), UnitPowerMax(u)
	return (UnitPowerType(u) == 0 and min > 0) and format('|cff%02x%02x%02x%.0f|r%%', 0, 144, 255, min/max*100)
end

oUF.Tags['[afk]'] = function(u) return UnitIsAFK(u) and '<AFK>' end
oUF.Tags['[assisticon]'] = function(u) local i = GetRaidTargetIndex(u..'target') return i and ICON_LIST[i]..'22|t' end
oUF.Tags['[assistname]'] = function(u) return UnitName(u..'target') end

oUF.TagEvents['[smarthp]'] = 'UNIT_HEALTH'
oUF.TagEvents['[smartpp]'] = 'UNIT_MANA UNIT_DISPLAYPOWER'

oUF.TagEvents['[afk]'] = 'PLAYER_FLAGS_CHANGED'
oUF.TagEvents['[assisticon]'] = 'UNIT_TARGET RAID_TARGET_UPDATE'
oUF.TagEvents['[assistname]'] = 'UNIT_TARGET UNIT_NAME_UPDATE'

local function CreateStyle(self, unit)
	self.menu = menu
	self.colors = colors
	self:RegisterForClicks('AnyUp')
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)

	self:SetAttribute('*type2', 'menu')
	self:SetAttribute('initial-height', 12)
	self:SetAttribute('initial-width', 100)

	self:SetBackdrop({bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=], insets = {top = -1, left = -1, bottom = -1, right = -1}})
	self:SetBackdropColor(0.25, 0.25, 0.25)

	self.Health = CreateFrame('StatusBar', nil, self)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture([=[Interface\AddOns\oUF_Perfect\minimalist]=])
	self.Health.colorDisconnected = true
	self.Health.colorClass = false
	self.Health:SetStatusBarColor(0.4, 1, 0.3)

	self.Health.bg = self.Health:CreateTexture(nil, 'BORDER')
	self.Health.bg:SetAllPoints(self.Health)
	self.Health.bg:SetTexture([=[Interface\ChatFrame\ChatFrameBackground]=])
	self.Health.bg.multiplier = 0.3

	local name = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLeft')
	name:SetPoint('LEFT', self, 'RIGHT', 5, 0)
	name:SetFont(font, fontsize, "OUTLINE")
	
	self:Tag(name, '[raidcolor][name( )][leader( )][offline( )][afk( )]')

	self.ReadyCheck = self.Health:CreateTexture(nil, 'OVERLAY')
	self.ReadyCheck:SetPoint('LEFT', self, -18, 0)
	self.ReadyCheck:SetHeight(20)
	self.ReadyCheck:SetWidth(20)

	self.MasterLooter = self.Health:CreateTexture(nil, 'OVERLAY')
	self.MasterLooter:SetPoint('TOPLEFT', self, 5, 0)
	self.MasterLooter:SetHeight(12)
	self.MasterLooter:SetWidth(12)

	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true

	self.outsideRangeAlpha = 0.4
	self.inRangeAlpha = 1.0
	self.Range = true
end

oUF:RegisterStyle('Perfect', CreateStyle)
oUF:SetActiveStyle('Perfect')

--[[
List of the various configuration attributes
======================================================
showRaid = [BOOLEAN] -- true if the header should be shown while in a raid
showParty = [BOOLEAN] -- true if the header should be shown while in a party and not in a raid
showPlayer = [BOOLEAN] -- true if the header should show the player when not in a raid
showSolo = [BOOLEAN] -- true if the header should be shown while not in a group (implies showPlayer)
nameList = [STRING] -- a comma separated list of player names (not used if 'groupFilter' is set)
groupFilter = [1-8, STRING] -- a comma seperated list of raid group numbers and/or uppercase class names and/or uppercase roles
strictFiltering = [BOOLEAN] - if true, then characters must match both a group and a class from the groupFilter list
point = [STRING] -- a valid XML anchoring point (Default: "TOP")
xOffset = [NUMBER] -- the x-Offset to use when anchoring the unit buttons (Default: 0)
yOffset = [NUMBER] -- the y-Offset to use when anchoring the unit buttons (Default: 0)
sortMethod = ["INDEX", "NAME"] -- defines how the group is sorted (Default: "INDEX")
sortDir = ["ASC", "DESC"] -- defines the sort order (Default: "ASC")
template = [STRING] -- the XML template to use for the unit buttons
templateType = [STRING] - specifies the frame type of the managed subframes (Default: "Button")
groupBy = [nil, "GROUP", "CLASS", "ROLE"] - specifies a "grouping" type to apply before regular sorting (Default: nil)
groupingOrder = [STRING] - specifies the order of the groupings (ie. "1,2,3,4,5,6,7,8")
maxColumns = [NUMBER] - maximum number of columns the header will create (Default: 1)
unitsPerColumn = [NUMBER or nil] - maximum units that will be displayed in a singe column, nil is infinate (Default: nil)
startingIndex = [NUMBER] - the index in the final sorted unit list at which to start displaying units (Default: 1)
columnSpacing = [NUMBER] - the ammount of space between the rows/columns (Default: 0)
columnAnchorPoint = [STRING] - the anchor point of each new column (ie. use LEFT for the columns to grow to the right)
--]]
local raid = {}
for i = 1, 5 do
	local group = oUF:Spawn('header', 'oUF_Group'..i)
	group:SetManyAttributes('groupFilter', tostring(i), 'showRaid', true, 'yOffset', -5)
	group:SetFrameStrata('BACKGROUND')
	table.insert(raid, group)
	if(i == 1) then
		group:SetManyAttributes('showParty', true, 'showPlayer', true)
		group:SetPoint('TOPLEFT', UIParent, 15, -30)
	else
		group:SetPoint('TOP', raid[i-1], 'BOTTOM', 0, -20)
	end
	group:Show()
end