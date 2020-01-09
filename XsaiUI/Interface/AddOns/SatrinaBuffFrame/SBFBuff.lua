local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')
--
-- Buff Functions
-- 

local _G = _G
local sbf = _G["SBF"]
--local UnitAura = UnitAura
local tonumber = tonumber
local pairs = pairs
local ipairs = ipairs
local smatch = string.match
local tinsert = tinsert
local tremove = tremove
local GetTime = GetTime

local debugMask = 2

sbf.TOTEM = 1
sbf.TRACKING = 2
sbf.ENCHANT = 10
-- Auras ENCHANT and below are static tables, will not be recycled
-- Auras above ENCHANT will have their tables recycled when they end.  
sbf.HELPFUL = 20
-- Auras below HARMFUL will get buff expiration notices if the frame is set to give them
sbf.HARMFUL = 30

local filters = {
  [20] = "HELPFUL",
  [30] = "HARMFUL", }

local maxBuffs = { 
  [20] = 40, 
  [30] = 40, }
  
local textDesc = {
  [sbf.TOTEM] = "totem",
  [sbf.TRACKING] = "tracking",
  [sbf.ENCHANT] = "enchant",
  [sbf.HELPFUL] = "buff",
  [sbf.HARMFUL] = "debuff",
}
-- Register units
sbf.RegisterUnits = function(self)
  self:PutTable(self.buffs)
  self.buffs = self:GetTable()
  self.buffs["player"] = self:GetTable()
 
  self:PutTable(self.debuffs)
  self.debuffs = self:GetTable()
  self.debuffs["player"] = self:GetTable()
  self.lastUpdate["player"] = 0
  
  if self.db.profile.units then
    local remove = {}
    for unit,v in pairs(self.db.profile.units) do
      if v.buff then
        if self.frames[v.buff] then
          self.frames[v.buff].unit = unit
          self.buffs[unit] = self:GetTable()
          self.lastUpdate[unit] = 0
        else
          v.buff = nil
        end
      end
      if v.debuff then
        if self.frames[v.debuff] then
          self.frames[v.debuff].unit = unit
          self.debuffs[unit] = self:GetTable()
          self.lastUpdate[unit] = 0
        else
          v.debuff = nil
        end
      end
      if not v.buff and not v.debuff then
        tinsert(remove, unit)
      end
    end
    for k,v in ipairs(remove) do
      self.db.profile.units[v] = nil
    end
  end
  
  local f
  for i,filter in ipairs(self.db.profile.filters) do
    f = smatch(filter, "(%d%d?):")
    if f and tonumber(f) and self.frames[tonumber(f)] then
      self:debugmsg(debugMask, "Frame |cff00aaff%s|r is owned by player via filter |cff00ffaa%s|r", f, filter)
      self.frames[tonumber(f)].unit = "player"
    end
  end
  
  for spell,frame in pairs(self.db.profile.buffFrameList) do
    if self.frames[frame] then
      self:debugmsg(debugMask, "Frame |cff00aaff%s|r is owned by player via Show In Frame for |cff00ffaa%s|r", frame, spell)
      self.frames[frame].unit = "player"
    end
  end
end

sbf.TrackingUnit = function(self, unit)
  return (self.db.profile.units[unit] ~= nil)
end

-- Update auras
sbf.UpdateUnitAuras = function(self, unit)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for UpdateUnitAuras")
    return
  end
	if not self then
    self = sbf
  end
  if self.showingOptions then
		return
	end

  -- local count
  -- local had = (self.buffs[unit] and #self.buffs[unit] or 0) + (self.debuffs[unit] and #self.debuffs[unit] or 0)
	if self.getAuras[unit] then
    self:debugmsg(debugMask, "Get auras for |cff00ffaa%s|r", unit)
    if (unit == "player") then
      self:RemoveEnchants()
      self:RemoveTotems()
      self:RemoveTrackingBuff()
    end
    self:IterateAuras(unit, self.buffs, self.HELPFUL)
    self:IterateAuras(unit, self.debuffs, self.HARMFUL)
    if (unit == "player") then
      self:AddTotems()
      self:AddEnchants()
      self:AddTrackingBuff()
    end
  end
  self:debugmsg(debugMask, "%d auras for |cff00ffaa%s|r", count, unit)
  self:UntilCancelled(unit)
  self:ClearBuffFrames(unit)
  self:AssignFrames(unit)
  self:SortBuffs(unit)
  self:DoFlow(unit)
  -- self:SetupFrames(unit)
  self:ShowBuffs(unit)
  self:GetExtents(unit)
  self:FrameVisibility(unit)
end

-- Update the auras in a given list for a given unit
local rankRegex = RANK.." (..?)"
sbf.IterateAuras = function(self, unit, list, auraType)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for IterateAuras")
    return 0
  end
  if not list then
    self:debugmsg(debugMask, "No aura list specified for unit %s in UpdateUnitAuras", unit)
    return 0
  end
  if not auraType then
    self:debugmsg(debugMask, "No aura type specified for unit %s in UpdateUnitAuras", unit)
    return 0
  end
  
  local unitList = list[unit]
  if not unitList then
    self:debugmsg(debugMask, "Not tracking buff type |cff00aaff%s|r for unit |cff00ffaa%s|r", unit, filters[auraType])
    return 0
  end
  self:debugmsg(debugMask, "Iterating auras of type |cff00aaff%s|r for |cff00ffaa%s|r", filters[auraType], unit)

	local i,k,index,buff,exists,filter
  local name, rank, texture, count, debuffType, duration, expiryTime, isMine, isStealable
  
	for i,buff in ipairs(unitList) do
		buff.discard = true
    buff.refreshed = false -- flag buffs with same name but multiple instances so we don't discard extras
	end
  
  for i=1,maxBuffs[auraType] do
		name, rank, texture, count, debuffType, duration, expiryTime, isMine, isStealable = UnitAura(unit, i, filters[auraType]) 
		if not name then
      self:debugmsg(debugMask, "End of buffs for unit |cff00ffaa%s|r", unit)
      break
    end

		exists = false
    if not self:IsExcluded(name) then
      for k,buff in ipairs(unitList) do
        if (name == buff.name) and (expiryTime == buff.expiryTime) and not buff.refreshed then
          exists = true
          buff.index = i
          buff.count = count
          buff.expiryTime = expiryTime
          buff.isMine = (isMine == 1)
          buff.timeLeft = max(0, buff.expiryTime - GetTime())        
          if buff.untilCancelled or (buff.timeLeft > 0) then
            buff.discard = false
          end
          buff.refreshed = true
          self:debugmsg(debugMask, "Refreshing buff |cff00ffaa%s|r", buff.name)
          break
        end
      end
 
      if not exists then
        buff = self:GetTable()
        buff.index = i
        buff.filter = filters[auraType]
        buff.unit = unit
        buff.name = name
        buff.texture = texture
        buff.count = count
        buff.hadCount = (count > 0)
        buff.debuffType = debuffType or "none"
        buff.duration = duration
        buff.isMine = (isMine == 1)
        buff.castable = self:IsCastable(buff)
        if isMine and not buff.castable then
          self:debugmsg(0, "Added |cff00ffaa%s|r to castable list", buff.name)
          self.db.global.castable[self.playerClass][buff.filter][buff.name] = true
          buff.castable = true
        end
        if buff.duration then
          buff.hadDuration = true
        end
        buff.rank = tonumber(smatch(rank, rankRegex))
        buff.expiryTime = expiryTime
        buff.timeLeft = max(0, buff.expiryTime - GetTime())        
        buff.untilCancelled = (expiryTime == 0)
        buff.auraType = auraType
        self:BuffDuration(buff)
        if buff.untilCancelled then
          buff.maxTime = self.db.profile.auraMaxTime
        end
        SBF:AuraGained(buff)
        tinsert(unitList, buff)
			end
		end
	end

	local clear
  repeat
    clear = true
    for i,buff in ipairs(unitList) do
      if not buff.static and buff.discard then
        clear = false
        self:ExpireBuff(tremove(unitList, i))
        break
      end
    end
  until clear
  
  return #unitList
end

sbf.ClearAuras = function(self)
  for unit,buffList in pairs(self.buffs) do
    while (#buffList > 0) do
      self:ExpireBuff(tremove(buffList), true)
    end
  end
  for unit,buffList in pairs(self.debuffs) do
    while (#buffList > 0) do
      self:ExpireBuff(tremove(buffList), true)
    end
  end
end

-- Expire a buff
sbf.ExpireBuff = function(self, buff, quiet)
  if not buff then
    self:debugmsg(debugMask, "Invalid buff or no slot attached to buff in ExpireBuff")
    return
  end
  if not buff.isMirror then
    SBF:AuraExpired(buff)
    if (buff.auraType > self.ENCHANT) then
      self:debugmsg(1, "Expiring buff |cff00ffaa%s|r", buff.name)
      self:PutTable(buff)
    end
  end
end

-- New Aura
sbf.AuraGained = function(self, buff)
  if buff then
    self:debugmsg(debugMask, "Gained %s |cff00ffaa%s|r", textDesc[buff.auraType], buff.name)
  end
end

-- Aura expiring
sbf.AuraExpired = function(self, buff)
  if buff then
    self:debugmsg(debugMask, "Buff |cff00ffaa%s|r expired", buff.name)
  end
end

-- Buff about to expire
sbf.ExpiryWarning = function(self, buff, slot, var)
  if not buff then
    self:debugmsg(debugMask, "No buff specified for ExpiryWarning")
    return
  end

  if var and buff.warnExpire and not buff.warned and not buff.untilCancelled and not UnitIsDead("player") 
	and not UnitIsGhost("player") and (floor(buff.timeLeft or 0) == var.expiry.warnAtTime) then
    self:debugmsg(debugMask, "Expiry warning for |cff00ffaa%s|r", buff.name)
    buff.warned = 1
    
    if var.timer and not var.timer.debuffColour then
      slot.timer.text:SetVertexColor(var.timer.expiringColour.r, var.timer.expiringColour.g, var.timer.expiringColour.b)
    end
    if var.icon and var.expiry.flash then
      slot.icon:SetScript("OnUpdate", self.BuffIcon_OnUpdate)
    end
    if var.expiry.textWarning then
			local frame = _G[var.expiry.frame or "ChatFrame1"]
			frame:AddMessage(string.format("|cff00ff00%s|r %s", tostring(buff.name), self.strings.BUFFEXPIRE))
		end
		if var.expiry.sctWarn then
			self:CombatTextWarning(buff, var)
		end
		if var.expiry.soundWarning then
			local s = SML:Fetch("sound", var.expiry.sound)
			if s then
				PlaySoundFile(s)
			end
		end
	end
end

SBF.IsStickyChild = function(self, f)
  if not f then
    self:debugmsg(debugMask, "No frame specified for IsStickyChild")
    return
  end
  for frame,data in pairs(self.db.profile.sticky) do
    for index,child in pairs(data) do
      if (child == f) then
        return frame
      end
    end
  end
  return nil
end

SBF.HasStickyChildren = function(self, f)
  if not f then
    self:debugmsg(debugMask, "No frame specified for HasStickyChildren")
    return
  end
  for frame,data in pairs(self.db.profile.sticky) do
    if (frame == f) then
      return true
    end
  end
  return false
end


sbf.DoFlow = function(self, unit)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for DoFlow")
    return
  end
  local destFrame, srcFrame, n, buff
  for index,frame in pairs(self.frames) do
    if (#frame.buffs < frame._var.layout.count) and self:HasStickyChildren(index) then
      -- this much room left for sticky buffs
      n = frame._var.layout.count - #frame.buffs 
      if (n > 0) then
        for i,f in pairs(self.db.profile.sticky[index]) do
          srcFrame = self.frames[f]
          while (n > 0) and (#srcFrame.buffs > 0) do
            buff = tremove(srcFrame.buffs)
            buff.flowFrom = buff.frame
            tinsert(frame.buffs, buff)
            n = n - 1
          end
        end
      end
    end
  end
end

-- Magic for until cancelled buffs
sbf.UntilCancelled = function(self, unit)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for UntilCancelled")
    return
  end
  if self.buffs[unit] then
    for i,buff in ipairs(self.buffs[unit]) do
      if buff.untilCancelled then
        if self.db.profile.auraMaxTime then
          buff.timeLeft = 9999
          if buff.isTracking then
            buff.timeLeft = buff.timeLeft + 1
          end
        else
          buff.timeLeft = 0
        end
      end
    end
  end
  if self.debuffs[unit] then
    for i,buff in ipairs(self.debuffs[unit]) do
      if buff.untilCancelled then
        if self.db.profile.auraMaxTime then
          buff.timeLeft = 9999
        else
          buff.timeLeft = 0
        end
      end
    end
  end
end

sbf.AssignFrames = function(self, unit)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for AssignFrames")
    return
  end
  if self.buffs[unit] then
    for i,buff in ipairs(self.buffs[unit]) do
      self:AssignFrame(buff)
    end
  end
  if self.debuffs[unit] then
    for i,buff in ipairs(self.debuffs[unit]) do
      self:AssignFrame(buff)
    end
  end
end

-- Screw you table.sort
local i,high,low,tmp,num
local sort = function(t, func)
  num = #t
  if (num == 1) then
    return
  end
  for i=2,num do
    high = i
    repeat
      low = high - 1
      if func(t[low], t[high]) then
        tmp = t[low]
        t[low] = t[high]
        t[high] = tmp
        high = low
      else
        break
      end
    until (high <= 1)
  end
end

sbf.SortBuffs = function(self, unit)
  if not unit then
    self:debugmsg(debugMask, "Invalid unit specified for SortBuffs")
    return
  end
  for index,frame in pairs(self.frames) do 
    if (frame.unit == unit) then
      if tonumber(frame._var.layout.sort) and self.sortOptions[frame._var.layout.sort] then
        sort(frame.buffs, self.sortOptions[frame._var.layout.sort])
      else
        self:debugmsg(debugMask, "Invalid sort specified")
      end
    end
  end
end

sbf.AssignFrame = function(self, buff)
  if not buff then
    self:debugmsg(debugMask, "No buff specified for AssignFrame")
    return
  end
  buff.frame = self:GetFrame(buff)
  local frame = self.frames[buff.frame]
  local var = self.db.profile.frames[buff.frame]
  
  if not self.showingOptions then
    if (buff.unit == "player") then
      -- only move overflow buffs to frames 1/2 for player buffs
      if (#frame.buffs == var.layout.count) and (buff.frame > 2) then
        if (buff.auraType < self.HARMFUL) then
          self:debugmsg(debugMask, "Assigning |cff00ffaa%s|r to frame |cff00aaff1|r instead of frame |cff00aaff%d|r because of frame overflow", buff.name, buff.frame)
          frame = self.frames[1]
          var = self.db.profile.frames[1]
        else
          self:debugmsg(debugMask, "Assigning |cff00ffaa%s|r to frame |cff00aaff2|r instead of frame |cff00aaff%d|r because of frame overflow", buff.name, buff.frame)
          frame = self.frames[2]
          var = self.db.profile.frames[2]
        end
      end
    else
      if (buff.filter == "HARMFUL") then
        if self.db.profile.units[buff.unit].myDebuffs and not buff.isMine then
          self:debugmsg(debugMask, "Not assigning |cff00aaff%s|r debuff |cff00ffaa%s|r because it is not mine", buff.unit, buff.name)
          return
        elseif self.db.profile.units[buff.unit].castableDebuffs and not buff.castable then
          self:debugmsg(debugMask, "Not assigning |cff00aaff%s|r debuff |cff00ffaa%s|r because it is not castable", buff.unit, buff.name)
          return
        end
      else -- "HELPFUL"
        -- nothing for now
      end
    end
  end
  if (#frame.buffs < var.layout.count) then
    tinsert(frame.buffs, buff)
  else
    self:debugmsg(debugMask, "Not assigning |cff00ffaa%s|r because of frame overflow", buff.name)
  end
  
  if var.layout.mirrorBuffs and (frame.id > 2) then
    if (buff.auraType <= self.HELPFUL) then
      if (#self.frames[1].buffs < self.frames[1]._var.layout.count) then
        tinsert(self.frames[1].buffs, buff)
      end
    end
  end
end

sbf.GetFrame = function(self, buff)
  if not buff then
    self:debugmsg(debugMask, "Invalid buff specified for GetFrame")
    return
  end
  local f = self:ShowIn(buff.name)
	if f and self.frames[f] then
    self:debugmsg(debugMask, "Assign buff |cff00ffaa%s|r to frame |cff00aaff%d|r via Show in Frame", buff.name, f)
    return f
	end
	if self.db.profile.enableFilters then
		local f, filter = self:DoFilters(buff)
		if f and self.frames[f] then
      self:debugmsg(debugMask, "Assign buff |cff00ffaa%s|r to frame |cff00aaff%d|r via filter |cff00ff33%s|r", buff.name, f, filter)
			return f
		end
	end
	if (buff.auraType == self.HARMFUL) then
    f = self.db.profile.units[buff.unit].debuff or 2
    self:debugmsg(debugMask, "Assign buff |cff00ffaa%s|r to frame |cff00aaff%d|r by default", buff.name, f)
		return f
	end
  f = self.db.profile.units[buff.unit].buff or 1
  self:debugmsg(debugMask, "Assign buff |cff00ffaa%s|r to frame |cff00aaff%d|r by default", buff.name, f)
	return f
end
