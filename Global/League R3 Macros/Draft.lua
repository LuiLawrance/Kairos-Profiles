-- Functionality Variables

local page = 0
local t = 3000
local blueBan = 'MEDIA/ramrec/League of Legends/Blue Ban.rr'
local modeMV = get('GFXSCENES.Control.PlayerMV', 'value')

local macroLocationAudio = 'MACROS.Main R2 Macros'
local sceneGFX = 'GFXSCENES.Control'

-------------------------------------------------------------------------------------------
-- Arrays

local playerNamesString = get('GFXSCENES.League.Players', 'text')
local playerNames = load("return " .. playerNamesString)()

-------------------------------------------------------------------------------------------
-- Functions

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
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
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

-- Resets all Ban and Pick elements
local function resetAll()
    for i = 1, 10 do
        call('GFXSCENES.League.B' .. i, 'reset')
        call('GFXSCENES.League.P' .. i, 'reset')
    end
end

-- Sets player names for home and visitor teams
local function setPlayerNames(homeStart, visitorStart)
    for i = 1, 5 do
        set('GFXSCENES.League.Home P' .. i, 'text', playerNames[homeStart + i - 1])
        set('GFXSCENES.League.Visitor P' .. i, 'text', playerNames[visitorStart + i - 1])
    end
end

-- Sets ticker information for blue and red teams
local function setTicker(usc, visitor)
    --print(usc)
    --print(visitor)
    if usc >= 1 then set('SCENES.League Game.Draft.Layers.Ban and Menu.B1', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') set('SCENES.League Game.LED Wall.Layers.Score.B1', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') set('SCENES.League Game.Game.Layers.Score.B1', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') end
    if usc == 2 then set('SCENES.League Game.Draft.Layers.Ban and Menu.B2', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') set('SCENES.League Game.LED Wall.Layers.Score.B2', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') set('SCENES.League Game.Game.Layers.Score.B2', 'sourceA', 'FXINPUTS.League Config.Ticker Blue') end
    if visitor >= 1 then set('SCENES.League Game.Draft.Layers.Ban and Menu.R1', 'sourceA', 'FXINPUTS.League Config.Ticker Red') set('SCENES.League Game.LED Wall.Layers.Score.R1', 'sourceA', 'FXINPUTS.League Config.Ticker Red') set('SCENES.League Game.Game.Layers.Score.R1', 'sourceA', 'FXINPUTS.League Config.Ticker Red') end
    if visitor == 2 then set('SCENES.League Game.Draft.Layers.Ban and Menu.R2', 'sourceA', 'FXINPUTS.League Config.Ticker Red') set('SCENES.League Game.LED Wall.Layers.Score.R2', 'sourceA', 'FXINPUTS.League Config.Ticker Red') set('SCENES.League Game.Game.Layers.Score.R2', 'sourceA', 'FXINPUTS.League Config.Ticker Red') end
end

-- Handles recall for snapshots based on match type
local function recallMatchSnapshot(match)
    if match == 3 then
        call('SCENES.League Game.Draft.Snapshots.BO3', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.BO3', 'recall')
        call('SCENES.League Game.Game.Snapshots.BO3', 'recall')
    else
        call('SCENES.League Game.Draft.Snapshots.BO5', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.BO5', 'recall')
        call('SCENES.League Game.Game.Snapshots.BO5', 'recall')
    end
end

-- Configures the side for blue or red team and sets appropriate ticker and player names
local function configureTeamSides(blue, usc, visitor)
    if blue == 1 then
        set('SCENES.League Game.Draft.Layers.Ban and Menu.B Crawl', 'sourceA', 'RR6')
        set('SCENES.League Game.Draft.Layers.Ban and Menu.R Crawl', 'sourceA', 'RR5')
        setTicker(usc, visitor)
        setPlayerNames(1, 6)
        set('SCENES.League Game.LED Wall.Layers.Blue Team', 'sourceA', 'FXINPUTS.Common.Home Team')
        set('SCENES.League Game.LED Wall.Layers.Red Team', 'sourceA', 'FXINPUTS.Common.Visitor Team')
        set('SCENES.League Game.Game.Layers.Blue Team', 'sourceA', 'FXINPUTS.Common.Home Team')
        set('SCENES.League Game.Game.Layers.Red Team', 'sourceA', 'FXINPUTS.Common.Visitor Team')
    else
        set('SCENES.League Game.Draft.Layers.Ban and Menu.B Crawl', 'sourceA', 'RR5')
        set('SCENES.League Game.Draft.Layers.Ban and Menu.R Crawl', 'sourceA', 'RR6')
        setTicker(visitor, usc)
        setPlayerNames(6, 1)
        set('SCENES.League Game.LED Wall.Layers.Red Team', 'sourceA', 'FXINPUTS.Common.Home Team')
        set('SCENES.League Game.LED Wall.Layers.Blue Team', 'sourceA', 'FXINPUTS.Common.Visitor Team')
        set('SCENES.League Game.Game.Layers.Red Team', 'sourceA', 'FXINPUTS.Common.Home Team')
        set('SCENES.League Game.Game.Layers.Blue Team', 'sourceA', 'FXINPUTS.Common.Visitor Team')
    end
end

-- Handles initial draft setup
local function initializeDraft()
    page = get('GFXSCENES.League.Draft Page', 'value')
    
    call('SCENES.League Game.Draft.Macros.Next Page', 'play')
    if page <= 1 then
        wait_milliseconds(500)
        call('SCENES.League Game.Draft.Macros.Next Page', 'play')
    end
    
-- This was coded by Lawrance Zhenyu Lui

    call('GFXSCENES.League.Selection', 'reset')
    set('GFXSCENES.League.Phase', 'value', '1')
    call('SCENES.League Game.Draft.Snapshots.Ban 1', 'recall')
    set('SCENES.League Game.Draft.Layers.Ban and Menu.Ban Select', 'state', 'On')
    set('SCENES.League Game.Draft.Layers.Draft.Draft Selector', 'state', 'Off')
    call('RR5', 'play')
    call('RR6', 'play')
    call('GFXSCENES.League.Draft Timer', 'reset')
    set('GFXSCENES.League.Draft Timer', 'start', '30')
    call('GFXSCENES.League.Draft Timer', 'start')
    set('GFXSCENES.League.Current Phase', 'text', 'Ban Phase 1')
end

-------------------------------------------------------------------------------------------
-- Main Script

call('SCENES.Common.Media.Macros.Flag', 'play')
casters = get('SCENES.Player POVs.Casters.Layers.Background', 'sourceA')
set('SCENES.League Game.Draft.Layers.Background', 'sourceA', casters)

set('SCENES.League Game.Canvas.Layers.Right', 'sourceB', 'MEDIA/ramrec/League of Legends/Scene - Canvas/Rotating.rr')
set('SCENES.League Game.Canvas.Layers.Second Right', 'sourceB', 'MEDIA/ramrec/League of Legends/Scene - Canvas/Rotating.rr')
set('SCENES.League Game.Canvas.Layers.Middle', 'sourceB', 'MEDIA/ramrec/League of Legends/Scene - Canvas/Rotating.rr')
set('SCENES.League Game.Canvas.Layers.Second Left', 'sourceB', 'MEDIA/ramrec/League of Legends/Scene - Canvas/Rotating.rr')
set('SCENES.League Game.Canvas.Layers.Left', 'sourceB', 'MEDIA/ramrec/League of Legends/Scene - Canvas/Rotating.rr')

set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Draft')
call('SCENES.League Game.Draft.Snapshots.Hide', 'recall')
call('SCENES.Main.Transitions.BgdMix', 'transition_auto')
call('SCENES.League Game.LED Wall.Snapshots.Hide Picks', 'recall')

call('SCENES.League Game.Canvas.Snapshots.Hide All', 'recall')
call('SCENES.League Game.LED Wall.Snapshots.Hide Score', 'recall')
wait_milliseconds(1000)
call('SCENES.League Game.Canvas.Snapshots.Clear', 'recall')
call('SCENES.League Game.Canvas.Transitions.BgdMix', 'transition_auto')
call('SCENES.League Game.LED Wall.Snapshots.Clear', 'recall')

set('AP2', 'repeat_playlist', '1')
set('AP2', 'repeat', '0')
call('AP2', 'end')
call('AP2', 'play')

call('RR5', 'play')
call('RR6', 'play')

muteAllExcept(30, 1)
wait_milliseconds(1000)
unmute(28, 6)

wait_milliseconds(t)

initializeDraft() -- Start initial draft setup
resetAll() -- Reset all selections

-- Retrieve additional variables for setting up teams
local blue = get('GFXSCENES.League.Blue Side', 'value')
local usc = get('GFXSCENES.League.USC', 'value')
local visitor = get('GFXSCENES.League.Visitor', 'value')
local match = get('GFXSCENES.League.Best of', 'value')

call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', 'SCENES.League Game.LED Wall')
set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Draft') -- Pulls up the champion select
recallMatchSnapshot(match) -- Set snapshot based on match type
configureTeamSides(blue, usc, visitor) -- Configure blue and red sides based on team values

if modeMV == 0 then 
    set('MACROS.League R3 Macros.Player', 'color', 'rgb(255,0,0)')
    set('GFXSCENES.Control.PlayerMV', 'value', 2)
    call('MVPRESETS.Player 1', 'recall', '5060')
    call('MVPRESETS.Player 2', 'recall', '5061')
end

call('SCENES.League Game.Draft.Snapshots.Ban Only Menu', 'recall')
wait_milliseconds(5000)
call('MACROS.League Misc R1 Macros.Casters', 'play')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
