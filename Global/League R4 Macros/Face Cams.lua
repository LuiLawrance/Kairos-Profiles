-- Functionality Variables

local faceCam = get('GFXSCENES.Control.Face Cams', 'value')

-------------------------------------------------------------------------------------------
-- Functions

function faceCams()
    if faceCam == 1 then
        call('SCENES.Player POVs.Player 1.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 2.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 3.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 4.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 5.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 6.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 7.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 8.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 9.Snapshots.League', 'recall')
        call('SCENES.Player POVs.Player 10.Snapshots.League', 'recall')
    else
        call('SCENES.Player POVs.Player 1.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 2.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 3.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 4.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 5.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 6.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 7.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 8.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 9.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 10.Snapshots.Off', 'recall')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

if faceCam == 0 then
    set('MACROS.League R4 Macros.Face Cams', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.Control.Face Cams', 'value', 1)
else
    set('MACROS.League R4 Macros.Face Cams', 'color', 'rgb(0,255,0)')
    set('GFXSCENES.Control.Face Cams', 'value', 0)
end

faceCams()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
