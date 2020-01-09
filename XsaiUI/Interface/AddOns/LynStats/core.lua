--[[
	VERSION 1.6.2 by Lyn
	CREDITS: evl and his awesome evl_clock to get lynstats "ace-less" 
--]]
local addon = CreateFrame("Button", "LynStats", UIParent)

--
-- the x-files aka. configuration
--
-- frame
local frame_anchor = "BOTTOMLEFT" -- LEFT, TOPLEFT, TOP, TOPRIGHT, RIGHT, CENTER, BOTTOMRIGHT, BOTTOM, BOTTOMLEFT
local pos_x = 4
local pos_y = 4
-- text
local text_anchor = "TOPLEFT"
local font = "Interface\\AddOns\\!LynSettings\\fonts\\font2.ttf"
local size = 10
local addonlist = 50 -- how much addons should be shown?
local classcolors = true -- true or false
local shadow = true -- true / false
local outline = true -- true / false
local time24 = true -- true: 24h / false: 12h
-- tooltip
local tip_anchor = "BOTTOMRIGHT"
local tip_x = -90
local tip_y = 90


-- reinforcements!
local color, mail, hasmail, ticktack, lag, fps, ep, xp_cur, xp_max, text, blizz, memory, entry, i, nr, xp_rest, ep, before, after

if classcolors == true then
	color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
else
	color = { r=0, g=0.8, b=1 } -- own textcolor
end

-- format memory stuff
local memformat = function(number)
	if number > 1024 then
		return string.format("%.2f mb", (number / 1024))
	else
		return string.format("%.1f kb", floor(number))
	end
end

-- garbage
-- inspired by naevx, thanks.
local cleargarbage = function()
	UpdateAddOnMemoryUsage()
	before = gcinfo()
	collectgarbage()
	UpdateAddOnMemoryUsage()
	after = gcinfo()
	ChatFrame1:AddMessage("|c0000ccffCleaned:|r "..memformat(before-after))
end

-- ordering
local addoncompare = function(a, b)
	return a.memory > b.memory
end

-- the allmighty
function addon:new()
	text = self:CreateFontString(nil, "OVERLAY")
	if outline == true then
		text:SetFont(font, size, "OUTLINE")
	else
		text:SetFont(font, size, nil)
	end
	if shadow == true then
		text:SetShadowOffset(1,-1)
	end
	text:SetPoint(text_anchor, self)
	text:SetTextColor(color.r, color.g, color.b)

	self:SetPoint(frame_anchor, UIParent, frame_anchor, pos_x, pos_y)
	self:SetWidth(50)
	self:SetHeight(13)
	
	self:SetScript("OnUpdate", self.update)
	self:SetScript("OnEnter", self.enter)
	self:SetScript("OnLeave", function() GameTooltip:Hide() end)
	self:SetScript("OnClick", function() cleargarbage() end)
end

-- update
local last = 0
function addon:update(elapsed)
	last = last + elapsed

	if last > 1 then
		-- mail stuff
		hasmail = (HasNewMail() or 0);
		if hasmail > 0 then
			mail = "|c00FA58F4new!|r  "
		else
			mail = ""
		end
		
		-- date thingy
		if time24 == true then
			ticktack = date("%H.%M")
		else
			ticktack = date("%I.%M")
		end
		ticktack = "|c00ffffff"..ticktack.."|r"
		
		-- fps crap
		fps = GetFramerate()
		fps = "|c00ffffff"..floor(fps).."|rfps  "
		
		-- right down downright + punch
		lag = select(3, GetNetStats())
		lag = "|c00ffffff"..lag.."|rms  "
		
		-- xp stuff
		xp_cur = UnitXP("player")
		xp_max = UnitXPMax("player")
		xp_rest = GetXPExhaustion("player") or nil
		if UnitLevel("player") < MAX_PLAYER_LEVEL then
			ep = "|c00ffffff"..floor(xp_max - xp_cur).."|r"
			if xp_rest ~= nil then	
				ep = ep.."|c0000ccff(R)|rxp  "
			else
				ep = ep.."xp  "
			end
		else
			ep = ""
		end
		
		-- reset timer
		last = 0
		
		-- the magic!
		text:SetText(fps..lag..ep..mail..ticktack)
		self:SetWidth(text:GetStringWidth())
	end
end

--[[
	ADDON LIST
--]]
function addon:enter()
	GameTooltip:SetOwner(self, "ANCHOR_NONE")
	GameTooltip:SetPoint(tip_anchor, UIParent, tip_anchor, tip_x, tip_y)
	blizz = collectgarbage("count")
	addons = {}
	total = 0
	nr = 0
	UpdateAddOnMemoryUsage()
	GameTooltip:AddLine("Top "..addonlist.." AddOns", color.r, color.g, color.b)
	GameTooltip:AddLine(" ")
	for i=1, GetNumAddOns(), 1 do
		if (GetAddOnMemoryUsage(i) > 0 ) then
			memory = GetAddOnMemoryUsage(i)
			entry = {name = GetAddOnInfo(i), memory = memory}
			table.insert(addons, entry)
			total = total + memory
		end
	end
	table.sort(addons, addoncompare)
	for _, entry in pairs(addons) do
		if nr < addonlist then
			GameTooltip:AddDoubleLine(entry.name, memformat(entry.memory), 1, 1, 1, 1, 1, 1)
			nr = nr+1
		end
	end
	GameTooltip:AddLine(" ")
	GameTooltip:AddDoubleLine("Total", memformat(total), color.r, color.g, color.b, color.r, color.g, color.b)
	GameTooltip:AddDoubleLine("Total incl. Blizzard", memformat(blizz), color.r, color.g, color.b, color.r, color.g, color.b)
	GameTooltip:Show()
end

-- and... go!
addon:new()