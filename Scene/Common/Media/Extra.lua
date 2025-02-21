-- Functionality Variables

local game = get('GFXSCENES.Control.Game', 'value')

local sceneMedia = 'SCENES.Common.Media'
local sceneExtraLeague = 'SCENES.League Config.Media Extra'
local sceneExtraValorant = 'SCENES.Valorant Config.Media Extra'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function swap()
    if game == 1 then
        set('SCENES.Main.Layers.Background', 'sourceB', sceneExtraLeague)
    elseif game == 3 then
        set('SCENES.Main.Layers.Background', 'sourceB', sceneExtraValorant)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

swap()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
