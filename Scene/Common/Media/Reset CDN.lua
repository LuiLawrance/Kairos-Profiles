-- Functionality Variables

local snapshotHideCDN = 'THIS_SCENE.Snapshots.Hide CDN'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function snapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

snapshot(snapshotHideCDN)
wait_milliseconds(1000)
call('GFXSCENES.Control.Countdown', 'reset')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
