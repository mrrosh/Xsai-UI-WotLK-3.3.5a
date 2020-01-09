--[[-------------------------------------------------------------------------
Copyright (c) 2006, Trond A Ekseth
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above
copyright notice, this list of conditions and the following
disclaimer in the documentation and/or other materials provided
with the distribution.
* Neither the name of oMinimap nor the names of its contributors
may be used to endorse or promote products derived from this
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------

	It's mostly oMinimap, just edited for own needs by me (Lyn).
	You can find the original addon on haste's git:
	
	http://ixo.no/git/oMinimap.git/snapshot/oMinimap-master.zip

---------------------------------------------------------------------------]]

function GetMinimapShape() return "SQUARE" end
local addon = CreateFrame"Frame"
  
local frames = {
	MinimapZoomIn,
	MinimapZoomOut,
	MinimapBorderTop,
	MinimapToggleButton,
	MiniMapWorldMapButton,
	MiniMapVoiceChatFrame,
	MinimapNorthTag,
	MinimapZoneText,
	MinimapZoneTextButton,
	MinimapBorder,
	GameTimeFrame,
}
  
addon:SetScript("OnEvent", function()
	if(event=="PLAYER_LOGIN") then
		--
		-- zooming
		--
		Minimap:EnableMouseWheel(true)
		Minimap:SetScript("OnMouseWheel", function(self, z)
			local c = Minimap:GetZoom()
			if(z > 0 and c < 5) then
				Minimap:SetZoom(c + 1)
			elseif(z < 0 and c > 0) then
				Minimap:SetZoom(c - 1)
			end
		end)
		--
		-- tracking
		--
		MiniMapTrackingBorder:Hide()
		MiniMapTrackingBackground:Hide()
		MiniMapTracking:SetParent(Minimap)
		MiniMapTracking:ClearAllPoints()
		MiniMapTracking:SetPoint("TOPLEFT")
		MiniMapTrackingIcon:SetTexCoord(0.1,0.9,0.1,0.9)
		MiniMapTracking:SetScale(0.8)
		--
		-- battleground
		--
		MiniMapBattlefieldBorder:Hide()
		MiniMapBattlefieldFrame:SetParent(Minimap)
		MiniMapBattlefieldFrame:ClearAllPoints()
		MiniMapBattlefieldFrame:SetPoint("TOPRIGHT", -2, -2)
		--
		-- mail
		--
		MiniMapMailBorder:Hide()
		MiniMapMailFrame:SetParent(Minimap)
		MiniMapMailFrame:ClearAllPoints()
		MiniMapMailFrame:SetPoint"TOP"
		MiniMapMailIcon:SetTexture"Interface\\AddOns\\!LynSettings\\textures\\mail"
		--
		-- mask
		--
		Minimap:SetMaskTexture"Interface\\AddOns\\!LynSettings\\textures\\mask"
		Minimap:SetScale(1)
		
		--
		-- backdrop
		--
		local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
		--Minimap:SetFrameLevel(4)
		--Minimap:SetFrameStrata("MEDIUM")
		--Minimap.SetFrameLevel = function() end
		--Minimap.SetFrameStrata = function() end
		Minimap:SetBackdrop({
			bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
			edgeFile = "Interface\\AddOns\\!LynSettings\\textures\\minimapborder",
			edgeSize = 9, 
--			insets = { left = -2, right = -2.5, top = -1.5, bottom = -2.5 }
			insets = { left = -2, right = -2, top = -2, bottom = -1.5 }
		})
		Minimap:SetBackdropBorderColor(0, 0, 0, 1)
		Minimap:SetBackdropColor(color.r, color.g, color.b, 1)

		--
		-- glossy effect
		--
		local t = Minimap:CreateTexture(nil,"Overlay")
		t:SetTexture("Interface\\AddOns\\!LynSettings\\textures\\minimap")
		t:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0)
		t:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 0, 0)
		t:SetVertexColor(0.85, 0.85, 0.85)

		--
		-- hide all frames of the table 'frames'
		-- 
		for _, frame in pairs(frames) do
			frame:Hide()
			frame.Show = function() end
		end
		--
		-- move the minimap
		--
		Minimap:ClearAllPoints()
		Minimap:SetScale(0.99) -- somehow I got a bug on scale 1 that I can't fix.
		Minimap:SetClampedToScreen()
		Minimap:SetPoint("TOPRIGHT", UIParent, -30, -39)
		MinimapCluster:EnableMouse(false)
	end
end) 
addon:RegisterEvent"PLAYER_LOGIN"
