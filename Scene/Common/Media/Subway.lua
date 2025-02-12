-- Functionality Variables



-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set('CP1', 'clip', 'MEDIA/clips/OLD/Subway Surfers.mp4')
call('CP1', 'play')
set('CP1', 'repeat', '1')
set('SCENES.Common.Poster.Layers.Background', 'sourceB', 'CP1')
call('SCENES.Common.Poster.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
