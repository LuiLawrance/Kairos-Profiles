-- Macro Definition:

local macro = 8
local gfxTarget = 'GFXSCENES.Valorant.Visitor P' .. (macro - 5)

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'
local gfxLocation = 'GFXSCENES.Valorant.'
local gfxSwap = 'GFXSCENES.Valorant.P Swap'
local gfxSwapSelect = 'GFXSCENES.Valorant.Swap Select'

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

if get(gfxSwap, 'value') == 1 then
    if get(gfxSwapSelect, 'value') == 0 then
        set(gfxSwapSelect, 'value', macro)
    elseif get(gfxSwapSelect, 'value') == macro then
        set(gfxSwapSelect, 'value', 0)
    else
        local swap = get(gfxSwapSelect, 'value')

        if swap > 5 then
            swap = swap - 5
            this = 'Visitor P' .. swap
        else
            this = 'Home P' .. swap
        end

        if macro > 5 then
            swap = macro - 5
            other = 'Visitor P' .. swap
        else
            other = 'Home P' .. macro
        end

        nameThis = get(gfxLocation .. this, 'text')
        nameOther = get(gfxLocation .. other, 'text')

        set(gfxLocation .. this, 'text', nameOther)
        set(gfxLocation .. other, 'text', nameThis)

        set(gfxSwapSelect, 'value', 0)
    end
else
    activateKeyboard()
    callSnapshot(snapshotFullMenu)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
