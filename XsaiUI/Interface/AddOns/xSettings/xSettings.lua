---------------------------------------------------- Some slash commands
SlashCmdList["FRAME"] = function()
    ChatFrame1:AddMessage(GetMouseFocus():GetName())
end
SLASH_FRAME1 = "/frame"
SLASH_FRAME2 = "/gn"

SlashCmdList["RELOADUI"] = function() ReloadUI() end
SLASH_RELOADUI1 = "/rl"

SlashCmdList["RCSLASH"] = function() DoReadyCheck() end
SLASH_RCSLASH1 = "/rc"

---------------------------------------------------- Changing some variables
SetCVar("screenshotQuality", 10)
SetCVar("cameraDistanceMax", 50)
SetCVar("cameraDistanceMaxFactor", 3.4)

---------------------------------------------------- Word map styling
UIPanelWindows["WorldMapFrame"] = {area = "center", pushable = 9}
hooksecurefunc(WorldMapFrame, "Show", function(self)
	self:EnableKeyboard(false)
	self:EnableMouse(false)
	self:SetScale(0.75)
end)

local dummy = function() end

local buttons = {
    BlackoutWorld,
    WorldMapZoneDropDown,
    WorldMapZoomOutButton,
    WorldMapLevelDropDown,
    WorldMapFrameCloseButton,
    WorldMapContinentDropDown,
    WorldMapZoneMinimapDropDown,
    WorldMapMagnifyingGlassButton
}

for i in pairs(buttons) do
    buttons[i]:Hide()
    buttons[i].Show = dummy
end

buttons = nil

for i = 1, 14 do
    local region = select(i, WorldMapFrame:GetRegions())
    region:Hide()
end

local bgframe = CreateFrame("Frame", nil, WorldMapButton)
bgframe:SetFrameStrata("BACKGROUND")

local bg = bgframe:CreateTexture(nil, "BACKGOUND")
bg:SetPoint("BOTTOMRIGHT", WorldMapButton, 10, -10)
bg:SetPoint("TOPLEFT", WorldMapButton, -10, 10)
bg:SetTexture(0, 0, 0, .6)

---------------------------------------------------- Move UIErrors frame
UIErrorsFrame:ClearAllPoints()
UIErrorsFrame:SetPoint("TOP", UIParent, "TOP", 0, -30)
UIErrorsFrame.SetPoint = dummy

---------------------------------------------------- Autogreed on green items
local f = CreateFrame("Frame")
f:RegisterEvent("START_LOOT_ROLL")
f:SetScript("OnEvent", function(_, _, id)
	if(id and select(4, GetLootRollItemInfo(id))==2) then
        RollOnLoot(id, 2)
	end
end)

---------------------------------------------------- Auto repair & sell crap
local g = CreateFrame("Frame")
g:RegisterEvent("MERCHANT_SHOW")
g:SetScript("OnEvent", function()
    if(CanMerchantRepair()) then
        local cost = GetRepairAllCost()
        if cost > 0 then
            RepairAllItems()
            ChatFrame1:AddMessage("Repair cost: "..string.format("%.1fg", cost*0.0001), 0, 1, 1)
        end
    end

    local bag, slot 
    for bag = 0, 4 do
        for slot = 0, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if link and (select(3, GetItemInfo(link))==0) then
                UseContainerItem(bag, slot)
            end
        end
    end
end)