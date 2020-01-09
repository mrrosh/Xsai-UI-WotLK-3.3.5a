  
  -- CONFIG
  
  local myscale = 0.85
  local petscale = 0.9
  
  -- bar1 and bar2 in 2x6 instead of 1x12
  -- 1 = 2x6
  -- 0 = 1x12
  local button_system = 0
  
  -- on/off
  local hide_shapeshift = 1
  
  -- CONFIG END
  
  
  local f = CreateFrame("Frame","rBars_Button_Holder_Frame",UIParent)
  f:SetWidth(498)
  f:SetHeight(100)
  --f:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 4, right = 4, top = 4, bottom = 4 }});
  f:SetPoint("BOTTOM",0,7)
  f:Show()
  
  local bonushooks = {};
  local i;
  
  BonusActionBarFrame:SetParent(f)

  for i = 1, 12, 1 do
    _G["ActionButton"..i]:SetParent(f);
  end;

  ActionButton1:ClearAllPoints()
  ActionButton1:SetPoint("BOTTOMLEFT",f,"BOTTOMLEFT",0,0);    

  --need to do this since I reanchored the bonusactionbar to f
  BonusActionBarTexture0:Hide()
  BonusActionBarTexture1:Hide()
  
  BonusActionButton1:ClearAllPoints()
  BonusActionButton1:SetPoint("BOTTOMLEFT",f,"BOTTOMLEFT",0,0);
  
  if button_system == 0 then

    MultiBarBottomLeftButton1:ClearAllPoints()  
    MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT",ActionButton1,"TOPLEFT",0,6);

    MultiBarBottomRightButton1:ClearAllPoints()  
    MultiBarBottomRightButton1:SetPoint("BOTTOMLEFT",MultiBarBottomLeftButton1,"TOPLEFT",0,5);
  
  else

    ActionButton7:ClearAllPoints()  
    ActionButton7:SetPoint("BOTTOMLEFT",ActionButton1,"TOPLEFT",0,5);
  
    BonusActionButton7:ClearAllPoints()  
    BonusActionButton7:SetPoint("BOTTOMLEFT",BonusActionButton1,"TOPLEFT",0,5);
    
    MultiBarBottomLeftButton1:ClearAllPoints()  
    MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT",ActionButton6,"BOTTOMRIGHT",5,0);
  
    MultiBarBottomLeftButton7:ClearAllPoints()  
    MultiBarBottomLeftButton7:SetPoint("BOTTOMLEFT",MultiBarBottomLeftButton1,"TOPLEFT",0,5);
  
    MultiBarBottomRightButton1:ClearAllPoints()  
    MultiBarBottomRightButton1:SetPoint("BOTTOMLEFT",ActionButton7,"TOPLEFT",0,15);
  
  end

  -- want to move the keyring / bags / menu and such?!
  -- use this kind of system to do so.
  --CharacterMicroButton:SetParent(f)
  --CharacterMicroButton:ClearAllPoints()
  --CharacterMicroButton:SetPoint("CENTER",UIParent,"CENTER",0, 0)
  --KeyRingButton:SetParent(f)
  --KeyRingButton:ClearAllPoints()
  --KeyRingButton:SetPoint("CENTER",UIParent,"CENTER",0, 50)
  --MainMenuBarBackpackButton:SetParent(f)
  --MainMenuBarBackpackButton:ClearAllPoints()
  --MainMenuBarBackpackButton:SetPoint("CENTER",UIParent,"CENTER",0, 0)

  MultiBarRightButton1:ClearAllPoints()
  MultiBarRightButton1:SetPoint("RIGHT",UIParent,"RIGHT",-30, 190)

  MultiBarLeftButton1:ClearAllPoints()
  MultiBarLeftButton1:SetPoint("TOPLEFT",MultiBarRightButton1,"TOPLEFT",-43, 0)
  
  ShapeshiftBarFrame:SetParent(f)

  local myclass, myengclass = UnitClass("player")
  
  if myengclass == "DEATHKNIGHT" then
    ShapeshiftButton1:ClearAllPoints()
    ShapeshiftButton1:SetPoint("BOTTOMLEFT",MultiBarBottomRightButton10,"TOPLEFT",-5,15);
    ShapeshiftButton1.SetPoint = function() end
  else
    ShapeshiftButton1:ClearAllPoints()
    ShapeshiftButton1:SetPoint("BOTTOMLEFT",MultiBarBottomRightButton1,"TOPLEFT",5,15);
    ShapeshiftButton1.SetPoint = function() end
  end
  
  -- hide the shapeshift 
  if hide_shapeshift == 1 then
    ShapeshiftBarFrame:SetScale(0.001)
    ShapeshiftBarFrame:SetAlpha(0)
  end
  
  PetActionButton1:ClearAllPoints()
  PetActionBarFrame:SetParent(f)
  PetActionButton1:SetPoint("BOTTOMLEFT",MultiBarBottomRightButton1,"TOPLEFT",5,15);

  -- hmmm I don't know if this does anything since the PossesBar becomes the BonusActionBar upon possessing sth
  PossessButton1:ClearAllPoints()
  PossessBarFrame:SetParent(f)
  PossessButton1:SetPoint("BOTTOMLEFT",MultiBarBottomRightButton1,"TOPLEFT",5,15);
  
  --hack to make the mainbar unvisible >_<
  MainMenuBar:SetScale(0.001)
  MainMenuBar:SetAlpha(0)
  VehicleMenuBar:SetScale(0.001)
  VehicleMenuBar:SetAlpha(0)
  
  f:SetScale(myscale)
  BonusActionBarFrame:SetScale(1)
  MultiBarBottomLeft:SetScale(myscale)
  MultiBarBottomRight:SetScale(myscale)
  MultiBarRight:SetScale(myscale)
  MultiBarLeft:SetScale(myscale)
  PetActionBarFrame:SetScale(petscale)
  
  bonushooks["onshow"] = BonusActionBarFrame:GetScript("OnShow");
  bonushooks["onshide"] = BonusActionBarFrame:GetScript("OnHide");
  
  BonusActionBarFrame:SetScript("OnShow", function(self,...)
    if ( bonushooks["onshow"] ) then bonushooks["onshow"](self,...); end;
    for i = 1, 12, 1 do
      _G["ActionButton"..i]:SetAlpha(0);
    end;
  end);
  
  BonusActionBarFrame:SetScript("OnHide", function(self,...)
    if ( bonushooks["onhide"] ) then bonushooks["onhide"](self,...); end;
    for i = 1, 12, 1 do
      _G["ActionButton"..i]:SetAlpha(1);
    end;
  end); 