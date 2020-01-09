--------------------------------------------------------------------------
-- ReURL.lua 
--------------------------------------------------------------------------
--[[
ReURL

author: AnduinLothar KarlKFI@cosmosui.org

-Click chat URL's to insert into the editbox for easy copy.

Change Log:
v2.0
-ChatFrame_OnEvent hook removed in favor of ChatFrame#.AddMessage hooks
v1.0
- Initial Release

]]--

--		For CHAT_MSG types: 
--			arg1 - message 
--			arg2 - player
--			arg3 - language (or nil)
--			arg4 - fancy channel name (5. General - Stormwind City)
--				   *Zone is always current zone even if not the same as the channel name
--			arg5 - Second player name when two users are passed for a CHANNEL_NOTICE_USER (E.G. x kicked y)
--			arg6 - AFK/DND "CHAT_FLAG_"..arg6 flags
--			arg7 - zone ID
--				1 (2^0) - General
--				2 (2^1) - Trade
--				2097152 (2^21) - LocalDefense
--				8388608 (2^23) - LookingForGroup
--				(these numbers are added bitwise)
--			arg8 - channel number (5)
--			arg9 - Full channel name (General - Stormwind City)
--				   *Not from GetChannelList

local SetItemRef_orig = SetItemRef;
function ReURL_SetItemRef(link, text, button)
	if (strsub(link, 1, 3) == "url") then
		local url = strsub(link, 5);
		if (not ChatFrameEditBox:IsShown()) then
			ChatFrame_OpenChat(url, DEFAULT_CHAT_FRAME);
		else
			ChatFrameEditBox:Insert(url);
		end
	else
		SetItemRef_orig(link, text, button);
	end
end
SetItemRef = ReURL_SetItemRef;

function ReURL_AddLinkSyntax(chatstring)
	if (type(chatstring) == "string") then
		local extraspace;
		if (not strfind(chatstring, "^ ")) then
			extraspace = true;
			chatstring = " "..chatstring;
		end
		chatstring = gsub (chatstring, " www%.([_A-Za-z0-9-]+)%.(%S+)%s?", ReURL_Link("www.%1.%2"))
		chatstring = gsub (chatstring, " (%a+)://(%S+)%s?", ReURL_Link("%1://%2"))
		chatstring = gsub (chatstring, " ([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", ReURL_Link("%1@%2%3%4"))
		chatstring = gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?):(%d%d?%d?%d?%d?)%s?", ReURL_Link("%1.%2.%3.%4:%5"))
		chatstring = gsub (chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%s?", ReURL_Link("%1.%2.%3.%4"))
		if (extraspace) then
			chatstring = strsub(chatstring, 2);
		end
	end
	return chatstring
end

REURL_COLOR = "FFFF55";
ReURL_Brackets = nil;
ReUR_CustomColor = true;

function ReURL_Link(url)
	if (ReUR_CustomColor) then
		if (ReURL_Brackets) then
			url = " |cff"..REURL_COLOR.."|Hurl:"..url.."|h["..url.."]|h|r "
		else
			url = " |cff"..REURL_COLOR.."|Hurl:"..url.."|h"..url.."|h|r "
		end
	else
		if (ReURL_Brackets) then
			url = " |Hurl:"..url.."|h["..url.."]|h "
		else
			url = " |Hurl:"..url.."|h"..url.."|h "
		end
	end
	return url
end

--Hook all the AddMessage funcs
for i=1, NUM_CHAT_WINDOWS do
	local frame = getglobal("ChatFrame"..i)
	local addmessage = frame.AddMessage
	frame.AddMessage = function(self, text, ...) addmessage(self, ReURL_AddLinkSyntax(text), ...) end
end

