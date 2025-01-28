set('SCENES.Common.Poster.Layers.Background', 'sourceB', 'STREAM3')
call('IN_STREAM3.PtzTrigger', 'recall_preset', '24')
wait_milliseconds(2000)
call('SCENES.Common.Poster.Transitions.BgdMix', 'transition_auto')
