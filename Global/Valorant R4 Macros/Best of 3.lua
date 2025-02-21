-- Functionality Variables

match = get('GFXSCENES.Valorant.Best of', 'value')
macroLocation = 'MACROS.Valorant R4 Macros'
painterLocation = 'GFXSCENES.Valorant.Best of'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if match == 3 then
    set(macroLocation .. '.Best of 3', 'name', 'Best of 5')
    set(macroLocation .. '.Best of 5', 'color', 'rgb(255,255,0)')
    set(painterLocation, 'value', 5)
else
    set(macroLocation .. '.Best of 5', 'name', 'Best of 3')
    set(macroLocation .. '.Best of 3', 'color', 'rgb(0,255,255)')
    set(painterLocation, 'value', 3)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
