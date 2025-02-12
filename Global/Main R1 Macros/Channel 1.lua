-- Functionality Variables

local macro = 1 -- Set this to a number between 1 and 6
local macroRow = 1 -- Set this to either 1 or 2

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
local channelRGB = {'255,0,0', '255,85,0', '255,255,0', '0,0,255', '85,0,127', '255,0,255'}

-------------------------------------------------------------------------------------------
-- Functions

function buttonRename(channel, oldValue, newValue)
    local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')

    if state == 1 then
        -- Volume Rename
        local buttonID = 'MACROS.Main R1 Macros.' .. channel .. ') ' .. oldValue
        local buttonName = channel .. ') ' .. newValue
        set(buttonID, 'name', buttonName)

-- This was coded by Lawrance Zhenyu Lui

    elseif state == 2 then
        -- Source Rename
        local buttonID = 'MACROS.Main R2 Macros.' .. channel .. ') ' .. sourceNames[oldValue]
        local buttonName = channel .. ') ' .. sourceNames[newValue]
        set(buttonID, 'name', buttonName)
    end
end

function getVolume(channel)
    local volume = get('AUDIOMIXER.Channel ' .. channel, 'volume')
    return math.floor(volume * 100 + 0.5)
end

function source()
    local sourceCurrent = get('GFXSCENES.Control.Audio Source ' .. macro, 'value')
    local sourceNew

    if macroRow == 1 then
        sourceNew = sourceCurrent + 1
        call('GFXSCENES.Control.Audio Source ' .. macro, 'increase')

        if sourceNew > #sourceIndex then
            sourceNew = 1
            sourceCurrent = #sourceIndex
            set('GFXSCENES.Control.Audio Source ' .. macro, 'value', '1')
        end
    elseif macroRow == 2 then
        sourceNew = sourceCurrent - 1
        call('GFXSCENES.Control.Audio Source ' .. macro, 'decrease')

        if sourceNew < 1 then
            sourceNew = #sourceIndex
            sourceCurrent = 1
            set('GFXSCENES.Control.Audio Source ' .. macro, 'value', #sourceIndex)
        end
    end

    buttonRename(macro, sourceCurrent, sourceNew)
    sourceSet(macro, sourceNew)
end

function sourceSet(channel, source)
    set('AUDIOMIXER.Channel ' .. channel, 'source', sourceIndex[source])
end

function toggle()
    local controlValue = get('GFXSCENES.Control.Audio Control ' .. macro, 'value')
    if controlValue == 1 then
        set('GFXSCENES.Control.Audio Control ' .. macro, 'value', '0')
        set('AUDIOMIXER.Channel ' .. macro, 'mute', '1')
    else
        set('GFXSCENES.Control.Audio Control ' .. macro, 'value', '1')
        set('AUDIOMIXER.Channel ' .. macro, 'mute', '0')
    end
    toggleRGB()
end

function toggleRGB()
    local source = get('GFXSCENES.Control.Audio Source ' .. macro, 'value')
    local controlValue = get('GFXSCENES.Control.Audio Control ' .. macro, 'value')
    local button1 = 'MACROS.Main R1 Macros.Channel ' .. macro
    local button2 = 'MACROS.Main R2 Macros.' .. macro .. ') ' .. sourceNames[source]
    if controlValue == 1 then
        -- Set RGB to green
        set(button1, 'color', 'rgb(0,255,0)')
        set(button2, 'color', 'rgb(0,255,0)')
    elseif controlValue == 0 then
        -- Set RGB to the color defined in channelRGB[macro]
        local rgb = 'rgb(' .. channelRGB[macro] .. ')'
        set(button1, 'color', rgb)
        set(button2, 'color', rgb)
    end
end

function volume()
    local volumeCurrent = getVolume(macro)
    if macroRow == 1 then
        volumeSet(macro, volumeCurrent + 1)
        buttonRename(macro, volumeCurrent, volumeCurrent + 1)
    elseif macroRow == 2 then
        volumeSet(macro, volumeCurrent - 1)
        buttonRename(macro, volumeCurrent, volumeCurrent - 1)
    end
end

function volumeSet(channel, volume)
    set('AUDIOMIXER.Channel ' .. channel, 'volume', volume / 100)
end

-------------------------------------------------------------------------------------------
-- Main Script

local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')
if state == 0 then
    toggle()
elseif state == 1 then
    volume()
elseif state == 2 then
    source()
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
