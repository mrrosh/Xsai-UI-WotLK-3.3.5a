--[[To do list:
Slash commands
Use UnregisterEvent to block bliz's bank
Multi character viewing
Option for disabling fading
Update offline bank even when it's disabled
Vertex color for backgrounds
]]
local Localized = BaudBagLocalized;
local CheckButtons = {
  {Text=Localized.AutoOpen,SavedVar="AutoOpen",Default=false,
    TooltipText=Localized.AutoOpenTooltip},
  {Text=Localized.BlankOnTop,SavedVar="BlankTop",Default=false,
    TooltipText=Localized.BlankOnTopTooltip},
  {Text=Localized.RarityColoring,SavedVar="RarityColor",Default=true,
    TooltipText=Localized.RarityColoringTooltip}
};

local SliderBars = {
  {Text=Localized.Columns,Low="2",High="20",SavedVar="Columns", Default={8,12},
    TooltipText = Localized.ColumnsTooltip},
  {Text=Localized.Scale,Low="50%",High="200%",SavedVar="Scale", Default={100,100},
    TooltipText = Localized.ScaleTooltip}
};

local Prefix = "BaudBag";
local SelectedBags = 1;
local SelectedContainer = 1;
local MaxBags = NUM_BANKBAGSLOTS + 1;
local Updating, CfgBackup;
local LastBagID = NUM_BANKBAGSLOTS + 4;
local SetSize = {6,NUM_BANKBAGSLOTS + 1};
local MaxCont = {1,1};
local NumCont = {};
local BankOpen = false;
local FadeTime = 0.2;
local BagsReady;
local Config;

BaudBagIcons = {
  [0] = "Interface\\Buttons\\Button-Backpack-Up",
  [-1] = "Interface\\Icons\\INV_Box_02",
  [-2] = "Interface\\ContainerFrame\\KeyRing-Bag-Icon"
};

BaudBag_Debug = false;

local function DebugMsg(msg)
  if BaudBag_Debug then
    DEFAULT_CHAT_FRAME:AddMessage(msg);
  end
end


local function UseCache(Bag)
  return (((Bag==-1)or(Bag >= 5))and not BankOpen);
end

local function ShowHyperlink(Owner, Link)
  local ItemString = strmatch(Link or "","(item[%d:%-]+)");
  if not ItemString then
    return;
  end
  if(Owner:GetRight() >= (GetScreenWidth() / 2))then
    GameTooltip:SetOwner(Owner, "ANCHOR_LEFT");
  else
    GameTooltip:SetOwner(Owner, "ANCHOR_RIGHT");
  end
  GameTooltip:SetHyperlink(ItemString);
  return true;
end


function BaudBagForEachBag(BagSet,Func)
  if(BagSet==1)then
    for Bag = 1, 5 do
      Func(Bag - 1, Bag);
    end
    Func(-2, 6);
  else
    Func(-1, 1);
    for Bag = 1, NUM_BANKBAGSLOTS do
      Func(Bag + 4, Bag + 1);
    end
  end
end


local function ShowCachedTooltip(self)
  if Config and(Config[2].Enabled==false)and not(self and(strsub(self:GetName(), 1, 9)=="BaudBBank"))then
    return;
  end
  local Bag, Slot;
  if self.isBag then
    Bag = self:GetID();
    if UseCache(Bag)then
      if not GameTooltip:GetItem()then
        ShowHyperlink(self, BaudBag_Cache[Bag].BagLink);
      end
      BaudBagModifyBagTooltip(Bag);
    end
    return;
  end
  Bag, Slot = self:GetParent():GetID(), self:GetID();
  if not UseCache(Bag)or GameTooltip:IsShown()or not BaudBag_Cache[Bag][Slot]then
    return;
  end
  ShowHyperlink(self, BaudBag_Cache[Bag][Slot].Link);
end


hooksecurefunc("ContainerFrameItemButton_OnEnter", ShowCachedTooltip);
hooksecurefunc("BankFrameItemButton_OnEnter", ShowCachedTooltip);

--Adds container name when mousing over bags, aswell as simulating offline bank item mouse over
hooksecurefunc(GameTooltip,"SetInventoryItem",function(Data, Unit, InvID)
  if(Unit~="player")then
    return;
  end
  if(InvID >= 20)and(InvID <= 23)then
    if Config and(Config[1].Enabled==false)then
      return;
    end
    BaudBagModifyBagTooltip(InvID - 19);

  elseif(InvID >= 68)and(InvID < 68 + NUM_BANKBAGSLOTS)then
    if Config and(Config[2].Enabled==false)then
      return;
    end
    BaudBagModifyBagTooltip(4 + InvID - 67);
  end
end);


MainMenuBarBackpackButton:HookScript("OnEnter",function(...)
  if Config and(Config[1].Enabled~=false)then
    BaudBagModifyBagTooltip(0);
  end
end);


function BaudBagModifyBagTooltip(BagID)
  if not GameTooltip:IsShown()then
    return;
  end
  local Container = getglobal("BaudBagSubBag"..BagID):GetParent();
  Container = Config[Container.BagSet][Container:GetID()].Name;
  if not Container or not strfind(Container,"%S")then
    return;
  end
  GameTooltip:AddLine(Container);
  local Current, Next;
  for Line = GameTooltip:NumLines(), 3, -1 do
    Current, Next = getglobal("GameTooltipTextLeft"..Line),getglobal("GameTooltipTextLeft"..(Line - 1));
    Current:SetTextColor(Next:GetTextColor());
    Current:SetText(Next:GetText());
  end
  if Next then
    Next:SetText(Container);
    Next:SetTextColor(1,0.82,0);
  end
  GameTooltip:Show();
end


local EventFuncs = {
  VARIABLES_LOADED = function()
    BaudBagVersionText:SetText("Version "..GetAddOnMetadata("BaudBag","Version"));

    if ( EarthFeature_AddButton ) then   --add by Isler
      EarthFeature_AddButton(
        {
          id= "BaudBag";
          name= Localized.FeatureFrameName;
          subtext= "BaudBag";
          tooltip = Localized.FeatureFrameTooltip;
          icon= "Interface\\Icons\\Spell_Fire_SunKey";
          callback= function() BaudBagOptionsFrame:Show();end;
        }
      );
    end

    if(type(BaudBag_Cache)~="table")then
      BaudBag_Cache = {};
    end
    if(type(BaudBag_Cache[-1])~="table")then
      BaudBag_Cache[-1] = {Size = NUM_BANKGENERIC_SLOTS};
    end
    --The rest of the bank slots are cleared in the next event
    BaudBagBankSlotPurchaseButton:Disable();
  end,

  PLAYER_LOGIN = function()
    DebugMsg("Creating bag slot buttons.");
    --Generate bank bag buttons for each bag slot
    local BagSlot, Texture;
    for Bag = 1, 4 do
      --Bag name length is restricted.  for this one, the ID is set automatically.
      BagSlot = CreateFrame("CheckButton","BaudBInveBag"..(Bag - 1).."Slot",BBCont1_1BagsFrame,"BagSlotButtonTemplate");
      BagSlot:SetPoint("TOPLEFT",8,-8 - (Bag - 1) * 39);
      getglobal(BagSlot:GetName().."ItemAnim"):UnregisterAllEvents();
    end
    BBCont1_1BagsFrame:SetWidth(13 + 39);
    BBCont1_1BagsFrame:SetHeight(13 + 4 * 39 + 20);

    for Bag = 1, NUM_BANKBAGSLOTS do
      --Bag name length is restricted
      BagSlot = CreateFrame("Button","BaudBBankBag"..Bag,BBCont2_1BagsFrame,"BankItemButtonBagTemplate");
      BagSlot:SetID(Bag + 4);
      BagSlot:SetPoint("TOPLEFT",8 + mod(Bag - 1, 2) * 39,-8 - floor((Bag - 1) / 2) * 39);
      if(type(BaudBag_Cache[Bag + 4])~="table")then
        BaudBag_Cache[Bag + 4] = {Size = 0};
      end
      if(BaudBag_Cache[Bag + 4].BagLink)then
        Texture = GetItemIcon(BaudBag_Cache[Bag + 4].BagLink);
        SetItemButtonCount(BagSlot,BaudBag_Cache[Bag + 4].BagCount or 0);
      else
        Texture = select(2,GetInventorySlotInfo("Bag"..Bag));
      end
      SetItemButtonTexture(BagSlot,Texture);
    end
    BBCont2_1BagsFrame:SetWidth(91);
    --Height changes depending if there is a purchase button
    BBCont2_1BagsFrame.Height = 13 + ceil(NUM_BANKBAGSLOTS / 2) * 39;
    BaudBagBankBags_Update();
    BaudBagRestoreCfg();
  end,

  BANKFRAME_CLOSED = function()
    BankOpen = false;
    BaudBagBankSlotPurchaseButton:Disable();
    if BBCont2_1.AutoOpened then
      BBCont2_1:Hide();
    else
      --Add offline again to bag name
      for ContNum = 1, NumCont[2]do
        BaudBagUpdateName(getglobal("BBCont2_"..ContNum));
      end
    end
    BaudBagAutoOpenSet(1, true);
  end,

  PLAYER_MONEY = function()
    BaudBagBankBags_Update();
  end,

  ITEM_LOCK_CHANGED = function()
    local Bag, Slot = arg1, arg2;
    if(Bag == BANK_CONTAINER)then
      if(Slot <= NUM_BANKGENERIC_SLOTS)then
        BankFrameItemButton_UpdateLocked(getglobal("BaudBagSubBag-1Item"..Slot));
      else
        BankFrameItemButton_UpdateLocked(getglobal("BaudBBankBag"..(Slot-NUM_BANKGENERIC_SLOTS)));
      end
    end
  end
};

local Func = function()
  if(event=="BANKFRAME_OPENED")then
    BankOpen = true;
  end
  BaudBagBankSlotPurchaseButton:Enable();
  for Index = 1, NUM_BANKGENERIC_SLOTS do
    BankFrameItemButton_Update(getglobal("BaudBagSubBag-1Item"..Index));
  end
  for Index = 1, NUM_BANKBAGSLOTS do
    BankFrameItemButton_Update(getglobal("BaudBBankBag"..Index));
  end
  BaudBagBankBags_Update();
  DebugMsg("Recording bank bag info.");
  for Bag = 1, NUM_BANKBAGSLOTS do
    BaudBag_Cache[Bag + 4].BagLink = GetInventoryItemLink("player",67 + Bag);
    BaudBag_Cache[Bag + 4].BagCount = GetInventoryItemCount("player",67 + Bag);
  end

  if(Config[2].Enabled == false)or(event~="BANKFRAME_OPENED")then
    return;
  end
  if BBCont2_1:IsShown()then
    BaudBagUpdateContainer(BBCont2_1);
    BaudBagUpdateFreeSlots(BBCont2_1);
  else
    BBCont2_1.AutoOpened = true;
    BBCont2_1:Show();
  end
  BaudBagAutoOpenSet(1);
  BaudBagAutoOpenSet(2);
end
EventFuncs.BANKFRAME_OPENED = Func;
EventFuncs.PLAYERBANKBAGSLOTS_CHANGED = Func;

Func = function()
  BaudBagAutoOpenSet(1);
end
EventFuncs.MERCHANT_SHOW = Func;
EventFuncs.MAIL_SHOW = Func;
EventFuncs.AUCTION_HOUSE_SHOW = Func;

Func = function()
  BaudBagAutoOpenSet(1,true);
end
EventFuncs.MERCHANT_CLOSED = Func;
EventFuncs.MAIL_CLOSED = Func;
EventFuncs.AUCTION_HOUSE_CLOSED = Func;

Func = function()
  if(event=="PLAYERBANKSLOTS_CHANGED")then
    if(arg1 > NUM_BANKGENERIC_SLOTS)then
      BankFrameItemButton_Update(getglobal("BaudBBankBag"..(arg1-NUM_BANKGENERIC_SLOTS)));
      return;
    end
    local BankBag = getglobal("BaudBagSubBag-1");
    if BankBag:GetParent():IsShown()then
      BaudBagUpdateSubBag(BankBag);
    end
    BankFrameItemButton_Update(getglobal(BankBag:GetName().."Item"..arg1));
    BagSet = 2;
  else
    BagSet = (arg1 ~= -1)and(arg1 <= 4)and 1 or 2;
  end
  local Container = getglobal("BBCont"..BagSet.."_1");
  if not Container:IsShown()then
    return;
  end
  Container.UpdateSlots = true;
end
EventFuncs.BAG_UPDATE = Func;
EventFuncs.BAG_CLOSED = Func;
EventFuncs.PLAYERBANKSLOTS_CHANGED = Func;

function BaudBag_OnLoad(self)
  BINDING_HEADER_BaudBag = "Baud Bag";
  BINDING_NAME_BaudBagToggleBank = "Toggle Bank";

  for Key, Value in pairs(EventFuncs)do
    self:RegisterEvent(Key);
  end

  local SubBag, Container;
  for BagSet = 1, 2 do
    --The first container from each set is different and is created in the XML
    Container = getglobal("BBCont"..BagSet.."_1");
    Container.BagSet = BagSet;
    Container:SetID(1);
    getglobal(Container:GetName().."Slots"):SetPoint("RIGHT",Container:GetName().."MoneyFrame","LEFT");
  end

  --The first bag from the bank is unique and is created in the XML
  DebugMsg("Creating sub bags.");
  for Bag = -2, LastBagID do
    if(Bag == -1)then
      SubBag = getglobal("BaudBagSubBag"..Bag);
    else
      SubBag = CreateFrame("Frame","BaudBagSubBag"..Bag,nil,"BaudBagSubBagTemplate");
    end
    SubBag:SetID(Bag);
    SubBag.BagSet = (Bag ~= -1)and(Bag < 5)and 1 or 2;
    SubBag:SetParent("BBCont"..SubBag.BagSet.."_1");
  end
end


function BaudBag_OnEvent(self, event)
  local BagSet;
  EventFuncs[event]();
end


function BaudBagBagsFrame_OnShow(self)
  --Adjust frame level because of Blizzard's screw up
  local Level = self:GetFrameLevel() + 1;
  for Key, Value in pairs(self:GetChildren())do
    if(type(Value)=="table")then
      Value:SetFrameLevel(Level);
    end
  end
end


local DropDownContainer, DropDownBagSet;

function BaudBagContainerDropDown_Show(self)
  local Container = self:GetParent();
  DropDownContainer = Container:GetID();
  DropDownBagSet = Container.BagSet;
  ToggleDropDownMenu(1, nil, BaudBagContainerDropDown, self:GetName(), 0, 0);
end


function BaudBagContainerDropDown_OnLoad(self)
  UIDropDownMenu_Initialize(self, BaudBagContainerDropDown_Initialize, "MENU");
end


local function ToggleContainerLock(self)
  Config[DropDownBagSet][DropDownContainer].Locked = not Config[DropDownBagSet][DropDownContainer].Locked;
end


local function ShowContainerOptions(self)
  BaudBagOptionsSelectContainer(DropDownBagSet,DropDownContainer);
  BaudBagOptionsFrame:Show();
end


function BaudBagToggleBank(self)
  if BBCont2_1:IsShown()then
    BBCont2_1:Hide();
  else
    BBCont2_1:Show();
    BaudBagAutoOpenSet(2);
  end
end


function BaudBagContainerDropDown_Initialize()
  local info = UIDropDownMenu_CreateInfo();

  info.text = not(DropDownBagSet and Config[DropDownBagSet][DropDownContainer].Locked)and Localized.LockPosition or Localized.UnlockPosition;
  info.func = ToggleContainerLock;
  UIDropDownMenu_AddButton(info);

  --The bank box won't exist yet when this is initialized atfirst
  if(DropDownBagSet~=2)and BBCont2_1 and not BBCont2_1:IsShown()then
    info.text = Localized.ShowBank;
    info.func = BaudBagToggleBank;
    UIDropDownMenu_AddButton(info);
  end

  info.text = Localized.Options;
  info.func = ShowContainerOptions;
  UIDropDownMenu_AddButton(info);
end


--This function updates misc. options for a bag
function BaudUpdateContainerData(BagSet, ContNum)
  local Container = getglobal("BBCont"..BagSet.."_"..ContNum);
  DebugMsg("Updating container data: "..Container:GetName());
  getglobal(Container:GetName().."Name"):SetText(Config[BagSet][ContNum].Name or "");
  local Scale = Config[BagSet][ContNum].Scale / 100;
  Container:SetScale(Scale);
  if not Config[BagSet][ContNum].Coords then
    BaudBagContainerSaveCoords(Container);
  end
  Container:ClearAllPoints();
  local X, Y = unpack(Config[BagSet][ContNum].Coords);
  Container:SetPoint("CENTER",UIParent,"BOTTOMLEFT",(X / Scale), (Y / Scale));
end


local function HideObject(Object)
  Object = getglobal(Object);
  if not Object then
    return;
  end
  Object:Hide();
end

local TextureFile, TextureWidth, TextureHeight, TextureParent;

local function GetTexturePiece(Name, MinX, MaxX, MinY, MaxY, Layer)
  local Texture = getglobal(TextureParent:GetName()..Name);
  if not Texture then
    Texture = TextureParent:CreateTexture(TextureParent:GetName()..Name);
  end
  Texture:ClearAllPoints();
  Texture:SetTexture(TextureFile);
  Texture:SetTexCoord(MinX / TextureWidth, (MaxX + 1) / TextureWidth, MinY / TextureHeight, (MaxY + 1) / TextureHeight);
  Texture:SetWidth(MaxX - MinX + 1);
  Texture:SetHeight(MaxY - MinY + 1);
  Texture:SetDrawLayer(Layer);
  Texture:Show();
--  Texture:SetVertexColor(0.2,0.2,1);
  return Texture;
end


function BaudBagUpdateBackground(Container)
  local Background = Config[Container.BagSet][Container:GetID()].Background;
  local Backdrop = getglobal(Container:GetName().."Backdrop");
  Backdrop:SetFrameLevel(Container:GetFrameLevel());
  local Left, Right, Top, Bottom;
  --This shifts the name of the bank frame over to make room for the extra button
  local ShiftName = (Container:GetID()==1)and 25 or 0;

  if(Background <= 3)then
    Left, Right, Top, Bottom = 10, 10, 25, 7;
    local Cols = Config[Container.BagSet][Container:GetID()].Columns;
    if(Container.Slots < Cols)then
      Cols = Container.Slots;
    end
    local Col = 0;
    local Blanks = Cols - mod(Container.Slots - 1, Cols) - 1;
    local BlankTop = Config[Container.BagSet][Container:GetID()].BlankTop and(Blanks ~= 0);

    if BlankTop then
      Col = Blanks;
    else
      Top = Top + 18;
    end

    local Parent = Backdrop:GetName().."Textures";
    TextureParent = getglobal(Parent);
    TextureParent:SetFrameLevel(Container:GetFrameLevel());
    local Texture;

    TextureFile = "Interface\\ContainerFrame\\UI-Bag-Components";
    if(Background==2)then
      TextureFile = TextureFile.."-Bank";
    elseif(Background==3)then
      TextureFile = TextureFile.."-Keyring";
    end
    TextureWidth, TextureHeight = 256, 512;

    Texture = GetTexturePiece("TopLeft", 65, 116, 1, 49,"ARTWORK");
    Texture:SetPoint("TOPLEFT", -7, 4);

    Texture = GetTexturePiece("TopRight", 223, 252, 5, BlankTop and 30 or 49,"ARTWORK");
    Texture:SetPoint("TOPRIGHT");

    Texture = GetTexturePiece("BottomLeft",72,79,169,177,"ARTWORK");
    Texture:SetPoint("BOTTOMLEFT");

    Texture = GetTexturePiece("BottomRight",247,252,172,177,"ARTWORK");
    Texture:SetPoint("BOTTOMRIGHT");

    Texture = GetTexturePiece("Top", 117, 222, 5, BlankTop and 30 or 49,"ARTWORK");
    Texture:SetPoint("TOP");
    Texture:SetPoint("RIGHT",Parent.."TopRight","LEFT");
    Texture:SetPoint("LEFT",Parent.."TopLeft","RIGHT");

    Texture = GetTexturePiece("Left",72,76,182,432,"ARTWORK");
    Texture:SetPoint("LEFT");
    Texture:SetPoint("BOTTOM",Parent.."BottomLeft","TOP");
    Texture:SetPoint("TOP",Parent.."TopLeft","BOTTOM");

    Texture = GetTexturePiece("Right",248,252,182,432,"ARTWORK");
    Texture:SetPoint("RIGHT");
    Texture:SetPoint("BOTTOM",Parent.."BottomRight","TOP");
    Texture:SetPoint("TOP",Parent.."TopRight","BOTTOM");

    Texture = GetTexturePiece("Bottom",80,246,173,177,"OVERLAY");
    Texture:SetPoint("BOTTOM");
    Texture:SetPoint("LEFT",Parent.."BottomLeft","RIGHT");
    Texture:SetPoint("RIGHT",Parent.."BottomRight","LEFT");

    if(Blanks > 0)then
      local Width = Blanks * 42;
      if BlankTop then
        Texture = GetTexturePiece("BlankFillEdge", 116, 223, 31, 34,"ARTWORK");
        Texture:SetPoint("TOPLEFT",Parent.."Top","BOTTOMLEFT");
        Texture:SetPoint("RIGHT",Container,"LEFT",Width,0);

        Texture = GetTexturePiece("BlankFillLeft", 72, 116, 142, 162,"ARTWORK");
        Texture:SetPoint("TOPRIGHT",Parent.."TopLeft","BOTTOMRIGHT",0,3);
        Texture:SetPoint("BOTTOM",Container,"TOP",0,-42);

        --Since the texture in already stretched about double in height, try to keep the ratio
        local TexWidth = (Width / 2 > 107)and 107 or (Width / 2);
        Texture = GetTexturePiece("BlankFill", 223-TexWidth, 223, 35, 49,"ARTWORK");
        Texture:SetPoint("TOPRIGHT",Parent.."BlankFillEdge","BOTTOMRIGHT");
        Texture:SetPoint("BOTTOMLEFT",Parent.."BlankFillLeft","BOTTOMRIGHT");
      else
        Texture = GetTexturePiece("BlankFillEdge",245,248,30,49,"ARTWORK");
        Texture:SetPoint("BOTTOM",Container,"BOTTOM",0,-5);
        Texture:SetPoint("RIGHT",Parent.."Right","LEFT");
        Texture:SetHeight(42);
        --Avoids the texture becomming too compressed if the space is infact small
        local TexWidth = (Width > 132)and 132 or Width;
        Texture = GetTexturePiece("BlankFill",245-TexWidth,244,30,49,"ARTWORK");
        Texture:SetPoint("BOTTOMRIGHT",Parent.."BlankFillEdge","BOTTOMLEFT");
        Texture:SetPoint("TOPRIGHT",Parent.."BlankFillEdge","TOPLEFT");
        Texture:SetPoint("LEFT",Container,"RIGHT",-Width,0);
        HideObject(Parent.."BlankFillLeft");
      end
    else
      HideObject(Parent.."BlankFill");
      HideObject(Parent.."BlankFillEdge");
      HideObject(Parent.."BlankFillLeft");
    end

    --Width is 42, Height is 41
    local Row = 1;
    local OffsetX, OffsetY;
    for Slot = 1, Container.Slots do
      Col = Col + 1;
      if(Col > Cols)then
        Col = 1;
        Row = Row + 1;
      end
      Texture = GetTexturePiece("Slot"..Slot,118,164,213,258,"BORDER");
      OffsetX, OffsetY = -2, -2;
      Texture:SetPoint("TOPLEFT",Container,"TOPLEFT",(Col - 1) * 42 + OffsetX - 3, (Row - 1) * -41 + 2 - OffsetY);
    end
    if(Container.Slots > (TextureParent.Slots or -1))then
      TextureParent.Slots = Container.Slots;
    else
      --Hide extra slot textures
      for Slot = (Container.Slots + 1), TextureParent.Slots do
        getglobal(TextureParent:GetName().."Slot"..Slot):Hide();
      end
    end
    --Makes corner gap look better
    HideObject(Parent.."Corner");
    if(Blanks > 0)then
      local Slot = BlankTop and (Cols + 1) or (Container.Slots - Cols);
      if(Slot >= 1)or(Slot <= Container.Slots)then
        if not BlankTop then
          Texture = GetTexturePiece("Corner",154,164,248,258,"OVERLAY");
          Texture:SetPoint("BOTTOMRIGHT",Parent.."Slot"..Slot);
        else
          Texture = GetTexturePiece("Corner",118,128,213,223,"OVERLAY");
          Texture:SetPoint("TOPLEFT",Parent.."Slot"..Slot);
        end
      end
    end

    --Adds the box for the money/slot indicators
    if(Container:GetID()==1)then
      Bottom = Bottom + 20;
      TextureFile = "Interface\\ContainerFrame\\UI-BackpackBackground.blp";
      TextureWidth, TextureHeight = 256, 256;

      Texture = GetTexturePiece("BottomFillLeft",80,84,213,231,"BACKGROUND");
      Texture:SetPoint("LEFT",Parent.."Left","RIGHT");
      Texture:SetPoint("BOTTOM",Parent.."Bottom","TOP",0,-2);

      Texture = GetTexturePiece("BottomFillRight",240,244,213,231,"BACKGROUND");
      Texture:SetPoint("RIGHT",Parent.."Right","LEFT");
      Texture:SetPoint("BOTTOM",Parent.."Bottom","TOP",0,-2);

      Texture = GetTexturePiece("BottomFillCenter",85,239,213,231,"BACKGROUND");
      Texture:SetPoint("LEFT",Parent.."BottomFillLeft","RIGHT");
      Texture:SetPoint("RIGHT",Parent.."BottomFillRight","LEFT");
    end

    --Add a picture of the bag in the circle
    Texture = getglobal(Parent.."Bag");
    if not Texture then
      Texture = TextureParent:CreateTexture(Parent.."Bag");
      Texture:SetWidth(40);
      Texture:SetHeight(40);
      Texture:ClearAllPoints();
      Texture:SetPoint("TOPLEFT",Parent.."TopLeft","TOPLEFT",3,-3);
      Texture:SetDrawLayer("BACKGROUND");
    end
    local Icon;
    local BagID = Container.Bags[1]:GetID();
    if(BagID <= 0)then
      Icon = BaudBagIcons[BagID];
    elseif(Container.BagSet==2)and not BankOpen and BaudBag_Cache[BagID].BagLink then
      Icon = GetItemIcon(BaudBag_Cache[BagID].BagLink);
    else
      Icon = GetInventoryItemTexture("player",ContainerIDToInventoryID(BagID));
    end

    SetPortraitToTexture(Texture,Icon or "Interface\\Icons\\INV_Misc_QuestionMark");

    Backdrop:SetBackdrop(nil);

    --Adjust the positioning of several bag components
    getglobal(Container:GetName().."Name"):SetPoint("TOPLEFT",Backdrop,"TOPLEFT",(45 + ShiftName),-7);
    getglobal(Container:GetName().."CloseButton"):SetPoint("TOPRIGHT",Backdrop,"TOPRIGHT",3,3);
    TextureParent:Show();
    if(Container:GetID()==1)then
      getglobal(Container:GetName().."Slots"):SetPoint("BOTTOMLEFT",Backdrop,"BOTTOMLEFT",12,7);
      getglobal(Container:GetName().."MoneyFrame"):SetPoint("BOTTOMRIGHT",Backdrop,"BOTTOMRIGHT",0,6);
    end
  else
    Left, Right, Top, Bottom = 8, 8, 28, 8;
    getglobal(Backdrop:GetName().."Textures"):Hide();

    getglobal(Container:GetName().."Name"):SetPoint("TOPLEFT",(2 + ShiftName),18);
    getglobal(Container:GetName().."CloseButton"):SetPoint("TOPRIGHT",8,28);
    if(Container:GetID()==1)then
      getglobal(Container:GetName().."Slots"):SetPoint("BOTTOMLEFT",2,-17);
      getglobal(Container:GetName().."MoneyFrame"):SetPoint("BOTTOMRIGHT",8,-18);
      Bottom = Bottom + 18;
    end

    if(Background==5)then
      Backdrop:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 8, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
      });
      Left, Right, Top, Bottom = Left+8, Right+8, Top+8, Bottom+8;
      Backdrop:SetBackdropColor(0.1,0.1,0.1,1);
    else
      Backdrop:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 5, right = 5, top = 5, bottom = 5 }
      });
      Backdrop:SetBackdropColor(0,0,0,1);
    end
  end
  getglobal(Container:GetName().."Name"):SetPoint("RIGHT",Container:GetName().."MenuButton","LEFT");

  Backdrop:ClearAllPoints();
  Backdrop:SetPoint("TOPLEFT",-Left,Top);
  Backdrop:SetPoint("BOTTOMRIGHT",Right,-Bottom);
  Container:SetHitRectInsets(-Left,-Right,-Top,-Bottom);
end


--This function updates the parent containers for each bag, according to the options setup
function BaudUpdateJoinedBags()
  DebugMsg("Updating joined bags...");
  local OpenBags = {};
  for Bag = -2, LastBagID do
    OpenBags[Bag] = getglobal("BaudBagSubBag"..Bag):GetParent():IsShown();
    if OpenBags[Bag]then
      DebugMsg("Bag open: "..Bag);
    end
  end
  local SubBag, Container, IsOpen, ContNum, BagID;
  local function FinishContainer()
    if IsOpen then
      DebugMsg("Showing Container "..Container:GetName());
      Container:Show();
    else
      DebugMsg("Hiding Container "..Container:GetName());
      Container:Hide();
    end
    BaudBagUpdateContainer(Container);
  end

  for BagSet = 1, 2 do
    ContNum = 0;
    BaudBagForEachBag(BagSet,function(Bag, Index)
      if(ContNum==0)or(Config[BagSet].Joined[Index]==false)then
        if(ContNum~=0)then
          FinishContainer();
        end
        IsOpen = false;
        ContNum = ContNum + 1;
        if(MaxCont[BagSet] < ContNum)then
          Container = CreateFrame("Frame","BBCont"..BagSet.."_"..ContNum,UIParent,"BaudBagContainerTemplate");
          Container:SetID(ContNum);
          Container.BagSet = BagSet;
          MaxCont[BagSet] = ContNum;
        end
        Container = getglobal("BBCont"..BagSet.."_"..ContNum);
        Container.Bags = {};
        BaudUpdateContainerData(BagSet,ContNum);
      end
      SubBag = getglobal("BaudBagSubBag"..Bag);
      tinsert(Container.Bags,SubBag);
      SubBag:SetParent(Container);
      if OpenBags[Bag]then
        IsOpen = true;
      end
    end);
    FinishContainer();

    NumCont[BagSet] = ContNum;
    --Hide extra containers that were created before
    for ContNum = (ContNum + 1), MaxCont[BagSet]do
      getglobal("BBCont"..BagSet.."_"..ContNum):Hide();
    end
  end
  BagsReady = true;
end


function BaudBagUpdateOpenBags()
  local Open, Frame, Highlight, Highlight2;
  --The bank bag(-1) has no open indicator
  for Bag = -2, LastBagID do
    Frame = getglobal("BaudBagSubBag"..Bag);
    Open = Frame:IsShown()and Frame:GetParent():IsShown()and not Frame:GetParent().Closing;
    if(Bag == -2)then
    	if Open then
    		BaudBagKeyRingButton:SetButtonState("PUSHED", 1);
    		KeyRingButton:SetButtonState("PUSHED", 1);
    	else
    		BaudBagKeyRingButton:SetButtonState("NORMAL");
    		KeyRingButton:SetButtonState("NORMAL");
    	end
    elseif(Bag == 0)then
      MainMenuBarBackpackButton:SetChecked(Open);
    elseif(Bag > 4)then
      Highlight = getglobal("BaudBBankBag"..(Bag-4).."HighlightFrameTexture");
      Highlight2 = getglobal("BankFrameBag"..(Bag-4).."HighlightFrameTexture");
      if Open then
        Highlight:Show();
        Highlight2:Show();
      else
        Highlight:Hide();
        Highlight2:Hide();
      end
    elseif(Bag > 0)then
      getglobal("CharacterBag"..(Bag-1).."Slot"):SetChecked(Open);
      getglobal("BaudBInveBag"..(Bag-1).."Slot"):SetChecked(Open);
    end
  end
end


function BaudBagAutoOpenSet(BagSet, Close)
  --Set 2 doesn't need container 1 to be shown because that's a given
  local Container;
  for ContNum = BagSet, NumCont[BagSet]do
    if Config[BagSet][ContNum].AutoOpen then
      Container = getglobal("BBCont"..BagSet.."_"..ContNum);
      if not Close then
        if not Container:IsShown()then
          Container.AutoOpened = true;
          Container:Show();
        end

      elseif Container.AutoOpened then
        Container:Hide();
      end
    end
  end
end


function BaudBagCloseBagSet(BagSet)
  for ContNum = 1, MaxCont[BagSet]do
    getglobal("BBCont"..BagSet.."_"..ContNum):Hide();
  end
end


local pre_ToggleBag = ToggleBag;
ToggleBag = function(id)
  local self = this;
  if(id > 4)then
    if Config and(Config[2].Enabled == false)then
      return pre_ToggleBag(id);
    end
    if not BagsReady then
      return;
    end
  --The close button thing allows the original blizzard bags to be closed if they're still open
  elseif(Config[1].Enabled == false)or self and(strsub(self:GetName(),-11)=="CloseButton")then
    return pre_ToggleBag(id);
  end
  --Blizzard's stuff will automaticaly try open the bags at the mailbox and vendor.  Baud Bag will be in charge of that.
  if not BagsReady or(self==MailFrame)or(self==MerchantFrame)then
    return;
  end
  DebugMsg("Toggling bag: "..id.."("..(self and self:GetName() or "nil")..")");
  local Container = getglobal("BaudBagSubBag"..id);
  if not Container then
    return pre_ToggleBag(id);
  end
  Container = Container:GetParent();
  --if the bag to open is inside the main bank container, don't toggle it
  if self and((Container == BBCont2_1)and(strsub(self:GetName(),1,9)=="BaudBBank")or
  (Container == BBCont1_1)and((strsub(self:GetName(),1,9)=="BaudBInve")or(self==BaudBagKeyRingButton)))then
    return;
  end
  --ChatFrame1:AddMessage("Toggling "..Container:GetName()..", Trigger "..self:GetName());

  if Container:IsShown() then
    Container:Hide();
  else
    Container:Show();
  end
end


local pre_OpenAllBags = OpenAllBags;
OpenAllBags = function(forceOpen)
  if Config and(Config[1].Enabled == false)then
    return pre_OpenAllBags(forceOpen);
  end
  if not BagsReady then
    return;
  end
  local Container, AnyShown;
  for Bag = 0, 4 do
    Container = getglobal("BaudBagSubBag"..Bag):GetParent();
    if(GetContainerNumSlots(Bag) > 0)and not Container:IsShown()then
      Container:Show();
      AnyShown = true;
    end
  end
  if not AnyShown then
    BaudBagCloseBagSet(1);
  end
end


local pre_BagSlotButton_OnClick = BagSlotButton_OnClick;
BagSlotButton_OnClick = function(self)
  if Config and(Config[1].Enabled == false)then
    return pre_BagSlotButton_OnClick();
  end
  if not PutItemInBag(self:GetID())then
    ToggleBag(self:GetID() - CharacterBag0Slot:GetID() + 1);
  end
end


local pre_ToggleBackpack = ToggleBackpack;
ToggleBackpack = function()
  if Config and(Config[1].Enabled == false)then
    return pre_ToggleBackpack();
  end
  if not BagsReady then
    return;
  end
  if this and(this==FuBarPluginBagFuFrame)then
    OpenAllBags();
  else
    ToggleBag(0);
  end
end


local pre_ToggleKeyRing = ToggleKeyRing;
ToggleKeyRing = function()
  if Config and(Config[1].Enabled == false)then
    return pre_ToggleKeyRing();
  end
  if not BagsReady then
    return;
  end
  ToggleBag(-2);
end


local function IsBagShown(BagID)
  local SubBag = getglobal("BaudBagSubBag"..BagID);
  return SubBag:IsShown()and SubBag:GetParent():IsShown()and not SubBag:GetParent().Closing;
end


local function UpdateThisHighlight(self)
  if Config and(Config[1].Enabled == false)then
    return;
  end
  self:SetChecked(IsBagShown(self:GetID() - CharacterBag0Slot:GetID() + 1));
end

--These function hooks override the bag button highlight changes that Blizzard does
hooksecurefunc("BagSlotButton_OnClick",UpdateThisHighlight);
hooksecurefunc("BagSlotButton_OnDrag",UpdateThisHighlight);
hooksecurefunc("BagSlotButton_OnModifiedClick",UpdateThisHighlight);
hooksecurefunc("BackpackButton_OnClick",function(self)
  if Config and(Config[1].Enabled == false)then
    return;
  end
  self:SetChecked(IsBagShown(0));
end);
hooksecurefunc("UpdateMicroButtons",function()
  if Config and(Config[1].Enabled == false)then
    return;
  end
	if IsBagShown(KEYRING_CONTAINER)then
		KeyRingButton:SetButtonState("PUSHED", 1);
	else
		KeyRingButton:SetButtonState("NORMAL");
	end
end);


--self is hooked to be able to replace the original bank box with this one
local pre_BankFrame_OnEvent = BankFrame_OnEvent;
BankFrame_OnEvent = function(self, event, ...)
  if Config and(Config[2].Enabled == false)then
    return pre_BankFrame_OnEvent(self, event, ...);
  end
end


local SubBagEvents = {
  BAG_UPDATE = function(self)
    if(self:GetID()~=arg1)then
      return;
    end
    --BAG_UPDATE is the only event called when a bag is added, so if no bag existed before, refresh
    if(self.size > 0)then
      ContainerFrame_Update(self);
      BaudBagUpdateSubBag(self);
    else
      self:GetParent().Refresh = true;
    end
  end,

  BAG_CLOSED = function(self)
    if(self:GetID()~=arg1)then
      return;
    end
    --self event occurs when bags are swapped too, but updated information is not immediately
    --available to the addon, so the bag must be updated later.
    self:GetParent().Refresh = true;
  end
};

local Func = function(self)
  ContainerFrame_Update(self);
end
SubBagEvents.ITEM_LOCK_CHANGED = Func;
SubBagEvents.BAG_UPDATE_COOLDOWN = Func;
SubBagEvents.UPDATE_INVENTORY_ALERTS = Func;


function BaudBagSubBag_OnLoad(self)
  for Key, Value in pairs(SubBagEvents)do
    self:RegisterEvent(Key);
  end
end


function BaudBagUpdateSubBag(SubBag)
  local Link, Quality, Texture, ItemButton;
  local ShowColor = Config[SubBag.BagSet][SubBag:GetParent():GetID()].RarityColor;
  SubBag.FreeSlots = 0;
  for Slot = 1, SubBag.size do
    Quality = nil;
    ItemButton = getglobal(SubBag:GetName().."Item"..Slot);
    if(SubBag.BagSet~=2)or BankOpen then
      Link = GetContainerItemLink(SubBag:GetID(),Slot);
      if(SubBag.BagSet==2)then
        if not Link then
          BaudBag_Cache[SubBag:GetID()][Slot] = nil;
        else
          BaudBag_Cache[SubBag:GetID()][Slot] = {Link = Link, Count = select(2,GetContainerItemInfo(SubBag:GetID(),Slot))};
        end
      end
      if Link then
        Quality = select(3,GetItemInfo(Link));
      end
    elseif BaudBag_Cache[SubBag:GetID()][Slot]then
      Link = BaudBag_Cache[SubBag:GetID()][Slot].Link;
      SetItemButtonCount(ItemButton, BaudBag_Cache[SubBag:GetID()][Slot].Count or 0);
      if Link then
         _, _, Quality, _, _, _, _, _, _, Texture = GetItemInfo(Link);
      else
        Texture = nil;
      end
      SetItemButtonTexture(ItemButton,Texture);
    end
    if not Link then
      SubBag.FreeSlots = SubBag.FreeSlots + 1;
    end
    Texture = getglobal(ItemButton:GetName().."Border");
    if Quality and(Quality > 1)and ShowColor then
      Texture:SetVertexColor(GetItemQualityColor(Quality));
      Texture:Show();
--[[      getglobal(ItemButton:GetName().."Border"):SetVertexColor(GetItemQualityColor(Quality));
      getglobal(ItemButton:GetName().."Border"):Show();]]
    else
--[[      getglobal(ItemButton:GetName().."NormalTexture"):SetTexture("Interface\\Buttons\\UI-Quickslot2");
      SetItemButtonNormalTextureVertexColor(ItemButton,1,1,1);]]
      Texture:Hide();
    end
  end
end


function BaudBagSubBag_OnEvent(self, event)
  if not self:GetParent():IsShown()or(self:GetID() >= 5)and not BankOpen then
    return;
  end
  SubBagEvents[event](self);
end


function BaudBagContainer_OnLoad(self)
  tinsert(UISpecialFrames, self:GetName());
  self:RegisterForDrag("LeftButton");
end


function BaudBagContainer_OnUpdate(self)
  if self.Refresh then
    BaudBagUpdateContainer(self);
    BaudBagUpdateOpenBags();
  end
  if self.UpdateSlots then
    BaudBagUpdateFreeSlots(self);
  end
  if self.FadeStart then
    local Alpha = (GetTime() - self.FadeStart) / FadeTime;
    if self.Closing then
      Alpha = 1 - Alpha;
      if(Alpha < 0)then
        self.FadeStart = nil;
        self:Hide();
        self.Closing = nil;
        return;
      end
    elseif(Alpha > 1)then
      self:SetAlpha(1);
      self.FadeStart = nil;
      return;
    end
    self:SetAlpha(Alpha);
  end
end


function BaudBagContainer_OnShow(self)
  if self.FadeStart then
    return;
  end
  self.FadeStart = GetTime();
  PlaySound("igBackPackOpen");
  BaudBagUpdateContainer(self);
  BaudBagUpdateOpenBags();
  if(self:GetID()==1)then
    BaudBagUpdateFreeSlots(self);
  end
end


function BaudBagContainer_OnHide(self)
  if self.Closing then
    if self.FadeStart then
      self:Show();
    end
    return;
  end
  self.FadeStart = GetTime();
  self.Closing = true;
  PlaySound("igBackPackClose");
  self.AutoOpened = false;
  BaudBagUpdateOpenBags();
  if(self.BagSet==2)and(self:GetID()==1)then
    if BankOpen and(Config[2].Enabled==true)then
      CloseBankFrame();
    end
    BaudBagCloseBagSet(2);
  end
  self:Show();
end


function BaudBagContainer_OnDragStart(self)
  if not Config[self.BagSet][self:GetID()].Locked then
    self:StartMoving();
  end
end


function BaudBagContainer_OnDragStop(self)
  self:StopMovingOrSizing();
  BaudBagContainerSaveCoords(self);
end


function BaudBagContainerSaveCoords(Frame)
  DebugMsg("Saving container coords: "..Frame:GetName());
  local Scale = Frame:GetScale();
  local X, Y = Frame:GetCenter();
  X = X * Scale;
  Y = Y * Scale;
  Config[Frame.BagSet][Frame:GetID()].Coords = {X, Y};
end


local TotalFree, TotalSlots;

local function AddFreeSlots(Bag)
  if(Bag<=-2)then
    return;
  end
  local Cache = UseCache(Bag);
  local NumSlots;
  if not Cache then
    local Free, Family = GetContainerNumFreeSlots(Bag);
    if(Family~=0)then
      return;
    end
    TotalFree = TotalFree + Free;
    NumSlots = GetContainerNumSlots(Bag);
  else
    if(Bag > 0)then
      local Link = BaudBag_Cache[Bag].BagLink;
      if not Link or(GetItemFamily(Link)~=0)then
        return;
      end
    end
    NumSlots = BaudBag_Cache[Bag].Size;
    for Slot = 1, NumSlots do
      if not BaudBag_Cache[Bag][Slot]then
        TotalFree = TotalFree + 1;
      end
    end
  end
  TotalSlots = TotalSlots + NumSlots;
end


function BaudBagUpdateFreeSlots(Frame)
  Frame.UpdateSlots = nil;
  DebugMsg("Counting free slots for set "..Frame.BagSet);
  TotalFree, TotalSlots = 0, 0;
  if(Frame.BagSet==1)then
    for Bag = 0, 4 do
      AddFreeSlots(Bag);
    end
  else
    AddFreeSlots(-1);
    for Bag = 5, LastBagID do
      AddFreeSlots(Bag);
    end
  end
  getglobal(Frame:GetName().."Slots"):SetText(TotalFree.."/"..TotalSlots..Localized.Free);
end


function BaudBagBankBags_Update()
  local Purchase = BaudBagBankSlotPurchaseFrame;
  local Slots, Full = GetNumBankSlots();
  local BagSlot;

  for Bag = 1, NUM_BANKBAGSLOTS do
    BagSlot = getglobal("BaudBBankBag"..Bag);

    if(Bag <= Slots)then
      SetItemButtonTextureVertexColor(BagSlot, 1.0, 1.0, 1.0);
      BagSlot.tooltipText = BANK_BAG;
    else
      SetItemButtonTextureVertexColor(BagSlot, 1.0, 0.1, 0.1);
      BagSlot.tooltipText = BANK_BAG_PURCHASE;
    end
  end

  if Full then
    Purchase:Hide();
    BBCont2_1BagsFrame:SetHeight(BBCont2_1BagsFrame.Height);
    return;
  end

  local Cost = GetBankSlotCost(Slots);

  --This line allows the confirmation box to show the cost
  BankFrame.nextSlotCost = Cost;

  if( GetMoney() >= Cost ) then
    SetMoneyFrameColor(Purchase:GetName().."MoneyFrame", 1.0, 1.0, 1.0);
  else
    SetMoneyFrameColor(Purchase:GetName().."MoneyFrame", 1.0, 0.1, 0.1);
  end
  MoneyFrame_Update(Purchase:GetName().."MoneyFrame", Cost);

  Purchase:Show();
  BBCont2_1BagsFrame:SetHeight(BBCont2_1BagsFrame.Height + 40);
end


--This is for the button that toggles the bank bag display
function BaudBagBagsButton_OnClick(self)
  local Set = self:GetParent().BagSet;
  --Bank set is automaticaly shown, and main bags are not
  Config[Set].ShowBags = (Config[Set].ShowBags==false);
  BaudBagUpdateBagFrames();
end


function BaudBagUpdateBagFrames()
  local Shown, BagFrame;
  for BagSet = 1, 2 do
    Shown = (Config[BagSet].ShowBags ~= false);
    getglobal("BBCont"..BagSet.."_1BagsButton"):SetChecked(Shown);
    BagFrame = getglobal("BBCont"..BagSet.."_1BagsFrame");
    if Shown then
      BagFrame:Show();
    else
      BagFrame:Hide();
    end
  end
end


function BaudBagUpdateName(Container)
  local Name = getglobal(Container:GetName().."Name");
  if(Container.BagSet~=2)or BankOpen then
    Name:SetText(Config[Container.BagSet][Container:GetID()].Name or "");
    Name:SetTextColor(NORMAL_FONT_COLOR.r,NORMAL_FONT_COLOR.g,NORMAL_FONT_COLOR.b);
  else
    Name:SetText(Config[Container.BagSet][Container:GetID()].Name..Localized.Offline);
    Name:SetTextColor(RED_FONT_COLOR.r,RED_FONT_COLOR.g,RED_FONT_COLOR.b);
  end
end


function BaudBagUpdateContainer(Container)
  DebugMsg("Updating Container: "..Container:GetName());
  Container.Refresh = false;
  BaudBagUpdateName(Container);
  local SlotLevel = Container:GetFrameLevel() + 1;
  local ContCfg = Config[Container.BagSet][Container:GetID()];
  local Background = ContCfg.Background;
  local MaxCols = ContCfg.Columns;
  local Size, KeyRing;
  Container.Slots = 0;
  for _, SubBag in ipairs(Container.Bags)do
    if(Container.BagSet~=2)or BankOpen then
      Size = GetContainerNumSlots(SubBag:GetID());
      if(SubBag:GetID()==-2)then
        local LastUsed = 0;
        local FirstEmpty;
        for Slot = 1, Size do
          if GetContainerItemLink(-2, Slot)then
            LastUsed = Slot;
          elseif not FirstEmpty then
            FirstEmpty = Slot;
          end
        end
        if FirstEmpty and(LastUsed < Size)then
          KeyRing = SubBag;
          local Max = Size;
          Size = max(FirstEmpty, LastUsed);
          KeyRing.Expandable = Max - Size;
        end
      end
      if(Container.BagSet==2)then
        --Clear out excess information if the size of a bag decreases
        if(BaudBag_Cache[SubBag:GetID()].Size > Size)then
          for Slot = Size, BaudBag_Cache[SubBag:GetID()].Size do
            if BaudBag_Cache[SubBag:GetID()][Slot]then
              BaudBag_Cache[SubBag:GetID()][Slot] = nil;
            end
          end
        end
        BaudBag_Cache[SubBag:GetID()].Size = Size;
      end
    else
      Size = BaudBag_Cache[SubBag:GetID()]and BaudBag_Cache[SubBag:GetID()].Size or 0;
    end
    SubBag.size = Size;
    Container.Slots = Container.Slots + Size;
  end
  if(Container.Slots <= 0)then
    if Container:IsShown()then
      DEFAULT_CHAT_FRAME:AddMessage("Container \""..ContCfg.Name.."\" has no contents.",1,1,0);
      Container:Hide();
    end
    return;
  end
  if(Container.Slots < MaxCols)then
    MaxCols = Container.Slots;
  elseif KeyRing and(Container.Slots % MaxCols ~= 0)then
    local Increase = min(KeyRing.Expandable, MaxCols - Container.Slots % MaxCols);
    KeyRing.size = KeyRing.size + Increase;
    Container.Slots = Container.Slots + Increase;
  end

  local Col, Row = 0, 1;
  --The textured background puts its empty space on the upper left
  if ContCfg.BlankTop then
    Col = MaxCols - mod(Container.Slots - 1,MaxCols) - 1;
  end

  local Slots, SubBag, ItemButton;
  for _, SubBag in pairs(Container.Bags)do
    if(SubBag.size <= 0)then
      SubBag:Hide();
    else
      DebugMsg("Adding "..SubBag:GetName());
      --Create extra slots if needed
      if(SubBag.size > (SubBag.maxSlots or 0))then
        for Slot = (SubBag.maxSlots or 0) + 1, SubBag.size do
          local Button = CreateFrame("Button",SubBag:GetName().."Item"..Slot,SubBag,(SubBag:GetID() ~= -1)and "ContainerFrameItemButtonTemplate" or "BankItemButtonGenericTemplate");
          Button:SetID(Slot);
          local Texture = Button:CreateTexture(Button:GetName().."Border","OVERLAY");
          Texture:Hide();
          Texture:SetTexture("Interface\\Buttons\\UI-ActionButton-Border");
          Texture:SetPoint("CENTER");
          Texture:SetBlendMode("ADD");
          Texture:SetAlpha(0.8);
          Texture:SetHeight(70);
          Texture:SetWidth(70);
        end
        SubBag.maxSlots = SubBag.size;
      end
      if(SubBag:GetID()~=-1)and(BankOpen or(SubBag:GetID() < 5))then
        ContainerFrame_Update(SubBag);
      end
      BaudBagUpdateSubBag(SubBag);
      for Slot = 1, SubBag.maxSlots do
        ItemButton = getglobal(SubBag:GetName().."Item"..Slot);
        if(Slot <= SubBag.size)then
          Col = Col + 1;
          if(Col > MaxCols)then
            Col = 1;
            Row = Row + 1;
          end
          ItemButton:ClearAllPoints();
          --Slot spacing is different for the blizzard textured background
          if(Background<=3)then
            ItemButton:SetPoint("TOPLEFT",Container,"TOPLEFT",(Col-1)*42,(Row-1)*-41);
          else
            ItemButton:SetPoint("TOPLEFT",Container,"TOPLEFT",(Col-1)*39,(Row-1)*-39);
          end
          ItemButton:SetFrameLevel(SlotLevel);
          ItemButton:Show();
        else
          ItemButton:Hide();
        end
      end
      SubBag:Show();
    end
  end
  if(Background<=3)then
    Container:SetWidth(MaxCols * 42 - 5);
    Container:SetHeight(Row * 41 - 4);
  else
    Container:SetWidth(MaxCols * 39 - 2);
    Container:SetHeight(Row * 39 - 2);
  end
  BaudBagUpdateBackground(Container);
  DebugMsg("Finished Arranging Container.");
end


function BaudBag_OnModifiedClick(self, button)
  if not UseCache(self:GetParent():GetID())then
    return;
  end
  if IsModifiedClick("SPLITSTACK")then
    StackSplitFrame:Hide();
  end
  if BaudBag_Cache[self:GetParent():GetID()][self:GetID()]then
    HandleModifiedItemClick(BaudBag_Cache[self:GetParent():GetID()][self:GetID()].Link);
  end
end


hooksecurefunc("ContainerFrameItemButton_OnModifiedClick", BaudBag_OnModifiedClick);
hooksecurefunc("BankFrameItemButtonGeneric_OnModifiedClick", BaudBag_OnModifiedClick);


function BaudBagKeyRing_OnLoad(self)
  local Clone = KeyRingButton;
  Clone:GetScript("OnLoad")(self);
  self:SetScript("OnClick", Clone:GetScript("OnClick"));
  self:SetScript("OnReceiveDrag", Clone:GetScript("OnReceiveDrag"));
  self:SetScript("OnEnter", Clone:GetScript("OnEnter"));
  self:SetScript("OnLeave", Clone:GetScript("OnLeave"));
  self:GetNormalTexture():SetTexCoord(0.5625,0,0,0,0.5625,0.60937,0,0.60937);
  self:GetHighlightTexture():SetTexCoord(0.5625,0,0,0,0.5625,0.60937,0,0.60937);
  self:GetPushedTexture():SetTexCoord(0.5625,0,0,0,0.5625,0.60937,0,0.60937);
end


local function CopyTable(Value)
  if(type(Value)~="table")then
    return Value;
  end
  local Table = {};
  table.foreach(Value, function(k,v) Table[k]=CopyTable(v) end);
  return Table;
end


function BaudBagOptionsFrame_OnLoad(self)
  BaudBagNameEditBoxText:SetText(Localized.ContainerName);
  BaudBagOptionsSetDropDownLabel:SetText(Localized.BagSet);
  BaudBagOptionsBackgroundDropDownLabel:SetText(Localized.Background);
  BaudBagOptionsFrameTitle:SetText("Baud Bag "..Localized.Options);

  self:RegisterEvent("PLAYER_LOGIN");
  self:RegisterForDrag("LeftButton");
  tinsert(UIMenus, self:GetName());
  SlashCmdList[Prefix.."_Options"] = function() BaudBagOptionsFrame:Show();end
  SLASH_BaudBag_Options1 = "/baudbag";
  SLASH_BaudBag_OptionsMenuName = "Baud Bag"; --Baud Menu Info
  DEFAULT_CHAT_FRAME:AddMessage(Localized.AddMessage);

  BaudBagOptionsFrame:SetWidth(43 * MaxBags + 70);
  local Button, Check;
  for Bag = 1, MaxBags do
    Button = CreateFrame("CheckButton","BaudBagOptionsBag"..Bag,BaudBagOptionsFrame,"BaudBagOptionsBagTemplate");
    CreateFrame("Frame","BaudBagOptionsContainer"..Bag,BaudBagOptionsFrame,"BaudBagOptionsContainerTemplate");
    if(Bag == 1)then
      BaudBagOptionsContainer1:SetPoint("LEFT",BaudBagOptionsBag1,"LEFT",-6,0);
    else
      Button:SetPoint("LEFT","BaudBagOptionsBag"..(Bag-1),"RIGHT",8,0);
      Check = CreateFrame("CheckButton","BaudBagOptionsJoinCheck"..Bag,Button,"BaudBagOptionsJoinCheckTemplate");
      Check:SetPoint("BOTTOM",Button,"TOPLEFT",-4,4);
      Check:SetID(Bag);
      Check.tooltipText = Localized.CheckTooltip;
    end
  end

  BaudBagEnabledCheckText:SetText(Localized.Enabled);
  BaudBagEnabledCheck.tooltipText = Localized.EnabledTooltip;

  for Key, Value in ipairs(SliderBars)do
    getglobal(Prefix.."Slider"..Key.."Low"):SetText(Value.Low);
    getglobal(Prefix.."Slider"..Key.."High"):SetText(Value.High);
    getglobal(Prefix.."Slider"..Key).tooltipText = Value.TooltipText;
  end
  for Key, Value in ipairs(CheckButtons)do
    getglobal(Prefix.."CheckButton"..Key.."Text"):SetText(Value.Text);
    getglobal(Prefix.."CheckButton"..Key).tooltipText = Value.TooltipText;
  end
end


function BaudBagOptionsFrame_OnEvent(self)
  --Restoring the config also updates the bags, which requires the info available at login
  if(event=="PLAYER_LOGIN")then
    UIDropDownMenu_SetWidth(BaudBagOptionsSetDropDown, 90);
    UIDropDownMenu_SetWidth(BaudBagOptionsBackgroundDropDown, 90);
  end
end


function BaudBagOptionsFrame_OnShow(self)
  CfgBackup = CopyTable(Config);
  self.SaveChanges = false;
  self:ClearAllPoints();
  self:SetPoint("CENTER");
  BaudBagOptionsUpdate();
end


function BaudBagOptionsFrame_OnHide(self)
  if(self.SaveChanges==false)and CfgBackup then
    DebugMsg("Restoring config from backup.");
    self.SaveChanges = true;
    BaudBag_Cfg = CfgBackup;
    BaudBagRestoreCfg();
  end
  CfgBackup = nil;
end


function BaudBagRestoreCfg()
  DebugMsg("Restoring config structure.");
  if(type(BaudBag_Cfg)~="table")then
    BaudBag_Cfg = {};
  end
  Config = BaudBag_Cfg;
  for BagSet = 1, 2 do
    if(type(Config[BagSet])~="table")then
      Config[BagSet] = {};
    end
    if(type(Config[BagSet].Enabled)~="boolean")then
      Config[BagSet].Enabled = true;
    end
    if(type(Config[BagSet].Joined)~="table")then
      Config[BagSet].Joined = {};
    end
    if(type(Config[BagSet].ShowBags)~="boolean")then
      Config[BagSet].ShowBags = (BagSet==2)and true or false;
    end
    local Container = 0;
    BaudBagForEachBag(BagSet,function(Bag, Index)
      if(Bag==-2)and(Config[BagSet].Joined[Index]==nil)then
        Config[BagSet].Joined[Index] = false;
      end
      if(Container == 0)or(Config[BagSet].Joined[Index]==false)then
        Container = Container + 1;
        if(type(Config[BagSet][Container])~="table")then
          if(Container == 1)or(Bag==-2)then
            Config[BagSet][Container] = {};
          else
            Config[BagSet][Container] = CopyTable(Config[BagSet][Container-1]);
          end
        end
        if not Config[BagSet][Container].Name then
          --With the key ring, there isn't enough room for the player name aswell
          Config[BagSet][Container].Name = (Bag==-2)and Localized.KeyRing or UnitName("player")..Localized.Of..((BagSet==1)and Localized.Inventory or Localized.BankBox);
        end
        if(type(Config[BagSet][Container].Background)~="number")then
          Config[BagSet][Container].Background = (Bag==-2)and 3 or 1;
        end
        for Key, Value in ipairs(SliderBars)do
          if(type(Config[BagSet][Container][Value.SavedVar])~="number")then
            Config[BagSet][Container][Value.SavedVar] = (Bag==-2)and(Value.SavedVar=="Columns")and 4 or Value.Default[BagSet];
          end
        end
        for Key, Value in ipairs(CheckButtons)do
          if(type(Config[BagSet][Container][Value.SavedVar])~="boolean")then
            Config[BagSet][Container][Value.SavedVar] = Value.Default;
          end
        end
      end
    end);
  end

  BaudUpdateJoinedBags();
  BaudBagUpdateBagFrames();
  BaudBagOptionsUpdate();
end


--This function is used by the drop down menu on containers
function BaudBagOptionsSelectContainer(BagSet, Container)
  SelectedBags = BagSet;
  SelectedContainer = Container;
  BaudBagOptionsUpdate();
end


function BaudBagOptionsUpdate()
  local Button, Check, Container, Texture;
  local ContNum = 1;
  local Bags = SetSize[SelectedBags];
  Updating = true;

  UIDropDownMenu_Initialize(BaudBagOptionsSetDropDown, BaudBagOptionsSetDropDown_Initialize);
  UIDropDownMenu_SetSelectedValue(BaudBagOptionsSetDropDown, SelectedBags);
  BaudBagEnabledCheck:SetChecked(Config[SelectedBags].Enabled~=false);

  BaudBagForEachBag(SelectedBags,function(Bag,Index)
    Button = getglobal("BaudBagOptionsBag"..Index);
    Check = getglobal("BaudBagOptionsJoinCheck"..Index);

    if(Index == 1)then
      --Only the first bag needs its position set, since the others are anchored to it always
      Button:SetPoint("LEFT",BaudBagOptionsFrame,"TOP",(Bags / 2) * -44,-120);
    else
      Check:SetChecked(Config[SelectedBags].Joined[Index]~=false);
      if not Check:GetChecked()then
        getglobal("BaudBagOptionsContainer"..ContNum):SetPoint("RIGHT","BaudBagOptionsBag"..(Index - 1),"RIGHT",6,0);
        ContNum = ContNum + 1;
        getglobal("BaudBagOptionsContainer"..ContNum):SetPoint("LEFT","BaudBagOptionsBag"..Index,"LEFT",-6,0);
      end
    end
    if BaudBagIcons[Bag]then
      Texture = BaudBagIcons[Bag];
    elseif(SelectedBags == 1)then
      Texture = GetInventoryItemTexture("player",ContainerIDToInventoryID(Bag));
    elseif BaudBag_Cache[Bag] and BaudBag_Cache[Bag].BagLink then
      Texture = GetItemIcon(BaudBag_Cache[Bag].BagLink);
    else
      Texture = nil;
    end
    getglobal(Button:GetName().."IconTexture"):SetTexture(Texture or select(2,GetInventorySlotInfo("Bag0Slot")));
    Button:SetID(ContNum);
    Button:Show();
  end);
  getglobal("BaudBagOptionsContainer"..ContNum):SetPoint("RIGHT","BaudBagOptionsBag"..Bags,"RIGHT",6,0);

  for Index = Bags + 1, MaxBags do
    getglobal("BaudBagOptionsBag"..Index):Hide();
  end

  if(SelectedContainer > ContNum)then
    SelectedContainer = 1;
  end
  local R, G, B;
  for Bag = 1, MaxBags do
    Container = getglobal("BaudBagOptionsContainer"..Bag);
    Button = getglobal("BaudBagOptionsBag"..Bag);
    Button:SetChecked(Button:GetID()==SelectedContainer);
    if(Bag <= ContNum)then
      if(Bag==SelectedContainer)then
        Container:SetBackdropColor(1,1,0);
        Container:SetBackdropBorderColor(1,1,0);
      else
        Container:SetBackdropColor(1,1,1);
        Container:SetBackdropBorderColor(1,1,1);
      end
      Container:Show();
    else
      Container:Hide();
    end
  end

  BaudBagNameEditBox:SetText(Config[SelectedBags][SelectedContainer].Name or "");

  UIDropDownMenu_Initialize(BaudBagOptionsBackgroundDropDown, BaudBagOptionsBackgroundDropDown_Initialize);
  UIDropDownMenu_SetSelectedValue(BaudBagOptionsBackgroundDropDown,Config[SelectedBags][SelectedContainer].Background);

  for Key, Value in ipairs(SliderBars)do
    local Slider = getglobal(Prefix.."Slider"..Key);
    Slider:SetValue(Config[SelectedBags][SelectedContainer][Value.SavedVar]);
  end

  for Key, Value in ipairs(CheckButtons)do
    local Button = getglobal(Prefix.."CheckButton"..Key);
    Button:SetChecked(Config[SelectedBags][SelectedContainer][Value.SavedVar]);
  end
  Updating = false;
end


function BaudBagNameEditBox_OnTextChanged()
  if Updating then
    return;
  end
  Config[SelectedBags][SelectedContainer].Name = BaudBagNameEditBox:GetText();
  BaudBagUpdateName(getglobal("BBCont"..SelectedBags.."_"..SelectedContainer));
end


function BaudBagOptionsSetDropDown_Initialize()
  local info = UIDropDownMenu_CreateInfo();
  info.func = BaudBagOptionsSetDropDown_OnClick;

  info.text = Localized.Inventory;
  info.value = 1;
  info.checked = (info.value == SelectedBags)and 1 or nil;
  UIDropDownMenu_AddButton(info);

  info.text = Localized.BankBox;
  info.value = 2;
  info.checked = (info.value == SelectedBags)and 1 or nil;
  UIDropDownMenu_AddButton(info);
end


function BaudBagOptionsSetDropDown_OnClick(self)
  SelectedBags = self.value;
  BaudBagOptionsUpdate();
end


local TextureNames = {Localized.BlizInventory,Localized.BlizBank,Localized.BlizKeyring,Localized.Transparent,Localized.Solid};

function BaudBagOptionsBackgroundDropDown_Initialize()
  local info = UIDropDownMenu_CreateInfo();
  info.func = BaudBagOptionsBackgroundDropDown_OnClick;
  local Selected = Config[SelectedBags][SelectedContainer].Background;

  for Key, Value in pairs(TextureNames)do
    info.text = Value;
    info.value = Key;
    info.checked = (Key == Selected)and 1 or nil;
    UIDropDownMenu_AddButton(info);
  end
end


function BaudBagOptionsBackgroundDropDown_OnClick(self)
  Config[SelectedBags][SelectedContainer].Background = self.value;
  UIDropDownMenu_SetSelectedValue(BaudBagOptionsBackgroundDropDown, self.value);
  BaudBagUpdateContainer(getglobal("BBCont"..SelectedBags.."_"..SelectedContainer));
end


function BaudBagEnabledCheck_OnClick(self)
  if(self:GetChecked())then
    PlaySound("igMainMenuOptionCheckBoxOff");
  else
    PlaySound("igMainMenuOptionCheckBoxOn");
    BaudBagCloseBagSet(SelectedBags);
  end
  Config[SelectedBags].Enabled = (self:GetChecked()==1);
end


function BaudBagOptionsBag_OnClick(self)
  SelectedContainer = self:GetID();
  BaudBagOptionsUpdate();
end


function BaudBagOptionsJoinCheck_OnClick(self)
  if(self:GetChecked())then
    PlaySound("igMainMenuOptionCheckBoxOff");
  else
    PlaySound("igMainMenuOptionCheckBoxOn");
  end
  Config[SelectedBags].Joined[self:GetID()] = self:GetChecked()and true or false;
  local ContNum = 2;
  for Bag = 2,(self:GetID()-1)do
    if(Config[SelectedBags].Joined[Bag]==false)then
      ContNum = ContNum + 1;
    end
  end
  if self:GetChecked()then
    tremove(Config[SelectedBags],ContNum);
  else
    tinsert(Config[SelectedBags],ContNum,CopyTable(Config[SelectedBags][ContNum-1]));
  end
  BaudBagOptionsUpdate();
  BaudUpdateJoinedBags();
  --Newly created bags could "Jump" infront of the options frame
  BaudBagOptionsFrame:Raise();
end


function BaudBagOptions_Defaults()
  DebugMsg("Setting default config.");
  BaudBag_Cfg = nil;
  BaudBagRestoreCfg();
end


function BaudBagCheckButton_OnClick(self)
  if(self:GetChecked())then
    PlaySound("igMainMenuOptionCheckBoxOff");
  else
    PlaySound("igMainMenuOptionCheckBoxOn");
  end
  local SavedVar = CheckButtons[self:GetID()].SavedVar;
  Config[SelectedBags][SelectedContainer][SavedVar] = (self:GetChecked()==1);
  if(SavedVar=="BlankTop")or(SavedVar=="RarityColor")then
    BaudBagUpdateContainer(getglobal("BBCont"..SelectedBags.."_"..SelectedContainer));
  end
end


function BaudBagSlider_OnValueChanged(self)
  getglobal(self:GetName().."Text"):SetText(format(SliderBars[self:GetID()].Text,self:GetValue()));
  if Updating then
    return;
  end
  local SavedVar = SliderBars[self:GetID()].SavedVar;
  Config[SelectedBags][SelectedContainer][SavedVar] = self:GetValue();
  if(SavedVar=="Scale")then
    BaudUpdateContainerData(SelectedBags,SelectedContainer);
  elseif(SavedVar=="Columns")then
    BaudBagUpdateContainer(getglobal("BBCont"..SelectedBags.."_"..SelectedContainer));
  end
end