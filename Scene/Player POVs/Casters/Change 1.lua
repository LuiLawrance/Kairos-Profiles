-- Functionality Variables

local gfxTargetLeague = 'GFXSCENES.League.Caster 1'
local gfxTargetValorant = 'GFXSCENES.Valorant.Caster 1'

local gfxGame = 'GFXSCENES.Control.Game'
local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local layerMainBackground = 'SCENES.Main.Layers.Background'
local sceneKeyboard = 'SCENES.Normal Config.Keyboard'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function activateKeyboard(target)
    set(gfxKeyboardSource, 'text', target)
    set(gfxKeyboard, 'text', get(target, 'text'))

    set(layerMainBackground, 'sourceB', sceneKeyboard)
end

-------------------------------------------------------------------------------------------
-- Main Script

if get(gfxGame, 'value') == 1 then
    activateKeyboard(gfxTargetLeague)
elseif get(gfxGame, 'value') == 3 then
    activateKeyboard(gfxTargetValorant)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
