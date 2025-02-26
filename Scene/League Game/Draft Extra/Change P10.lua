-- Functionality Variables

local gfxTarget = 'GFXSCENES.League.Visitor P5'

local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local layerMainBackground = 'SCENES.Main.Layers.Background'
local sceneKeyboard = 'SCENES.Normal Config.Keyboard'

local snapshotFullMenu = 'SCENES.League Game.Draft.Snapshots.Full Menu'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function activateKeyboard()
    set(gfxKeyboardSource, 'text', gfxTarget)
    set(gfxKeyboard, 'text', get(gfxTarget, 'text'))

    set(layerMainBackground, 'sourceB', sceneKeyboard)
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

activateKeyboard()
callSnapshot(snapshotFullMenu)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
