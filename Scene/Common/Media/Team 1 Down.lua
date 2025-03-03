-- Macro Definition:

team = 1

-------------------------------------------------------------------------------------------
-- Functionality Variables

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local match = get(gfxMediaSelect, 'value')

-------------------------------------------------------------------------------------------
-- Arrays

local logosCode = get('GFXSCENES.Control.universityLogos', 'text')
local loadFunction, err = load(logosCode)
if loadFunction then
    loadFunction() -- Executes the code and defines the snapshotSelector function
end

-------------------------------------------------------------------------------------------
-- Functions

function changeLogo()
    call('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'decrease')
    local logo = get('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value')

    if logo == 0 then
        set('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value', #logos)
        set('THIS_SCENE.Layers.Match ' .. match .. '.Team ' .. team, 'sourceA', 'MEDIA/stills/Common/Universities/' .. logos[#logos] .. '&#46;rr')
    else
        set('THIS_SCENE.Layers.Match ' .. match .. '.Team ' .. team, 'sourceA', 'MEDIA/stills/Common/Universities/' .. logos[logo] .. '&#46;rr')
    end
end

function callMacro(macro)
    call(macro, 'play')
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

-------------------------------------------------------------------------------------------
-- Main Script

changeLogo()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
