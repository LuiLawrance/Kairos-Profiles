-- Macro Definition:

local macro = 3

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'
local gfxGame = 'GFXSCENES.Control.Game ' .. macro

local macroGame = 'THIS_SCENE.Macros.Game'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function setColor()
    for i = 1, 3 do
        if i == macro then
            set('THIS_SCENE.Macros.Select ' .. i, 'color', 'rgb(0,255,0)')
        else
            set('THIS_SCENE.Macros.Select ' .. i, 'color', 'rgb(255,0,0)')
        end

        wait_milliseconds(20)
    end
end

function setColorGame()
    local game = get(gfxGame, 'value')

    if game == 2 then
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(0,255,0)')
    elseif game == 3 then
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(255,255,0)')
    elseif game == 4 then
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(0,0,255)')
    elseif game == 5 then
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(255,0,0)')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

setColor()
setColorGame()
set(gfxMediaSelect, 'value', macro)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
