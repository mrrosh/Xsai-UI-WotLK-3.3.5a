local _G = getfenv(0);

-- Bars
AzCastBar = {
	plugin_vers = 2,
	frames = {},
	tip = CreateFrame("GameTooltip","AzCastBarTip",nil,"GameTooltipTemplate"),
};
AzCastBar.tip:SetOwner(UIParent,"ANCHOR_NONE");

-- Saved Variables
AzCastBar_Config = {};
local cfg;

-- Default Config
local AZCB_DefOptions = {
	enabled = true,
	showLabel = true,
	showTime = true,
	showTotalTime = false,
	swapLabels = false,
	textAlign = "LEFT",

	fadeTime = 0.6,		-- Should be removed from core option
	alpha = 1,
	texture = "Interface\\Addons\\AzCastBar\\Textures\\Waterline",
	backdropBG = "Interface\\Tooltips\\UI-Tooltip-Background",
	backdropIndent = -2.5,
	colBackdrop = { 0.1, 0.22, 0.35, 1.0 },
	colBackground = { 1.0, 1.0, 1.0, 1.0 },

	strata = "MEDIUM",
	width = 280,
	height = 20,

	anchorPoint = "BOTTOM",
	anchorOffset = 6,
	iconAnchor = "LEFT",
	iconOffset = 2.5,
	hideIconBorder = true,

	fontFace = "Fonts\\FRIZQT__.TTF",
	fontFlags = "",
	fontSize = 12,
	colFont = { 1.0, 1.0, 1.0, 1.0 },
};

-- Init Specific Mod Vars
local modName = "AzCastBar";
local mirrorAnchor = {
	["TOP"] = "BOTTOM",
	["BOTTOM"] = "TOP",
	["LEFT"] = "RIGHT",
	["RIGHT"] = "LEFT",
};

--------------------------------------------------------------------------------------------------------
--                                Global Chat Message Function (Rev 3)                                --
--------------------------------------------------------------------------------------------------------
if (not AZMSG_REV or AZMSG_REV < 3) then
	AZMSG_REV = 3;
	function AzMsg(text)
		DEFAULT_CHAT_FRAME:AddMessage(tostring(text):gsub("|1","|cffffff80"):gsub("|2","|cffffffff"),128/255,192/255,255/255);
	end
end
--------------------------------------------------------------------------------------------------------
--                                          OnLoad & OnEvent                                          --
--------------------------------------------------------------------------------------------------------

-- Modify All CastBars to fit the Users Settings on "VARIABLES_LOADED"
local function OnEvent(self,event)
	cfg = AzCastBar_Config;
	AzCastBar.CheckSettings();
	AzCastBar.ApplyAllSettings();
	-- Add global names for all bar frames, mainly a request for people who wish to anchor panels around cast bars
	for _, frame in ipairs(AzCastBar.frames) do
		_G["AzCastBarPlugin"..frame.token] = frame;
	end
	OnEvent = nil;
end

local f = CreateFrame("Frame",nil);
f:SetScript("OnEvent",OnEvent);
f:RegisterEvent("VARIABLES_LOADED");

--------------------------------------------------------------------------------------------------------
--                                           Slash Handling                                           --
--------------------------------------------------------------------------------------------------------
_G["SLASH_"..modName.."1"] = "/acb";
SlashCmdList[modName] = function(cmd)
	-- Extract Parameters
	local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
	param1 = (param1 and param1:lower() or cmd:lower());
	-- Options
	if (param1 == "") then
		local loaded, reason = LoadAddOn("AzCastBarOptions");
		if (loaded) and (#AzCastBar.frames > 0) then
			if (AzCastBarOptions:IsVisible()) then
				AzCastBarOptions:Hide();
			else
				AzCastBarOptions:Show();
			end
		else
			AzMsg("Could not open AzCastBar Options: |1"..tostring(reason).."|r. Please make sure the addon is enabled from the character selection screen.");
		end
	-- Wipe Config
	elseif (param1 == "wipeconfig") then
		wipe(cfg);
		AzCastBar.CheckSettings();
		AzCastBar.ApplyAllSettings();
		AzMsg("|2"..modName..":|r All plugin settings has been wiped and reset to their default values");
	-- Invalid or No Command
	else
		UpdateAddOnMemoryUsage();
		AzMsg(format("----- |2%s|r |1%s|r ----- |1%.2f |2kb|r -----",modName,GetAddOnMetadata(modName,"Version"),GetAddOnMemoryUsage(modName)));
		AzMsg("The following |2parameters|r are valid for this addon:");
		AzMsg(" |2wipeconfig|r = Clears the configurations for all plugins, does not affect profiles");
	end
end

--------------------------------------------------------------------------------------------------------
--                                           Apply Settings                                           --
--------------------------------------------------------------------------------------------------------

-- Checks if the settings exists and are correct
function AzCastBar.CheckSettings()
	local cfgEntry;
	-- Check if each frame has settings, reset to default if they do not
	for _, frame in ipairs(AzCastBar.frames) do
		if (not cfg[frame.token]) then
			cfg[frame.token] = {};
		end
		cfgEntry = cfg[frame.token];
		-- Get positioning from current
		if (cfgEntry.left == nil) then
			cfgEntry.left = frame:GetLeft();
		end
		if (cfgEntry.bottom == nil) then
			cfgEntry.bottom = frame:GetBottom();
		end
		-- Options with constant defaults
		for optionName, defOption in pairs(AZCB_DefOptions) do
			if (cfgEntry[optionName] == nil) then
				cfgEntry[optionName] = defOption;
			end
		end
		-- Extra Plugin Options
		if (type(frame.options) == "table") then
			for _, table in ipairs(frame.options) do
				for _, option in ipairs(table) do
					if (option.default ~= nil) and (cfgEntry[option.var] == nil) and (not option.restrict or AzCastBar.EntryInTable(option.restrict,frame.token)) then
						cfgEntry[option.var] = option.default;
					end
				end
			end
		end
	end
end

-- Apply Settings to All Bars
function AzCastBar.ApplyAllSettings()
	for _, frame in ipairs(AzCastBar.frames) do
		AzCastBar.ApplyBarSettings(frame);
	end
end

-- Apply Settings to Given Bar and all its subbars
function AzCastBar.ApplyBarSettings(frame)
	if (type(frame.bars) == "table") then
		for i = 1, #frame.bars do
			AzCastBar.ApplyBarSettingsSpecific(frame,i);
		end
	else
		AzCastBar.ApplyBarSettingsSpecific(frame);
	end
end

-- Apply Settings to Given Bar
function AzCastBar.ApplyBarSettingsSpecific(baseFrame,id)
	-- This might get called before VARIABLES_LOADED, return in that case
	if (not cfg) then
		return;
	end
	-- Init
	local cfgEntry = cfg[baseFrame.token];
	local frame = (not id or id == 1) and (baseFrame) or (baseFrame.bars[id]);
	-- Main Bar Changes Only. Give the Frame a Pointer to it's own Config table. Set Position. Update EditMode bar (if required)
	if (not id or id == 1) then
		frame.cfg = cfgEntry;
		frame:ClearAllPoints();
		frame:SetPoint("BOTTOMLEFT",UIParent,"BOTTOMLEFT",cfgEntry.left,cfgEntry.bottom);
		if (frame.editModeBar) then
			AzCastBar.ApplyBarSettingsSpecific(frame.editModeBar);
			frame.editModeBar.status:SetStatusBarColor(frame.status:GetStatusBarColor());
		end
	-- Anchor Frame - This only happens with multi bar plugins
	else
		local point = cfgEntry.anchorPoint;
		local x = (point == "LEFT" and cfgEntry.anchorOffset * -1) or (point == "RIGHT" and cfgEntry.anchorOffset) or 0;
		local y = (point == "BOTTOM" and cfgEntry.anchorOffset * -1) or (point == "TOP" and cfgEntry.anchorOffset) or 0;
		frame:ClearAllPoints();
		frame:SetPoint(mirrorAnchor[point],baseFrame.bars[id - 1],point,x,y);
	end
	-- Width + Height + Strata
	frame:SetWidth(cfgEntry.width);
	frame:SetHeight(cfgEntry.height);
	frame:SetFrameStrata(cfgEntry.strata);
	-- Icon Borders
	if (cfgEntry.hideIconBorder) then
		frame.icon:SetTexCoord(0.07,0.93,0.07,0.93);
	else
		frame.icon:SetTexCoord(0,1,0,1);
	end
	-- Anchor Icon & StatusBar
	frame.icon:SetWidth(cfgEntry.height);
	frame.icon:SetHeight(cfgEntry.height);
	frame.icon:ClearAllPoints();
	if (cfgEntry.iconAnchor == "NONE") then
		frame.icon:Hide();
		frame.status:SetPoint("TOPLEFT");
		frame.status:SetPoint("BOTTOMRIGHT");
	elseif (cfgEntry.iconAnchor == "LEFT") then
		frame.icon:Show();
		frame.icon:SetPoint("LEFT");
		frame.status:SetPoint("TOPLEFT",frame.icon,"TOPRIGHT",cfgEntry.iconOffset,0);
		frame.status:SetPoint("BOTTOMRIGHT");
	elseif (cfgEntry.iconAnchor == "RIGHT") then
		frame.icon:Show();
		frame.icon:SetPoint("RIGHT");
		frame.status:SetPoint("TOPLEFT");
		frame.status:SetPoint("BOTTOMRIGHT",frame.icon,"BOTTOMLEFT",cfgEntry.iconOffset * -1,0);
	end
	-- Anchor Labels
	frame.name:ClearAllPoints();
	frame.time:ClearAllPoints();
	if (cfgEntry.swapLabels) then
		frame.time:SetJustifyH("LEFT");
		frame.time:SetPoint("LEFT",4,0);
		frame.name:SetPoint("RIGHT",-4,0);
		if (cfgEntry.showTime) then
			frame.name:SetPoint("LEFT",frame.time,"RIGHT",8,0);
		else
			frame.name:SetPoint("LEFT",4,0);
		end
	else
		frame.time:SetJustifyH("RIGHT");
		frame.time:SetPoint("RIGHT",-4,0);
		frame.name:SetPoint("LEFT",4,0);
		if (cfgEntry.showTime) then
			frame.name:SetPoint("RIGHT",frame.time,"LEFT",-8,0);
		else
			frame.name:SetPoint("RIGHT",-4,0);
		end
	end
	-- Show/Hide Labels
	if (cfgEntry.showLabel) then
		frame.name:Show();
	else
		frame.name:Hide();
	end
	if (cfgEntry.showTime) then
		frame.time:Show();
	else
		frame.time:Hide();
	end
	-- Set Label Font
	frame.name:SetJustifyH(cfgEntry.textAlign);
	frame.name:SetFont(cfgEntry.fontFace,cfgEntry.fontSize,cfgEntry.fontFlags);
	frame.time:SetFont(cfgEntry.fontFace,cfgEntry.fontSize,cfgEntry.fontFlags);
	-- Alpha
	frame:SetAlpha(cfgEntry.alpha);
	-- Outline
	frame:SetBackdrop({ bgFile = cfgEntry.backdropBG, insets = { left = cfgEntry.backdropIndent, right = cfgEntry.backdropIndent, top = cfgEntry.backdropIndent, bottom = cfgEntry.backdropIndent } });
	-- Texture
	frame.status:SetStatusBarTexture(cfgEntry.texture);
	-- Colors
	frame:SetBackdropColor(unpack(cfgEntry.colBackdrop));
	frame.bg:SetVertexColor(unpack(cfgEntry.colBackground));
	frame.name:SetTextColor(unpack(cfgEntry.colFont));
	frame.time:SetTextColor(unpack(cfgEntry.colFont));
	-- Call the OnConfigChanged func
	if (baseFrame.OnConfigChanged) then
		baseFrame:OnConfigChanged(cfgEntry,frame == baseFrame);
	end
end

--------------------------------------------------------------------------------------------------------
--                                               Shared                                               --
--------------------------------------------------------------------------------------------------------

-- Format time as it is shown on the CastBar
function AzCastBar.FormatTime(sec,ext)
	if (abs(sec) <= 60) then
		return (ext and "%.2f" or "%.1f"):format(sec);
	else
		return ("%d:%.2d"):format(sec / 60,abs(sec) % 60);
	end
end

-- Check Table for Entry
function AzCastBar.EntryInTable(table,value)
	for index, name in ipairs(table) do
		if (name == value) then
			return 1;
		end
	end
	return;
end

-- Create Bar
function AzCastBar.CreateBar(frameType)
	local f = CreateFrame(frameType or "Frame",nil,UIParent);
	f:SetWidth(280);
	f:SetHeight(20);
	f:Hide();

	f.icon = f:CreateTexture(nil,"ARTWORK");
	f.status = CreateFrame("StatusBar",nil,f);
	f.status:SetStatusBarColor(0.4,0.6,0.8,1);
	f.name = f.status:CreateFontString(nil,"OVERLAY","GameFontHighlight");
	f.time = f.status:CreateFontString(nil,"OVERLAY","GameFontHighlight");

	f.bg = f.status:CreateTexture(nil,"BACKGROUND");
	f.bg:SetTexture(0.3,0.3,0.3,0.6);
	f.bg:SetAllPoints();

	return f;
end