-- Macro Definition:



-------------------------------------------------------------------------------------------
-- Functionality Variables

local sceneGFX = 'GFXSCENES.Control'

local fxHome = 'FXINPUTS.Common.Home Team'
local fxMapCoord = 'FXINPUTS.Valorant Config.LED Wall.Map Coordinates'
local fxMapDraft = 'FXINPUTS.Valorant Config.Draft.Map'
local fxMapLED = 'FXINPUTS.Valorant Config.LED Wall.Map'
local fxNameLED = 'FXINPUTS.Valorant Config.LED Wall.Map Name'
local fxTickerWhite = 'FXINPUTS.Valorant Config.Ticker White'
local fxVisitor = 'FXINPUTS.Common.Visitor Team'

local gfxATK = 'GFXSCENES.Valorant.ATK Side'
local gfxMap = 'GFXSCENES.Valorant.Map '
local gfxMapList = 'GFXSCENES.Valorant.Maps'
local gfxMatchBO = 'GFXSCENES.Control.BO '
local gfxP = 'GFXSCENES.Valorant.P'
local gfxS = 'GFXSCENES.Valorant.S'
local gfxSelectedMatch = 'GFXSCENES.Control.Selected Match'
local gfxTimer = 'GFXSCENES.Valorant.Draft Timer'
local gfxValorantUSC = 'GFXSCENES.Valorant.USC'
local gfxValorantVisitor = 'GFXSCENES.Valorant.Visitor'

local layerDraftTeam = 'SCENES.Valorant Game.Draft.Layers.Teams.'
local layerDraftTeamLeft = 'SCENES.Valorant Game.Draft.Layers.Teams.Logo Left'
local layerDraftTeamLeftCrawl = 'SCENES.Valorant Game.Draft.Layers.Teams.Crawl Left'
local layerDraftTeamRight = 'SCENES.Valorant Game.Draft.Layers.Teams.Logo Right'
local layerDraftTeamRightCrawl = 'SCENES.Valorant Game.Draft.Layers.Teams.Crawl Right'
local layerGameTeam = 'SCENES.Valorant Game.Game.Layers.Game.'
local layerGameTeamLeft = 'SCENES.Valorant Game.Game.Layers.Game.Left'
local layerGameTeamRight = 'SCENES.Valorant Game.Game.Layers.Game.Right'
local layerMainBGD = 'SCENES.Main.Layers.Background'
local layerLEDBGD = 'SCENES.Valorant Game.LED Wall.Layers.Map Image'
local layerLEDHome = 'SCENES.Valorant Game.LED Wall.Layers.Teams.Home'
local layerLEDTeam = 'SCENES.Valorant Game.LED Wall.Layers.Teams.'
local layerLEDVisitor = 'SCENES.Valorant Game.LED Wall.Layers.Teams.Visitor'

local macroP1 = 'SCENES.Valorant Game.Draft.Macros.P1'
local macroRetract = 'SCENES.Player POVs.Casters.Macros.Retract'

local sceneDraft = 'SCENES.Valorant Game.Draft'

local snapshotCasterHide = 'SCENES.Player POVs.Casters.Snapshots.Hide'
local snapshotLEDDraft = 'SCENES.Valorant Game.LED Wall.Snapshots.Draft'
local snapshotLEDHide = 'SCENES.Valorant Game.LED Wall.Snapshots.Media'
local snapshotLEDTrim = 'SCENES.Valorant Game.LED Wall.Snapshots.Trim Draft'
local snapshotLEDTrimMedia = 'SCENES.Valorant Game.LED Wall.Snapshots.Trim Media'
local snapshotLEDShow = 'SCENES.Valorant Game.LED Wall.Snapshots.Show Full'
local snapshotLEDShowHalf = 'SCENES.Valorant Game.LED Wall.Snapshots.Show Half'
local snapshotDraftBO3 = 'SCENES.Valorant Game.Draft.Snapshots.BO3'
local snapshotDraftBO5 = 'SCENES.Valorant Game.Draft.Snapshots.BO5'
local snapshotGameBO3 = 'SCENES.Valorant Game.Game.Snapshots.BO3'
local snapshotGameBO5 = 'SCENES.Valorant Game.Game.Snapshots.BO5'
local snapshotHide = 'SCENES.Valorant Game.Draft.Snapshots.Hide'
local snapshotLEDBO3 = 'SCENES.Valorant Game.LED Wall.Snapshots.Show BO3'
local snapshotLEDBO5 = 'SCENES.Valorant Game.LED Wall.Snapshots.Show BO5'
local snapshotMenu = 'SCENES.Valorant Game.Draft.Snapshots.Menu'
local snapshotMenuFull = 'SCENES.Valorant Game.Draft.Snapshots.Full Menu'

local stillsMapCoord = 'MEDIA/stills/Valorant/Scene - LED Wall/Coordinates/'
local stillsMapDraft = 'MEDIA/stills/Valorant/Draft Maps/'
local stillsMapLoading = 'MEDIA/stills/Valorant/Map Loading Screens/'
local stillsMapName = 'MEDIA/stills/Valorant/Scene - LED Wall/Map Name/'

local transitionBGD = 'SCENES.Main.Transitions.BgdMix'
local transitionZoom = 'SCENES.Valorant Game.LED Wall.Transitions.Zoom'

local macroLocationAudio = 'MACROS.Main R2 Macros'

local bestOf = get(gfxMatchBO .. get(gfxSelectedMatch, 'value'), 'value')

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
local mapList = load("return " .. get(gfxMapList, 'text'))()
local playerNamesString = get('GFXSCENES.Valorant.Players', 'text')
local playerNames = load("return " .. playerNamesString)()

-------------------------------------------------------------------------------------------
-- Functions

function callMacro(macro)
    call(macro, 'play')
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function callTransition(transition)
    call(transition, 'transition_auto')
end

function muteAll()
    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end

        wait_milliseconds(10)
    end
end

function muteAllExcept(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        else
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 1 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

function unmute(source, preferredChannel)
    local unmuted = 0

    for i = 1, 6 do
        if get(sceneGFX .. '.Audio Source ' .. i, 'value') == source then
            if get(sceneGFX .. '.Audio Control ' .. i, 'value') == 0 then
                call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
            end

            unmuted = 1
        end

        wait_milliseconds(10)
    end

    if unmuted == 0 then
        local currentSource = get(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value')
        set(macroLocationAudio .. '.' .. preferredChannel .. ') ' .. sourceNames[currentSource], 'name', preferredChannel .. ') ' .. sourceNames[source])
        set('AUDIOMIXER.Channel ' .. preferredChannel, 'source', sourceIndex[source])
        set(sceneGFX .. '.Audio Source ' .. preferredChannel, 'value', source)
        call('MACROS.Main R1 Macros.Channel ' .. preferredChannel, 'play')
    end
end

function resetPicks()
    for i = 1, 10 do
        call(gfxS .. i, 'reset')
        call(gfxP .. i, 'reset')
    end
end

function setLEDWall()
    if bestOf == 3 then
        callTransition(transitionZoom)
        callSnapshot(snapshotLEDShowHalf)
        wait_milliseconds(500)
        callSnapshot(snapshotLEDShow)
        wait_milliseconds(500)
        callSnapshot(snapshotLEDTrim)
        callSnapshot(snapshotLEDBO3)
        wait_milliseconds(750)
        callSnapshot(snapshotLEDTrimMedia)
        wait_milliseconds(250)
        callSnapshot(snapshotLEDDraft)
    else
        callTransition(transitionZoom)
        callSnapshot(snapshotLEDShowHalf)
        wait_milliseconds(500)
        callSnapshot(snapshotLEDShow)
        wait_milliseconds(500)
        callSnapshot(snapshotLEDTrim)
        callSnapshot(snapshotLEDBO5)
        wait_milliseconds(750)
        callSnapshot(snapshotLEDTrimMedia)
        wait_milliseconds(250)
        callSnapshot(snapshotLEDDraft)
    end
end

function setMap()
    local score = get(gfxValorantUSC, 'value') + get(gfxValorantVisitor, 'value') + 1
    gfxMap = gfxMap .. score
    local map = get(gfxMap, 'value')

    set(fxMapCoord, 'source', stillsMapCoord .. mapList[map] .. '.rr')
    set(fxMapDraft, 'source', stillsMapDraft .. mapList[map] .. '.rr')
    set(fxMapLED, 'source', stillsMapLoading .. mapList[map] .. '.rr')
    set(fxNameLED, 'source', stillsMapName .. mapList[map] .. '.rr')

    set(layerLEDBGD, 'sourceB', fxMapLED)
end

function setPlayerNames(homeStart, visitorStart)
    for i = 1, 5 do
        set('GFXSCENES.Valorant.Home P' .. i, 'text', playerNames[homeStart + i - 1])
        set('GFXSCENES.Valorant.Visitor P' .. i, 'text', playerNames[visitorStart + i - 1])
    end
end

function setScore()
    local ATK = get(gfxATK, 'value')
    local usc = get(gfxValorantUSC, 'value')
    local visitor = get(gfxValorantVisitor, 'value')

    if bestOf == 3 then
        callSnapshot(snapshotDraftBO3)
        callSnapshot(snapshotGameBO3)
    else
        callSnapshot(snapshotDraftBO5)
        callSnapshot(snapshotGameBO5)
    end

    if ATK == 1 then
        if usc >= 1 then
            set(layerGameTeam .. 'R1', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'L1', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'L1', 'sourceA', fxTickerWhite)
        end
        if usc == 2 then
            set(layerGameTeam .. 'R2', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'L2', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'L2', 'sourceA', fxTickerWhite)
        end
        if visitor >= 1 then
            set(layerGameTeam .. 'L1', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'R1', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'R1', 'sourceA', fxTickerWhite)
        end
        if visitor == 2 then
            set(layerGameTeam .. 'L2', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'R2', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'R2', 'sourceA', fxTickerWhite)
        end
    else
        if usc >= 1 then
            set(layerGameTeam .. 'L1', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'R1', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'R1', 'sourceA', fxTickerWhite)
        end
        if usc == 2 then
            set(layerGameTeam .. 'L2', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'R2', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'R2', 'sourceA', fxTickerWhite)
        end
        if visitor >= 1 then
            set(layerGameTeam .. 'R1', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'L1', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'L1', 'sourceA', fxTickerWhite)
        end
        if visitor == 2 then
            set(layerGameTeam .. 'R2', 'sourceA', fxTickerWhite)
            set(layerDraftTeam .. 'L2', 'sourceA', fxTickerWhite)
            set(layerLEDTeam .. 'L2', 'sourceA', fxTickerWhite)
        end
    end
end

function setSide()
    local ATK = get(gfxATK, 'value')

    if ATK == 1 then
        setPlayerNames(1, 6)
        set(layerDraftTeamLeftCrawl, 'sourceA', 'RR5')
        set(layerDraftTeamRightCrawl, 'sourceA', 'RR6')
        set(layerDraftTeamLeft, 'sourceA', fxHome)
        set(layerDraftTeamRight, 'sourceA', fxVisitor)
        set(layerGameTeamLeft, 'sourceA', fxVisitor)
        set(layerGameTeamRight, 'sourceA', fxHome)
        set(layerLEDHome, 'sourceA', fxHome)
        set(layerLEDVisitor, 'sourceA', fxVisitor)
    else
        setPlayerNames(6, 1)
        set(layerDraftTeamLeftCrawl, 'sourceA', 'RR6')
        set(layerDraftTeamRightCrawl, 'sourceA', 'RR5')
        set(layerDraftTeamLeft, 'sourceA', fxVisitor)
        set(layerDraftTeamRight, 'sourceA', fxHome)
        set(layerGameTeamLeft, 'sourceA', fxHome)
        set(layerGameTeamRight, 'sourceA', fxVisitor)
        set(layerLEDHome, 'sourceA', fxVisitor)
        set(layerLEDVisitor, 'sourceA', fxHome)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

call('RR5', 'play')
call('RR6', 'play')

set(layerMainBGD, 'sourceB', sceneDraft)
callSnapshot(snapshotHide)
callSnapshot(snapshotLEDHide)

call(gfxTimer, 'reset')
set(gfxTimer, 'start', '120')
call(gfxTimer, 'start')

setMap()
setScore()
setSide()
resetPicks()

unmute(27, 5)
unmute(33, 1)

wait_milliseconds(2000)

callTransition(transitionBGD)
callSnapshot(snapshotMenu)
callSnapshot(snapshotCasterHide)

wait_milliseconds(1000)

callSnapshot(snapshotMenuFull)
callMacro(macroP1)
callMacro(macroRetract)

setLEDWall()

wait_milliseconds(2000)

set(layerMainBGD, 'sourceB', sceneDraft)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
