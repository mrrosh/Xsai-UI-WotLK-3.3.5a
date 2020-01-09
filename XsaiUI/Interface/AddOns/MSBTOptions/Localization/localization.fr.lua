-------------------------------------------------------------------------------
-- Title: MSBT Options French Localization
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
-- Interface messages
------------------------------

L.MSG_NEW_PROFILE					= "Nouveau Profil"
L.MSG_PROFILE_ALREADY_EXISTS		= "Le Profil existe déjà."
L.MSG_INVALID_PROFILE_NAME			= "Nom de profil invalide."
L.MSG_NEW_SCROLL_AREA				= "Nouveau zone de défilement"
L.MSG_SCROLL_AREA_ALREADY_EXISTS	= "Une zone de défilement portant ce nom existe déjà."
L.MSG_INVALID_SCROLL_AREA_NAME		= "Nom de zone de défilement invalide."
L.MSG_ACKNOWLEDGE_TEXT				= "Etes-vous certain de vouloir effectuer cette action?"
L.MSG_NORMAL_PREVIEW_TEXT			= "Normal"
L.MSG_INVALID_SOUND_FILE			= "Le fichier son doit être au format .mp3 ou .wav."
L.MSG_NEW_TRIGGER					= "Nouveau déclencheur"
L.MSG_TRIGGER_CLASSES				= "Classes du déclencheur"
L.MSG_MAIN_EVENTS					= "Evènements principaux"
L.MSG_TRIGGER_EXCEPTIONS			= "Exceptions du déclenchement"
L.MSG_EVENT_CONDITIONS				= "Conditions de l'évènement"
L.MSG_SKILLS						= "Compétences"
L.MSG_SKILL_ALREADY_EXISTS			= "Cette compétence existe déjà."
L.MSG_INVALID_SKILL_NAME			= "Nom de compétence invalide."
L.MSG_HOSTILE						= "Hostile"
L.MSG_ANY							= "Tous"
L.MSG_CONDITION						= "Condition"
L.MSG_CONDITIONS					= "Conditions"


------------------------------
-- Class Names.
------------------------------

local obj = L.CLASS_NAMES
obj["DEATHKNIGHT"]	= "Chevalier de la mort"
obj["DRUID"]		= "Druide"
obj["HUNTER"]		= "Chasseur"
obj["MAGE"]			= "Mage"
obj["PALADIN"]		= "Paladin"
obj["PRIEST"]		= "Prêtre"
obj["ROGUE"]		= "Voleur"
obj["SHAMAN"]		= "Chaman"
obj["WARLOCK"]		= "Démoniste"
obj["WARRIOR"]		= "Guerrier"


------------------------------
-- Interface tabs
------------------------------

obj = L.TABS
obj[1] = { label="Général", tooltip="Affiche les options générales."}
obj[2] = { label="Zones de défilement", tooltip="Affiche les options de création, suppression et configuration des zones de défilement.\n\nPassez votre souris sur les icônes pour plus d'informations."}
obj[3] = { label="Evènements", tooltip="Affiche les options pour les évènements entrants, sortants et de notification.\n\nPassez votre souris sur les icônes pour plus d'informations."}
obj[4] = { label="Déclencheurs", tooltip="Affiche les options du système de déclencheurs.\n\nPassez votre souris sur les icônes pour plus d'informations."}
obj[5] = { label="Controle du Spam", tooltip="Affiche les options de contrôle du spam."}
obj[6] = { label="Cooldowns", tooltip="Affiche les options des notifications de cooldown."}
obj[7] = { label="Icônes des Compétences", tooltip="Affiche les options des icônes de compétences."}


------------------------------
-- Interface checkboxes
------------------------------

obj = L.CHECKBOXES
obj["enableMSBT"]			= { label="Activer Mik's Scrolling Battle Text", tooltip="Activer MSBT."}
obj["stickyCrits"]				= { label="Coups critiques persistants", tooltip="Utiliser le style persistant pour les coups critiques."}
obj["gameDamage"]				= { label="Dommages du jeu", tooltip="Afficher les dommages par défaut du jeu au dessus de la tête des ennemis."}
obj["gameHealing"]				= { label="Soins du jeu", tooltip="Afficher les soins par déaut du jeu au dessus de la tête des cibles."}
obj["enableSounds"]				= { label="Activer les sons", tooltip="Jouer les sons associés aux évènements et déclencheurs."}
obj["colorPartialEffects"]  = { label="Coloriser les effets partiels", tooltip="Assigner des couleurs aux effets partiels."}
obj["crushing"]					= { label="Ecrasements", tooltip="Afficher les écrasements."}
obj["glancing"]					= { label="Eraflures", tooltip="Afficher les éraflures."}
obj["absorb"]					= { label="Absorptions partielles", tooltip="Afficher la valeur des absorptions partielles."}
obj["block"]					= { label="Bloquages partiels", tooltip="Afficher la valeur des bloquages partiels."}
obj["resist"]					= { label="Résistances partielles", tooltip="Afficher la valeur des résistances partielles."}
obj["vulnerability"]			= { label="Bonus de vulnérabilité", tooltip="Afficher la valeur des bonus de vulnérabilité."}
obj["overheal"]					= { label="Overheals", tooltip="Afficher la valeur d'overheal."}
obj["colorDamageAmounts"]		= { label="Valeurs des dommages en couleur", tooltip="Utiliser des couleurs pour la valeur des dommages."}
obj["colorDamageEntry"]			= { tooltip="Activer la colorisation pour ce type de dommage."}
obj["enableScrollArea"]			= { tooltip="Activer la zone de défilement."}
obj["inheritField"]				= { label="Hérité", tooltip="Hériter de la valeur par défaut.  Désélectionner pour modifier cette valeur."}
obj["stickyEvent"]				= { label="Toujours Persistant", tooltip="Utiliser le style persistant pour l'évènement."}
obj["enableTrigger"]			= { tooltip="Activer le déclencheur."}
obj["allPowerGains"]			= { label="TOUS les gains d'énergie", tooltip="Affiche tous les gains d'énergie même ceux qui ne sont pas affichés dans le journal ce combat.\n\nATTENTION: Cette option est source de spam et ignorera les réglages de seuil de spam et de son contrôle.\n\nNON RECOMMANDE."}
obj["hyperRegen"]				= { label="Hyper Regen", tooltip="Affiche les gains d'énergie durant les phases de regen rapide de certaines capacités comme Innervation ou Connexion spirituelle.\n\nNOTE: Les gains affichés ne seront pas contrôlés."}
obj["abbreviateSkills"]			= { label="Compétences abrégées", tooltip="Nom des compétences abrégées (Client anglais seulement).\n\nCela peut être contourné pour chaque évènement en utilisant le code %sl."}
obj["hideSkills"]				= { label="Cacher les noms des Compétences", tooltip="Ne pas afficher les noms de compétences pour les évènements entrants et sortants.\n\nVous abandonnerez quelques possibilités de personnalisation de l'évènement si vous utilisez cette option car le code %s sera ignoré."}
obj["hideNames"]				= { label="Cacher les noms des Unités", tooltip="Ne pas afficher les noms des unités pour les évènements entrants et sortants.\n\nVous abandonnerez quelques possibilités de personnalisation de l'évènement si vous utilisez cette option car le code %n sera ignoré."}
obj["allClasses"]				= { label="Toutes les classes"}
obj["enableCooldowns"]			= { label="Activer les Cooldowns", tooltip="Affiche une notification quand un cooldown est terminé."}
obj["enableIcons"]				= { label="Activer les icônes de compténce", tooltip="Affiche les icônes des compétences pour les évènements quand c'est possible."}
obj["exclusiveSkills"]			= { label="Noms exclusifs de compétence", tooltip="Montre seulement les noms de compténce quand une icône n'est pas disponible."}


------------------------------
-- Interface dropdowns
------------------------------

obj = L.DROPDOWNS
obj["profile"]				= { label="Profil actuel:", tooltip="Assigne le profil actif."}
obj["normalFont"]			= { label="Police normale:", tooltip="Assigne la police de caractères utilisée pour les coups non critiques."}
obj["critFont"]				= { label="Police critique:", tooltip="Assigne la police de caractères utilisée pour les coups critiques."}
obj["normalOutline"]		= { label="Contour normal:", tooltip="Assigne le contour utilisé pour les coups non critiques."}
obj["critOutline"]			= { label="Contour critique:", tooltip="Assigne le contour utilisé pour les coups critiques."}
obj["scrollArea"]			= { label="Zone de défilement:", tooltip="Sélectionne la zone de défilement à configurer."}
obj["sound"]				= { label="Son:", tooltip="Sélectionne le son à jouer quand un évènement intervient."}
obj["animationStyle"]		= { label="Animation normale:", tooltip="Style d'animation pour l'animations non persistante dans la zone de défilement."}
obj["stickyAnimationStyle"]	= { label="Animations persistante:", tooltip="Style d'animation pour l'animation persistante dans la zone de défilement."}
obj["direction"]			= { label="Direction:", tooltip="La direction de l'animation."}
obj["behavior"]				= { label="Comportement:", tooltip="Le comportement de l'animation."}
obj["textAlign"]			= { label="Alignement du texte:", tooltip="Alignement du texte pour l'animation."}
obj["eventCategory"]		= { label="Catégorie d'évènement:", tooltip="La catégorie de l'évènement à configurer."}
obj["outputScrollArea"]		= { label="Zone de défilement de sortie:", tooltip="Sélectionne la zone de défilement à utiliser."}
obj["mainEvent"]			= { label="Evènement principal:"}
obj["triggerCondition"]		= { label="Condition:", tooltip="La condition à tester."}
obj["triggerRelation"]		= { label="Relation:"}
obj["triggerParameter"]		= { label="Paramètre:"}


------------------------------
-- Interface buttons
------------------------------

obj = L.BUTTONS
obj["copyProfile"]				= { label="Copier", tooltip="Copie le profil sous un nouveau nom."}
obj["resetProfile"]				= { label="Réinitialiser", tooltip="Réinitialise le profil avec les paramètres par défaut."}
obj["deleteProfile"]			= { label="Supprimer", tooltip="Supprime le profil."}
obj["masterFont"]				= { label="Police principale", tooltip="Paramètres des polices principales, hérités par les zones de défilement et les évènements associées avec elles, à moins qu'ils ne soient dépassés par les réglages individuels."}
obj["partialEffects"]			= { label="Effets partiels", tooltip="Détermine les effets partiels affichés et les paramètres de couleurs."}
obj["damageColors"]				= { label="Couleurs des dommages", tooltip="Vous permet de paramétrer les couleurs assignés aux valeurs des dommages suivant leur type."}
obj["inputOkay"]				= { label="OK", tooltip="Accepte la saisie."}
obj["inputCancel"]				= { label="Annuler", tooltip="Annule la saisie."}
obj["genericSave"]				= { label="Enregistrer", tooltip="Enregistre les modifications."}
obj["genericCancel"]			= { label="Annuler", tooltip="Annule les modifications."}
obj["addScrollArea"]			= { label="Ajouter une zone", tooltip="Ajoute une zone de défilement à laquelle des déclencheurs et évènements peuvent être assignés."}
obj["configScrollAreas"]		= { label="Configurer les zones", tooltip="Permet de configurer les styles d'animation normales et persistantes, l'alignement du texte, la largeur/hauteur de la zone de défilement et leur emplacement."}
obj["editScrollAreaName"]		= { tooltip="Cliquer pour modifier le nom de la zone de défilement."}
obj["scrollAreaFontSettings"]	= { tooltip="Cliquer pour modifier les paramètres de police pour la zone de défilement. Ces paramètres seront utilisés par tous les évènements de cette zone à moins qu'ils ne soient dépassés par les réglages individuels."}
obj["deleteScrollArea"]			= { tooltip="Cliquer pour supprimer la zone de défilement."}
obj["scrollAreasPreview"]		= { label="Aperçu", tooltip="Prévisualiser les modifications."}
obj["toggleAll"]				= { label="Changer Tout", tooltip="Modifie l'état des évènements dans la catégorie sélectionnée."}
obj["moveAll"]					= { label="Déplacer Tout", tooltip="Déplace tous les évènements dans la catégorie sélectionnée vers la zone de défilement spécifiée."}
obj["eventFontSettings"]		= { tooltip="Cliquer pour éditer les paramètres de police de l'évènement."}
obj["eventSettings"]			= { tooltip="Cliquer pour éditer les paramètres de l'évènement comme la zone de défilement, message, sonore, etc."}
obj["customSound"]				= { tooltip="Cliquer pour saisir un fichier son personnalisé." }
obj["playSound"]				= { label="Jouer", tooltip="Cliquer pour jouer le son."}
obj["addTrigger"]				= { label="Ajouter un déclencheur", tooltip="Ajoute un nouveau déclencheur."}
obj["triggerSettings"]			= { tooltip="Cliquer pour configurer les conditions du déclencheur."}
obj["deleteTrigger"]			= { tooltip="Cliquer pour supprimer ce déclencheur."}
obj["editTriggerClasses"]		= { tooltip="Cliquer pour déterminer à quelles classes le déclencheur s'applique."}
obj["addMainEvent"]				= { label="Ajouter un évènement", tooltip="Quand n'importe lequel de ces évènements survient et que leurs conditions définies sont vraies, le déclencheur s'activera à moins qu'une des exceptions spécifiées soient vraies."}
obj["addTriggerException"]		= { label="Ajouter une exception", tooltip="Quand n'importe laquelle de ces exceptions est vraie, le déclencheur ne s'activera pas."}
obj["editEventConditions"]		= { tooltip="Cliquer pour éditer les conditions de l'évènement."}
obj["deleteMainEvent"]			= { tooltip="Cliquer pour supprimer l'évènement."}
obj["addEventCondition"]		= { label="Ajouter une condition", tooltip="Quand TOUTES les conditions sont vraies pour l'évènement sélectionné, le déclencheur s'activera à moins qu'une des exceptions spécifiées soit vraie."}
obj["editCondition"]			= { tooltip="Cliquer pour éditer la condition."}
obj["deleteCondition"]			= { tooltip="Cliquer pour supprimer la condition."}
obj["throttleList"]				= { label="Commande de puissance", tooltip="Définit des durées personnalisées pour les compétences spécifiées."}
obj["mergeExclusions"]			= { label="Exclusions de la fusion", tooltip="Définit la liste des compétences qui ne seront pas fusionnées."}
obj["skillSuppressions"]		= { label="Compétences supprimées", tooltip="Supprime des compétences en fonction de leur nom."}
obj["skillSubstitutions"]		= { label="Compétences substituées", tooltip="Substitue les nom des compétences avec des valeurs personnalisées."}
obj["addSkill"]					= { label="Ajouter une compétence", tooltip="Ajoute une nouvelle compétence à la liste."}
obj["deleteSkill"]				= { tooltip="Cliquer pour supprimer cette compétence."}
obj["cooldownExclusions"]		= { label="Exclusions de la liste des cooldowns", tooltip="Spécifie les compétences pour lesquelles le cooldown sera ignoré."}


------------------------------
-- Interface editboxes
------------------------------

obj = L.EDITBOXES
obj["copyProfile"]		= { label="Nom du nouveau profil:", tooltip="Nom du nouveau profil vers lequel copier le profil courant."}
obj["scrollAreaName"]	= { label="Nouveau nom pour la zone de défilement:", tooltip="Nouveau nom pour la zone de défilement."}
obj["xOffset"]			= { label="Décalage X:", tooltip="Le décalage horizontal de la zone de défilement."}
obj["yOffset"]			= { label="Décalage Y:", tooltip="Le décalage vertical de la zone de défilement."}
obj["eventMessage"]		= { label="Message affiché:", tooltip="Le message affiché quand l'évènement intervient."}
obj["soundFile"]		= { label="Nom du fichier son:", tooltip="le nom du fichier son à joueur quand l'évènement intervient."}
obj["iconSkill"]		= { label="Icône de compétence:", tooltip="Le nom ou le numéro d'ID d'une compétence dont l'icône sera affichée quand l'évènement survient.\n\nMSBT essayera automatiquement d'afficher une icône appropriée si aucune n'est spécifiée.\n\nNOTE: une numéro d'ID doit être utilisé à la place du nom si la compétence n'est pas dans le livre de sort de la classe jouée quand l'évènement survient. La plupart des bases de données en ligne comme wowhead permettent de rechercher cette ID."}
obj["skillName"]		= { label="Nom de compétence:", tooltip="Le nom de la compétence à ajouter."}
obj["substitutionText"]	= { label="Texte de substitution:", tooltip="Le texte à substituer pour le nom de la compétence."}


------------------------------
-- Interface sliders
------------------------------

obj = L.SLIDERS
obj["animationSpeed"]		= { label="Vitesse d'animation", tooltip="Définit la vitesse maître de l'animation.\n\nChaque zone de défilement peut être configurée pour avoir sa propre vitesse d'animation."}
obj["normalFontSize"]		= { label="Taille normale", tooltip="Définit la taille de la police pour les coups non critiques."}
obj["normalFontOpacity"]	= { label="Opacité normale", tooltip="Définit l'opacité de la police pour les coups non critiques."}
obj["critFontSize"]			= { label="Taille critique", tooltip="Définit la taille de la police pour les coups critiques."}
obj["critFontOpacity"]		= { label="Opacité critique", tooltip="Définit l'opacité de la police pour les coups critiques."}
obj["scrollHeight"]			= { label="Hauteur de défilement", tooltip="La hauteur de la zone de défilement."}
obj["scrollWidth"]			= { label="Largeur de défilement", tooltip="La largeur de la zone de défilement."}
obj["scrollAnimationSpeed"]	= { label="Vitesse d'animation", tooltip="La vitesse de l'animation pour la zone de défilement."}
obj["powerThreshold"]		= { label="Seuil de l'énergie", tooltip="Le seuil que les gains d'énergie doivent dépasser pour être affichés."}
obj["healThreshold"]		= { label="Seuil des soins", tooltip="Le seuil que les soins doivent dépasser pour être affichés."}
obj["damageThreshold"]		= { label="Seuil des dommages", tooltip="Le seuil que les dommages doivent dépasser pour être affichés."}
obj["dotThrottleTime"]		= { label="Temps de spam des DoT", tooltip="Le nombre de secondes à prendre en compte pour afficher les DoT."}
obj["hotThrottleTime"]		= { label="Temps de spam des HoT", tooltip="Le nombre de secondes à prendre en compte pour afficher les HoT."}
obj["powerThrottleTime"]	= { label="Temps de spam des Gains", tooltip="Le nombre de secondes à prendre en compte pour afficher les gains de puissance."}
obj["skillThrottleTime"]	= { label="Contrôle du temps", tooltip="Le nombre de secondes à prendre en compte pour afficher la compétence."}
obj["cooldownThreshold"]	= { label="Contrôle du cooldown", tooltip="Les compétences avec un cooldown inférieur au nombre de secondes spécifié ne seront pas affichées."}

------------------------------
-- Event categories
------------------------------
obj = L.EVENT_CATEGORIES
obj[1] = "Entrant player"
obj[2] = "Entrant familier"
obj[3] = "Sortant player"
obj[4] = "Sortant familier"
obj[5] = "Alertes"


------------------------------
-- Event codes
------------------------------

obj = L.EVENT_CODES
obj["DAMAGE_TAKEN"]			= "%a - Quantité de dommages.\n"
obj["HEALING_TAKEN"]		= "%a - Quantité de soins reçus.\n"
obj["DAMAGE_DONE"]			= "%a - Dommages infligés.\n"
obj["HEALING_DONE"]			= "%a - Quantité de soins.\n"
obj["ABSORBED_AMOUNT"]		= "%a - Quantité de dommages absorbés.\n"
obj["ENERGY_AMOUNT"]		= "%a - Quantité de pouvoir.\n"
obj["CP_AMOUNT"]			= "%a - Nombre de points de combo.\n"
obj["HONOR_AMOUNT"]			= "%a - Quantité d'honneur.\n"
obj["REP_AMOUNT"]			= "%a - Quantité de réputation.\n"
obj["SKILL_AMOUNT"]			= "%a - Nouveau niveau dans la compétence.\n"
obj["EXPERIENCE_AMOUNT"]	= "%a - Quantité d'expérience.\n"
obj["ATTACKER_NAME"]		= "%n - Nom de l'attaquant.\n"
obj["HEALER_NAME"]			= "%n - Nom du soigneur.\n"
obj["ATTACKED_NAME"]		= "%n - Nom de l'unité attaquée.\n"
obj["HEALED_NAME"]			= "%n - Nom de l'unité soignée.\n"
obj["BUFFED_NAME"]			= "%n - Nom de l'unité.\n"
obj["SKILL_NAME"]			= "%s - Nom de la compétence.\n"
obj["SPELL_NAME"]			= "%s - Nom du sort.\n"
obj["DEBUFF_NAME"]			= "%s - Nom du debuff.\n"
obj["BUFF_NAME"]			= "%s - Nom du buff.\n"
obj["ITEM_BUFF_NAME"]		= "%s - Nom du buff d'objet.\n"
obj["EXTRA_ATTACKS"]		= "%s - Attaque supplémentaire.\n"
obj["SKILL_LONG"]			= "%sl - Forme longue de %s. Utilisé pour outrepassé l'abrévation pour cet évènement.\n"
obj["DAMAGE_TYPE_TAKEN"]	= "%t - Type de dommages.\n"
obj["DAMAGE_TYPE_DONE"]		= "%t - Type de dommages faits.\n"
obj["ENVIRONMENTAL_DAMAGE"]	= "%e - Nom de la source de dommages (chute, noyade, lave, etc...)\n"
obj["FACTION_NAME"]			= "%e - Faction.\n"
obj["UNIT_KILLED"]			= "%e - Nom de l'unité tuée.\n"
obj["SHARD_NAME"]			= "%e - Fragment d'âme.\n"
obj["EMOTE_TEXT"]			= "%e - Le texte de l'emote.\n"
obj["MONEY_TEXT"]			= "%e - Le texte de l'argent gagné.\n"
obj["COOLDOWN_NAME"]		= "%e - Le nom de la compétence qui est prête.\n"
obj["POWER_TYPE"]			= "%p - Type de pouvoir (énergie, rage, mana).\n"


------------------------------
-- Incoming events
------------------------------

obj = L.INCOMING_PLAYER_EVENTS
obj[1]	= { label="Mêlée", tooltip="Afficher les dommages des attaques de mêlée."}
obj[2]	= { label="Mêlée critiques", tooltip="Afficher les dommages des attaques critiques de mêlée."}
obj[3]	= { label="Manques de mêlée", tooltip="Afficher les attaques de mêlée manquées."}
obj[4]	= { label="Esquives de mêlée", tooltip="Afficher les attaques de mêlée esquivées."}
obj[5]	= { label="Parades de mêlée", tooltip="Afficher les attaques de mêlée parées."}
obj[6]	= { label="Blocage de mêlée", tooltip="Afficher les dommages en mêlée bloquées."}
obj[7]	= { label="Absorption de mêlée", tooltip="Afficher les dommages en mêlée absorbés."}
obj[8]	= { label="Immunités de mêlée", tooltip="Afficher les attaques de mêlée auxquelles vous êtes immunisé."}
obj[9]	= { label="Compétences", tooltip="Afficher les dommages des compétences."}
obj[10]	= { label="Compétences critiques", tooltip="Afficher les dommages des compétences critiques."}
obj[11]	= { label="DoTs des compétences", tooltip="Afficher les dommages des DoT de compétences."}
--obj[12]	= { label="Damage Shield Hits", tooltip="Enable incoming damage done by damage shields."}
--obj[13]	= { label="Damage Shield Crits", tooltip="Enable incoming crits done by damage shields."}
obj[14]	= { label="Manques des compétences", tooltip="Afficher les compétences qui vous ont manqué."}
obj[15]	= { label="Esquives des compétences", tooltip="Afficher les compétences que vous avez esquivé."}
obj[16]	= { label="Parades des compétences", tooltip="Afficher les compétences que vous avez paré."}
obj[17]	= { label="Bloquages des compétences", tooltip="Afficher les capacités que vous avez bloqué."}
obj[18]	= { label="Résistances aux sorts", tooltip="Afficher les sorts auxquels vous avez résisté."}
obj[19]	= { label="Absorptions des compétences", tooltip="Afficher les dommages des compétences que vous avez absorbé."}
obj[20]	= { label="Immunités aux compétences", tooltip="Afficher les compétences auxquelles vous êtes immunisé."}
obj[21]	= { label="Compétences renvoyés", tooltip="Afficher les compétences que vous avez renvoyé."}
obj[22]	= { label="Sorts interrompus", tooltip="Afficher les sorts que vous avez interrompu."}
obj[23]	= { label="Soins", tooltip="Afficher les soins reçus."}
obj[24]	= { label="Soins critiques", tooltip="Afficher les soins critiques reçus."}
obj[25]	= { label="Soins sur le temps (HoT)", tooltip="Afficher les soins des soins sur le temps (HoT) reçus."}
obj[26]	= { label="Dommages de l'environnement", tooltip="Afficher les effets de l'environnement (chutes, noyades, lave, etc...) sur vous."}

obj = L.INCOMING_PET_EVENTS
obj[1]	= { label="Mêlée", tooltip="Afficher les dommages des attaques de mêlée sur votre familier."}
obj[2]	= { label="Mêlée critiques", tooltip="Afficher les dommages des attaques critiques de mêlée sur votre familier."}
obj[3]	= { label="Manques de mêlée", tooltip="Afficher les attaques de mêlée manquées sur votre familier."}
obj[4]	= { label="Esquives de mêlée", tooltip="Afficher les attaques de mêlée esquivées par votre familier"}
obj[5]	= { label="Parades de mêlée", tooltip="Afficher les attaques de mêlée parées par votre familier."}
obj[6]	= { label="Blocage de mêlée", tooltip="Afficher les dommages en mêlée bloquées par votre familier."}
obj[7]	= { label="Absorption de mêlée", tooltip="Afficher les dommages en mêlée absorbés par votre familier."}
obj[8]	= { label="Immunités de mêlée", tooltip="Afficher les attaques de mêlée auxquelles votre familier est immunisé."}
obj[9]	= { label="Compétences", tooltip="Afficher les dommages des compétences sur votre familier."}
obj[10]	= { label="Compétences critiques", tooltip="Afficher les dommages des compétences critiques sur votre familier."}
obj[11]	= { label="DoTs des compétences", tooltip="Afficher les dommages des DoT de compétences sur votre familier."}
--obj[12]	= { label="Damage Shield Hits", tooltip="Enable incoming damage done to your pet by damage shields."}
--obj[13]	= { label="Damage Shield Crits", tooltip="Enable incoming crits done to your pet by damage shields."}
obj[14]	= { label="Manques des compétences", tooltip="Afficher les compétences qui ont manqué votre familier."}
obj[15]	= { label="Esquives des compétences", tooltip="Afficher les compétences que votre familier a esquivé."}
obj[16]	= { label="Parades des compétences", tooltip="Afficher les compétences que votre familier a paré."}
obj[17]	= { label="Bloquages des compétences", tooltip="Afficher les capacités que votre familier a bloqué."}
obj[18]	= { label="Résistances aux sorts", tooltip="Afficher les sorts auxquels votre familier a résisté."}
obj[19]	= { label="Absorptions des compétences", tooltip="Afficher les dommages des compétences que votre familier a absorbé."}
obj[20]	= { label="Immunités aux compétences", tooltip="Afficher les compétences auxquelles votre familier est immunisé."}
obj[21]	= { label="Soins", tooltip="Afficher les soins reçus par votre familier."}
obj[22]	= { label="Soins critiques", tooltip="Afficher les soins critiques reçus par votre familier."}
obj[23]	= { label="Soins sur le temps (HoT)", tooltip="Afficher les soins des soins sur le temps (HoT) reçus par votre familier."}


------------------------------
-- Outgoing events
------------------------------

obj = L.OUTGOING_PLAYER_EVENTS
obj[1]	= { label="Mêlée", tooltip="Afficher les dommages infligés en mêlée."}
obj[2]	= { label="Mêlée critiques", tooltip="Afficher les dommages critiques infligés en mêlée."}
obj[3]	= { label="Manques de mêlée", tooltip="Afficher vos attaques manquées en mêlée."}
obj[4]	= { label="Esquives de mêlée", tooltip="Afficher vos attaques esquivées en mêlée."}
obj[5]	= { label="Parades de mêlée", tooltip="Afficher vos attaques parées en mêlée."}
obj[6]	= { label="Bloquage de mêlée", tooltip="Afficher vos dommages en mêlée bloquées."}
obj[7]	= { label="Absorption de mêlée", tooltip="Afficher vos dommages en mêlée absorbés."}
obj[8]	= { label="Immunités de mêlée", tooltip="Afficher vos attaques de mêlée auxquelles l'ennemi est immunisé."}
obj[9]	= { label="Evites de mêlée", tooltip="Afficher vos attaques de mêlée evitées."}
obj[10]	= { label="Compétences", tooltip="Afficher les dommages de vos compétences."}
obj[11]	= { label="Compétences critiques", tooltip="Afficher les dommages de vos compétences critiques."}
obj[12]	= { label="DoTs des compétences", tooltip="Afficher les dommages sur le temps (DoT) de vos compétences."}
--obj[13]	= { label="Damage Shield Hits", tooltip="Enable outgoing damage done by damage shields."}
--obj[14]	= { label="Damage Shield Crits", tooltip="Enable outgoing crits done by damage shields."}
obj[15]	= { label="Manques compétences", tooltip="Afficher les coups manqués de vos compétences."}
obj[16]	= { label="Esquives compétences", tooltip="Afficher vos compétences esquivées."}
obj[17]	= { label="Parades compétences", tooltip="Afficher vos compétences parées."}
obj[18]	= { label="Bloquages compétences", tooltip="Afficher vos compétences bloquées."}
obj[19]	= { label="Résistances aux sorts", tooltip="Afficher les résistances à vos sorts."}
obj[20]	= { label="Absorptions compétences", tooltip="Afficher les absorptions de dommages de vos compétences."}
obj[21]	= { label="Immunités compétences", tooltip="Afficher les dommages vos compétences auxquels l'ennemi est immunisé."}
obj[22]	= { label="Compétences renvoyés", tooltip="Afficher les dommages de vos compétences qui vous sont renvoyés."}
obj[23]	= { label="Sorts interrompus", tooltip="Affiche les sorts qui sont interrompus."}
obj[24]	= { label="Evites compétences", tooltip="Afficher les evites de vos compétences."}
obj[25]	= { label="Soins", tooltip="Afficher les soins effectués."}
obj[26]	= { label="Soins critiques", tooltip="Afficher les soins critiques effectués."}
obj[27]	= { label="Soins sur le temps (HoT)", tooltip="Afficher les soins sur le temps."}
obj[28] = { label="Dissipation", tooltip="Affiche les dissipations."}

obj = L.OUTGOING_PET_EVENTS
obj[1]	= { label="Mêlée", tooltip="Afficher les dommages infligés par votre familier."}
obj[2]	= { label="Mêlée critiques", tooltip="Afficher les dommages critiques infligés par votre familier."}
obj[3]	= { label="Manques de mêlée", tooltip="Afficher les attaques manquées par votre familier."}
obj[4]	= { label="Esquives de mêlée", tooltip="Afficher les attaques de mêlée de votre familier esquivées."}
obj[5]	= { label="Parades de mêlée", tooltip="Afficher les attaques de mêlée de votre familier parées."}
obj[6]	= { label="Bloquage de mêlée", tooltip="Afficher les attaques de mêlée de votre familier bloquées."}
obj[7]	= { label="Absorption de mêlée", tooltip="Afficher les dommages en mêlée absorbés de votre familier."}
obj[8]	= { label="Immunités de mêlée", tooltip="Afficher les capacités en mêlée de votre familier auxquelles l'ennemi est immunisé."}
obj[9]	= { label="Evites de mêlée", tooltip="Afficher les evites en mêlée de votre familier."}
obj[10]	= { label="Compétences", tooltip="Afficher les dommages des compétences de votre familier."}
obj[11]	= { label="Compétences critiques", tooltip="Afficher les dommages des compétences critiques de votre familier."}
obj[12]	= { label="DoTs des compétences", tooltip="Afficher les dommages sur le temps (DoTs) des compétences de votre familier."}
--obj[13]	= { label="Damage Shield Hits", tooltip="Enable outgoing damage done by your pet's damage shields."}
--obj[14]	= { label="Damage Shield Crits", tooltip="Enable outgoing crits done by your pet's damage shields."}
obj[15]	= { label="Manques compétences", tooltip="Afficher les compétences de votre familier qui ont manqué."}
obj[16]	= { label="Esquives compétences", tooltip="Afficher les compétences de votre familier qui ont été esquivées."}
obj[17]	= { label="Parades compétences", tooltip="Afficher les compétences de votre familier qui ont été parées."}
obj[18]	= { label="Bloquages compétences", tooltip="Afficher les bloquages des compétences de votre familier."}
obj[19]	= { label="Résistances aux sorts", tooltip="Afficher les sorts de votre familier résisté."}
obj[20]	= { label="Absorptions compétences", tooltip="Afficher les compétences de votre familier absorbés."}
obj[21]	= { label="Immunités compétences", tooltip="Afficher les compétences de votre familier auxquelles l'ennemi est immunisé."}
obj[22]	= { label="Evites compétences", tooltip="Afficher les évites des compétences de votre familier."}
obj[23] = { label="Dissipation", tooltip="Affiche les dissipations de votre familier."}


------------------------------
-- Notification events
------------------------------

obj = L.NOTIFICATION_EVENTS
obj[1]	= { label="Debuffs", tooltip="Afficher les debuffs par lesquels vous êtes affectés."}
obj[2]	= { label="Buffs", tooltip="Afficher les buffs reçus."}
obj[3]	= { label="Buffs des objets", tooltip="Afficher les buffs reçus par les objets."}
obj[4]	= { label="Fin des debuffs", tooltip="Signaler la fin des debuffs."}
obj[5]	= { label="Fin des buffs", tooltip="Signaler la fin des buffs."}
obj[6]	= { label="Fin des buffs d'objets", tooltip="Signaler quand un de vos buffs d'objet se termine."}
obj[7]	= { label="Début combat", tooltip="Signaler l'entrée en combat."}
obj[8]	= { label="Sortie combat", tooltip="Signaler la fin du combat."}
obj[9]	= { label="Gains de puissance", tooltip="Signaler les gains de mana, rage et énergie."}
obj[10]	= { label="Pertes de puissance", tooltip="Signaler les pertes de mana, rage et énergie par des drains."}
obj[11]	= { label="Gain de points de combo", tooltip="Signaler les points de combo."}
obj[12]	= { label="5 points de combo", tooltip="Signaler quand vous avez atteint 5 points de combo."}
obj[13]	= { label="Gains d'honneur", tooltip="Afficher les gains d'honneur."}
obj[14]	= { label="Gains de réputation", tooltip="Afficher les gains de réputation."}
obj[15]	= { label="Pertes de réputation", tooltip="Afficher les pertes de réputation."}
obj[16]	= { label="Progression de compétences", tooltip="Afficher les progressions de compétences."}
obj[17]	= { label="Gains d'expérience", tooltip="Afficher les gains d'expérience."}
obj[18]	= { label="Coups fatals sur un joueur", tooltip="Afficher vos coups fatals sur les joueurs ennemis."}
obj[19]	= { label="Coups fatals sur un PNJ", tooltip="Afficher vos coups fatals sur les personnages non joueurs ennemis."}
obj[20]	= { label="Gains de fragments d'âme", tooltip="Afficher les gains de fragments d'âme."}
obj[21]	= { label="Attaques supplémentaires", tooltip="Afficher les gains d'attaques supplémentaires, comme Windfury, etc."}
obj[22]	= { label="Gains de buff ennemi", tooltip="Affiche les buffs que gagne votre ennemi ciblé."}
obj[23]	= { label="Emote des monstres", tooltip="Affiche les emotes du monstre que vous ciblez."}
obj[24]	= { label="Gains d'argent", tooltip="Affiche vos gains d'argent."}


------------------------------
-- Trigger info
------------------------------

-- Main events.
obj = L.TRIGGER_DATA
obj["SWING_DAMAGE"]				= "Dommage du Swing"
obj["RANGE_DAMAGE"]				= "Dommage à Distance"
obj["SPELL_DAMAGE"]				= "Dommage de Compétence"
obj["GENERIC_DAMAGE"]			= "Dommage de Swing/Distance/Compétence"
obj["SPELL_PERIODIC_DAMAGE"]	= "Dommage de Compétence Périodique (DoT)"
obj["DAMAGE_SHIELD"]			= "Dommage de Bouclier"
obj["DAMAGE_SPLIT"]				= "Dommage de Split"
obj["ENVIRONMENTAL_DAMAGE"]		= "Dommage de l'Environnement"
obj["SWING_MISSED"]				= "Manque du Swing"
obj["RANGE_MISSED"]				= "Manque à Distance"
obj["SPELL_MISSED"]				= "Manque d'une Compétence"
obj["GENERIC_MISSED"]			= "Manque de Swing/Distance/Compétence"
obj["SPELL_PERIODIC_MISSED"]	= "Manque d'une Compétence Périodique"
obj["SPELL_DISPEL_FAILED"]		= "Manque d'une Dissipation"
obj["DAMAGE_SHIELD_MISSED"]		= "Manque d'un Dommage de Bouclier"
obj["SPELL_HEAL"]				= "Soin"
obj["SPELL_PERIODIC_HEAL"]		= "Soin Périodique (HoT)"
obj["SPELL_ENERGIZE"]			= "Gain de Puissance"
obj["SPELL_PERIODIC_ENERGIZE"]	= "Gain de Puissance Périodique"
obj["SPELL_DRAIN"]				= "Drain de Puissance"
obj["SPELL_PERIODIC_DRAIN"]		= "Drain de Puissance Périodique"
obj["SPELL_LEECH"]				= "Sangsue de Puissance"
obj["SPELL_PERIODIC_LEECH"]		= "Sangsue de Puissance Périodique"
obj["SPELL_INTERRUPT"]			= "Interruption de Compétence"
obj["SPELL_AURA_APPLIED"]		= "Aura Appliquée"
obj["SPELL_AURA_REMOVED"]		= "Aura Enlevée"
obj["SPELL_STOLEN"]				= "Aura Volée"
obj["SPELL_DISPEL"]				= "Aura Dissipée"
obj["ENCHANT_APPLIED"]			= "Enchantement Appliqué"
obj["ENCHANT_REMOVED"]			= "Enchantement Enlevé"
obj["SPELL_CAST_START"]			= "Sort Incanté"
obj["SPELL_CAST_SUCCESS"]		= "Sort Réussi"
obj["SPELL_CAST_FAILED"]		= "Sort Echoué"
obj["SPELL_SUMMON"]				= "Invoquer"
obj["SPELL_CREATE"]				= "Créer"
obj["PARTY_KILL"]				= "Coup Fatal"
obj["UNIT_DIED"]				= "Unité Morte"
obj["UNIT_DESTROYED"]			= "Unité Détruite"
obj["SPELL_EXTRA_ATTACKS"]		= "Attaque Supplémentaire"
obj["UNIT_HEALTH"]				= "Modification des Points de Vie"
obj["UNIT_MANA"]				= "Modification des Points de Mana"
obj["UNIT_ENERGY"]				= "Modification des Points d'Energie"
obj["UNIT_RAGE"]				= "Modification des Points de Rage"
obj["UNIT_RUNIC_POWER"]			= "Modification du Pouvoir Runique"
obj["SKILL_COOLDOWN"]			= "Fin de Cooldown d'une Compétence"
 
-- Main event conditions.
obj["sourceName"]				= "Origine Unité Nom"
obj["sourceAffiliation"]		= "Origine Unité Affiliation"
obj["sourceReaction"]			= "Origine Unité Réaction"
obj["sourceControl"]			= "Origine Unité Contrôle"
obj["sourceUnitType"]			= "Origine Unité Type"
obj["recipientName"]			= "Destinataire Unité Nom"
obj["recipientAffiliation"]		= "Destinataire Unité Affiliation"
obj["recipientReaction"]		= "Destinataire Unité Réaction"
obj["recipientControl"]			= "Destinataire Unité Contrôle"
obj["recipientUnitType"]		= "Destinataire Unité Type"
obj["skillID"]					= "Compétence ID"
obj["skillName"]				= "Compétence Nom"
obj["skillSchool"]				= "Compétence Ecole"
obj["extraSkillID"]				= "Extra Compétence ID"
obj["extraSkillName"]			= "Extra Compétence Nom"
obj["extraSkillSchool"]			= "Extra Compétence Ecole"
obj["amount"]					= "Quantité"
--obj["overkillAmount"]			= "Overkill Amount"
obj["damageType"]				= "Dommage Type"
obj["resistAmount"]				= "Quantité Résistée"
obj["blockAmount"]				= "Quantité Bloquée"
obj["absorbAmount"]				= "Quantité Absorbée"
obj["isCrit"]					= "Critique"
obj["isGlancing"]				= "Coup Diminué"
obj["isCrushing"]				= "Coup Ecrasé"
obj["extraAmount"]				= "Extra Quantité"
obj["missType"]					= "Type Manque"
obj["hazardType"]				= "Type Hazard"
obj["powerType"]				= "Type Puissance"
obj["auraType"]					= "Type Aura"
obj["threshold"]				= "Seuil"
obj["unitID"]					= "Unité ID"
obj["unitReaction"]				= "Unité Réaction"

-- Exception conditions.
obj["buffActive"]		= "Buff Actif"
obj["buffInactive"]		= "Buff Inactif"
obj["currentCP"]		= "Points de Combo Actuels"
obj["currentPower"]		= "Puissance Actuelle"
--obj["inCombat"]			= "In Combat"
obj["recentlyFired"]	= "Déclencheur Récemment Activé"
obj["trivialTarget"]	= "Cible Insignifiante"
obj["unavailableSkill"]	= "Compétence Indisponible"
obj["warriorStance"]	= "Position de Combat"
obj["zoneName"]			= "Nom de la Zone"
obj["zoneType"]			= "Type de la Zone"
 
-- Relationships.
obj["eq"]		= "Est Egal A"
obj["ne"]		= "N'est Pas Egal A"
obj["like"]		= "Est Comme"
obj["unlike"]	= "N'est Pas Comme"
obj["lt"]		= "Est Moins Que"
obj["gt"]		= "Est Plus Grand Que"
 
-- Affiliations.
obj["affiliationMine"]		= "A Moi"
obj["affiliationParty"]		= "Membre du Groupe"
obj["affiliationRaid"]		= "Membre du Raid"
obj["affiliationOutsider"]	= "Etranger"
obj["affiliationTarget"]	= "Cible"
obj["affiliationFocus"]		= "Focus"
obj["affiliationYou"]		= "Vous"

-- Reactions.
obj["reactionFriendly"]	= "Ami"
obj["reactionNeutral"]	= "Neutral"
obj["reactionHostile"]	= "Hostile"

-- Control types.
obj["controlServer"]	= "Serveur"
obj["controlHuman"]		= "Humain"

-- Unit types.
obj["unitTypePlayer"]	= "Joueur" 
obj["unitTypeNPC"]		= "NPC"
obj["unitTypePet"]		= "Familier"
obj["unitTypeGuardian"]	= "Gardien"
obj["unitTypeObject"]	= "Objet"

-- Aura types.
obj["auraTypeBuff"]		= "Buff"
obj["auraTypeDebuff"]	= "Debuff"

-- Zone types.
obj["zoneTypeArena"]	= "Arène"
obj["zoneTypePvP"]		= "Champ de Bataille"
obj["zoneTypeParty"]	= "Instance 5"
obj["zoneTypeRaid"]		= "Instance de raid"

-- Booleans
obj["booleanTrue"]	= "Vrai"
obj["booleanFalse"]	= "Faux"


------------------------------
-- Font info
------------------------------

-- Font outlines.
obj = L.OUTLINES
obj[1] = "Aucun"
obj[2] = "Fin"
obj[3] = "Epais"

-- Text aligns.
obj = L.TEXT_ALIGNS
obj[1] = "Gauche"
obj[2] = "Centre"
obj[3] = "Droite"


------------------------------
-- Sound info
------------------------------

obj = L.SOUNDS
obj["MSBT Low Mana"]	= "MSBT Mana Faible"
obj["MSBT Low Health"]	= "MSBT Vie Faible"
obj["MSBT Cooldown"]	= "MSBT Cooldown"


------------------------------
-- Animation style info
------------------------------

-- Animation styles
obj = L.ANIMATION_STYLE_DATA
obj["Angled"]		= "En Angle"
obj["Horizontal"]	= "Horizontal"
obj["Parabola"]		= "Parabole"
obj["Straight"]		= "Directement"
obj["Static"]		= "Statique"
obj["Pow"]			= "Pow"

-- Animation style directions.
obj["Alternate"]	= "Alternée"
obj["Left"]			= "Gauche"
obj["Right"]		= "Droite"
obj["Up"]			= "Haut"
obj["Down"]			= "Bas"

-- Animation style behaviors.
obj["AngleUp"]		= "En Angle vers le Haut"
obj["AngleDown"]	= "En Angle vers le Bas"
obj["GrowUp"]		= "Développement vers le Haut"
obj["GrowDown"]		= "Développement vers le Bas"
obj["CurvedLeft"]	= "Incurvé à Gauche"
obj["CurvedRight"]	= "Incurvé à Droite"
obj["Jiggle"]		= "Secoué"
obj["Normal"]		= "Normal"
