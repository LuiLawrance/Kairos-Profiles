-- Functionality Variables

scene = 'SCENES.Common.Poster'
poster = 'FXINPUTS.Common.Poster Follow'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set(scene .. '.Layers.Background', 'sourceB', poster)
call(scene .. '.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
