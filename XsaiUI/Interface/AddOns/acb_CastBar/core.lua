local extraOptions = {
	{
		[0] = "Additional",
		{ type = "Check", var = "showRank", default = true, label = "Show Spell Rank", tip = "If the spell being cast has a rank, it will be shown in brackets after the spell name.", y = 16 },
		{ type = "Color", var = "colNormal", default = { 0.4, 0.6, 0.8, 1.0 }, label = "Normal Cast Color" },
		{ type = "Color", var = "colFailed", default = { 1.0, 0.5, 0.5, 1.0 }, label = "Failed Cast Bar Color" },
		{ type = "Color", var = "colInterrupt", default = { 1.0, 0.75, 0.5, 1.0 }, label = "Interrupted Cast Bar Color", y = 16 },
		{ type = "Check", var = "safeZone", default = false, label = "Show Safe Zone Area", tip = "The 'Safe Zone' is the time equal to your latency, with this option enabled, it will show this duration on the cast bar. A spell canceled after it has reached the safe zone, will still go off.", restrict = { "Player" }, y = 6 },
		{ type = "Color", var = "colSafezone", default = {0.3,0.8,0.3,0.6}, label = "Safe Zone Color", restrict = { "Player" } },
	},
};

-- Spell Names for Hearthstone & Astral Recall
local astral = GetSpellInfo(556);
local hearth = GetSpellInfo(8690);

-- Start Frame FadeOut
local function StartFadeOut(bar)
	if (bar.fadeTime == 0) then
		if (bar.safezone) then
			bar.safezone:Hide();
		end
		bar.fadeTime = bar.cfg.fadeTime;
	end
end

--local tradeCount;
--local function DoTradeSkill_Hook(index,num)
--	AzMsg(tostring(index).." - "..tostring(num));
--	tradeCount = num;
--end
--hooksecurefunc("DoTradeSkill",DoTradeSkill_Hook);

--------------------------------------------------------------------------------------------------------
--                                              OnUpdate                                              --
--------------------------------------------------------------------------------------------------------

local function OnUpdate(self,elapsed)
	-- Update Bar (Only player unit seems to give proper UNIT_SPELLCAST_STOP event, so start fadeout when cast completes)
	if (self.fadeTime == 0) then
		self.timeProgress = (GetTime() - self.startTime);
		if (self.timeProgress > self.castTime) then
			self.timeProgress = self.castTime;
		end
		self.timeLeft = (self.castTime - self.timeProgress);
		self.delayText = (self.castDelay == 0 and "" or ("|cffff8080"..(self.castDelay > 0 and "+" or "")..AzCastBar.FormatTime(self.castDelay).."|r  "));

		self.status:SetValue(self.isCast and self.timeProgress or self.timeLeft);
		self.time:SetText(self.delayText..AzCastBar.FormatTime(self.timeLeft)..(self.cfg.showTotalTime and " / "..AzCastBar.FormatTime(self.castTime,1) or ""));

		if (self.safezone) and (self.safezone:IsVisible()) then
			self.safeZonePercent = min(1,select(3,GetNetStats()) / 1000 / self.castTime);
			self.safezone:SetWidth(self.safeZonePercent * self.status:GetWidth());
		end

		if (self.timeLeft == 0) then
			StartFadeOut(self);
		end
	-- Fade
	elseif (self.fadeElapsed <= self.fadeTime) then
		self.fadeElapsed = (self.fadeElapsed + elapsed);
		self:SetAlpha(self.cfg.alpha - self.fadeElapsed / self.fadeTime * self.cfg.alpha);
	else
		self.isCast, self.isChannel = nil, nil;
		self:Hide();
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Event Handling                                           --
--------------------------------------------------------------------------------------------------------
local function OnEvent(self,event,p1,...)
	-- End if not enabled
	if (not self.cfg or not self.cfg.enabled) then
		return;
	-- Entering World + Target/Focus Change
	elseif (event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD") then
		if (UnitCastingInfo(self.unit)) then
			event = "UNIT_SPELLCAST_START";
			p1 = self.unit;
		elseif (UnitChannelInfo(self.unit)) then
			event = "UNIT_SPELLCAST_CHANNEL_START";
			p1 = self.unit;
		else
			self:Hide();
			return;
		end
	end

	-- Check Unit
	if (self.unit ~= p1) then
		return;
	-- Use player bar for pets being possessed
	elseif (self.unit == "pet") and (UnitIsPossessed("pet")) then
		for index, frame in ipairs(AzCastBar.frames) do
			if (frame.unit == "player") then
				self = frame;
				break;
			end
		end
	end

	-- Hide the CastBar if another bar handles this cast (Player > Target > Focus)
	if (self.unit ~= "player" and UnitIsUnit(self.unit,"player")) or (self.unit == "focus" and UnitIsUnit("focus","target")) then
		self:Hide();
		return;
	-- Start
	elseif (event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START") then
		self.isCast = (event == "UNIT_SPELLCAST_START");
		self.isChannel = (event == "UNIT_SPELLCAST_CHANNEL_START");

		if (self.isCast) then
			self.spell, self.rank, self.label, self.iconPath, self.startTime, self.endTime, self.isTrade, self.id = UnitCastingInfo(p1);
		else
			self.spell, self.rank, self.label, self.iconPath, self.startTime, self.endTime, self.isTrade, self.id = UnitChannelInfo(p1);
		end

		if (self.iconPath == "Interface\\Icons\\Temp") then
			self.iconPath = "Interface\\Icons\\Spell_Nature_UnrelentingStorm";
		end

		self.startTime, self.endTime = (self.startTime / 1000), (self.endTime / 1000);
		self.castTime = (self.endTime - self.startTime);

--		if (self.isTrade) then
--			self.castTime = (self.castTime * tradeCount);
--			self.endTime = (self.startTime + self.castTime);
--		end

		if (self.unit == "player") then
			if (self.spell == hearth or self.spell == astral) then
				self.rank = GetBindLocation();
			end
			if (self.cfg.safeZone) then
				self.safezone:ClearAllPoints();
				self.safezone:SetPoint(self.isCast and "TOPRIGHT" or "TOPLEFT");
				self.safezone:SetPoint(self.isCast and "BOTTOMRIGHT" or "BOTTOMLEFT");
				self.safezone:Show();
			end
		end

		self.status:SetMinMaxValues(0,self.castTime);
		self.status:SetStatusBarColor(unpack(self.cfg.colNormal));
		self.name:SetText(self.cfg.showRank and self.rank ~= "" and self.spell.." ("..self.rank..")" or self.spell);
		self.icon:SetTexture(self.iconPath);

		self.fadeTime = 0;
		self.fadeElapsed = 0;
		self.castDelay = 0;
		self:SetAlpha(self.cfg.alpha);
		self:Show();
	-- Quit if Hidden
	elseif (not self:IsShown()) then
		return;
	-- Failed (Happens after UNIT_SPELLCAST_STOP, so keep them here)
	elseif (event == "UNIT_SPELLCAST_FAILED") and (not self.isChannel) and (self.id == select(3,...)) then
		self.status:SetValue(self.castTime);
		self.status:SetStatusBarColor(unpack(self.cfg.colFailed));
		self.time:SetText(FAILED);
		StartFadeOut(self);
	-- Interrupted (Happens after UNIT_SPELLCAST_STOP, so keep them here)
	elseif (event == "UNIT_SPELLCAST_INTERRUPTED") and (not self.isChannel) then
		self.status:SetValue(self.castTime);
		self.status:SetStatusBarColor(unpack(self.cfg.colInterrupt));
		self.time:SetText(INTERRUPTED);
		StartFadeOut(self);
	-- Quit here if no cast or channel is in progress
	elseif (self.fadeTime ~= 0) then
		return;
	-- Stop (Happens even with instant spells & abilities) (UNIT_SPELLCAST_STOP gets called right after UNIT_SPELLCAST_CHANNEL_START for some reason) (Doesn't always seem to trigger when target or focus completes cast)
	elseif (event == "UNIT_SPELLCAST_STOP" and self.isCast) or (event == "UNIT_SPELLCAST_CHANNEL_STOP" and self.isChannel) then
		self.status:SetValue(self.isCast and self.castTime or 0);
		StartFadeOut(self);
	-- Cast Delayed
	elseif (event == "UNIT_SPELLCAST_DELAYED" or event == "UNIT_SPELLCAST_CHANNEL_UPDATE") then
		local startTimeNew, endTimeNew;
		if (event == "UNIT_SPELLCAST_DELAYED") then
			startTimeNew, endTimeNew = select(5,UnitCastingInfo(self.unit));
		else
			startTimeNew, endTimeNew = select(5,UnitChannelInfo(self.unit));
		end
		if (startTimeNew and endTimeNew) then
			local endTimeOld = self.endTime;
			self.startTime, self.endTime = (startTimeNew / 1000), (endTimeNew / 1000);
			self.castDelay = (self.castDelay + self.endTime - endTimeOld);
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                              Setup Bar                                             --
--------------------------------------------------------------------------------------------------------

local function OnConfigChanged(self,cfg,isBase)
	if (self.cfg.enabled) then
		CastingBarFrame:UnregisterAllEvents();
--		CastingBarFrame.showCastbar = nil;
		PetCastingBarFrame:UnregisterAllEvents();
--		PetCastingBarFrame.showCastbar = nil;
		if (self.safezone) then
			self.safezone:SetTexture(unpack(self.cfg.colSafezone));
		end
	else
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_START");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_STOP");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_FAILED");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_DELAYED");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE");
		CastingBarFrame:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");
		CastingBarFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
		PetCastingBarFrame:RegisterEvent("UNIT_PET");
	end
end

do
	local bars = { "Player", "Target", "Focus", "Pet" };  -- Az: Could add "vehicle" to this table, but "pet" seems to handle it just fine?
	local bar, lastBar;
	for _, token in ipairs(bars) do
		bar = AzCastBar.CreateBar();
		-- Init Bar
		bar.token = token;
		bar.unit = token:lower();
		bar.options = extraOptions;
		tinsert(AzCastBar.frames,bar);
		-- Anchor
		if (lastBar) then
			bar:SetPoint("TOP",lastBar,"BOTTOM",0,-8);
		else
			bar:SetPoint("CENTER",0,-100);
		end
		lastBar = bar;
		-- Events
		bar:RegisterEvent("PLAYER_ENTERING_WORLD");
		bar:RegisterEvent("UNIT_SPELLCAST_START");
		bar:RegisterEvent("UNIT_SPELLCAST_STOP");
		bar:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
		bar:RegisterEvent("UNIT_SPELLCAST_FAILED");
		bar:RegisterEvent("UNIT_SPELLCAST_DELAYED");
		bar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
		bar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE");
		bar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");
		bar:SetScript("OnUpdate",OnUpdate);
		bar:SetScript("OnEvent",OnEvent);
		-- Specific Frame Stuff
		if (token == "Player") then
			bar.safezone = bar.status:CreateTexture(nil,"OVERLAY");
			bar.safezone:SetTexture(0.3,0.8,0.3,0.6);
			bar.safezone:SetPoint("TOPRIGHT");
			bar.safezone:SetPoint("BOTTOMRIGHT");
			bar.safezone:Hide();
			bar.OnConfigChanged = OnConfigChanged;
		elseif (token == "Target") then
			bar:RegisterEvent("PLAYER_TARGET_CHANGED");
		elseif (token == "Focus") then
			bar:RegisterEvent("PLAYER_TARGET_CHANGED");
			bar:RegisterEvent("PLAYER_FOCUS_CHANGED");
		end
	end
end