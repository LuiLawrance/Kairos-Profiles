-- Functionality Variables

local gfxTarget = 'GFXSCENES.League.Caster 2'

local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local layerMainBackground = 'SCENES.Main.Layers.Background'
local sceneKeyboard = 'SCENES.Normal Config.Keyboard'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function activateKeyboard()
    set(gfxKeyboardSource, 'text', gfxTarget)
    set(gfxKeyboard, 'text', get(gfxTarget, 'text'))

    set(layerMainBackground, 'sourceB', sceneKeyboard)
end

-------------------------------------------------------------------------------------------
-- Main Script

activateKeyboard()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
