-- Functionality Variables

local gfxRetracted = 'GFXSCENES.Control.Retracted'

local gfxValorantUSC = 'GFXSCENES.Valorant.USC'
local gfxValorantVisitor = 'GFXSCENES.Valorant.Visitor'
local gfxBestOf = 'GFXSCENES.Valorant.Best of'

local snapshotHide = 'SCENES.Player POVs.Casters.Snapshots.Hide'
local snapshotMenu = 'SCENES.Player POVs.Casters.Snapshots.Menu'
local snapshotMatchup = 'SCENES.Player POVs.Casters.Snapshots.Matchup'
local snapshotMap = 'SCENES.Player POVs.Casters.Snapshots.Valorant Map'
local snapshotSchedule = 'SCENES.Player POVs.Casters.Snapshots.Schedule'
local snapshotBO3 = 'SCENES.Player POVs.Casters.Snapshots.Val BO3'
local snapshotBO5 = 'SCENES.Player POVs.Casters.Snapshots.Val BO5'
local snapshotBO3Map = 'SCENES.Player POVs.Casters.Snapshots.Valorant 3 Map'
local snapshotBO5Map = 'SCENES.Player POVs.Casters.Snapshots.Valorant 5 Map'

local snapshotBO3Map1 = 'SCENES.Player POVs.Casters.Snapshots.Val 3-1'
local snapshotBO3Map2 = 'SCENES.Player POVs.Casters.Snapshots.Val 3-2'
local snapshotBO3Map3 = 'SCENES.Player POVs.Casters.Snapshots.Val 3-3'
local snapshotBO5Map1 = 'SCENES.Player POVs.Casters.Snapshots.Val 5-1'
local snapshotBO5Map2 = 'SCENES.Player POVs.Casters.Snapshots.Val 5-2'
local snapshotBO5Map3 = 'SCENES.Player POVs.Casters.Snapshots.Val 5-3'
local snapshotBO5Map4 = 'SCENES.Player POVs.Casters.Snapshots.Val 5-4'
local snapshotBO5Map5 = 'SCENES.Player POVs.Casters.Snapshots.Val 5-5'

local sceneTitleCard = 'THIS_SCENE.Layers.Title Card'

local stillMatch1 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 1.rr'
local stillMatch2 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 2.rr'
local stillMatch3 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 3.rr'
local stillMatch4 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 4.rr'
local stillMatch5 = 'MEDIA/stills/Common/Scene - Casters/Title Card/Match 5.rr'

local fxTickerWhite = 'FXINPUTS.Valorant Config.Ticker White'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function match()
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

    if get(gfxBestOf, 'value') == 3 then
        callSnapshot(snapshotBO3)

        if score == 0 then
            callSnapshot(snapshotBO3Map1)
        elseif score == 1 then
            callSnapshot(snapshotBO3Map2)
        else
            callSnapshot(snapshotBO3Map3)
        end
    else
        callSnapshot(snapshotBO5)

        if score == 0 then
            callSnapshot(snapshotBO5Map1)
        elseif score == 1 then
            callSnapshot(snapshotBO5Map2)
        elseif score == 2 then
            callSnapshot(snapshotBO5Map3)
        elseif score == 3 then
            callSnapshot(snapshotBO5Map4)
        else
            callSnapshot(snapshotBO5Map5)
        end
    end
end

function menu()
    if get(gfxRetracted, 'value') == 1 then
        set(gfxRetracted, 'value', 0)
        callSnapshot(snapshotHide)
        wait_milliseconds(500)
        callSnapshot(snapshotMenu)
    end

    callSnapshot(snapshotMatchup)
    wait_milliseconds(1500)
    callSnapshot(snapshotMap)
    wait_milliseconds(750)

    if get(gfxBestOf, 'value') == 3 then
        callSnapshot(snapshotBO3Map)
    else
        callSnapshot(snapshotBO5Map)
    end
end

function score()
    local usc = get(gfxValorantUSC, 'value') 
    local visitor get(gfxValorantVisitor, 'value')

    if usc == 1 then
        set('SCENES.Player POVs.Casters.Layers.Score.L1', 'sourceA', fxTickerWhite)
    end

    if usc == 2 then
        set('SCENES.Player POVs.Casters.Layers.Score.L2', 'sourceA', fxTickerWhite)
    end

    if visitor == 1 then
        set('SCENES.Player POVs.Casters.Layers.Score.R1', 'sourceA', fxTickerWhite)
    end

    if visitor == 2 then
        set('SCENES.Player POVs.Casters.Layers.Score.R2', 'sourceA', fxTickerWhite)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

match()
score()
menu()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
