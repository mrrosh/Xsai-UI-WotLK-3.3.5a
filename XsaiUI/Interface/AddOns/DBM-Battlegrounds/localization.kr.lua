if (GetLocale() == "koKR") then


----------------------------
--  General BG functions  --
----------------------------
L = DBM:GetModLocalization("Battlegrounds")

L:SetGeneralLocalization({
	name = "기본 전장 기능"
})

L:SetTimerLocalization({
	TimerInvite = "%s"
})

L:SetOptionLocalization({
	ColorByClass	= "스코어 화면의 유저 이름을 클래스 이름으로 보이기",
	ShowInviteTimer	= "전장 입장 타이머 보이기",
	AutoSpirit	= "자동 부활"
})


--------------
--  투기장  --
--------------
L = DBM:GetModLocalization("Arenas")

L:SetGeneralLocalization({
	name = "투기장"
})

L:SetTimerLocalization({
	TimerStart	= "게임 시작",
})

L:SetOptionLocalization({
	TimerStart = "시작 타이머 보이기"
})

L:SetMiscLocalization({
	Start60 = "투기장 시작 1분 전 입니다.!",
	Start30 = "투기장 시작 30초 전 입니다.!",
	Start15 = "투기장 시작 15초 전 입니다.!"
})

---------------
--  Alterac  --
---------------
L = DBM:GetModLocalization("Alterac")

L:SetGeneralLocalization({
	name = "알터랙 계곡"
})

L:SetTimerLocalization({
	TimerStart = "게임 시작", 
	TimerTower = "%s",
	TimerGY = "%s",
})

L:SetMiscLocalization({
	BgStart60 = "1분 뒤 알터렉 계곡 전장이 시작됩니다.",
	BgStart30 = "30초 뒤 알터렉 계곡 전장이 시작됩니다.",
	ZoneName = "알터랙 계곡",
})

L:SetOptionLocalization({
	TimerStart  = "시작 타이머 보기",
	TimerTower = "탑 점령 타이머 보기",
	TimerGY = "무덤 점령 타이머 보기",
	AutoTurnIn = "퀘스트 아이템 자동 수락"
})

---------------
--  Arathi  --
---------------
L = DBM:GetModLocalization("Arathi")

L:SetGeneralLocalization({
	name = "아라시 분지"
})

L:SetMiscLocalization({
	BgStart60 = "아라시 분지 전장의 시작이 1분 남았습니다.",
	BgStart30 = "아라시 분지 전장의 시작이 30초 남았습니다.",
	ZoneName = "아라시 분지",
	ScoreExpr = "(%d+)/2000",
	Alliance = "얼라이언스",
	Horde = "호드",
	WinBarText = "%s 획득",
	BasesToWin = "필승 점령 갯수 : %d",
	Flag = "깃발"
})

L:SetTimerLocalization({
	TimerStart = "게임 시작", 
	TimerCap = "%s",
})

L:SetOptionLocalization({
	TimerStart  = "시작 타이머 보기",
	TimerWin = "승리 예상 타이머 보기",
	TimerCap = "깃발 점령 타이머 보기",
	ShowAbEstimatedPoints = "승/패 예상 포인트 보기",
	ShowAbBasesToWin = "필승 점령 갯수 보기"
})

-----------------------
--  Eye of the Storm --
-----------------------
L = DBM:GetModLocalization("EyeOfTheStorm")

L:SetGeneralLocalization({
	name = "폭풍의 눈"
})

L:SetMiscLocalization({
	BgStart60 = "폭풍의 눈 전투의 시작이 1분 남았습니다.!",
	BgStart30 = "폭풍의 눈 전투의 시작이 30초 남았습니다.!",
	ZoneName = "폭풍의 눈",
	ScoreExpr = "(%d+)/2000",
	Alliance = "얼라이언스",
	Horde = "호드",
	WinBarText = "%s 점령",
	FlagReset = "깃발이 제자리로 돌아갔습니다.!",
	FlagTaken = "(.+) << 깃발을 되찾았습니다.!",
	FlagCaptured = "ha%w+ << 깃발을 획득 했습니다.!",
	FlagDropped = "깃발을 떨어뜨렸습니다.!",

})

L:SetTimerLocalization({
	TimerStart = "게임 시작", 
	TimerFlag = "깃발 재생성",
})

L:SetOptionLocalization({
	TimerStart  = "시작 타이머 보기",
	TimerWin = "점령 타이머 보기",
	TimerFlag = "깃발 재생성 타이머 보기",
	ShowPointFrame = "깃발 운반 및 필요 예상 포인트 보기",
})

--------------------
--  Warsong Gulch --
--------------------
L = DBM:GetModLocalization("Warsong")

L:SetGeneralLocalization({
	name = "전쟁노래 협곡"
})

L:SetMiscLocalization({
	BgStart60 = "전쟁노래 협곡의 전투 시작이 1분 남았습니다.!",
	BgStart30 = "전쟁노래 협곡의 전투가 30초 남았습니다.전투 준비를 마무리해 주세요.!",
	ZoneName = "전쟁노래 협곡",
	Alliance = "얼라이언스",
	Horde = "호드",	
	InfoErrorText = "전투에서 벗어나면 깃발 운반자 타겟팅 기능이 복구됩니다.",
	ExprFlagPickUp = "The (%w+) .lag was picked up by (.+)!",
	ExprFlagCaptured = "(.+) captured the (%w+) flag!",
	ExprFlagReturn = "The (%w+) .lag was returned to its base by (.+)!",
	FlagAlliance = "얼라이언스 깃발: ",
	FlagHorde = "호드 깃발: ",
	FlagBase = "베이스",
})

L:SetTimerLocalization({
	TimerStart = "게임 시작", 
	TimerFlag = "깃발 재생성",
})

L:SetOptionLocalization({
	TimerStart  = "시작 타이머 보기",
	TimerWin = "승리 예상 타이머 보기",
	TimerFlag = "깃발 재생성 타이머 보기",
	ShowFlagCarrier = "깃발 운반자 보기",
	ShowFlagCarrierErrorNote = "전투중 깃발 운반자 에러 메세지 보기",
})



----------------
--  아카본  --
----------------

L = DBM:GetModLocalization("Archavon")

L:SetGeneralLocalization({
	name = "아카본 석실"
})

L:SetWarningLocalization({
	WarningShards	= "바위 조각 대상 : >%s<",
	WarningGrab		= "Archavon grabbed >%s<"
})

L:SetTimerLocalization({
	TimerShards = "바위 조각: %s"
})

L:SetMiscLocalization({
	TankSwitch = "%%s lunges for (%S+)!"
})

L:SetOptionLocalization({
	TimerShards = "바위 조각 타이머 보기",
	WarningShards = "바위 조각 경고 보기",
	WarningGrab = "Show Tank Grab warning"
})
end
