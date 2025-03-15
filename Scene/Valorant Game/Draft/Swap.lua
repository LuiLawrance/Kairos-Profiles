-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

macroLocation = 'THIS_SCENE.Macros.Swap'

gfxSwap = 'GFXSCENES.Valorant.P Swap'

swap = get(gfxSwap, 'value')

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if swap == 1 then
    set(macroLocation, 'color', 'rgb(255,0,0)')
    set(gfxSwap, 'value', 0)
else
    set(macroLocation, 'color', 'rgb(0,255,0)')
    set(gfxSwap, 'value', 1)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
