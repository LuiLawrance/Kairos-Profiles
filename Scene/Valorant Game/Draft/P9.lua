-- Macro Definition:

local macro = 9

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxPlayerSelect = 'GFXSCENES.Valorant.P Select'
local gfxAgentList = 'GFXSCENES.Valorant.Agents'
local gfxSelectedPlayer = 'GFXSCENES.Valorant.P' .. macro

-------------------------------------------------------------------------------------------
-- Arrays

local agentList = load("return " .. get(gfxAgentList, 'text'))()

-------------------------------------------------------------------------------------------
-- Functions

function setColorAgents()
    playerSelected = get(gfxSelectedPlayer, 'value')

    for i = 1, #agentList do
        if i == playerSelected then
            set('THIS_SCENE.Macros.' .. agentList[i], 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.' .. agentList[i], 'color', 'rgb(0,255,0)')
        end

        wait_milliseconds(20)
    end
end

function setColorPlayer()
    for i = 1, 10 do
        if i == macro then
            set('THIS_SCENE.Macros.P' .. macro, 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.P' .. i, 'color', 'rgb(255,255,255)')
        end

        wait_milliseconds(20)
    end
end

function setSelector(agent)
    set(gfxPlayerSelect, 'value', agent)
end

-------------------------------------------------------------------------------------------
-- Main Script

setSelector(macro)
setColorPlayer()
setColorAgents()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
