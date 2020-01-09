--
--	<3 Lyniviel
--
Panels = {}
function Panels:Chat(text) ChatFrame1:AddMessage(text) end

function Panels:CreatePanel(fname, fparent, fstrata, flevel, fwidth, fheight, fcolor, fpoints)
	local f = CreateFrame("Frame","Panel_"..fname,UIParent)
	f:SetParent(fparent)
	f:SetFrameStrata(fstrata)
	f:SetFrameLevel(flevel)
	f:SetWidth(fwidth)
	f:SetHeight(fheight)
	f:SetBackdrop({bgFile = "Interface/Buttons/WHITE8x8"})
	f:SetBackdropColor(fcolor.r, fcolor.g, fcolor.b, fcolor.a)
	for i,v in pairs(fpoints) do
		f:SetPoint(unpack(v))
	end
end

local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]

-- border panel
Panels:CreatePanel("Bottom1", "UIParent", "BACKGROUND", 0, 1680.8, 24.5, {r=0, g=0, b=0, a=1}, {{"BOTTOM", UIParent, "BOTTOM", 0, 0 }})
Panels:CreatePanel("Bottom2", "UIParent", "BACKGROUND", 1, 1680.8, 2, {r=color.r, g=color.g, b=color.b, a=1}, {{"BOTTOM", UIParent, "BOTTOM", 0, 21 }})
--Panels:CreatePanel("Bottom3", "UIParent", "BACKGROUND", 2, 1680, 20, {r=0, g=0, b=0, a=1}, {{"BOTTOM", UIParent, "BOTTOM", 0, 0 }})
Panels:CreatePanel("Top1", "UIParent", "BACKGROUND", 0, 1680.8, 26.5, {r=0, g=0, b=0, a=1}, {{"TOP", UIParent, "BOTTOM", 0, 1045,5 }})
Panels:CreatePanel("Top2", "UIParent", "BACKGROUND", 1, 1680.8, 2, {r=color.r, g=color.g, b=color.b, a=1}, {{"TOP", UIParent, "BOTTOM", 0, 1021 }})
--Panels:CreatePanel("Top3", "UIParent", "BACKGROUND", 2, 1680, 20, {r=0, g=0, b=0, a=1}, {{"BOTTOM", UIParent, "TOP", 0, 0 }})


--
-- texture include
--
function Panels:CreateArtwork(path, parent, anchor, x, y, strata, level, width, height)
	local f = CreateFrame("Frame", nil, UIParent)
	local t = f:CreateTexture(nil,"BACKGROUND")
	f:SetPoint(anchor, parent, x, y)
	f:SetWidth(width)
	f:SetHeight(height)
	f:SetFrameStrata("BACKGROUND")
	f:SetFrameLevel(0)
	t:SetTexture(path)
	t:SetAllPoints(f)
	f.texture = t
	f:Show()
end

--Panels:CreateArtwork("Interface\\shadow.tga", UIParent, "CENTER", 0, 0, "BACKGROUND", 0, 1950, 1210)