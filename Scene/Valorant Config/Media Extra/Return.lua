-- Functionality Variables

local sceneMain = 'SCENES.Main'
local sceneMedia = 'SCENES.Common.Media'


-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function swap()
    set(sceneMain .. '.Layers.Background', 'sourceB', sceneMedia)
end

-------------------------------------------------------------------------------------------
-- Main Script

swap()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
