-- Functionality Variables

local snapshotShowCDN = 'THIS_SCENE.Snapshots.Show CDN'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function snapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

snapshot(snapshotShowCDN)
call('GFXSCENES.Control.Countdown', 'start')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
