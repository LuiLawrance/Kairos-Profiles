-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selectedMatch = get(gfxMediaSelect, 'value')

local gfxMatchBO = 'GFXSCENES.Control.BO ' .. selectedMatch
local gfxMatchScore = 'GFXSCENES.Control.Match ' .. selectedMatch .. ' Match'
local gfxTeam1 = 'GFXSCENES.Control.T1 ' .. selectedMatch
local gfxTeam2 = 'GFXSCENES.Control.T2 ' .. selectedMatch

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

call(gfxTeam1, 'reset')
call(gfxTeam2, 'reset')

if get(gfxMatchBO, 'value') == 3 then
    set(gfxMatchScore, 'text', 'BO3')
else
    set(gfxMatchScore, 'text', 'BO5')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
