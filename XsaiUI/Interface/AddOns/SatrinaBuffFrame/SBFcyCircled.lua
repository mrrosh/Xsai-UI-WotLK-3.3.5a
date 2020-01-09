if IsAddOnLoaded("cyCircled") then
  local addonName = "SatrinaBuffFrame"

  cyCircled_SatrinaBuffFrames = cyCircled:NewModule(addonName)

  function cyCircled_SatrinaBuffFrames:AddonLoaded()
    -- do nothing
  end
  
  function cyCircled_SatrinaBuffFrames:Load()
    local skin = cyCircled.db.profile.skin
    self.origChangeSkin = cyCircled.ChangeSkin
    cyCircled.ChangeSkin = self.ChangeSkin

    cyCircled:RegisterDefaults(addonName, "profile", { ["SBFFrame1"] = true, ["SBFFrame2"] = true, adjust = 31})
    self.db = cyCircled:AcquireDBNamespace(addonName)

    if not self.db.profile.adjust then
      if (cyCircled.skins[skin].overlay.h == 37) then
        self.db.profile.adjust = 23
      else
        self.db.profile.adjust = 31
      end
    end
    return self
  end
  
  function cyCircled_SatrinaBuffFrames:OnDisable()
    -- Here we shall actually remove cyCircled from the buff icons when the module is disabled.
    -- Without a UI reload.
    self:ApplyCustom(true)
  end

  -- Hooked ChangeSkin 
  cyCircled_SatrinaBuffFrames.ChangeSkin = function()
    if SBF.showingOptions then
      SBFOcyCircledSlider:SetValue(cyCircled_SatrinaBuffFrames.db.profile.adjust)
    end
    cyCircled_SatrinaBuffFrames.origChangeSkin(cyCircled)
    cyCircled_SatrinaBuffFrames:ApplyCustom()
  end
  
  function cyCircled_SatrinaBuffFrames:ApplyCustom()
    if not self.elements then 
      return 
    end

    -- Here we shall unfuck the mess cyCircled made of the buff icons
    for name,frameElement in pairs(self.elements) do
      for index,buttonName in pairs(frameElement.elements) do
        if not _G[buttonName].overlay then
          _G[buttonName].overlay = _G[buttonName.."Overlay"]
        end
        if _G[buttonName].overlay then
          if self.db.profile[name] then
            _G[buttonName].overlay:SetWidth(self.db.profile.adjust)
            _G[buttonName].overlay:SetHeight(self.db.profile.adjust)
            _G[buttonName].overlay:SetDrawLayer("OVERLAY")
            _G[buttonName].overlay:Show()
            _G[buttonName].border:SetAlpha(0)
            _G[buttonName].border:Hide()
          else
            _G[buttonName].overlay:Hide()
          end
        end
      end
    end
  end

  function cyCircled_SatrinaBuffFrames:GetElements()
    SBF:PutTable(self.frameList)
    self.frameList = SBF:GetTable()
    local name
    for index,frame in pairs(SBF.frames) do
      name = frame:GetName()
      self.frameList[name] = true
    end
    return self.frameList
  end

  function cyCircled_SatrinaBuffFrames:SetupElements(name)
    if not self.elements then
      self.elements = SBF:GetTable()
    end
    local frameElement
    for _,frame in pairs(SBF.frames) do
      if (frame:GetName() == name) then
        if self.elements[name] then
          SBF:PutTable(self.elements[name])
          self.elements[name] = nil
        end
        if frame.slots then
          frameElement = SBF:GetTable()
          frameElement.args = SBF:GetTable()
          frameElement.args.nt = false
          frameElement.args.ht = false
          frameElement.args.pt = false
          frameElement.args.ct = false
          frameElement.args.ft = false
          frameElement.args.icon = false
          frameElement.args.count = true
          frameElement.args.hotkey = false
          frameElement.args.cooldown = false
          frameElement.args.eborder = false
          frameElement.args.autocast = false
          -- We could put frameElement.args.button with height and width data
          -- Too bad it doesn't do anything
          
          frameElement.elements = SBF:GetTable()
          for index,slot in pairs(frame.slots) do
            if slot.icon then
              table.insert(frameElement.elements, slot.icon:GetName())
            end
          end
          self.elements[name] = frameElement
        end
      end
    end
  end
  
  function cyCircled_SatrinaBuffFrames:SkinFrame(name)
    -- Are we skinning this frame?
    return self.db.profile[name]
  end
end