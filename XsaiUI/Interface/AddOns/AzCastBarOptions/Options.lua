local f = CreateFrame("Frame","AzCastBarOptions",UIParent);

-- Config
AzCastBar_Profiles = {};
local cfg = AzCastBar_Config;

local BARS_ANCHOR_POINTS = {
	["Upwards"] = "TOP",
	["Downwards"] = "BOTTOM",
	["Left"] = "LEFT",
	["Right"] = "RIGHT",
};

local ICON_ANCHOR_POINTS = {
	["Left"] = "LEFT",
	["Right"] = "RIGHT",
	["None"] = "NONE",
};

-- Lists
local CategoryList = {};
local ITEM_HEIGHT = 18;

-- Options
local activePage, subPage = 1, 1;
local frames = {};
local options = {
	{
		[0] = "General",
		{ type = "Check", var = "enabled", label = "Enable Bar Plugin", tip = "Enable or disable this bar plugin", y = 12 },
		{ type = "Check", var = "showLabel", label = "Show Name Label", tip = "Show bar label on the left side of the bar" },
		{ type = "Check", var = "showTime", label = "Show Time Label", tip = "Show the time on the right side of the bar" },
		{ type = "Check", var = "showTotalTime", label = "Also Show Total Time", tip = "Show the total time of the cast" },
		{ type = "Check", var = "swapLabels", label = "Swap Name & Time Labels", tip = "Swaps the labels around so the name will be right and time left", y = 12 },
		{ type = "DropDown", var = "textAlign", label = "Name Label Alignment", list = { ["Left"] = "LEFT", ["Center"] = "Center", ["Right"] = "RIGHT" }, y = 12 },
	},
	{
		[0] = "Appearance",
		{ type = "Slider", var = "fadeTime", label = "Fade Out Time", min = 0.1, max = 6, step = 0.1 },
		{ type = "Slider", var = "alpha", label = "Alpha", min = 0, max = 1, step = 0.01, y = 16 },
		{ type = "DropDown", var = "texture", label = "Bar Texture", init = AzCastBarDropDowns.SharedMediaLib, media = "statusbar" },
		{ type = "DropDown", var = "backdropBG", label = "Backdrop Background", init = AzCastBarDropDowns.SharedMediaLib, media = "background", y = 12 },
		{ type = "Slider", var = "backdropIndent", label = "Backdrop Indent", min = -20, max = 60, step = 0.5, y = 16 },
		{ type = "Color", var = "colBackdrop", label = "Backdrop Color" },
		{ type = "Color", var = "colBackground", label = "Background Color" },
	},
	{
		[0] = "Position",
		{ type = "DropDown", var = "strata", label = "Frame Strata", list = { ["Low"] = "LOW", ["Medium"] = "MEDIUM", ["High"] = "HIGH" }, y = 12 },
		{ type = "Slider", var = "left", label = "Left Offset", min = 0, max = 2048, step = 1 },
		{ type = "Slider", var = "bottom", label = "Bottom Offset", min = 0, max = 1536, step = 1, y = 16 },
		{ type = "Slider", var = "width", label = "Width", min = 20, max = 2048, step = 1 },
		{ type = "Slider", var = "height", label = "Height", min = 1, max = 120, step = 1 },
	},
	{
		[0] = "Anchors",
		{ type = "DropDown", var = "anchorPoint", label = "Anchor Direction", list = BARS_ANCHOR_POINTS },
		{ type = "Slider", var = "anchorOffset", label = "Anchor Offset", min = -40, max = 40, step = 1, y = 28 },
		{ type = "DropDown", var = "iconAnchor", label = "Icon Anchor", list = ICON_ANCHOR_POINTS },
		{ type = "Slider", var = "iconOffset", label = "Icon Offset", min = 0, max = 20, step = 0.5 },
		{ type = "Check", var = "hideIconBorder", label = "Hide Icon Border", tip = "Checking this will hide the borders around spell icons" },
	},
	{
		[0] = "Font",
		{ type = "DropDown", var = "fontFace", label = "Font Face", init = AzCastBarDropDowns.SharedMediaLib, media = "font" },
		{ type = "DropDown", var = "fontFlags", label = "Font Flags", list = AzCastBarDropDowns.FontFlags },
		{ type = "Slider", var = "fontSize", label = "Font Size", min = 4, max = 29, step = 1, y = 16 },
		{ type = "Color", var = "colFont", label = "Font Color" },
	},
};

--------------------------------------------------------------------------------------------------------
--                                        Options Category List                                       --
--------------------------------------------------------------------------------------------------------

-- Builds the Category List from Core and Plugin options
local function BuildSubCategoryList()
	wipe(CategoryList);
	for index, table in ipairs(options) do
		tinsert(CategoryList,{ name = table[0], table = table, index = index });
	end
	if (type(AzCastBar.frames[activePage].options) == "table") then
		for index, table in ipairs(AzCastBar.frames[activePage].options) do
			tinsert(CategoryList,{ name = table[0], table = table, index = index, custom = 1 });
		end
	end
	if (subPage > #CategoryList) then
		subPage = 1;
	end
end

-- Update Plugins
function UpdatePluginList()
	FauxScrollFrame_Update(AzCastBarPluginsScroll,#AzCastBar.frames,#f.plugins,ITEM_HEIGHT);
	local width = (f.outline:GetWidth() - (#AzCastBar.frames > #f.plugins and 26 or 12));
	local index, button, plugin;
	for i = 1, #f.plugins do
		index = (FauxScrollFrame_GetOffset(AzCastBarPluginsScroll) + i);
		button = f.plugins[i];
		plugin = AzCastBar.frames[index];
		if (plugin) then
			button.text:SetText(plugin.token);
			button.index = index;
			if (index == activePage) then
				button.text:SetTextColor(1,1,1);
			else
				button.text:SetTextColor(1,0.82,0);
			end
			button:SetWidth(width);
			button:Show();
		else
			button:Hide();
		end
	end
end

-- Update Option List
function UpdateCategoryList()
	FauxScrollFrame_Update(AzCastBarCategoryScroll,#CategoryList,#f.categories,ITEM_HEIGHT);
	local width = (f.outline2:GetWidth() - (#CategoryList > #f.categories and 26 or 12));
	local index, button, cat;
	for i = 1, #f.categories do
		index = (FauxScrollFrame_GetOffset(AzCastBarCategoryScroll) + i);
		button = f.categories[i];
		cat = CategoryList[index];
		if (cat) then
			button.text:SetText((cat.custom and "|cff00ff00*|r " or "")..cat.name);
			button.index = index;
			if (index == subPage) then
				button.text:SetTextColor(1,1,1);
			else
				button.text:SetTextColor(1,0.82,0);
			end
			button:SetWidth(width);
			button:Show();
		else
			button:Hide();
		end
	end
end

--------------------------------------------------------------------------------------------------------
--                                          Initialize Frame                                          --
--------------------------------------------------------------------------------------------------------

f:SetWidth(460);
f:SetHeight(416);
f:SetBackdrop({ bgFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } });
f:SetBackdropColor(0.1,0.22,0.35,1);
f:SetBackdropBorderColor(0.1,0.1,0.1,1);
f:EnableMouse(1);
f:SetMovable(1);
f:SetFrameStrata("DIALOG");
f:SetToplevel(1);
f:SetClampedToScreen(1);
f:SetScript("OnShow",function() UpdatePluginList(); BuildSubCategoryList(); UpdateCategoryList(); f:BuildCategoryPage(); f:SetScript("OnShow",nil); end);
f:Hide();

f.outline = CreateFrame("Frame",nil,f);
f.outline:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = 1, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 } });
f.outline:SetBackdropColor(0.1,0.1,0.2,1);
f.outline:SetBackdropBorderColor(0.8,0.8,0.9,0.4);
f.outline:SetPoint("TOPLEFT",12,-12);
f.outline:SetWidth(120);

f.outline2 = CreateFrame("Frame",nil,f);
f.outline2:SetBackdrop(f.outline:GetBackdrop());
f.outline2:SetBackdropColor(0.1,0.1,0.2,1);
f.outline2:SetBackdropBorderColor(0.8,0.8,0.9,0.4);
f.outline2:SetPoint("TOPLEFT",f.outline,"BOTTOMLEFT",0,-8);
f.outline2:SetPoint("BOTTOMLEFT",12,12);
f.outline2:SetWidth(120);

f:SetScript("OnMouseDown",function() f:StartMoving() end);
f:SetScript("OnMouseUp",function() f:StopMovingOrSizing(); cfg.optionsLeft = f:GetLeft(); cfg.optionsBottom = f:GetBottom(); end);

if (cfg.optionsLeft) and (cfg.optionsBottom) then
	f:SetPoint("BOTTOMLEFT",UIParent,"BOTTOMLEFT",cfg.optionsLeft,cfg.optionsBottom);
else
	f:SetPoint("CENTER");
end

f.header = f:CreateFontString(nil,"ARTWORK","GameFontHighlight");
f.header:SetFont(f.header:GetFont(),22,"THICKOUTLINE");
f.header:SetPoint("TOPLEFT",f.outline,"TOPRIGHT",10,-4);
f.header:SetText("AzCastBar Options");

f.vers = f:CreateFontString(nil,"ARTWORK","GameFontNormal");
f.vers:SetPoint("TOPRIGHT",-20,-20);
f.vers:SetText(GetAddOnMetadata("AzCastBar","Version"));
f.vers:SetTextColor(1,1,0.5);

local function Reset_OnClick()
	for index, table in ipairs(CategoryList[subPage].table) do
		if (table.var) then
			cfg[f.activeBar.token][table.var] = nil;
		end
	end
	AzCastBar.CheckSettings();
	AzCastBar.ApplyBarSettings(f.activeBar);
	f:BuildCategoryPage();
end

local function Profiles_OnClick()
	if (f.profilesFrame:IsShown()) then
		f.profilesFrame:Hide();
	else
		f.profilesFrame:Show();
		f.profilesFrame:BuildProfileList();
	end
end

f.btnClose = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnClose:SetWidth(68);
f.btnClose:SetHeight(24);
f.btnClose:SetPoint("BOTTOMRIGHT",-15,15);
f.btnClose:SetScript("OnClick",function() f:Hide(); f.profilesFrame:Hide(); end);
f.btnClose:SetText("Close");

f.btnReset = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnReset:SetWidth(68);
f.btnReset:SetHeight(24);
f.btnReset:SetPoint("RIGHT",f.btnClose,"LEFT",-4,0);
f.btnReset:SetScript("OnClick",Reset_OnClick);
f.btnReset:SetText("Reset");

f.btnProfiles = CreateFrame("Button",nil,f,"UIPanelButtonTemplate");
f.btnProfiles:SetWidth(68);
f.btnProfiles:SetHeight(24);
f.btnProfiles:SetPoint("RIGHT",f.btnReset,"LEFT",-4,0);
f.btnProfiles:SetScript("OnClick",Profiles_OnClick);
f.btnProfiles:SetText("Profiles");

tinsert(UISpecialFrames,f:GetName());
f.activeBar = AzCastBar.frames[activePage];

--------------------------------------------------------------------------------------------------------
--                                      Plugin & Category Entries                                     --
--------------------------------------------------------------------------------------------------------

local b;

-- OnClicks
local function List_OnClick(self,button)
	PlaySound("igMainMenuOptionCheckBoxOn");
	activePage = self.index;
	f.activeBar = AzCastBar.frames[activePage];

    BuildSubCategoryList();

	UpdatePluginList();
	UpdateCategoryList();
	f:BuildCategoryPage();
end

local function List2_OnClick(self,button)
	PlaySound("igMainMenuOptionCheckBoxOn");
	subPage = self.index;
	UpdateCategoryList();
	f:BuildCategoryPage();
end

-- Plugins
f.plugins = {};
for i = 1, 12 do
	b = CreateFrame("Button",nil,f.outline);
	b:SetHeight(ITEM_HEIGHT);
	b:SetScript("OnClick",List_OnClick);
	b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");

	b.text = b:CreateFontString(nil,"ARTWORK","GameFontNormal");
	b.text:SetPoint("LEFT",3,0);

	if (i == 1) then
		b:SetPoint("TOPLEFT",5,-6);
	else
		b:SetPoint("TOPLEFT",f.plugins[i - 1],"BOTTOMLEFT");
	end

	tinsert(f.plugins,b);
end

f.scroll = CreateFrame("ScrollFrame","AzCastBarPluginsScroll",f.outline,"FauxScrollFrameTemplate");
f.scroll:SetPoint("TOPLEFT",f.plugins[1]);
f.scroll:SetPoint("BOTTOMRIGHT",f.plugins[#f.plugins],-6,-1);
f.scroll:SetScript("OnVerticalScroll",function(self,offset) FauxScrollFrame_OnVerticalScroll(self,offset,ITEM_HEIGHT,UpdatePluginList) end);

f.outline:SetHeight(#f.plugins * ITEM_HEIGHT + 12);

-- Categories
f.categories = {};
for i = 1, 10 do
	b = CreateFrame("Button",nil,f.outline2);
	b:SetHeight(ITEM_HEIGHT);
	b:SetScript("OnClick",List2_OnClick);
	b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");

	b.text = b:CreateFontString(nil,"ARTWORK","GameFontNormal");
	b.text:SetPoint("LEFT",3,0);

	if (i == 1) then
		b:SetPoint("TOPLEFT",5,-6);
	else
		b:SetPoint("TOPLEFT",f.categories[i - 1],"BOTTOMLEFT");
	end

	tinsert(f.categories,b);
end

f.scroll2 = CreateFrame("ScrollFrame","AzCastBarCategoryScroll",f.outline2,"FauxScrollFrameTemplate");
f.scroll2:SetPoint("TOPLEFT",f.categories[1]);
f.scroll2:SetPoint("BOTTOMRIGHT",f.categories[#f.categories],-6,-1);
f.scroll2:SetScript("OnVerticalScroll",function(self,offset) FauxScrollFrame_OnVerticalScroll(self,offset,ITEM_HEIGHT,UpdateCategoryList) end);

--------------------------------------------------------------------------------------------------------
--                                        Build Option Objects                                        --
--------------------------------------------------------------------------------------------------------

-- Converts string colors to RGBA
function f:HexStringToRGBA(string)
	local a, r, g, b = string:match("^|c(..)(..)(..)(..)");
	return format("%d","0x"..r) / 255, format("%d","0x"..g) / 255, format("%d","0x"..b) / 255, format("%d","0x"..a) / 255;
end

-- Get Frame
local function GetFrame(type,id,index)
	local frame;
	-- Find existsing frame
	if (frames[type]) and (frames[type][index]) then
		frame = frames[type][index];
	-- Create new frame
	else
		frame = ACBFactory[type](index);
		if (not frames[type]) then
			frames[type] = {};
		end
		tinsert(frames[type],frame);
	end
	-- Return Frame
	return frame;
end

local xExtraOffsets = { ["Check"] = 10, ["Slider"] = 18, ["Color"] = 14, ["DropDown"] = 136 };
local yExtraOffsets = { ["Check"] = 0, ["Slider"] = 4, ["Color"] = 6, ["DropDown"] = 2 };

-- Build Page
function f:BuildCategoryPage()
	local frame;
	local frameUseCount = {};
	local yOffset = -38;
	-- Loop Through Options
	f.updatingOptions = 1;
	for index, table in ipairs(CategoryList[subPage].table) do
		if (not table.restrict) or (AzCastBar.EntryInTable(table.restrict,f.activeBar.token)) then
			-- Az: debug
			if (cfg[f.activeBar.token][table.var] == nil) then
				AzMsg("|2Warning:|r the variable |1"..table.var.."|r for the |1"..f.activeBar.token.."|r frame, was |1nil|r.");
			end
			-- Init the Frame
			frameUseCount[table.type] = (frameUseCount[table.type] or 0) + 1;
			frame = GetFrame(table.type,index,frameUseCount[table.type]);
			-- Setup the Frame
			frame.option = table;
			frame.text:SetText(table.label);
			-- slider
			if (table.type == "Slider") then
				frame.slider:SetMinMaxValues(table.min,table.max);
				frame.slider:SetValueStep(table.step);
				frame.slider:SetValue(cfg[f.activeBar.token][table.var]);
				frame.edit:SetNumber(cfg[f.activeBar.token][table.var]);
				frame.low:SetText(table.min);
				frame.high:SetText(table.max);
			-- check
			elseif (table.type == "Check") then
				frame:SetHitRectInsets(0,frame.text:GetWidth() * -1,0,0);
				frame:SetChecked(cfg[f.activeBar.token][table.var]);
			-- color
			elseif (table.type == "Color") then
				frame:SetHitRectInsets(0,frame.text:GetWidth() * -1,0,0);
				if (table.subType == 2) then
					frame.texture:SetVertexColor(f:HexStringToRGBA(cfg[f.activeBar.token][table.var]));
				else
					frame.texture:SetVertexColor(unpack(cfg[f.activeBar.token][table.var]));
				end
			-- dropdown
			elseif (table.type == "DropDown") then
				frame.InitFunc = (table.init or AzCastBarDropDowns.Default);
				ACBFactory.DropDown_InitSelected(frame,cfg[f.activeBar.token][table.var]);
			end
			-- Anchor the Frame
			frame:ClearAllPoints();
			frame:SetPoint("TOPLEFT",f.outline,"TOPRIGHT",xExtraOffsets[table.type] + (table.x or 0),yOffset);
			yOffset = (yOffset - frame:GetHeight() - yExtraOffsets[table.type] - (table.y or 0));
			-- Show
			frame:Show();
		end
	end
	f.lastDropDown = nil;
	-- Hide Unused Frames
	for type, table in pairs(frames) do
		for i = (frameUseCount[type] or 0) + 1, #table do
			table[i]:Hide();
		end
	end
	-- Reset
	f.updatingOptions = nil;
end