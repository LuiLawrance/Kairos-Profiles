-- Functionality Variables

local gfxGame = 'GFXSCENES.Control.Game'
local gfxRetracted = 'GFXSCENES.Control.Retracted'

local gfxLeagueUSC = 'GFXSCENES.League.USC'
local gfxLeagueVisitor = 'GFXSCENES.League.Visitor'
local gfxMediaSelect = 'GFXSCENES.Control.Media Select'

local gfxValorantUSC = 'GFXSCENES.Valorant.USC'
local gfxValorantVisitor = 'GFXSCENES.Valorant.Visitor'

local snapshotHide = 'THIS_SCENE.Snapshots.Hide'
local snapshotLeagueBO3 = 'THIS_SCENE.Snapshots.Val BO3'
local snapshotLeagueBO5 = 'THIS_SCENE.Snapshots.Val BO5'
local snapshotMenu = 'THIS_SCENE.Snapshots.Menu'
local snapshotMatchup = 'THIS_SCENE.Snapshots.Matchup'
local snapshotSchedule = 'THIS_SCENE.Snapshots.Schedule'
local snapshotValorantBO3 = 'THIS_SCENE.Snapshots.Val BO3'
local snapshotValorantBO5 = 'THIS_SCENE.Snapshots.Val BO5'

local sceneTitleCard = 'THIS_SCENE.Layers.Title Card'

local stillMatch1 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 1.rr'
local stillMatch2 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 2.rr'
local stillMatch3 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 3.rr'
local stillMatch4 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 4.rr'
local stillMatch5 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 5.rr'

local stillValTickWhite = 'FXINPUTS.Valorant Config.Ticker White'

local select = get(gfxMediaSelect, 'value')

local gfxMatchBO = 'GFXSCENES.Control.BO ' .. select

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function bestOf()
    local BO = get(gfxMatchBO, 'value')

    if get(gfxGame, 'value') == 1 then
        if BO == 3 then
            callSnapshot(snapshotLeagueBO3)
        else
            callSnapshot(snapshotLeagueBO5)

        end
    elseif get(gfxGame, 'value') == 3 then
        if BO == 3 then
            callSnapshot(snapshotValorantBO3)
        else
            callSnapshot(snapshotValorantBO5)
        end
    end
end

function match()
    if get(gfxGame, 'value') == 1 then
        local score = get(gfxLeagueUSC, 'value') + get(gfxLeagueVisitor, 'value')

        if score == 0 then
            set(sceneTitleCard, 'sourceA', stillMatch1)
        elseif score == 1 then
            set(sceneTitleCard, 'sourceA', stillMatch2)
        elseif score == 2 then
            set(sceneTitleCard, 'sourceA', stillMatch3)
        elseif score == 3 then
            set(sceneTitleCard, 'sourceA', stillMatch4)
        elseif score == 4 then
            set(sceneTitleCard, 'sourceA', stillMatch5)
        end
    elseif get(gfxGame, 'value') == 3 then
        local score = get(gfxValorantUSC, 'value') + get(gfxValorantVisitor, 'value')

        if score == 0 then
            set(sceneTitleCard, 'sourceA', stillMatch1)
        elseif score == 1 then
            set(sceneTitleCard, 'sourceA', stillMatch2)
        elseif score == 2 then
            set(sceneTitleCard, 'sourceA', stillMatch3)
        elseif score == 3 then
            set(sceneTitleCard, 'sourceA', stillMatch4)
        elseif score == 4 then
            set(sceneTitleCard, 'sourceA', stillMatch5)
        end
    end
end

function menu()
    if get(gfxRetracted, 'value') == 1 then
        set(gfxRetracted, 'value', 0)
        callSnapshot(snapshotHide)
        wait_milliseconds(500)
    end

    callSnapshot(snapshotMenu)
    wait_milliseconds(500)
    callSnapshot(snapshotMatchup)
end

function score()
    bestOf()

    if get(gfxGame, 'value') == 1 then
        local usc = get(gfxLeagueUSC, 'value')
        local visitor = get(gfxLeagueVisitor, 'value')

        if usc == 1 then
            set('THIS_SCENE.Layers.Score.L1', 'sourceA', stillValTickWhite)
        elseif usc == 2 then
            set('THIS_SCENE.Layers.Score.L2', 'sourceA', stillValTickWhite)
        end

        if visitor == 1 then
            set('THIS_SCENE.Layers.Score.R1', 'sourceA', stillValTickWhite)
        elseif visitor == 2 then
            set('THIS_SCENE.Layers.Score.R2', 'sourceA', stillValTickWhite)
        end
    elseif get(gfxGame, 'value') == 3 then
        local usc = get(gfxValorantUSC, 'value')
        local visitor = get(gfxValorantVisitor, 'value')

        if usc == 1 then
            set('THIS_SCENE.Layers.Score.L1', 'sourceA', stillValTickWhite)
        elseif usc == 2 then
            set('THIS_SCENE.Layers.Score.L2', 'sourceA', stillValTickWhite)
        end

        if visitor == 1 then
            set('THIS_SCENE.Layers.Score.R1', 'sourceA', stillValTickWhite)
        elseif visitor == 2 then
            set('THIS_SCENE.Layers.Score.R2', 'sourceA', stillValTickWhite)
        end
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

match()
score()
menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
