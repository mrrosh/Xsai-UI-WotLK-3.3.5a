-- 
-- Enchant functions
-- 
local _G = _G
local sbf = _G.SBF
local GetWeaponEnchantInfo = _G.GetWeaponEnchantInfo
local GetInventoryItemLink = _G.GetInventoryItemLink
local GetInventoryItemTexture = _G.GetInventoryItemTexture
local CancelItemTempEnchantment = _G.CancelItemTempEnchantment
local tinsert = _G.tinsert
local tremove = _G.tremove
local ipairs = _G.ipairs
local pairs = _G.pairs
local smatch = _G.string.match
local format = _G.format

sbf.InventoryChanged = function(self, unit)
  if (unit == "player") then
    local update = false
    local itemLink, itemID
    for _,i in pairs(self.enchantID) do
      itemLink = GetInventoryItemLink("player", i)
      if itemLink then
        itemID = smatch(itemLink, "Hitem:(.-):")
        if self.enchants[i].itemID and (self.enchants[i].itemID ~= itemID) then
          update = true
          self.enchants[i].update = true
        end
      end
    end
    if update then
      self:ForceGet(nil, "player")
    end
  end
end

sbf.enchantID = {16, 17}
sbf.SetupEnchants = function(self)
	if not self.enchants then
		self.enchants = {}
	end
	for _,i in pairs(self.enchantID) do
		if not self.enchants[i] then
			self.enchants[i] = self:GetTable()
			self.enchants[i].auraType = self.ENCHANT
			self.enchants[i].type = "ENCHANT"
			self.enchants[i].invID = i
			self.enchants[i].cancelNum = i-15
			self.enchants[i].cancel = 0
      self.enchants[i].static = true
      self.enchants[i].unit = "player"
		end
	end
end


sbf.AddEnchants = function(self)
	for index,enchant in pairs(self.enchants) do
		if enchant.hasBuff and enchant.name and not self:IsExcluded(enchant.name) then
			self:InsertEnchant(index)
		end
	end
end

sbf.InsertEnchant = function(self, invID)
  for k,v in ipairs(self.buffs["player"]) do
		if (v.invID == invID) then
			return
		end
	end
  tinsert(self.buffs["player"], self.enchants[invID])
end

sbf.RemoveEnchants = function(self)
  local removed
  while true do
    removed = false
    for k,v in ipairs(self.buffs["player"]) do
      if v.invID then
        v._slot = nil
        tremove(self.buffs["player"], k)
        removed = true
      end
    end
    if not removed then
      return
    end
  end
end


sbf.GetEnchantName = function(self, invID)
  SBFTooltip:SetOwner(UIParent,"ANCHOR_NONE") 
	SBFTooltip:ClearLines()
  SBFTooltip:SetInventoryItem("player", invID)
	local name, lines
  lines = SBFTooltip:NumLines()
  self:debugmsg(8, "Tooltip has %d lines", lines)
	if true then
    for i=2,lines do
      line = _G["SBFTooltipTextLeft"..i]:GetText()
      if line then
        self:debugmsg(8, "Tooltip line %d -> %s", i, line)
        name = smatch(line, "^(.-) %(")
        if name then
          self:debugmsg(8, "Found enchant name: %s", name)
          return name, false
        end
      end
    end
  end
	local l = GetInventoryItemLink("player", invID)
	if l then
		local name = GetItemInfo(l)
		if name then
      return name, true
    end
	end
  return format("Temporary Enchant %d", invID), true
end

sbf.enchantDebounce = 15
sbf.UpdateEnchants = function(self)
  if not self then
    self = SBF
  end
  
	if not self.showingOptions then
		self.enchants[16].last = self.enchants[16].timeLeft
		self.enchants[17].last = self.enchants[17].timeLeft
		self.enchants[16].hasBuff, self.enchants[16].timeLeft, self.enchants[16].count, 
		self.enchants[17].hasBuff, self.enchants[17].timeLeft, self.enchants[17].count = GetWeaponEnchantInfo()
		
		for k,v in pairs(self.enchants) do
			if v.hasBuff and (v.cancel == 0) then
				v.timeLeft = v.timeLeft/1000
        v.expiryTime = GetTime() + v.timeLeft
        v.index = 100 + k -- make sure that .index is always valid for sorting
				if v.update or not v.name or not v.last or (v.timeLeft > v.last + 2) then
          v.texture = GetInventoryItemTexture("player", v.invID)
          v.name, v.showItem = self:GetEnchantName(v.invID)
          if v.name then
            self:BuffDuration(v)
            v.itemID = smatch(GetInventoryItemLink("player", v.invID), "Hitem:(.-):")
            self.getAuras["player"] = true
          end
          v.update = false
        end
			else
				if v.last then
--          local var = v._var
--          if var.expiry.sctWarn then
--            self:CombatTextExpiry(v.name, v.var)
--					end
					self.getAuras["player"] = true
				end
				if (v.cancel > 0) then
					if (v.cancel == self.enchantDebounce) then
						CancelItemTempEnchantment(v.cancelNum)
					end
					v.cancel = v.cancel - 1
				end
        v.hasBuff = false
				v.last = nil
				v.name = nil
				v.count = nil
				v.warned = nil
				v.timeLeft = nil
        v.itemID = nil
        v.filterName = nil
			end
		end
	end
end
