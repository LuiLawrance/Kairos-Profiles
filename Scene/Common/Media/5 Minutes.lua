-- Functionality Variables

local time = 300 -- In seconds

local locationCDN = 'GFXSCENES.Control.Countdown'

local macroResetCDN = 'THIS_SCENE.Macros.Reset CDN'

local snapshotHideCDN = 'THIS_SCENE.Snapshots.Hide CDN'
local snapshotShowCDN = 'THIS_SCENE.Snapshots.Show CDN'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function macro(macro)
    call(macro, 'play')
end

function snapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

macro(macroResetCDN)
wait_milliseconds(500)
set(locationCDN, 'start', time)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
