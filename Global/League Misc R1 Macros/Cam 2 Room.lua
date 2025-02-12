-- Functionality Variables



-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set('SCENES.League Game.Draft.Layers.Background', 'sourceB', 'STREAM2')
call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
wait_milliseconds(2000)
call('SCENES.League Game.Draft.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
