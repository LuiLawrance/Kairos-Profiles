set('SCENES.Common.Poster.Layers.Background', 'sourceB', 'STREAM2')
call('IN_STREAM2.PtzTrigger', 'recall_preset', '24')
wait_milliseconds(2000)
call('SCENES.Common.Poster.Transitions.BgdMix', 'transition_auto')
