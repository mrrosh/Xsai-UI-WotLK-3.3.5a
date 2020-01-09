--[[
	
	sFilter
	Copyright (c) 2009, Nils 'Shantalya' Ruesch
	All rights reserved.
	
]]

local configmode = 0; -- 1=an, 0=off (Im Configmode kann man die Zauber InGame verschieben mit Shift+Alt+Linke Maustaste)

local usealpha = 1; -- 1=an, 0=off
local alpha_active = 1; -- 1=100% sichtbar, 0.5= 50% sichtbar, 0=0% sichtbar
local alpha_notactive = 0; -- 1=100% sichtbar, 0.5= 50% sichtbar, 0=0% sichtbar

--[[
	Den Rest muss man ganz unten einstellen ;P 
]]

local function sFilter_CreateFrame(info)
	local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(info.spellId);
	
	local frame = CreateFrame("Frame", "sFilter_" .. info.unitId .. "_" .. info.spellId, UIParent);
	frame:SetWidth(info.size);
	frame:SetHeight(info.size);
	frame:SetScale(info.scale);
	frame:SetPoint(unpack(info.setPoint));
	frame.spellId = info.spellId;
	frame.unitId = info.unitId;
	frame.isMine = info.isMine;
	frame.filter = info.filter;
	frame:RegisterEvent("UNIT_AURA");
	frame:RegisterEvent("PLAYER_TARGET_CHANGED");
	frame:RegisterEvent("PLAYER_ENTERING_WORLD");
	frame:SetScript("OnEvent", function(self, event, ...)
		local unit = ...;
		if ( self.unitId == unit or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" ) then
			local found = false;
			for i=1, 40, 1 do
				local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitAura(self.unitId, i, self.filter);
				if ( ( self.isMine == "all" or isMine == self.isMine ) and name == GetSpellInfo(self.spellId) ) then
					found = true;
					if ( usealpha == 1 ) then
						self:SetAlpha(alpha_active);
					end
					SetDesaturation(self.icon, nil);
					self.count:SetText(count > 1 and count or "");
					if ( duration > 0 ) then
						self.cooldown:Show();
						CooldownFrame_SetTimer(self.cooldown, expirationTime - duration, duration, 1);
					else
						self.cooldown:Hide();
					end
					break;
				end
			end
			
			if ( not found ) then
				if ( configmode == 1 ) then
					self:SetAlpha(1);
				else
					if ( usealpha == 1 ) then
						self:SetAlpha(alpha_notactive);
					end
				end
				SetDesaturation(self.icon, 1);
				self.count:SetText("");
				self.cooldown:Hide();
			end
		end
	end);
	if ( usealpha == 1 ) then
		frame:SetAlpha(alpha_notactive);
	end
	frame:SetMovable(1);
	if ( configmode == 1 ) then
		frame:SetAlpha(1);
		frame:EnableMouse(1);
		frame:RegisterForDrag("LeftButton");
		frame:SetScript("OnDragStart", function(self)
			if ( IsShiftKeyDown() and IsAltKeyDown() ) then
				self:StartMoving();
			end
		end);
		frame:SetScript("OnDragStop", function(self) 
			self:StopMovingOrSizing();
		end);
	end
	
	frame.icon = frame:CreateTexture("$parentIcon", "BACKGROUND");
	frame.icon:SetAllPoints(frame);
	frame.icon:SetTexture(icon);
	SetDesaturation(frame.icon, 1);
	
	frame.count = frame:CreateFontString(nil, "ARTWORK", "NumberFontNormal");
	frame.count:SetPoint("BOTTOM", 0, -5);
	frame.count:SetJustifyH("RIGHT");
	
	frame.cooldown = CreateFrame("Cooldown", nil, frame, "CooldownFrameTemplate");
	frame.cooldown:SetPoint("TOPLEFT", 2, -2);
	frame.cooldown:SetPoint("BOTTOMRIGHT", -2, 2);
	frame.cooldown:SetReverse();
	
	frame.overlay = frame:CreateTexture(nil, "OVERLEY");
	frame.overlay:SetTexture("Interface\\AddOns\\sFilter\\Textures\\Normal");
	frame.overlay:SetPoint("TOPLEFT", -3, 3);
	frame.overlay:SetPoint("BOTTOMRIGHT", 3, -3);
	frame.overlay:SetVertexColor(0.25, 0.25, 0.25);
end

local name = UnitName("player");
local realm = GetRealmName();

--[[--------------- sFilter_CreateFrame------------------
- spellId	= Welcher Zauber soll überprüft werden ?
		Die ZauberId wird benutzt, um den Zaubernamen herauszufinden.
- size		= Welche größe soll das Icon haben ?
- scale	= Welche skalierung soll das Icon haben?
- unitId	= Wer soll überprüft werden? 
		Mehr Infos: http://www.wowwiki.com/UnitId
- isMine	= Von wem soll der Zauber sein ?
		1: 	Der Zauber muss von Dir sein.
		nil: 	Der Zauber muss von jemand anders sein.
		"all":	Der Zauber kann von jedem sein.
- filter	= Welchen Filter willst Du benutzen ?
		Mehr Infos: http://www.wowwiki.com/API_UnitAura
- setPoint	= Wo soll das Icon hin ?
		Mehr Infos: http://www.wowwiki.com/API_Region_SetPoint
--]]--------------- sFilter_CreateFrame------------------

if ( realm == "Arthas" and name == "Xsai" ) then
	
	-- Hot Streak
	sFilter_CreateFrame({
		spellId = 48108,
		size = 32,
		scale = 1.5,
		unitId = "player",
		isMine = 1,
		filter = "Helpful",
		setPoint = {
			"BOTTOM",
			UIParent,
			17.5,
			250,
		}
	});
     
		
        -- sheep
	sFilter_CreateFrame({
		spellId = 12826,
		size = 32,
		scale = 1,
		unitId = "target",
		isMine = 1,
		filter = "HARMFUL",
		setPoint = {
			"BOTTOM",
			UIParent,
			17.5,
			250,
		}
	});
end

