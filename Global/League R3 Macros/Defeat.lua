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

muteAll()
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.Player POVs.Casters')
wait_milliseconds(10)

call('MACROS.Main R2 Macros.1&#41; Casters', 'play')
call('MACROS.Main R2 Macros.5&#41; AP1', 'play')

call('GFXSCENES.League.Visitor', 'increase')
call('MACROS.League Misc R1 Macros.Defeat', 'play')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
