-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local selection = get(gfxMediaSelect, 'value')

local snapshotShow = 'THIS_SCENE.Snapshots.Hide '

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function show()
    callSnapshot(snapshotShow .. selection)
end

-------------------------------------------------------------------------------------------
-- Main Script

show()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
