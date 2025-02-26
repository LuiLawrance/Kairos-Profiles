-- Functionality Variables

local clip = 'MEDIA/clips/Common/Flag.mp4'

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'
local intermission = 'GFXSCENES.Valorant.Intermission'

local snapshotMedia = 'SCENES.Valorant Game.LED Wall.Snapshots.Media'

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
--local channelRGB = {'255,0,0', '255,85,0', '255,255,0', '0,0,255', '85,0,127', '255,0,255'}

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

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function mediaLEDWall()
    callSnapshot(snapshotMedia)
    set('SCENES.Valorant Game.LED Wall.Layers.Map Image', 'sourceB', 'SCENES.Common.Media')
    wait_milliseconds(100)
    call('SCENES.Valorant Game.LED Wall.Transitions.BgdMix', 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

set(intermission, 'value', 0)
set('CP2', 'clip', clip)
call('CP2', 'play')

mediaLEDWall()

muteAllExcept(27, 5)
wait_milliseconds(10)
call('AP1', 'play')

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', 'SCENES.Valorant Game.Draft')

set('SCENES.Main.Layers.Background', 'sourceA', 'SCENES.Common.Media')
call('SCENES.Common.Media.Snapshots.Hide All', 'recall')
call('SCENES.Common.Media.Snapshots.Starting', 'recall')

wait_seconds(3)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Common.Media')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
