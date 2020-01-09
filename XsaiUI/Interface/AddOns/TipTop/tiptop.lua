TipTop = CreateFrame("FRAME", nil, GameTooltip)

------------------------------------
--------OTHER LOCALS-------
------------------------------------
local LSM = LibStub("LibSharedMedia-3.0")
local db
local font
local tt = GameTooltip
local irt = ItemRefTooltip
local ttSBar = GameTooltipStatusBar
local ttSBarBG = CreateFrame("Frame", nil, ttSBar)
local ttHealth = ttSBar:CreateFontString("ttHealth", "OVERLAY")
local height = GameTooltipStatusBar:GetHeight()
local color = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
local player = UnitName("player")
local server = GetRealmName()
local target, tclass, tserver, targetLine, _, tree, pnts, spec, points, lasthp, lastmax, textformat
local talents = {}
local raidIcon = tt:CreateTexture(nil, "OVERLAY")
local tooltips = {	GameTooltip,
					ItemRefTooltip,
					ShoppingTooltip1,
					ShoppingTooltip2,
					ShoppingTooltip3}

-------------------------
-----UPVALUES-----
-------------------------
local _G = getfenv(0)
local table_sort = _G.table.sort
local CanInspect = _G.CanInspect
local GetItemInfo = _G.GetItemInfo
local GetItemQualityColor = _G.GetItemQualityColor
local GetRaidTargetIndex = _G.GetRaidTargetIndex
local GetTalentTabInfo = _G.GetTalentTabInfo
local NotifyInspect = _G.NotifyInspect
local SetRaidTargetIconTexture = _G.SetRaidTargetIconTexture
local UnitClass = _G.UnitClass
local UnitClassification = _G.UnitClassification
local UnitExists = _G.UnitExists
local UnitHealth = _G.UnitHealth
local UnitIsAFK = _G.UnitIsAFK
local UnitIsConnected = _G.UnitIsConnected
local UnitIsDead = _G.UnitIsDead
local UnitIsDND = _G.UnitIsDND
local UnitIsTapped = _G.UnitIsTapped
local UnitIsTappedByPlayer = _G.UnitIsTappedByPlayer
local UnitLevel = _G.UnitLevel
local UnitHealthMax = _G.UnitHealthMax
local UnitName = _G.UnitName
local UnitPlayerControlled = _G.UnitPlayerControlled

--------------------------------------
--APPEARANCE/FEATURES--
--------------------------------------

function TipTop:SetUpTips()
	font = LSM:Fetch("font", db.font)
		
	--backgrounds/borders--
	for i = 1, #tooltips do
		tooltips[i]:SetScale(db.scale)
		tooltips[i]:SetBackdrop({
						bgFile = LSM:Fetch("background", db.bg),
						insets = {left=db.inset, right=db.inset, top=db.inset, bottom=db.inset},
						edgeFile = LSM:Fetch("border", db.border),
						edgeSize = db.borderWidth
					})
		tooltips[i]:SetBackdropColor(db.bgColor.r, db.bgColor.g, db.bgColor.b, db.alpha)
		tooltips[i]:SetBackdropBorderColor(db.borderColor.r, db.borderColor.g, db.borderColor.b, db.borderColor.a)
	end

	--healthbar--
	ttSBar:SetStatusBarTexture(LSM:Fetch("statusbar", db.healthBar))
	if db.topBar then
		ttSBar:ClearAllPoints()
		ttSBar:SetPoint("BOTTOM", tt, "TOP", 0, 2)
	else
		ttSBar:ClearAllPoints()
		ttSBar:SetPoint("TOP", tt, "BOTTOM", 0, -2)
	end
	ttSBarBG:SetAllPoints()
	ttSBarBG:SetFrameLevel(ttSBar:GetFrameLevel() - 1)
	ttSBarBG:SetBackdrop({bgFile = LSM:Fetch("statusbar", db.sbarbg)})
	ttSBarBG:SetBackdropColor(db.sbarbgcolor.r, db.sbarbgcolor.g, db.sbarbgcolor.b, db.sbarbgcolor.a)

	--health % on status bar--
	ttHealth:SetFont(font, 12, "OUTLINE")
	ttHealth:SetParent(ttSBar)
	ttHealth:SetPoint("CENTER", ttSBar, "CENTER")

	--raid icon--
	raidIcon:SetWidth(db.raidIconSize)
	raidIcon:SetHeight(db.raidIconSize)
	raidIcon:SetTexture("Interface\\TARGETINGFRAME\\UI-RaidTargetingIcons")
	raidIcon:SetPoint("CENTER", tt, db.raidIconPosition, db.raidIconX, db.raidIconY)
	raidIcon:Hide()

	--fonts--
	GameTooltipHeaderText:SetFont(font, 12 + 2)
	GameTooltipText:SetFont(font, 12)
	GameTooltipTextSmall:SetFont(font, 12 - 2)
	ShoppingTooltip1TextLeft1:SetFont(font, 12 -2)
	ShoppingTooltip1TextLeft2:SetFont(font, 12)
	ShoppingTooltip1TextLeft3:SetFont(font, 12 -2)
	ShoppingTooltip2TextLeft1:SetFont(font, 12 -2)
	ShoppingTooltip2TextLeft2:SetFont(font, 12)
	ShoppingTooltip2TextLeft3:SetFont(font, 12 -2)
	ShoppingTooltip3TextLeft1:SetFont(font, 12 -2)
	ShoppingTooltip3TextLeft2:SetFont(font, 12)
	ShoppingTooltip3TextLeft3:SetFont(font, 12 -2)
end

local function ShoppingTipOne()
	for i = 1, ShoppingTooltip1:NumLines() do
		_G["ShoppingTooltip1TextRight"..i]:SetFont(font, 12 -2)
	end
end

local function ShoppingTipTwo()
	for i = 1, ShoppingTooltip2:NumLines() do
		_G["ShoppingTooltip2TextRight"..i]:SetFont(font, 12 -2)
	end
end

local function ShoppingTipThree()
	for i = 1, ShoppingTooltip3:NumLines() do
		_G["ShoppingTooltip3TextRight"..i]:SetFont(font, 12 -2)
	end
end


local function BorderClassColor()
	if db.classColor then
		local _,class = UnitClass("mouseover") --or UnitClass(GameTooltip:GetUnit())
		if class then
			tt:SetBackdropBorderColor(color[class].r - .2, color[class].g - .2, color[class].b - .2, db.borderColor.a)
		end
	else
		local borderColor = db.borderColor
		tt:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
	end
end

local function ItemQualityBorder()
	if db.itemColor then
		for i = 1, #tooltips do
			local _,item = tooltips[i]:GetItem()
			if item then
				local _,_,quality = GetItemInfo(item)
				if quality then
					local r,g,b = GetItemQualityColor(quality)
					tooltips[i]:SetBackdropBorderColor(r - .2, g - .2, b - .2, db.borderColor.a)
				end
			end
		end
	end
end

local function FadeTip()
	local tapped = false
	if not UnitPlayerControlled("mouseover") then
		if UnitIsTapped("mouseover") and not UnitIsTappedByPlayer("mouseover") then
			tapped = true
		end
	end
	if UnitIsDead("mouseover") or tapped or not UnitIsConnected("mouseover") then
		local borderColor = db.borderColor
		tt:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
		local bgColor = db.bgColor
		tt:SetBackdropColor(bgColor.r + .2, bgColor.g +.2, bgColor.b + .2, db.alpha)
	end
end

local function MinWidth()
	if tt:GetWidth() < 125 then
		tt:SetWidth(125)
	end
end

local function SBarContainerUpdate()
	tt:Show()
	MinWidth()
	local width = tt:GetWidth()
	ttSBar:SetWidth(width)
end

local function RaidIconUpdate()
	if UnitExists("mouseover") then
		local icon = GetRaidTargetIndex("mouseover")
		if icon then
			SetRaidTargetIconTexture(raidIcon, icon)
			raidIcon:Show()
		else
			raidIcon:Hide()
		end
	else
		raidIcon:Hide()
	end
end

local function TargetTextLine()
	target, tserver = UnitName("mouseovertarget")
	_,tclass = UnitClass("mouseovertarget")
	if tclass and target ~= UNKNOWN then
		if db.you and target == player and (tserver == nil or tserver == server) then
			tt:AddDoubleLine("Target:", "<<YOU>>", nil, nil, nil, .9, 0, .1)
		else
			local tcolor = color[tclass]
			tt:AddDoubleLine("Target:", target, nil,nil,nil,tcolor.r,tcolor.g,tcolor.b)
		end
		SBarContainerUpdate()
	end
end

local function TargetTextUpdate()
	target, tserver = UnitName("mouseovertarget")
	_,tclass = UnitClass("mouseovertarget")
	if target and target ~= UNKNOWN then
		for i=1, GameTooltip:NumLines() do
			local left, right, leftText, rightText
			left = getglobal(GameTooltip:GetName().."TextLeft"..i)
			leftText = left:GetText()
			right = getglobal(GameTooltip:GetName().."TextRight"..i)
			if leftText == "Target:" then
				if db.you and target == player and (tserver == nil or tserver == server) then
					right:SetText("<<YOU>>")
					right:SetTextColor(.9, 0, .1)
				else
					right:SetText(target)
					right:SetTextColor(color[tclass].r,color[tclass].g,color[tclass].b)
				end
				tt:Show()
				SBarContainerUpdate()
				targetLine = true
			end
		end
		if targetLine ~= true then
			TargetTextLine()
		else 
			targetLine = false
		end
	end
end

local function TalentQuery()
	if CanInspect("mouseover") and db.showTalentText then
		if UnitName("mouseover") ~= player and UnitLevel("mouseover") > 9 then
			local talentline = nil
			for i=1, GameTooltip:NumLines() do
				local left, leftText
				left = getglobal(GameTooltip:GetName().."TextLeft"..i)
				leftText = left:GetText()
				if leftText == "Talents:" then
					talentline = 1
				end
			end
			if not talentline then
				if InspectFrame and InspectFrame:IsShown() then
					tt:AddDoubleLine("Talents:", "Inspect Frame is open")
				else
					NotifyInspect("mouseover")
					tt:RegisterEvent("INSPECT_TALENT_READY")
					tt:AddDoubleLine("Talents:", "...")
				end
				SBarContainerUpdate()
			end
		end
	end
end

local function TalentsSort(a,b)
	return a.pnts > b.pnts
end

local function TalentText()
	if UnitExists("mouseover") then
		for i=1,3 do
			tree,_,pnts = GetTalentTabInfo(i, 1)
			talents[i] = {tree = tree, pnts = pnts}
		end
		points = talents[1].pnts.."/"..talents[2].pnts.."/"..talents[3].pnts
		spec = talents
		table_sort(spec, TalentsSort)
		for i=1, GameTooltip:NumLines() do
			local left, right, leftText
			left = getglobal(GameTooltip:GetName().."TextLeft"..i)
			leftText = left:GetText()
			right = getglobal(GameTooltip:GetName().."TextRight"..i)
			if leftText == "Talents:" then
				right:SetText(spec[1].tree.." ("..points..")")
			end
			SBarContainerUpdate()
		end
	end
	tt:UnregisterEvent("INSPECT_TALENT_READY")
end

local function Appendices()
	local classif = UnitClassification("mouseover")
	if classif == "rare" or classif == "rareelite" then
		tt:AppendText(" (Rare)")
	end
	if UnitIsAFK("mouseover") then
		tt:AppendText(" (AFK)")
	end
	if UnitIsDND("mouseover") then
		tt:AppendText(" (DND)")
	end
end

local function MouseoverTargetUpdate()
	RaidIconUpdate()
	BorderClassColor()
	FadeTip()
	TalentQuery()
	SBarContainerUpdate()
end

local function TipShow()
	RaidIconUpdate()
	if tt:GetUnit() then
		Appendices()
		BorderClassColor()
		SBarContainerUpdate()
	elseif tt:GetItem() then
		ItemQualityBorder()
	else
		local borderColor = db.borderColor
		tt:SetBackdropBorderColor(borderColor.r, borderColor.g, borderColor.b, borderColor.a)
	end
	local bgColor = db.bgColor
	tt:SetBackdropColor(bgColor.r, bgColor.g, bgColor.b, db.alpha)
end

function TipTop:HealthFormat(textformat)
	local ttSBarBG_OnUpdate
	if textformat == "100/100" then
		ttSBarBG_OnUpdate = function()
			if db.healthText then
				local hp = UnitHealth("mouseover")
				local maxhp = UnitHealthMax("mouseover")
				if hp ~= lasthp or maxhp ~= lastmax then
					ttHealth:SetFormattedText("%d / %d", hp, maxhp)
					lasthp = hp
					lastmax = maxhp
				end
			end
			if db.showTargetText and UnitExists("mouseovertarget") then
				TargetTextUpdate()
			end
		end
	elseif textformat == "100%" then
		ttSBarBG_OnUpdate = function()
			if db.healthText then
				hp = ttSBar:GetValue()
				_,maxhp = ttSBar:GetMinMaxValues()
				if hp ~= lasthp or maxhp ~= lastmax then
					local per = (hp/maxhp)*100
					if per >= 0 then	--was showing odd percent values after moving mouse, before tip faded
						ttHealth:SetFormattedText("%d%%", per)
					end
					lasthp = hp
					lastmax = maxhp
				end
			end
			if db.showTargetText and UnitExists("mouseovertarget") then
				TargetTextUpdate()
			end
		end
	elseif textformat == "100/100 (100%)" then
		ttSBarBG_OnUpdate = function()
			if db.healthText then
				local hp = UnitHealth("mouseover")
				local maxhp = UnitHealthMax("mouseover")
				if hp ~= lasthp or maxhp ~= lastmax then
					local per = (hp/maxhp)*100
					if per >= 0 then
						ttHealth:SetFormattedText("%d / %d (%d%%)", hp, maxhp, per)
					end
					lasthp = hp
					lastmax = maxhp
				end
			end
			if db.showTargetText and UnitExists("mouseovertarget") then
				TargetTextUpdate()
			end
		end
	end
	ttSBarBG:SetScript("OnUpdate", ttSBarBG_OnUpdate)
end



local function SetScriptHook(frame, script, func)
	if frame:GetScript(script) then
		frame:HookScript(script, func)
	else
		frame:SetScript(script, func)
	end
end

local function PlayerLogin()
	db = TipTopDB.profiles.Default
	TipTop:SetUpTips()

	hooksecurefunc("GameTooltip_SetDefaultAnchor", function (tooltip, parent)
			if db.onCursor then
				tt:SetOwner(UIParent, "ANCHOR_CURSOR")
			else
				tt:SetOwner(UIParent, "ANCHOR_NONE")
				tt:SetPoint(db.anchor, UIParent, db.anchor, db.offsetX, db.offsetY)
			end
		end)

	local tt_OnEvent = function(self, event)
			if event == "UPDATE_MOUSEOVER_UNIT" then
				MouseoverTargetUpdate()
			elseif event == "INSPECT_TALENT_READY" then
				TalentText()
			end
		end
	SetScriptHook(tt, "OnEvent", tt_OnEvent)

	local irt_OnShow = function()
			ItemQualityBorder()
			local bgColor = db.bgColor
			irt:SetBackdropColor(bgColor.r,bgColor.g,bgColor.b,db.alpha)
		end
	SetScriptHook(irt, "OnShow", irt_OnShow)

	TipTop:HealthFormat(db.textformat)
	
	TipTop:SetScript("OnShow", TipShow)
	ShoppingTooltip1:SetScript("OnShow", function() ShoppingTipOne() ItemQualityBorder() end)
	ShoppingTooltip2:SetScript("OnShow", function() ShoppingTipTwo() ItemQualityBorder() end)
	ShoppingTooltip3:SetScript("OnShow", function() ShoppingTipThree() ItemQualityBorder() end)
end

TipTop:SetScript("OnEvent", PlayerLogin)

tt:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
TipTop:RegisterEvent("PLAYER_LOGIN")