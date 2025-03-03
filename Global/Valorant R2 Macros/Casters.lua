-- Functionality Variables

scene = 'SCENES.Common.Poster'
casters = 'SCENES.Player POVs.Casters'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set(scene .. '.Layers.Background', 'sourceB', casters)
call(scene .. '.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
