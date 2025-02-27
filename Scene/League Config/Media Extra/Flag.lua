-- Functionality Variables

local clip = 'MEDIA/clips/Common/Flag.mp4'
local clipLeague = 'MEDIA/clips/Common/Flag League of Legends.mp4'
local clipPlayer = 'CP2'
local intermission = 'GFXSCENES.League.Intermission'

local macroStartCDN = 'SCENES.Common.Media.Macros.Start CDN'

local sceneMediaLayer = 'SCENES.Common.Media'
local snapshotMediaMenuFull = sceneMediaLayer .. '.Snapshots.Show Full Menu'
local snapshotMediaHide = sceneMediaLayer .. '.Snapshots.Hide All'
local snapshotMediaShowCDN = sceneMediaLayer .. '.Snapshots.Show CDN'

local transitionBlack = 'SCENES.Common.Media.Transitions.Black'
local transitionMedia = 'SCENES.Common.Media.Transitions.Media'

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'
local macroStinger = 'MACROS.League Misc R1 Macros'

-------------------------------------------------------------------------------------------
-- Arrays



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

function flag()
    onIntermission = get(intermission, 'value')

    if onIntermission == 1 then
        set(clipPlayer, 'clip', clipLeague)
        set(sceneMediaLayer .. '.Layers.BGD', 'sourceB', clipPlayer)
    else
        set(clipPlayer, 'clip', clip)
        set(sceneMediaLayer .. '.Layers.BGD', 'sourceB', clipPlayer)
    end
end

function macro(macro)
    call(macro, 'play')
end

function snapshot(snapshot)
    call(snapshot, 'recall')
end

function transition(transition)
    call(transition, 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

snapshot(snapshotMediaHide)
muteAll()
set(clipPlayer, 'clip', '0')
set(clipPlayer, 'playlist', '')

flag()

wait_milliseconds(500)
call(clipPlayer, 'play')
transition(transitionMedia)

wait_milliseconds(3000)

unmute(27, 5)
snapshot(snapshotMediaMenuFull)
wait_milliseconds(3000)
macro(macroStartCDN)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
