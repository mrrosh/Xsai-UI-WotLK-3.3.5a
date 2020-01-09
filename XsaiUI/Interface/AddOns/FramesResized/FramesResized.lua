FramesResized_SV = FramesResized_SV or {
	LootFrame_Resize = true,
	QuestLog_Resize = true,
	QuestLog_Moveable = true,
	RaidInfo_Resize = true,
	TraidSkillUI_Resize = true,
	TraidSkillUI_Moveable = true,
	TrainerUI_Resize = true,
	TrainerUI_Moveable = true,
}

local original_LootFrame_OnShow
local original_QuestLog_OnShow
local original_ClassTrainer_SetToTradeSkillTrainer
local original_ClassTrainer_SetToClassTrainer


-- -----
-- Hook Functions
-- -----

local function FR_Hooks_LootFrame_OnShow(self)
	if (GetNumLootItems() > LOOTFRAME_NUMBUTTONS_ORG) then
		LOOTFRAME_NUMBUTTONS = LOOTFRAME_NUMBUTTONS_ORG + LOOTFRAME_ADDBUTTONS
		LootFramePrev:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 57, 27)
		LootFrameNext:SetPoint("BOTTOMRIGHT", LootFrame_MidTextures, "BOTTOMLEFT", 142, 27)
		LootFrameUpButton:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 25, 16)
		LootFrameDownButton:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 143, 16)
		LootFrame_MidTextures:SetFrameLevel(LootFrame:GetFrameLevel() + 1)
		LootFrame_MidTextures:Show()
	else
		LOOTFRAME_NUMBUTTONS = LOOTFRAME_NUMBUTTONS_ORG
		LootFramePrev:SetPoint("BOTTOMLEFT", LootFrame, "BOTTOMLEFT", 57, 27)
		LootFrameNext:SetPoint("BOTTOMRIGHT", LootFrame, "BOTTOMLEFT", 142, 27)
		LootFrameUpButton:SetPoint("BOTTOMLEFT", LootFrame, "BOTTOMLEFT", 25, 16)
		LootFrameDownButton:SetPoint("BOTTOMLEFT", LootFrame, "BOTTOMLEFT", 143, 16)
		LootFrame_MidTextures:Hide()
	end
	original_LootFrame_OnShow(self)
end

local function FR_Hooks_QuestLog_OnShow(self)
	if (GetNumQuestLogEntries() > 0) then
		QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG + QUESTS_ADDLINES
		QuestLogFrame:SetHeight(512 + QUESTS_ADDLINES * QUESTLOG_QUEST_HEIGHT)
		QuestLogListScrollFrame:SetHeight(93 + QUESTS_ADDLINES * QUESTLOG_QUEST_HEIGHT)
		QuestLogFrame_MidTextures:Show()
		QuestLogFrame_MidTextures:SetFrameLevel(QuestLogFrame:GetFrameLevel() + 1)
		for index = 1, QUESTS_DISPLAYED do
			button = getglobal("QuestLogTitle"..index)
			button:SetFrameLevel(QuestLogFrame_MidTextures:GetFrameLevel() + 1)
		end
	else
		QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG
		QuestLogFrame:SetHeight(512)
		QuestLogListScrollFrame:SetHeight(93)
		QuestLogFrame_MidTextures:Hide()
	end
	original_QuestLog_OnShow(self)
end

local function FR_Hooks_ClassTrainer_SetToTradeSkillTrainer()
	CLASS_TRAINER_SKILLS_DISPLAYED = 10 + CLASS_TRAINER_SKILLS_ADDLINES
	getglobal("ClassTrainerSkill"..(CLASS_TRAINER_SKILLS_DISPLAYED + 1)):Hide()
	ClassTrainerListScrollFrame:SetHeight(168 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT)
	ClassTrainerDetailScrollFrame:SetHeight(135)
	ClassTrainerHorizontalBarLeft:SetPoint("TOPLEFT", "ClassTrainerFrame", "TOPLEFT", 15, -(259 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))
end

local function FR_Hooks_ClassTrainer_SetToClassTrainer()
	CLASS_TRAINER_SKILLS_DISPLAYED = 11 + CLASS_TRAINER_SKILLS_ADDLINES
	ClassTrainerListScrollFrame:SetHeight(184 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT)
	ClassTrainerDetailScrollFrame:SetHeight(119)
	ClassTrainerHorizontalBarLeft:SetPoint("TOPLEFT", "ClassTrainerFrame", "TOPLEFT", 15, -(275 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))
end


-- -----
-- Resize/Moveable Functions
-- -----

local function FR_LootFrame_Resize()
	local frame = CreateFrame("Frame", "LootFrame_MidTextures", LootFrame, "FRTemplate_LootFrame_MidTextures")
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", LootFrame, "TOPLEFT")

	for index = 5, 8 do
		frame = CreateFrame("Button", "LootButton"..index, LootFrame_MidTextures, "LootButtonTemplate")
		frame:SetPoint("TOP", getglobal("LootButton"..(index-1)), "BOTTOM", 0, -4)
		frame:SetID(index)
	end

	LOOTFRAME_ADDBUTTONS = 4
	LOOTFRAME_NUMBUTTONS_ORG = LOOTFRAME_NUMBUTTONS
	LOOTFRAME_NUMBUTTONS = LOOTFRAME_NUMBUTTONS_ORG + LOOTFRAME_ADDBUTTONS

--~ 	LootFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then LootFrame:StartMoving() end end)
--~ 	LootFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then LootFrame:StopMovingOrSizing() end end)

	LootFramePrev:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 57, 27)
	LootFrameNext:SetPoint("BOTTOMRIGHT", LootFrame_MidTextures, "BOTTOMLEFT", 142, 27)
	LootFrameUpButton:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 25, 16)
	LootFrameDownButton:SetPoint("BOTTOMLEFT", LootFrame_MidTextures, "BOTTOMLEFT", 143, 16)

	LootFrame_MidTextures:SetFrameLevel(LootFrame:GetFrameLevel() + 1)
	for index = 1, LOOTFRAME_NUMBUTTONS do
		button = getglobal("LootButton"..index)
		button:SetFrameLevel(LootFrame_MidTextures:GetFrameLevel() + 1)
	end
--	LootFramePrev:SetFrameLevel(LootFrame_MidTextures:GetFrameLevel() + 1)
--	LootFrameNext:SetFrameLevel(LootFrame_MidTextures:GetFrameLevel() + 1)

--~ 	original_LootFrame_OnShow = LootFrame_OnShow
--~ 	LootFrame_OnShow = FR_Hooks_LootFrame_OnShow
	original_LootFrame_OnShow = LootFrame:GetScript("OnShow")
	LootFrame:SetScript("OnShow", FR_Hooks_LootFrame_OnShow)
end

local function FR_QuestLog_Resize()
	local frame = CreateFrame("Frame", "QuestLogFrame_MidTextures", QuestLogFrame, "FRTemplate_QuestLogFrame_MidTextures")
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT")

	for index = 7, 14 do
		frame = CreateFrame("Button", "QuestLogTitle"..index, QuestLogFrame_MidTextures, "QuestLogTitleButtonTemplate")
		frame:SetPoint("TOP", getglobal("QuestLogTitle"..(index-1)), "BOTTOM", 0, 1)
		frame:SetID(index)
	end

	QUESTS_ADDLINES = 8
	QUESTS_DISPLAYED_ORG = QUESTS_DISPLAYED
	QUESTS_DISPLAYED = QUESTS_DISPLAYED_ORG + QUESTS_ADDLINES

	local FramesResized_QuestLogFrame_org_QuestLog_OnShow = QuestLog_OnShow

	for index = 1, QUESTS_DISPLAYED do
		button = getglobal("QuestLogTitle"..index)
		button:SetFrameLevel(QuestLogFrame_MidTextures:GetFrameLevel() + 1)
	end

--~ 	original_QuestLog_OnShow = QuestLog_OnShow
--~ 	QuestLog_OnShow = FR_Hooks_QuestLog_OnShow
	original_QuestLog_OnShow = QuestLogFrame:GetScript("OnShow")
	QuestLogFrame:SetScript("OnShow", FR_Hooks_QuestLog_OnShow)
end

local function FR_QuestLog_Moveable()
	QuestLogFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then QuestLogFrame:StartMoving() end end)
	QuestLogFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then QuestLogFrame:StopMovingOrSizing() end end)
end

local function FR_RaidInfo_Resize()
	MAX_RAID_INFOS_DISPLAYED = 8
	RaidInfoFrame:SetHeight(250 + 158)
	RaidInfoScrollFrame:SetHeight(158 + 158)
end

local function FR_TradeSkillUI_Resize()
	local frame = CreateFrame("Frame", "TradeSkillFrame_MidTextures", TradeSkillFrame, "FRTemplate_ClassTrainer_MidTextures")
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", 0, -256)
	
	frame = CreateFrame("Frame", "TradeSkillListScrollFrame_MidTextures", TradeSkillListScrollFrame, "FRTemplate_ClassTrainerScrollFrame_MidTextures")
	frame:SetPoint("TOPLEFT", TradeSkillListScrollFrame, "TOPRIGHT", -3, -117)
	frame:SetPoint("TOPRIGHT", TradeSkillListScrollFrame, "TOPRIGHT", 27, -117)
	frame:SetPoint("BOTTOMLEFT", TradeSkillListScrollFrame, "BOTTOMRIGHT", -3, 120)
	frame:SetPoint("BOTTOMRIGHT", TradeSkillListScrollFrame, "BOTTOMRIGHT", 27, 120)

	for index = 9, 16 do
		frame = CreateFrame("Button", "TradeSkillSkill"..index, TradeSkillFrame, "TradeSkillSkillButtonTemplate")
		frame:SetPoint("TOPLEFT", getglobal("TradeSkillSkill"..(index-1)), "BOTTOMLEFT")
	end

	TRADE_SKILL_ADDLINES = 8
	TRADE_SKILLS_DISPLAYED = TRADE_SKILLS_DISPLAYED + TRADE_SKILL_ADDLINES

	TradeSkillFrame:SetHeight(512 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT)
	TradeSkillHorizontalBarLeft:SetPoint("TOPLEFT", 15, -(221 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT))
	TradeSkillListScrollFrame:SetHeight(130 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT)
	TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", 20, -(234 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT))
	TradeSkillCreateButton:SetPoint("CENTER", TradeSkillCreateButton:GetParent(), "TOPLEFT", 224, -(422 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT))
	TradeSkillCancelButton:SetPoint("CENTER", TradeSkillCancelButton:GetParent(), "TOPLEFT", 305, -(422 + TRADE_SKILL_ADDLINES * TRADE_SKILL_HEIGHT))

	TradeSkillFrame_MidTextures:SetFrameLevel(TradeSkillFrame:GetFrameLevel())
end

local function FR_TradeSkillUI_Moveable()
	TradeSkillFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then TradeSkillFrame:StartMoving() end end)
	TradeSkillFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then TradeSkillFrame:StopMovingOrSizing() end end)
end

local function FR_TrainerUI_Resize()
	local frame = CreateFrame("Frame", "ClassTrainerFrame_MidTextures", ClassTrainerFrame, "FRTemplate_ClassTrainer_MidTextures")
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 0, -256)
	
	frame = CreateFrame("Frame", "ClassTrainerListScrollFrame_MidTextures", ClassTrainerListScrollFrame, "FRTemplate_ClassTrainerScrollFrame_MidTextures")
	frame:SetPoint("TOPLEFT", ClassTrainerListScrollFrame, "TOPRIGHT", -3, -117)
	frame:SetPoint("TOPRIGHT", ClassTrainerListScrollFrame, "TOPRIGHT", 27, -117)
	frame:SetPoint("BOTTOMLEFT", ClassTrainerListScrollFrame, "BOTTOMRIGHT", -3, 120)
	frame:SetPoint("BOTTOMRIGHT", ClassTrainerListScrollFrame, "BOTTOMRIGHT", 27, 120)

	for index = 12, 19 do
		frame = CreateFrame("Button", "ClassTrainerSkill"..index, ClassTrainerFrame, "ClassTrainerSkillButtonTemplate")
		frame:SetPoint("TOPLEFT", getglobal("ClassTrainerSkill"..(index-1)), "BOTTOMLEFT")
	end

	CLASS_TRAINER_SKILLS_ADDLINES = 8
	CLASS_TRAINER_SKILLS_DISPLAYED = CLASS_TRAINER_SKILLS_DISPLAYED + CLASS_TRAINER_SKILLS_ADDLINES

	ClassTrainerFrame:SetHeight(512 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT)
	ClassTrainerHorizontalBarLeft:SetPoint("TOPLEFT", 15, -(275 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))
	ClassTrainerListScrollFrame:SetHeight(184 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT)
--	ClassTrainerDetailScrollFrame:SetPoint("TOPLEFT", 20, -(234 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))
	ClassTrainerTrainButton:SetPoint("CENTER", ClassTrainerFrame, "TOPLEFT", 224, -(420 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))
	ClassTrainerCancelButton:SetPoint("CENTER", ClassTrainerFrame, "TOPLEFT", 305, -(420 + CLASS_TRAINER_SKILLS_ADDLINES * CLASS_TRAINER_SKILL_HEIGHT))

	ClassTrainerFrame_MidTextures:SetFrameLevel(ClassTrainerFrame:GetFrameLevel())

	original_ClassTrainer_SetToTradeSkillTrainer = ClassTrainer_SetToTradeSkillTrainer
	ClassTrainer_SetToTradeSkillTrainer = FR_Hooks_ClassTrainer_SetToTradeSkillTrainer
	original_ClassTrainer_SetToClassTrainer = ClassTrainer_SetToClassTrainer
	ClassTrainer_SetToClassTrainer = FR_Hooks_ClassTrainer_SetToClassTrainer
end

local function FR_TrainerUI_Moveable()
	ClassTrainerFrame:SetScript("OnMouseDown", function() if arg1 == "LeftButton" then ClassTrainerFrame:StartMoving() end end)
	ClassTrainerFrame:SetScript("OnMouseUp", function() if arg1 == "LeftButton" then ClassTrainerFrame:StopMovingOrSizing() end end)
end

-- -----
-- Event Handling
-- -----

local FR_frame = CreateFrame("Frame", "FramesResizedFrame")

FR_frame:RegisterEvent("PLAYER_LOGIN")

FR_frame:SetScript("OnEvent", function(self, event, arg1)
	if event == "PLAYER_LOGIN" then
		if FramesResized_SV.LootFrame_Resize			then FR_LootFrame_Resize() end
		if FramesResized_SV.QuestLog_Resize				then FR_QuestLog_Resize() end
		if FramesResized_SV.QuestLog_Moveable			then FR_QuestLog_Moveable() end
		if FramesResized_SV.RaidInfo_Resize				then FR_RaidInfo_Resize() end
		if IsAddOnLoaded("Blizzard_TradeSkillUI") then
			if FramesResized_SV.TraidSkillUI_Resize		then FR_TradeSkillUI_Resize() end
			if FramesResized_SV.TraidSkillUI_Moveable	then FR_TradeSkillUI_Moveable() end
		end
		if IsAddOnLoaded("Blizzard_TrainerUI") then
			if FramesResized_SV.TrainerUI_Resize		then FR_TrainerUI_Resize() end
			if FramesResized_SV.TrainerUI_Moveable		then FR_TrainerUI_Moveable() end
		end
		FR_frame:RegisterEvent("ADDON_LOADED")
	elseif event == "ADDON_LOADED" then
		if		arg1 == "Blizzard_TradeSkillUI" then
			if FramesResized_SV.TraidSkillUI_Resize		then FR_TradeSkillUI_Resize() end
			if FramesResized_SV.TraidSkillUI_Moveable	then FR_TradeSkillUI_Moveable() end
		elseif	arg1 == "Blizzard_TrainerUI" then
			if FramesResized_SV.TrainerUI_Resize		then FR_TrainerUI_Resize() end
			if FramesResized_SV.TrainerUI_Moveable		then FR_TrainerUI_Moveable() end
		end
	end
end)
