-------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text French Localization
-- Author: Mik
-- French Translation by: Calthas, Devfool
-------------------------------------------------------------------------------

-- Don't do anything if the locale isn't French.
if (GetLocale() ~= "frFR") then return end

-- Local reference for faster access.
local L = MikSBT.translations

-------------------------------------------------------------------------------
-- French localization
-------------------------------------------------------------------------------

------------------------------
-- Fonts
------------------------------

L.FONT_FILES = {
 ["MSBT Adventure"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\adventure.ttf",
 ["MSBT Bazooka"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\bazooka.ttf",
 ["MSBT Cooline"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\cooline.ttf",
 ["MSBT Diogenes"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\diogenes.ttf",
 ["MSBT Ginko"]			= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\ginko.ttf",
 ["MSBT Heroic"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\heroic.ttf",
 ["MSBT Porky"]			= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\porky.ttf",
 ["MSBT Talisman"]		= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\talisman.ttf",
 ["MSBT Transformers"]	= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\transformers.ttf",
 ["MSBT Yellowjacket"]	= "Interface\\Addons\\MikScrollingBattleText\\Fonts\\yellowjacket.ttf",
}

L.DEFAULT_FONT_NAME = "MSBT Porky"


------------------------------
-- Commands
------------------------------

L.COMMAND_USAGE = {
 "Usage: " .. MikSBT.COMMAND .. " <command> [params]",
 " Commande:",
 "  " .. L.COMMAND_RESET .. " - Restaure les paramètres par défaut.",
 "  " .. L.COMMAND_DISABLE .. " - Désactive l'addon.",
 "  " .. L.COMMAND_ENABLE .. " - Active l'addon.",
 "  " .. L.COMMAND_SHOWVER .. " - Affiche la version actuelle.",
 "  " .. L.COMMAND_HELP .. " - Affiche l'aide des commandes.",
}


------------------------------
-- Output messages
------------------------------

L.MSG_ICON_MODULE_WARNING	= "ATTENTION: Le module MSBTIcons n'est plus nécessaire. Supprimez-le de vos addons."
L.MSG_SM_MODULE_WARNING		= "ATTENTION: Le module MSBTSharedMedia n'est plus nécessaire. Supprimez-le de vos addons."
L.MSG_DISABLE				= "Addon désactivé."
L.MSG_ENABLE				= "Addon activé."
L.MSG_PROFILE_RESET			= "Profil réinitialisé"
L.MSG_HITS					= "Coups"
L.MSG_CRIT					= "Crit"
L.MSG_CRITS					= "Crits"
L.MSG_MULTIPLE_TARGETS		= "Multiples"
L.MSG_READY_NOW				= "Disponible"


------------------------------
-- Scroll area messages
------------------------------

L.MSG_INCOMING			= "Entrant"
L.MSG_OUTGOING			= "Sortant"
L.MSG_NOTIFICATION		= "Alertes"
L.MSG_STATIC			= "Statique"


---------------------------------------
-- Master profile event output messages
---------------------------------------

L.MSG_COMBAT					= "Combat"
L.MSG_DISPEL					= "Dissiper"
L.MSG_CP						= "CP"
L.CP_FULL						= "Finissez-le"
L.MSG_KILLING_BLOW				= "Coup Fatal"
L.MSG_TRIGGER_LOW_HEALTH		= "Vie Faible"
L.MSG_TRIGGER_LOW_MANA			= "Mana Faible"
L.MSG_TRIGGER_LOW_PET_HEALTH	= "Vie du familier faible"