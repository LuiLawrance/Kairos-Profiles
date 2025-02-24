-- Functionality Variables

local camera = 'STREAM2'

local presetRoom = 25

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
