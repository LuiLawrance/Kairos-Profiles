-- Functionality Variables

local clip = 'MEDIA/clips/Common/Valorant/Cant Slow Me Down.mp4'
local clipPlayer = 'CP1'

local macroStartCDN = 'SCENES.Common.Media.Macros.Start CDN'

local sceneMediaLayer = 'SCENES.Common.Media'
local snapshotMediaMenuShow = sceneMediaLayer .. '.Snapshots.Show Menu'
local snapshotMediaHide = sceneMediaLayer .. '.Snapshots.Hide All'
local snapshotMediaStartCDN = sceneMediaLayer .. '.Snapshots.Start CDN'

local transitionBlack = 'SCENES.Common.Media.Transitions.Black'
local transitionSnake = 'SCENES.Common.Media.Transitions.Snake'

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

set(clipPlayer, 'clip', '0')
set(clipPlayer, 'playlist', '')

set(clipPlayer, 'clip', clip)
set(sceneMediaLayer .. '.Layers.BGD', 'sourceB', clipPlayer)

call(clipPlayer, 'play')

wait_milliseconds(2000)

transition(transitionBlack)
snapshot(snapshotMediaHide)
muteAllExcept(29, 4)

wait_milliseconds(11250)

snapshot(snapshotMediaMenuShow)
wait_milliseconds(1000)
macro(macroStartCDN)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
