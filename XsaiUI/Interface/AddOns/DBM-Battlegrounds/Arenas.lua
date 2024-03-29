-- Areanas mod v3.0
-- rewrite by Tandanu
--

local Arenas = DBM:NewMod("Arenas", "DBM-Battlegrounds")
local L = Arenas:GetLocalizedStrings()

Arenas:RemoveOption("HealthFrame")

Arenas:RegisterEvents("CHAT_MSG_BG_SYSTEM_NEUTRAL")

local timerStart	= Arenas:NewTimer(62, "TimerStart")

function Arenas:CHAT_MSG_BG_SYSTEM_NEUTRAL(args)
	if not IsActiveBattlefieldArena() then return end
	if args == L.Start60 then
		timerStart:Start()
	elseif args == L.Start30 then
		if timerStart:GetTime() == 0 then
			timerStart:Start()
		end
		timerStart:Update(31, 62)
	elseif args == L.Start15 then
		if timerStart:GetTime() == 0 then
			timerStart:Start()
		end
		timerStart:Update(46, 62)
	end
end
