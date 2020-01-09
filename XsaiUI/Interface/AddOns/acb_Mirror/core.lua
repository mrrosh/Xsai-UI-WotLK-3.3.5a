-- Extra Options
local extraOptions = {
	{
		[0] = "Additional",
		{ type = "Color", var = "colNormal", default = { 0.4, 0.6, 0.8, 1 }, label = "Mirror Bar Color" },
	},
};

-- Icons
local MirrorTimerIcons = {
	[0] = "Interface\\Icons\\Spell_Shadow_SoulLeech_2",
	["BREATH"] = "Interface\\Icons\\Spell_Shadow_DemonBreath",
	["FEIGNDEATH"] = "Interface\\Icons\\Ability_Rogue_FeignDeath",
};

-- Disable Blizz Mirror Bars
UIParent:UnregisterEvent("MIRROR_TIMER_START");
MirrorTimer1:UnregisterAllEvents();
MirrorTimer2:UnregisterAllEvents();
MirrorTimer3:UnregisterAllEvents();

local b;

--------------------------------------------------------------------------------------------------------
--                                           Frame Scripts                                            --
--------------------------------------------------------------------------------------------------------
local function OnUpdate(self,elapsed)
	-- Update Bar (Az: Fadeout should be called on MIRROR_TIMER_STOP, but we might need to force it here, though I've never seen it bug)
	if (self.fadeTime == 0) then
		self.timeProgress = (GetMirrorTimerProgress(self.timerId) / 1000);
		self.timeLeft = (self.timeProgress < 0 and 0) or (self.timeProgress < self.maxValue and self.timeProgress) or (self.maxValue);
		self.status:SetValue(self.timeLeft);
		self.time:SetText(AzCastBar.FormatTime(self.timeLeft)..(b.cfg.showTotalTime and " / "..AzCastBar.FormatTime(self.maxValue) or ""));
	-- Fade
	elseif (self.fadeElapsed < self.fadeTime) then
		self.fadeElapsed = (self.fadeElapsed + elapsed);
		self:SetAlpha(b.cfg.alpha - self.fadeElapsed / self.fadeTime * b.cfg.alpha);
	else
		self:Hide();
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Event Handling                                           --
--------------------------------------------------------------------------------------------------------
local function OnEvent(self,event,p1,p2,p3,p4,p5,p6)
	-- End if not enabled
	if (not b.cfg.enabled) then
		return;
	-- Check for Timers on login
	elseif (event == "PLAYER_ENTERING_WORLD") then
		for i = 1, MIRRORTIMER_NUMTIMERS do
			p1, p2, p3, p4, p5, p6 = GetMirrorTimerInfo(i);
			if (p1) and (p1 ~= "UNKNOWN") then
				event = "MIRROR_TIMER_START";
				break;
			end
		end
		if (not p1 or p1 == "UNKNOWN") then
			return;
		end
	end

	-- End if not our timerId
	if (self.timerId) and (self.timerId ~= p1) then
		return;
	-- Start
	elseif (event == "MIRROR_TIMER_START") then
		for i = 1, MIRRORTIMER_NUMTIMERS do
			if (self.id ~= i) and (b.bars[i].timerId == p1) then
				return;
			end
		end

		self.timerId = p1;
		--self.value = p2;
		self.maxValue = (p3 / 1000);
		self.label = p6;
		--self.scale = p4;
		--self.paused = p5;

		self.status:SetMinMaxValues(0,self.maxValue);
		self.status:SetStatusBarColor(unpack(b.cfg.colNormal));

		self.name:SetText(self.label);
		self.icon:SetTexture(MirrorTimerIcons[self.timerId] or MirrorTimerIcons[0]);

		self.fadeTime = 0;
		self.fadeElapsed = 0;
		self:SetAlpha(b.cfg.alpha);
		self:Show();
	-- Stop
	elseif (event == "MIRROR_TIMER_STOP") then
		if (self.timerId == p1) and (self.fadeTime == 0) then
			self.timerId = nil;
			self.fadeTime = b.cfg.fadeTime;
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                              Init Bar                                              --
--------------------------------------------------------------------------------------------------------

do
	local bar;
	for i = 1, MIRRORTIMER_NUMTIMERS do
		bar = AzCastBar.CreateBar();
		-- Init Bar
		bar.id = i;
		if (i == 1) then
			b = bar;
			bar.token = "Mirror";
			bar.options = extraOptions;
			bar.bars = {};
			bar:SetPoint("CENTER",0,200);
			tinsert(AzCastBar.frames,bar);
		end
		tinsert(b.bars,bar);
		-- Events
		bar:RegisterEvent("PLAYER_ENTERING_WORLD");
		bar:RegisterEvent("MIRROR_TIMER_START");
		bar:RegisterEvent("MIRROR_TIMER_STOP");
		bar:RegisterEvent("MIRROR_TIMER_PAUSE");
		-- Specific Frame Events
		bar:SetScript("OnUpdate",OnUpdate);
		bar:SetScript("OnEvent",OnEvent);
	end
end