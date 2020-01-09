local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')
local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')
local _var

SBFOptions.IconTabInitialise = function(self)
	SBFOEnableIconsCheckButtonText:SetFormattedText(self.strings.SHOWICONS)
end

SBFOptions.IconTabSelectFrame = function(self, var)
  if var then
    _var = var
  end
	SBFOIconsConfigButton.text:SetFormattedText(self.strings.ICONCONFIG, self.curFrame.id)
  SBFOEnableIconsCheckButton:SetChecked(_var.icon)
 	if self.curFrame._var.icon then
  else
  end
end

SBFOptions.EnableIcons = function(self)
	if this:GetChecked() then
    SBF:DoIconSavedVars(_var, true)
	else
    _var.icon = nil
	end
  SBFOptions:SetupFrame(self.curFrame)
  self:IconTabSelectFrame()
  self:AttachElementForMove(self.firstBuff.icon, self.curFrame._var.icon)
end
