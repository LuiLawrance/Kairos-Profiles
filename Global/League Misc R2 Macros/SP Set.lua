-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxTransition = 'GFXSCENES.Control.Transition'
local gfxTransitionClips = 'GFXSCENES.Control.transitionClips'

local rr = 'RR8'
local rrLocation = 'MEDIA.ramrec.Common.Transitions.'
local rrStinger = 'MEDIA/ramrec/Common/Transitions/Stinger.rr'

-------------------------------------------------------------------------------------------
-- Arrays

local transitionClips = load("return " .. get(gfxTransitionClips, 'text'))()

-------------------------------------------------------------------------------------------
-- Functions

function callMacro(macro)
    call(macro, 'play')
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function callTransition(transition)
    call(transition, 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

local selectedClip = math.random(#transitionClips)
set(rr, 'clip', rrStinger)

if selectedClip == get(gfxTransition, 'value') then
else
    set(gfxTransition, 'value', selectedClip)

    for i = 1, #transitionClips do
        if i == selectedClip then
            set(rrLocation .. transitionClips[i] .. '&#46;rr', 'status', '1')
        else
            set(rrLocation .. transitionClips[i] .. '&#46;rr', 'status', '0')
        end
    end
end

--set('MEDIA.ramrec.Common.Transitions.Disney Andrew&#46;rr', 'status', '0')
--set('MEDIA.ramrec.Common.Transitions.ASMR&#46;rr', 'status', '0')
--set('MEDIA.ramrec.Common.Transitions.Logo Chase&#46;rr', 'status', '1')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
