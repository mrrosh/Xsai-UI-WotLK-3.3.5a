local mod = DBM:NewMod("ConstructorAndController", "DBM-Party-WotLK", 10)
local L = mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 598 $"):sub(12, -3))
mod:SetCreatureID(24201)
mod:SetZone()

mod:RegisterCombat("combat", 24000, 24201)

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_REMOVED",
	"SPELL_SUMMON"
)

local warningEnfeeble	= mod:NewAnnounce("WarningEnfeeble", 2, 43650)
local warningSummon	= mod:NewAnnounce("WarningSummon", 3, 52611)
local timerEnfeeble	= mod:NewTimer(6, "TimerEnfeeble", 43650)

function mod:SPELL_AURA_APPLIED(args)
	if args.spellId == 43650 then
		warningEnfeeble:Show(args.spellName, args.destName)
		timerEnfeeble:Start(args.spellName, args.destName)
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args.spellId == 43650 then
		timerEnfeeble:Cancel(args.spellName, args.destName)
	end
end

function mod:SPELL_SUMMON(args)
	if args.spellId == 52611 then
		warningSummon:Show(args.spellName)
	end
end