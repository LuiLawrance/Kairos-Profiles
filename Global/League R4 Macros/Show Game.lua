-- Functionality Variables

mode = get('GFXSCENES.League.Replay', 'value')
macroLocation = 'MACROS.League R4 Macros'
scene = 'SCENES.League Game.Replay'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if mode == 1 then 
    set('GFXSCENES.League.Replay', 'value', 0)
    set(macroLocation .. '.Show Game', 'color', 'rgb(255,0,0)')
    call(scene .. '.Snapshots.Hide Game', 'recall')
else
    set('GFXSCENES.League.Replay', 'value', 1)
    set(macroLocation .. '.Show Game', 'color', 'rgb(0,255,0)')
    call(scene .. '.Snapshots.Show Game', 'recall')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
