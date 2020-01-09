-------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text German Localization
-- Author: Mik
-- German Translation by: Farook
-------------------------------------------------------------------------------

-- Don't do anything if the locale isn't German.
if (GetLocale() ~= "deDE") then return; end

-- Local reference for faster access.
local L = MikSBT.translations;

-------------------------------------------------------------------------------
-- German localization
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

L.DEFAULT_FONT_NAME = "MSBT Porky";


------------------------------
-- Commands
------------------------------

L.COMMAND_USAGE = {
 "Usage: " .. MikSBT.COMMAND .. " <befehle> [params]",
 " Befehle:",
 "  " .. L.COMMAND_RESET .. " - Das aktuelle Profil auf Standardwerte zur\195\188cksetzen.",
 "  " .. L.COMMAND_DISABLE .. " - Das Addon deaktivieren.",
 "  " .. L.COMMAND_ENABLE .. " - Das Addon aktivieren.",
 "  " .. L.COMMAND_SHOWVER .. " - Zeigt die aktuelle Version an.",
 "  " .. L.COMMAND_HELP .. " - Hilfe anzeigen.",
}


------------------------------
-- Output messages
------------------------------

--L.MSG_ICON_MODULE_WARNING	= "WARNING: The MSBTIcons module is no longer required. Remove it from your AddOns folder to avoid wasting memory.";
--L.MSG_SM_MODULE_WARNING		= "WARNING: The MSBTSharedMedia module is no longer required.  Remove it from your AddOns folder.";
L.MSG_DISABLE				= "Addon deaktiviert.";
L.MSG_ENABLE				= "Addon aktiviert.";
L.MSG_PROFILE_RESET			= "Profil zur\195\188cksetzen";
L.MSG_HITS					= "Treffer";
--L.MSG_CRIT					= "Crit";
--L.MSG_CRITS					= "Crits";
L.MSG_MULTIPLE_TARGETS		= "Mehrere";
L.MSG_READY_NOW				= "Vorhanden";


------------------------------
-- Scroll area messages
------------------------------

L.MSG_INCOMING			= "Eingehend";
L.MSG_OUTGOING			= "Ausgehend";
L.MSG_NOTIFICATION		= "Benachrichtigung";
L.MSG_STATIC			= "Statisch";


---------------------------------------
-- Master profile event output messages
---------------------------------------

L.MSG_COMBAT					= "Kampf";
L.MSG_DISPEL					= "Zerstreuen";
--L.MSG_CP						= "CP";
L.MSG_CP_FULL					= "Alle Combo-Punkte";
L.MSG_KILLING_BLOW				= "Todessto\195\159";
L.MSG_TRIGGER_LOW_HEALTH		= "Gesundheit Niedrig";
L.MSG_TRIGGER_LOW_MANA			= "Mana Niedrig";
L.MSG_TRIGGER_LOW_PET_HEALTH	= "Begleiter Gesundheit Niedrig";