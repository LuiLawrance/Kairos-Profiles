-- Functionality Variables

local clip = 'MEDIA/clips/Common/Flag.mp4'

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

set('CP2', 'clip', clip)
call('CP2', 'play')

muteAll()
wait_milliseconds(10)
call('AP1', 'play')
call('MACROS.Main R2 Macros.5&#41; AP1', 'play')

set('SCENES.League Game.Canvas.Layers.Right', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Second Right', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Middle', 'sourceB', 'SCENES.Common.Media')
set('SCENES.League Game.Canvas.Layers.Second Left', 'sourceB', 'CP2')
set('SCENES.League Game.Canvas.Layers.Left', 'sourceB', 'CP2')
call('SCENES.League Game.Canvas.Transitions.BgdMix', 'transition_auto')
call('SCENES.Common.Media.Macros.Flag', 'play')

set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Media')
call('SCENES.Common.Media.Macros.Ending', 'play')
call('MACROS.League Misc R1 Macros.Stinger', 'play')

call('SCENES.League Game.LED Wall.Snapshots.Hide All', 'recall')
call('SCENES.League Game.Canvas.Snapshots.Hide All', 'recall')
call('SCENES.League Game.LED Wall.Snapshots.Hide Score', 'recall')

wait_seconds(3)
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Media')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
