local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')

local SBFOFilterButtons = {}

SBFOptions.FilterTabSelectFrame = function(self, var)
	for i=1,10 do
		SBFOFilterButtons[i] = getglobal("SBFOFilterList"..i)
	end
end

SBFOptions.EnableFilters = function(self)
	SBF.db.profile.enableFilters = this:GetChecked()
	if SBF.db.profile.enableFilters then
		SBFOptions:EnableCheckbox(SBFOEnableRFiltersCheckButton, SBF.db.profile.enableRFilters)
	else
		SBF.db.profile.enableRFilters = nil
		SBFOptions:DisableCheckbox(SBFOEnableRFiltersCheckButton)
	end
end

SBFOptions.EnableRFilters = function(self)
	SBF.db.profile.enableRFilters = this:GetChecked()
end

SBFOptions.AddFilter = function(self)
	if SBFOptions.editFilter then
		SBF.db.profile.filters[SBFOptions.editFilter] = SBFOBuffFilterEdit.edit:GetText()
		SBFOAddFilterButton:SetFormattedText(SBFOptions.strings.ADDFILTER)
		SBFOptions.editFilter = nil
	else
		local str = SBFOBuffFilterEdit.edit:GetText()
		if (string.len(str) > 0) then
			table.insert(SBF.db.profile.filters, str)
		end
	end
	SBFOptions:UpdateFilterList()
	SBFOBuffFilterEdit.edit:SetText("")
	SBFOBuffFilterEdit.edit:ClearFocus()
end

SBFOptions.EditFilter = function(self)
	if SBFOptions.currentFilter then
		SBFOptions.editFilter = SBFOptions.currentFilter
		SBFOBuffFilterEdit.edit:SetText(SBF.db.profile.filters[SBFOptions.currentFilter])
		SBFOAddFilterButton:SetFormattedText(SBFOptions.strings.EDITFILTER)
	end
	SBFOptions:UpdateFilterList()
end

SBFOptions.RemoveFilter = function(self)
	if SBFOptions.currentFilter then
		table.remove(SBF.db.profile.filters, SBFOptions.currentFilter)
		SBFOptions.currentFilter = nil
	end
	SBFOptions:EditDone()
	SBFOptions:UpdateFilterList()
end

SBFOptions.FilterUp = function(self)
	local f = table.remove(SBF.db.profile.filters, SBFOptions.currentFilter)
	SBFOptions.currentFilter  = SBFOptions.currentFilter - 1
	table.insert(SBF.db.profile.filters, SBFOptions.currentFilter, f)
	SBFOptions:EditDone()
	SBFOptions:UpdateFilterList()
end

SBFOptions.FilterDown = function(self)
	local f = table.remove(SBF.db.profile.filters, SBFOptions.currentFilter)
	SBFOptions.currentFilter  = SBFOptions.currentFilter + 1
	table.insert(SBF.db.profile.filters, SBFOptions.currentFilter, f)
	SBFOptions:EditDone()
	SBFOptions:UpdateFilterList()
end

SBFOptions.SelectFilter = function(self)
	if SBF.db.profile.filters[this.index] then
		SBFOptions.currentFilter = this.index
		SBFOptions:EditDone()
		SBFOptions:UpdateFilterList()
	end
end

SBFOptions.EditDone = function(self)
	SBFOAddFilterButton:SetFormattedText(SBFOptions.strings.ADDFILTER)
	self.editFilter = nil
	SBFOBuffFilterEdit.edit:SetText("")
	SBFOBuffFilterEdit.edit:ClearFocus()
end

SBFOptions.UpdateFilterList = function(self)
	local offset = FauxScrollFrame_GetOffset(SBFOFilterListScrollFrame)
	local listIndex,str
	if not self then
		self = SBFOptions
	end
	
	for i=1,10 do
		local listIndex = offset + i
		button = SBFOFilterButtons[i]

		if SBF.db.profile.filters[listIndex] then
			button.label:SetFormattedText(SBF.db.profile.filters[listIndex])
			button.index = listIndex
		else	
			button.label:SetFormattedText("")
		end

		-- Highlight the selected filter
		if SBFOptions.currentFilter and (SBFOptions.currentFilter == listIndex) then
			button:LockHighlight()
			button.label:SetTextColor(1, 1, 1)
		else
			button:UnlockHighlight()
			button.label:SetTextColor(1, 0.82, 0)
		end
	end
	FauxScrollFrame_Update(SBFOFilterListScrollFrame, #SBF.db.profile.filters, 10, 14)
	
	if SBFOptions.currentFilter then
		SBFOFilterEditButton:Enable()
		SBFOFilterRemoveButton:Enable()
		if (#SBF.db.profile.filters > 1) and (SBFOptions.currentFilter > 1) then
			SBFOFilterUpButton:Enable()
		else
			SBFOFilterUpButton:Disable()
		end
		if (#SBF.db.profile.filters > 1) and (SBFOptions.currentFilter < #SBF.db.profile.filters) then
			SBFOFilterDownButton:Enable()
		else
			SBFOFilterDownButton:Disable()
		end
	else
		SBFOFilterEditButton:Disable()
		SBFOFilterRemoveButton:Disable()
		SBFOFilterUpButton:Disable()
		SBFOFilterDownButton:Disable()
	end
end

SBFOptions.RemoveFrameFilters = function(self, frame)
  if not frame then
    return
  end
  local found,frameNum
	while true do
		found = false
		for i,f in pairs(SBF.db.profile.filters) do
      frameNum = tonumber(string.match(f, "(%d%d?):"))
			if (frameNum == frame) then
        self:Print(format(self.strings.FILTERDELETE, f))
				table.remove(SBF.db.profile.filters, i)
				found = true
				break
			end
		end
		if not found then
      break
		end
	end
  local alpha, bravo
  for i,f in pairs(SBF.db.profile.filters) do
    alpha,bravo = string.match(f, "(%d%d?):(.+)")
    alpha = tonumber(alpha)
    if alpha and (alpha > frame) then
      self:Print(format(self.strings.FILTERREFORMAT, f, alpha - 1))
      SBF.db.profile.filters[i] = format("%d:%s", alpha - 1, bravo)
    end
  end
  SBFOptions:UpdateFilterList()
end

SBFOptions.ShowFilterHelp = function(self)
  if not SBFOFilterTab.pages then
    SBFOFilterTab.pages = {}
    local str
    for i,page in ipairs(SBFOptions.strings.FILTERHELPHTML) do
      str = SBFOptions.strings.OPENHTML
      for j,line in ipairs(page) do
        str = str..line
      end
      str = str..SBFOptions.strings.CLOSEHTML
      SBFOFilterTab.pages[i] = str
    end
  end
  SBFOHelpFrame.pages = SBFOFilterTab.pages
  SBFOHelpFrame.page = 1
  SBFOHelpFrame.pageStr:SetText(SBFOHelpFrame.page.."/"..#SBFOHelpFrame.pages)
  SBFOHelpFrame.html:SetText(SBFOHelpFrame.pages[SBFOHelpFrame.page])
  SBFOHelpFrame:Show()
end