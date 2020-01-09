local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')
local _var
local sbfo = SBFOptions

local unitListButtons = {}
local unitList = { "pet", "focus", "target", "targettarget", "focustarget", "mouseover", "party1", "party2", "party3", "party4", "partypet1", "partypet2", "partypet3", "partypet4",
  "raid1", "raid2", "raid3", "raid4", "raid5", "raid6", "raid7", "raid8", "raid9", "raid10", "raid11", "raid12", "raid13", "raid14", "raid15", "raid16",  
  "raid17", "raid18", "raid19", "raid20", "raid21", "raid22", "raid23", "raid24", "raid25", "raid26", "raid27", "raid28", "raid29", "raid30", "raid31", "raid32",
  "raid33", "raid34", "raid35", "raid36", "raid37", "raid38", "raid39", "raid40" }

SBFOptions.UnitsTabInitialise = function(self)
	SBFOUnitsConfigButton.text:SetFormattedText(self.strings.UNITSCONFIG)
	for i=1,10 do
		unitListButtons[i] = getglobal("SBFOUnitList"..i)
	end
	SBFOUnitBuffsDropDown:Init(self.DropDownCallback, self.strings.UNITBUFFS)
  SBFOUnitDebuffsDropDown:Init(self.DropDownCallback, self.strings.UNITDEBUFFALL)
  SBFOCastableDebuffsButtonText:SetFormattedText(self.strings.UNITDEBUFFCASTABLE)
  SBFOMyDebuffsButtonText:SetFormattedText(self.strings.UNITDEBUFFMINE)
end

SBFOptions.UnitsTabSelectFrame = function(self, var)
  if var then
    _var = var
  end
  if not self.currentUnit then
    SBFOUnitBuffsDropDown:Disable()
    SBFOUnitDebuffsDropDown:Disable()
    self:DoUnitCheckboxes()
  else
    self:SelectUnit(self.currentUnit)
  end
end

SBFOptions.UpdateUnitList = function(self)
	local listIndex, unit
	local offset = FauxScrollFrame_GetOffset(SBFOUnitListScrollFrame)
	
	for i=1,10 do
		listIndex = offset + i
		button = unitListButtons[i]
		unit = unitList[listIndex]

		if unit then
      if SBFOptions:UnitInUse(unit) then
        button.label:SetVertexColor(0,1,0,1)
      else
        button.label:SetVertexColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1)
      end
			button.label:SetFormattedText(unit)
			button.index = listIndex
      button.unit = unit
		else	
			button.label:SetFormattedText("")
			button.listIndex = nil
      button.unit = nil
		end

		-- Highlight selected 
		if SBFOptions.currentUnit and (SBFOptions.currentUnit == unit) then
      button:LockHighlight()
			button.label:SetTextColor(1, 1, 1)
		else
			button:UnlockHighlight()
		end
	end
	FauxScrollFrame_Update(SBFOUnitListScrollFrame, #unitList, 10, 14)
end


SBFOptions.UnitInUse = function(self, unit)
  for k,v in pairs(_var.units) do
    if (k == unit) and (v["buff"] or v["debuff"]) then
      return true
    end
  end
  return false
end

SBFOptions.DoUnitCheckboxes = function(self)
  if sbfo.currentUnit and _var.units[sbfo.currentUnit] and _var.units[sbfo.currentUnit].debuff then
    if (_var.units[sbfo.currentUnit].castableDebuffs == true) then
      self:EnableCheckbox(SBFOCastableDebuffsButton)
      self:DisableCheckbox(SBFOMyDebuffsButton)
      SBFOCastableDebuffsButton:SetChecked(true)
    elseif (_var.units[sbfo.currentUnit].myDebuffs == true) then
      self:DisableCheckbox(SBFOCastableDebuffsButton)
      self:EnableCheckbox(SBFOMyDebuffsButton)
      SBFOMyDebuffsButton:SetChecked(true)
    else
      self:EnableCheckbox(SBFOCastableDebuffsButton)
      self:EnableCheckbox(SBFOMyDebuffsButton)
    end
  else
    self:DisableCheckbox(SBFOCastableDebuffsButton)
    self:DisableCheckbox(SBFOMyDebuffsButton)
  end
end

SBFOptions.SelectUnit = function(self, unit)
  self.currentUnit = unit
  self:UnitBuffFrameDropDown_Initialise()
  self:UnitDebuffsFrameDropDown_Initialise()
  self:UpdateUnitList()
  self:DoUnitCheckboxes()
  SBFOCurrentUnitString:SetFormattedText(self.strings.UNITLABEL, unit)
end

-- What unit owns the frame?
SBFOptions.WhoHasTheFrame = function(self, frame)
  if (frame < 3) then
    return "player"
  end
  for unit,data in pairs(SBF.db.profile.units) do
    if data.buff and (data.buff == frame) then
      return unit
    end
    if data.debuff and (data.debuff == frame) then
      return unit
    end
  end
  return nil
end

SBFOptions.UpdateUnits = function(self, frame, t)
  if (SBF.frames[frame].unit == "player") then
    local f
    for i,filter in ipairs(SBF.db.profile.filters) do
      f = tonumber(string.match(filter, "(%d%d?):"))
      if (f == frame) then
        self:Print(format(self.strings.UNITFRAMEOWNEDFILTER, frame, filter))
        return
      end
    end
    
    for spell,f in pairs(SBF.db.profile.buffFrameList) do
      if (f == frame) then
        self:Print(format(self.strings.UNITFRAMEOWNEDSHOW, frame, spell))
        return
      end
    end
  end
  
  _var.units[self.currentUnit][t] = frame
  SBF.frames[frame].unit = self.currentUnit
  local changed = false
  for k,v in pairs(_var.units) do
    if (k ~= self.currentUnit) and (v.buff == frame) then
      v.buff = nil
      changed = true
    end
    if (k ~= self.currentUnit) and (v.debuff == frame) then
      v.debuff = nil
      changed = true
    end
    if changed and (k ~= self.currentUnit) then
      self:Print(format(self.strings.UNITFRAMEOWNERCHANGE, frame, k, self.currentUnit))
    end
  end
end

-- Buff frame dropdown
SBFOptions.UnitBuffFrameDropDown_Initialise = function(self)
  SBFOUnitBuffsDropDown:Enable()
  ScrollingDropDown:ClearItems(SBFOUnitBuffsDropDown)
	local info = SBF:GetTable()
  info.text = NONE
  info.value = 0
  info.callback = SBFOptions.UnitBuffFrameDropDown_OnClick
  ScrollingDropDown:AddItem(SBFOUnitBuffsDropDown, info)
  local f
	for i=3,#SBF.frames do
    info.text = format(SBF.strings.FRAMETITLE, i)
    info.value = i
    ScrollingDropDown:AddItem(SBFOUnitBuffsDropDown, info)
  end
	SBF:PutTable(info)
  if _var.units[self.currentUnit] and _var.units[self.currentUnit].buff then
    ScrollingDropDown:SetSelected(SBFOUnitBuffsDropDown, _var.units[self.currentUnit].buff, ScrollingDropDown.VALUE)
  else
    ScrollingDropDown:SetSelected(SBFOUnitBuffsDropDown, 0, ScrollingDropDown.VALUE)
  end
end

SBFOptions.UnitBuffFrameDropDown_OnClick = function(item)
  if (item.value > 0) then
    -- local owner = sbfo:WhoHasTheFrame(item.value)
    -- if owner and (owner ~= sbfo.currentUnit) then
    --   sbfo:Print(format(sbfo.strings.UNITFRAMETAKEN, item.value, owner))
    --   return
    -- end

    if not _var.units[sbfo.currentUnit] then
      _var.units[sbfo.currentUnit] = {}
    end
    sbfo:UpdateUnits(item.value, "buff")
  elseif _var.units[sbfo.currentUnit] then
    _var.units[sbfo.currentUnit].buff = nil
  end

  
  if _var.units[sbfo.currentUnit] and _var.units[sbfo.currentUnit].buff then
    ScrollingDropDown:SetSelected(SBFOUnitBuffsDropDown, _var.units[sbfo.currentUnit].buff, ScrollingDropDown.VALUE)
  else
    ScrollingDropDown:SetSelected(SBFOUnitBuffsDropDown, 0, ScrollingDropDown.VALUE)
  end
  SBFOptions:UpdateUnitList()
end

-- All debuffs dropdown
SBFOptions.UnitDebuffsFrameDropDown_Initialise = function(self)
  SBFOUnitDebuffsDropDown:Enable()
  ScrollingDropDown:ClearItems(SBFOUnitDebuffsDropDown)
	local info = SBF:GetTable()
  info.text = NONE
  info.value = 0
  info.callback = SBFOptions.UnitDebuffsFrameDropDown_OnClick
  ScrollingDropDown:AddItem(SBFOUnitDebuffsDropDown, info)
  local f
	for i=3,#SBF.frames do
    info.text = format(SBF.strings.FRAMETITLE, i)
    info.value = i
    ScrollingDropDown:AddItem(SBFOUnitDebuffsDropDown, info)
  end
	SBF:PutTable(info)
  if _var.units[self.currentUnit] and _var.units[self.currentUnit].debuff then
    ScrollingDropDown:SetSelected(SBFOUnitDebuffsDropDown, _var.units[self.currentUnit].debuff, ScrollingDropDown.VALUE)
  else
    ScrollingDropDown:SetSelected(SBFOUnitDebuffsDropDown, 0, ScrollingDropDown.VALUE)
  end
end

SBFOptions.UnitDebuffsFrameDropDown_OnClick = function(item)
  if (item.value > 0) then
    -- local owner = sbfo:WhoHasTheFrame(item.value)
    -- if owner and (owner ~= sbfo.currentUnit) then
    --   sbfo:Print(format(sbfo.strings.UNITFRAMETAKEN, item.value, owner))
    --   return
    -- end
    
    if not _var.units[sbfo.currentUnit] then
      _var.units[sbfo.currentUnit] = {}
    end
    sbfo:UpdateUnits(item.value, "debuff")
  elseif _var.units[sbfo.currentUnit] then
    _var.units[sbfo.currentUnit].debuff = nil
  end
  
  if _var.units[sbfo.currentUnit] and _var.units[sbfo.currentUnit].debuff then
    ScrollingDropDown:SetSelected(SBFOUnitDebuffsDropDown, _var.units[sbfo.currentUnit].debuff, ScrollingDropDown.VALUE)
  else
    ScrollingDropDown:SetSelected(SBFOUnitDebuffsDropDown, 0, ScrollingDropDown.VALUE)
  end
  SBFOptions:DoUnitCheckboxes()
  SBFOptions:UpdateUnitList()
end

SBFOptions.CastableDebuffs = function(self, checked)
  _var.units[sbfo.currentUnit].castableDebuffs = checked
  self:DoUnitCheckboxes()
end

SBFOptions.MyDebuffs = function(self, checked)
  _var.units[sbfo.currentUnit].myDebuffs = checked
  self:DoUnitCheckboxes()
end
