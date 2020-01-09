local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')
local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')
local _var

SBFOptions.BarTabInitialise = function(self)
	SBFOEnableBarsCheckButtonText:SetFormattedText(self.strings.SHOWBARS)
	SBFODebuffBarColourCheckButtonText:SetFormattedText(self.strings.DEBUFFBARCOLOUR)
	SBFOBarWidthSlider:SetMinMaxValues(50,300)
	SBFOBarWidthSlider:SetValueStep(5)
	SBFOBarWidthSliderLow:SetFormattedText(50)
	SBFOBarWidthSliderHigh:SetFormattedText(300)
	SBFOBarBuffColourLabel:SetFormattedText(self.strings.BARBUFFCOLOUR)
	SBFOBarDebuffColourLabel:SetFormattedText(self.strings.BARDEBUFFCOLOUR)
	SBFOBarBackdropColourLabel:SetFormattedText(self.strings.BARBACKDROP)
  SBFOBarDirectionSliderText:SetFormattedText(self.strings.BARDIRECTION)
  SBFOBarDirectionSliderLow:SetText(self.strings.JUSTIFYLEFT)
  SBFOBarDirectionSliderHigh:SetText(self.strings.JUSTIFYRIGHT)
	SBFOBarDirectionSlider:SetMinMaxValues(1,3)
	SBFOBarDirectionSlider:SetValueStep(1)
end

SBFOptions.BarTabSelectFrame = function(self, var)
  if var then
    _var = var
  end
	SBFOBarsConfigButton.text:SetFormattedText(self.strings.BARCONFIG, self.curFrame.id)
	SBFOEnableBarsCheckButton:SetChecked(_var.bar)
	if _var.bar then
    SBFOBarWidthSlider:Enable()
		self:EnableCheckbox(SBFODebuffBarColourCheckButton)
		self:EnableColourButton(SBFOBarBuffColour, _var.bar.buffColour)
		self:EnableColourButton(SBFOBarBackdropColour, _var.bar.bgColour)
    SBFOBarTextureDropDown:Enable()
    SBFOBarDirectionSlider:Enable()
    if _var.bar.debuffBar then
			SBFOptions:DisableColourButton(SBFOBarDebuffColour)
		else
			SBFOptions:EnableColourButton(SBFOBarDebuffColour, _var.bar.debuffColour)
		end

    SBFOBarWidthSlider:SetValue(_var.bar.width)
    SBFODebuffBarColourCheckButton:SetChecked(_var.bar.debuffBar)
    SBFOBarWidthSlider:SetValue(_var.bar.width)
    SBFODebuffBarColourCheckButton:SetChecked(_var.bar.debuffBar)
    ScrollingDropDown:SetSelected(SBFOBarTextureDropDown, _var.bar.barTexture, ScrollingDropDown.TEXT)
    SBFOBarDirectionSlider:SetValue(_var.bar.direction)
	else
		self:DisableCheckbox(SBFODebuffBarColourCheckButton)
    SBFOBarTextureDropDown:Disable()
		SBFOBarWidthSlider:Disable()
    SBFOBarDirectionSlider:Disable()
		self:DisableColourButton(SBFOBarBuffColour)
		self:DisableColourButton(SBFOBarDebuffColour)
		self:DisableColourButton(SBFOBarBackdropColour)
	end
end

SBFOptions.EnableBars = function(self)
	if this:GetChecked() then
    SBF:DoBarSavedVars(_var, true)
	else
    _var.bar = nil
	end
  SBFOptions:SetupFrame(self.curFrame, false)
  self:BarTabSelectFrame()
  self:AttachElementForMove(self.firstBuff.bar, self.curFrame._var.bar)
end

SBFOptions.DebuffBarColour = function(self)
	_var.bar.debuffBar = this:GetChecked()
  if _var.bar.debuffBar then
    SBFOptions:DisableColourButton(SBFOBarDebuffColour)
  else
    SBFOptions:EnableColourButton(SBFOBarDebuffColour, _var.bar.debuffColour)
  end
  self:SetupFrame(self.curFrame, true)
end

SBFOptions.BarTextureDropDown_Initialise = function(self)
  SBFOBarTextureDropDown:Init(self.DropDownCallback, self.strings.BARTEXTURE)
	local info = SBF:GetTable()
	local bars = SML:List("statusbar")
  for k,v in pairs(bars) do
		info.text = v
		info.value = v
		info.callback = SBFOptions.BarTextureDropDown_OnClick
		ScrollingDropDown:AddItem(SBFOBarTextureDropDown, info)
	end
	SBF:PutTable(info)
end

SBFOptions.BarTextureDropDown_OnClick = function(item)
	_var.bar.barTexture = item.value
	SBFOptions:SetupFrame(SBFOptions.curFrame, true)
  SBFOBarTextureDropDown:SetFormattedText(item.text)
end

SBFOptions.BarWidthSliderChanged = function(self, slider)
  if (slider:GetValue() ~= _var.bar.width) then
    _var.bar.width = slider:GetValue()
    self:SetupFrame(self.curFrame, true)
  end
  SBFOBarWidthSliderText:SetFormattedText("%s (%d)", self.strings.BARWIDTH, _var.bar.width)
end

-- Direction Slider
SBFOptions.BarDirectionSliderChanged = function(self, slider)
  if (slider:GetValue() ~= _var.bar.direction) then
    _var.bar.direction = slider:GetValue()
    self:SetupFrame(self.curFrame, true)
    SBF:UpdateBars(self.curFrame)
  end
end
