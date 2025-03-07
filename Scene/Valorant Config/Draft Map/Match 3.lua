-- Functionality Variables

local macro = 3

local gfxMapSelect = 'GFXSCENES.Valorant.Match Select'
local gfxMapList = 'GFXSCENES.Valorant.Maps'
local gfxSelectedMap = 'GFXSCENES.Valorant.Map ' .. macro

-------------------------------------------------------------------------------------------
-- Arrays

local mapList = load("return " .. get(gfxMapList, 'text'))()

-------------------------------------------------------------------------------------------
-- Functions

function setColorMap()
    mapSelected = get(gfxSelectedMap, 'value')

    for i = 1, #mapList do
        if i == mapSelected then
            set('THIS_SCENE.Macros.' .. mapList[i], 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.' .. mapList[i], 'color', 'rgb(0,255,0)')
        end
    end
end

function setColorMatch()
    for i = 1, 5 do
        if i == macro then
            set('THIS_SCENE.Macros.Match ' .. macro, 'color', 'rgb(255,0,0)')
        else
            set('THIS_SCENE.Macros.Match ' .. i, 'color', 'rgb(255,255,255)')
        end
    end
end

function setSelector(map)
    set(gfxMapSelect, 'value', map)
end

-------------------------------------------------------------------------------------------
-- Main Script

setSelector(macro)
setColorMatch()
setColorMap()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
