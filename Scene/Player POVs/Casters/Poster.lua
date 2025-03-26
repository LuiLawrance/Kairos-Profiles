-- Functionality Variables

local gfxRetracted = 'GFXSCENES.Control.Retracted'

local snapshotHide = 'THIS_SCENE.Snapshots.Hide'
local snapshotMenu = 'THIS_SCENE.Snapshots.Menu'
local snapshotPoster = 'THIS_SCENE.Snapshots.Poster'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function menu()
    if get(gfxRetracted, 'value') == 1 then
        set(gfxRetracted, 'value', 0)
        callSnapshot(snapshotHide)
        wait_milliseconds(500)
    end

    callSnapshot(snapshotMenu)
    wait_milliseconds(500)
    callSnapshot(snapshotPoster)
end

-------------------------------------------------------------------------------------------
-- Main Script

menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
