-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local macro = get(gfxMediaSelect, 'value')

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function changeLogo()
    game = get('GFXSCENES.Control.Game ' .. macro, 'value')

    if game == 1 then
        set('THIS_SCENE.Layers.Match ' .. macro .. '.Game', 'sourceA', 'FXINPUTS.League Config.Game Logo')
        call('GFXSCENES.Control.Game ' .. macro, 'increase')
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(0,255,0)')
    elseif game == 2 then
        set('THIS_SCENE.Layers.Match ' .. macro .. '.Game', 'sourceA', 'FXINPUTS.Overwatch Config.Game Logo')
        call('GFXSCENES.Control.Game ' .. macro, 'increase')
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(255,255,0)')
    elseif game == 3 then
        set('THIS_SCENE.Layers.Match ' .. macro .. '.Game', 'sourceA', 'FXINPUTS.Rocket League Config.Game Logo')
        call('GFXSCENES.Control.Game ' .. macro, 'increase')
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(0,0,255)')
    elseif game == 4 then
        set('THIS_SCENE.Layers.Match ' .. macro .. '.Game', 'sourceA', 'FXINPUTS.Valorant Config.Game Logo')
        call('GFXSCENES.Control.Game ' .. macro, 'increase')
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(255,0,0)')
    elseif game > 4 then
        set('THIS_SCENE.Layers.Match ' .. macro .. '.Game', 'sourceA', 'FXINPUTS.League Config.Game Logo')
        call('GFXSCENES.Control.Game ' .. macro, 'increase')
        set('THIS_SCENE.Macros.Game', 'color', 'rgb(0,255,0)')
        set('GFXSCENES.Control.Game ' .. macro, 'value', 2)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

changeLogo()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
