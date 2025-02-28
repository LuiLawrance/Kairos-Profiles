-- Functionality Variables

local gfxRetracted = 'GFXSCENES.Control.Retracted'

local snapshotRetract = 'THIS_SCENE.Snapshots.Retract'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

callSnapshot(snapshotRetract)
set('GFXSCENES.Control.Retracted', 'value', 1)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
