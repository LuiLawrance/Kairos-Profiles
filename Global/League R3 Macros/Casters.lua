-- Functionality Variables

local number = get('GFXSCENES.Control.Casters', 'value')
local amntDroneClips = 10

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'
local macroStinger = 'MACROS.League Misc R1 Macros'

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

function cameraMove()
    selected =  get('SCENES.Player POVs.Casters.Layers.Background', 'sourceB')

    if selected == 61900 then -- CAM 1
        --set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        --set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM1')

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')

        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call(macroStinger .. '.Stinger', 'play')

        --wait_milliseconds(3250)
        wait_milliseconds(1500)
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM1')
        wait_milliseconds(1750)

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '3')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '3')

        wait_milliseconds(1250)
        call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')
    elseif selected == 61902 then -- CAM 3
        --set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        --set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM3')

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')

        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call(macroStinger .. '.Stinger', 'play')

        --wait_milliseconds(3250)
        wait_milliseconds(1500)
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM3')
        wait_milliseconds(1750)

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '3')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '3')

        wait_milliseconds(1250)
        call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
    else
        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call(macroStinger .. '.Stinger', 'play')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')

        wait_milliseconds(1250)
        call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')
    end
end

function sign(n)
    selected = get('SCENES.Player POVs.Casters.Layers.Background', 'sourceA')

    if selected ~= 61900 or selected ~= 61902 then
        t = 2000
    else
        t = 0
    end

    if n == 2 then 
        call('SCENES.Player POVs.Casters.Snapshots.League Caster 2', 'recall')
        wait_milliseconds(1250 + t)
        call('SCENES.Player POVs.Casters.Snapshots.League Show 2', 'recall')
    elseif n == 1 then
        call('SCENES.Player POVs.Casters.Snapshots.League Caster 1', 'recall')
        wait_milliseconds(1250 + t)
        call('SCENES.Player POVs.Casters.Snapshots.League Show 1', 'recall')
    end

    call('RR4', 'play')
end

function usc(amount)
    setSource = get('SCENES.Player POVs.Casters.Layers.Background', 'sourceA')
    call('SCENES.Player POVs.Casters.Snapshots.League Caster 2', 'recall')

    set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'CP1')
    call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')

    local selectedClip = math.random(amount)

    set('CP1', 'clip', 'MEDIA/clips/USC Drone Tour/Drone ' .. selectedClip .. '.mp4')
    set('CP1', 'repeat', '0')
    call('CP1', 'begin')

    set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
    call(macroStinger .. '.Stinger', 'play')

    wait_milliseconds(2000)
    call('CP1', 'play')
    wait_milliseconds(5500)

    set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', setSource)
end

-------------------------------------------------------------------------------------------
-- Main Script

muteAllExcept(27, 5)
wait_milliseconds(500)

call('SCENES.Player POVs.Casters.Snapshots.Hide', 'recall')

set('RR4', 'clip', 'MEDIA/ramrec/Common/Sign Extended.rr')

call('RR4', 'begin')
set('RR4', 'repeat', '0')

usc(amntDroneClips)

wait_milliseconds(10)
unmute(30, 1)

cameraMove()
sign(number)

wait_seconds(3)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
