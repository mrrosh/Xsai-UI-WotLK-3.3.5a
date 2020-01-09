local f = AzCastBarOptions;
local p = CreateFrame("Frame",nil,f);
local cfg = AzCastBar_Config;

--------------------------------------------------------------------------------------------------------
--                                              Edit Mode                                             --
--------------------------------------------------------------------------------------------------------

-- EditModeBar: OnUpdate
local function EditModeBar_OnUpdate(self,elapsed)
	local time = (GetTime() % 2);
	self.status:SetValue(time);
	self.time:SetText(AzCastBar.FormatTime(time)..(self.cfg.showTotalTime and " / "..AzCastBar.FormatTime(2,1) or ""));
end

-- Start Moving a Bar
local function EditModeBar_OnMouseDown(self,button)
	self:StartMoving();
end

-- Stop Moving a Bar
local function EditModeBar_OnMouseUp(self,button)
	self:StopMovingOrSizing();
	-- Save New Position & Set The Real Bars Position
	self.cfg.left = self:GetLeft();
	self.cfg.bottom = self:GetBottom();
	self.realFrame:SetPoint("BOTTOMLEFT",UIParent,"BOTTOMLEFT",self:GetLeft(),self:GetBottom());
	-- Reflect Change in Options if Visible
	if (f:IsVisible()) and (self.cfg == f.activeBar.cfg) then
		f:BuildCategoryPage();
	end
end

-- Create EditMode Bars
local function CreateEditModeBar(frame)
	local b = AzCastBar.CreateBar("Button");
	b.token = frame.token;
	b.realFrame = frame;
	b.isEditModeBar = 1;

	b:EnableMouse(1);
	b:SetMovable(1);
	b:SetToplevel(1);
	b:SetFrameStrata("DIALOG");

	b.status:SetMinMaxValues(0,2);
	b.name:SetText(frame.token);
	b.icon:SetTexture("Interface\\Icons\\Spell_Nature_UnrelentingStorm");

	b:SetScript("OnMouseDown",EditModeBar_OnMouseDown);
	b:SetScript("OnMouseUp",EditModeBar_OnMouseUp);
	b:SetScript("OnUpdate",EditModeBar_OnUpdate);

	return b;
end

-- Toggle EditMode
local function EditMode_OnClick(self,button)
	local editMode = self:GetChecked();
	for index, frame in ipairs(AzCastBar.frames) do
		if (not frame.editModeBar) then
			frame.editModeBar = CreateEditModeBar(frame);
		end
		if (editMode) then
			AzCastBar.ApplyBarSettingsSpecific(frame.editModeBar);
			frame.editModeBar.status:SetStatusBarColor(frame.status:GetStatusBarColor());
			frame.editModeBar:Show();
		else
			frame.editModeBar:Hide();
		end
	end
end

-- Edit Mode CheckButton
f.editMode = CreateFrame("CheckButton",nil,f,"OptionsSmallCheckButtonTemplate");
f.editMode:SetWidth(26);
f.editMode:SetHeight(26);
f.editMode:SetScript("OnEnter",nil);
f.editMode:SetScript("OnLeave",nil);
f.editMode:SetScript("OnClick",EditMode_OnClick);
f.editMode:SetPoint("BOTTOMLEFT",f.outline2,"BOTTOMRIGHT",8,2);
f.editMode.text = select(6,f.editMode:GetRegions());
f.editMode.text:SetText("Edit Mode");

--------------------------------------------------------------------------------------------------------
--                                      Profiles: Button Function                                     --
--------------------------------------------------------------------------------------------------------

-- Load
local function Button_Load_OnClick(self,button)
	local left, bottom = cfg.optionsLeft, cfg.optionsBottom;
	wipe(cfg);
	cfg.optionsLeft, cfg.optionsBottom = left, bottom;
	for token, table in pairs(AzCastBar_Profiles[p.edit:GetText()]) do
		for _, bar in ipairs(AzCastBar.frames) do
			if (token == bar.token) then
				cfg[token] = CopyTable(table);
			end
		end
	end
	AzCastBar.CheckSettings();
	AzCastBar.ApplyAllSettings();
	f:BuildCategoryPage();
end

-- Save
local function Button_Save_OnClick(self,button)
	AzCastBar_Profiles[p.edit:GetText()] = CopyTable(cfg);
	p:BuildProfileList();
end

-- Delete
local function Button_Delete_OnClick(self,button)
	AzCastBar_Profiles[p.edit:GetText()] = nil;
	p:BuildProfileList();
end

-- Text Changed
local function Edit_OnTextChanged(self)
	local name = p.edit:GetText();
	-- save
	if (name == "") then
		p.btnSave:Disable();
	else
		p.btnSave:Enable();
	end
	-- load & delete
	if (AzCastBar_Profiles[name]) then
		p.btnLoad:Enable();
		p.btnDelete:Enable();
	else
		p.btnLoad:Disable();
		p.btnDelete:Disable();
	end
end

--------------------------------------------------------------------------------------------------------
--                                       Profiles: Create Window                                      --
--------------------------------------------------------------------------------------------------------

p:SetWidth(198);
p:SetHeight(256);
p:SetPoint("CENTER",UIParent);
p:SetBackdrop(f:GetBackdrop());
p:SetBackdropColor(0.1,0.22,0.35,1);
p:SetBackdropBorderColor(0.1,0.1,0.1,1);
p:EnableMouse(1);
p:SetMovable(1);
p:SetToplevel(1);
p:SetClampedToScreen(1);
p:SetScript("OnMouseDown",function() p:StartMoving() end);
p:SetScript("OnMouseUp",function() p:StopMovingOrSizing(); end);
p:Hide();

p.header = p:CreateFontString(nil,"ARTWORK","GameFontHighlight");
p.header:SetFont(p.header:GetFont(),22,"THICKOUTLINE");
p.header:SetPoint("TOPLEFT",12,-12);

p.close = CreateFrame("Button",nil,p,"UIPanelCloseButton");
p.close:SetWidth(24);
p.close:SetHeight(24);
p.close:SetPoint("TOPRIGHT",-5,-5);
p.close:SetScript("OnClick",function() p:Hide(); end)

p.outline = CreateFrame("Frame",nil,p);
p.outline:SetHeight(158);
p.outline:SetPoint("TOPLEFT",12,-38);
p.outline:SetPoint("BOTTOMRIGHT",-12,62);
p.outline:SetBackdrop(f.outline:GetBackdrop());
p.outline:SetBackdropColor(0.1,0.1,0.2,1);
p.outline:SetBackdropBorderColor(0.8,0.8,0.9,0.4);

p.edit = CreateFrame("EditBox","AzCastBarOptionsProfilesEdit",p,"InputBoxTemplate");
p.edit:SetWidth(110);
p.edit:SetHeight(21);
p.edit:SetPoint("TOPLEFT",p.outline,"BOTTOMLEFT",7,-1);
p.edit:SetPoint("TOPRIGHT",p.outline,"BOTTOMRIGHT",-2,-1);
p.edit:SetScript("OnTextChanged",Edit_OnTextChanged);
p.edit:SetAutoFocus(nil);

p.btnLoad = CreateFrame("Button",nil,p,"UIPanelButtonTemplate");
p.btnLoad:SetWidth(56);
p.btnLoad:SetHeight(24);
p.btnLoad:SetPoint("BOTTOMLEFT",12,12);
p.btnLoad:SetScript("OnClick",Button_Load_OnClick);
p.btnLoad:SetText("Load");

p.btnSave = CreateFrame("Button",nil,p,"UIPanelButtonTemplate");
p.btnSave:SetWidth(56);
p.btnSave:SetHeight(24);
p.btnSave:SetPoint("LEFT",p.btnLoad,"RIGHT",2,0);
p.btnSave:SetScript("OnClick",Button_Save_OnClick);
p.btnSave:SetText("Save");

p.btnDelete = CreateFrame("Button",nil,p,"UIPanelButtonTemplate");
p.btnDelete:SetWidth(56);
p.btnDelete:SetHeight(24);
p.btnDelete:SetPoint("LEFT",p.btnSave,"RIGHT",2,0);
p.btnDelete:SetScript("OnClick",Button_Delete_OnClick);
p.btnDelete:SetText("Delete");

f.profilesFrame = p;

--------------------------------------------------------------------------------------------------------
--                                        Profiles: Build List                                        --
--------------------------------------------------------------------------------------------------------

local profilesList;
local profilesButtons = {};

-- Entry OnClick
local function Entry_OnClick(self,button)
	p.edit:SetText(profilesList[self.index]);
end

-- Create Entry Button
local function CreateEntryButton()
	local b = CreateFrame("Button",nil,p.outline);
	b:SetWidth(p.outline:GetWidth() - 8);
	b:SetHeight(18);
	b:SetScript("OnClick",Entry_OnClick);

	b:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight");

	b.text = b:CreateFontString(nil,"ARTWORK","GameFontNormal");
	b.text:SetPoint("LEFT",3,0);

	tinsert(profilesButtons,b);
	return b;
end

-- Build List
function p:BuildProfileList()
	profilesList = {};
	for entryName in pairs(AzCastBar_Profiles) do
		tinsert(profilesList,entryName);
	end
	sort(profilesList);
	p.header:SetText("Profiles ("..#profilesList..")");
	p:SetHeight(max(8,#profilesList) * 18 + 112);

	local entry;
	for i = 1, #profilesList do
		entry = profilesButtons[i] or CreateEntryButton();
		entry.text:SetText(profilesList[i]);
		entry.index = i;
		entry:ClearAllPoints();
		if (i == 1) then
			entry:SetPoint("TOPLEFT",5,-6);
		else
			entry:SetPoint("TOPLEFT",profilesButtons[i - 1],"BOTTOMLEFT");
		end
		entry:Show();
	end

	for i = (#profilesList + 1), #profilesButtons do
		profilesButtons[i]:Hide();
	end

	Edit_OnTextChanged();
end