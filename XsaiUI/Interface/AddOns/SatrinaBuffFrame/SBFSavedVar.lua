local sbf = SBF
local debugMask = 32
--
-- Saved Vars
-- 
sbf.defaultVars = {
  global = {
    spells = {},
    version = SBF.version
  },
  char = {
    frames = {},
    alwaysWarnList = {},
    exclusionList = {},
    buffFrameList = {},
    filters = {},
  },
}


sbf.DoSavedVars = function(self)
  -- Do any updates that need doing
  if SBFDB then
    -- Ace2 to Ace3 conversion and if needed
    -- Check to see if conversion from Ace2 account space to Ace3 global space is needed still
    if SBFDB.account and not SBFDB.global then
      SBFDB.global = SBFDB.account
      SBFDB.account = nil
      -- We can track spells differently in WoW 3.0, so we'll clear the cache and let it rebuild
      SBFDB.global.spells = {}
      self:Print("Converted Ace2 account data to Ace3 global data")
    end
    -- Now that we have that done, we can be more granular in update checking
    
    -- Check to see what updates, if any, need to be done
    if (#SBFDB.profiles > 0) then
      if not SBFDB.global.version or (SBFDB.global.version < self.version) then
        if not SBFDB.global.version or (SBFDB.global.version < 3.0) then
          -- Convert profiles (just a name change)
          local a
          for k,v in pairs(SBFDB.profiles) do
            if (k == "Default") then
              a = k
            else
              a = string.match(k, ".+%/(.+)")
            end
            if a and k then
              self:Print(format("Converting Ace2 profile %s to Ace3 profile %s", tostring(k), tostring(a)))
              SBFDB.profiles[a] = v
              SBFDB.profiles[k] = nil
            end
          end
          
          -- Version 2.x to 3.0 saved variable format update
          for k,v in pairs(SBFDB.profiles) do
            if not v.layout then -- SBF 2.x profiles will never have this
              self:Print(format("Converting SBF 2.0 to SBF 3.0 for %s", tostring(k)))
              self:SBF2ToSBF3(v)
            end
          end
        end
        self:Print("Finished converting SBF 2.0 saved variables")
      end
    end
  end

	self.db = LibStub("AceDB-3.0"):New("SBFDB", self.defaultVars)

  if not self.db.profile.frames then
		self.db.profile.frames = {}
	end

  self:ValidateFrameVars(1)
  self:ValidateFrameVars(2)
	for i = 3,#self.db.profile.frames do
		self:ValidateFrameVars(i)
	end

  if not self.db.profile.alwaysWarnList then
		self.db.profile.alwaysWarnList = {}
	end

	if not self.db.profile.exclusionList then
		self.db.profile.exclusionList = {}
	end

	if not self.db.profile.buffFrameList then
		self.db.profile.buffFrameList = {}
	end
	
	if not self.db.profile.filters then
		self.db.profile.filters = {}
	end

	if self.db.profile.castable then
		self.db.profile.castable = nil
	end
  
  if not self.db.global.castable then
    self.db.global.castable = {}
  end
  
  if not self.db.global.castable[self.playerClass] then
      self.db.global.castable[self.playerClass] = {}
  end
  
	if not self.db.global.castable[self.playerClass]["HELPFUL"] then
		self.db.global.castable[self.playerClass]["HELPFUL"] = {}
	end
	if not self.db.global.castable[self.playerClass]["HARMFUL"] then
		self.db.global.castable[self.playerClass]["HARMFUL"] = {}
	end

  if not self.db.profile.units then
    self.db.profile.units = {}
  end
  self.db.profile.units.player = self.db.profile.units.player or {}
  self.db.profile.units.player.buff = self.db.profile.units.player.buff or 1
  self.db.profile.units.player.debuff = self.db.profile.units.player.debuff or 2
  
  if not self.db.profile.sticky then
    self.db.profile.sticky = {}
  end
  
  if not self.db.global.spells then
    self.db.global.spells = {}
  end
  self.db.global["safecall"] = nil
  self.db.global["noSafecall"] = nil
  
  self.db.global.throttlePeriod = self.db.global.throttlePeriod or 0.5
  
  self.db.global.version = self.version
  
  -- force a GC cycle to clean up our mess
  collectgarbage()
end

-- Validate an individual frame's saved vars
sbf.ValidateFrameVars = function(self, i)
	local new = false
	if not self.db.profile.frames[i] then
		self.db.profile.frames[i] = {}
    new = true
	end
	v = self.db.profile.frames[i]
	
  v.unit = v.unit or "player"
  
  v.layout = v.layout or {}
	if (i == 1) then
		v.layout.count = v.layout.count or 20
		v.layout.point = v.layout.point or {"TOPRIGHT", -65, -250}
	elseif (i == 2) then
		v.layout.count = v.layout.count or 16
		v.layout.point = v.layout.point or {"TOPRIGHT", -110, -250}
	else
		v.layout.count = v.layout.count or 10
		v.layout.point = v.layout.point or {"CENTER", 0, 0}
	end

  v.layout.rows = v.layout.rows
	v.layout.scale = v.layout.scale or 1
	v.layout.visibility = v.layout.visibility or 1
  v.layout.sort = v.layout.sort or 1
	v.layout.opacity = v.layout.opacity or 1
	v.layout.x = v.layout.x or 0
	v.layout.y = v.layout.y or 0
	v.layout.reverse = v.layout.reverse
	v.layout.bottom = v.layout.bottom
	v.layout.rowCount = v.layout.rowCount or 1
  
	v.expiry = v.expiry or {}
  v.expiry.flash = v.expiry.flash
	v.expiry.sctWarn = v.expiry.sctWarn
	v.expiry.sound = v.expiry.sound or "None"
	v.expiry.soundWarning = v.expiry.soundWarning
	v.expiry.minimumDuration = v.expiry.minimumDuration or 0
	v.expiry.warnAtTime = v.expiry.warnAtTime or 30
	v.expiry.textWarning = v.expiry.textWarning
  v.expiry.frame = v.expiry.frame or "ChatFrame1"
	v.expiry.sctColour = v.expiry.sctColour or {r=GREEN_FONT_COLOR.r, g=GREEN_FONT_COLOR.g, b=GREEN_FONT_COLOR.b}
  if SCT and (SCT:Get("SHOWFADE", SCT.FRAMES_TABLE) == SCT.MSG) then
    v.expiry.sctCrit = false
  end

  self:DoTimerSavedVars(v, new)
  self:DoCountSavedVars(v, new)
  self:DoIconSavedVars(v, new)
  self:DoNameSavedVars(v)
  self:DoBarSavedVars(v)

	v.disableRightClick = v.disableRightClick
  v.sticky = nil

	return v
end

-- Timer is a default configuration element
sbf.DoTimerSavedVars = function(self, v, new)
  if v.timer or new then
    if new then
      v.timer = {}
    end
    v.timer.fontSize = v.timer.fontSize or 10
    v.timer.regularColour = v.timer.regularColour or {r=NORMAL_FONT_COLOR.r, g=NORMAL_FONT_COLOR.g, b=NORMAL_FONT_COLOR.b}
    v.timer.expiringColour = v.timer.expiringColour or {r=NORMAL_FONT_COLOR.r, g=NORMAL_FONT_COLOR.g, b=NORMAL_FONT_COLOR.b}
    v.timer.justify = v.timer.justify or "CENTER"
    v.timer.font = v.timer.font or "Friz Quadrata TT"
    v.timer.scale = v.timer.scale or 1
    v.timer.y = v.timer.y or -15
    v.timer.x = v.timer.x or 0
    v.timer.format = v.timer.format or 2
    v.timer.frameLevel = v.timer.frameLevel or 3
  end
end

-- Count is a default configuration element
sbf.DoCountSavedVars = function(self, v, new)
  if v.count or new then
    if new then
      v.count = {}
    end
    v.count.x = v.count.x or 0
    v.count.y = v.count.y or -4
    v.count.colour = v.count.colour or {r=HIGHLIGHT_FONT_COLOR.r, g=HIGHLIGHT_FONT_COLOR.g, b=HIGHLIGHT_FONT_COLOR.b}
    v.count.justify = v.count.justify or "CENTER"
    v.count.font = v.count.font or "Friz Quadrata TT"
    v.count.fontSize = v.count.fontSize or 10
    v.count.frameLevel = v.count.frameLevel or 3
  end
end
  
-- Icon is a default configuration element
sbf.DoIconSavedVars = function(self, v, new)
  if v.icon or new then
    if new then
      v.icon = {}
    end
    v.icon.x = v.icon.x or 0
    v.icon.y = v.icon.y or 0
    v.icon.frameLevel = v.icon.frameLevel or 3
  end
end

-- Bar is not a default configuration element
sbf.DoBarSavedVars = function(self, v, new)
  if v.bar or new then
    if new then
      v.bar = {}
    end
    v.bar.width = v.bar.width or 200
    v.bar.x = v.bar.x or 110
    v.bar.y = v.bar.y or 0
    v.bar.barTexture = v.bar.barTexture or "Blizzard"
    v.bar.position = v.bar.position or "LEFT"
    v.bar.buffColour = v.bar.buffColour or {r = 0.0, g = 0.7, b = 1.0, a = 1.0 }
    v.bar.buffColour.a = v.bar.buffColour.a or 1.0
    v.bar.debuffColour = v.bar.debuffColour or {r = 0.7, g = 0.0, b = 0.0, a = 1.0 }
    v.bar.debuffColour.a = v.bar.debuffColour.a or 1.0
    v.bar.bgColour = v.bar.bgColour or {r = 0.0, g = 0.0 , b=0.0, a = 0.3}
    v.bar.bgColour.a = v.bar.bgColour.a or 0.0
    v.bar.direction = v.bar.direction or 1
    if not v.bar.bgColour.a then
      v.bar.bgColour.a = 1
    end
    v.bar.frameLevel = v.bar.frameLevel or 3
  end
end
  
-- Name is not a default configuration element
sbf.DoNameSavedVars = function(self, v, new)
  if v.name or new then
    if new then
      v.name = {}
    end
    v.name.x = v.name.x or 20
    v.name.y = v.name.y or 0
    v.name.justify = v.name.justify or "CENTER"
    v.name.font = v.name.font or "Friz Quadrata TT"
    v.name.fontSize = v.name.fontSize or 12
    if v.name.colour then
      v.name.buffColour = v.name.colour
    end
    v.name.buffColour= v.name.buffColour or {r=NORMAL_FONT_COLOR.r, g=NORMAL_FONT_COLOR.g, b=NORMAL_FONT_COLOR.b, a = 1.0}
    v.name.buffColour.a = v.name.buffColour.a or 1.0
    v.name.debuffColour= v.name.debuffColour or {r=NORMAL_FONT_COLOR.r, g=NORMAL_FONT_COLOR.g, b=NORMAL_FONT_COLOR.b, a = 1.0}
    v.name.nameFormat = v.name.nameFormat or "Name[full] Rank[roman]"
    v.name.frameLevel = v.name.frameLevel or 3
  end
end

sbf.SBF2ToSBF3 = function(self, var)
  for k,v in pairs(var.frames) do
    -- So it seems that somewhere along the line I leaked buff data into saved variables
    -- Let's clean that out.
    v._slot = nil
    v.slot = nil
    v.last = nil
    v.duration = nil
    v.timeLeft = nil
    v.expFloor = nil
    v.hadCount = nil
    v.type = nil
    v.frame = nil
    v.tab2 = nil
    v.inUse = nil
    v.buffs = nil
    v._var = nil
    v.index = nil
  
    if v.showBars then
      v.bar = {}
      v.bar.buffColour = v.barBuffColour
      v.bar.debuffColour = v.barDebuffColour
      v.bar.x = v.barOffset + 110 + floor((v.barWidth - 200)/2)
      v.bar.y = 0
      v.bar.barTexture = v.barTexture
      v.bar.bgColour = v.barBackdropColour
      v.bar.width = v.barWidth
    end 
    
    v.timer = {}
    v.timer.x = v.timerPositionX
    v.timer.y = v.timerPositionY
    if not v.showBars then
      if not v.timer.y then
        v.timer.y = -22
      else
        v.timer.y = v.timer.y - 22
      end
    end
    
    v.timer.font = v.timerFont
    v.timer.scale = v.timerScale
    v.timer.fontSize = v.timerFontSize
    v.timer.format = v.timerFormat
    v.timer.debuffColour = v.debuffTimerColour
    v.timer.buffColour = v.regularTimerColour
    v.timer.justify = v.timerJustify
    v.timer.expiringTimerColour = v.expireTimerColour

    v.expiry = {}
    v.expiry.sound = v.sound
    v.expiry.sctCrit = v.sctCrit
    v.expiry.frame = v.expireFrame
    v.expiry.flashBuff = v.flashBuff
    v.expiry.textWarning = v.textWarning
    v.expiry.sctColour = v.sctColour
    v.expiry.sctWarn = v.sctWarn
    v.expiry.warnAtTime = v.expireTime
    v.expiry.minimumDuration = v.warnTime
    v.expiry.soundWarning = v.soundWarning
    v.expiry.fastBar = v.fastBar

    if v.showBars then
      v.name = {}
      v.name.x = 100
      v.name.y = 0
      v.name.buffColour = v.barNameColour
      v.name.justify = v.barNameJustify
      v.name.showCount = v.countInName
      v.name.fontSize = v.barNameFontSize
      v.name.font = v.barNameFont
    else
      v.name = nil
    end

    v.icon = {}
    v.icon.x = 0
    v.icon.y = 0
    
    v.layout = {}
    v.layout.rowCount = v.rowCount
    v.layout.rows = (v.rows == 1)
    v.layout.sortType = v.sortType
    v.layout.count = tonumber(v.count)
    v.layout.spacingY = v.spacingY
    v.layout.spacingX = v.spacingX
    v.layout.point = v.point
    v.layout.opacity = v.opacity
    v.layout.bottom = v.bottom
    v.layout.frameVisibility = v.frameVisibility
    v.layout.scale = v.iconScale
    v.layout.reverse = v.reverse
    
    v.count = {}
    v.count.colour = v.countColour

    v.showBars = nil
    v.barBuffColour = nil
    v.barDebuffColour = nil
    v.barOffset = nil
    v.fastBar = nil
    v.barTexture = nil
    v.debuffBarColour = nil
    v.barBackdropColour = nil
    v.barWidth = nil
    v.add = nil

    v.timerPositionX = nil
    v.timerPositionY = nil
    v.timerFont = nil
    v.timerScale = nil
    v.timerFontSize = nil
    v.timerFormat = nil
    v.debuffTimerColour = nil
    v.regularTimerColour = nil
    v.timerJustify = nil
    v.barTimerPosition = nil
    v.expireTimerColour = nil

    v.sound = nil
    v.sctCrit = nil
    v.expireFrame = nil
    v.flashBuff = nil
    v.textWarning = nil
    v.sctColour = nil
    v.sctWarn = nil
    v.expireTime = nil
    v.warnTime = nil
    v.soundWarning = nil
    
    v.barNameColour = nil
    v.barNameJustify = nil
    v.countInName = nil
    v.barNameFontSize = nil
    v.barNameFont = nil
    v.barWidth = nil
    v.leftBars = nil
    v.bgTexture = nil
    v.barTimerPosition = nil
    
    v.countColour = nil

    v.reverse = nil
    v.rowCount = nil
    v.rows = nil
    v.sortType = nil
    -- v.count = nil  -- Nope, we reassigned v.count already above
    v.spacingY = nil
    v.spacingX = nil
    v.point = nil
    v.opacity = nil
    v.bottom = nil
    v.frameVisibility = nil
    v.iconScale = nil
  end
end


