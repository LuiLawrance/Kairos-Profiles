-- Functionality Variables

local macro = "Volume" -- Set to "Volume" or "Source"
local t = 10  -- Milliseconds to wait

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
local channelRGB = {'255,0,0', '255,85,0', '255,255,0', '0,0,255', '85,0,127', '255,0,255'}

-------------------------------------------------------------------------------------------
-- Functions

function buttonRGB()
    local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')
    local row1 = 'MACROS.Main R1 Macros.'
    local row2 = 'MACROS.Main R2 Macros.'
    if state == 0 then
        for i = 1, 6 do
            local source = 'GFXSCENES.Control.Audio Source ' .. i
            local n = get(source, 'value')
            local rgb = 'rgb(' .. channelRGB[i] .. ')'
            local button1 = row1 .. 'Channel ' .. i
            local button2 = row2 .. i .. ') ' .. sourceNames[n]
            
            local toggleControlValue = get('GFXSCENES.Control.Audio Control ' .. i, 'value')
            
            if toggleControlValue == 0 then
                set(button1, 'color', rgb)
                set(button2, 'color', rgb)
            elseif toggleControlValue == 1 then
                set(button1, 'color', 'rgb(0,255,0)')
                set(button2, 'color', 'rgb(0,255,0)')
            end
            
            wait_milliseconds(t)
        end
    elseif state == 1 or state == 2 then
        for i = 1, 6 do
            local source = 'GFXSCENES.Control.Audio Source ' .. i
            local n = get(source, 'value')
            local rgb = 'rgb(' .. channelRGB[i] .. ')'
            local button1 = row1 .. 'Channel ' .. i
            local button2 = row2 .. i .. ') ' .. sourceNames[n]
            set(button1, 'color', 'rgb(0,255,0)')
            set(button2, 'color', 'rgb(255,0,0)')
            wait_milliseconds(t)
        end
    end
end

function changeRGB()
    local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')
    if state == 0 then
        set('MACROS.Main R1 Macros.Volume', 'color', 'rgb(255,255,255)')
        set('MACROS.Main R2 Macros.Source', 'color', 'rgb(255,255,255)')
        buttonRGB()
    elseif state == 1 then
        set('MACROS.Main R1 Macros.Volume', 'color', 'rgb(0,255,0)')
        buttonRGB()
    elseif state == 2 then
        set('MACROS.Main R2 Macros.Source', 'color', 'rgb(255,0,0)')
        buttonRGB()
    end
end

function getVolume(channel)
    local volume = get('AUDIOMIXER.Channel ' .. channel, 'volume')
    return math.floor(volume * 100 + 0.5)
end

function renameButton()
    local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')
    if state == 0 then
        for i = 1, 6 do
            local buttonID = string.format('MACROS.Main R1 Macros.%d) %d', i, getVolume(i))
            local buttonName = 'Channel ' .. i
            set(buttonID, 'name', buttonName)
            -- print(string.format("ButtonID: %s, New Name: %s", buttonID, buttonName))
        end
    elseif state == 1 then
        for i = 1, 6 do
            local buttonID = 'MACROS.Main R1 Macros.Channel ' .. i
            local buttonName = string.format('%d) %d', i, getVolume(i))
            set(buttonID, 'name', buttonName)
            -- print(string.format("ButtonID: %s, New Name: %s", buttonID, buttonName))
        end
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

local state = get('GFXSCENES.Control.Audio Toggle Control', 'value')
if state == 0 then
    if macro == "Volume" then
        set('GFXSCENES.Control.Audio Toggle Control', 'value', '1')
        changeRGB()
        renameButton()
    elseif macro == "Source" then
        set('GFXSCENES.Control.Audio Toggle Control', 'value', '2')
        changeRGB()
    end
else
    set('GFXSCENES.Control.Audio Toggle Control', 'value', '0')
    renameButton()
    changeRGB()
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
