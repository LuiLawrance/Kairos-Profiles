-- Functionality Variables

local blankBan = 'FXINPUTS.League Config.Blank Ban'
local blankDraft = 'FXINPUTS.League Config.Blank Draft'

local sceneBan = 'SCENES.League Game.LED Wall.Layers.Ban.Ban '
local sceneDraft = 'SCENES.League Game.LED Wall.Layers.Draft.P'

local snapshotBluePick = 'SCENES.League Game.LED Wall.Snapshots.Blue Pick'
local snapshotRedPick = 'SCENES.League Game.LED Wall.Snapshots.Red Pick'
local snapshotDonePick = 'SCENES.League Game.LED Wall.Snapshots.Starting'
local snapshotHide = 'SCENES.League Game.LED Wall.Snapshots.Hide Transition'
local snapshotShowDraft = 'SCENES.League Game.LED Wall.Snapshots.Show Draft'
local snapshotShowTrim = 'SCENES.League Game.LED Wall.Snapshots.Show Trim'

local transitionDiamondWipe = 'SCENES.Main.Transitions.Diamond'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function revealSide(side)
    if side == 1 then
        callSnapshot(snapshotBluePick)
        wait_milliseconds(500)

        for i = 1, 5 do
            local transition = 'SCENES.League Game.LED Wall.Transitions.Ban ' .. i
            callTransition(transition)
            wait_milliseconds(500)
        end

        for i = 1, 5 do
            local transition = 'SCENES.League Game.LED Wall.Transitions.P' .. i
            callTransition(transition)
            wait_milliseconds(500)
        end
    elseif side == 2 then
        callSnapshot(snapshotRedPick)
        wait_milliseconds(500)

        for i = 6, 10 do
            callTransition('SCENES.League Game.LED Wall.Transitions.P' .. i)
            wait_milliseconds(500)
        end

        for i = 6, 10 do
            callTransition('SCENES.League Game.LED Wall.Transitions.Ban ' .. i)
            wait_milliseconds(500)
        end
    end
end

function setBlank()
    for i = 1, 10 do
        set(sceneBan .. i, 'sourceB', blankBan)
        set(sceneDraft .. i, 'sourceB', blankDraft)
        wait_milliseconds(10)
    end
end

function transitionDraft()
    for i = 1, 10 do
        callTransition('SCENES.League Game.LED Wall.Transitions.Ban ' .. i)
        callTransition('SCENES.League Game.LED Wall.Transitions.P' .. i)
    end
end

function callSnapshot(snapshot)
    call(snapshot, 'recall')
end

function callTransition(transition)
    call(transition, 'transition_auto')
end

-------------------------------------------------------------------------------------------
-- Main Script

set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.LED Wall')

setBlank()
transitionDraft()
callSnapshot(snapshotHide)

wait_milliseconds(750)

callTransition(transitionDiamondWipe)

wait_milliseconds(1500)

callSnapshot(snapshotShowTrim)

wait_milliseconds(1000)

callSnapshot(snapshotShowDraft)

wait_milliseconds(500)

revealSide(1)
revealSide(2)

callSnapshot(snapshotDonePick)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
