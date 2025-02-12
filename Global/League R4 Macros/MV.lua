-- Functionality Variables

mode = get('GFXSCENES.Control.PlayerMV', 'value')
macroLocation = 'MACROS.League R4 Macros'
otherMacroLocation = 'MACROS.League R3 Macros'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if mode == 0 then 
    set(macroLocation .. '.MV', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 1)
    call('MVPRESETS.Default 1', 'recall', '5060')
    call('MVPRESETS.Default 2', 'recall', '5061')
elseif mode == 1 then 
    set(macroLocation .. '.MV', 'color', 'rgb(0,255,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 0)
    call('MVPRESETS.Game 1', 'recall', '5060')
    call('MVPRESETS.Game 2', 'recall', '5061')
elseif mode == 2 then
    call(otherMacroLocation .. '.Player', 'play')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
