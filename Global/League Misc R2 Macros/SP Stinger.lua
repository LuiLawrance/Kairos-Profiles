-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local ap = 'AP3'
local rr = 'RR8'

local apLocation = 'MEDIA/sounds/Common/Transitions/'

local gfxTransition = 'GFXSCENES.Control.Transition'
local gfxTransitionClips = 'GFXSCENES.Control.transitionClips'
local gfxTransitionTime = 'GFXSCENES.Control.transitionTime'

local macroLocationAudio = 'MACROS.Main R2 Macros'

local ramLocation = 'MEDIA/ramrec/Common/Transitions/'

local sceneGFX = 'GFXSCENES.Control'

local transitionMain = 'SCENES.Main.Transitions.BgdMix'

-------------------------------------------------------------------------------------------
-- Arrays

local transitionClips = load("return " .. get(gfxTransitionClips, 'text'))()
local transitionTime = load("return " .. get(gfxTransitionTime, 'text'))()

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()

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

function muteAll()
    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end

        wait_milliseconds(10)
    end
end

function muteAllExcept(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        else
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

function unmute(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

local clip = get(gfxTransition, 'value')
set(rr, 'clip', ramLocation .. transitionClips[clip] .. '.rr')
set(ap, 'clip', apLocation .. transitionClips[clip] .. '.wav')

muteAllExcept(27, 5)
wait_milliseconds(1500)
unmute(29, 1)

call(ap, 'begin')
call(rr, 'begin')

call(ap, 'play')
call(rr, 'play')

wait_milliseconds(500)
callTransition(transitionMain)

wait_seconds(transitionTime[get(gfxTransition, 'value')])
muteAllExcept(27, 5)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
