-- Slash Commands
function Geist_ChatCommandHandler(msg)
	if ((msg) and (strlen(msg) > 0 )) then
		msg = string.lower(msg)
	else
		msg = ""
	end

	local i, j, cmd, param = string.find(msg, "^([^ ]+) (.+)$")
	if (not cmd) then
		cmd = msg
	end

	if (not cmd) then
		cmd = ""
	end

	if (not param) then
		param = ""
	end

	if (cmd == GEIST_LOCAL_CMD["SCALE"]) then
		if (param == GEIST_LOCAL_CMD["RESET"]) then
			Geist_ResetScale()
			Geist_Print(GEIST_LOCAL_CHAT["SCALERESET"])
		elseif tonumber(param) and (tonumber(param) >= 0.5) and (tonumber(param) <=1.5) then
			Geist_SetScale(tonumber(param))
			Geist_Print(GEIST_LOCAL_CHAT["SCALESET"]..tonumber(param)..".")
		else
			Geist_Print(GEIST_LOCAL_CHAT["SCALEAT"]..Geist["Scale"]..".")
		end

	elseif (cmd == GEIST_LOCAL_CMD["GUIDE"]) then
		if Geist["Guide"] then
			Geist["Guide"] = nil
			Geist_Print(GEIST_LOCAL_CHAT["IDGUIDE"]..GEIST_LOCAL_CMD["OFF"]..".")
		else
			Geist["Guide"] = 1
			Geist_Print(GEIST_LOCAL_CHAT["IDGUIDE"]..GEIST_LOCAL_CMD["ON"]..".")
		end

	elseif (cmd == GEIST_LOCAL_CMD["BUTTON"]) then
		if tonumber(param) and (tonumber(param) >= 1) and (tonumber(param) <= 25) then
			Geist["Buttons"] = floor(tonumber(param))
			Geist_Print(GEIST_LOCAL_CHAT["NUMBUTTONSET"]..floor(tonumber(param))..".")
		else
			Geist_Print(GEIST_LOCAL_CHAT["NUMBUTTONAT"]..Geist["Buttons"]..".")
		end

	elseif string.find(cmd, GEIST_LOCAL_CMD["ASSIGN"]) then
		local i, j, num = string.find(cmd, "([%d*]+)")
		if tonumber(num) and (tonumber(num) >= 1) and (tonumber(num) <= 25) then
			if tonumber(param) and (tonumber(param) >= 1) and (tonumber(param) <= 120) then
				Geist["ButtonIDs"][floor(tonumber(num))] = floor(tonumber(param))
				Geist_Print(GEIST_LOCAL_CHAT["BUTTON"]..floor(tonumber(num))..GEIST_LOCAL_CHAT["SETBUTTONID"]..floor(tonumber(param))..".")
			else
				Geist_Print(GEIST_LOCAL_CHAT["BUTTON"]..floor(tonumber(num))..GEIST_LOCAL_CHAT["SETBUTTONID"]..Geist["ButtonIDs"][floor(tonumber(num))]..".")
			end
		else
			Geist_HelpPrint()
		end
	else
		Geist_HelpPrint()
	end
end

function Geist_HelpPrint()
	for i = 0, table.getn(GEIST_CHATUSAGE) do
		Geist_Print(GEIST_CHATUSAGE[i])
	end
end
