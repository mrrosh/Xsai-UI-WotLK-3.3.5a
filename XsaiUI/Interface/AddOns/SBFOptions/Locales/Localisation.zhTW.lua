if ( GetLocale() == "zhTW" ) then
  SBFOptions.strings.LAYOUTCONFIG = "樣式（%d）"
  SBFOptions.strings.BUFF_SCALE = "縮放"
  SBFOptions.strings.OPACITY = "透明度"
  SBFOptions.strings.BUFFHORIZONTAL = "多行顯示"
  SBFOptions.strings.REVERSEBUFF = "反向排列"
  SBFOptions.strings.XSPACING = "水準間距"
  SBFOptions.strings.YSPACING = "垂直間距"
  SBFOptions.strings.ROWCOUNT = "每行buff數量"
  SBFOptions.strings.COLCOUNT = "每列buff數量"
  SBFOptions.strings.BOTTOM = "從底部開始"
  SBFOptions.strings.BUFFCOUNT = "buff數量"
  SBFOptions.strings.BUFFSORT = "排序"
  SBFOptions.strings.BUFFRIGHTCLICK = "在這個框體內禁用右鍵點擊"
  SBFOptions.strings.NOTOOLTIPS = "不顯示滑鼠提示"
  SBFOptions.strings.NOTOOLTIPSTT = "不顯示該框體內的buff滑鼠提示"
  SBFOptions.strings.MIRRORBUFFS = "鏡像1號和2號框體內的buff"
  SBFOptions.strings.RIGHTCLICKTT = "右擊不會取消buff"
  SBFOptions.strings.MIRRORTT1 = "Buff會同時在1號和這個框體內顯示"
  SBFOptions.strings.MIRRORTT2 = "Debuff會同時在2號和這個框體內顯示"
  SBFOptions.strings.VISIBILITY = "框體可見度"
  SBFOptions.strings.BUFFPOSITION = "Buff間距"

  -- Timer tab
  SBFOptions.strings.SHOWTIMERS = "顯示buff計時"
  SBFOptions.strings.TIMERCONFIG = "計時（%d）"
  SBFOptions.strings.TEXT_POSITIONY = "時間垂直位置"
  SBFOptions.strings.TEXT_POSITIONX = "時間水準位置"
  SBFOptions.strings.TEXT_FORMAT = "時間格式"
  SBFOptions.strings.TIMERCOLOUR = "時間文本顏色"
  SBFOptions.strings.EXPIRECOLOUR = "即將結束的時間文本顏色"
  SBFOptions.strings.TIMERPOSITION = "時間位置"
SBFOptions.strings.TIMERNA = SBFOptions.strings.TIMERNA or "將光環效果顯示為N/A"

  -- Icon Tab
  SBFOptions.strings.SHOWICONS = "顯示buff圖示"
  SBFOptions.strings.ICONCONFIG = "圖示（%d）"
  SBFOptions.strings.ICONPOSITION = "圖示位置"

  -- Count Tab
  SBFOptions.strings.SHOWCOUNTS = "顯示buff疊加數"
  SBFOptions.strings.COUNTCONFIG = "疊加數（%d）"
  SBFOptions.strings.STACKCOLOUR = "計數文本顏色"
  SBFOptions.strings.COUNTPOSITION = "計數文本位置"

  -- Bar Tab
  SBFOptions.strings.BARCONFIG = "計時條（%d）"
  SBFOptions.strings.SHOWBARS = "顯示buff計時條"
  SBFOptions.strings.BARDIRECTION = "計時條方向"
  SBFOptions.strings.BARWIDTH = "計時條寬度"
  SBFOptions.strings.BARTEXTURE = "計時條材質"
  SBFOptions.strings.BARBUFFCOLOUR = "Buff計時條顏色"
  SBFOptions.strings.BARDEBUFFCOLOUR = "Debuff計時條顏色"
  SBFOptions.strings.BARBACKDROP = "計時條背景顏色"
  SBFOptions.strings.DEBUFFBARCOLOUR = "按debuff類型著色名稱"
  SBFOptions.strings.DEBUFFBARCOLOURTT1 = "計時條會按照debuff的類型著色"
  SBFOptions.strings.DEBUFFBARCOLOURTT2 = "（詛咒、魔法、毒藥等等）"
  SBFOptions.strings.BARPOSITION = "計時條位置"

  -- Name Tab
  SBFOptions.strings.SHOWNAMES = "顯示buff名稱"
  SBFOptions.strings.NAMECONFIG = "名稱（%d）"
  SBFOptions.strings.NAMEBUFFCOLOUR = "Buff顏色"
  SBFOptions.strings.NAMEDEBUFFCOLOUR = "Debuff顏色"
  SBFOptions.strings.NAMECOUNT = "計數格式"
  SBFOptions.strings.NAMEFORMAT = "名稱格式"
  SBFOptions.strings.NAMERANK = "等級格式"
  SBFOptions.strings.DEBUFFNAMECOLOUR = "按debuff類型著色名稱"
  SBFOptions.strings.DEBUFFNAMECOLOURTT1 = "名稱會按照debuff類型著色"
  SBFOptions.strings.DEBUFFNAMECOLOURTT2 = "（詛咒、魔法、毒藥等等）"
  SBFOptions.strings.NAMEPOSITION = "名稱位置"

  -- Expiry Tab
  SBFOptions.strings.WARNCONFIG = "消隱（%d）"
  SBFOptions.strings.EXPIREWARN = "文本消隱提示"
  SBFOptions.strings.EXPIREWARNTT = "在某個buff即將消失時輸出聊天提示"
  SBFOptions.strings.EXPIRENOTICE = "文本消隱警示"
  SBFOptions.strings.EXPIRENOTICETT = "在某個buff即將消失時輸出聊天警示"
  SBFOptions.strings.EXPIRESOUND = "聲音提示"
  SBFOptions.strings.SOUNDCHOOSE = "聲音"
  SBFOptions.strings.WARNSOUND = "警報聲音"
  SBFOptions.strings.MINTIME = "最短時間"
  SBFOptions.strings.EXPIRETIME = "警報時間下限"
  SBFOptions.strings.EXPIREFRAME = "聊天框體"
  SBFOptions.strings.EXPIREFRAMETEST = "Buff框體%d的消隱警報會在這裡顯示"
  SBFOptions.strings.SCTCOLOUR = "顏色"
  SBFOptions.strings.FASTBAR = "快速顯示計時條消隱"
  SBFOptions.strings.SCTWARN = "在%s顯示消失警報資訊"
  SBFOptions.strings.SCTCRIT = "使用爆擊動畫顯示" 
  SBFOptions.strings.SCTCRITTT1 = "如果SCT啟用則使用SCT的爆擊動畫顯示消失警報"
  SBFOptions.strings.SCTCRITTTM1 = "你已經設置SCT為使用訊息方塊體漸隱顯示Buff。"
  SBFOptions.strings.SCTCRITTTM2 = "當前SCT設置不允許資訊顯示為爆擊"
  SBFOptions.strings.FLASHBUFF = "閃爍即將消失的Buff圖示"
  SBFOptions.strings.USERWARN = "僅為選擇的特定buff提示"
  SBFOptions.strings.ALLWARN = "所有buff"

  -- Frame stick tab
  SBFOptions.strings.STICKYCONFIG = "粘附"
  SBFOptions.strings.STICKTOFRAME = "父框體"
  SBFOptions.strings.STICKYCHILDFRAME = "添加子框體"

  -- Units Tab
  SBFOptions.strings.UNITSCONFIG = "單位"
  SBFOptions.strings.UNITBUFFS = "此框體顯示buff"
  SBFOptions.strings.UNITDEBUFFALL = "此框體顯示debuff"
  SBFOptions.strings.UNITDEBUFFCASTABLE = "可施放的debuff"
  SBFOptions.strings.UNITDEBUFFMINE = "我的debuff"
  SBFOptions.strings.UNITLABEL = "當前單位：|cffffffff%s|r"
  SBFOptions.strings.UNITFRAMETAKEN = "框體%d已經被%s使用"
SBFOptions.strings.UNITFRAMEOWNEDFILTER = SBFOptions.strings.UNITFRAMEOWNEDFILTER or "框體%d已經被|cff00d2ff%s|r過濾分配給了玩家，請選擇另外一個"
SBFOptions.strings.UNITFRAMEOWNEDSHOW = SBFOptions.strings.UNITFRAMEOWNEDSHOW or "框體%d已經被通過|cff00d2ff%s|r的框體顯示分配給玩家，請選擇另外一個"
SBFOptions.strings.UNITFRAMEOWNERCHANGE = SBFOptions.strings.UNITFRAMEOWNERCHANGE or "將框體%d的所有權由%s轉移給%s"

  -- Spells Tab
  SBFOptions.strings.EXCLUDE = "不顯示的buff"
  SBFOptions.strings.ALWAYSWARN = "即將消失時始終警報"
  SBFOptions.strings.SHOWING = "顯示到"
  SBFOptions.strings.DEFAULTFRAME = "默認框體"
  SBFOptions.strings.SPELLFILTER = "搜索法術"
  SBFOptions.strings.AURA = "光環"
  SBFOptions.strings.CLEARSPELLS = "清除資料"
  SBFOptions.strings.CLEARSPELLSTT1 = "清除SBF的buff緩存資料"
  SBFOptions.strings.CLEARSPELLSTT2 = "如果你遇到了過濾或者buff顯示問題請這麼做一次"
  SBFOptions.strings.CLEARSPELLSTT3 = "（不會影響你的始終警報/框體分配/顯示過濾設定）"
  SBFOptions.strings.SPELLCONFIG = "法術"

  -- Global Tab
  SBFOptions.strings.GLOBALCONFIG = "全域設置"
  SBFOptions.strings.HOME = "主頁"
  SBFOptions.strings.AURAMAXTIME = "光環效果顯示為最大持續時間" 
  SBFOptions.strings.AURAMAXTIMETT1 = "選中後，光環類效果（無持續時間）"
  SBFOptions.strings.AURAMAXTIMETT2 = "會顯示為持續時間為最大值的法術。"
  SBFOptions.strings.ENCHANTSFIRST = "優先顯示物品附魔"
  SBFOptions.strings.DISABLEBF = "在SBF中禁用ButtonFacade"
  SBFOptions.strings.TOTEMNONBUFF = "不顯示非buff圖騰"
  SBFOptions.strings.TOTEMOUTOFRANGE = "超出距離也仍顯示buff圖騰"
  SBFOptions.strings.TOTEMTIMERS = "不顯示圖騰計時"

  -- Misc
  SBFOptions.strings.VERSION2 = "Satrina Buff Frames |cff00ff00%s|r"
  SBFOptions.strings.HINT = "http://evilempireguild.org/SBF"
  SBFOptions.strings.HINT2 = "Alt+移動我！"
  SBFOptions.strings.FRAME = "框體%d"
  SBFOptions.strings.USINGPROFILE = "正在使用的設定檔"
  SBFOptions.strings.COPYPROFILE = "複製設定檔"
  SBFOptions.strings.DELETEPROFILE = "刪除設定檔"
  SBFOptions.strings.NEWPROFILE = "輸入新設定檔名"
  SBFOptions.strings.CONFIRMREMOVEPROFILE = "確定要刪除設定檔%s？"
  SBFOptions.strings.NEWPROFILEBUTTON = "新建設定檔"

  SBFOptions.strings.BUFFFRAME = "Buff框體"
  SBFOptions.strings.BUFFFRAMENUM = "Buff框體%d"
  SBFOptions.strings.CURRENTFRAME = "當前框體："
  SBFOptions.strings.NEWFRAME = "新建框體"
  SBFOptions.strings.REMOVE = "刪除"
  SBFOptions.strings.REMOVEFRAME = "刪除框體"
  SBFOptions.strings.REMOVEFRAMETT = "刪除這個buff框體"
  SBFOptions.strings.DELETEERROR = "不能刪除1號、2號buff框體以及物品附魔框體"
  SBFOptions.strings.DEFAULT_TOOLTIP = "重置框體的樣式和消失設置"
  SBFOptions.strings.DEFAULTS = "預設值"
  SBFOptions.strings.DEBUFFTIMER = "按類型著色debuff時間"
  SBFOptions.strings.DEBUFFTIMERTT1 = "時間文本會按debuff類型著色"
  SBFOptions.strings.DEBUFFTIMERTT2 = "（詛咒、魔法、毒藥等等）"
  SBFOptions.strings.NEWFRAMETT = "創建新buff框體"
  SBFOptions.strings.NONE = "無"
  SBFOptions.strings.HELP = "幫助"
  SBFOptions.strings.POSITIONBOTTOM = "按住Alt以10為步進調整"
  SBFOptions.strings.FRAMELEVEL = "框體層級%d"

  SBFOptions.strings.FONT = "字體"
  SBFOptions.strings.FONTSIZE = "字體大小（%d）"
  SBFOptions.strings.OUTLINEFONT = "文字描邊"

  SBFOptions.strings.RESET = "重置框體"
  SBFOptions.strings.RESETFRAMESTT = "重置為SBF默認框體"

  SBFOptions.strings.FILTERDELET = "刪除過濾%s"
  SBFOptions.strings.FILTERREFORMAT = "將過濾%s應用到框體%d"
  SBFOptions.strings.SHOWINFRAMEDELETE = "不在框體%d內顯示%s"
  SBFOptions.strings.SHOWFILTER = "匹配過濾%d:%s"
  SBFOptions.strings.FILTERBLOCKED = "過濾被buff框體%d強制顯示所忽略"
  SBFOptions.strings.SHOWBUFFS = "顯示buff"
  SBFOptions.strings.SHOWDEBUFFS = "顯示debuff"
  SBFOptions.strings.DURATION = "持續時間"

  SBFOptions.strings.JUSTIFY = "對齊"
  SBFOptions.strings.JUSTIFYRIGHT = "右"
  SBFOptions.strings.JUSTIFYLEFT = "左"

  SBFOptions.strings.CYCIRCLEDADJUST = "cyCircled尺寸（%d）"
  SBFOptions.strings.USECYCIRCLED = "cyCircled"
  SBFOptions.strings.REFRESH = "Buff條更新頻率"
  SBFOptions.strings.COPYFROM = "從...複製"
  SBFOptions.strings.TRACKING = "顯示追蹤"

    -- Filters Tab
  SBFOptions.strings.FILTERCONFIG = "過濾"
  SBFOptions.strings.ENABLEFILTERS = "啟用過濾"
  SBFOptions.strings.ENABLEFILTERSTT = "啟用除了根據buff剩餘時間工作的過濾以外的其他全部過濾"
  SBFOptions.strings.ENABLERFILTERS = "啟用根據buff剩餘時間工作的過濾"
  SBFOptions.strings.ENABLERFILTERSTT = "啟用根據buff剩餘時間工作的過濾（R和r）"
  SBFOptions.strings.FILTER = "新建過濾"
  SBFOptions.strings.ADDFILTER = "添加過濾"
  SBFOptions.strings.EDITFILTER = "編輯過濾"
  SBFOptions.strings.FILTERS = "當前過濾"
  SBFOptions.strings.FILTERHELP = "過濾幫助"
  SBFOptions.strings.UP = "上升"
  SBFOptions.strings.DOWN = "下降"
  SBFOptions.strings.EDIT = "編輯"
  
  -- Filters Help
  OPENHTML = "<HTML><BODY><P>"
  CLOSEHTML = "</P></BODY></HTML>"
  FILTERHELPHTML = {
    {	"|cff00ff00過濾幫助|r<BR/>",
      "過濾的格式是{|cffff00cc框體|r}:{|cffffcc00命令|r}{|cff00cc00操作|r}{參數}<BR/>",
      "<BR/>",
      "過濾分為4個部分<BR/>",
      "|cffff00cc框體|r - 過濾觸發後buff會出現在的框體<BR/>",
      "|cffffcc00命令|r -過濾調用的buff屬性<BR/>",
      "|cff00cc00操作|r - 過濾觸發的比較條件<BR/>",
      "參數 - 過濾條件的比較值<BR/>",
      "<BR/>",
      "例如：|cff00d2ff3:D>20|r<BR/>",
      "<BR/>",
      "在這個例子中，這些部分分別是（細節顯示在下一頁）：<BR/>",
      "|cffff00cc3|r - buff會出現在3號框體<BR/>",
      "|cffffcc00D|r - 過濾監控buff的剩餘時間<BR/>",
      "|cff00cc00>|r - 過濾使用大於比較<BR/>",
      "20 - 比較的數值是20分鐘<BR/>",
      "<BR/>",
      "所以，過濾|cff00d2ff3:D>20|r的意思是“將任何持續時間大於20分鐘的buff顯示在buff框體3”<BR/>",
    },
    {	"|cff00ff00命令|r：<BR/>",
      "|cffffcc00n|r: 按名稱過濾（不區分大小寫）<BR/>",
      "|cffffcc00tt|r: 按提示文字過濾（不區分大小寫）<BR/>",
      "|cffffcc00D|r: 按buff持續時間過濾（分鐘）<BR/>",
      "|cffffcc00d|r: 按buff持續時間過濾（秒）<BR/>",
      "|cffffcc00r|r: 按buff剩餘時間過濾（分鐘）<BR/>",
      "|cffffcc00R|r: 按buff剩餘時間過濾（秒）<BR/>",
      "|cffffcc00a|r: 光環效果（沒有持續時間的buff，例如騎士光環、守護等）<BR/>",
      "|cffffcc00h|r: 過濾有害法術效果（debuff）<BR/>",
      "|cffffcc00e|r: 臨時物品附魔（磨刀石，巫師油等）<BR/>",
      "|cffffcc00to|r: 你的圖騰（對非薩滿玩家無效）<BR/>",
      "<BR/>預設僅過濾buff，如果要過濾debuff就必須使用|cffffcc00h|r命令<BR/>",
      "<BR/>",
      "|cff00ff00操作|r<BR/>",
      "|cff00cc00=|r 完全匹配（對|cffffcc00n|r and |cffffcc00s|r有效）<BR/>",
      "|cff00cc00~|r 不完全匹配 （對 |cffffcc00n,tt|r使用）<BR/>",
      "|cff00cc00&lt;|r 小於（對|cffffcc00d,D,r,R|r使用）<BR/>",
      "|cff00cc00&lt;=|r 小於或等於（對|cffffcc00d,D,r,R|r使用）<BR/>",
      "|cff00cc00&gt;|r 大於（對|cffffcc00d,D,r,R|r使用）<BR/>",
      "|cff00cc00&gt;=|r 大於或等於（對|cffffcc00d,D,r,R|r使用）<BR/>",
      "<BR/>",
      "<BR/>",
      "否定運算符， |cff00cc00!|r，可以和|cffffcc00n|r, |cffffcc00tt|r, |cffffcc00h|r，以及|cffffcc00a|r命令一起使用<BR/>",
      "|cff00d2ffa!|r 意味著“不是光環類效果的buff”（有持續時間的buff）<BR/>",
      "|cff00d2ffn!~藥劑|r 意味著“名稱中不包含藥劑的buff”<BR/>",
      "|cff00d2ffn!=秘法智慧|r 意味著“不是秘法智慧的buff”<BR/>",
      "|cff00d2fft!~智力|r 意味著“提示訊息中不包含智力的buff”<BR/>",
      "|cff00d2ffh!|r 意味著“不是debuff的buff”（廢話，當然有意義）<BR/>",
    },
    {	"|cff00ff00參數|r<BR/>",
      "字串 - |cffffcc00n|r和|cffffcc00tt|r命令使用字串來部分匹配（～）或完全匹配（=）名稱或提示文字<BR/>",
      "<BR/>",
      "數字 - |cffffcc00D|r、|cffffcc00d|r、|cffffcc00R|r和|cffffcc00r|r命令使用數字來比較buff的持續時間或剩餘時間<BR/>",
      "<BR/>",
      "|cffffcc00a|r、|cffffcc00h|r、|cffffcc00e|r和|cffffcc00to|r命令不包含參數<BR/>",
      "<BR/>",
      "|cff00ff00什麼Buff？往哪裏去？|r<BR/>",
      "在任何過濾執行以前，所有buff都會根據你在“在buff框體顯示”選項的彈出菜單或法術選項卡中設定的buff列表進行檢查。如果某個過濾沒有將某個buff放置於你覺得應該處於的框體內，最好檢查一下你沒有使用列表功能將其設置到特定框體內。<BR/>",
      "<BR/>",
      "特定框體的buff列表檢查後，過濾按照它們在過濾列表內的順序執行。如果頭兩個過濾是|cff00d2ff3:n~藥劑|r和|cff00d2ff5:t&lt;60|r，那麼“精通藥劑”的buff將始終顯示在3號框體內，即使剩餘時間少於60秒。在列表內選擇過濾並使用上移下移按鈕來按照你需要的順序排列過濾。<BR/>",
    },
    {	"|cff00ff00有害效果命令|r<BR/>",
      "|cffffcc00h|r命令用於過濾特定類型的debuff（詛咒、疾病、魔法、毒藥）<BR/>",
      "<BR/>",
      "|cffffcc00h|r過濾所有debuff類型（例如|cff00d2ff2:h|r）<BR/>",
      "|cffffcc00hc|r 過濾詛咒（例如|cff00d2ff3:hc|r）<BR/>",
      "|cffffcc00hd|r 過濾疾病（例如 |cff00d2ff4:hd|r）<BR/>",
      "|cffffcc00hm|r 過濾魔法（例如 |cff00d2ff5:hm|r）<BR/>",
      "|cffffcc00hp|r 過濾毒藥（例如 |cff00d2ff6:hp|r）<BR/>",
      "|cffffcc00hu|r 過濾無類型的debuff（例如 |cff00d2ff3:hu|r）<BR/>",
      "|cffffcc00ha|r 過濾你可以解除的debuff（例如 |cff00d2ff4:ha|r）<BR/>",
      "<BR/>",
    },
    {	"|cff00ff00多重過濾|r<BR/>",
      "你可以使用邏輯連接符與{&amp;}和非{||}來組成多重過濾，使用括號來強制分組。<BR/>",
      "<BR/>",
      "|cff00ff00使用或連接符{||}|r<BR/>",
      "|cff00d2ffn~藥劑||n~精鍊藥劑|r 在buff名稱中包含“藥劑”或“精鍊藥劑”時會返回true（真）<BR/>",
      "|cff00d2ffa||n~精鍊藥劑|r 在buff是一個光環效果或名稱中包含“精鍊藥劑”時會返回true<BR/>",
      "<BR/>",
      "|cff00ff00使用與連接符{&amp;}|r<BR/>",
      "|cff00d2ffn~精鍊藥劑&amp;R&gt;60|r 在buff訊息包含“精鍊藥劑”和剩餘時間大於60分鐘時返回true<BR/>",
      "|cff00d2ffh&amp;r&lt;20|r 在這個效果是debuff並且剩餘時間小於20秒時返回true<BR/>",
      "<BR/>",
      "|cff00ff00括號分組|r<BR/>",
      "括號內的過濾被看作是一個組，在整個過濾的其他參數之前被處理，就像數學中的括號運算順序。你可以使用任意多層數的括號<BR/>",			
    },
    {	"|cff00ff00簡單過濾示例|r<BR/>",
      "<BR/>",
      "|cff00d2ff4:n~藥劑|r<BR/>",
      "將“內行藥劑”、“精通藥劑”等過濾到4號框體<BR/><BR/>",
      "|cff00d2ff3:D&lt;=3|r<BR/>",
      "將所有的持續時間小於等於3分鐘的buff過濾到3號框體中<BR/><BR/>",
      "|cff00d2ff4:a|r<BR/>",
      "將所有的光環效果過濾到4號框體<BR/><BR/>",
      "|cff00d2ff3:e|r<BR/>",
      "將所有的臨時物品增強效果過濾到3號框體<BR/><BR/>",
      "|cff00d2ff6:h&amp;r&lt;20|r<BR/>",
      "將所有少於20秒的debuff過濾到6號框體<BR/><BR/>",
      "|cff00d2ff3:hd|r<BR/>",
      "將所有疾病效果過濾到3號框體<BR/><BR/>",
      "|cff00d2ff6:ha|r<BR/>",
      "將玩家可以解除的debuff過濾到6號框體<BR/><BR/>",
    },
    {	"|cff00ff00復雜過濾示例|r<BR/>",
      "<BR/>",
      "|cff00d2ffa&amp;(n!~光環&amp;n!~守護)|r 在buff是一個名稱不帶有“光環”或“守護”的光環效果時返回true<BR/>",
      "- 第一個結果是|cff00d2ffa|r的值   -- 這個buff是否是光環效果？<BR/>",
      "- 第二個結果是|cff00d2ff(n!~光環&amp;n!~守護)|r的值   -- 這個buff是否在名稱裏不包含“光環”或“守護”？<BR/>",
      "- 如果第一個和第二個結果均為true，則整個過濾對這個buff返回true<BR/>",
      "<BR/>",
      "|cff00d2ffa||(n~精鍊藥劑&amp;R&gt;60)|r 在buff是光環效果或buff名稱包含“精鍊藥劑”並且剩餘時間大於60分鐘時返回true。<BR/>",
      "- 第一個結果是|cff00d2ffa|r的值   -- 這個buff是否是光環效果？<BR/>",
      "- 第二個結果是|cff00d2ff(n~精鍊藥劑&amp;R&gt;60)|r的值   -- 這個buff名稱是否包含“精鍊藥劑”並且剩餘時間大於60分鐘？<BR/>",
      "- 如果第一和第二個結果任意一個為true則整個過濾對該buff返回true。<BR/>",
      "<BR/>",
      "|cff00d2ff((n~藥劑||n~精鍊藥劑)&amp;R&lt;10)&amp;n!~強襲|r 在buff名稱中包含“藥劑”或“精鍊藥劑”，剩餘時間少於10分鐘，並且名稱中不包含“強襲”時返回<BR/>",
      "- 第一個結果是最內層的括號|cff00d2ff(n~藥劑||n~精鍊藥劑)|r的返回值   -- buff名稱是否包含“藥劑”或“精鍊藥劑？”<BR/>",
      "- 第二個結果是|cff00d2ffR&lt;10|r的值   -- 剩餘時間是否少於10分鐘？<BR/>",
      "- 第三個結果在前兩個結果均為true的情況下返回true，並且結束整個括號的求值   -- |cff00d2ff((n~藥劑||n~精鍊藥劑)&amp;R&lt;10)|r<BR/>",
      "-，第四個結果是|cff00d2ffn!~fortification|r的值   -- buff名稱是否不包含“強襲”？<BR/>",
      "- 如果第三和第四個結果均為true，則整個過濾對這個buff返回true。<BR/>",
    },
  }
  
  NAMEHELPHTML = {
    {	"|cff00ff00名稱幫助|r<BR/>",
      "以下是名稱的三種元素：<BR/>",
      "<BR/>",
      "|cffff00ccName|r - Buff的名稱將如何顯示<BR/>",
      "|cffffcc00Rank|r - Buff的等級將如何顯示<BR/>",
      "|cff00cc00Count|r - Buff的疊加數將如何顯示<BR/>",
      "<BR/>",
      "例如：|cffff00ccName[full]|r |cffffcc00Rank[Roman]|r |cff00cc00Count[(always)]|r<BR/>",
      "<BR/>",
      "在這個例子中，所有的元素都被顯示了：<BR/>",
      "|cffff00ccName[full]|r - 顯示完整buff名稱（例如“秘法智慧”）<BR/>",
      "|cffffcc00Rank[Roman]|r - Buff等級用羅馬數字顯示<BR/>",
      "|cff00cc00Count[(XXX)]|r - Buff的疊加數將始終顯示在英文括弧內<BR/>",
      "<BR/>",
      "這個格式會使buff的名稱如下顯示|cff00d2ff秘法智慧VI (1)|r<BR/>",
      "<BR/>",
      "|cff00ff00元素格式化|r<BR/>",
      "單個元素的格式始終是|cff00d2ffElement[要顯示的內容]|r<BR/>",
      "<BR/>",
      "每個元素類型都會有一些會被buff的特定資料通配的關鍵字。你可以在元素標籤裡添加任何你想和關鍵字一起使用的文字，我保證它們會正確顯示。<BR/>",
      "<BR/>",
      "例如：Count[(always)] vs. Count[always]<BR/>",
      "關鍵字always被通配後，Count[(always)]會顯示為|cff00d2ff(6)|r<BR/>",
      "關鍵字always被通配後，Count[always]會顯示為|cff00d2ff6|r<BR/>",
      "<BR/>",
      "關鍵字roman在“等級[Rank roman]”中被通配後，它將顯示為|cff00d2ff等級IV|r<BR/>",
    },
    {	"|cff00ff00名稱元素|r<BR/>",
      "對名稱元素來說有3個關鍵字：<BR/>",
      "<BR/>",
      "|cffff00ccfull|r - Buff的全名（例如“野性印記”）<BR/>",
      "|cffff00ccshort|r - Buff名稱的縮寫（例如MotW，不過在中文游戲程式中似乎無效）<BR/>",
      "|cffff00ccxshort|r - 更短的名稱（例如MW，不過在中文游戲程式中似乎同樣無效）<BR/>",
    "|cffff00cctrunc:X|r - Buff的名稱從第X個字母起截斷。<BR/>",
    "|cffff00ccchop:X|r - 將buff的名稱前X個字母切除<BR/>",
    "|cffff00ccof|r - 將buff名稱中的“of”前的所有部分移除<BR/>",
      "<BR/>",
      "<BR/>",
      "|cff00ff00等級元素|r<BR/>",
      "對等級元素來說有2個關鍵字：<BR/>",
      "<BR/>",
      "|cffffcc00arabic|r - Buff的等級用阿拉伯數字顯示（例如6）<BR/>",
      "|cffffcc00roman|r - Buff的等級用羅馬數字顯示（例如VI）<BR/>",
      "<BR/>",
      "如果buff沒有等級，等級元素將不顯示<BR/>",
      "<BR/>",
      "<BR/>",
      "|cff00ff00疊加數元素|r<BR/>",
      "對疊加數元素來說有3個關鍵字：<BR/>",
      "<BR/>",
      "|cff00cc00normal|r - 疊加數僅在這個buff疊加了超過1層時顯示<BR/>",
      "|cff00cc00stack|r - 疊加數僅在buff是一個可疊加buff時顯示，即使這個buff只能疊加1層<BR/>",
      "|cff00cc00always|r - 疊加數始終顯示，即使這個buff不可疊加<BR/>",
    },
    {	"|cff00ff00小貼士|r<BR/>",
      "|cffffcc00Rank[Rank roman]|r和'Rank |cffffcc00Rank[roman]|r'實際上區別很大，看這些名稱格式：<BR/>",
      "|cffff00ccName[full]|r |cffffcc00Rank[Rank roman]|r和|cffff00ccName[full]|r Rank |cffffcc00Rank[roman]|r<BR/>",
      "<BR/>",
      "施放秘法智慧（等級6）後，它們會顯示一樣的內容：<BR/>",
      "|cff00d2ff秘法智慧Rank VI|r<BR/>",
      "<BR/>",
      "但是，如果獲得了進食充分效果這個沒有等級的buff，它們顯示的結果會不太一樣：<BR/>",
      "|cffff00ccName[full]|r |cffffcc00Rank[Rank roman]|r會顯示|cff00d2ff進食充分|r<BR/>",
      "|cffff00ccName[full]|r Rank |cffffcc00Rank[roman]|r會顯示|cff00d2ff進食充分Rank|r<BR/>",
      "<BR/>",
      "記得要始終把元素的條件文本寫進標籤內部！<BR/>",
    },
  }

  frameVisibility = {
    "始終",
    "從不",
    "戰鬥中",
    "戰鬥外",
    -- "Mouseover",
  }

  timerFormats = {
    "暴雪預設樣式",
    "分鐘:秒",
    "秒",
    "僅顯示大於60秒",
    "無計時器",
    "暴雪預設樣式2",
    "OmniCC樣式",
  }

  WARNTIMETT = {
    "消失警報啟動時間",
    "在該buff剩餘時間為此值時",
    "顯示消失警報",
  }

  MINTIMETT = {
    "最小buff時間",
    "僅對持續時間長於該值",
    "僅對持續時間長於該值",
  }

end
