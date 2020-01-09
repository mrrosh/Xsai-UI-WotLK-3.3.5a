local function makeMovable(frame)
	local mover = CreateFrame("Frame", frame:GetName() .. "Mover", frame)
	mover:EnableMouse(true)
	mover:SetPoint("TOP", frame, "TOP", 0, 10)
	mover:SetWidth(160)
	mover:SetHeight(40)
	mover:SetScript("OnMouseDown", function(self)
		self:GetParent():StartMoving()
	end)
	mover:SetScript("OnMouseUp", function(self)
		self:GetParent():StopMovingOrSizing()
	end)
	frame:SetMovable(true)

	--[[
	mover:SetBackdrop({
		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		tile = true, tileSize = 32, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	]]--
end

local freeButtons = {
    [InterfaceOptionsFrameCategories] = {},
    [InterfaceOptionsFrameAddOns] = {},
}
local function updateScrollHeight(categoryFrame)
    local buttons = categoryFrame.buttons
    local numButtons = #buttons
    local maxButtons = (categoryFrame:GetTop() - categoryFrame:GetBottom() - 8) / categoryFrame.buttonHeight
    local name = categoryFrame:GetName()

    if numButtons < maxButtons then
        for i = numButtons + 1, maxButtons do
            local button
            if freeButtons[categoryFrame][i] then
                button = freeButtons[categoryFrame][i]
            else
                button = CreateFrame("BUTTON", name .. "Button" .. i, categoryFrame, "InterfaceOptionsListButtonTemplate")
                button:SetPoint("TOPLEFT", buttons[#buttons], "BOTTOMLEFT")
            end
            local listwidth = InterfaceOptionsFrameAddOnsList:GetWidth()
            if InterfaceOptionsFrameAddOnsList:IsShown() then
                button:SetWidth(button:GetWidth() - listwidth)
            end
            tinsert(buttons, button)
            categoryFrame.update()
        end
    else
        for i = numButtons, maxButtons, -1 do
            local button = tremove(buttons, i)
            button:Hide()
            local listwidth = InterfaceOptionsFrameAddOnsList:GetWidth()
            if InterfaceOptionsFrameAddOnsList:IsShown() then
                button:SetWidth(button:GetWidth() + listwidth)
            end
            freeButtons[categoryFrame][i] = button
            categoryFrame.update()
        end
    end
end

local grip = CreateFrame("Button", "BetterBlizzOptionsResizeGrip", InterfaceOptionsFrame)
grip:SetNormalTexture("Interface\\AddOns\\BetterBlizzOptions\\ResizeGrip")
grip:SetHighlightTexture("Interface\\AddOns\\BetterBlizzOptions\\ResizeGrip")
grip:SetWidth(16)
grip:SetHeight(16)
grip:SetScript("OnMouseDown", function(self)
	self:GetParent():StartSizing()
end)
grip:SetScript("OnMouseUp", function(self)
	self:GetParent():StopMovingOrSizing()
	updateScrollHeight(InterfaceOptionsFrameCategories)
	updateScrollHeight(InterfaceOptionsFrameAddOns)
end)
grip:SetScript("OnEvent", function(self)
	updateScrollHeight(InterfaceOptionsFrameCategories)
	updateScrollHeight(InterfaceOptionsFrameAddOns)
end)
grip:RegisterEvent("PLAYER_LOGIN")
grip:SetPoint("BOTTOMRIGHT", InterfaceOptionsFrame, "BOTTOMRIGHT", -5, 5)

InterfaceOptionsFrame:SetPoint("CENTER", UIParent, "CENTER")

InterfaceOptionsFrameCategories:SetPoint("BOTTOMLEFT", InterfaceOptionsFrame, "BOTTOMLEFT", 22, 50)
InterfaceOptionsFrameAddOns:SetPoint("BOTTOMLEFT", InterfaceOptionsFrame, "BOTTOMLEFT", 22, 50)

InterfaceOptionsFrame:SetResizable(true)
InterfaceOptionsFrame:SetWidth(900)
InterfaceOptionsFrame:SetMinResize(585, 495)

makeMovable(InterfaceOptionsFrame)
makeMovable(ChatConfigFrame)
makeMovable(AudioOptionsFrame)
makeMovable(GameMenuFrame)
makeMovable(VideoOptionsFrame)
if MacOptionsFrame then
   makeMovable(MacOptionsFrame)
end
