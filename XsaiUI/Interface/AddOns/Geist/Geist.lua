-- Geist, by Cidrei (Jazrei of Zangarmarsh-US)

-- OnEvent
function Geist_OnEvent()
	if event == "ADDON_LOADED" and arg1 == "Geist" then
		SLASH_GEIST1 = "/geist"
		SLASH_GEIST2 = "/gbm" -- Legacy commands ftw.
		SlashCmdList["GEIST"] = Geist_ChatCommandHandler

		Geist_SavedVars()
		Geist_Create()
	end
end

-- Saved Variables
function Geist_SavedVars()
	if Geist == nil then
		Geist = {}
	end

	if Geist["Scale"] == nil then
		Geist_ResetScale()
	end

	if Geist["ButtonIDs"] == nil then
		Geist["ButtonIDs"] = {}
		local _, class = UnitClass("player")
		
		if class == "DRUID" then
			Geist["ButtonIDs"] = Geist_ButtonIDs["DRUID"]
		elseif class == "WARRIOR" then
			Geist["ButtonIDs"] = Geist_ButtonIDs["WARRIOR"]
		else
			Geist["ButtonIDs"] = Geist_ButtonIDs["DEFAULT"]
		end
	end

	if Geist["Buttons"] == nil then
		Geist["Buttons"] = 25
	end
end

-- Chat Output
function Geist_Print(msg) 
	if not DEFAULT_CHAT_FRAME then
		return
	end

	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

-- Scale
function Geist_SetScale(scale)
	Geist["Scale"] = scale
	if GeistHeader then
		GeistHeader:SetScale(Geist["Scale"])
	else
		return
	end
end

function Geist_ResetScale()
	local use_scale = GetCVar("useUiScale")
	local ui_scale = GetCVar("uiscale")

	if(use_scale=="0") then	
		Geist_SetScale(1)
	else
		Geist_SetScale(GetCVar("uiscale"))
	end
end

-- Time to fire it all up.
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", Geist_OnEvent)
