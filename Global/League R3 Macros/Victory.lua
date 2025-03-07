-- Functionality Variables

local setMedia = get('GFXSCENES.Control.Selected Match', 'value') 

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()

-------------------------------------------------------------------------------------------
-- Functions
function muteAll()
    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end

        wait_milliseconds(10)
    end
end

function muteAllExcept(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        else
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

function unmute(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

muteAllExcept(30, 1)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
call('SCENES.Player POVs.Casters.Macros.Retract', 'play')
wait_milliseconds(500)
unmute(27, 5)

call('GFXSCENES.League.USC', 'increase')
call('MACROS.League Misc R1 Macros.Victory', 'play')

call('SCENES.Common.Media.Macros.Select ' .. setMedia, 'play')

wait_milliseconds(500)

call('SCENES.Common.Media.Macros.Score 1', 'play')
call('SCENES.Common.Media.Macros.Ongoing', 'play')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
