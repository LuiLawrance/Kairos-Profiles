-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selectedMatch = get(gfxMediaSelect, 'value')

local gfxDate = 'GFXSCENES.Control.Date ' .. selectedMatch
local gfxMonth = 'GFXSCENES.Control.Month ' .. selectedMatch
local gfxText = 'GFXSCENES.Control.Match ' .. selectedMatch .. ' Date'

-------------------------------------------------------------------------------------------
-- Arrays

local months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'}

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

call(gfxMonth, 'decrease')

date = get(gfxDate, 'value')
month = get(gfxMonth, 'value')

if month < 1 then
    month = 12
    set(gfxMonth, 'value', 12)
end

if date == 1 or date == 21 or date == 31 then
    set(gfxText, 'text', months[month] .. ' ' .. date .. 'st')
elseif date == 2 or date == 22 then
    set(gfxText, 'text', months[month] .. ' ' .. date .. 'nd')
elseif date == 3 or date == 23 then
    set(gfxText, 'text', months[month] .. ' ' .. date .. 'rd')
else
    set(gfxText, 'text', months[month] .. ' ' .. date .. 'th')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
