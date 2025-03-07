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
    logo = get('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value')

    if logo <= #logos then
        set('THIS_SCENE.Layers.Match ' .. match .. '.Team ' .. team, 'sourceA', 'MEDIA/stills/Common/Universities/' .. logos[logo] .. '&#46;rr')
        call('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'increase')
    else
        set('THIS_SCENE.Layers.Match ' .. match .. '.Team ' .. team, 'sourceA', 'MEDIA/stills/Common/Universities/' .. logos[1] .. '&#46;rr')
        set('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value', 2)
    end
end

function changeLogo()
    call('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'increase')
    local logo = get('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value')

    if logo > #logos then
        set('GFXSCENES.Control.Media T' .. team .. ' ' .. match, 'value', 1)
        set('THIS_SCENE.Layers.Match ' .. match .. '.Team ' .. team, 'sourceA', 'MEDIA/stills/Common/Universities/' .. logos[1] .. '&#46;rr')
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
