--[[-------------------------------------------------------------------------

	Original addon was evl_NamePlates, edited by me (Lyn) for own needs.
	You can find the original, unmodified addon on evl's googlecode:
	
	http://code.google.com/p/evladdons/source/browse/trunk/evl_NamePlates

---------------------------------------------------------------------------]]

local addon = CreateFrame("Frame", "NamePlates", UIParent)

local texture = "Interface\\AddOns\\!LynSettings\\textures\\statusbar.tga"
local font = "Interface\\AddOns\\!LynSettings\\fonts\\font2.ttf"

local function IsNamePlateFrame(frame)
	if frame:GetName() then
		return false
	end
  
	local overlayRegion = frame:GetRegions()
	if not overlayRegion or overlayRegion:GetObjectType() ~= "Texture" or overlayRegion:GetTexture() ~= "Interface\\Tooltips\\Nameplate-Border" then
		return false
	end

	return true
end

function addon:new()
	self:SetScript("OnUpdate", self.onUpdate)
end

local lastUpdate = 0
local frame
function addon:onUpdate(elapsed)
	lastUpdate = lastUpdate + elapsed
	
	if lastUpdate > 1 then
		lastUpdate = 0

		for i = 1, select("#", WorldFrame:GetChildren()) do
			frame = select(i, WorldFrame:GetChildren())
    
			if not frame.background and IsNamePlateFrame(frame) then 
				self:setupNamePlate(frame)
			end
		end  
	end
end

local healthBar, castBar
local overlayRegion, highlightRegion, nameTextRegion, bossIconRegion, levelTextRegion, raidIconRegion
function addon:setupNamePlate(frame)
	healthBar, castBar = frame:GetChildren()
	overlayRegion, _, _, highlightRegion, nameTextRegion, levelTextRegion, bossIconRegion, raidIconRegion = frame:GetRegions()

	--
	-- border
	--
	overlayRegion:Hide()
	--
	-- icons
	--
	bossIconRegion:Hide()
		 
	--
	-- name text
	--
	nameTextRegion:ClearAllPoints()
	nameTextRegion:SetPoint("LEFT", healthBar, 0, 4)
	nameTextRegion:SetPoint("RIGHT", healthBar, 0, 4)
	nameTextRegion:SetJustifyH"LEFT" 
	nameTextRegion:SetFont(font, 8, "OUTLINE")
	nameTextRegion:SetShadowOffset(1, -1)
	  
	--
	-- level text
	--
	levelTextRegion:ClearAllPoints()
	levelTextRegion:SetPoint("LEFT", nameTextRegion, "RIGHT", 0, 0)
	levelTextRegion:SetFont(NAMEPLATE_FONT, 0) -- 0 for hide, otherwise it somehow dont work
	  
	--
	-- highlight shows up on mouseover, replaced by blank .blp
	--
	highlightRegion:SetHeight(10)
	  
	--
	-- health bar
	--
	healthBar:SetStatusBarTexture(texture)
	healthBar:SetHeight(10)
	  
	--
	-- background
	--
	background = healthBar:CreateTexture(nil, "BORDER")
	background:SetAllPoints(healthBar)
	background:SetTexture(texture)
	background:SetVertexColor(.93, .83, .71, .3)
	  
	frame.background = background
end

addon:new()