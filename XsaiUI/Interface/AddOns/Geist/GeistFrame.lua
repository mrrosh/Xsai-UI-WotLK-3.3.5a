function Geist_Create()
	-- Create the header.
	local header = CreateFrame("Button", "GeistHeader", UIParent, "SecureHandlerClickTemplate")
	header:RegisterForClicks("AnyDown","AnyUp");
	header:Hide()

	-- Set onClick behaviour.
	header:SetAttribute("_onclick", [[
		self:SetPoint("CENTER", "$cursor")

		if geistOpen then
			geistOpen = nil
			self:Hide()
		else
			geistOpen = 1
			self:Show()
		end]]
	)

	-- Create the buttons.
	local buttons = {}

	for i = 1, Geist["Buttons"] do
		local button = CreateFrame("CheckButton", "GeistButton"..i, GeistHeader, "ActionBarButtonTemplate")
		buttons[i] = button
		if i == 1 then
			button:SetPoint("CENTER", GeistHeader, "CENTER", 0, 0)
		elseif i == 2 then
			button:SetPoint("RIGHT", buttons[i-1], "LEFT", -2, 0)
		elseif i == 3 then
			button:SetPoint("LEFT", buttons[i-2], "RIGHT", 2, 0)
		elseif i == 4 then
			button:SetPoint("BOTTOM", buttons[i-3], "TOP", 0, 2)
		elseif i == 5 then
			button:SetPoint("TOP", buttons[i-4], "BOTTOM", 0, -2)
		elseif i == 6 or i == 14 then
			button:SetPoint("RIGHT", buttons[i-2], "LEFT", -2, 0)
		elseif i == 7 or i == 15 then
			button:SetPoint("LEFT", buttons[i-3], "RIGHT", 2, 0)
		elseif i == 8 or i == 16 then
			button:SetPoint("RIGHT", buttons[i-3], "LEFT", -2, 0)
		elseif i == 9 or i == 17 then
			button:SetPoint("LEFT", buttons[i-4], "RIGHT", 2, 0)
		elseif i == 10 or i == 22 or i == 24 then
			button:SetPoint("RIGHT", buttons[i-8], "LEFT", -2, 0)
		elseif i == 11 or i == 23 or i == 25 then
			button:SetPoint("LEFT", buttons[i-8], "RIGHT", 2, 0)
		elseif i == 12 then
			button:SetPoint("BOTTOM", buttons[i-8], "TOP", 0, 2)
		elseif i == 13 then
			button:SetPoint("TOP", buttons[i-8], "BOTTOM", 0, -2)
		elseif i == 18 or i == 20 then
			button:SetPoint("RIGHT", buttons[i-12], "LEFT", -2, 0)
		elseif i == 19 or i == 21 then
			button:SetPoint("LEFT", buttons[i-12], "RIGHT", 2, 0)
		end

		button:SetAttribute("*type*", "action")
		button:SetAttribute("*action*", Geist["ButtonIDs"][i])

		-- Setting the size.
		header:SetScale(Geist["Scale"])
		
		-- Button Guide
		button.title = button:CreateFontString(nil, "OVERLAY")
		button.title:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
		button.title:SetTextColor(1, 1, 0)
		button.title:SetAllPoints(button)
		button.title:SetText(i.."\n"..Geist["ButtonIDs"][i])

		if not Geist["Guide"] then
			button.title:Hide()
		end
	end

	-- The title box. I rather like this.
	local title = CreateFrame("Frame", nil, header)
	title:SetAttribute("scale", Geist["Scale"])
	title:SetFrameStrata("BACKGROUND")
	title:SetWidth(36)
	title:SetHeight(36)
	title:SetPoint("CENTER", 0, 0)

	local t = title:CreateTexture(nil,"BACKGROUND")
	t:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
	t:SetAllPoints(title)
	t:SetVertexColor(1, 1, 1, .5)
	title.texture = t

	title.title = title:CreateFontString(nil, "OVERLAY")
	title.title:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
	title.title:SetTextColor(1, 1, 0, .8)
	title.title:SetPoint("TOP", title, "TOP", 0, -1)
	title.title:SetText("Geist")
end
