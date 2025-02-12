mode = get('GFXSCENES.Control.Game', 'value')

if mode == 1 then 
    set('RR8', 'clip', '1000057789')
    call('RR8', 'begin')
    call('RR8', 'play')
    wait_milliseconds(200)
    call('SCENES.Main.Transitions.BgdMix', 'transition_auto')
end
