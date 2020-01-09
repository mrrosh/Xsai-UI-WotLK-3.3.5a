--
-- hide some errors
-- code from haste's "IHasNoScope"
--
local event = CreateFrame"Frame"
local dummy = function() end

local blacklist = {
    [ERR_NO_ATTACK_TARGET] = true,
    [ERR_GENERIC_NO_TARGET] = true,	
    [ERR_OUT_OF_RAGE] = true,	
    [ERR_INVALID_ATTACK_TARGET] = true,	
    [ERR_OUT_OF_MANA] = true,	
    [ERR_NOEMOTEWHILERUNNING] = true,
    [ERR_SPELL_COOLDOWN] = true,
    [ERR_ABILITY_COOLDOWN] = true,
    [ERR_ATTACK_FLEEING] = true,
    [ERR_NOEMOTEWHILERUNNING] = true,
    [OUT_OF_ENERGY] = true,
    [SPELL_FAILED_NO_COMBO_POINTS] = true,
    [SPELL_FAILED_SPELL_IN_PROGRESS] = true,
    [SPELL_FAILED_TARGETS_DEAD] = true,	
    [SPELL_FAILED_MOVING] = true,	
    [SPELL_FAILED_NOT_IN_CONTROL] = true,	
    [SPELL_FAILED_NOT_INFRONT] = true,	
    [SPELL_FAILED_NOT_ON_TAXI] = true,	
    [SPELL_FAILED_NOT_MOUNTED] = true,	
    [SPELL_FAILED_BAD_TARGETS] = true,	
    [SPELL_FAILED_NO_ENDURANCE] = true,	
}

UIErrorsFrame:UnregisterEvent"UI_ERROR_MESSAGE"
event.UI_ERROR_MESSAGE = function(self, event, error)
	if(not blacklist[error]) then
		UIErrorsFrame:AddMessage(error, 1, .1, .1)
	end
end

event:RegisterEvent"UI_ERROR_MESSAGE"
event:RegisterEvent"PLAYER_LOGIN"

--
-- add elite dragon on player frame
--
local playerlevel = UnitLevel("player")
if playerlevel == MAX_PLAYER_LEVEL then
    PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite.blp");
elseif playerlevel > MAX_PLAYER_LEVEL/70 then
    PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite.blp");
end

--[[
if DurabilityFrame then
DurabilityFrame:ClearAllPoints()
DurabilityFrame:SetPoint("RIGHT", UIParent, -150, 0)
DurabilityFrame.SetPoint = function() end
end

if QuestTimerFrame then
QuestTimerFrame:ClearAllPoints()
QuestTimerFrame:SetPoint("RIGHT", UIParent, -150, 90)
QuestTimerFrame.SetPoint = function() end
end

if WorldStateCaptureBar then	  
WorldStateCaptureBar:ClearAllPoints()
WorldStateCaptureBar:SetPoint("RIGHT", UIParent, -150, 50)
WorldStateCaptureBar.SetPoint = function() end 
end
--]]

--local c = CastingBarFrame
--c:ClearAllPoints()
--c:SetPoint("BOTTOM", UIParent, 0, 135)
--c.SetPoint = function() end
