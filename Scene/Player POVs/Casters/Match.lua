-- Functionality Variables

local gfxGame = 'GFXSCENES.Control.Game'
local gfxRetracted = 'GFXSCENES.Control.Retracted'

local gfxLeagueUSC = 'GFXSCENES.League.USC'
local gfxLeagueVisitor = 'GFXSCENES.League.Visitor'
local gfxValorantUSC = 'GFXSCENES.Valorant.USC'
local gfxValorantVisitor = 'GFXSCENES.Valorant.Visitor'

local snapshotHide = 'THIS_SCENE.Snapshots.Hide'
local snapshotMenu = 'THIS_SCENE.Snapshots.Menu'
local snapshotMatchup = 'THIS_SCENE.Snapshots.Matchup'
local snapshotSchedule = 'THIS_SCENE.Snapshots.Schedule'

local sceneTitleCard = 'THIS_SCENE.Layers.Title Card'

local stillMatch1 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 1.rr'
local stillMatch2 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 2.rr'
local stillMatch3 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 3.rr'
local stillMatch4 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 4.rr'
local stillMatch5 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 5.rr'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function match()
    if get(gfxGame, 'value') == 1 then
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

-------------------------------------------------------------------------------------------
-- Main Script

match()
menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
