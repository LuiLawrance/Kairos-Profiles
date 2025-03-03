-- Macro Definition:

local macro = 3

-------------------------------------------------------------------------------------------
-- Functionality Variables

local targetSceneObserver = 'SCENES.Player POVs.Observer ' .. macro

local layerGameBGD = 'SCENES.Valorant Game.Game.Layers.Background'

local transitionObserver = 'SCENES.Valorant Game.Game.Transitions.BgdMix'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callMacro(macro)
    call(macro, 'play')
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function callTransition(transition)
    call(transition, 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

set(layerGameBGD, 'sourceB', targetSceneObserver)
callTransition(transitionObserver)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
