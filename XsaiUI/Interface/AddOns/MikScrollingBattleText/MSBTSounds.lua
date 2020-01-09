-------------------------------------------------------------------------------
-- Title: Mik's Scrolling Battle Text Sounds
-- Author: Mik
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Private constants.
-------------------------------------------------------------------------------

-- The sound files to use.
local SOUND_FILES = {
-- UniqueSoundName		= "Interface\\Addons\\MikScrollingBattleText\\Sounds\\sound_name.mp3",
-- DifferentSoundName	= "Interface\\Addons\\MikScrollingBattleText\\Sounds\\different_sound_name.wav",
}


-------------------------------------------------------------------------------
-- Load.
-------------------------------------------------------------------------------

-- Loop through all of the sounds and register them.
for soundName, soundPath in pairs(SOUND_FILES) do
 MikSBT.RegisterSound(soundName, soundPath)
end