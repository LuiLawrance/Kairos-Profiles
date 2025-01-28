set('SCENES.Common.Poster.Layers.Background', 'sourceB', 'STREAM1')
call('IN_STREAM1.PtzTrigger', 'recall_preset', '24')
wait_milliseconds(2000)
call('SCENES.Common.Poster.Transitions.BgdMix', 'transition_auto')
