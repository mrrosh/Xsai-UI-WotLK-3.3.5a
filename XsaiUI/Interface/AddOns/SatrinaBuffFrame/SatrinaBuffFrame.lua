-- $Date: 2008-12-17 10:40:35 -0500 (Wed, 17 Dec 2008) $
SBF = LibStub("AceAddon-3.0"):NewAddon("SBF", "AceEvent-3.0", "AceConsole-3.0", "AceTimer-3.0")
SBF._beta = false
SBF.strings = {}

local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')

local _G = _G
local sbf = SBF
local format = _G.format
local ipairs = _G.ipairs
local pairs = _G.pairs
local GetTime = _G.GetTime
local InCombatLockdown = _G.InCombatLockdown
local sfind = string.find

local debugMask = 1

sbf.revision = tonumber(("$Revision: 118 $"):match("%d+"))

-- This is a bitmask
debugBitMask = {
  [1] = "General",
  [2] = "Buffs",
  [4] = "Frames",
  [8] = "Display",
  [16] = "Tracking/Enchants/Totems",
  [32] = "Saved Variables",
  [64] = "Totems",
  [128] = "Filters",
  [256] = "Table recycling",
}
sbf.debug = 0

sbf.debugmsg = function(self, level, fmt, ...)
  if (self.debug > 0) and (bit.band(level, self.debug) == level) then
    if fmt then
      self:Print(format("[%s] %s", debugBitMask[level], format(fmt, ...)))
    else
      self:Print("debugmsg: format was nil")
    end
  end
end

--
-- Ace Stuff
--

sbf.OnInitialize = function(self)
  self.updateDelay = 1.0
  self.frameDelay = 0.5
  self.durationIncrement = 1.0
  self.flashCount = 0
  self.justify = {[1] = "LEFT", [2] = "CENTER", [3] = "RIGHT", ["LEFT"] = 1, ["CENTER"] = 2, ["RIGHT"] = 3}

  self.version = tonumber(GetAddOnMetadata("SatrinaBuffFrame", "Version"))
  self.minor = tonumber(GetAddOnMetadata("SatrinaBuffFrame", "X-MinorVersion"))

	if self._beta then
		self.versionStr = format("%.01f beta %d", self.version, self.minor)
	else
		self.versionStr = format("%.01f.%d", self.version, self.minor)
	end

  self.sbfoVersion = tonumber(GetAddOnMetadata("SBFOptions", "Version"))
  self.sbfoMinor = tonumber(GetAddOnMetadata("SBFOptions", "X-MinorVersion"))

	if self._beta then
		self.sbfoVersionStr = format("%.01f beta %d", self.version, self.minor)
	else
		self.sbfoVersionStr = format("%.01f.%d", self.version, self.minor)
	end
	
	self.sortOptions = {
		self.NoSort,
		self.AscendingTimeSort,
		self.DescendingTimeSort,
		self.AscendingNameSort,
		self.DescendingNameSort,
	}

  self:RegisterChatCommand("sbf", "ChatCommand")
  
	self.updateFrame = CreateFrame("Frame")
  self.frames = {}
  
  self.lastUpdate = {}
  
  self.getAuras = {
    ["player"] = false
  }
	
  self.flash = false
	self.flashTime = 0
	self.flashState = 1

	self.alpha = 1
	self.alphaStep = 0.1
  
	self.classDispel = {
		MAGE = { self.strings.CURSE },
		PRIEST = { self.strings.DISEASE, self.strings.MAGIC },
		DRUID = { self.strings.CURSE, self.strings.POISON},
		PALADIN = { self.strings.POISON, self.strings.DISEASE, self.strings.MAGIC },
		SHAMAN = { self.strings.DISEASE, self.strings.POISON },
		DEATHKNIGHT = {},
		WARRIOR = {},
		ROGUE = {},
		HUNTER = {},
		WARLOCK = {},
	}
	
	SML:Register("sound", sbf.strings.sounds[1], [[Sound\Spells\AntiHoly.wav]])
	SML:Register("sound", sbf.strings.sounds[2], [[Sound\interface\iTellMessage.wav]])
	SML:Register("sound", sbf.strings.sounds[3], [[Sound\interface\AuctionWindowOpen.wav]])
	SML:Register("sound", sbf.strings.sounds[4], [[Sound\interface\FriendJoin.wav]])
	SML:Register("sound", sbf.strings.sounds[5], [[Sound\Creature\Murloc\mMurlocAggroOld.wav]])

  -- Options Stub
  self.addonName = select(2, GetAddOnInfo("SatrinaBuffFrame"))
  self.optionsPlaceholder = CreateFrame("Frame")
  local ver = self.optionsPlaceholder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  ver:SetPoint('BOTTOMLEFT', 16, 16)
	ver:SetText(format(self.strings.SLASHHEADER, self.versionStr))
  self.optionsPlaceholder.name = self.addonName
  InterfaceOptions_AddCategory(self.optionsPlaceholder)
  hooksecurefunc("InterfaceOptionsListButton_OnClick", self.CheckOptionsClick)
end

sbf.CheckOptionsClick = function(listButton, mouseButton)
  if listButton.element and (listButton.element.name == SBF.addonName) then
    SBF:OpenOptions()
  end
end

sbf.OnDisable = function(self)
	self:Print(self.strings.DISABLE)
end

sbf.OnEnable = function(self)
  if (self.version ~= self.sbfoVersion) or (self.version == self.sbfoVersion and self.minor ~= self.sbfoMinor) then
    self:Print(format(self.strings.OPTIONSVERSION, self.sbfoVersionStr, self.versionStr))
    self.versionMismatch = true
  end
  
  self:DisableDefaultBuffFrame()
  self.player = UnitName("player")
	_,self.playerClass = UnitClass("player")
	self:DoSavedVars()
	self:CreateFrames()
	self:SetupEnchants()
  self:RegisterUnits()
  
  if IsAddOnLoaded("ButtonFacade") then
    local bf = LibStub("AceAddon-3.0"):GetAddon("ButtonFacade")
    local m = bf:GetModule("SBF", true)
    if m:Load() then
      self.bfModule = m
    end
  end
  if IsAddOnLoaded("cyCircled") and cyCircled_SatrinaBuffFrames then
    self.cyModule = cyCircled_SatrinaBuffFrames:Load()
  end
  self:SetupFrames()

  self:StartTimers()
	self:RegisterEvent("UNIT_AURA", "ForceGet")
	self:RegisterEvent("PLAYER_TARGET_CHANGED", "TargetChanged")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED", "FocusChanged")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED", "InventoryChanged")
  self:RegisterEvent("PLAYER_ENTERING_WORLD", "EnterWorld")
  self:RegisterEvent("MINIMAP_UPDATE_TRACKING", "UpdateTracking", true)
  self:RegisterEvent("PLAYER_REGEN_ENABLED", "Cleanup")
  self:RegisterEvent("PARTY_MEMBERS_CHANGED", "PartyChanged")
  self:RegisterEvent("UNIT_PET", "PetChanged")
  self:RegisterEvent("RAID_ROSTER_UPDATE", "RaidChanged")

  self.hasTotems = (self.playerClass == "SHAMAN")
  if self.hasTotems then
    self:RegisterEvent("PLAYER_TOTEM_UPDATE", "TotemUpdate")
  end

  self:UpdateTracking()
  self:ThrottleFollowup()
end

local needsGC
sbf.Cleanup = function(self)
  self:ForceGet(nil, "player")
  -- collectgarbage("step", 750)
end

sbf.ToggleActive = function(self)
  -- Don't allow the user to try and disable SBF
	self:Print(self.strings.DISABLE)
end

--
-- Timers
--
SBF.StartTimers = function(self)
  self.checkVisibility = false
  for k,v in ipairs(SBF.db.profile.frames) do
    if v.layout.visibility and (v.layout.visibility > 1) then
      self.checkVisibility = true
    end
  end
  if self.checkVisibility then
    self.visibilityTimer = self:ScheduleRepeatingTimer("FrameVisibility", self.frameDelay)
  elseif self.visibilityTimer then
    self:CancelTimer(self.visibilityTimer)
  end
  self.updateTimer = self:ScheduleRepeatingTimer("Update", self.updateDelay, "player")
  self.durationRefresh = self:ScheduleRepeatingTimer("UpdateDurations", self.durationIncrement, self)
  self.updateFrame:SetScript("OnUpdate", self.FastUpdates)
end

SBF.StopTimers = function(self)
  if self.updateTimer then
    self:CancelTimer(self.updateTimer)
    self.updateTimer = nil
  end
  if self.visibilityTimer then
    self:CancelTimer(self.visibilityTimer)
    self.visibilityTimer = nil
  end
  self.updateFrame:SetScript("OnUpdate", nil)
end

--
-- Update Stuff
--
SBF.TargetChanged = function(self, event)
  self:debugmsg(debugMask, "Target changed")
  self:ForceGet(event, "target", true)
  if self.buffs["targettarget"] then
    self:ForceGet(event, "targettarget", true)
  end
end

SBF.FocusChanged = function(self, event)
  self:debugmsg(debugMask, "Focus changed")
  self:ForceGet(event, "focus", true)
  if self.buffs["focustarget"] then
    self:ForceGet(event, "focustarget", true)
  end
end

SBF.PartyChanged = function(self, event)
  self:debugmsg(debugMask, "Party changed")
  self:ForceGet(event, "party1", true)
  self:ForceGet(event, "party2", true)
  self:ForceGet(event, "party3", true)
  self:ForceGet(event, "party4", true)
end

SBF.PetChanged = function(self, event, unit)
  self:debugmsg(debugMask, "Pet changed")
  if (unit == "player") then
    self:ForceGet(event, "pet")
  else
    self:ForceGet(event, unit.."pet")
  end
end

SBF.RaidChanged = function(self, event, unit)
  self:debugmsg(debugMask, "Raid changed")
  for _,frame in pairs(self.frames) do
    if frame.unit and sfind(frame.unit, "raid") then
      self:ForceGet(event, frame.unit)
    end
  end
end

local followupTimer = nil

SBF.ThrottleFollowup = function(self, arg)
  for unit in pairs(self.db.profile.units) do
    self:ForceGet(nil, unit, true)
  end
end

SBF.ForceGet = function(self, event, unit, skipThrottle)
  if not self:TrackingUnit(unit) then
    return
  end
  local t = GetTime()
  -- if skipThrottle or not self.lastUpdate[unit] or ((t - self.lastUpdate[unit]) > self.db.global.throttlePeriod) then
  if skipThrottle or not InCombatLockdown() or not self.lastUpdate[unit] or ((t - self.lastUpdate[unit]) > self.db.global.throttlePeriod) then
    self.lastUpdate[unit] = t
    self:debugmsg(debugMask, "Force get for %s", unit)
    self.getAuras[unit] = true
    self:Update(unit)
    if followupTimer then
      self:CancelTimer(followupTimer, true)
      followupTimer = nil
    end
    if InCombatLockdown() and not skipThrottle then
      followupTimer = self:ScheduleTimer("ThrottleFollowup", self.db.global.throttlePeriod, unit)
    end
    return true
  else
    return false
  end
end

SBF.Update = function(self, unit)
  if (unit == "player") then
    self:UpdateEnchants()
  end
	if self.getAuras[unit] or self.reassignFrames then
    self:debugmsg(debugMask, "Update auras for %s", unit)
		self:UpdateUnitAuras(unit)
		self.getAuras[unit] = false
		self.reassignFrames = false
	end
end

SBF.RefreshBuffs = function(self)
  self:ClearBuffFrames()
  self:ClearAuras()
	self.getAuras["player"] = true
end

sbf.EnterWorld = function(self, event)
  if self.hasTotems then
    self:TotemUpdate()
  end
  self:ForceGet(nil, "player")
end

--
-- Slash command and options
--
sbf.ChatCommand = function(self, args)
  if args then
    args = strlower(args)
    if (args == "options") then
      self:OpenOptions()
    elseif (args == "hide") then
      self:DisableDefaultBuffFrame()
    elseif (string.find(args, "throttle")) then
      local v = tonumber(string.match(args, "throttle (.+)"))
      if not v or (v < 0) or (v > 1) then
        self:Print(self.strings.INVALIDTHROTTLE)
      else
        self.db.global.throttlePeriod = floor(v * 100 + 0.5)/100
        self:Print(format(self.strings.THROTTLECHANGED, v))
      end
    elseif (string.find(args, "debug")) then
      local v = tonumber(string.match(args, "debug (.+)"))
      if v and (v >= 0) then
        self.debug = v
        if (v == 0) then
          SBF:Print("Debugging disabled")
        else
          for i,str in pairs(debugBitMask) do
            if (bit.band(v, i) == i) then
              SBF:Print(format("%s debugging enabled", str))
            end
          end
        end
      end
    elseif (args == "stats") then
      self:ElementStats()
      self:TableStats()
    else
      DEFAULT_CHAT_FRAME:AddMessage(format(self.strings.SLASHHEADER, self.versionStr))
      for k,v in pairs(self.strings.SLASHOPTIONS) do
        DEFAULT_CHAT_FRAME:AddMessage(v)
      end
      DEFAULT_CHAT_FRAME:AddMessage(format(self.strings.SLASHTHROTTLE, self.db.global.throttlePeriod))
    end
  end
end

sbf.OpenOptions = function(self)
  if self.optionsMismatch then
    self:Print(format(self.strings.OPTIONSVERSION, self.sbfoVersionStr, self.versionStr))
    return
  end
	if not IsAddOnLoaded("SBFOptions") then
    local loaded, message = LoadAddOn("SBFOptions")
    if not loaded then
      self:Print(format(self.strings.CONFIGERROR, message))
      return
    end
  end
  self:StopTimers()
  self:ClearBuffFrames()
  self:ClearAuras()
  SBFOptions:ShowOptions()
end

sbf.CloseOptions = function(self)
  self:ClearBuffFrames()
  self:SetupFrames()
	self.showingOptions = nil
  self:ShowBuffs()
  
  collectgarbage()
 	self:GetExtents()
	self:StartTimers()
  self:RegisterUnits()
  self:ForceGet(nil, "player")
  self:TargetChanged()
end