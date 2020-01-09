-- Not to be localized, just in here for general message purposes.
local GREEN="|cff20ff20"
local YELLOW="|cffffff40"
local RED="|cffff2020"
local WHITE="|cffffffff"
local MAGENTA="|cffff00ff"

local GEIST_PRETTYNAME = GREEN.."Geist"..WHITE
local GEIST_VERSION = " v30000.4"
local GEIST_PRETTYSLASH = YELLOW.."/geist "

-- Chat Messages
GEIST_LOCAL_CHAT = {
	SCALERESET = GEIST_PRETTYNAME..": Scale reset.",
	SCALESET = GEIST_PRETTYNAME..": Scale set to ",
	SCALEAT = GEIST_PRETTYNAME..": Scale is at ",
	BUTTON = GEIST_PRETTYNAME..": Button ",
	SETBUTTONID = " set to ID ",
	IDGUIDE = GEIST_PRETTYNAME..": Button ID guide is now ",
	NUMBUTTONSET = GEIST_PRETTYNAME..": Number of buttons now set to ",
	NUMBUTTONAT = GEIST_PRETTYNAME..": Number of buttons currently set to: ",
}

-- Chat Commands
GEIST_LOCAL_CMD = {
	SCALE = "scale",
	RESET = "reset",
	HELP = "help",
	ASSIGN = "assign",
	GUIDE = "guide",
	BUTTON = "buttons",
	ON = "on",
	OFF = "off",
}

-- Keybindings
local GEIST_LOCAL_KEYBIND = {
	FRAMEBINDSET = "Show Geist",
	BUTTONBINDSET = "Geist Button ",
}

GEIST_CHATUSAGE = {
	GEIST_PRETTYNAME..GEIST_VERSION.." Usage:",
	GEIST_PRETTYNAME..": "..RED.."All changes require a UI reload to take effect.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["BUTTON"]..WHITE..": Tells you the current number of buttons "..GEIST_PRETTYNAME.." is set to use.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["BUTTON"].." X"..WHITE..": Set the number of buttons for "..GEIST_PRETTYNAME.." to use between 1 and 25.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"]..WHITE..": Tells you the current "..GEIST_PRETTYNAME.." scale.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"].." X"..WHITE..": Set the scale of "..GEIST_PRETTYNAME.." to between 0.5 and 1.5.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"].." "..GEIST_LOCAL_CMD["RESET"]..WHITE..": Reset "..GEIST_PRETTYNAME.." to match your UI scale.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["GUIDE"]..WHITE..": Enables or disables the button ID guide. When enabled, two numbers lay over your buttons. The top number is the "..GEIST_PRETTYNAME.." button number. The bottom is the ID currently assigned to it.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["ASSIGN"].."X"..WHITE..": Tells you what Button X's ID currently is.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["ASSIGN"].."X Y"..WHITE..": Sets Button X to ID Y.",
	GEIST_PRETTYNAME..": "..RED.."Almost all changes require a UI reload to take effect.",
}

-- deDE localization courtesy Hannesz (http://wowui.incgamers.com/?p=profile&u=375109)
if (GetLocale() == "deDE") then

-- Chat Messages
GEIST_LOCAL_CHAT = {
	SCALERESET = GEIST_PRETTYNAME..": Skalierung zurückgesetzt",
	SCALESET = GEIST_PRETTYNAME..": Skalierung gesetzt auf ",
	SCALEAT = GEIST_PRETTYNAME..": Skalierung beträgt ",
	BUTTON = GEIST_PRETTYNAME..": Button ",
	SETBUTTONID = " gesetzt auf ID ",
	IDGUIDE = GEIST_PRETTYNAME..": Button-ID-Anzeige (Hilfe) ist nun ",
	NUMBUTTONSET = GEIST_PRETTYNAME..": Anzahl der Buttons gesetzt auf: ",
	NUMBUTTONAT = GEIST_PRETTYNAME..": Anzahl der momentan gezeigten Buttons: ",
}

-- Chat Commands
GEIST_LOCAL_CMD = {
	SCALE = "skalierung",
	RESET = "reset",
	HELP = "hilfe",
	ASSIGN = "festlegen",
	GUIDE = "hilfe",
	BUTTON = "buttons",
	ON = "an",
	OFF = "aus",
}

-- Keybindings
local GEIST_LOCAL_KEYBIND = {
	FRAMEBINDSET = "Geist anzeigen",
	BUTTONBINDSET = "Geist-Button ",
}

GEIST_CHATUSAGE = {
	GEIST_PRETTYNAME..GEIST_VERSION.." Bedienung:",
	GEIST_PRETTYNAME..": "..RED.."Das UI muss neu geladen werden, damit Änderungen inkrafttreten",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["BUTTON"]..WHITE..": Teilt die Anzahl der Buttons mit, die "..GEIST_PRETTYNAME.." anzeigen soll.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["BUTTON"].." X"..WHITE..": Setzt die Anzahl der durch "..GEIST_PRETTYNAME.." zu verwendenden Buttons fest. (Zulässige Werte: 1 - 25)",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"]..WHITE..": Zeigt die momentane Skalierung von "..GEIST_PRETTYNAME.." an.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"].." X"..WHITE..": Legt die Skalierung von "..GEIST_PRETTYNAME.." fest. (Zulässige Werte: 0.5 - 1.5)",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["SCALE"].." "..GEIST_LOCAL_CMD["RESET"]..WHITE..": Die Skalierung von "..GEIST_PRETTYNAME.." so einstellen, dass sie mit der UI-Skallierung übereinstimmt.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["GUIDE"]..WHITE..": Schaltet die Button-ID-Anzeige (Hilfe) an oder aus. Die Hilfe zeigt zwei Nummern über den Buttons an. Die Obere ist die "..GEIST_PRETTYNAME.."-Buttonnummer; die untere beschreibt die momentan zugewiesene ID.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["ASSIGN"].."X"..WHITE..": Zeigt die momentan dem Button X zugewiesene ID an.",
	GEIST_PRETTYSLASH..GEIST_LOCAL_CMD["ASSIGN"].."X Y"..WHITE..": Setzt die ID von Button X auf den Wert Y.",
	GEIST_PRETTYNAME..": "..RED.."Das UI muss neu geladen werden, damit Änderungen inkrafttreten",
}
end

-- Binding Stuff
BINDING_HEADER_GEISTHEADER = GEIST_PRETTYNAME
_G["BINDING_NAME_CLICK GeistHeader:LeftButton"] = GEIST_LOCAL_KEYBIND["FRAMEBINDSET"]
