local function CreateStyle(self, unit)
	self:RegisterForClicks('AnyUp')
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)

	self:SetAttribute('initial-height', 20)
	self:SetAttribute('initial-width', 120)

	self:SetBackdrop({bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=], insets = {top = -1, left = -1, bottom = -1, right = -1}})
	self:SetBackdropColor(0, 0, 0)

	self.Health = CreateFrame('StatusBar', nil, self)
	self.Health:SetAllPoints(self)
	self.Health:SetStatusBarTexture([=[Interface\AddOns\oUF_Perfect\minimalist]=])
	self.Health.colorDisconnected = true
	self.Health.colorClass = true

	self.Health.bg = self.Health:CreateTexture(nil, 'BORDER')
	self.Health.bg:SetAllPoints(self.Health)
	self.Health.bg:SetTexture([=[Interface\ChatFrame\ChatFrameBackground]=])
	self.Health.bg.multiplier = 0.3

	local health = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallRight')
	health:SetPoint('RIGHT', -3, 0)
	self:Tag(health, '[smarthp]')

	local power = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
	power:SetPoint('LEFT', 3, 0)
	self:Tag(power, '[smartpp]')

	local name = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightLeft')
	name:SetPoint('LEFT', self, 'RIGHT', 5, 0)
	self:Tag(name, '[name]|cff00ffff[( - )assistname][( )assisticon]')
end

oUF:RegisterStyle('PerfectM', CreateStyle)
oUF:SetActiveStyle('PerfectM')

local tank = oUF:Spawn('header', 'oUF_MainTank')
tank:SetManyAttributes('showRaid', true, 'groupFilter', 'MAINTANK', 'yOffset', -5)
tank:SetPoint('TOPLEFT', UIParent, 450, -15)
tank:Show()

local assist = oUF:Spawn('header', 'oUF_MainAssist')
assist:SetManyAttributes('showRaid', true, 'groupFilter', 'MAINASSIST', 'yOffset', -5)
assist:SetPoint('TOP', tank, 'BOTTOM', 0, -30)
assist:Show()