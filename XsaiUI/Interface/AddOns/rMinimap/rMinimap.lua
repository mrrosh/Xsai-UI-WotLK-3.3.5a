  
  local rm_player_name, _ = UnitName("player")
  local _, rm_player_class = UnitClass("player")
  
GameTimeFrame:SetWidth(19)
GameTimeFrame:SetHeight(19)
GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", Minimap, -6, -6)
GameTimeFrame:SetHitRectInsets(0, 0, 0, 0)
GameTimeFrame:GetRegions():Hide()

local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local text = select(5, GameTimeFrame:GetRegions())
text:SetFont("Fonts\\ARIALN.ttf", 15, "OUTLINE")
text:SetTextColor(color.r, color.g, color.b)
text:SetShadowOffset(0, 0)

for i = 6, 8 do
    select(i, GameTimeFrame:GetRegions()):SetTexture(nil)
end
  
  
   
  -----------------------------
  -- configure map style here --
  -----------------------------

  -- map_style
  -- 0 = diablo3
  -- 1 = futuristic orb rotating
  -- 2 = square runits style
  local map_style
  if rm_player_name == "Astone" and rm_player_class == "WARLOCK" then
    map_style = 2
  else
    map_style = 2
  end

  -- map scale
  local mapscale = 0.82
  
  -- size of icons (tracking icon for example)
  local iconsize = 20

  -- position map and symbols here
  local map_positions
  if map_style == 2 then
    map_positions = {
      position = {
        [1] = { frame = "Minimap",                  anchor1 = "BOTTOMLEFT",     anchor2 = "TOPRIGHT",     anchorframe = "UIParent",   posx = -161,   posy = -181 },
        [2] = { frame = "MiniMapTracking",          anchor1 = "TOPLEFT",      anchor2 = "TOPLEFT",      anchorframe = "Minimap",    posx = 5,     posy = -5 },
        [3] = { frame = "MiniMapMailFrame",         anchor1 = "BOTTOMRIGHT",  anchor2 = "BOTTOMRIGHT",  anchorframe = "Minimap",    posx = -5,    posy = 5 },
        [4] = { frame = "MiniMapBattlefieldFrame",  anchor1 = "BOTTOMLEFT",   anchor2 = "BOTTOMLEFT",   anchorframe = "Minimap",    posx = 5,     posy = 5 },
        [5] = { frame = "GameTimeFrame",            anchor1 = "TOPRIGHT",     anchor2 = "TOPRIGHT",     anchorframe = "Minimap",    posx = -5,    posy = -5 },
        [6] = { frame = "TimeManagerClockButton",   anchor1 = "BOTTOM",       anchor2 = "BOTTOM",       anchorframe = "Minimap",    posx = 0,    posy = -2 },
      },
    }
  else
    map_positions = {
      position = {
        [1] = { frame = "Minimap",                  anchor1 = "TOPRIGHT",     anchor2 = "TOPRIGHT",   anchorframe = "UIParent",   posx = -30,   posy = -10 },
        [2] = { frame = "MiniMapTracking",          anchor1 = "TOP",          anchor2 = "BOTTOM",     anchorframe = "Minimap",    posx = 0,     posy = -20 },
        [3] = { frame = "MiniMapMailFrame",         anchor1 = "TOP",          anchor2 = "BOTTOM",     anchorframe = "Minimap",    posx = 50,    posy = -20 },
        [4] = { frame = "MiniMapBattlefieldFrame",  anchor1 = "TOP",          anchor2 = "BOTTOM",     anchorframe = "Minimap",    posx = -25,   posy = -20 },
        [5] = { frame = "GameTimeFrame",            anchor1 = "TOP",          anchor2 = "BOTTOM",     anchorframe = "Minimap",    posx = 25,    posy = -20 },
        [6] = { frame = "TimeManagerClockButton",   anchor1 = "BOTTOM",       anchor2 = "BOTTOM",     anchorframe = "Minimap",    posx = 0,    posy = 0 },
      },
    }
  end



  ----------------
  -- end config --
  ----------------
  
  local a = CreateFrame("Frame", nil, UIParent)
  local _G = getfenv(0)
  local dummy = function() end    
  
  a:RegisterEvent("PLAYER_LOGIN")
  
  a:SetScript("OnEvent", function (self,event,arg1)
    if(event=="PLAYER_LOGIN") then
      
      LoadAddOn("Blizzard_TimeManager")
      
      a:showhidestuff()

      if map_style == 0 then
        a:dostuff0()
      elseif map_style == 1 then
        a:dostuff1()
        a:rotateme()
      elseif map_style == 2 then
        a:dostuff2()
      end
      --zoomscript taken from pminimap by p3lim
      --http://www.wowinterface.com/downloads/info8389-pMinimap.html
      a:zoomscript()
      
      for index,value in ipairs(map_positions.position) do 
        local var = map_positions.position[index]
        a:positionme(var.frame,var.anchor1,var.anchorframe,var.anchor2,var.posx,var.posy)
      end

      Minimap:SetScale(mapscale)
    end
  end)  
  
  function a:dostuff0()
    local t = Minimap:CreateTexture(nil,"ARTWORK")
    t:SetTexture("Interface\\AddOns\\rTextures\\d3_map2")
    local d3mapscale = 1.3
    t:SetPoint("CENTER", Minimap, "CENTER", -2*d3mapscale, -13*d3mapscale)
    t:SetWidth(Minimap:GetHeight()*2*d3mapscale)
    t:SetHeight(Minimap:GetHeight()*d3mapscale)
    
    local t2 = Minimap:CreateTexture(nil,"OVERLAY")
    t2:SetTexture("Interface\\AddOns\\oUF_D3Orbs\\textures\\orb_gloss")
    t2:SetPoint("CENTER",0,0)
    t2:SetWidth(Minimap:GetHeight()*1.1)
    t2:SetHeight(Minimap:GetHeight()*1.1)
    t2:SetBlendMode("BLEND")
  end
  
  function a:dostuff2()
    Minimap:SetMaskTexture("Interface\\AddOns\\rMinimap\\mask")
    local t = Minimap:CreateTexture(nil,"Overlay")
    local c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
    t:SetTexture("Interface\\AddOns\\rMinimap\\minigloss")
    t:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -1, 1)
    t:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 1, -1)
    t:SetVertexColor(c.r, c.g, c.b)
  end
  
  function a:dostuff1()
    --nothing
  end
  
  function a:rotateme()
  
    --DEFAULT_CHAT_FRAME:AddMessage("ping")
    
    local r2, r42, realUpdate, colorTable = math.sqrt(0.5^2+0.5^2), math.sqrt(42), true, {[4]=0.9};
    
    local f = CreateFrame("Frame",nil,Minimap)
    f:SetWidth(194)
    f:SetHeight(194)
    f:SetPoint("CENTER",0,0)
    f:Show()
    
    local t = f:CreateTexture(nil,"BACKGROUND")
    t:SetTexture("Interface\\AddOns\\rTextures\\map_texture.tga")
    t:SetAllPoints(f)
    t:SetVertexColor(0.8,0.8,0.8,1)
    
    local totalElapsed = 0
    local degrees = 0
    
    local function OnUpdateFunc(self, elapsed)
      totalElapsed = totalElapsed + elapsed
      local update_timer = 1
      if (totalElapsed < update_timer) then 
        return 
      else
        totalElapsed = totalElapsed - floor(totalElapsed)
        
        t:SetTexCoord(
        0.5+r2*cos(degrees+135), 0.5+r2*sin(degrees+135),
        0.5+r2*cos(degrees-135), 0.5+r2*sin(degrees-135),
        0.5+r2*cos(degrees+45), 0.5+r2*sin(degrees+45),
        0.5+r2*cos(degrees-45), 0.5+r2*sin(degrees-45)
        )
        
        degrees = degrees+1
        
        if degrees > 360 then
          degrees = 0
        end

      end
    end
    
    f:SetScript("OnUpdate", OnUpdateFunc)
    
  end
  
  function a:showhidestuff()
    
    if TimeManagerClockButton then
      local timerframe = _G["TimeManagerClockButton"]
      local region1 = timerframe:GetRegions()
      region1:Hide()
      TimeManagerClockTicker:SetFont(NAMEPLATE_FONT, 14, "THINOUTLINE")

    end
  
    MiniMapWorldMapButton:Hide()
    
    MiniMapTrackingBackground:Hide()
    MiniMapTrackingButtonBorder:Hide()
    MiniMapTrackingButton:SetHighlightTexture("")
    
    MiniMapTracking:SetWidth(iconsize)
    MiniMapTracking:SetHeight(iconsize)
    
    MiniMapTrackingButton:SetAllPoints(MiniMapTracking)
    
    local tftb = MiniMapTracking:CreateTexture(nil,"BACKGROUND")
    tftb:SetTexture("Interface\\AddOns\\rMinimap\\mask")
    tftb:SetVertexColor(0,0,0,1)
    tftb:SetPoint("TOPLEFT", MiniMapTracking, "TOPLEFT", 1, -1)
    tftb:SetPoint("BOTTOMRIGHT", MiniMapTracking, "BOTTOMRIGHT", -1, 1)
        
    local tft = MiniMapTracking:CreateTexture(nil,"ARTWORK")
    tft:SetTexture("Interface\\AddOns\\rMinimap\\gloss")
    tft:SetPoint("TOPLEFT", MiniMapTracking, "TOPLEFT", -0, 0)
    tft:SetPoint("BOTTOMRIGHT", MiniMapTracking, "BOTTOMRIGHT", 0, -0)
    
    MiniMapTrackingIcon:ClearAllPoints()
    MiniMapTrackingIcon:SetPoint("TOPLEFT", MiniMapTracking, "TOPLEFT", 2, -2)
    MiniMapTrackingIcon:SetPoint("BOTTOMRIGHT", MiniMapTracking, "BOTTOMRIGHT", -2, 2)
    MiniMapTrackingIcon.SetPoint = dummy
    MiniMapTrackingIcon:SetTexCoord(0.07,0.93,0.07,0.93)
    
    MinimapZoomOut:Hide()
    MinimapZoomIn:Hide()
    MiniMapTracking:Hide()

    MiniMapMailBorder:Hide()
    MiniMapMailFrame:SetWidth(iconsize)
    MiniMapMailFrame:SetHeight(iconsize)
    
    local mft = MiniMapMailFrame:CreateTexture(nil,"ARTWORK")
    mft:SetTexture("Interface\\AddOns\\rMinimap\\gloss")
    mft:SetPoint("TOPLEFT", MiniMapMailFrame, "TOPLEFT", -0, 0)
    mft:SetPoint("BOTTOMRIGHT", MiniMapMailFrame, "BOTTOMRIGHT", 0, -0)
    
    MiniMapMailIcon:ClearAllPoints()
    MiniMapMailIcon:SetPoint("TOPLEFT", MiniMapMailFrame, "TOPLEFT", 1, -1)
    MiniMapMailIcon:SetPoint("BOTTOMRIGHT", MiniMapMailFrame, "BOTTOMRIGHT", -1, 1)
    MiniMapMailIcon:SetTexCoord(0.07,0.93,0.07,1)
    MiniMapMailIcon:SetTexture("Interface\\AddOns\\rMinimap\\mail")
   
    
    MiniMapBattlefieldFrame:SetWidth(iconsize)
    MiniMapBattlefieldFrame:SetHeight(iconsize)
    
    MiniMapBattlefieldBorder:Hide()
    
    local bftb = MiniMapBattlefieldFrame:CreateTexture(nil,"BACKGROUND")
    bftb:SetTexture("Interface\\AddOns\\rMinimap\\mask")
    bftb:SetVertexColor(0,0,0,1)
    bftb:SetPoint("TOPLEFT", MiniMapBattlefieldFrame, "TOPLEFT", 1, -1)
    bftb:SetPoint("BOTTOMRIGHT", MiniMapBattlefieldFrame, "BOTTOMRIGHT", -1, 1)
    
    local bft = MiniMapBattlefieldFrame:CreateTexture(nil,"ARTWORK")
    bft:SetTexture("Interface\\AddOns\\rMinimap\\gloss")
    bft:SetPoint("TOPLEFT", MiniMapBattlefieldFrame, "TOPLEFT", -0, 0)
    bft:SetPoint("BOTTOMRIGHT", MiniMapBattlefieldFrame, "BOTTOMRIGHT", 0, -0)
    
    MiniMapBattlefieldIcon:ClearAllPoints()
    MiniMapBattlefieldIcon:SetAllPoints(MiniMapBattlefieldFrame)    
    MiniMapBattlefieldIcon:SetTexCoord(0.07,0.93,0.07,0.93)
    
    MinimapToggleButton:Hide()
    MinimapZoneTextButton:Hide()
    MinimapBorderTop:Hide()
    MinimapBorder:Hide()
    MinimapNorthTag:Hide()
    
    --movie recording >_<
    --doesn't work on pc
    --MiniMapRecordingButton:Show()
    --MiniMapRecordingButton.hide = dummy
    


    
    
    MiniMapMeetingStoneFrame:Hide()

  end
  
  function a:positionme(f,a1,af,a2,px,py)
    f = _G[f]
    af = _G[af]
    f:ClearAllPoints()
    f:SetPoint(a1,af,a2,px,py)
    f.SetPoint = dummy
  end
  
  function a:zoomscript()
    Minimap:EnableMouseWheel()
    Minimap:SetScript("OnMouseWheel", function(self, direction)
      if(direction > 0) then
        Minimap_ZoomIn()
      else
        Minimap_ZoomOut()
      end
    end)
  end