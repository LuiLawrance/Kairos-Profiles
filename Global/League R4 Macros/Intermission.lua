-- Functionality Variables

local clip = 'MEDIA/clips/Common/Flag League of Legends.mp4'

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'

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
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
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

set('CP2', 'clip', clip)
call('CP2', 'play')

muteAllExcept(27, 5)
wait_milliseconds(10)
call('AP1', 'play')

set('SCENES.League Game.Canvas.Layers.Right', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Second Right', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Middle', 'sourceB', 'SCENES.Common.Media')
set('SCENES.League Game.Canvas.Layers.Second Left', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Left', 'sourceB', 'CP2')
call('SCENES.League Game.Canvas.Transitions.BgdMix', 'transition_auto')
call('SCENES.Common.Media.Macros.Flag', 'play')

set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Common.Media')
call('SCENES.Common.Media.Macros.Intermission', 'play')
call('SCENES.League Game.LED Wall.Snapshots.Hide All', 'recall')
call('SCENES.League Game.Canvas.Snapshots.Hide All', 'recall')
call('SCENES.League Game.LED Wall.Snapshots.Hide Score', 'recall')

call('MACROS.League Misc R1 Macros.Stinger', 'play')

wait_seconds(3)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Common.Media')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
