-- Functionality Variables

local camera = 'STREAM1'

local presetRoom = 9

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function setCamera(camera, preset)
    call('IN_' .. camera .. '.PtzTrigger', 'recall_preset', preset)
end

-------------------------------------------------------------------------------------------
-- Main Script

setCamera(camera, presetRoom)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
