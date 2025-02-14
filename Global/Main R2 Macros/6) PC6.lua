-- Functionality Variables

local macro = 6 -- Set this to a number between 1 and 6
local macroRow = 2 -- Set this to either 1 or 2

local muteVolume = -40 -- Volume level when muted
local muteSpeed = 20
local game = get('GFXSCENES.Control.Game', 'value') -- Get current game selection
local sceneNames = {"GFXSCENES.Control", "GFXSCENES.League", "GFXSCENES.Overwatch", "GFXSCENES.Valorant"}
local scene = sceneNames[game + 1] -- Select the correct GFXScene based on the game value

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
    elseif state == 2 then
        -- Source Rename
        local buttonID = 'MACROS.Main R2 Macros.' .. channel .. ') ' .. sourceNames[oldValue]
        local buttonName = channel .. ') ' .. sourceNames[newValue]
        set(buttonID, 'name', buttonName)
    end
end

function getVolume(channel)
    return get(scene .. '.Channel ' .. channel, 'value') -- Retrieve stored integer value
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

        for volume = getVolume(macro), muteVolume, -1 do
            volumeSet(macro, volume)
            wait_milliseconds(muteSpeed)
        end

        set('AUDIOMIXER.Channel ' .. macro, 'mute', '1')
    else
        set('GFXSCENES.Control.Audio Control ' .. macro, 'value', '1')
        local storedVolume = getVolume(macro)
        set('AUDIOMIXER.Channel ' .. macro, 'mute', '0')

        for volume = muteVolume, storedVolume, 1 do
            volumeSet(macro, volume)
            wait_milliseconds(muteSpeed)
        end
    end

    toggleRGB()
end

function toggleRGB()
    local source = get('GFXSCENES.Control.Audio Source ' .. macro, 'value')
    local controlValue = get('GFXSCENES.Control.Audio Control ' .. macro, 'value')
    local button1 = 'MACROS.Main R1 Macros.Channel ' .. macro
    local button2 = 'MACROS.Main R2 Macros.' .. macro .. ') ' .. sourceNames[source]

    if controlValue == 1 then
        set(button1, 'color', 'rgb(0,255,0)')
        set(button2, 'color', 'rgb(0,255,0)')
    elseif controlValue == 0 then
        local rgb = 'rgb(' .. channelRGB[macro] .. ')'
        set(button1, 'color', rgb)
        set(button2, 'color', rgb)
    end
end

function volume()
    local controlValue = get('GFXSCENES.Control.Audio Control ' .. macro, 'value')
    local volumeCurrent = getVolume(macro)

    if macroRow == 1 then
        volumeStore(macro, volumeCurrent + 1)
        buttonRename(macro, volumeCurrent, volumeCurrent + 1)

        if controlValue == 1 then
            volumeSet(macro, volumeCurrent + 1)
        end
    elseif macroRow == 2 then
        volumeStore(macro, volumeCurrent - 1)
        buttonRename(macro, volumeCurrent, volumeCurrent - 1)

        if controlValue == 1 then
            volumeSet(macro, volumeCurrent - 1)
        end
    end
end

function volumeSet(channel, volume)
    set('AUDIOMIXER.Channel ' .. channel, 'volume', volume / 100)
end

function volumeStore(channel, volume)
    set(scene .. '.Channel ' .. channel, 'value', volume) -- Update stored volume in the correct GFXScene
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
