--
-- Filter Functions
--
local _G = _G
local sbf = _G.SBF
local ipairs = ipairs
local pairs = pairs
local tonumber = tonumber
local tostring = tostring
local strlower = strlower
local sgmatch = _G.string.gmatch
local sfind = _G.string.find
local slen = _G.string.len
local sbyte = _G.string.byte
local ssub = _G.string.sub
local smatch = _G.string.match
local sgsub = _G.string.gsub
local UnitAura = _G.UnitAura
local UnitInRaid = _G.UnitInRaid
local GetNumPartyMembers = _G.GetNumPartyMembers

SBF.DoFilters = function(self, buff)
  if (buff.unit ~= "player") then
    return nil, nil
  end
	for i,f in ipairs(self.db.profile.filters) do
		for frame,expr in sgmatch(f, "(..?):(.+)") do
			if self:ParseFilter(expr, buff) then
				return tonumber(frame), expr
			end
		end
	end
	return nil,nil
end

SBF.ParseFilter = function(self, str, buff)
	if sfind(str, "[%(%)]") then
		local rc, subrc, m, l, op
		local p,n = 0,1
		for i=1,slen(str)+1 do
			l = sbyte(str,i)
			if (l == 40) then
				p = p + 1
				if (p == 1) then
					n = i + 1
				end
			elseif (l == 41) then
				p = p - 1
				if (p == 0) then
					m = i-1
				end
			elseif (p == 0) and ((l == 38) or (l == 124) or (l == nil)) then
				if not m then
					m = i-1
				end
				subrc = SBF:ParseFilter(ssub(str, n, m), buff)
				if not op then
					rc = subrc
				elseif (op == 38) then -- &
					rc = rc and subrc
				elseif (op == 124) then	-- |
					rc = rc or subrc
				end
				op = l
				m = nil
				n = i + 1
			end
		end
		return rc
	else
		return self:EvaluateExpression(str, buff)
	end
end

-- /dump self:EvaluateExpression("n~Elixir", {name = "Elixir of Fortitude", timeLeft = 1234, duration = 1800})

SBF.EvaluateExpression = function(self, ex, buff)
  local rc, explicitH, o, expr = false, false
  local op, expr, c, m, d, a, subrc, alpha, beta
	if not buff.filterName then
		buff.filterName = sgsub(strlower(tostring(buff.name)), " ", "")
	end
	if not self.exCache then
		self.exCache = {}
	end
	if not self.exCache[ex] then
		self.exCache[ex] = sgsub(ex, " ", "").."."
	end
	for expr,op in sgmatch(self.exCache[ex], "(.-)([|&.])") do
		subrc = false
		c,m,d = smatch(expr, "(%a+)(%p?%p?)(.*)") 
		if c and m and d then
      alpha = sbyte(c, 1)
      beta = sbyte(c, 2)
			-- Temporary item enchants
			if (c == "e") then
				subrc = (buff.auraType == self.ENCHANT)
			-- Act on buff name
			elseif (c == "n") then
				if m and d then
					d = strlower(d)
					if (m == "=") then
						subrc = (d == buff.filterName)
					elseif (m == "!=") then
						subrc = not (d == buff.filterName)
					elseif (m == "~") then
						subrc = (sfind(buff.filterName, d) ~= nil)
					elseif (m == "!~") then
						subrc = (sfind(buff.filterName, d) == nil)
					end
				end
      -- my buffs
			elseif (c == "my") then
				if buff.isMine then
          subrc = true
				end
			-- tracking buff
			elseif (c == "tr") then
				if buff.isTracking then
          subrc = true
				end
			-- totems
			elseif (c == "to") then
				if (buff.auraType == self.TOTEM) then
          subrc = true
				end
			-- tooltip text
			elseif (c == "tt") then
				if m and d then
					subrc = self:ScanBuffTooltip(buff, d)
					if (m == "!~") then
						subrc = not subrc
					end
				end
			-- group status
			elseif (alpha == self.strings.g) then
        if not beta then
          subrc = false
				elseif (beta == self.strings.s) then
					subrc = not UnitInRaid("player") and (GetNumPartyMembers() == 0)
				elseif (beta == self.strings.g) then
					subrc = UnitInRaid("player") or (GetNumPartyMembers() > 0)
				elseif (beta == self.strings.p) then
					subrc = (GetNumPartyMembers() > 0)
				elseif (beta == self.strings.r) then
					subrc = UnitInRaid("player")
				end
        if (m == "!") then
          subrc = not subrc
        end
			-- debuff flag
			elseif (alpha == self.strings.h) and (buff.auraType == self.HARMFUL) then
				if not beta then
					subrc = true
				elseif (beta == self.strings.c) then
					subrc = self:BuffSchool(buff, self.strings.CURSE)
				elseif (beta == self.strings.d) then
					subrc = self:BuffSchool(buff, self.strings.DISEASE)
				elseif (beta == self.strings.m) then
					subrc = self:BuffSchool(buff, self.strings.MAGIC)
				elseif (beta == self.strings.p) then
					subrc = self:BuffSchool(buff, self.strings.POISON)
				elseif (beta == self.strings.u) then
					subrc = self:BuffSchool(buff)
				elseif (beta == self.strings.a) then
					for k,v in pairs(self.classDispel[self.playerClass]) do
						subrc = subrc or self:BuffSchool(buff, v)
					end
				end
        if (m == "!") then
          subrc = not subrc
        end
				explicitH = true
			-- untilCancelled flag
			elseif (c == "a") then
				subrc = (buff.untilCancelled and true)
				if (m == "!") then
					subrc = not subrc
				end
			-- Math comparisons
			elseif m and d then
				d = tonumber(d)
				-- Buff duration, seconds
				if (c == "d") and not buff.untilCancelled then
					a = buff.duration
				-- Buff duration, minutes
				elseif (c == "D") and not buff.untilCancelled then
					a = buff.duration/60
				-- Buff time remaining, seconds
				elseif (c == "r") and self.db.profile.enableRFilters then
					a = (buff.timeLeft or 0)
				-- Buff time remaining, minutes
				elseif (c == "R") and self.db.profile.enableRFilters then
					a = floor(buff.timeLeft or 0)/60
				else
					a = nil
					subrc = false
				end
				if a then
					if (m == "<") then
					 subrc = (a < d)
					elseif (m == "<=") then
					 subrc = (a <= d)
					elseif (m == ">") then
					 subrc = (a > d)
					elseif (m == ">=") then
					 subrc = (a >= d)
					end
				end
			end
			if not o then
				rc = subrc
			elseif (o == "|") then
				rc = rc or subrc
			elseif (o == "&") then
				rc = rc and subrc
			end
			o = op
		end
	end
	if not explicitH then
		rc = rc and (buff.auraType ~= self.HARMFUL)
	end
	return rc
end

SBF.BuffSchool = function(self, buff, str)
	if self.showingOptions or not buff or not buff.index then
		return false
	end
	if (buff.debuffType == str) then
		return true
	end
	SBFTooltip:SetUnitAura(buff.unit, buff.index, buff.filter); 
	local text = SBFTooltipTextRight1:GetText()
	if str then
		if text and sfind(text, str) then
			return true
		end
	elseif not SBFTooltipTextRight1:GetText() then
		return true
	end
	return false
end

SBF.ScanBuffTooltip = function(self, buff, str)
  if self.showingOptions or not buff or not buff.index then
    return false
  end
	local line
	SBFTooltip:SetUnitAura(buff.unit, buff.index, buff.filter); 
	for i=1,SBFTooltip:NumLines() do
		line = _G["SBFTooltipTextLeft"..i]:GetText()
		if sfind(strlower(line), str) then
			return true
		end
		line = _G["SBFTooltipTextRight"..i]:GetText()
		if line and sfind(strlower(line), str) then
			return true
		end
	end
	return false
end
