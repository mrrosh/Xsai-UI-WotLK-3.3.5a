--
-- gief back my colorz!1
-- Original code by rothar/zork - using it with own colors and some (small) additions
--
FACTION_BAR_COLORS = {
	[1] = {r=182/255, g=34/255, b=32/255},
	[2] = {r=182/255, g=34/255, b=32/255},
	[3] = {r=182/255, g=92/255, b=32/255},
	[4] = {r=220/225, g=180/255, b=52/255},
	[5] = {r=143/255, g=194/255, b=32/255},
	[6] = {r=143/255, g=194/255, b=32/255},
	[7] = {r=143/255, g=194/255, b=32/255},
	[8] = {r=143/255, g=194/255, b=32/255},
};

PowerBarColor["MANA"] = { r = 26/255, g = 139/255, b = 255/255 };
PowerBarColor["RAGE"] = { r = 255/255, g = 26/255, b = 48/255 };
PowerBarColor["FOCUS"] = { r = 255/255, g = 150/255, b = 26/255 };
PowerBarColor["ENERGY"] = { r = 255/255, g = 225/255, b = 26/255 };
PowerBarColor["HAPPINESS"] = { r = 0.00, g = 1.00, b = 1.00 };
PowerBarColor["RUNES"] = { r = 0.50, g = 0.50, b = 0.50 };
PowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00 };
-- vehicle colors
PowerBarColor["AMMOSLOT"] = { r = 0.80, g = 0.60, b = 0.00 };
PowerBarColor["FUEL"] = { r = 0.0, g = 0.55, b = 0.5 };
 
  
RAID_CLASS_COLORS = {
	["HUNTER"] = { r = 0.67, g = 0.83, b = 0.45 },
	["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 },
	["PRIEST"] = { r = 1.0, g = 1.0, b = 1.0 },
	["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 },
	["MAGE"] = { r = 0.41, g = 0.8, b = 0.94 },
	["ROGUE"] = { r = 1.0, g = 0.96, b = 0.41 },
	["DRUID"] = { r = 1.0, g = 0.49, b = 0.04 },
	["SHAMAN"] = { r = 0.00, g = 0.86, b = 0.73 };
	["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 },
	["DEATHKNIGHT"] = { r = 0.77, g = 0.12 , b = 0.23 },
};

GameTooltip_UnitColor = function(unit)
	local r, g, b;
	if (UnitIsPlayer(unit)) then
		_, englishClass = UnitClass(unit)
		r = RAID_CLASS_COLORS[englishClass].r;
		g = RAID_CLASS_COLORS[englishClass].g;
		b = RAID_CLASS_COLORS[englishClass].b;
	elseif ( UnitPlayerControlled(unit) ) then
		if ( UnitCanAttack(unit, "player") ) then
			-- Hostile players are red
			if ( not UnitCanAttack("player", unit) ) then
				r = 1.0;
				g = 1.0;
				b = 1.0;
			else
				r = FACTION_BAR_COLORS[2].r;
				g = FACTION_BAR_COLORS[2].g;
				b = FACTION_BAR_COLORS[2].b;
			end
		elseif ( UnitCanAttack("player", unit) ) then
			-- Players we can attack but which are not hostile are yellow
			r = FACTION_BAR_COLORS[4].r;
			g = FACTION_BAR_COLORS[4].g;
			b = FACTION_BAR_COLORS[4].b;
		elseif ( UnitIsPVP(unit) ) then
			-- Players we can assist but are PvP flagged are green
			r = FACTION_BAR_COLORS[6].r;
			g = FACTION_BAR_COLORS[6].g;
			b = FACTION_BAR_COLORS[6].b;
		else
			-- All other players are blue (the usual state on the "blue" server)
			r = 143/255;
			g = 194/255;
			b = 32/255;
		end
	else
		local reaction = UnitReaction(unit, "player");
		if ( reaction ) then
			r = FACTION_BAR_COLORS[reaction].r;
			g = FACTION_BAR_COLORS[reaction].g;
			b = FACTION_BAR_COLORS[reaction].b;
		else
			r = 1.0;
			g = 1.0;
			b = 1.0;
		end
	end
	return r, g, b;
end

UnitSelectionColor = GameTooltip_UnitColor;

--
-- blizzard uf tweaks
--
--[[
local pfn, pfs, pff = PlayerName:GetFont()
PlayerName:SetFont(pfn, 12, "OUTLINE")
PlayerFrameHealthBarText:SetFont(pfn, 10, "OUTLINE")
PlayerFrameManaBarText:SetFont(pfn, 10, "OUTLINE")

local tfn, tfs, tff = TargetName:GetFont()
TargetName:SetFont(tfn, 12, "OUTLINE")
TargetFrameHealthBarText:SetFont(tfn, 10, "OUTLINE")
TargetFrameManaBarText:SetFont(tfn, 10, "OUTLINE")

local totfn, totfs, totff = TargetofTargetName:GetFont()
TargetofTargetName:SetFont(totfn, 12, "OUTLINE")
--]]

--
-- chat fix
--
for index, value in ipairs(CHAT_FRAME_TEXTURES) do
	for i=1, NUM_CHAT_WINDOWS, 1 do
		getglobal("ChatFrame" .. i .. value):Hide();
		getglobal("ChatFrame" .. i .. value).Show = function() end;
		getglobal("ChatFrame" .. i .. value):SetAlpha(0);
		getglobal("ChatFrame" .. i .. value).SetAlpha = function() end;
	end
end


--
-- adding some slash commands i often use
--
SlashCmdList['FRAME'] = function() ChatFrame1:AddMessage(GetMouseFocus():GetName()) end
SLASH_FRAME1 = '/frame'
SlashCmdList['RELOAD'] = function() ReloadUI() end
SLASH_RELOAD1 = '/rl'


--
-- my slash config, moves my chat (when makin' new chars or so) 
--
SlashCmdList["LYNCONFIG"] = function()
	-- chat
	for i=1, NUM_CHAT_WINDOWS do
		local cf = getglobal("ChatFrame"..i)
		cf:ClearAllPoints()
--		if i==2 then
--			cf:SetPoint("BOTTOMRIGHT", UIParent, -25, 25)
--		else
			cf:SetPoint("BOTTOMLEFT", UIParent, 25, 25)
--		end
		cf:SetWidth(500)
		cf:SetHeight(160)
		cf:SetUserPlaced(true)
	end
end
SLASH_LYNCONFIG1 = "/lyn"

--
-- edit dropdown thingy
--
DropDownList1MenuBackdrop:SetBackdrop({
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 8,
	edgeSize = 12,
--	insets = { left = 2, right = 2, top = 2, bottom = 2 }})
	insets = { left = 3, right = 3, top = 3, bottom = 3 }})
DropDownList1MenuBackdrop:SetBackdropColor(0, 0, 0, 1)
DropDownList1MenuBackdrop:SetBackdropBorderColor(0.7, 0.7, 0.7, 1)

DropDownList2MenuBackdrop:SetBackdrop({
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true, tileSize = 8,
	edgeSize = 12,
	insets = { left = 3, right = 3, top = 3, bottom = 3 }})
DropDownList2MenuBackdrop:SetBackdropColor(0, 0, 0, 1)
DropDownList2MenuBackdrop:SetBackdropBorderColor(0.7, 0.7, 0.7, 1)
