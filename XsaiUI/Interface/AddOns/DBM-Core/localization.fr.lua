if GetLocale() ~= "frFR" then return end

DBM_CORE_LOAD_MOD_ERROR				= "Erreur durant le chargement du boss mods pour %s: %s"
DBM_CORE_LOAD_MOD_SUCCESS			= "Charger '%s' boss mods!"
DBM_CORE_LOAD_GUI_ERROR				= "Ne peut charger le GUI: %s"

DBM_CORE_COMBAT_STARTED				= "%s engager. Bonne chance et Amusez-vous ! :)";
DBM_CORE_BOSS_DOWN					= "%s mort apr�s %s!"
DBM_CORE_BOSS_DOWN_LONG				= "%s mort apr�s %s! Votre dernier kill pris %s et le kill le plus rapide pris %s."
DBM_CORE_BOSS_DOWN_NEW_RECORD		= "%s mort apr�s %s! C'est un nouveau record! (ancien record �tant %s)"
DBM_CORE_COMBAT_ENDED				= "Combat contre %s fini apr�s %s."

DBM_CORE_TIMER_FORMAT_SECS			= "%d |4seconde:secondes;"
DBM_CORE_TIMER_FORMAT_MINS			= "%d |4minute:minutes;"
DBM_CORE_TIMER_FORMAT				= "%d |4minute:minutes; and %d |4seconde:secondes;"

DBM_CORE_MIN						= "min"
DBM_CORE_SEC						= "sec"
DBM_CORE_DEAD						= "mort"
DBM_CORE_OK							= "Okay"

DBM_CORE_GENERIC_WARNING_ENRAGE		= "Fr�n�sie dans %s %s"
DBM_CORE_GENERIC_TIMER_ENRAGE		= "Fr�n�sie"
DBM_CORE_OPTION_TIMER_ENRAGE		= "Afficher Fr�n�sie timer"
DBM_CORE_OPTION_HEALTH_FRAME		= "Afficher Vie du Boss frame"

DBM_CORE_OPTION_CATEGORY_TIMERS		= "Barres"
DBM_CORE_OPTION_CATEGORY_WARNINGS	= "Annonces"
DBM_CORE_OPTION_CATEGORY_MISC		= "Divers"

DBM_CORE_AUTO_RESPONDED				= "R�ponse-Auto."
DBM_CORE_STATUS_WHISPER				= "%s: %s, %d/%d personnes en vie"
DBM_CORE_AUTO_RESPOND_WHISPER		= "%s est occup� � combattre contre %s (%s, %d/%d personnes en vie)"

DBM_CORE_VERSIONCHECK_HEADER		= "Deadly Boss Mods - Versions"
DBM_CORE_VERSIONCHECK_ENTRY			= "%s: %s (r%d)"
DBM_CORE_VERSIONCHECK_ENTRY_NO_DBM	= "%s: DBM non install�"
DBM_CORE_VERSIONCHECK_FOOTER		= "Trouver %d joueurs avec Deadly Boss Mods"

DBM_CORE_UPDATEREMINDER_HEADER		= "Votre version de Deadly Boss Mods est p�rim�e.\n Version %s (r%d) disponible ici:"
DBM_CORE_UPDATEREMINDER_FOOTER		= "Faites Ctrl-C pour copier le lien � votre presse-papier."

DBM_CORE_MOVABLE_BAR				= "D�place moi!"

DBM_PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h vous envoie un timer pizza: '%2$s'\n|HDBM:cancel:%2$s:nil|h|cff3588ff[Cancel this timer]|r|h  |HDBM:ignore:%2$s:%1$s|h|cff3588ff[Ignore timers from %1$s]|r|h"
DBM_PIZZA_CONFIRM_IGNORE			= "Voulez vous vraiment ignorer le timers pizza de %s pour cette session?"
DBM_PIZZA_ERROR_USAGE				= "Usage: /dbm [broadcast] timer <time> <text>"

DBM_CORE_ERROR_DBMV3_LOADED			= "Deadly Boss Mods est lanc� doublement car vous avez DBMv3 et DBMv4 d'install� et d'activ�!\nClick \"Okay\" pour d�sactiver DBMv3 et recharger votre interfarce.\nVous pouvez aussi nettoyer votre fichier AddOns en supprimant l'ancien fichier DBMv3."

DBM_CORE_MINIMAP_TOOLTIP_HEADER		= "Deadly Boss Mods"
DBM_CORE_MINIMAP_TOOLTIP_FOOTER		= "Shift+click ou click-droit pour d�placer"

DBM_CORE_RANGECHECK_HEADER			= "V�rifie Port�e (%d yd)"
DBM_CORE_RANGECHECK_SETRANGE		= "D�finir Port�e"
DBM_CORE_RANGECHECK_HIDE			= "Cacher"
DBM_CORE_RANGECHECK_SETRANGE_TO		= "%d yd"

DBM_CORE_SLASHCMD_HELP				= {
	"Available Slash Commands:",
	"/dbm version: V�rifie la version du raid (alias: ver)",
	"/dbm unlock: Affiche un Timer Status d�placable (alias: move)",
	"/dbm timer <x> <text>: Commence un <x> second Timer Pizza avec le nom <text>",
	"/dbm broadcast timer <x> <text>: Diffuse un <x> second Timer Pizza avec le nom <text> au raid (require d'�tre promu ou leader)",
	"/dbm help: Affiche l'aide",
}

DBM_ERROR_NO_PERMISSION				= "Vous n'avez pas les permissions requises pour faire ceci."

DBM_CORE_BOSSHEALTH_HIDE_FRAME		= "Cacher"

DBM_CORE_ALLIANCE					= "Alliance"
DBM_CORE_HORDE						= "Horde"
