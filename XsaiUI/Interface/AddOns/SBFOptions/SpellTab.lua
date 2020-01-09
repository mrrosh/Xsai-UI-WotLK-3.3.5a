local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')

local SBFOSpellListButtons = {}

SBFOptions.SpellTabSelectTab = function(self)
  self:FillSpellList()
end

SBFOptions.SpellTabSelectFrame = function(self, var)
	for i=1,10 do
		SBFOSpellListButtons[i] = getglobal("SBFOSpellList"..i)
	end
end

SBFOptions.Exclude = function(self)
	if this:GetChecked() then
		SBF:AddExclude(self.cache[self.currentSpellIndex])
	else
		SBF:RemoveExclude(self.cache[self.currentSpellIndex])
	end
	self:UpdateSpellList()
end

SBFOptions.AlwaysWarn = function(self)
	if this:GetChecked() then
		SBF:AddAlwaysWarn(self.cache[self.currentSpellIndex])
	else
		SBF:RemoveAlwaysWarn(self.cache[self.currentSpellIndex])
	end
	self:UpdateSpellList()
end

SBFOptions.ClearSpellCache = function(self)
  SBF:PutTable(SBF.db.global.spells)
  SBF.db.global.spells = SBF:GetTable()
  self:FillSpellList()
end

SBFOptions.FillSpellList = function(self, force)
  self.cacheSize = #SBF.db.global.spells
  SBF:PutTable(self.cache)
  self.cache = SBF:GetTable()
  local pattern = strlower(SBFOSpellFilterEdit.edit:GetText())
  for name,data in pairs(SBF.db.global.spells) do 
    if (data.auraType >= SBF.HARMFUL) and SBFOShowDebuffsCheckButton:GetChecked() then
      if not pattern or string.find(strlower(name), pattern) then
        table.insert(self.cache, name)
      end
    elseif (data.auraType < SBF.HARMFUL) and SBFOShowBuffsCheckButton:GetChecked() then
      if not pattern or string.find(strlower(name), pattern) then
        table.insert(self.cache, name)
      end
    end
  end
  table.sort(self.cache)
  self.currentSpellIndex = nil
  self:UpdateSpellList()
end

SBFOptions.UpdateSpellList = function(self)
	local listIndex, spell, frame, exclude, alwaysWarn, filterFrame, filter, rFilterFrame, rFilter
	local offset = FauxScrollFrame_GetOffset(SBFOSpellListScrollFrame)
	if not SBFOptions.fauxBuff then
		SBFOptions.fauxBuff = {}
	end
	
	for i=1,10 do
		listIndex = offset + i
		button = SBFOSpellListButtons[i]
		spell = SBFOptions.cache[listIndex]

		if spell then
			button.label:SetFormattedText(spell)
			button.index = listIndex
			
			if SBF.db.profile.enableFilters then
				SBFOptions.fauxBuff.name = spell
				SBFOptions.fauxBuff.duration, SBFOptions.fauxBuff.untilCancelled, SBFOptions.fauxBuff.auraType = SBF:GetSpell(spell)
				if SBFOptions.fauxBuff.untilCancelled then
					SBFOptions.fauxBuff.timeLeft = 0
				else
					SBFOptions.fauxBuff.timeLeft = SBFOptions.fauxBuff.duration
				end
				SBFOptions.fauxBuff.expFloor = SBFOptions.fauxBuff.timeLeft
				SBFOptions.fauxBuff.filterName = nil
				filterFrame, filter = SBF:DoFilters(SBFOptions.fauxBuff)
        if SBF.db.profile.enableRFilters and not SBFOptions.fauxBuff.untilCancelled then
 					SBFOptions.fauxBuff.timeLeft = 1
					SBFOptions.fauxBuff.expFloor = 1
          rFilterFrame, rFilter = SBF:DoFilters(SBFOptions.fauxBuff)
        end
			end

			frame = SBF:ShowIn(spell)
			exclude = SBF:IsExcluded(spell)
			alwaysWarn = SBF:IsAlwaysWarn(spell)
			if exclude or alwaysWarn or frame then
				button.label:SetTextColor(GREEN_FONT_COLOR.r,GREEN_FONT_COLOR.g,GREEN_FONT_COLOR.b)
			elseif filterFrame or rFilterFrame then
				button.label:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
			else
				button.label:SetTextColor(GRAY_FONT_COLOR.r,GRAY_FONT_COLOR.g,GRAY_FONT_COLOR.b)
			end
		else	
			button.label:SetFormattedText("")
			button.listIndex = nil
		end

		-- Highlight selected 
		if SBFOptions.currentSpellIndex and (SBFOptions.currentSpellIndex == listIndex) then
			SBFOptions.currentSpell = spell
      button:LockHighlight()
			button.label:SetTextColor(1, 1, 1)

      SBFOSpellDurationDropDown:Enable()
      ScrollingDropDown:SetSelected(SBFOSpellDurationDropDown, ceil(SBF.db.global.spells[spell].duration), ScrollingDropDown.VALUE)

			SBFOShowInFrameDropDown:Enable()
			if frame then
        ScrollingDropDown:SetSelected(SBFOShowInFrameDropDown, frame, ScrollingDropDown.VALUE)
			else
        ScrollingDropDown:SetSelected(SBFOShowInFrameDropDown, SBFOptions.strings.DEFAULTFRAME)
			end

			SBFOptions:EnableCheckbox(SBFOAlwaysWarnCheckButton, alwaysWarn)
			SBFOptions:EnableCheckbox(SBFOSpellExcludeCheckButton, exclude)

      if filterFrame and filter then
				SBFOSpellText1:SetFormattedText(SBFOptions.strings.SHOWFILTER, filterFrame, filter)
			else
				SBFOSpellText1:SetFormattedText("")
			end
			if rFilterFrame and rFilter  and (rFilter ~= filter) then
				SBFOSpellText2:SetFormattedText(SBFOptions.strings.SHOWFILTER, rFilterFrame, rFilter)
			else
				SBFOSpellText2:SetFormattedText("")
			end
			if frame and (filterFrame or rFilterFrame) then
				SBFOSpellText3:SetFormattedText(SBFOptions.strings.FILTERBLOCKED, frame)
			else
				SBFOSpellText3:SetFormattedText("")
			end
		else
			button:UnlockHighlight()
		end
		if not SBFOptions.currentSpellIndex then
			SBFOptions:DisableCheckbox(SBFOAlwaysWarnCheckButton)
			SBFOptions:DisableCheckbox(SBFOSpellExcludeCheckButton)
			SBFOShowInFrameDropDown:Disable()
      SBFOSpellDurationDropDown:Disable()
		end
	end
	FauxScrollFrame_Update(SBFOSpellListScrollFrame, #SBFOptions.cache, 10, 14)
end

SBFOptions.SelectSpell = function(self, index)
	self.currentSpellIndex = index
	self:UpdateSpellList()
end

SBFOptions.ShowInFrameDropDown_Initialise = function(self)
  SBFOShowInFrameDropDown:Init(self.DropDownCallback, self.strings.SHOWING)
	local info
	info = SBF:GetTable()
	info.callback = SBFOptions.ShowInFrameDropDown_OnClick
	for i,frame in pairs(SBF.frames) do
		info.text = SBF.strings.SHOWATBUFFRAME..i
		info.value = i
		ScrollingDropDown:AddItem(SBFOShowInFrameDropDown, info)
	end
  info.text = SBF.strings.DEFAULTFRAME
  info.value = -1
  ScrollingDropDown:AddItem(SBFOShowInFrameDropDown, info)
	SBF:PutTable(info)
end

SBFOptions.ShowInFrameDropDown_OnClick = function(item)
	if (item.value > 0) then
		SBF.db.profile.buffFrameList[SBFOptions.cache[SBFOptions.currentSpellIndex]] = item.value
	else
		SBF.db.profile.buffFrameList[SBFOptions.cache[SBFOptions.currentSpellIndex]] = nil
	end
	SBFOptions:UpdateSpellList()
  SBFOShowInFrameDropDown:SetFormattedText(item.text)
end

SBFOptions.durations = {1,2,3,4,5,6,7,8,9,10,15,20,25,30,45,60,120,180,300,600,1800,3600,7200}
SBFOptions.SpellDurationDropDown_Initialise = function(self)
  SBFOSpellDurationDropDown:Init(self.DropDownCallback, self.strings.DURATION)
	SBFOSpellDurationDropDown.dropDownOptions = SBF:GetTable()
  SBFOSpellDurationDropDown.dropDownOptions.noSort = true

	local info
	info = SBF:GetTable()
	info.callback = SBFOptions.SpellDurationDropDown_OnClick
	for i,duration in ipairs(SBFOptions.durations) do
    if (duration < 60) then
      info.text = format("%d %s", duration, SECONDS)
    elseif (duration < 3600) then
      info.text = format("%d %s", duration/60, MINUTES)
    else
      info.text = format("%d %s", duration/3600, HOURS)
    end
		info.value = duration
		ScrollingDropDown:AddItem(SBFOSpellDurationDropDown, info)
	end
  info.text = self.strings.AURA
  info.value = 0
  ScrollingDropDown:AddItem(SBFOSpellDurationDropDown, info)
	SBF:PutTable(info)
end

SBFOptions.SpellDurationDropDown_OnClick = function(item)
  SBF.db.global.spells[SBFOptions.currentSpell].duration = item.value
	SBFOptions:UpdateSpellList()
end
