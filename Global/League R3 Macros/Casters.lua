-------------------------------------------------------------------------------------------
-- Functionality Variables

local number = get('GFXSCENES.Control.Casters', 'value')

-------------------------------------------------------------------------------------------
-- Functions
function muteAll()
    for i = 1, 6 do
        if get('GFXSCENES.Control.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end
    end
end

function cameraMove()
    selected = get('SCENES.Player POVs.Casters.Layers.Background', 'sourceA')

    if selected == 61900 then -- CAM 1
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM1')

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')

        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call('MACROS.League Misc R1 Macros.Stinger', 'play')

        wait_milliseconds(3250)
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '3')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '3')

        wait_milliseconds(1250)
        call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')
    elseif selected == 61902 then -- CAM 3
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceA', 'STREAM2')
        set('SCENES.Player POVs.Casters.Layers.Background', 'sourceB', 'STREAM3')

        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')

        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call('MACROS.League Misc R1 Macros.Stinger', 'play')

        wait_milliseconds(3250)
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '3')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '3')

        wait_milliseconds(1250)
        call('SCENES.Player POVs.Casters.Transitions.BgdMix', 'transition_auto')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
    else
        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
        call('MACROS.League Misc R1 Macros.Stinger', 'play')
        call('IN_STREAM1.PtzTrigger', 'recall_preset', '24')
        call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')
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

-------------------------------------------------------------------------------------------
-- Main Script

set('RR4', 'clip', 'MEDIA/ramrec/Common/Sign Extended.rr')

call('RR3', 'begin')
call('RR4', 'begin')
set('RR3', 'repeat', '0')
set('RR4', 'repeat', '0')
call('SCENES.Player POVs.Casters.Snapshots.League Caster 1', 'recall')

muteAll()
wait_milliseconds(10)
call('MACROS.Main R2 Macros.1&#41; Casters', 'play')
call('MACROS.Main R2 Macros.5&#41; AP1', 'play')

cameraMove()
sign(number)

wait_seconds(3)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
