--Created by Biggulina @ TeldrassilEU
--Sorry for bad english
--Variables (No need to change!)
local Main = CreateFrame("Frame", "Main", UIParent)
local Clock = Main:CreateFontString(nil,"OVERLAY")
local Info = Main:CreateFontString(nil,"OVERLAY")
local leer = "   "
local Color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
local Start = 0
local Delay = 1

local Time, spellDmg, spellCrit, theCritChance, spellHaste, spellHit

-- NO need to change!
Main:EnableMouse(false)
Main:SetWidth(100)
Main:SetHeight(10)
Main:ClearAllPoints()
Main:SetPoint("BOTTOMLEFT", "UIParent")
Clock:SetFont("Interface\\Addons\\BBar\\Fonts\\skurri.ttf", 1, "OUTLINE")          
Clock:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", -50, 5)
Clock:SetShadowOffset(1,-1)
Clock:SetTextColor(Color.r, Color.g, Color.b)
Info:SetFont("Interface\\Addons\\BBar\\Fonts\\skurri.ttf", 10, "OUTLINE")          
Info:SetPoint("BOTTOMLEFT", Clock, "BOTTOMRIGHT", 1430, 2)
Info:SetShadowOffset(1,-1)
Info:SetTextColor(Color.r, Color.g, Color.b)
Info:SetJustifyH("RIGHT")
Main:SetScript("OnUpdate", function(self, elapsed)
Start = Start + elapsed
if (Start > Delay) then
Start = 0
Time ="|c00ffffff"..date("%H:%M").."|r".." Uhr."
Clock:SetText(Time)
spellDmg = GetSpellBonusDamage(3);
theCritChance = GetSpellCritChance(3)
spellCrit = theCritChance
spellHit = floor(GetCombatRating(6)/26)
spellHaste = GetCombatRating(19)/32
spellCrit = format("%.2f%%", spellCrit);
spellHaste = format("%.2f%%", spellHaste);
Info:SetText("|c00ffffff"..spellDmg.."|r".." Damage"..leer.."|c00ffffff"..spellCrit.."|r".." Crit"..leer.."|c00ffffff"..spellHaste.."|r".." Haste"..leer.."|c00ffffff"..spellHit.."%".."|r".." Hit")
end
end)