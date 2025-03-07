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

-- Function to add 15 minutes to the stored time value
local function addMinutesToTime(value, minutesToAdd)
    -- Ensure the value is a 4-digit number for easier processing
    local timeString = string.format("%04d", value)
    -- Extract hours and minutes
    local hours = tonumber(timeString:sub(1, 2))
    local minutes = tonumber(timeString:sub(3, 4))

    -- Add minutes and handle overflow
    minutes = minutes + minutesToAdd
    if minutes >= 60 then
        hours = hours + math.floor(minutes / 60)
        minutes = minutes % 60
    end

    -- Wrap around the hours if it exceeds 24
    if hours >= 24 then
        hours = hours % 24
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
local updatedTime = addMinutesToTime(timeValue, 15) -- Add 15 minutes
set(gfxTime, 'value', updatedTime) -- Update the stored value

set(gfxText, 'text', formatTime(updatedTime))

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
