-- Macro Definition:

local macro = 2

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selectedMatch = get(gfxMediaSelect, 'value')

local thisMacro = 'GFXSCENES.Control.T'.. macro .. ' ' .. selectedMatch
local gfxMatchScore = 'GFXSCENES.Control.Match ' .. selectedMatch .. ' Match'
local gfxTeam1 = 'GFXSCENES.Control.T1 ' .. selectedMatch
local gfxTeam2 = 'GFXSCENES.Control.T2 ' .. selectedMatch

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

call(thisMacro, 'increase')

T1 = get(gfxTeam1, 'value')
T2 = get(gfxTeam2, 'value')

set(gfxMatchScore, 'text', T1 .. '-' .. T2)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
