--[[
	
	sGroupLoot
	Copyright (c) 2008, Shantalya
	All rights reserved.
	
]]

UIParent:UnregisterEvent("START_LOOT_ROLL");
UIParent:UnregisterEvent("CANCEL_LOOT_ROLL");

local GFHCName, GFHCHeight = GameFontHighlightCenter:GetFont();
local grouplootlist = {};
local grouplootbars = {};
local grouplootrolls = {};
local rollstrings = { [(LOOT_ROLL_PASSED_AUTO):gsub("%%1$s", "(.+)"):gsub("%%2$s", "(.+)")] = "pass", [(LOOT_ROLL_PASSED_AUTO_FEMALE):gsub("%%1$s", "(.+)"):gsub("%%2$s", "(.+)")] = "pass", [(LOOT_ROLL_PASSED):gsub("%%s", "(.+)")] = "pass", [(LOOT_ROLL_GREED):gsub("%%s", "(.+)")] = "greed", [(LOOT_ROLL_NEED):gsub("%%s", "(.+)")] = "need" };
local frame = CreateFrame("Frame", "sGroupLoot", UIParent);
frame:RegisterEvent("CHAT_MSG_LOOT");
frame:RegisterEvent("START_LOOT_ROLL");
frame:SetScript("OnEvent", function(self, event, ...)
	if ( event == "CHAT_MSG_LOOT" ) then
		local msg = ...;
		for string, roll in pairs(rollstrings) do
			local _, _, player, item = string.find(msg, string);
			if ( player and item ) then
				local rollId;
				for index, value in ipairs(grouplootbars) do
					if ( value.rollId and item == value.rollLink ) then
						rollId = value.rollId;
						if ( not grouplootrolls[rollId] ) then
							grouplootrolls[rollId] = {};
						end
						if ( not grouplootrolls[rollId][roll] ) then
							grouplootrolls[rollId][roll] = {};
							grouplootrolls[rollId][roll].count = 0;
						end
						grouplootrolls[rollId][roll].count = grouplootrolls[rollId][roll].count+1;
						grouplootrolls[rollId][roll][player] = true;
						if ( roll == "need" ) then
							value.needtext:SetText(grouplootrolls[rollId][roll].count);
						elseif ( roll == "greed" ) then
							value.greedtext:SetText(grouplootrolls[rollId][roll].count);
						else
							value.passtext:SetText(grouplootrolls[rollId][roll].count);
						end
					end
				end
			end
		end
		return;
	end
	local rollId, rollTime = ...;
	table.insert(grouplootlist, { rollId = rollId, rollTime = rollTime });
	self:UpdateGroupLoot();
end);

function frame:UpdateGroupLoot()
	for index, value in ipairs(grouplootbars) do
		value:Hide();
	end
	table.sort(grouplootlist, function(a, b)
		return a.rollId < b.rollId;
	end);
	local bar, texture, name, count, quality, bindOnPickUp, color;
	for index, value in ipairs(grouplootlist) do
		bar = grouplootbars[index];
		if ( not bar ) then
			bar = CreateFrame("StatusBar", "sGroupLootBar"..index, UIParent);
			bar:EnableMouse(1);
			bar:SetWidth(250);
			bar:SetHeight(25);
			bar:SetStatusBarTexture("Interface\\AddOns\\sGroupLoot\\statusbar");
			if ( index == 1 ) then
				bar:SetPoint("TOP", 0, -250);
			else
				bar:SetPoint("TOP", grouplootbars[index-1], "BOTTOM", 0, -4);
			end
			bar:SetScript("OnUpdate", function(self, elapsed)
				if ( self.rollId ) then
					local left = GetLootRollTimeLeft(self.rollId);
					local min, max = self:GetMinMaxValues();
					if ( (left < min) or (left > max) ) then
						left = min;
					end
					self:SetValue(left);
				end
			end);
			bar:RegisterEvent("CANCEL_LOOT_ROLL");
			bar:SetScript("OnEvent", function(self, event, ...)
				local rollId = ...;
				if ( self.rollId and rollId == self.rollId ) then
					for index, value in ipairs(grouplootlist) do
						if ( self.rollId == value.rollId ) then
							tremove(grouplootlist, index);
							break;
						end
					end
					grouplootrolls[self.rollId] = nil;
					StaticPopup_Hide("CONFIRM_LOOT_ROLL", self.rollId);
					self.rollId = nil;
					sGroupLoot:UpdateGroupLoot();
				end
			end);
			bar:SetScript("OnMouseUp", function(self)
				HandleModifiedItemClick(self.rollLink);
			end);
			bar:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT");
				GameTooltip:SetPoint("TOPRIGHT", self, "TOPLEFT");
				GameTooltip:SetLootRollItem(self.rollId);
			end);
			bar:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
				ResetCursor();
			end);
			
			bar.background = bar:CreateTexture(nil, "BORDER");
			bar.background:SetAllPoints();
			bar.background:SetTexture("Interface\\AddOns\\sGroupLoot\\statusbar");
			bar.background:SetVertexColor(0.5, 0.5, 0.5, 0.7);
			
			bar.pass = CreateFrame("Button", "$perentPassButton", bar);
			bar.pass:SetWidth(28);
			bar.pass:SetHeight(28);
			bar.pass:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Up");
			bar.pass:SetHighlightTexture("Interface\\Buttons\\UI-GroupLoot-Pass-Down");
			bar.pass:SetPoint("RIGHT", -5, 1);
			bar.pass:SetScript("OnClick", function(self, button)
				RollOnLoot(self:GetParent().rollId, 0);
			end);
			bar.pass:SetScript("OnEnter", function(self)
				local rollId = self:GetParent().rollId;
				GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
				GameTooltip:SetText(PASS);
				if ( grouplootrolls[rollId] and grouplootrolls[rollId]["pass"] ) then
					for index, value in pairs(grouplootrolls[rollId]["pass"]) do
						if ( index ~= "count" ) then
							GameTooltip:AddLine(index, 1, 1, 1);
						end
					end
				end
				GameTooltip:Show();
			end);
			bar.pass:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
			end);
			bar.passtext = bar.pass:CreateFontString("$perentText", "ARTWORK");
			bar.passtext:SetFont(GFHCName, GFHCHeight, "OUTLINE");
			bar.passtext:SetShadowColor(1, 1, 1, 0);
			bar.passtext:SetPoint("CENTER");
			
			bar.greed = CreateFrame("Button", "$perentGreedButton", bar);
			bar.greed:SetWidth(28);
			bar.greed:SetHeight(28);
			bar.greed:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Coin-Up");
			bar.greed:SetPushedTexture("Interface\\Buttons\\UI-GroupLoot-Coin-Down");
			bar.greed:SetHighlightTexture("Interface\\Buttons\\UI-GroupLoot-Coin-Highlight");
			bar.greed:SetPoint("RIGHT", bar.pass, "LEFT", -2, -4);
			bar.greed:SetScript("OnClick", function(self, button)
				RollOnLoot(self:GetParent().rollId, 2);
			end);
			bar.greed:SetScript("OnEnter", function(self)
				local rollId = self:GetParent().rollId;
				GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
				GameTooltip:SetText(GREED);
				if ( grouplootrolls[rollId] and grouplootrolls[rollId]["greed"] ) then
					for index, value in pairs(grouplootrolls[rollId]["greed"]) do
						if ( index ~= "count" ) then
							GameTooltip:AddLine(index, 1, 1, 1);
						end
					end
				end
				GameTooltip:Show();
			end);
			bar.greed:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
			end);
			bar.greedtext = bar.greed:CreateFontString("$perentText", "ARTWORK");
			bar.greedtext:SetFont(GFHCName, GFHCHeight, "OUTLINE");
			bar.greedtext:SetShadowColor(1, 1, 1, 0);
			bar.greedtext:SetPoint("CENTER", 0, 3);
			
			bar.need = CreateFrame("Button", "$perentNeedButton", bar);
			bar.need:SetWidth(28);
			bar.need:SetHeight(28);
			bar.need:SetNormalTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Up");
			bar.need:SetPushedTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Down");
			bar.need:SetHighlightTexture("Interface\\Buttons\\UI-GroupLoot-Dice-Highlight");
			bar.need:SetPoint("RIGHT", bar.greed, "LEFT", -2, 2);
			bar.need:SetScript("OnClick", function(self, button)
				RollOnLoot(self:GetParent().rollId, 1);
			end);
			bar.need:SetScript("OnEnter", function(self)
				local rollId = self:GetParent().rollId;
				GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
				GameTooltip:SetText(NEED);
				if ( grouplootrolls[rollId] and grouplootrolls[rollId]["need"] ) then
					for index, value in pairs(grouplootrolls[rollId]["need"]) do
						if ( index ~= "count" ) then
							GameTooltip:AddLine(index, 1, 1, 1);
						end
					end
				end
				GameTooltip:Show();
			end);
			bar.need:SetScript("OnLeave", function(self)
				GameTooltip:Hide();
			end);
			bar.needtext = bar.need:CreateFontString("$perentText", "ARTWORK");
			bar.needtext:SetFont(GFHCName, GFHCHeight, "OUTLINE");
			bar.needtext:SetShadowColor(1, 1, 1, 0);
			bar.needtext:SetPoint("CENTER", 0, 1);
			
			bar.text = bar:CreateFontString("$perentText", "ARTWORK", "GameFontHighlightLeft");
			bar.text:SetPoint("LEFT", 5, 0);
			bar.text:SetPoint("RIGHT", bar.need, "LEFT");
			
			bar.border = {};
			bar.border.topleft = bar:CreateTexture(nil, "OVERLAY");
			bar.border.topleft:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.topleft:SetPoint("TOPLEFT", -4, 4);
			bar.border.topleft:SetWidth(16);
			bar.border.topleft:SetHeight(16);
			bar.border.topleft:SetTexCoord(0, 1/3, 0, 1/3);
			bar.border.bottomleft = bar:CreateTexture(nil, "OVERLAY");
			bar.border.bottomleft:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.bottomleft:SetPoint("BOTTOMLEFT", -4, -4);
			bar.border.bottomleft:SetWidth(16);
			bar.border.bottomleft:SetHeight(16);
			bar.border.bottomleft:SetTexCoord(0, 1/3, 2/3, 1);
			bar.border.topright = bar:CreateTexture(nil, "OVERLAY");
			bar.border.topright:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.topright:SetPoint("TOPRIGHT", 4, 4);
			bar.border.topright:SetWidth(16);
			bar.border.topright:SetHeight(16);
			bar.border.topright:SetTexCoord(2/3, 1, 0, 1/3);
			bar.border.bottomright = bar:CreateTexture(nil, "OVERLAY");
			bar.border.bottomright:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.bottomright:SetPoint("BOTTOMRIGHT", 4, -4);
			bar.border.bottomright:SetWidth(16);
			bar.border.bottomright:SetHeight(16);
			bar.border.bottomright:SetTexCoord(2/3, 1, 2/3, 1);
			bar.border.top = bar:CreateTexture(nil, "OVERLAY");
			bar.border.top:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.top:SetPoint("TOPLEFT", bar.border.topleft, "TOPRIGHT");
			bar.border.top:SetPoint("TOPRIGHT", bar.border.topright, "TOPLEFT");
			bar.border.top:SetHeight(16);
			bar.border.top:SetTexCoord(1/3, 2/3, 0, 1/3);
			bar.border.bottom = bar:CreateTexture(nil, "OVERLAY");
			bar.border.bottom:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.bottom:SetPoint("BOTTOMLEFT", bar.border.bottomleft, "BOTTOMRIGHT");
			bar.border.bottom:SetPoint("BOTTOMRIGHT", bar.border.bottomright, "BOTTOMLEFT");
			bar.border.bottom:SetHeight(16);
			bar.border.bottom:SetTexCoord(1/3, 2/3, 2/3, 1);
			bar.border.left = bar:CreateTexture(nil, "OVERLAY");
			bar.border.left:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.left:SetPoint("TOPLEFT", bar.border.topleft, "BOTTOMLEFT");
			bar.border.left:SetPoint("BOTTOMLEFT", bar.border.bottomleft, "TOPLEFT");
			bar.border.left:SetWidth(16);
			bar.border.left:SetTexCoord(0, 1/3, 1/3, 2/3);
			bar.border.right = bar:CreateTexture(nil, "OVERLAY");
			bar.border.right:SetTexture("Interface\\AddOns\\sGroupLoot\\border");
			bar.border.right:SetPoint("TOPRIGHT", bar.border.topright, "BOTTOMRIGHT");
			bar.border.right:SetPoint("BOTTOMRIGHT", bar.border.bottomright, "TOPRIGHT");
			bar.border.right:SetWidth(16);
			bar.border.right:SetTexCoord(2/3, 1, 1/3, 2/3);
			
			tinsert(grouplootbars, bar);
		end
		
		texture, name, count, quality, bindOnPickUp = GetLootRollItemInfo(value.rollId);
		color = ITEM_QUALITY_COLORS[quality];
		
		if ( bindOnPickUp ) then
			bar.border.topleft:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.bottomleft:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.topright:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.bottomright:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.top:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.bottom:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.left:SetVertexColor(194/255, 172/255, 114/255, 1);
			bar.border.right:SetVertexColor(194/255, 172/255, 114/255, 1);
		else
			bar.border.topleft:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.bottomleft:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.topright:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.bottomright:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.top:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.bottom:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.left:SetVertexColor(0.25, 0.25, 0.25, 1);
			bar.border.right:SetVertexColor(0.25, 0.25, 0.25, 1);
		end
		
		bar:SetStatusBarColor(color.r, color.g, color.b, 1);
		bar:SetMinMaxValues(0, value.rollTime);
		
		bar.passtext:SetText(grouplootrolls[value.rollId] and grouplootrolls[value.rollId]["pass"] and grouplootrolls[value.rollId]["pass"].count or "");
		bar.greedtext:SetText(grouplootrolls[value.rollId] and grouplootrolls[value.rollId]["greed"] and grouplootrolls[value.rollId]["greed"].count or "");
		bar.needtext:SetText(grouplootrolls[value.rollId] and grouplootrolls[value.rollId]["need"] and grouplootrolls[value.rollId]["need"].count or "");
		bar.text:SetText(count > 1 and name.." x"..count or name);
		
		bar.rollId = value.rollId;
		bar.rollLink = GetLootRollItemLink(value.rollId);
		
		bar:Show();
	end
end
