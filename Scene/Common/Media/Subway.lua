-- Functionality Variables

local clip = 'MEDIA/clips/Common/Gameplay/Subway Surfers Gameplay.mp4'
local clipPlayer = 'CP1'
local clipPlayerID = 5430

local posterFollow = 'FXINPUTS.Common.Poster Follow'

local scenePoster = 'SCENES.Common.Poster'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function checkForbidden()
    if get(scenePoster .. '.Layers.Background', 'sourceA') == 5430 then
        set(scenePoster .. '.Layers.Background', 'sourceB', posterFollow)
        call(scenePoster .. '.Transitions.BgdMix', 'transition_auto')
        wait_milliseconds(5000)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

checkForbidden()

set(clipPlayer, 'clip', clip)
call(clipPlayer, 'play')
set(clipPlayer, 'repeat', '1')

wait_milliseconds(200)

set(scenePoster .. '.Layers.Background', 'sourceB', clipPlayer)
call(scenePoster .. '.Transitions.BgdMix', 'transition_auto')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
