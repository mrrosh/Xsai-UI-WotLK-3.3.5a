if GetLocale() ~= "frFR" then return end

if not DBM_GUI_Translations then DBM_GUI_Translations = {} end
local L = DBM_GUI_Translations

L.MainFrame = "Deadly Boss Mods"

L.TabCategory_Options 	= "Options G�n�rales"
L.TabCategory_WOTLK 	= "Wrath of the Lich King"
L.TabCategory_BC 	= "The Burning Crusade"
L.TabCategory_CLASSIC 	= "WoW Classic Bosses"
L.TabCategory_OTHER     = "Autre Boss Mods"

L.BossModLoaded 	= "%s statistiques"
L.BossModLoad_now 	= [[Ce boss mod n'est pas charg�. 
Il sera charg� quand vous entrerez dans l'instance. 
Vous pouvez aussi click sur le bouton pour charg� le mod manuellement.]]

L.PosX = 'Position X'
L.PosY = 'Position Y'

L.MoveMe 		= 'd�place moi'
L.Button_OK 		= 'OK'
L.Button_Cancel 	= 'Annuler'
L.Button_LoadMod 	= 'Charge AddOn'
L.Mod_Enabled		= "Activ� boss mod"
L.Mod_EnableAnnounce	= "Annonce au raid"
L.Reset 		= "reset"

L.Enable  		= "Activer"
L.Disable		= "D�sactiver"

L.NoSound		= "Pas de Son"

-- Tab: Boss Statistics
L.BossStatistics	= "Boss Statistiques"
L.Statistic_Kills	= "Tu�s:"
L.Statistic_Wipes	= "Wipes:"
L.Statistic_BestKill	= "Best kill:"
L.Statistic_Heroic	= "h�roique"

-- Tab: General Options
L.General 		= "Options G�n�rales DBM"
L.EnableDBM 		= "Activ� DBM"
L.EnableStatus 		= "R�ponse du 'status' au chuchotement"
L.AutoRespond 		= "Activer r�ponse-auto pendant combat"
L.EnableMiniMapIcon	= "Afficher le bouton minicarte "

L.Button_RangeFrame	= "Afficher/Cacher range-frame"
L.Button_TestBars	= "Commencer barres de test "

L.PizzaTimer_Headline 	= 'Cr�er un "Pizza Timer"'
L.PizzaTimer_Title	= 'Name (e.g. "Pizza!")'
L.PizzaTimer_Hours 	= "Hours"
L.PizzaTimer_Mins 	= "Min"
L.PizzaTimer_Secs 	= "Sec"
L.PizzaTimer_ButtonStart = "Commencer Timer"
L.PizzaTimer_BroadCast	= "Diffuser au Raid"

-- Tab: Raidwarning
L.Tab_RaidWarning 	= "Alerte Raid"
L.RaidWarnColors 	= "Couleurs Alerte Raid"
L.RaidWarnColor_1 	= "Couleur 1"
L.RaidWarnColor_2 	= "Couleur 2"
L.RaidWarnColor_3 	= "Couleur 3"
L.RaidWarnColor_4 	= "Couleur 4"
L.InfoRaidWarning	= [[Vous pouvez sp�cifier la position et la couleurs de l'affichage d'Alerte Raid. 
Cet affichage est utilis� pour des messages comme "Joueur X est affect� par Y" messages]]
L.ColorResetted 	= "D�finir la couleur de se champs have been resetted"
L.ShowWarningsInChat 	= "Afficher alertes dans la fen�tre de dialogue"
L.ShowFakedRaidWarnings = "Afficher alertes as faked Raid Warning messages"
L.WarningIconLeft 	= "Afficher l'icone sur le cot� gauche"
L.WarningIconRight 	= "Afficher l'icone sur le cot� droit"
L.RaidWarnMessage 	= "Merci d'utiliser Deadly Boss Mods"
L.BarWhileMove 		= "Alerte-raid d�placable"
L.RaidWarnSound		= "Jouer son sur alerte-raid"
L.SpecialWarnSound	= "Jouer son on alerte-sp�cial"

-- Tab: Barsetup
L.BarSetup   = "Style de la Barre"
L.BarTexture = "Texture de la Barre"
L.BarStartColor = "Couleur D�part"
L.BarEndColor = "Couleur Fin"
L.ExpandUpwards		= "Nouvelles barres au-dessus"

L.Slider_BarOffSetX 	= "Position X: %d"
L.Slider_BarOffSetY 	= "Position Y: %d"
L.Slider_BarWidth 	= "Largeur de la barre: %d"
L.Slider_BarScale 	= "Proportion de la barre: %0.2f"
L.AreaTitle_BarSetup 	= "Options g�n�rales des barres"
L.AreaTitle_BarSetupSmall = "Options des petites barres"
L.AreaTitle_BarSetupHuge = "Options des grandes barres"
L.BarIconLeft 		= "Icone Gauche"
L.BarIconRight 		= "Icone Droit"
L.EnableHugeBar 	= "Activ� les grandes barres (Barre 2)"
L.FillUpBars		= "Remplir les barres"

-- Tab: Spam Filter
L.Panel_SpamFilter		= "Filtre Spam"
L.Area_SpamFilter		= "Options G�n�rales Filtre Spam"
L.HideBossEmoteFrame	= "Cacher la fen�tre des emotes de boss"
L.SpamBlockRaidWarning	= "Filtrer les annonces venant d'autre boss mods"
L.SpamBlockBossWhispers	= "Filtre <DBM> alerte chuchotement pendant combat"

