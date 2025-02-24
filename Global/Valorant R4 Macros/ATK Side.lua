-- Functionality Variables

ATK = get('GFXSCENES.Valorant.ATK Side', 'value')
macroLocation = 'MACROS.Valorant R4 Macros'
painterLocation = 'GFXSCENES.Valorant.ATK Side'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if ATK == 1 then
    set(macroLocation .. '.ATK Side', 'name', 'DEF Side')
    set(macroLocation .. '.DEF Side', 'color', 'rgb(0,0,255)')
    set(painterLocation, 'value', 0)
else
    set(macroLocation .. '.DEF Side', 'name', 'ATK Side')
    set(macroLocation .. '.ATK Side', 'color', 'rgb(255,0,0)')
    set(painterLocation, 'value', 1)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
