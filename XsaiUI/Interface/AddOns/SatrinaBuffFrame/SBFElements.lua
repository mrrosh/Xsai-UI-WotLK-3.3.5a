local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')
local _G = _G
local sbf = _G.SBF
local GetTime = _G.GetTime
local tinsert = _G.tinsert
local tremove = _G.tremove
local CreateFrame = _G.CreateFrame
local ipairs = _G.ipairs
local pairs = _G.pairs
local floor = _G.floor
local smatch = _G.string.match
local sgsub = _G.string.gsub
local sfind = _G.string.find
local sgmatch = _G.string.gmatch
local sbyte = _G.string.byte
local tonumber = _G.tonumber
local UIDropDownMenu_CreateInfo = _G.UIDropDownMenu_CreateInfo
local UIDropDownMenu_AddButton = _G.UIDropDownMenu_AddButton
local CloseDropDownMenus = _G.CloseDropDownMenus
local ToggleDropDownMenu = _G.ToggleDropDownMenu
local DestroyTotem = _G.DestroyTotem
local CancelUnitBuff = _G.CancelUnitBuff


local debugMask = 8

--
-- Buff Bars
--
local bars = {}
local barCount = 0
local barsOut = 0

sbf.GetBar = function(self)
	if (#bars > 0) then
    barsOut = barsOut + 1
    return tremove(bars)
  end
	barCount = barCount + 1
	bar = CreateFrame("Button", "SBFBuffBar"..barCount, UIParent, "SBFBuffBarTemplate")
  barsOut = barsOut + 1
	return bar
end

sbf.PutBar = function(self, bar)
	if bar then
    bar._buff = nil
		bar:ClearAllPoints()
		bar:Hide()
    barsOut = barsOut - 1
    tinsert(bars, bar)
	end
end

sbf.SetupBar = function(self, bar, var)
end

-- update bars on every OnUpdate so that they animate smoothly
sbf.UpdateBars = function(self, f)
  if not self.getBuffs then
    local var,buff,w
    for i,frame in ipairs(self.frames) do
      if (frame == f) or not f then
        var = frame._var
        if var.bar and (#frame.buffs > 0) then
          for j,slot in ipairs(frame.slots) do
            if slot._buff then
              if slot._buff.expiryTime and not slot._buff.untilCancelled then
                slot._buff.timeLeft = max(0, slot._buff.expiryTime - GetTime())
              end
              if not slot._buff.timeLeft or not slot._buff.duration then
                return
              end
              if slot._buff.untilCancelled then
                if self.db.profile.auraMaxTime then
                  w = var.bar.width
                else
                  w = 0.1
                end
              elseif var.bar.fastBar and (slot._buff.duration >= var.expiry.warnAtTime) and (slot._buff.timeLeft <= var.expiry.warnAtTime) then
                w = var.bar.width * slot._buff.timeLeft / var.expiry.warnAtTime
               else
                w = var.bar.width * slot._buff.timeLeft / slot._buff.duration      
              end
              if slot.bar then
                slot.bar.bar:SetWidth(w)
              end
            end
          end
        end
      end
    end
  end
end


sbf.SetBarColour = function(self, bar, colour, alpha)
  bar.bar:SetVertexColor(colour.r, colour.g, colour.b, colour.a or alpha or 1)
end

--
-- Buff Icons
--
local icons = {}
local iconCount = 0
local iconsOut = 0

sbf.GetIcon = function(self)
	if (#icons > 0) then
    iconsOut = iconsOut + 1
    return tremove(icons)
  end
  iconCount = iconCount + 1
  iconsOut = iconsOut + 1
	return CreateFrame("Button", "SBFBuffIcon"..iconCount, UIParent, "SBFBuffIconTemplate")
end

sbf.PutIcon = function(self, icon)
	if icon then
    icon._buff = nil
    icon:SetScript("OnUpdate", nil)
    icon:ClearAllPoints()
    icon:Hide()
    iconsOut = iconsOut - 1
    tinsert(icons, icon)
  end
end

SBF.BuffIcon_OnUpdate = function(self)
  local buff = self._buff
  if buff then
    local var = self:GetParent():GetParent()._var
    if var and not SBF.showingOptions and not buff.untilCancelled and (floor(buff.timeLeft or 0) <= (var.expiry.warnAtTime or 0)) then
      self:SetAlpha(SBF.alpha)
      if self.overlay then
        self.overlay:SetAlpha(1)
      end
      buff.update = false
    end
  end
end

--
-- Buff Timers
--
local timers = {}
local timerCount = 0
local timersOut = 0

sbf.GetTimer = function(self)
	if (#timers > 0) then
    timersOut = timersOut + 1
    return tremove(timers)
  end
  timerCount = timerCount + 1
  timersOut = timersOut + 1
	return CreateFrame("Frame", "SBFBuffTimer"..timerCount, UIParent, "SBFBuffTimerTemplate")
end

sbf.PutTimer = function(self, timer)
	if timer then
		timer.buff = nil
    timer:ClearAllPoints()
		timer:Hide()
    timersOut = timersOut - 1
    tinsert(timers, timer)
	end
end

sbf.UpdateDurations = function(self)
  if self.showingOptions then
    return
  end
  local slot,frame,var
  for index = #self.frames,1,-1 do
    frame = self.frames[index]
    for i,buff in ipairs(frame.buffs) do
      slot = frame.slots[i]
      if slot then
        if not buff.untilCancelled then
          -- For frames with bars, timeLeft updates are done with more precision by UpdateBars
          if buff.expiryTime and not slot.bar then
            buff.timeLeft = max(0, buff.expiryTime - GetTime())
          end
          if not buff.timeLeft then
            return
          end
          if (buff.timeLeft == 0) or (self.db.profile.enableRFilters and (self:GetFrame(buff) ~= buff.frame)) then
            self.getAuras[buff.unit] = true
          end
        end
        if slot then
          var = frame._var
          if buff.flowFrom then
            var = self.frames[buff.flowFrom]._var
          end
          self:ExpiryWarning(buff, slot, var)
          if slot.timer then
            if buff.untilCancelled then
              if frame._var.timer.naTimer then
                slot.timer.text:SetText(self.strings.NA)
                slot.timer:Show()
              else
                slot.timer:Hide()
              end
            else
              self:SetBuffTime(slot.timer, buff.timeLeft, frame._var.timer.format)
            end
          end
        end
      end
    end
  end
end

local dayAbbr = sgsub(DAY_ONELETTER_ABBR, " ", "")
local hourAbbr = sgsub(HOUR_ONELETTER_ABBR, " ", "")
local minAbbr = sgsub(MINUTE_ONELETTER_ABBR, " ", "")
local secAbbr = sgsub(SECOND_ONELETTER_ABBR, " ", "")

sbf.timerFormat2 = "%02d:%02d"
sbf.SetBuffTime = function(self, timer, timeLeft, timerFormat)
  if not timeLeft or not timer or not timerFormat then
    return
  end
	if (timerFormat == 1) then
		if (timeLeft >= 86400) then
			timer.text:SetFormattedText(DAY_ONELETTER_ABBR, ceil(timeLeft/ 86400))
		elseif (timeLeft >= 3600) then
			timer.text:SetFormattedText(HOUR_ONELETTER_ABBR, ceil(timeLeft/ 3600))
		elseif (timeLeft >= 60) then
			timer.text:SetFormattedText(MINUTE_ONELETTER_ABBR, ceil(timeLeft / 60))
		else
			timer.text:SetFormattedText(SECOND_ONELETTER_ABBR, timeLeft)
		end
	elseif (timerFormat == 2) then
		timer.text:SetFormattedText(self.timerFormat2, floor(timeLeft/60), mod(timeLeft, 60))
	elseif (timerFormat == 3) then
		timer.text:SetFormattedText("%d", floor(timeLeft))
	elseif (timerFormat == 4) then
    if (floor(timeLeft) <= 60) then
      timer.text:SetFormattedText("%d", floor(timeLeft))
    else
      timer.text:SetFormattedText("")      
    end
  elseif (timerFormat == 5) then
    timer.text:SetFormattedText("")      
	elseif (timerFormat == 6) then
		if (timeLeft >= 86400) then
			timer.text:SetFormattedText(dayAbbr, ceil(timeLeft/ 86400))
		elseif (timeLeft >= 3600) then
			timer.text:SetFormattedText(hourAbbr, ceil(timeLeft/ 3600))
		elseif (timeLeft >= 60) then
			timer.text:SetFormattedText(minAbbr, ceil(timeLeft / 60))
		else
			timer.text:SetFormattedText(secAbbr, floor(timeLeft))
		end
	elseif (timerFormat == 7) then
    if (timeLeft >= 86400) then
			timer.text:SetFormattedText(dayAbbr, ceil(timeLeft/ 86400))
		elseif (timeLeft >= 3600) then
			timer.text:SetFormattedText(hourAbbr, ceil(timeLeft/ 3600))
		elseif (timeLeft >= 60) then
			timer.text:SetFormattedText(minAbbr, ceil(timeLeft / 60))
		else
			timer.text:SetFormattedText(floor(timeLeft))
		end 
	end
end

--
-- Buff Names
--
local names = {}
local nameCount = 0
local namesOut = 0

sbf.GetName = function(self)
	if (#names > 0) then
    namesOut = namesOut + 1
    return tremove(names)
  end
  nameCount = nameCount + 1
  namesOut = namesOut + 1
	return CreateFrame("Frame", "SBFBuffName"..nameCount, UIParent, "SBFBuffnameTemplate")
end

sbf.PutName = function(self, name)
	if name then
		name.buff = nil
    name:ClearAllPoints()
		name:Hide()
    namesOut = namesOut - 1
    tinsert(names, name)
	end
end

-- Roman numeral conversion
local roman = { 
  {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"}, 
  {50, "L"}, {40, "L"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}, }

local toRoman = function(n)
  if not n then
    return ""
  end
  -- Theoretically you can do any number here, but MMMMMMMMMMMMMMMMMMMMMMM is pretty silly!
  local s = ""
	for k,v in ipairs(roman) do
    while (n - v[1] >= 0) do
      s = s ..v[2]
      n = n - v[1]
    end
  end
	return s
end

-- replace rank placeholder in a string
local rankFmt = function(nFmt, buff, var)
  if buff then
    if nFmt and var.name then
      local rank = smatch(nFmt, "[Rr][Aa][Nn][Kk]%[.-%]")
      if rank then
        local rank = smatch(nFmt, "[Rr][Aa][Nn][Kk]%[.-%]")
        if rank then
          rank = sgsub(rank, "[%(%)%[%]%+%.%*]", "%%%1")
          if (buff.rank == "") or not buff.rank or (buff.rank == 0) then
            nFmt = sgsub(nFmt, rank, "")
            nFmt = sgsub(nFmt, "  ", " ")
          else
            local replace = sgsub(rank, "[Rr][Aa][Nn][Kk]%%%[(.+)%%%]", "%1")
            if sfind(replace, "[Rr][Oo][mM][Aa][nN]") then
              replace = sgsub(replace, "[Rr][Oo][mM][Aa][nN]", toRoman(buff.rank))
            end
            if sfind(replace, "[Aa][Rr][Aa][Bb][Ii][Cc]") then
              replace = sgsub(replace, "[Aa][Rr][Aa][Bb][Ii][Cc]", buff.rank)
            end
            nFmt = sgsub(nFmt, rank, replace)
          end
        end
      end
    end
  end
  return nFmt
end

-- replace count placeholder in a string
local countFmt = function(nFmt, buff, var)
  if buff then
    if nFmt and var.name then
      local count = smatch(nFmt, "[cC][Oo][Uu][Nn][Tt]%[.+%]")
      if count then
        count = sgsub(count, "[%(%)%[%]%+%.%*]", "%%%1")
        local replace = sgsub(count, "[cC][Oo][Uu][Nn][Tt]%%%[(.+)%%%]", "%1")

        if sfind(replace, "[nN][Oo][Rr][Mm][Aa][Ll]") then
          if buff.hadCount and buff.count and (buff.count > 1) then
            replace = sgsub(replace, "[nN][Oo][Rr][Mm][Aa][Ll]", buff.count)
          else
            nFmt = sgsub(nFmt, count, "")
            nFmt = sgsub(nFmt, "  ", " ")
          end
        end

        if sfind(replace, "[aA][Ll][Ww][Aa][yY][sS]") then
          local c = buff.count
          if not c or (c == 0) then 
            c = 1 
          end
          replace = sgsub(replace, "[aA][Ll][Ww][Aa][yY][sS]", c)
        end

        if sfind(replace, "[sS][tT][Aa][cC][kK]") then
          if buff.hadCount then
            replace = sgsub(replace, "[sS][tT][Aa][cC][kK]", buff.count or 1)
          else
            nFmt = sgsub(nFmt, count, "")
            nFmt = sgsub(nFmt, "  ", " ")
          end
        end

        nFmt = sgsub(nFmt, count, replace)
      end
    end
  end
  return nFmt
end

local strTmp = CreateFrame("Button")
local shortName = function(name, supershort)
	strTmp:SetFormattedText("")
	for word in sgmatch(name, "[^%s]+") do 
    if not supershort or (supershort and (sbyte(word, 1) > 64) and (sbyte(word, 1) < 91)) then
      if tonumber(word) then
        strTmp:SetFormattedText("%s%s", strTmp:GetText() or "", word)
      else
        strTmp:SetFormattedText("%s%s", strTmp:GetText() or "", smatch(word, "^."))
      end
      if sfind(word, "[:]") then
        strTmp:SetFormattedText("%s:", strTmp:GetText())
      end
    end
	end
	return strTmp:GetText()
end

local truncateName = function(name, a, b)
	strTmp:SetFormattedText("")
  strTmp:SetFormattedText(string.sub(name, a, b))
	return strTmp:GetText()
end

local ofChop = function(name)
  local a,b = string.find(name, SBF.strings.OF)
  if b then
    return string.sub(name, b+2)
  end
  return name
end

-- replace name placeholder in a string
local nameFmt = function(nFmt, buff, var)
  if buff then
    if nFmt and var.name then
      local alpha, beta
      local name = smatch(nFmt, "[nN][aA][mM][eE]%[.-%]")
      if name then
        name = sgsub(name, "[%(%)%[%]%+%.%*]", "%%%1")
        local replace = sgsub(name, "[nN][aA][mM][eE]%%%[(.+)%%%]", "%1")

        if sfind(replace, "[Ff][Uu][Ll][Ll]") then
          replace = sgsub(replace, "[Ff][Uu][Ll][Ll]", buff.name)
        elseif sfind(replace, "[Xx][Ss][Hh][Oo][Rr][Tt]") then
          replace = sgsub(replace, "[Xx][Ss][Hh][Oo][Rr][Tt]", shortName(buff.name, true))
        elseif sfind(replace, "[Ss][Hh][Oo][Rr][Tt]") then
          replace = sgsub(replace, "[Ss][Hh][Oo][Rr][Tt]", shortName(buff.name, false))
        elseif sfind(replace, "[Tt][Rr][Uu][Nn][Cc]") then
          alpha = string.match(replace, "[Tt][Rr][Uu][Nn][Cc]:(..?.?)")
          replace = sgsub(replace, "[Tt][Rr][Uu][Nn][Cc]:..?.?", truncateName(buff.name, 1, tonumber(alpha) or 20))
        elseif sfind(replace, "[Cc][Hh][Oo][Pp]") then
          alpha = string.match(replace, "[Cc][Hh][Oo][Pp]:(..?.?)")
          replace = sgsub(replace, "[Cc][Hh][Oo][Pp]:..?.?", truncateName(buff.name, tonumber(alpha) or 20))
        elseif sfind(replace, "[Oo][Ff]") then
          alpha = string.match(replace, "[oO][Ff]")
          replace = sgsub(replace, "[oO][Ff]", ofChop(buff.name))
        end
        
        nFmt = sgsub(nFmt, name, replace)
      end
    end
  end
  return nFmt
end


sbf.FormatName = function(self, buff, var)
  if var and var.name then
    local nFmt = var.name.nameFormat
    -- name format string
    nFmt = nameFmt(nFmt, buff, var)
    -- rank format string
    nFmt = rankFmt(nFmt, buff, var)
    -- count format string
    nFmt = countFmt(nFmt, buff, var)
    
    return nFmt
  else
    return buff.name
  end
end

--
-- Buff Counts
--
local counts = {}
local countCount = 0
local countsOut = 0

sbf.GetCount = function(self)
	if (#counts > 0) then
    countsOut = countsOut + 1
    return tremove(counts)
  end
  countCount = countCount + 1
  countsOut = countsOut + 1
	return CreateFrame("Frame", "SBFBuffCount"..countCount, UIParent, "SBFBuffCountTemplate")
end

sbf.PutCount = function(self, count)
	if count then
		count.buff = nil
    count:ClearAllPoints()
		count:Hide()
    countsOut = countsOut - 1
    tinsert(counts, count)
	end
end


--
-- Buff Anchors
--
local anchors = {}
local anchorCount = 0

sbf.GetAnchor = function(self)
	if (#anchors > 0) then
    return tremove(anchors)
  end
  anchorCount = anchorCount + 1
	local a = CreateFrame("Frame", "SBFBuffAnchor"..anchorCount, UIParent, "SBFBuffAnchorTemplate")
  a.dot:SetBackdropColor(1,0,0,1)
  return a
end

sbf.PutAnchor = function(self, anchor)
	if anchor then
		anchor.buff = nil
    anchor:ClearAllPoints()
		anchor:Hide()
    anchor:SetFrameStrata("LOW")
    tinsert(anchors, anchor)
	end
end

sbf.ElementStats = function(self)
  self:Print(format("%d icons created: %d out, %d in", iconCount, iconsOut, #icons))
  self:Print(format("%d timers created: %d out, %d in", timerCount, timersOut, #timers))
  self:Print(format("%d counts created: %d out, %d in", countCount, countsOut, #counts))
  self:Print(format("%d bars created: %d out, %d in", barCount, barsOut, #bars))
  self:Print(format("%d names created: %d out, %d in", nameCount, namesOut, #names))
end

--
-- Utility
--
sbf.FastUpdates = function(self, elapsed)
  sbf:UpdateBars()
  if sbf.flash then
    sbf:UpdateAlpha(elapsed)
  end
end

sbf.ShowTooltip = function(self)
  if self._buff then
    GameTooltip:SetOwner(self, "ANCHOR_TOP")
    local var = self:GetParent():GetParent()._var
    local unit = self._buff.unit or PLAYER
    if not sbf.showingOptions and not var.layout.noTooltips then
      if (self._buff.auraType == sbf.ENCHANT) then
        if self._buff.showItem then
          GameTooltip:SetInventoryItem(unit, self._buff.invID)
        else
          GameTooltip:SetText(self._buff.name)
          GameTooltip:AddLine(SecondsToTime(self._buff.timeLeft or 0, true))
          GameTooltip:Show()
        end
      elseif self._buff.totemSlot then
        GameTooltip:SetTotem(self._buff.totemSlot)
      elseif self._buff.isTracking then
        GameTooltip:SetText(self._buff.name)
      elseif self._buff.name then
        GameTooltip:SetUnitAura(unit, self._buff.index, self._buff.filter)
      end
    end
  else
    GameTooltip:SetText(sbf.strings.BUFFERROR)
  end
end

sbf.HideTooltip = function(self)
	GameTooltip:Hide()
end

sbf.BuffDropDown_Init = function(self)
  local buff = 	self:GetParent()._buff

  if not buff then
    return
  end
  
  local level = UIDROPDOWNMENU_MENU_LEVEL
  local info
  
  if (UIDROPDOWNMENU_MENU_LEVEL == 1) then
    info = UIDropDownMenu_CreateInfo()
    info.text			= buff.name
    info.isTitle	= 1
    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    
    info = UIDropDownMenu_CreateInfo()
    info.text					= sbf.strings.BUFFFRAME
    info.hasArrow			= true
    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

    info = UIDropDownMenu_CreateInfo()
    info.text			= sbf.strings.EXCLUDE
    info.arg1     = buff
    info.arg2			= "exclude"
    info.func			= sbf.BuffDropDown_OnClick
    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

    if not buff.untilCancelled then
      info = UIDropDownMenu_CreateInfo()
      info.text			= sbf.strings.ALWAYSWARN
      info.arg1     = buff
      info.arg2			= "alwayswarn"
      info.func			= sbf.BuffDropDown_OnClick
      info.checked	= sbf:IsAlwaysWarn(buff.name)
      UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    end
    
    info = UIDropDownMenu_CreateInfo()
    info.disabled = 1
    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

    if (buff.auraType == sbf.TOTEM) then
      info = UIDropDownMenu_CreateInfo()
      info.text			= sbf.strings.DESTROYTOTEM
      info.arg1     = buff
      info.arg2			= "destroytotem"
      info.func			= sbf.BuffDropDown_OnClick
      UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    end
    
    if (buff.auraType ~= sbf.HARMFUL) and (buff.auraType ~= sbf.TOTEM) then
      info = UIDropDownMenu_CreateInfo()
      info.text			= sbf.strings.CANCEL
      info.arg1     = buff
      info.arg2			= "cancelbuff"
      info.func			= sbf.BuffDropDown_OnClick
      UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    end
  elseif (UIDROPDOWNMENU_MENU_LEVEL == 2) then
    for i,frame in ipairs(sbf.frames) do
      info = UIDropDownMenu_CreateInfo()
      info.text = sbf.strings.SHOWATBUFFRAME..i
      info.arg1	= buff
      info.arg2	= "showinframe"..i
      info.func = sbf.BuffDropDown_OnClick
      info.checked = (sbf.db.profile.buffFrameList[buff.name] == i)
      UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    end
    info = UIDropDownMenu_CreateInfo()
    info.text = sbf.strings.NOFRAME
    info.arg1 = buff
    info.arg2	= "clearframe"
    info.func = sbf.BuffDropDown_OnClick
    UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
    return
	end
end

sbf.BuffDropDown_OnClick = function(self, buff, cmd)
  if (cmd == "exclude") then
		sbf:AddExclude(buff.name)
	elseif (cmd == "alwayswarn") then
		if self.checked then
			sbf:RemoveAlwaysWarn(buff.name)
		else
			sbf:AddAlwaysWarn(buff.name)
		end
	elseif (cmd == "cancelbuff") then
    if (buff.auraType == sbf.ENCHANT) then
      buff.cancel = sbf.enchantDebounce
    elseif buff.totemSlot and not string.find(buff.name, self.strings.SENTRYTOTEM) then
      DestroyTotem(buff.totemSlot)
    else
      CancelUnitBuff(buff.unit, buff.index, buff.filter)
    end
	elseif (cmd == "destroytotem") then
    DestroyTotem(buff.totemSlot)
	elseif (smatch(cmd, "showinframe")) then
    local f = tonumber(smatch(cmd, "showinframe(.+)"))
		sbf.db.profile.buffFrameList[buff.name] = f
	elseif (cmd == "clearframe") then
		sbf.db.profile.buffFrameList[buff.name] = nil
	end
	CloseDropDownMenus(1)
	sbf.getAuras[buff.unit] = true
end

sbf.Buff_OnClick = function(self)
  if not sbf.showingOptions then
    local var = self:GetParent():GetParent()._var
    if self._buff.isTracking then
      ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self, 0, -5)
		elseif (arg1 == "RightButton") and not IsShiftKeyDown() and not var.layout.disableRightClick then
			if (self._buff.auraType == sbf.ENCHANT) then
				self._buff.cancel = sbf.enchantDebounce
			elseif self._buff.totemSlot then
        if string.find(self._buff.name, SBF.strings.SENTRYTOTEM) then
          CancelUnitBuff(self._buff.unit, self._buff.index, self._buff.filter)
        else
          DestroyTotem(self._buff.totemSlot)
        end
      else
        CancelUnitBuff(self._buff.unit, self._buff.index, self._buff.filter)
			end
		elseif (arg1 == "LeftButton") then
      if IsShiftKeyDown() and self.dropDown then
        menuBuff = self._buff
        ToggleDropDownMenu(1, nil, self.dropDown, self:GetName())
      elseif IsAltKeyDown() then
        for k,v in pairs(self._buff) do
          sbf:Print(format("%s => %s", tostring(k), tostring(v)))
        end
      end
		end
	end
end