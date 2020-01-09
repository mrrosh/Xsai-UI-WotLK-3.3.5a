-- ButtonFacade support

if IsAddOnLoaded("ButtonFacade") then
  local enabled
  
  local bf = LibStub("AceAddon-3.0"):GetAddon("ButtonFacade")
  local lbf = LibStub("LibButtonFacade")
  local db
  
  local SBFBF = bf:NewModule("SBF")

  SBFBF.Load = function(self)
    enabled = not SBF.db.global.disableBF
    if enabled then
      if not SBF.db.profile.buttonFacade then
        SBF.db.profile.buttonFacade = {}
      end
      db = SBF.db.profile.buttonFacade
      lbf:RegisterSkinCallback("SBF", self.SkinCallback, self)
      self:SetupGroups()
      return true
    end
    return false
  end

  SBFBF.SetupGroups = function(self)
    if enabled then
      for k,v in ipairs(SBF.frames) do
        self:SetupGroup("SBF", v:GetName())
      end
    end
  end
  
  -- arg,SkinID,Gloss,Backdrop,Group,Button,Colors
  SBFBF.SkinCallback = function(self, skin, gloss, backdrop, frame, _, colours)
    if not enabled or not frame then 
      return 
    end
    db[frame].skin = skin
    db[frame].gloss = gloss
    db[frame].backdrop = backdrop
    db[frame].colours = colours
  end

  local groups = {}
  SBFBF.SetupGroup = function(self, addon, frame)
    if not enabled then
      return
    end
    local f = _G[frame]
    local btndata
    if not groups[frame] then
      groups[frame] = lbf:Group(addon, frame)
    end
    local group = groups[frame]
    if (group.SkinID ~= "Blizzard") and f.slots then
      for index,slot in ipairs(f.slots) do
        if slot and slot.icon then
          if not slot.icon.bfBtndata then
            slot.icon.bfBtndata = {}
          end
          group:AddButton(slot.icon, slot.icon.bfBtndata)
        end
      end
    end
    if not db[frame] then
      db[frame] = { skin = "Blizzard", gloss = 0, backdrop = false, colours = {}, }
    end
    group:Skin(db[frame].skin, db[frame].gloss, db[frame].backdrop, db[frame].colours)
  end

  --[[
  SBFBF.UndoGroup = function(self, addon, frame)
    if not enabled then
      return
    end
    local f = _G[frame]
    if not groups[frame] then
      groups[frame] = lbf:Group(addon, frame)
    end
    local group = groups[frame]
    if f.slots then
      for index,slot in ipairs(f.slots) do
        if slot and slot.icon then
          group:RemoveButton(slot.icon)
        end
      end
    end
  end
  ]]--
end