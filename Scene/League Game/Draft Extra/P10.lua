-- Arrays



-------------------------------------------------------------------------------------------
-- Functionality Variables

local macro = 10
local selected = get('GFXSCENES.League.Selected', 'value')
local swap = get('GFXSCENES.League.Swap', 'value')

-------------------------------------------------------------------------------------------
-- Functions

local function resetColor()
    set('THIS_SCENE.Macros.P1', 'color', 'rgb(0,0,255)')
    set('THIS_SCENE.Macros.P2', 'color', 'rgb(0,0,255)')
    set('THIS_SCENE.Macros.P3', 'color', 'rgb(0,0,255)')
    set('THIS_SCENE.Macros.P4', 'color', 'rgb(0,0,255)')
    set('THIS_SCENE.Macros.P5', 'color', 'rgb(0,0,255)')
    set('THIS_SCENE.Macros.P6', 'color', 'rgb(255,0,0)')
    set('THIS_SCENE.Macros.P7', 'color', 'rgb(255,0,0')
    set('THIS_SCENE.Macros.P8', 'color', 'rgb(255,0,0')
    set('THIS_SCENE.Macros.P9', 'color', 'rgb(255,0,0')
    set('THIS_SCENE.Macros.P10', 'color', 'rgb(255,0,0')
end

-- This code was written by Lawrawnce Zhenyu Lui

-------------------------------------------------------------------------------------------
-- Main Script

if selected == 0 and swap ~= macro then 
    set('GFXSCENES.League.Selected', 'value', 1)
    set('GFXSCENES.League.Swap', 'value', macro)
    set('THIS_SCENE.Macros.P' .. macro, 'color', 'rgb(0,255,0')
elseif selected == 1 and swap ~= macro then
    this = get('SCENES.League Game.Draft.Layers.Draft.P' .. macro, 'sourceA')
    other = get('SCENES.League Game.Draft.Layers.Draft.P' .. swap, 'sourceA')

    set('SCENES.League Game.Canvas.Layers.Players.P' .. macro, 'sourceB', other)
    set('SCENES.League Game.Canvas.Layers.Players.P' .. swap, 'sourceB', this)
    set('SCENES.League Game.Draft.Layers.Draft.P' .. macro, 'sourceB', other)
    set('SCENES.League Game.Draft.Layers.Draft.P' .. swap, 'sourceB', this)
    set('SCENES.League Game.LED Wall.Layers.Draft.P' .. macro, 'sourceB', other)
    set('SCENES.League Game.LED Wall.Layers.Draft.P' .. swap, 'sourceB', this)

    call('SCENES.League Game.Canvas.Transitions.P' .. macro, 'transition_auto')
    call('SCENES.League Game.Canvas.Transitions.P' .. swap, 'transition_auto')
    call('SCENES.League Game.Draft.Transitions.P' .. macro, 'transition_auto')
    call('SCENES.League Game.Draft.Transitions.P' .. swap, 'transition_auto')
    call('SCENES.League Game.LED Wall.Transitions.P' .. macro, 'transition_auto')
    call('SCENES.League Game.LED Wall.Transitions.P' .. swap, 'transition_auto')

    call('GFXSCENES.League.Selected', 'reset')
    call('GFXSCENES.League.Swap', 'reset')
    resetColor()
else
    call('GFXSCENES.League.Selected', 'reset')
    call('GFXSCENES.League.Swap', 'reset')
    resetColor()
end
