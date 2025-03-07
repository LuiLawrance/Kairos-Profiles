-- Macro Definition:

local macro = 'Ongoing'

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selectedMatch = get(gfxMediaSelect, 'value')

local gfxText = 'GFXSCENES.Control.Match ' .. selectedMatch .. ' Date'

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

set(gfxText, 'text', macro)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
