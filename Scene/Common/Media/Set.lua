-- Functionality Variables

local game = get('GFXSCENES.Control.Game', 'value')

local homeTeam = 'FXINPUTS.Common.Home Team'
local visitorTeam = 'FXINPUTS.Common.Visitor Team'

local crawlClip = 'MEDIA/ramrec/Common/Crawls/'
local crawlLocation = 'MEDIA.ramrec.Common.Crawls.'
local crawlExtClip = 'MEDIA/ramrec/Common/Crawls Extended/'
local crawlExtLocation = 'MEDIA.ramrec.Common.Crawls Extended.'

local gfxMediaSelect = 'GFXSCENES.Control.Media Select'
local gfxSelectedMatch = 'GFXSCENES.Control.Selected Match'

match = get(gfxMediaSelect, 'value')

-------------------------------------------------------------------------------------------
-- Arrays

local logosCode = get('GFXSCENES.Control.universityLogos', 'text')
local loadFunction, err = load(logosCode)
if loadFunction then
    loadFunction()
end

-------------------------------------------------------------------------------------------
-- Functions

function setLogos(mode)
    if mode == 1 then
        Clip = crawlClip
        Location = crawlLocation
    elseif mode == 2 then
        Clip = crawlClip
        Location = crawlLocation
    elseif mode == 3 then
        Clip = crawlExtClip
        Location = crawlExtLocation
    else
        mode = 0
    end

    if mode > 0 then
        logoT1 = get('GFXSCENES.Control.Media T1 ' .. match, 'value')
        logoT2 = get('GFXSCENES.Control.Media T2 ' .. match, 'value')

        set(Location .. logos[logoT1] .. '&#46;rr', 'status', '1')
        set(Location .. logos[logoT2] .. '&#46;rr', 'status', '1')
        set('RR5', 'clip', Clip .. logos[logoT1] .. '.rr')
        set('RR6', 'clip', Clip .. logos[logoT2] .. '.rr')

        logoT1 = get('THIS_SCENE.Layers.Match ' .. match .. '.Team 1', 'sourceA')
        logoT2 = get('THIS_SCENE.Layers.Match ' .. match .. '.Team 2', 'sourceA')
        set(homeTeam, 'source', logoT1)
        set(visitorTeam, 'source', logoT2)
    end
end

function unloadCrawls()
    call('RR5', 'pause')
    call('RR6', 'pause')

    for i = 1, #logos do 
        set(crawlLocation .. logos[i] .. '&#46;rr', 'status', '0')
        set(crawlExtLocation .. logos[i] .. '&#46;rr', 'status', '0')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

unloadCrawls()

setLogos(game)

set(gfxSelectedMatch, 'value', match)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
