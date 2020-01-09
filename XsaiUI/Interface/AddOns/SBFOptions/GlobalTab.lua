local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')

SBFOptions.GlobalTabInitialise = function(self, var)
	SBFOEnableFiltersCheckButton:SetChecked(SBF.db.profile.enableFilters)
	SBFOAuraMaxTimeCheckButton:SetChecked(SBF.db.profile.auraMaxTime)
	SBFOEnchantsFirstCheckButton:SetChecked(SBF.db.profile.enchantsFirst)
	SBFOTrackingCheckButton:SetChecked(SBF.db.profile.showTracking)
  if IsAddOnLoaded("cyCircled") then
    SBFOcyCircledSliderLow:SetFormattedText(15)
    SBFOcyCircledSliderHigh:SetFormattedText(50)
    SBFOcyCircledSlider:SetMinMaxValues(15,50)
    SBFOcyCircledSlider:SetValueStep(1)
    SBFOcyCircledSlider:SetValue(cyCircled_SatrinaBuffFrames.db.profile.adjust)
  else
    SBFOcyCircledSlider:Hide()
  end
  if IsAddOnLoaded("ButtonFacade") then
    SBFODisableBFButton:Show()
    SBFODisableBFButtonText:SetFormattedText(self.strings.DISABLEBF)
    SBFODisableBFButton:SetChecked(SBF.db.global.disableBF)
  else
    SBFODisableBFButton:Hide()
  end
  
  self:TotemButtons()
  SBFOTotemNonBuffButtonText:SetText(self.strings.TOTEMNONBUFF)
  SBFOTotemOutOfRangeButtonText:SetText(self.strings.TOTEMOUTOFRANGE)
  SBFONewProfileButton:SetText(self.strings.NEWPROFILEBUTTON)
  StaticPopupDialogs["SBFO_CONFIRM_REMOVE_PROFILE"] = {
    text = SBFOptions.strings.CONFIRMREMOVEPROFILE,
    button1 = YES,
    button2 = NO,
    OnAccept = function (self) SBFOptions:DeleteProfile(self.data) end,
    OnCancel = function (self) end,
    hideOnEscape = 1,
    timeout = 0,
  }

  StaticPopupDialogs["SBFO_NEW_PROFILE"] = {
    text = SBFOptions.strings.NEWPROFILE,
    button1 = OKAY,
    button2 = CANCEL,
    OnAccept = function(self)
      SBF.db:SetProfile(self.editBox:GetText())
      SBFOptions:ProfileChanged()
      self:Hide()
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1,
    hasEditBox = 1,
    maxLetters = 32,
    OnShow = function(self)
      self.button1:Disable()
      self.button2:Enable()
      self.editBox:SetFocus()
    end,
    OnHide = function(self)
      if ChatFrameEditBox:IsShown() then
        ChatFrameEditBox:SetFocus()
      end
      self.editBox:SetText("")
    end,
    EditBoxOnEnterPressed = function(self)
      if self:GetParent().button1:IsEnabled() then
        SBF.db:SetProfile(self:GetParent().editBox:GetText())
        SBFOptions:ProfileChanged()
        self:GetParent():Hide()
      end
    end,
    EditBoxOnTextChanged = function (self)
      local parent = self:GetParent()
      if (string.len(parent.editBox:GetText()) > 0) then
        parent.button1:Enable()
      else
        parent.button1:Disable()
      end
    end,
    EditBoxOnEscapePressed = function(self)
      self:GetParent():Hide()
    end
  }  
end

SBFOptions.GlobalTabSelectTab = function(self)
  if IsAddOnLoaded("cyCircled") then
    SBFOcyCircledSlider:SetValue(cyCircled_SatrinaBuffFrames.db.profile.adjust)
  end
end

SBFOptions.SetupProfiles = function(self)
	self:UsingProfileDropDown_Initialise()
	self:CopyProfileDropDown_Initialise()
	self:DeleteProfileDropDown_Initialise()
end

SBFOptions.ProfileChanged = function(self)
  SBF:DoSavedVars()
  SBF:CreateFrames()
  SBF:SetupFrames()
  SBFOptions:SetupFrames()
	SBFOptions:SelectFrame(1)
  SBFOptions:SetupProfiles()
end

SBFOptions.NewProfile = function(self)
  local dialog = StaticPopup_Show("SBFO_NEW_PROFILE")
end

SBFOptions.UsingProfileDropDown_Initialise = function(self)
	SBFOUsingProfileDropDown:Init(self.DropDownCallback, self.strings.USINGPROFILE)
  ScrollingDropDown:ClearItems(SBFOUsingProfileDropDown)
  local profiles = SBF.db:GetProfiles()
	local info = SBF:GetTable()
	info.callback	= SBFOptions.UsingProfileDropDown_OnClick
	for k,v in pairs(profiles) do
    info.text	= v
		info.value = v
		ScrollingDropDown:AddItem(SBFOUsingProfileDropDown, info)
	end
	SBF:PutTable(info)
  ScrollingDropDown:SetSelected(SBFOUsingProfileDropDown, SBF.db:GetCurrentProfile())
end

SBFOptions.UsingProfileDropDown_OnClick = function(item)
	SBF.db:SetProfile(item.value)
  ScrollingDropDown:SetSelected(SBFOUsingProfileDropDown, SBF.db:GetCurrentProfile())
  SBFOptions:ProfileChanged()
end

SBFOptions.CopyProfileDropDown_Initialise = function(self)
	SBFOCopyProfileDropDown:Init(self.DropDownCallback, self.strings.COPYPROFILE)
  ScrollingDropDown:ClearItems(SBFOCopyProfileDropDown)
  local profiles = SBF.db:GetProfiles()
	local info = SBF:GetTable()
	info.callback	= SBFOptions.CopyProfileDropDown_OnClick
	for k,v in pairs(profiles) do
		if (v ~= SBF.db:GetCurrentProfile()) then
			info.text	= v
			info.value = v
			ScrollingDropDown:AddItem(SBFOCopyProfileDropDown, info)
		end
	end
	SBF:PutTable(info)
end

SBFOptions.CopyProfileDropDown_OnClick = function(item)
	SBF.db:CopyProfile(item.value)
  SBFOptions:ProfileChanged()
end

SBFOptions.DeleteProfileDropDown_Initialise = function(self)
	SBFODeleteProfileDropDown:Init(self.DropDownCallback, self.strings.DELETEPROFILE)
  ScrollingDropDown:ClearItems(SBFODeleteProfileDropDown)
  local profiles = SBF.db:GetProfiles()
	local info = SBF:GetTable()
	info.callback	= SBFOptions.DeleteProfileDropDown_OnClick
	for k,v in pairs(profiles) do
		if (v ~= SBF.db:GetCurrentProfile()) then
			info.text	= v
			info.value = v
			ScrollingDropDown:AddItem(SBFODeleteProfileDropDown, info)
		end
	end
	SBF:PutTable(info)
end

SBFOptions.DeleteProfileDropDown_OnClick = function(item)
  local dialog = StaticPopup_Show("SBFO_CONFIRM_REMOVE_PROFILE", item.value)
  dialog.data = item.value
end

SBFOptions.DeleteProfile = function(self, profile)
  SBF.db:DeleteProfile(profile)
  self:CopyProfileDropDown_Initialise()
  self:DeleteProfileDropDown_Initialise()
end


SBFOptions.cyCircledChanged = function()
  cyCircled_SatrinaBuffFrames.db.profile.adjust = this:GetValue()
  SBFOcyCircledSliderText:SetFormattedText(SBFOptions.strings.CYCIRCLEDADJUST, cyCircled_SatrinaBuffFrames.db.profile.adjust)
  cyCircled_SatrinaBuffFrames:ApplyCustom()
end

SBFOptions.AuraMaxTime = function(self)
  SBF.db.profile.auraMaxTime = this:GetChecked()
  SBF:UpdateTracking()
end

SBFOptions.EnchantsFirst = function(self)
  SBF.db.profile.enchantsFirst = this:GetChecked()
end

SBFOptions.ShowTracking = function(self)
  SBF.db.profile.showTracking = this:GetChecked()
  if SBF.db.profile.showTracking then
    MiniMapTracking:Hide()
  else
    MiniMapTracking:Show()
  end
  SBF:UpdateTracking()
end

SBFOptions.cyCircledSliderChanged = function(self, slider)
  if (slider:GetValue() ~= cyCircled_SatrinaBuffFrames.db.profile.adjust) then
    cyCircled_SatrinaBuffFrames.db.profile.adjust = slider:GetValue()
    cyCircled_SatrinaBuffFrames:ApplyCustom()
	end
  SBFOcyCircledSliderText:SetFormattedText(SBFOptions.strings.CYCIRCLEDADJUST, cyCircled_SatrinaBuffFrames.db.profile.adjust)
end

SBFOptions.DisableBF = function(self, checked)
  SBF.db.global.disableBF = checked
  SBF:Print("This change requires you to either reload UI or log out and back in to take effect")
end

SBFOptions.TotemTimers = function(self)
  SBF.db.profile.noTotemTimers = this:GetChecked()
  SBF.db.profile.noTotemNonBuffs = false
  self:TotemButtons()
end

SBFOptions.TotemNonBuffs = function(self)
  SBF.db.profile.noTotemNonBuffs = this:GetChecked()
  SBF.db.profile.noTotemTimers = false
  self:TotemButtons()
end

SBFOptions.TotemOutOfRange = function(self)
  SBF.db.profile.totemOutOfRange = this:GetChecked()
  SBF.db.profile.noTotemTimers = false
  self:TotemButtons()
end


SBFOptions.TotemButtons = function(self)
  if SBF.db.profile.noTotemTimers then
    self:EnableCheckbox(SBFOTotemTimersButton)
    self:DisableCheckbox(SBFOTotemNonBuffButton)
    self:DisableCheckbox(SBFOTotemOutOfRangeButton)
    SBFOTotemTimersButton:SetChecked(true)
  elseif SBF.db.profile.noTotemNonBuffs or SBF.db.profile.totemOutOfRange then
    self:DisableCheckbox(SBFOTotemTimersButton)
    self:EnableCheckbox(SBFOTotemNonBuffButton)
    self:EnableCheckbox(SBFOTotemOutOfRangeButton)
    SBFOTotemOutOfRangeButton:SetChecked(SBF.db.profile.totemOutOfRange)
    SBFOTotemNonBuffButton:SetChecked(SBF.db.profile.noTotemNonBuffs)
  else
    self:EnableCheckbox(SBFOTotemTimersButton)
    self:EnableCheckbox(SBFOTotemNonBuffButton)
    self:EnableCheckbox(SBFOTotemOutOfRangeButton)
    SBFOTotemTimersButton:SetChecked(false)
    SBFOTotemNonBuffButton:SetChecked(false)
    SBFOTotemOutOfRangeButton:SetChecked(false)
  end
end