-- Macro Definition:

local intBestOf = 5
local strBestOf = 'BO5'

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local select = get(gfxMediaSelect, 'value')

local gfxBO = 'GFXSCENES.Control.Match ' .. select .. ' Match'
local gfxMatchBO = 'GFXSCENES.Control.BO ' .. select

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

set(gfxBO, 'text', strBestOf)
set(gfxMatchBO, 'value', intBestOf)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
