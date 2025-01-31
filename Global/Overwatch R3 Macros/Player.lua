mode = get('GFXSCENES.Control.PlayerMV', 'value')

if mode == 0 then 
    set('MACROS.Overwatch R3 Macros.Player', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 2)
    call('MVPRESETS.Player 1', 'recall', '5060')
    call('MVPRESETS.Player 2', 'recall', '5061')
elseif mode == 1 then 
    call('MACROS.Overwatch R4 Macros.MV', 'play')
elseif mode == 2 then
    set('MACROS.Overwatch R3 Macros.Player', 'color', 'rgb(0,255,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 0)
    call('MVPRESETS.Game 1', 'recall', '5060')
    call('MVPRESETS.Game 2', 'recall', '5061')
end
