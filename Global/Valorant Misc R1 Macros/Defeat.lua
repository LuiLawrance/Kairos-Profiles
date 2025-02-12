-- Functionality Variables

--local transition = 'MEDIA/ramrec/Common/Transitions/Stinger Flash Vertical.rr'
local transition = 'MEDIA/ramrec/Common/Defeat.rr'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

mode = get('GFXSCENES.Control.Game', 'value')

if mode == 3 then 
    set('RR8', 'clip', transition)
    call('RR8', 'begin')
    call('RR8', 'play')
    wait_milliseconds(200)
    call('SCENES.Main.Transitions.BgdMix', 'transition_auto')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
