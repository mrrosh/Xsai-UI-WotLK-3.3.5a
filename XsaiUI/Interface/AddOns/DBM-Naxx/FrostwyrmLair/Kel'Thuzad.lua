local mod = DBM:NewMod("Kel'Thuzad", "DBM-Naxx", 5)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 640 $"):sub(12, -3))
mod:SetCreatureID(15990)
mod:SetZone()
mod:SetMinCombatTime(60)

mod:RegisterCombat("yell", L.Yell)

mod:EnableModel()

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_SUCCESS"
)

local warnPhase2			= mod:NewAnnounce("WarningPhase2", 3)
local warnBlastTargets		= mod:NewAnnounce("WarningBlastTargets", 2)
local warnFissure			= mod:NewAnnounce("WarningFissure", 3)
local warnMana				= mod:NewAnnounce("WarningMana", 2)

local timerPhase2			= mod:NewTimer(225, "TimerPhase2")


function mod:OnCombatStart(delay)
	timerPhase2:Start()
	warnPhase2:Schedule(225)
end

local frostBlastTargets = {}
function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 27808 then
		table.insert(frostBlastTargets, args.destName)
		self:UnscheduleMethod("AnnounceBlastTargets")
		self:ScheduleMethod(1/3, "AnnounceBlastTargets")
	elseif args.spellId == 27819 then
		warnMana:Show(args.destName)
		self:SetIcon(args.destName, 8, 5.5)
	end
end

function mod:AnnounceBlastTargets()
	warnBlastTargets:Show(table.concat(frostBlastTargets, "< >"))
	for i = #frostBlastTargets, 1, -1 do
		self:SetIcon(frostBlastTargets[i], 9 - i, 4.5) 
		frostBlastTargets[i] = nil
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 27810 then
		warnFissure:Show()
	end
end

