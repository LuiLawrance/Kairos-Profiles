-- Macro Definition:

local macro = 'Fade'

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxAgentList = 'GFXSCENES.Valorant.Agents'
local gfxClassList = 'GFXSCENES.Valorant.Classes'
local gfxPlayerSelect = 'GFXSCENES.Valorant.P Select'

local layerPlayersATKLED = 'SCENES.Valorant Game.LED Wall.Layers.ATK.P'
local layerPlayersDEFLED = 'SCENES.Valorant Game.LED Wall.Layers.DEF.P'
local layerSelector = 'THIS_SCENE.Layers.Menu.S'

local stillsAgent = 'MEDIA/stills/Valorant/Agents/' .. macro .. '.rr'
local stillsAgentDraft = 'MEDIA/stills/Valorant/Draft Agents/' .. macro .. '.rr'

local selectedPlayer = get(gfxPlayerSelect, 'value')

local fxClass = 'FXINPUTS.Valorant Config.Class '

local gfxAgentSelected = 'GFXSCENES.Valorant.S' .. selectedPlayer
local gfxSelectedAgent = 'GFXSCENES.Valorant.P' .. selectedPlayer

local layerClass = 'THIS_SCENE.Layers.Class.C' .. selectedPlayer
local layerPlayer = 'THIS_SCENE.Layers.Menu.P' .. selectedPlayer

local transitionFade = 'THIS_SCENE.Transitions.P' .. selectedPlayer

local agentNumber = 0

-------------------------------------------------------------------------------------------
-- Arrays

local agentList = load("return " .. get(gfxAgentList, 'text'))()
local classList = load("return " .. get(gfxClassList, 'text'))()

-------------------------------------------------------------------------------------------
-- Functions

function setColorAgents()
    agentSelected = get(gfxSelectedAgent, 'value')

    for i = 1, #agentList do
        if i == agentSelected then
            set('THIS_SCENE.Macros.' .. agentList[i], 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.' .. agentList[i], 'color', 'rgb(0,255,0)')
        end

        wait_milliseconds(20)
    end
end

function selectorOff()
end

function setNumber()
    for i = 1, #agentList do
        if agentList[i] == macro then
            agentNumber = i
        end

        wait_milliseconds(20)
    end

    if get(gfxSelectedAgent, 'value') == agentNumber then
        set(gfxSelectedAgent, 'value', agentNumber)
        set(layerSelector .. selectedPlayer, 'state', 'Off')
        set(gfxAgentSelected, 'value', 1)
    else
        set(gfxSelectedAgent, 'value', agentNumber)
    end
end

function callTransition(transition)
    call(transition, 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

if get(gfxAgentSelected, 'value') == 0 then
    setNumber()
    setColorAgents()

    if selectedPlayer < 6 then
        set(layerPlayersATKLED .. selectedPlayer, 'sourceA', stillsAgent)
    else
        local adjust = selectedPlayer - 5
        set(layerPlayersDEFLED .. adjust, 'sourceA', stillsAgent)
    end

    set(layerClass, 'sourceA', fxClass .. classList[agentNumber])
    set(layerClass, 'state', 'On')
    set(layerPlayer, 'sourceB', stillsAgentDraft)
    callTransition(transitionFade)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
