-- Functionality Variables

local macro = 'Ascent'
local sceneMap = 'SCENES.Player POVs.Casters.Layers.Valorant.Map '
local stillMap = 'MEDIA/stills/Valorant/Draft Maps/Ascent.rr'

local gfxMapList = 'GFXSCENES.Valorant.Maps'
local gfxMatchSelect = 'GFXSCENES.Valorant.Match Select'
local gfxSelectedMap = 'GFXSCENES.Valorant.Map ' .. get(gfxMatchSelect, 'value')

local mapNumber = 0

-------------------------------------------------------------------------------------------
-- Arrays

local mapList = load("return " .. get(gfxMapList, 'text'))()

-------------------------------------------------------------------------------------------
-- Functions

function setColorMap()
    for i = 1, #mapList do
        if i == mapNumber then
            set('THIS_SCENE.Macros.' .. mapList[i], 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.' .. mapList[i], 'color', 'rgb(0,255,0)')
        end

        wait_milliseconds(20)
    end
end

function setNumber()
    for i = 1, #mapList do
        if mapList[i] == macro then
            mapNumber = i
        end

        wait_milliseconds(20)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

setNumber()
setColorMap()

set(gfxSelectedMap, 'value', mapNumber)
set(sceneMap .. get(gfxMatchSelect, 'value'), 'sourceA', stillMap)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
