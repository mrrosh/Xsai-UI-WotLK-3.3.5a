
--
-- auto accept invites from friends and guild
--
addon = CreateFrame"Frame"
addon:RegisterEvent("PARTY_INVITE_REQUEST")
local function IsFriend(name)
	for i=1,GetNumFriends() do if GetFriendInfo(i) == name then return true end end
	if IsInGuild() then for i=1, GetNumGuildMembers() do if GetGuildRosterInfo(i) == name then return true end end end
end
addon:SetScript("OnEvent", function(frame, myshit, name)
	if IsFriend(name) then
		AcceptGroup()
		for i=1, STATICPOPUP_NUMDIALOGS, 1 do
			local frame = getglobal("StaticPopup"..i)
			if frame:IsVisible() and frame.which == "PARTY_INVITE" then frame:Hide() end
		end
	else SendWho(string.join("", "n-\"", name, "\"")) end
end)

--
-- auto declines duels from non-friends/guild members
-- original code of zimran's zimDecline
--
local function isFriend(name)
	for i = 1, GetNumFriends() do
		if GetFriendInfo(i) == name then return true end
	end
	if IsInGuild() then
		GuildRoster()
		for i = 1, GetNumGuildMembers() do
			if GetGuildRosterInfo(i) == name then return true end
		end
	end
end
local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("DUEL_REQUESTED")
f:SetScript ("OnEvent", function(_, _, name)
	if (not isFriend(name)) then
		StaticPopup_Hide("DUEL_REQUESTED")
		CancelDuel()
	end
end)

--
-- auto declines guild invites from non-friends/guild members
-- original code of zimran's zimDecline
--
--[[
local function isFriend(name)
	for i = 1, GetNumFriends() do
		if GetFriendInfo(i) == name then return true end
	end
end
local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("GUILD_INVITE_REQUEST")
f:SetScript ("OnEvent", function(_, _, name)
	if (not isFriend(name)) then
		StaticPopup_Hide("GUILD_INVITE")
		DeclineGuild()
	end
end)
--]]