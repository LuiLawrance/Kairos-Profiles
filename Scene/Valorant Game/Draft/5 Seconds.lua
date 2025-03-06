-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables



-------------------------------------------------------------------------------------------
-- Arrays

local gfxTimer = 'GFXSCENES.Valorant.Draft Timer'

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

call(gfxTimer, 'reset')
set(gfxTimer, 'start', '5')
call(gfxTimer, 'start')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
