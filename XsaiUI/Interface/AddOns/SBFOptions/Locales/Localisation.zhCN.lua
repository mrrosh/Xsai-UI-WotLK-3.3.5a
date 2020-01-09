if ( GetLocale() == "zhCN" ) then
  SBFOptions.strings.LAYOUTCONFIG = "样式（%d）"
  SBFOptions.strings.BUFF_SCALE = "缩放"
  SBFOptions.strings.OPACITY = "透明度"
  SBFOptions.strings.BUFFHORIZONTAL = "多行显示"
  SBFOptions.strings.REVERSEBUFF = "反向排列"
  SBFOptions.strings.XSPACING = "水平间距"
  SBFOptions.strings.YSPACING = "垂直间距"
  SBFOptions.strings.ROWCOUNT = "每行buff数量"
  SBFOptions.strings.COLCOUNT = "每列buff数量"
  SBFOptions.strings.BOTTOM = "从底部开始"
  SBFOptions.strings.BUFFCOUNT = "buff数量"
  SBFOptions.strings.BUFFSORT = "排序"
  SBFOptions.strings.BUFFRIGHTCLICK = "在这个框体内禁用右键点击"
  SBFOptions.strings.NOTOOLTIPS = "不显示鼠标提示"
  SBFOptions.strings.NOTOOLTIPSTT = "不显示该框体内的buff鼠标提示"
  SBFOptions.strings.MIRRORBUFFS = "镜像1号和2号框体内的buff"
  SBFOptions.strings.RIGHTCLICKTT = "右击不会取消buff"
  SBFOptions.strings.MIRRORTT1 = "Buff会同时在1号和这个框体内显示"
  SBFOptions.strings.MIRRORTT2 = "Debuff会同时在2号和这个框体内显示"
  SBFOptions.strings.VISIBILITY = "框体可见度"
  SBFOptions.strings.BUFFPOSITION = "Buff间距"

    -- Timer tab
  SBFOptions.strings.SHOWTIMERS = "显示buff计时"
  SBFOptions.strings.TIMERCONFIG = "计时（%d）"
  SBFOptions.strings.TEXT_POSITIONY = "时间垂直位置"
  SBFOptions.strings.TEXT_POSITIONX = "时间水平位置"
  SBFOptions.strings.TEXT_FORMAT = "时间格式"
  SBFOptions.strings.TIMERCOLOUR = "时间文本颜色"
  SBFOptions.strings.EXPIRECOLOUR = "即将结束的时间文本颜色"
  SBFOptions.strings.TIMERPOSITION = "时间位置"
SBFOptions.strings.TIMERNA = SBFOptions.strings.TIMERNA or "将光环效果显示为N/A"

    -- Icon Tab
  SBFOptions.strings.SHOWICONS = "显示buff图标"
  SBFOptions.strings.ICONCONFIG = "图标（%d）"
  SBFOptions.strings.ICONPOSITION = "图标位置"
    
    -- Count Tab
  SBFOptions.strings.SHOWCOUNTS = "显示buff叠加数"
  SBFOptions.strings.COUNTCONFIG = "叠加数（%d）"
  SBFOptions.strings.STACKCOLOUR = "计数文本颜色"
  SBFOptions.strings.COUNTPOSITION = "计数文本位置"

    -- Bar Tab
  SBFOptions.strings.BARCONFIG = "计时条（%d）"
  SBFOptions.strings.SHOWBARS = "显示buff计时条"
  SBFOptions.strings.BARDIRECTION = "计时条方向"
  SBFOptions.strings.BARWIDTH = "计时条宽度"
  SBFOptions.strings.BARTEXTURE = "计时条材质"
  SBFOptions.strings.BARBUFFCOLOUR = "Buff计时条颜色"
  SBFOptions.strings.BARDEBUFFCOLOUR = "Debuff计时条颜色"
  SBFOptions.strings.BARBACKDROP = "计时条背景颜色"
  SBFOptions.strings.DEBUFFBARCOLOUR = "按debuff类型着色名称"
  SBFOptions.strings.DEBUFFBARCOLOURTT1 = "计时条会按照debuff的类型着色"
  SBFOptions.strings.DEBUFFBARCOLOURTT2 = "（诅咒、魔法、毒药等等）"
  SBFOptions.strings.BARPOSITION = "计时条位置"
    
    -- Name Tab
  SBFOptions.strings.SHOWNAMES = "显示buff名称"
  SBFOptions.strings.NAMECONFIG = "名称（%d）"
  SBFOptions.strings.NAMEBUFFCOLOUR = "Buff颜色"
  SBFOptions.strings.NAMEDEBUFFCOLOUR = "Debuff颜色"
  SBFOptions.strings.NAMECOUNT = "计数格式"
  SBFOptions.strings.NAMEFORMAT = "名称格式"
  SBFOptions.strings.NAMERANK = "等级格式"
  SBFOptions.strings.DEBUFFNAMECOLOUR = "按debuff类型着色名称"
  SBFOptions.strings.DEBUFFNAMECOLOURTT1 = "名称会按照debuff类型着色"
  SBFOptions.strings.DEBUFFNAMECOLOURTT2 = "（诅咒、魔法、毒药等等）"
  SBFOptions.strings.NAMEPOSITION = "名称位置"

    -- Expiry Tab
  SBFOptions.strings.WARNCONFIG = "消隐（%d）"
  SBFOptions.strings.EXPIREWARN = "文本消隐提示"
  SBFOptions.strings.EXPIREWARNTT = "在某个buff即将消失时输出聊天提示"
  SBFOptions.strings.EXPIRENOTICE = "文本消隐警示"
  SBFOptions.strings.EXPIRENOTICETT = "在某个buff即将消失时输出聊天警示"
  SBFOptions.strings.EXPIRESOUND = "声音提示"
  SBFOptions.strings.SOUNDCHOOSE = "声音"
  SBFOptions.strings.WARNSOUND = "警报声音"
  SBFOptions.strings.MINTIME = "最短时间"
  SBFOptions.strings.EXPIRETIME = "警报时间下限"
  SBFOptions.strings.EXPIREFRAME = "聊天框体"
  SBFOptions.strings.EXPIREFRAMETEST = "Buff框体%d的消隐警报会在这里显示"
  SBFOptions.strings.SCTCOLOUR = "颜色"
  SBFOptions.strings.FASTBAR = "快速显示计时条消隐"
  SBFOptions.strings.SCTWARN = "在%s显示消失警报信息"
  SBFOptions.strings.SCTCRIT = "使用爆击动画显示" 
  SBFOptions.strings.SCTCRITTT1 = "如果SCT启用则使用SCT的爆击动画显示消失警报"
  SBFOptions.strings.SCTCRITTTM1 = "你已经设置SCT为使用消息框体渐隐显示Buff。"
  SBFOptions.strings.SCTCRITTTM2 = "当前SCT设置不允许信息显示为爆击"
  SBFOptions.strings.FLASHBUFF = "闪烁即将消失的Buff图标"
  SBFOptions.strings.USERWARN = "仅为选择的特定buff提示"
  SBFOptions.strings.ALLWARN = "所有buff"
    
    -- Frame stick tab
  SBFOptions.strings.STICKYCONFIG = "粘附"
  SBFOptions.strings.STICKTOFRAME = "父框体"
  SBFOptions.strings.STICKYCHILDFRAME = "添加子框体"
    
    -- Units Tab
  SBFOptions.strings.UNITSCONFIG = "单位"
  SBFOptions.strings.UNITBUFFS = "此框体显示buff"
  SBFOptions.strings.UNITDEBUFFALL = "此框体显示debuff"
  SBFOptions.strings.UNITDEBUFFCASTABLE = "可施放的debuff"
  SBFOptions.strings.UNITDEBUFFMINE = "我的debuff"
  SBFOptions.strings.UNITLABEL = "当前单位：|cffffffff%s|r"
  SBFOptions.strings.UNITFRAMETAKEN = "框体%d已经被%s使用"
SBFOptions.strings.UNITFRAMEOWNEDFILTER = SBFOptions.strings.UNITFRAMEOWNEDFILTER or "框体%d已经被|cff00d2ff%s|r过滤分配给了玩家，请选择另外一个"
SBFOptions.strings.UNITFRAMEOWNEDSHOW = SBFOptions.strings.UNITFRAMEOWNEDSHOW or "框体%d已经被通过|cff00d2ff%s|r的框体显示分配给玩家，请选择另外一个"
SBFOptions.strings.UNITFRAMEOWNERCHANGE = SBFOptions.strings.UNITFRAMEOWNERCHANGE or "将框体%d的所有权由%s转移给%s"
    
    -- Spells Tab
  SBFOptions.strings.EXCLUDE = "不显示的buff"
  SBFOptions.strings.ALWAYSWARN = "即将消失时始终警报"
  SBFOptions.strings.SHOWING = "显示到"
  SBFOptions.strings.DEFAULTFRAME = "默认框体"
  SBFOptions.strings.SPELLFILTER = "搜索法术"
  SBFOptions.strings.AURA = "光环"
  SBFOptions.strings.CLEARSPELLS = "清除数据"
  SBFOptions.strings.CLEARSPELLSTT1 = "清除SBF的buff缓存数据"
  SBFOptions.strings.CLEARSPELLSTT2 = "如果你遇到了过滤或者buff显示问题请这么做一次"
  SBFOptions.strings.CLEARSPELLSTT3 = "（不会影响你的始终警报/框体分配/显示过滤设定）"
  SBFOptions.strings.SPELLCONFIG = "法术"
    
    -- Global Tab
  SBFOptions.strings.GLOBALCONFIG = "全局设置"
  SBFOptions.strings.HOME = "主页"
  SBFOptions.strings.AURAMAXTIME = "光环效果显示为最大持续时间" 
  SBFOptions.strings.AURAMAXTIMETT1 = "选中后，光环类效果（无持续时间）"
  SBFOptions.strings.AURAMAXTIMETT2 = "会显示为持续时间为最大值的法术。"
  SBFOptions.strings.ENCHANTSFIRST = "优先显示物品附魔"
  SBFOptions.strings.DISABLEBF = "在SBF中禁用ButtonFacade"
  SBFOptions.strings.TOTEMNONBUFF = "不显示非buff图腾"
  SBFOptions.strings.TOTEMOUTOFRANGE = "超出距离也仍显示buff图腾"
  SBFOptions.strings.TOTEMTIMERS = "不显示图腾计时"
    
    -- Misc
  SBFOptions.strings.VERSION2 = "Satrina Buff Frames |cff00ff00%s|r"
  SBFOptions.strings.HINT = "http://evilempireguild.org/SBF"
  SBFOptions.strings.HINT2 = "按住Alt移动我！"
  SBFOptions.strings.FRAME = "框体%d"
  SBFOptions.strings.USINGPROFILE = "正在使用的配置文件"
  SBFOptions.strings.COPYPROFILE = "复制配置文件"
  SBFOptions.strings.DELETEPROFILE = "删除配置文件"
  SBFOptions.strings.NEWPROFILE = "输入新配置文件名"
  SBFOptions.strings.CONFIRMREMOVEPROFILE = "确定要删除配置文件%s？"
  SBFOptions.strings.NEWPROFILEBUTTON = "新建配置文件"
    
  SBFOptions.strings.BUFFFRAME = "Buff框体"
  SBFOptions.strings.BUFFFRAMENUM = "Buff框体%d"
  SBFOptions.strings.CURRENTFRAME = "当前框体："
  SBFOptions.strings.NEWFRAME = "新建框体"
  SBFOptions.strings.REMOVE = "删除"
  SBFOptions.strings.REMOVEFRAME = "删除框体"
  SBFOptions.strings.REMOVEFRAMETT = "删除这个buff框体"
  SBFOptions.strings.DELETEERROR = "不能删除1号、2号buff框体以及物品附魔框体"
  SBFOptions.strings.DEFAULT_TOOLTIP = "重置框体的样式和消失设置"
  SBFOptions.strings.DEFAULTS = "默认值"
  SBFOptions.strings.DEBUFFTIMER = "按类型着色debuff时间"
  SBFOptions.strings.DEBUFFTIMERTT1 = "时间文本会按debuff类型着色"
  SBFOptions.strings.DEBUFFTIMERTT2 = "（诅咒、魔法、毒药等等）"
  SBFOptions.strings.NEWFRAMETT = "创建新buff框体"
  SBFOptions.strings.NONE = "无"
  SBFOptions.strings.HELP = "帮助"
  SBFOptions.strings.POSITIONBOTTOM = "按住Alt以10为步进调整"
  SBFOptions.strings.FRAMELEVEL = "框体层级%d"
    
  SBFOptions.strings.FONT = "字体"
  SBFOptions.strings.FONTSIZE = "字体大小（%d）"
  SBFOptions.strings.OUTLINEFONT = "文字描边"
    
  SBFOptions.strings.RESET = "重置框体"
  SBFOptions.strings.RESETFRAMESTT = "重置为SBF默认框体"

  SBFOptions.strings.FILTERDELET = "删除过滤%s"
  SBFOptions.strings.FILTERREFORMAT = "将过滤%s应用到框体%d"
  SBFOptions.strings.SHOWINFRAMEDELETE = "不在框体%d内显示%s"
  SBFOptions.strings.SHOWFILTER = "匹配过滤%d:%s"
  SBFOptions.strings.FILTERBLOCKED = "过滤被buff框体%d强制显示所忽略"
  SBFOptions.strings.SHOWBUFFS = "显示buff"
  SBFOptions.strings.SHOWDEBUFFS = "显示debuff"
  SBFOptions.strings.DURATION = "持续时间"
    
  SBFOptions.strings.JUSTIFY = "对齐"
  SBFOptions.strings.JUSTIFYRIGHT = "右"
  SBFOptions.strings.JUSTIFYLEFT = "左"

  SBFOptions.strings.CYCIRCLEDADJUST = "cyCircled尺寸（%d）"
  SBFOptions.strings.USECYCIRCLED = "cyCircled"
  SBFOptions.strings.REFRESH = "Buff条更新频率"
  SBFOptions.strings.COPYFROM = "从...复制"
  SBFOptions.strings.TRACKING = "显示追踪"
    
    -- Filters Tab
  SBFOptions.strings.FILTERCONFIG = "过滤"
  SBFOptions.strings.ENABLEFILTERS = "启用过滤"
  SBFOptions.strings.ENABLEFILTERSTT = "启用除了根据buff剩余时间工作的过滤以外的其他全部过滤"
  SBFOptions.strings.ENABLERFILTERS = "启用根据buff剩余时间工作的过滤"
  SBFOptions.strings.ENABLERFILTERSTT = "启用根据buff剩余时间工作的过滤（R和r）"
  SBFOptions.strings.FILTER = "新建过滤"
  SBFOptions.strings.ADDFILTER = "添加过滤"
  SBFOptions.strings.EDITFILTER = "编辑过滤"
  SBFOptions.strings.FILTERS = "当前过滤"
  SBFOptions.strings.FILTERHELP = "过滤帮助"
  SBFOptions.strings.UP = "上升"
  SBFOptions.strings.DOWN = "下降"
  SBFOptions.strings.EDIT = "编辑"
    
    -- Filters Help
  SBFOptions.strings.OPENHTML = "<HTML><BODY><P>"
  SBFOptions.strings.CLOSEHTML = "</P></BODY></HTML>"
  SBFOptions.strings.FILTERHELPHTML = {
    {	"|cff00ff00过滤帮助|r<BR/>",
      "过滤的格式是{|cffff00cc框体|r}:{|cffffcc00命令|r}{|cff00cc00操作|r}{参数}<BR/>",
      "<BR/>",
      "过滤分为4个部分<BR/>",
      "|cffff00cc框体|r - 过滤触发后buff会出现在的框体<BR/>",
      "|cffffcc00命令|r -过滤调用的buff属性<BR/>",
      "|cff00cc00操作|r - 过滤触发的比较条件<BR/>",
      "参数 - 过滤条件的比较值<BR/>",
      "<BR/>",
      "例如：|cff00d2ff3:D>20|r<BR/>",
      "<BR/>",
      "在这个例子中，这些部分分别是（细节显示在下一页）：<BR/>",
      "|cffff00cc3|r - buff会出现在3号框体<BR/>",
      "|cffffcc00D|r - 过滤监控buff的剩余时间<BR/>",
      "|cff00cc00>|r - 过滤使用大于比较<BR/>",
      "20 - 比较的阀值是20分钟<BR/>",
      "<BR/>",
      "所以，过滤|cff00d2ff3:D>20|r的意思是“将任何持续时间大于20分钟的buff显示在buff框体3”<BR/>",
    },
    {	"|cff00ff00命令|r：<BR/>",
      "|cffffcc00n|r: 按名称过滤（不区分大小写）<BR/>",
      "|cffffcc00tt|r: 按提示文字过滤（不区分大小写）<BR/>",
      "|cffffcc00D|r: 按buff持续时间过滤（分钟）<BR/>",
      "|cffffcc00d|r: 按buff持续时间过滤（秒）<BR/>",
      "|cffffcc00r|r: 按buff剩余时间过滤（分钟）<BR/>",
      "|cffffcc00R|r: 按buff剩余时间过滤（秒）<BR/>",
      "|cffffcc00a|r: 光环效果（没有持续时间的buff，例如骑士光环、守护等）<BR/>",
      "|cffffcc00h|r: 过滤有害法术效果（debuff）<BR/>",
      "|cffffcc00e|r: 临时物品附魔（磨刀石，巫师油等）<BR/>",
      "|cffffcc00to|r: 你的图腾（对非萨满玩家无效）<BR/>",
      "<BR/>默认仅过滤buff，如果要过滤debuff就必须使用|cffffcc00h|r命令<BR/>",
      "<BR/>",
      "|cff00ff00操作|r<BR/>",
      "|cff00cc00=|r 完全匹配（对|cffffcc00n|r and |cffffcc00s|r有效）<BR/>",
      "|cff00cc00~|r 不完全匹配 （对 |cffffcc00ntt|r使用）<BR/>",
      "|cff00cc00&lt;|r 小于（对|cffffcc00dDrR|r使用）<BR/>",
      "|cff00cc00&lt;=|r 小于或等于（对|cffffcc00dDrR|r使用）<BR/>",
      "|cff00cc00&gt;|r 大于（对|cffffcc00dDrR|r使用）<BR/>",
      "|cff00cc00&gt;=|r 大于或等于（对|cffffcc00dDrR|r使用）<BR/>",
      "<BR/>",
      "<BR/>",
      "否定运算符， |cff00cc00!|r，可以和|cffffcc00n|r |cffffcc00tt|r |cffffcc00h|r，以及|cffffcc00a|r命令一起使用<BR/>",
      "|cff00d2ffa!|r 意味着“不是光环类效果的buff”（有持续时间的buff）<BR/>",
      "|cff00d2ffn!~药剂|r 意味着“名称中不包含药剂的buff”<BR/>",
      "|cff00d2ffn!=奥术智慧|r 意味着“不是奥术智慧的buff”<BR/>",
      "|cff00d2fft!~智力|r 意味着“提示信息中不包含智力的buff”<BR/>",
      "|cff00d2ffh!|r 意味着“不是debuff的buff”（废话，当然有意义）<BR/>",
    },
    {	"|cff00ff00参数|r<BR/>",
      "字符串 - |cffffcc00n|r和|cffffcc00tt|r命令使用字符串来部分匹配（～）或完全匹配（=）名称或提示文字<BR/>",
      "<BR/>",
      "数字 - |cffffcc00D|r、|cffffcc00d|r、|cffffcc00R|r和|cffffcc00r|r命令使用数字来比较buff的持续时间或剩余时间<BR/>",
      "<BR/>",
      "|cffffcc00a|r、|cffffcc00h|r、|cffffcc00e|r和|cffffcc00to|r命令不包含参数<BR/>",
      "<BR/>",
      "|cff00ff00什么Buff？往哪里去？|r<BR/>",
      "在任何过滤执行以前，所有buff都会根据你在“在buff框体显示”选项的弹出菜单或法术选项卡中设定的buff列表进行检查。如果某个过滤没有将某个buff放置于你觉得应该处于的框体内，最好检查一下你没有使用列表功能将其设置到特定框体内。<BR/>",
      "<BR/>",
      "特定框体的buff列表检查后，过滤按照它们在过滤列表内的顺序执行。如果头两个过滤是|cff00d2ff3:n~药剂|r和|cff00d2ff5:t&lt;60|r，那么“掌控药剂”的buff将始终显示在3号框体内，即使剩余时间少于60秒。在列表内选择过滤并使用上移下移按钮来按照你需要的顺序排列过滤。<BR/>",
    },
    {	"|cff00ff00有害效果命令|r<BR/>",
      "|cffffcc00h|r命令用于过滤特定类型的debuff（诅咒、疾病、魔法、毒药）<BR/>",
      "<BR/>",
      "|cffffcc00h|r过滤所有debuff类型（例如|cff00d2ff2:h|r）<BR/>",
      "|cffffcc00hc|r 过滤诅咒（例如|cff00d2ff3:hc|r）<BR/>",
      "|cffffcc00hd|r 过滤疾病（例如 |cff00d2ff4:hd|r）<BR/>",
      "|cffffcc00hm|r 过滤魔法（例如 |cff00d2ff5:hm|r）<BR/>",
      "|cffffcc00hp|r 过滤毒药（例如 |cff00d2ff6:hp|r）<BR/>",
      "|cffffcc00hu|r 过滤无类型的debuff（例如 |cff00d2ff3:hu|r）<BR/>",
      "|cffffcc00ha|r 过滤你可以解除的debuff（例如 |cff00d2ff4:ha|r）<BR/>",
      "<BR/>",
    },
    {	"|cff00ff00多重过滤|r<BR/>",
      "你可以使用逻辑连接符与{&amp;}和非{||}来组成多重过滤，使用括号来强制分组。<BR/>",
      "<BR/>",
      "|cff00ff00使用或连接符{||}|r<BR/>",
      "|cff00d2ffn~药剂||n~合剂|r 在buff名称中包含“药剂”或“合剂”时会返回true（真）<BR/>",
      "|cff00d2ffa||n~合剂|r 在buff是一个光环效果或名称中包含“合剂”时会返回true<BR/>",
      "<BR/>",
      "|cff00ff00使用与连接符{&amp;}|r<BR/>",
      "|cff00d2ffn~合剂&amp;R&gt;60|r 在buff信息包含“合剂”和剩余时间大于60分钟时返回true<BR/>",
      "|cff00d2ffh&amp;r&lt;20|r 在这个效果是debuff并且剩余时间小于20秒时返回true<BR/>",
      "<BR/>",
      "|cff00ff00括号分组|r<BR/>",
      "括号内的过滤被看作是一个组，在整个过滤的其他参数之前被处理，就像数学中的括号运算顺序。你可以使用任意多层数的括号<BR/>",
		},
    {	"|cff00ff00简单过滤示例|r<BR/>",
      "<BR/>",
      "|cff00d2ff4:n~药剂|r<BR/>",
      "将“法能药剂”、“掌控药剂”等过滤到4号框体<BR/><BR/>",
      "|cff00d2ff3:D&lt;=3|r<BR/>",
      "将所有的持续时间小于等于3分钟的buff过滤到3号框体中<BR/><BR/>",
      "|cff00d2ff4:a|r<BR/>",
      "将所有的光环效果过滤到4号框体<BR/><BR/>",
      "|cff00d2ff3:e|r<BR/>",
      "将所有的临时物品增强效果过滤到3号框体<BR/><BR/>",
      "|cff00d2ff6:h&amp;r&lt;20|r<BR/>",
      "将所有少于20秒的debuff过滤到6号框体<BR/><BR/>",
      "|cff00d2ff3:hd|r<BR/>",
      "将所有疾病效果过滤到3号框体<BR/><BR/>",
      "|cff00d2ff6:ha|r<BR/>",
      "将玩家可以解除的debuff过滤到6号框体<BR/><BR/>",
    },
    {	"|cff00ff00复杂过滤示例|r<BR/>",
      "<BR/>",
      "|cff00d2ffa&amp;(n!~光环&amp;n!~守护)|r 在buff是一个名称不带有“光环”或“守护”的光环效果时返回true<BR/>",
      "- 第一个结果是|cff00d2ffa|r的值 -- 这个buff是否是光环效果？<BR/>",
      "- 第二个结果是|cff00d2ff(n!~光环&amp;n!~守护)|r的值 -- 这个buff是否在名称里不包含“光环”或“守护”？<BR/>",
      "- 如果第一个和第二个结果均为true，则整个过滤对这个buff返回true<BR/>",
      "<BR/>",
      "|cff00d2ffa||(n~合剂&amp;R&gt;60)|r 在buff是光环效果或buff名称包含“合剂”并且剩余时间大于60分钟时返回true。<BR/>",
      "- 第一个结果是|cff00d2ffa|r的值 -- 这个buff是否是光环效果？<BR/>",
      "- 第二个结果是|cff00d2ff(n~合剂&amp;R&gt;60)|r的值 -- 这个buff名称是否包含“合剂”并且剩余时间大于60分钟？<BR/>",
      "- 如果第一和第二个结果任意一个为true则整个过滤对该buff返回true。<BR/>",
      "<BR/>",
      "|cff00d2ff((n~药剂||n~合剂)&amp;R&lt;10)&amp;n!~强固|r 在buff名称中包含“药剂”或“合剂”，剩余时间少于10分钟，并且名称中不包含“强固”时返回<BR/>",
      "- 第一个结果是最内层的括号|cff00d2ff(n~药剂||n~合剂)|r的返回值 -- buff名称是否包含“药剂”或“合剂？”<BR/>",
      "- 第二个结果是|cff00d2ffR&lt;10|r的值 -- 剩余时间是否少于10分钟？<BR/>",
      "- 第三个结果在前两个结果均为true的情况下返回true，并且结束整个括号的求值 -- |cff00d2ff((n~药剂||n~合剂)&amp;R&lt;10)|r<BR/>",
      "-，第四个结果是|cff00d2ffn!~fortification|r的值 -- buff名称是否不包含“强固”？<BR/>",
      "- 如果第三和第四个结果均为true，则整个过滤对这个buff返回true。<BR/>",
    },
  }
  
  SBFOptions.strings.NAMEHELPHTML = {
    {	"|cff00ff00名称帮助|r<BR/>",
      "以下是名称的三种元素：<BR/>",
      "<BR/>",
      "|cffff0ccName|r - Buff的名称将如何显示<BR/>",
      "|cffffcc00Rank|r - Buff的等级将如何显示<BR/>",
      "|cff00cc00Count|r - Buff的叠加数将如何显示<BR/>",
      "<BR/>",
      "例如：|cffff00ccName[full]|r |cffffcc00Rank[Roman]|r |cff00cc00Count[(always)]|r<BR/>",
      "<BR/>",
      "在这个例子中，所有的元素都被显示了：<BR/>",
      "|cffff00ccName[full]|r - 显示完整buff名称（例如“奥术智慧”）<BR/>",
      "|cffffcc00Rank[Roman]|r - Buff等级用罗马数字显示<BR/>",
      "|cff00cc00Count[(XXX)]|r - Buff的叠加数将始终显示在英文括号内<BR/>",
      "<BR/>",
      "这个格式会使buff的名称如下显示|cff00d2ff奥术智慧VI (1)|r<BR/>",
      "<BR/>",
      "|cff00ff00元素格式化|r<BR/>",
      "单个元素的格式始终是|cff00d2ffElement[要显示的内容]|r<BR/>",
      "<BR/>",
      "每个元素类型都会有一些会被buff特定数据通配的关键词。你可以在元素标签里添加任何你想和关键词一起使用的文字，我保证它们会正确显示。<BR/>",
      "<BR/>",
      "例如：Count[(always)] vs. Count[always]<BR/>",
      "关键词always被通配后，Count[(always)]会显示为|cff00d2ff(6)|r<BR/>",
      "关键词always被通配后，Count[always]会显示为|cff00d2ff6|r<BR/>",
      "<BR/>",
      "关键词roman在“等级[Rank roman]”中被通配后，它将显示为|cff00d2ff等级IV|r<BR/>",
    },
    {	"|cff00ff00名称元素|r<BR/>",
      "对名称元素来说有3个关键词：<BR/>",
      "<BR/>",
      "|cffff00ccfull|r - Buff的全名（例如“野性印记”）<BR/>",
      "|cffff00ccshort|r - Buff名称的缩写（例如MotW，不过在中文客户端中似乎无效）<BR/>",
      "|cffff00ccxshort|r - 更短的名称（例如MW，不过在中文客户端中似乎同样无效）<BR/>",
    "|cffff00cctrunc:X|r - Buff的名称从第X个字母起截断。<BR/>",
    "|cffff00ccchop:X|r - 将buff的名称前X个字母切除<BR/>",
    "|cffff00ccof|r - 将buff名称中的“of”前的所有部分移除<BR/>",
    "(例如 Elixir of Draenic Wisdom -> Draenic Wisdom)<BR/>",
      "<BR/>",
      "<BR/>",
      "|cff00ff00等级元素|r<BR/>",
      "对等级元素来说有2个关键词：<BR/>",
      "<BR/>",
      "|cffffcc00arabic|r - Buff的等级用阿拉伯数字显示（例如6）<BR/>",
      "|cffffcc00roman|r - Buff的等级用罗马数字显示（例如VI）<BR/>",
      "<BR/>",
      "如果buff没有等级，等级元素将不显示<BR/>",
      "<BR/>",
      "<BR/>",
      "|cff00ff00叠加数元素|r<BR/>",
      "对叠加数元素来说有3个关键词：<BR/>",
      "<BR/>",
      "|cff00cc00normal|r - 叠加数仅在这个buff叠加了超过1层时显示<BR/>",
      "|cff00cc00stack|r - 叠加数仅在buff是一个可叠加buff时显示，即使这个buff只能叠加1层<BR/>",
      "|cff00cc00always|r - 叠加数始终显示，即使这个buff不可叠加<BR/>",
    },
    {	"|cff00ff00小贴士|r<BR/>",
      "|cffffcc00Rank[Rank roman]|r和'Rank |cffffcc00Rank[roman]|r'实际上区别很大，看这些名称格式：<BR/>",
      "|cffff00ccName[full]|r |cffffcc00Rank[Rank roman]|r和|cffff00ccName[full]|r Rank |cffffcc00Rank[roman]|r<BR/>",
      "<BR/>",
      "施放奥术智慧（等级6）后，它们会显示一样的内容：<BR/>",
      "|cff00d2ff奥术智慧Rank VI|r<BR/>",
      "<BR/>",
      "但是，如果获得了进食充分效果这个没有等级的buff，它们显示的结果会不太一样：<BR/>",
      "|cffff00ccName[full]|r |cffffcc00Rank[Rank roman]|r会显示|cff00d2ff进食充分|r<BR/>",
      "|cffff00ccName[full]|r Rank |cffffcc00Rank[roman]|r会显示|cff00d2ff进食充分Rank|r<BR/>",
      "<BR/>",
      "记得要始终把元素的条件文本写进标签内部！<BR/>",
    },
  }
  
  SBFOptions.strings.frameVisibility = {
    "始终",
    "从不",
    "战斗中",
    "战斗外",
    -- "Mouseover",
  }

  SBFOptions.strings.timerFormats = {
    "暴雪默认样式",
    "分钟:秒",
    "秒",
    "仅显示大于60秒",
    "无计时器",
    "暴雪默认样式2",
    "OmniCC样式",
  }
  
  SBFOptions.strings.WARNTIMETT = {
    "消失警报启动时间",
    "在该buff剩余时间为此值时",
    "显示消失警报",
  }
    
  SBFOptions.strings.MINTIMETT = {
    "最小buff时间",
    "仅对持续时间长于该值",
    "仅对持续时间长于该值",
  }
  
end