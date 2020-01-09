local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')

local _G = _G
local sbf = _G.SBF
local GetCursorPosition = _G.GetCursorPosition
local CreateFrame = _G.CreateFrame
local ipairs = _G.ipairs
local pairs = _G.pairs
local tinsert = _G.tinsert
local tremove = _G.tremove
local floor = _G.floor
local InCombatLockdown = _G.InCombatLockdown

local debugMask = 4
local debugMask2 = 32

-- 
-- Frames
-- 

--
-- Frame creation
--
sbf.CreateFrames = function(self)
	local f

	while (#self.frames > 0) do
    self:PutBuffFrame(tremove(self.frames))
	end
	
	for i,var in pairs(self.db.profile.frames) do
    f = self:GetBuffFrame()
    f.id = i
    f._var = var
    f.tab1.label:SetFormattedText(self.strings.DRAGTAB, i)
    f.tab2.label:SetFormattedText(self.strings.DRAGTAB, i)

    if not var.layout.point then
      if (i == 1) then
        self.db.profile.frames[i].layout.point = {"TOPRIGHT", -65, -250}
      elseif (i == 2) then
        self.db.profile.frames[i].layout.point = {"TOPRIGHT", -110, -250}
      else
        self.db.profile.frames[i].layout.point = {"CENTER", 0, 0}
      end
    end
    f:Show()
    f:ClearAllPoints()
    f:SetPoint(var.layout.point[1], UIParent, var.layout.point[1], var.layout.point[2], var.layout.point[3])
    self.frames[i] = f
	end
	self:FrameVisibility()
end

local frames = {}
sbf.GetBuffFrame = function(self)
	for i,frame in ipairs(frames) do
		if not frame.inUse then
			frame.inUse = true
			return frame
		end
	end
	i = #frames + 1
	f = CreateFrame("Frame", "SBFFrame"..i, UIParent, "SBFBuffFrameTemplate")
	tinsert(frames, f)
	f.inUse = true
	return f
end

sbf.PutBuffFrame = function(self, f)
	if f then
    f.tab1:Hide()
    f.tab2:Hide()
    if f.buffs then
      while (#f.buffs > 0) do
        self:ExpireBuff(tremove(f.buffs), true)
      end
    end
    if f.slots then
      while (#f.slots > 0) do
        self:PutSlot(tremove(f.slots))
      end
    end
    f._var = nil
    f:ClearAllPoints()
    f:Hide()
    f.inUse = false
  end
end

sbf.ClearFrame = function(self, frame)
  --if self.bfModule then
  --  self.bfModule:UndoGroup("SBF", frame:GetName())
  --end
  while (#frame.slots > 0) do
    self:PutSlot(tremove(frame.slots))
  end
end

sbf.FillFrame = function(self, frame)
  local slot
  for i=1,frame._var.layout.count do
    slot = self:PopulateSlot(frame._var.icon, frame._var.timer, frame._var.bar, frame._var.name, frame._var.count)
    slot.index = i
    tinsert(frame.slots, slot)
  end
  if self.bfModule then
    self.bfModule:SetupGroup("SBF", frame:GetName())
  end
  if self.cyModule then
    self.cyModule:SetupElements(frame:GetName())
    self.cyModule:ApplySkin()
    self.cyModule:ApplyColors()
    self.cyModule:ApplyCustom()
  end
end


--
-- Frame buffs
--
sbf.ClearBuffFrames = function(self, unit, f)
  for i,frame in ipairs(self.frames) do
    if not f or (frame == f) then
      if (frame.unit == unit) or self.showingOptions then
        if frame.buffs then
          while (#frame.buffs > 0) do
            tremove(frame.buffs)
          end
        end
      end
    end
	end
end

--
-- Frame setup
--
sbf.SetupFrames = function(self, unit)
  self.flash = false
  for index,frame in ipairs(self.frames) do
    if frame._var.expiry.flash then
      self.flash = true
    end
    -- if not unit or (frame.unit == unit) then
      self:SetupFrame(frame)
    -- end
  end
end

sbf.SetupFrame = function(self, frame, leaveSlots)
  if not frame or not frame._var then
    self:debugmsg(debugMask, "Error setting up frame %d", frame.id or 0)
    return
  end
  if not frame.slots then
    frame.slots = self:GetTable()
  end

  self:debugmsg(debugMask, "Setting up %d slots in frame %d", frame._var.layout.count, frame.id)
  
  if not leaveSlots then
    self:ClearFrame(frame)
    self:FillFrame(frame)
  end
  
	local var = frame._var
  local frameLevel = 1
  frame:SetFrameLevel(frameLevel)
  frame:SetScale(var.layout.scale)
  frame:SetAlpha(var.layout.opacity)
	for j,slot in ipairs(frame.slots) do
    
    if var.icon then
      slot.icon:SetParent(slot.anchor)
      slot.icon:ClearAllPoints()
      slot.icon:SetPoint("CENTER", slot.anchor, "CENTER", var.icon.x, var.icon.y)
      slot.icon:SetFrameLevel(frameLevel)
      slot.icon:Show()
    end

    if var.timer then
      slot.timer:SetParent(slot.anchor)
      slot.timer:ClearAllPoints()
      slot.timer:SetPoint("CENTER", slot.anchor, "CENTER", var.timer.x, var.timer.y)
			slot.timer.text:SetJustifyH(var.timer.justify)
			slot.timer.text:SetFont(SML:Fetch("font", var.timer.font), var.timer.fontSize, (var.timer.outline and "OUTLINE" or nil))
      slot.timer:SetFrameLevel(frameLevel + 1)
      slot.timer:Show()
    end

    if var.bar then
      slot.bar:SetParent(slot.anchor)
      slot.bar:ClearAllPoints()
      slot.bar:SetPoint("CENTER", slot.anchor, "CENTER", var.bar.x, var.bar.y)
      slot.bar:SetWidth(var.bar.width)
      slot.bar:SetBackdropColor(var.bar.bgColour.r, var.bar.bgColour.g, var.bar.bgColour.b, var.bar.bgColour.a) 
      slot.bar.bar:ClearAllPoints()
      slot.bar.bar:SetPoint(self.justify[var.bar.direction], slot.bar, self.justify[var.bar.direction], 0, 0)
      slot.bar.bar:SetWidth(var.bar.width)
      slot.bar.bar:SetTexture(SML:Fetch("statusbar", var.bar.barTexture))
      slot.bar:SetFrameLevel(frameLevel)
      slot.bar:Show()
    end
    
    if var.name then
      slot.name:SetParent(slot.anchor)
      slot.name:ClearAllPoints()
      slot.name:SetPoint("CENTER", slot.anchor, "CENTER", var.name.x, var.name.y)
			slot.name.text:SetFont(SML:Fetch("font", var.name.font), var.name.fontSize, (var.name.outline and "OUTLINE" or nil))
			slot.name.text:SetJustifyH(var.name.justify)
      slot.name:SetFrameLevel(frameLevel + 1)
      slot.name:Show()
    end

    if var.count then
      slot.count:SetParent(slot.anchor)
      slot.count:ClearAllPoints()
      slot.count:SetPoint("CENTER", slot.anchor, "CENTER", var.count.x, var.count.y)
      slot.count.text:SetVertexColor(var.count.colour.r, var.count.colour.g, var.count.colour.b)
      slot.count.text:SetJustifyH(var.count.justify)
			slot.count.text:SetFont(SML:Fetch("font", var.count.font), var.count.fontSize, var.count.outline and "OUTLINE" or nil)
      slot.count:SetFrameLevel(frameLevel + 1)
    end
    slot.anchor:Show()
	end
	self:ArrangeFrame(frame)
end


sbf.ArrangeFrame = function(self, frame)
  if not frame or not frame._var then
    self:debugmsg(debugMask, "Error arranging frame %d", frame.id or 0)
    return
  end
	local var = frame._var
  local	x = var.layout.x
	local y = var.layout.y
	
	if var.bar then
		x = x + var.bar.width
	end
	
	if (#frame.slots > 0) then
		local rowCount, inRows, reverse, bottom, lastAnchor, offX, offY, buffCount, rowMin, leftovers
		local curSlot, slot, lastSlot, lastRowAnchor
		
		buffCount = var.layout.count
		rowCount = var.layout.rowCount
		inRows = var.layout.rows
		reverse = var.layout.reverse
		bottom = var.layout.bottom
		rowMin = floor(buffCount/rowCount)
		leftovers = buffCount - (rowMin * rowCount)
	
		lastSlot = nil
    curSlot = 1
		for i=1,rowCount do
			num = rowMin
			if (leftovers > 0) then
				num = num + 1
				leftovers = leftovers - 1
			end
			for j=1,num do
        slot = frame.slots[curSlot]
        slot.anchor:ClearAllPoints()
        slot.anchor:SetParent(frame)
        
        if (j == 1) then
          if (curSlot == 1) then
            slot.anchor:SetPoint("CENTER", frame)
          else
            if inRows then
              offX = 0
              offY = 32 + y
              if not bottom then
                offY = offY * -1
              end
            else
              offY = 0
              offX = 32 + x
              if reverse then
                offX = offX * -1
              end
            end
            slot.anchor:SetPoint("CENTER", lastRowAnchor, "CENTER", offX, offY)
          end
          lastRowAnchor = slot.anchor
        else
          if inRows then
            offX = 32 + x
            if reverse then
              offX = offX * -1
            end
            offY = 0
          else
            offX = 0
            offY = 32 + y
            if not bottom then
              offY = offY * -1
            end
          end
          slot.anchor:SetPoint("CENTER", lastSlot.anchor, "CENTER", offX, offY)
        end
        if slot.timer then
          slot.timer:SetFrameLevel(slot.anchor:GetFrameLevel()+1)
        end
        lastSlot = slot
        curSlot = curSlot + 1
        if (curSlot > #frame.slots) then
          break
        end
      end
			if (curSlot > #frame.slots) then
				break
			end
		end
	end
end

--
-- Frame visibility
--
sbf.GetExtents = function(self)
  if true then
    return
  end
  for frame,_ in ipairs(self.frames) do
    self:GetExtent(frame)
  end
end

sbf.GetExtent = function(self, i)
  if not i or (i > #self.frames) or (i < 1) then
    self:debugmsg(debugMask, "Invalid frame (%d) specified for GetExtent", i or 0)
    return
  end
  
	local frame = sbf.frames[i]
  
  if not frame then
    self:Print(sbf.strings.ERRBUFF_EXTENT, i)
    return
  end
  
  if not frame.slots or (#frame.slots == 0) then
    return
  end
	
  local anchor = frame.slots[1].anchor 
  local bar = frame.slots[1].bar
	local icon = frame.slots[1].icon
	local buffCount = frame._var.layout.count
	local inRows = frame._var.layout.rows
	local reverse = frame._var.layout.reverse
	local bottom = frame._var.layout.bottom
	local showBars = (frame._var.bar ~= nil)
  local leftBars = showBars and frame._var.leftBars
	local x = frame._var.layout.x
	local y = frame._var.layout.y

	local scale
  if anchor then
    scale = anchor:GetEffectiveScale() or 1
  elseif bar then
    scale = bar:GetEffectiveScale() or 1
  end

	local height = 20
	local width = 20
	if bar then
		width = width + frame._var.bar.width + frame._var.bar.x
	end
	
	self:PutTable(frame.extent)
	frame.extent = self:GetTable()

	local rowCount, columnCount, columnHeight, rowWidth
	if inRows then
		rowCount = ceil(buffCount/frame._var.layout.rowCount)
		columnCount = frame._var.layout.rowCount
		columnHeight = ((columnCount * height) + (columnCount - 1) * (y + 12)) * scale
		rowWidth = ((rowCount * width) + (rowCount - 1) * (x + 12)) * scale
	else
		rowCount = frame._var.layout.rowCount
		columnCount = ceil(buffCount/rowCount)
		columnHeight = ((columnCount * height) + (columnCount - 1) * (y + 12)) * scale
		rowWidth = ((rowCount * width) + (rowCount - 1) * (x + 12)) * scale
  end

  if bottom then
    frame.extent.bottom = ceil(anchor:GetBottom() * scale)
    frame.extent.top = ceil(frame.extent.bottom + columnHeight)
  else
    frame.extent.top = ceil(anchor:GetTop() * scale)
    frame.extent.bottom = ceil(frame.extent.top - columnHeight)
  end

  if reverse then
    frame.extent.right = ceil(anchor:GetRight() * scale)
    if bar and not leftBars then
      frame.extent.right = frame.extent.right + frame._var.bar.width * scale
    end
    frame.extent.left = ceil(frame.extent.right - rowWidth)
  else
    frame.extent.left = ceil(anchor:GetLeft() * scale)
    if bar and leftBars then
      frame.extent.left = frame.extent.left - frame._var.bar.width * scale
    end
    frame.extent.right = ceil(frame.extent.left + rowWidth)
  end
end

sbf.FrameVisibility = function(self, unit)
	for i,frame in ipairs(self.frames) do
    if not unit or (frame.unit == unit) then
      if self.showingOptions or not frame._var or not frame._var.layout.visibility or (frame._var.layout.visibility == 1) then
          frame:Show()
          frame:SetAlpha(1)
      elseif (frame._var.layout.visibility == 2) then
          frame:Hide()
      elseif (frame._var.layout.visibility == 3) then
        if InCombatLockdown() then
          frame:Show()
        else
          frame:Hide()
        end
      elseif (frame._var.layout.visibility == 4) then
        if InCombatLockdown() then
          frame:Hide()
        else
          frame:Show()
        end
      elseif (frame._var.layout.visibility == 5) then
        if self:MouseIsOver(i) then
          frame:Show()
        else
          frame:Hide()
        end
      end
		end
	end
end

sbf.MouseIsOver = function(self, frame)
  if not frame then
    return
  end
	local x, y = GetCursorPosition()
	local extent = self.frames[frame].extent
	if extent then
		return (x >= extent.left) and (x <= extent.right) and (y >= extent.bottom) and (y <= extent.top)
	end
	return false
end

--
-- Frame buff slots
-- 
sbf.PopulateSlot = function(self, icon, timer, bar, name, count)
  local slot = self:GetTable()
  slot.anchor = self:GetAnchor()
  if icon then
    slot.icon = self:GetIcon()
  end
  if timer then
    slot.timer = self:GetTimer()
  end
  if bar then
    slot.bar = self:GetBar()
  end
  if name then
    slot.name = self:GetName()
  end
  if count then
    slot.count = self:GetCount()
  end
  return slot
end

sbf.PutSlot = function(self, slot)
  if slot then
    self:PutAnchor(slot.anchor)
    slot.anchor = nil
    self:PutIcon(slot.icon)
    slot.icon = nil
    self:PutTimer(slot.timer)
    slot.timer = nil
    self:PutBar(slot.bar)
    slot.bar = nil
    self:PutName(slot.name)
    slot.name = nil
    self:PutCount(slot.count)
    slot.count = nil
    self:PutTable(slot, true)
  end
end

--
-- Buffs are in the frames, show 'em
--
sbf.ShowBuffs = function(self, unit, f)
  local buff, var, colour
  for i,frame in ipairs(self.frames) do
    if not f or (i == frame) then
      if not f or (frame.unit == unit) or (not frame.unit and unit == "player") then
        self:FrameShowBuffs(frame)
      end
    end
  end
end

--
-- Show the buffs for a frame
--
sbf.FrameShowBuffs = function(self, frame)
  if not frame or not frame.slots or (#frame.slots == 0) then
    return
  end

  self:debugmsg(debugMask, "Showing buffs unit '%s' in frame %d", frame.unit, frame.id)
  local var = frame._var
  local buff, debuffColour
  frame.stickySlot = nil
  for j,slot in ipairs(frame.slots) do
    buff = frame.buffs[j]
    if buff then
      self:debugmsg(debugMask2, "frame %d, slot %d -> %s", frame.id, j, buff.name)
      slot._buff = buff
      frame.stickySlot = slot
      
      debuffColour = DebuffTypeColor[buff.debuffType] or DebuffTypeColor.none
      buff.warnExpire = not buff.untilCancelled and (self:IsAlwaysWarn(buff.name) or ((buff.duration or 0) >= var.expiry.minimumDuration))

      if var.name then
        slot.name.text:SetText(self:FormatName(buff, var))
        if (buff.auraType < self.HARMFUL) then
          slot.name.text:SetVertexColor(var.name.buffColour.r, var.name.buffColour.g, var.name.buffColour.b, var.name.buffColour.a) 
        elseif (buff.auraType == self.HARMFUL) and var.name.colourNameAsDebuff then
          slot.name.text:SetVertexColor(debuffColour.r, debuffColour.g, debuffColour.b, 1)
        else
          slot.name.text:SetVertexColor(var.name.debuffColour.r, var.name.debuffColour.g, var.name.debuffColour.b, var.name.debuffColour.a) 
        end

        slot.name:Show()
      end
      
      if var.count then
        if buff.count and ((buff.count > 1) or (buff.hadCount and var.count.showOneCount)) then
          slot.count.text:SetText(buff.count)
          slot.count:Show() 
        else
          slot.count:Hide()
        end
      end
      
      if var.timer then
        if not buff.untilCancelled then
          local colour
          self:SetBuffTime(slot.timer, buff.timeLeft, var.timer.format)
          if (buff.auraType == self.HARMFUL) and var.timer.debuffColour then
            colour = debuffColour
          elseif buff.warnExpire and ((buff.timeLeft or 0) <= var.expiry.warnAtTime) then
            colour = var.timer.expiringColour
            if var.expiry.flash and slot.icon then
              slot.icon:SetScript("OnUpdate", self.BuffIcon_OnUpdate)
            end
          else
            colour = var.timer.regularColour
          end
          slot.timer.text:SetVertexColor(colour.r, colour.g, colour.b)
          slot.timer:Show()
        else
          slot.timer:Hide()
        end
      end

      if var.icon then
        slot.icon._buff = buff  -- so OnEnter can do the tooltip without backflips
        slot.icon.icon:SetTexture(buff.texture)
        slot.icon:SetAlpha(var.layout.opacity)
        slot.icon:Show()
      end

      if var.bar then
        slot.bar._buff = buff
        slot.bar.spark:Hide()
        slot.bar.border:Hide()
        slot.bar:Show()
      end
    
      if (buff.auraType == self.HARMFUL) then
        if slot.bar then
          if var.bar.debuffBar then
            self:SetBarColour(slot.bar, debuffColour, 1)
          else
            self:SetBarColour(slot.bar, var.bar.debuffColour)
          end
        end
        if slot.icon then
          slot.icon.border:Show()
          slot.icon.border:SetVertexColor(debuffColour.r, debuffColour.g, debuffColour.b)
        end
      else
        if slot.bar then
          self:SetBarColour(slot.bar, var.bar.buffColour)
        end
        if slot.icon then
          slot.icon.border:Hide()
        end
      end
    else
      if slot.bar then
        slot.bar:Hide()
      end
      if slot.timer then
        slot.timer:Hide()
      end
      if slot.icon then
        slot.icon:Hide()
      end
      if slot.count then
        slot.count:Hide()
      end
      if slot.name then
        slot.name:Hide()
      end
    end
    if self.showingOptions then
      slot.anchor.dot:Show()
    else
      slot.anchor.dot:Hide()
    end
  end
  if not frame.stickySlot then
    frame.stickySlot = frame.slots[1]
  end
end

