-- Functionality Variables

local game = get('GFXSCENES.Control.Game', 'value')

local sceneMedia = 'SCENES.Common.Media'
local sceneExtraLeague = 'SCENES.League Config.Media Extra'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function swap()
    set('SCENES.Main.Layers.Background', 'sourceB', sceneMedia)
end

-------------------------------------------------------------------------------------------
-- Main Script

swap()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
