mode = get('GFXSCENES.Control.PlayerMV', 'value')

if mode == 0 then 
    set('MACROS.Overwatch R4 Macros.MV', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 1)
    call('MVPRESETS.Default 1', 'recall', '5060')
    call('MVPRESETS.Default 2', 'recall', '5061')
elseif mode == 1 then 
    set('MACROS.Overwatch R4 Macros.MV', 'color', 'rgb(0,255,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 0)
    call('MVPRESETS.Game 1', 'recall', '5060')
    call('MVPRESETS.Game 2', 'recall', '5061')
elseif mode == 2 then
    call('MACROS.Overwatch R3 Macros.Player', 'play')
end
