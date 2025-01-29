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

set('RR3', 'clip', 'MEDIA/ramrec/Common/Sign.rr')
call('RR3', 'begin')
call('SCENES.League Game.Replay.Snapshots.Hide', 'recall')

if mode == 1 then 
    call('MACROS.League R4 Macros.Show Game', 'play')
end

muteAll()
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Replay')
wait_milliseconds(10)

call('MACROS.Main R2 Macros.1&#41; Casters', 'play')
call('MACROS.Main R2 Macros.3&#41; LOL Rep', 'play')
call('MACROS.League Misc R1 Macros.Replay', 'play')
wait_milliseconds(3500)

call('RR4', 'play')
wait_milliseconds(500)
call('SCENES.League Game.Replay.Snapshots.Show', 'recall')
