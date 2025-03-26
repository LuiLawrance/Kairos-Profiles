-- Functionality Variables

local gfxRetracted = 'GFXSCENES.Control.Retracted'

local snapshotHide = 'THIS_SCENE.Snapshots.Hide'
local snapshotNews = 'THIS_SCENE.Snapshots.News'

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

    wait_milliseconds(500)
    callSnapshot(snapshotNews)
end

-------------------------------------------------------------------------------------------
-- Main Script

menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
