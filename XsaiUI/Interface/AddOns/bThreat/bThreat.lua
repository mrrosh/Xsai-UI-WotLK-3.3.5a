local Fontsize,XPos,YPos,Outline,pthreatpct,Main,Aggro,Mobname,Coloring        

                             ------------------------
                             -- Copyright by --
                             --- Biggulina at ---
                             -- Teldrassil EU --  
                             -------------------------   

---------------------------------------------------------------------------------
-----------------------------CONFIG----------------------------------------
Fontsize = 20
YPos = -50
XPos = 0
Outline = 1              -- 1 for Outline // 0 for no Outline              
Mobname = 1         -- 1 for [77%] [Kel'Thuzad] // 0 for [77%]    
Coloring = 1
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- DO NOT TOUCH the lines below, every needed config, 
-- is above. Also don't change the folders name cuz
-- the font won't be fit then.
-- To change the font, replace skurri.ttf in /fonts with
-- your font and relogg.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

Main = CreateFrame("Frame", "Main", UIParent)
Aggro = Main:CreateFontString(nil,"OVERLAY")
Aggro:SetPoint("CENTER", UIParent, "CENTER", XPos, YPos)                                                                                                                
Aggro:SetShadowOffset(1,-1)                                                                                                                                                                         
    if ( Outline == 1 ) then
    Aggro:SetFont("Interface\\Addons\\bThreat\\Fonts\\skurri.ttf", Fontsize, "OUTLINE")
    else
    Aggro:SetFont("Interface\\Addons\\bThreat\\Fonts\\skurri.ttf", Fontsize)
    end
   function AggroHide()
   Aggro:SetText(" ")
   end
   function AggroUpdate()
   _, _, pthreatpct  = UnitDetailedThreatSituation("player", "playertarget")
               if ( pthreatpct ~= nil ) then                                                                                                                                                                  
                  if ( Mobname == 1 ) then                                                                                                                                                                
                  Aggro:SetText("|c00ffffff".."[".."|r"..floor(pthreatpct).."%".."|c00ffffff".."] ["..UnitName("playertarget").."|r")
                  else
                  Aggro:SetText("|c00ffffff".."[".."|r"..floor(pthreatpct).."%".."|c00ffffff".."]")
                  end  
           if ( Coloring == 1 ) then
                     if ( floor(pthreatpct) >= 100 ) then
                     Aggro:SetTextColor(1,0,0,1)
                     elseif ( floor(pthreatpct) < 100 and floor(pthreatpct) >= 90) then
                     Aggro:SetTextColor(0.9,0.1,0,1)
                     elseif ( floor(pthreatpct) < 90 and floor(pthreatpct) >= 80) then
                     Aggro:SetTextColor(0.8,0.2,0,1)
                     elseif ( floor(pthreatpct) < 80 and floor(pthreatpct) >= 70) then
                     Aggro:SetTextColor(0.7,0.3,0,1)
                     elseif ( floor(pthreatpct) < 70 and floor(pthreatpct) >= 60) then
                     Aggro:SetTextColor(0.6,0.4,0,1)
                     elseif ( floor(pthreatpct) < 60 and floor(pthreatpct) >= 50) then
                     Aggro:SetTextColor(0.5,0.5,0,1)
                     elseif ( floor(pthreatpct) < 50 and floor(pthreatpct) >= 40) then
                     Aggro:SetTextColor(0.4,0.6,0,1)
                     elseif ( floor(pthreatpct) < 40 and floor(pthreatpct) >= 30) then
                     Aggro:SetTextColor(0.3,0.7,0,1)
                     elseif ( floor(pthreatpct) < 30 and floor(pthreatpct) >= 20) then
                     Aggro:SetTextColor(0.2,0.8,0,1)
                     elseif ( floor(pthreatpct) < 20 and floor(pthreatpct) >= 10) then
                     Aggro:SetTextColor(0.1,0.9,0,1)
                     elseif ( floor(pthreatpct) < 10 and floor(pthreatpct) >= 1) then
                     Aggro:SetTextColor(0,1,0,1)
                     end
           end
               else
               Aggro:SetText(" ")
               end
   end
Main:RegisterEvent("UNIT_THREAT_LIST_UPDATE")                                                                                                                                               
Main:RegisterEvent("PLAYER_REGEN_ENABLED")                                                                                                                                                 
Main:RegisterEvent("PLAYER_TARGET_CHANGED")                                                                                                                                               
Main:SetScript("OnEvent", function(self, event, ...)
      if ( event == "UNIT_THREAT_LIST_UPDATE" or event == "PLAYER_TARGET_CHANGED") then 
      AggroUpdate()                                                                                                                                                                                                        
      end
      if ( event == "PLAYER_REGEN_ENABLED" ) then 
      AggroHide()                                                                                                                                                                                                              
      end
end)






