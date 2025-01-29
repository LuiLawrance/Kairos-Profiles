mode = get('GFXSCENES.League.Replay', 'value')

if mode == 1 then 
    set('GFXSCENES.League.Replay', 'value', 0)
    set('MACROS.League R4 Macros.Show Game', 'color', 'rgb(255,0,0)')
    call('SCENES.League Game.Replay.Snapshots.Hide Game', 'recall')
else
    set('GFXSCENES.League.Replay', 'value', 1)
    set('MACROS.League R4 Macros.Show Game', 'color', 'rgb(0,255,0)')
    call('SCENES.League Game.Replay.Snapshots.Show Game', 'recall')
end
