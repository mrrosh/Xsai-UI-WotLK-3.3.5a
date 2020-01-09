local _G = _G
local sbf = _G.SBF
local tinsert = _G.tinsert
local tremove = _G.tremove
local tonumber = _G.tonumber
local tostring = _G.tostring

local debugMask = 16
-- Make sure SBFUtil.lua is loading after SBFBuff.lua
local enchant = SBF.ENCHANT

sbf.RemoveAlwaysWarn = function(self, name)
	for i,v in pairs(sbf.db.profile.alwaysWarnList) do
		if (v == name) then
			tremove(sbf.db.profile.alwaysWarnList, i)
			return
		end
	end
end

sbf.AddAlwaysWarn = function(self, name)
	for i,v in pairs(sbf.db.profile.alwaysWarnList) do
		if (v == name) then
			return
		end
	end
	tinsert(sbf.db.profile.alwaysWarnList, name)
end

sbf.IsAlwaysWarn = function(self, name)
	for i,v in ipairs(self.db.profile.alwaysWarnList) do
		if (v == name) then
			return true
		end
	end
	return false
end

sbf.AddExclude = function(self, name)
	for i,v in pairs(sbf.db.profile.exclusionList) do
		if (v == name) then
			return
		end
	end
	tinsert(sbf.db.profile.exclusionList, name)
end

sbf.RemoveExclude = function(self, name)
	for i,v in pairs(sbf.db.profile.exclusionList) do
		if (v == name) then
			tremove(sbf.db.profile.exclusionList, i)
			return
		end
	end
end

sbf.IsExcluded = function(self, name)
	for i,v in ipairs(self.db.profile.exclusionList) do
		if (v == name) then
			return true
		end
	end
	return false
end

sbf.ShowIn = function(self, name)
	for b,f in pairs(self.db.profile.buffFrameList) do
		if (name == b) then
			return f
		end
	end
	return nil
end

sbf.IsCastable = function(self, buff)
  return (self.db.global.castable[self.playerClass][buff.filter][buff.name] == true)
end

sbf.GetSpell = function(self, name)
  if name and self.db.global.spells and self.db.global.spells[name] then
    return self.db.global.spells[name].duration, self.db.global.spells[name].untilCancelled, self.db.global.spells[name].auraType
  end
  return 0,nil,nil
end

sbf.SetSpell = function(self, buff, force)
	if buff.name then
    if not self.db.global.spells then
      self.db.global.spells = {}
    end
    
    if not self.db.global.spells[buff.name] then
      self.db.global.spells[buff.name] = {}
    end
    self.db.global.spells[buff.name].duration = buff.duration
    self.db.global.spells[buff.name].untilCancelled = buff.untilCancelled
    self.db.global.spells[buff.name].auraType = buff.auraType
  end
end

sbf.BuffDuration = function(self, buff)
	if self.showingOptions then
    return
  end
  if not buff.hadDuration then
    buff.duration = self:GetSpell(buff.name)
    if not self.db.global.spells[buff.name] or (buff.timeLeft > buff.duration) then
      buff.duration = ceil(buff.timeLeft)
      self:SetSpell(buff)
    end
  elseif buff.hadDuration and not self.db.global.spells[buff.name] then
    self:SetSpell(buff)
  end
end

sbf.EmptyFunc = function()
end

--
-- Misc.
--

sbf.DisableDefaultBuffFrame = function(self)
  BuffFrame:ClearAllPoints()
  BuffFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, 100)
	BuffFrame:UnregisterAllEvents()
	BuffFrame:SetScript("OnUpdate", nil)
	BuffFrame:Hide()

  TemporaryEnchantFrame:ClearAllPoints()
  TemporaryEnchantFrame:SetPoint("BOTTOM", UIParent, "TOP", 0, 100)
	TemporaryEnchantFrame:SetScript("OnUpdate", nil)
	TemporaryEnchantFrame:Hide()
  TempEnchant1:SetScript("OnUpdate", nil)
  TempEnchant1:Hide()
  TempEnchant2:SetScript("OnUpdate", nil)
  TempEnchant2:Hide()

  -- Just try to re-show the frame now, random addon!
  BuffFrame.SetPoint = self.EmptyFunc
  BuffFrame.Show = self.EmptyFunc
  -- In this case, the GM ticket frame would be the guilty one to re-anchor it.
  TemporaryEnchantFrame.SetPoint = self.EmptyFunc
  TemporaryEnchantFrame.Show = self.EmptyFunc
end

--
-- Buff Sorting
--
sbf.NoSort = function(a,b) -- Ascending index
  if (a == nil) then return false end
	if (b == nil) then return true end
	if SBF.db.profile.enchantsFirst then
    if a.auraType and b.auraType and (a.auraType ~= b.auraType) then
      if (a.auraType == enchant) then return false end
      if (b.auraType == enchant) then return true end
    end
  end
	if not tonumber(a.index) then return false end
	if not tonumber(b.index) then return true end
  return a.index > b.index
end

sbf.AscendingNameSort = function(a,b)
	if (a == nil) then return false end
	if (b == nil) then return true end
	if SBF.db.profile.enchantsFirst then
    if a.auraType and b.auraType and (a.auraType ~= b.auraType) then
      if (a.auraType == enchant) then return false end
      if (b.auraType == enchant) then return true end
    end
  end
	if (type(a.name) ~= "string") or not tostring(a.name) then return false end
	if (type(b.name) ~= "string") or not tostring(b.name) then return true end
	return a.name > b.name
end

sbf.DescendingNameSort = function(a,b)
	if (a == nil) then return true end
	if (b == nil) then return false end
	if SBF.db.profile.enchantsFirst then
    if a.auraType and b.auraType and (a.auraType ~= b.auraType) then
      if (a.auraType == enchant) then return false end
      if (b.auraType == enchant) then return true end
    end
  end
	if (type(a.name) ~= "string") or not tostring(a.name) then return true end
	if (type(b.name) ~= "string") or not tostring(b.name) then return false end
  return a.name < b.name
end

sbf.AscendingTimeSort = function(a,b)
  if (a == nil) then return false end
	if (b == nil) then return true end
	if SBF.db.profile.enchantsFirst then
    if a.auraType and b.auraType and (a.auraType ~= b.auraType) then
      if (a.auraType == enchant) then return false end
      if (b.auraType == enchant) then return true end
    end
  end
	if (type(a.timeLeft) ~= "number") or not tonumber(a.timeLeft) then return false end
	if (type(a.timeLeft) ~= "number") or not tonumber(b.timeLeft) then return true end
	return a.timeLeft > b.timeLeft
end

sbf.DescendingTimeSort = function(a,b)
	if (a == nil) then return true end
	if (b == nil) then return false end
	if SBF.db.profile.enchantsFirst then
    if a.auraType and b.auraType and (a.auraType ~= b.auraType) then
      if (a.auraType == enchant) then return false end
      if (b.auraType == enchant) then return true end
    end
  end
	if not tonumber(a.timeLeft) then return true end
	if not tonumber(b.timeLeft) then return false end
	return a.timeLeft < b.timeLeft
end

--
-- Alpha cycle for flashing buffs
--
sbf.UpdateAlpha = function(self, elapsed)
	self.flashTime = self.flashTime - elapsed
	if (self.flashTime < 0) then
		local overtime = -self.flashTime
		if self.flashState then
			self.flashState = nil
			self.flashTime = BUFF_FLASH_TIME_OFF
		else
			self.flashState = 1
			self.flashTime = BUFF_FLASH_TIME_ON
		end
		if (overtime < self.flashTime) then
			self.flashTime = self.flashTime - overtime
		end
	end

	if self.flashState then
		self.alpha = (BUFF_FLASH_TIME_ON - self.flashTime) / BUFF_FLASH_TIME_ON
	else
		self.alpha = self.flashTime / BUFF_FLASH_TIME_ON
	end
	self.alpha = (self.alpha * (1 - BUFF_MIN_ALPHA)) + BUFF_MIN_ALPHA
	if enchTimer then
		enchTimer = enchTimer - elapsed
	end
end
