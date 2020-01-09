local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')
local _var

SBFOptions.LayoutTabInitialise = function(self)
	SBFOScaleSliderLow:SetFormattedText("0.5")
	SBFOScaleSliderHigh:SetFormattedText("3.0")
	SBFOScaleSlider:SetMinMaxValues(0.5, 3.0)
	SBFOScaleSlider:SetValueStep(0.1)
	SBFOOpacitySliderLow:SetFormattedText(0.1)
	SBFOOpacitySliderHigh:SetFormattedText(1.0)
	SBFOOpacitySlider:SetMinMaxValues(0.1, 1.0)
	SBFOOpacitySlider:SetValueStep(0.1)
  if IsAddOnLoaded("cyCircled") then
    self:EnableCheckbox(SBFOcyCircledCheckButton)
  else
    self:DisableCheckbox(SBFOcyCircledCheckButton)
  end
	SBFOCopyFromDropDown:Init(self.DropDownCallback, self.strings.COPYFROM)
	SBFODisableBuffRightClickButtonText:SetFormattedText(self.strings.BUFFRIGHTCLICK)
	SBFONoTooltipButtonText:SetFormattedText(self.strings.NOTOOLTIPS)
	SBFORowsCheckButtonText:SetFormattedText(self.strings.BUFFHORIZONTAL)
	SBFOReverseCheckButtonText:SetFormattedText(self.strings.REVERSEBUFF)
	SBFOBottomCheckButtonText:SetFormattedText(self.strings.BOTTOM)
	SBFOMirrorFrameBuffsCheckButtonText:SetFormattedText(self.strings.MIRRORBUFFS)
  SBFOcyCircledCheckButtonText:SetFormattedText(self.strings.USECYCIRCLED)
	SBFORowCountSliderLow:SetFormattedText(1)
	SBFORowCountSlider:SetValueStep(1)
  SBFOCopyFromDropDown:Init(self.DropDownCallback, self.strings.COPYFROM)
end

SBFOptions.LayoutTabSelectFrame = function(self, var)
  if var then
    _var = var
  end
	SBFOLayoutConfigButton.text:SetFormattedText(self.strings.LAYOUTCONFIG, self.curFrame.id)
	if (self.curFrame.id > 2) then
		SBFOptions:EnableCheckbox(SBFOMirrorFrameBuffsCheckButton)
    SBFOMirrorFrameBuffsCheckButton:SetChecked(_var.layout.mirrorBuffs)  
		SBFORemoveFrameButton:Enable()
	else
		SBFOptions:DisableCheckbox(SBFOMirrorFrameBuffsCheckButton)
		SBFORemoveFrameButton:Disable()
	end
	SBFORowCountSlider:SetValue(_var.layout.rowCount)
  SBFORowsCheckButton:SetChecked(_var.layout.rows)
  SBFOReverseCheckButton:SetChecked(_var.layout.reverse)
  SBFOBottomCheckButton:SetChecked(_var.layout.bottom)
  SBFONoTooltipButton:SetChecked(_var.layout.noTooltips)
  SBFODisableBuffRightClickButton:SetChecked(_var.layout.disableRightClick)
	ScrollingDropDown:SetSelected(SBFOBuffCountDropDown, _var.layout.count, ScrollingDropDown.TEXT)
	ScrollingDropDown:SetSelected(SBFOFrameVisibilityDropDown, _var.layout.visibility, ScrollingDropDown.VALUE)
	ScrollingDropDown:SetSelected(SBFOBuffSortDropDown, _var.layout.sort, ScrollingDropDown.VALUE)
	SBFORowCountSliderHigh:SetFormattedText(_var.layout.count)
	SBFORowCountSlider:SetMinMaxValues(1, _var.layout.count)
  SBFORowCountSlider:SetValue(_var.layout.rowCount)
  SBFOScaleSlider:SetValue(_var.layout.scale)
  SBFOOpacitySlider:SetValue(_var.layout.opacity)
  self:CopyFromDropDown_Initialise()

  if IsAddOnLoaded("cyCircled") then
    SBFOcyCircledCheckButton:SetChecked(cyCircled_SatrinaBuffFrames.db.profile[self.curFrame:GetName()])
  end
end

SBFOptions.InRows = function(self)
	_var.layout.rows = this:GetChecked()
	self:SetupFrame(self.curFrame, true)
end

SBFOptions.Reverse = function(self)
	_var.layout.reverse = this:GetChecked()
	self:SetupFrame(self.curFrame, true)
end

SBFOptions.Bottom = function(self)
	self.curFrame._var.layout.bottom = this:GetChecked()
	self:SetupFrame(self.curFrame, true)
end

SBFOptions.BuffRightClick = function(self)
	_var.layout.disableRightClick = this:GetChecked()
end

SBFOptions.NoTooltips = function(self)
	_var.layout.noTooltips = this:GetChecked()
end

SBFOptions.MirrorBuffs = function(self)
	_var.layout.mirrorBuffs = this:GetChecked()
end

SBFOptions.cyCircled = function(self)
  local frameName = self.curFrame:GetName()
  cyCircled_SatrinaBuffFrames.db.profile[frameName] = (this:GetChecked() == 1)
  cyCircled_SatrinaBuffFrames:ApplySkin()
  cyCircled_SatrinaBuffFrames:ApplyColors()
  cyCircled_SatrinaBuffFrames:ApplyCustom()
  self:SetupFrame(self.curFrame)
end

SBFOptions.buffCounts = {1,2,4,6,8,10,16,20,24,28,32,36,40,44,48,52,56,60}
SBFOptions.BuffCountDropDown_Initialise = function(self)
	SBFOBuffCountDropDown:Init(self.DropDownCallback, self.strings.BUFFCOUNT)
  local info = SBF:GetTable()
	for v,i in ipairs(SBFOptions.buffCounts) do
		info.text = i
		info.value = i
		info.callback = SBFOptions.BuffCountDropDown_OnClick
		ScrollingDropDown:AddItem(SBFOBuffCountDropDown, info)
	end
	SBF:PutTable(info)
end

SBFOptions.BuffCountDropDown_OnClick = function(item)
	ScrollingDropDown:SetSelected(SBFOBuffCountDropDown, item.value)
	_var.layout.count = item.value
	SBFORowCountSliderHigh:SetFormattedText(item.value)
	SBFORowCountSlider:SetMinMaxValues(1, item.value)
	SBFOptions:SetupFrame(SBFOptions.curFrame, false)
  SBFOBuffCountDropDown:SetFormattedText(item.text)
  SBF:FrameShowBuffs(SBFOptions.curFrame)
end

SBFOptions.FrameVisibilityDropDown_Initialise = function(self)
	SBFOFrameVisibilityDropDown:Init(self.DropDownCallback, self.strings.VISIBILITY)
	local info = SBF:GetTable()
	for i,v in ipairs(SBFOptions.strings.frameVisibility) do
		info.text	= v
		info.value	= i
		info.callback	= SBFOptions.FrameVisibilityDropDown_OnClick
		ScrollingDropDown:AddItem(SBFOFrameVisibilityDropDown, info)
	end
	SBF:PutTable(info)
end

SBFOptions.FrameVisibilityDropDown_OnClick = function(item)
	_var.layout.visibility = item.value
	ScrollingDropDown:SetSelected(SBFOFrameVisibilityDropDown, item.value)
  SBFOFrameVisibilityDropDown:SetFormattedText(item.text)
end

SBFOptions.BuffSortDropDown_Initialise = function(self)
	SBFOBuffSortDropDown:Init(self.DropDownCallback, self.strings.BUFFSORT)
	local info = SBF:GetTable()
	for i,v in pairs(SBF.sortOptions) do
		info.text = SBF.strings.sort[i]
		info.value = i
		info.callback = SBFOptions.BuffSortDropDown_OnClick
		ScrollingDropDown:AddItem(SBFOBuffSortDropDown, info)
	end
	SBF:PutTable(info)
end

SBFOptions.BuffSortDropDown_OnClick = function(item)
	ScrollingDropDown:SetSelected(SBFOBuffSortDropDown, item.value)
	_var.layout.sort = item.value
	SBF.sortFunc = SBF.sortOptions[item.value]
	for index,frame in ipairs(SBF.frames) do
    SBF:FrameShowBuffs(frame)
	end
  SBFOBuffSortDropDown:SetFormattedText(item.text)
end

SBFOptions.SetCountColour = function(r,g,b)
	_var.count.colour = {r = r, g = g, b = b}
	SBFOCountColour.texture:SetVertexColor(r, g, b)
	SBFOptions:SetupFrame(self.curFrame, true)
end

SBFOptions.CancelCountColour = function(r,g,b)
	_var.count.colour = {r = r, g = g, b = b}
	SBFOCountColour.texture:SetVertexColor(r, g, b)
	SBFOptions:SetupFrame(self.curFrame, true)
end

SBFOptions.LayoutScaleSliderChanged = function(self, slider)
  if (slider:GetValue() ~= _var.layout.scale) then
    _var.layout.scale = slider:GetValue()
    self:SetupFrame(self.curFrame, true)
  end
	SBFOScaleSliderText:SetFormattedText("%s (%.1f)", self.strings.BUFF_SCALE, self.curFrame._var.layout.scale)
end

SBFOptions.LayoutOpacitySliderChanged = function(self, slider)
  if (slider:GetValue() ~= _var.layout.opacity) then
    _var.layout.opacity = slider:GetValue()
    self:SetupFrame(self.curFrame, true)
  end
	SBFOOpacitySliderText:SetFormattedText("%s (%.1f)", self.strings.OPACITY, self.curFrame._var.layout.opacity)
end

SBFOptions.LayoutCountSliderChanged = function(self, slider)
  if (slider:GetValue() ~= _var.layout.rowCount) then
    _var.layout.rowCount = slider:GetValue()
    self:SetupFrame(self.curFrame, true)
  end
	if self.curFrame._var.layout.rows then
		SBFORowCountSliderText:SetFormattedText("%s (%d)", self.strings.COLCOUNT, self.curFrame._var.layout.rowCount)
	else
		SBFORowCountSliderText:SetFormattedText("%s (%d)", self.strings.ROWCOUNT, self.curFrame._var.layout.rowCount)
	end
end

SBFOptions.CopyFromDropDown_Initialise = function(self)
  ScrollingDropDown:ClearItems(SBFOCopyFromDropDown)
	local info = SBF:GetTable()
	for i=1,#SBF.frames do
		if (i ~= SBFOptions.curFrame.id) then
			info.text = format(SBF.strings.FRAMETITLE, i)
			info.value = i
			info.callback = SBFOptions.CopyFromDropDown_OnClick
			ScrollingDropDown:AddItem(SBFOCopyFromDropDown, info)
		end
	end
	SBF:PutTable(info)
end

SBFOptions.CopyFromDropDown_OnClick = function(item)
	local old = SBF.db.profile.frames[SBFOptions.curFrame.id]
  local new = SBF:CopyTable(SBF.db.profile.frames[item.value])
	for k,v in pairs(old.layout.point) do
		new.layout.point[k] = v
	end
	SBF:PutTable(old)
	SBF.db.profile.frames[SBFOptions.curFrame.id] = new
  SBFOptions.curFrame._var = new
  ScrollingDropDown:SetSelected(SBFOCopyFromDropDown, nil)
  SBFOptions:SetupFrame(SBFOptions.curFrame, false)
  if IsAddOnLoaded("cyCircled") then
    local toFrame = SBFOptions.curFrame:GetName()
    local fromFrame = SBF.frames[item.value]:GetName()
    cyCircled_SatrinaBuffFrames.db.profile[toFrame] = cyCircled_SatrinaBuffFrames.db.profile[fromFrame]
    cyCircled_SatrinaBuffFrames:ApplySkin()
    cyCircled_SatrinaBuffFrames:ApplyColors()
    cyCircled_SatrinaBuffFrames:ApplyCustom()
  end
	SBFOptions:SelectFrame(SBFOptions.curFrame)
end
