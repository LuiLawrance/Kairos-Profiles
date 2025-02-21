-- Functionality Variables

blue = get('GFXSCENES.League.Blue Side', 'value')
macroLocation = 'MACROS.League R4 Macros'
painterLocation = 'GFXSCENES.League.Blue Side'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if blue == 0 then
    set(macroLocation .. '.Red Side', 'name', 'Blue Side')
    set(macroLocation .. '.Blue Side', 'color', 'rgb(0,0,255)')
    set(painterLocation, 'value', 1)
else
    set(macroLocation .. '.Blue Side', 'name', 'Red Side')
    set(macroLocation .. '.Red Side', 'color', 'rgb(255,0,0)')
    set(painterLocation, 'value', 0)
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
