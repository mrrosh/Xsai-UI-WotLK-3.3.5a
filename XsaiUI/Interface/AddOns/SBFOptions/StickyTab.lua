local SML = LibStub and LibStub:GetLibrary('LibSharedMedia-3.0')
local ScrollingDropDown = LibStub and LibStub:GetLibrary('LibScrollingDropDown-1.0')
local sbfo = SBFOptions
local _var
local currentParent
local currentChildIndex

local stickyListButtons = {}
SBFOptions.StickyTabInitialise = function(self)
	for i=1,10 do
		stickyListButtons[i] = getglobal("SBFOStickyList"..i)
	end
  SBFOStickyFrameParentDropDown:Init(self.DropDownCallback, self.strings.STICKTOFRAME)
  SBFOStickyFrameChildDropDown:Init(self.DropDownCallback, self.strings.STICKYCHILDFRAME)
	SBFOStickyConfigButton.text:SetFormattedText(self.strings.STICKYCONFIG)
  SBFOStickyChildUpButton:SetFormattedText(self.strings.UP)
	SBFOStickyChildDownButton:SetFormattedText(self.strings.DOWN)
	SBFOStickyChildRemoveButton:SetFormattedText(self.strings.REMOVE)
end

SBFOptions.StickyTabSelectFrame = function(self, var)
  if var then
    _var = var
  end
  self:StickyFrameParentDropDown_Initialise()
  self:InitSticky()
end

SBFOptions.InitSticky = function(self)
  SBFOStickyFrameChildDropDown:Disable()
  if currentParent then
    ScrollingDropDown:SetSelected(SBFOStickyFrameParentDropDown, currentParent, ScrollingDropDown.VALUE)
    currentChildIndex = nil
    self:GetChildFrames()
  end
  self:ManageStickyChildButtons()
end

-- Parent dropdown
SBFOptions.StickyFrameParentDropDown_Initialise = function(self)
  ScrollingDropDown:ClearItems(SBFOStickyFrameParentDropDown)
	local info = SBF:GetTable()
	for i=1,#SBF.frames do
    if not SBF:IsStickyChild(i) then
      info.text = format(SBF.strings.FRAMETITLE, i)
      info.value = i
      info.callback = SBFOptions.StickyFrameParentDropDown_OnClick
      ScrollingDropDown:AddItem(SBFOStickyFrameParentDropDown, info)
    end
	end
	SBF:PutTable(info)
end

SBFOptions.StickyFrameParentDropDown_OnClick = function(item)
  currentParent = item.value
  sbfo:InitSticky()
  ScrollingDropDown:SetSelected(SBFOStickyFrameParentDropDown, currentParent, ScrollingDropDown.VALUE)
end

-- Manage list buttons
SBFOptions.ManageStickyChildButtons = function(self)
  if currentChildIndex then
    SBFOStickyChildUpButton:Enable()
    SBFOStickyChildDownButton:Enable()
    SBFOStickyChildRemoveButton:Enable()
  else
    SBFOStickyChildUpButton:Disable()
    SBFOStickyChildDownButton:Disable()
    SBFOStickyChildRemoveButton:Disable()
  end
  for i=1,10 do
    if i == currentChildIndex then
      stickyListButtons[i]:LockHighlight()
    else
      stickyListButtons[i]:UnlockHighlight()
    end
  end
end

-- Populate list with child frames
SBFOptions.GetChildFrames = function(self)
  if not currentParent then
    return
  end
  SBFOStickyFrameChildDropDown:Enable()
  self:StickyFrameChildDropDown_Initialise()
  for i=1,10 do
    stickyListButtons[i].label:SetFormattedText("")
    stickyListButtons[i].frame = nil
    stickyListButtons[i].index = nil
  end
  if _var.sticky[currentParent] then
    for index,child in pairs(_var.sticky[currentParent]) do
      stickyListButtons[index].label:SetFormattedText(self.strings.BUFFFRAMENUM, child)
      stickyListButtons[index].frame = child
      stickyListButtons[index].index = index
    end
  end
  self:ManageStickyChildButtons()
end

-- Child dropdown
SBFOptions.StickyFrameChildDropDown_Initialise = function(self)
  ScrollingDropDown:ClearItems(SBFOStickyFrameChildDropDown)
	local info = SBF:GetTable()
	for i=1,#SBF.frames do
		if (i ~= currentParent) and not SBF:HasStickyChildren(i) and not SBF:IsStickyChild(i) then
			info.text = format(SBF.strings.FRAMETITLE, i)
			info.value = i
			info.callback = SBFOptions.StickyFrameChildDropDown_OnClick
			ScrollingDropDown:AddItem(SBFOStickyFrameChildDropDown, info)
		end
	end
	SBF:PutTable(info)
end

SBFOptions.StickyFrameChildDropDown_OnClick = function(item)
  if not _var.sticky[currentParent] then
    _var.sticky[currentParent] = SBF:GetTable()
  end
  table.insert(_var.sticky[currentParent], item.value)
  sbfo:GetChildFrames()
end

-- select a child
SBFOptions.SelectStickyChild = function(self, button)
  if currentChildIndex then
    stickyListButtons[currentChildIndex]:UnlockHighlight()
  end
  currentChildIndex = button.index
  self:ManageStickyChildButtons()
end

SBFOptions.StickyChildUp = function(self)
  if currentChildIndex then
    local f
    f = table.remove(_var.sticky[currentParent], currentChildIndex)
    currentChildIndex = currentChildIndex - 1
    table.insert(_var.sticky[currentParent], currentChildIndex, f)
    self:GetChildFrames()
  end
end

SBFOptions.StickyChildDown = function(self)
  if currentChildIndex then
    local f
    f = table.remove(_var.sticky[currentParent], currentChildIndex)
    currentChildIndex = currentChildIndex + 1
    table.insert(_var.sticky[currentParent], currentChildIndex, f)
    self:GetChildFrames()
  end
end

SBFOptions.RemoveStickyChild = function(self)
  if currentChildIndex then
    stickyListButtons[currentChildIndex]:UnlockHighlight()
    table.remove(_var.sticky[currentParent], currentChildIndex)
    if (#_var.sticky[currentParent] == 0) then
      SBF:PutTable(_var.sticky[currentParent])
      _var.sticky[currentParent] = nil
    end
    currentChildIndex = nil
    self:GetChildFrames()
  end
end