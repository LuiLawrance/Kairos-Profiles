-------------------------------------------------------------------------------------------
-- Functions
function muteAll()
    for i = 1, 6 do
        if get('GFXSCENES.Control.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

mode = get('GFXSCENES.League.Replay', 'value')
muteAll()

call('MACROS.Main R2 Macros.1&#41; Casters', 'play')
call('MACROS.Main R2 Macros.2&#41; LOL Game', 'play')

if mode == 0 then 
    set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Game')
    wait_milliseconds(10)

    call('MACROS.League Misc R1 Macros.Stinger', 'play')
else
    call('SCENES.League Game.Replay.Snapshots.Game', 'recall')
    set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Game')
    wait_milliseconds(1000)

    call('SCENES.Main.Transitions.BgdMix', 'transition_auto')
    wait_milliseconds(1000)

    call('MACROS.League R4 Macros.Show Game', 'play')
end
