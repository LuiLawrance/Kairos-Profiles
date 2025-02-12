-- Functionality Variables



-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set('SCENES.League Game.Draft.Layers.Background', 'sourceB', 'STREAM3')
call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')
wait_milliseconds(2000)
call('SCENES.League Game.Draft.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
