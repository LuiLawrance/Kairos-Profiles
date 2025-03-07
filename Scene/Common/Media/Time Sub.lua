-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selectedMatch = get(gfxMediaSelect, 'value')

local gfxTime = 'GFXSCENES.Control.Time ' .. selectedMatch
local gfxText = 'GFXSCENES.Control.Match ' .. selectedMatch .. ' Date'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

local function formatTime(value)
    -- Ensure the value is a 4-digit number for easier processing
    local timeString = string.format("%04d", value)
    -- Extract hours and minutes
    local hours = tonumber(timeString:sub(1, 2))
    local minutes = tonumber(timeString:sub(3, 4))

    -- Determine if it's AM or PM
    local period = "am"
    if hours >= 12 then
        period = "pm"
        if hours > 12 then
            hours = hours - 12
        end
    elseif hours == 0 then
        hours = 12 -- Midnight is 12:00am
    end

    -- Construct the formatted time string
    local formattedTime = string.format("%d:%02d%s", hours, minutes, period)
    return formattedTime
end

local function subtractMinutesFromTime(value, minutesToSubtract)
    -- Ensure the value is a 4-digit number for easier processing
    local timeString = string.format("%04d", value)
    -- Extract hours and minutes
    local hours = tonumber(timeString:sub(1, 2))
    local minutes = tonumber(timeString:sub(3, 4))

    -- Subtract minutes and handle underflow
    minutes = minutes - minutesToSubtract
    if minutes < 0 then
        hours = hours - math.ceil(math.abs(minutes) / 60)
        minutes = (minutes % 60 + 60) % 60 -- Adjust to positive minutes within the hour
    end

    -- Wrap around the hours if it goes below 0
    if hours < 0 then
        hours = (hours + 24) % 24
    end

    -- Return the updated time as an integer
    return hours * 100 + minutes
end

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

local timeValue = get(gfxTime, 'value') -- Retrieve the current time
local updatedTime = subtractMinutesFromTime(timeValue, 15) -- Subtract 15 minutes
set(gfxTime, 'value', updatedTime) -- Update the stored value

set(gfxText, 'text', formatTime(updatedTime))

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
