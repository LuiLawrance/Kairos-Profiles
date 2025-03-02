-- Functionality Variables

local gfxRetracted = 'GFXSCENES.Control.Retracted'

local snapshotHide = 'THIS_SCENE.Snapshots.Hide'
local snapshotMenu = 'THIS_SCENE.Snapshots.Menu'
local snapshotMatchup = 'THIS_SCENE.Snapshots.Matchup'
local snapshotSchedule = 'THIS_SCENE.Snapshots.Schedule 1'

local snapshotFullMenu = 'SCENES.Common.Media.Snapshots.Show Full Menu'

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

    callSnapshot(snapshotFullMenu)
    callSnapshot(snapshotMenu)
    wait_milliseconds(500)
    callSnapshot(snapshotSchedule)
end

-------------------------------------------------------------------------------------------
-- Main Script

menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
