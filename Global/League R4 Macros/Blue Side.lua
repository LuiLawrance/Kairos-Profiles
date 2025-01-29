blue = get('GFXSCENES.League.Blue Side', 'value')

if blue == 0 then
    set('MACROS.League R4 Macros.Red Side', 'name', 'Blue Side')
    set('MACROS.League R4 Macros.Blue Side', 'color', 'rgb(0,0,255)')
    set('GFXSCENES.League.Blue Side', 'value', 1)
else
    set('MACROS.League R4 Macros.Blue Side', 'name', 'Red Side')
    set('MACROS.League R4 Macros.Red Side', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.League.Blue Side', 'value', 0)
end

-- This was coded by Lawrance Zhenyu Lui
