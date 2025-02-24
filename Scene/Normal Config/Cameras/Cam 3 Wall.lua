-- Functionality Variables

local camera = 'STREAM3'

local presetRoom = 0

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
