-- Created by Biggulina @ Teldrassil EU

local Main = CreateFrame("Frame")
local Info = Main:CreateFontString(nil,"OVERLAY")
local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))] 
local Start = 0
local Delay = 1
local Damage = 0
local Sammeln = 1
Info:SetFont("Interface\\Addons\\bDPS\\Fonts\\skurri.ttf", 15, "OUTLINE")
Info:SetShadowOffset(1,-1)
Info:SetTextColor(Color.r, Color.g, Color.b)
Info:SetPoint("BOTTOM", UIParent, "BOTTOM", -193, 20)
local Anfang = nil
Main:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
Main:RegisterEvent("PLAYER_REGEN_ENABLED")
Main:RegisterEvent("PLAYER_REGEN_DISABLED")
Main:SetScript("OnEvent", function(self, event, ...)


if ( event == "PLAYER_REGEN_ENABLED" ) then
Sammeln = 0
Anfang = nil
Ende = nil
Damage = 0
end
if ( event == "PLAYER_REGEN_DISABLED" ) then
Sammeln = 1
Anfang = nil
Ende = nil
Damage = 0
end

            if ( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then

if (Sammeln == 1) then
    if ( arg2 == "SPELL_DAMAGE" or arg2 == "SPELL_PERIODIC_DAMAGE" ) then
local time, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10 = select(1, ...)
if ( sourceName == UnitName("player") ) then
Ende = GetTime()
if ( Anfang == nil ) then
Anfang = GetTime()
else
Damage = Damage+arg4
                       end
end

    end

end
                        end

end)

Main:SetScript("OnUpdate", function(self, elapsed)
Start = Start + elapsed
if (Start > Delay) then
Start = 0
     if (Anfang ~= nil) then
          if ((Ende - Anfang) > 1) then
duration = Ende - Anfang
Info:SetText("|c00ffffff"..floor(Damage/duration).."|r".." DPS")
         end
else
Info:SetText(" ")
      end
end
end)