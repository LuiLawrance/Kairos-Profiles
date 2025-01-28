code = [[
-- Arrays

local championsString = get('GFXSCENES.League.Champions', 'text')
local champions = load("return " .. championsString)()
local phases = {'Ban 1', 'Ban 2', 'Ban 3', 'Ban 6', 'Ban 7', 'Ban 8', 'P1', 'P6', 'P7', 'P2', 'P3', 'P8', 'Ban 9', 'Ban 4', 'Ban 10', 'Ban 5', 'P9', 'P4', 'P5', 'P10'}

-------------------------------------------------------------------------------------------
-- Functionality Variables

local t = 10
local ban = 'MEDIA/stills/League of Legends/Ban/'
local draft = 'MEDIA/stills/League of Legends/Draft/'
local splash = 'MEDIA/stills/League of Legends/Splash Arts/'
local count = #champions

local isBlue = get('GFXSCENES.League.Blue Side', 'value')
local blueBan = 'MEDIA/ramrec/League of Legends/Blue Ban.rr'
local blueDraft = 'MEDIA/ramrec/League of Legends/Blue Draft.rr'
local redBan = 'MEDIA/ramrec/League of Legends/Red Ban.rr'
local redDraft = 'MEDIA/ramrec/League of Legends/Red Draft.rr'

-------------------------------------------------------------------------------------------
-- Functions

-- Function to get the path for the current phase
local function getPhasePath(phaseName)
    if string.match(phaseName, "Ban") then
        return 'THIS_SCENE.Layers.Ban and Menu.' .. phaseName
    else
        return 'THIS_SCENE.Layers.Draft.' .. phaseName
    end
end

local function getPhasePathCanvas(phaseName)
    if string.match(phaseName, "Ban") then
        --return 'SCENES.League Game.Canvas.Layers.Ban.' .. phaseName
    else
        return 'SCENES.League Game.Canvas.Layers.Players.' .. phaseName
    end
end

local function getPhasePathLED(phaseName)
    if string.match(phaseName, "Ban") then
        return 'SCENES.League Game.LED Wall.Layers.Ban.' .. phaseName
    else
        return 'SCENES.League Game.LED Wall.Layers.Draft.' .. phaseName
    end
end

-- Function to get the transition path for the current phase
local function getTransitionPath(phaseName)
    return 'THIS_SCENE.Transitions.' .. phaseName
end

local function getTransitionPathCanvas(phaseName)
    return 'SCENES.League Game.Canvas.Transitions.' .. phaseName
end

local function getTransitionPathLED(phaseName)
    return 'SCENES.League Game.LED Wall.Transitions.' .. phaseName
end

-- Function to calculate the image ID based on the selected champion and phase type
local function getImageID(phaseType, championIndex)
    local baseID
    if string.match(phaseType, "Ban") then
        baseID = ban
    elseif string.match(phaseType, "P") then
        baseID = draft
    else
        baseID = splash
    end
    return baseID .. champions[championIndex] .. '.rr'
end

-- Load and execute snapshotSelector function
function _G.snapshotSelector(phase)
    local isBlue = get('GFXSCENES.League.Blue Side', 'value')

    if phase == 2 then
        call('THIS_SCENE.Snapshots.Ban 2', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 2', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B1', 'value', macro)
    elseif phase == 3 then
        call('THIS_SCENE.Snapshots.Ban 3', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 3', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B2', 'value', macro)
    elseif phase == 4 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.Ban 6', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 6', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B3', 'value', macro)
    elseif phase == 5 then
        call('THIS_SCENE.Snapshots.Ban 7', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 7', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B6', 'value', macro)
    elseif phase == 6 then
        call('THIS_SCENE.Snapshots.Ban 8', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 8', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B7', 'value', macro)
    elseif phase == 7 then
        call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')
        call('THIS_SCENE.Snapshots.P1', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P1', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P1', 'recall')
        set('THIS_SCENE.Layers.Draft.Draft Selector', 'state', 'On')
        set('THIS_SCENE.Layers.Ban and Menu.Ban Select', 'state', 'Off')
        if isBlue == 1 then
            call('RR6', 'pause')
        else
            call('RR5', 'pause')
        end

-- This was coded by Lawrance Zhenyu Lui

        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.Current Phase', 'text', 'Pick Phase 1')
        set('GFXSCENES.League.B8', 'value', macro)
    elseif phase == 8 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.P6', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P6', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P6', 'recall')
        if isBlue == 1 then
            call('RR5', 'pause')
            call('RR6', 'play')
        else
            call('RR5', 'play')
            call('RR6', 'pause')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P1', 'value', macro)
    elseif phase == 9 then
        call('THIS_SCENE.Snapshots.P7', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P7', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P7', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P6', 'value', macro)
    elseif phase == 10 then
        call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')
        call('THIS_SCENE.Snapshots.P2', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P2', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P2', 'recall')
        if isBlue == 1 then
            call('RR5', 'play')
            call('RR6', 'pause')
        else
            call('RR5', 'pause')
            call('RR6', 'play')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P7', 'value', macro)
    elseif phase == 11 then
        call('THIS_SCENE.Snapshots.P3', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P3', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P3', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P2', 'value', macro)
    elseif phase == 12 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.P8', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P8', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P8', 'recall')
        if isBlue == 1 then
            call('RR5', 'pause')
            call('RR6', 'play')
        else
            call('RR5', 'play')
            call('RR6', 'pause')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P3', 'value', macro)
    elseif phase == 13 then
        call('THIS_SCENE.Snapshots.Ban 9', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 9', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.Starting', 'recall')
        set('THIS_SCENE.Layers.Draft.Draft Selector', 'state', 'Off')
        set('THIS_SCENE.Layers.Ban and Menu.Ban Select', 'state', 'On')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.Current Phase', 'text', 'Ban Phase 2')
        set('GFXSCENES.League.P8', 'value', macro)
    elseif phase == 14 then
        call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')
        call('THIS_SCENE.Snapshots.Ban 4', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 4', 'recall')
        if isBlue == 1 then
            call('RR5', 'play')
            call('RR6', 'pause')
        else
            call('RR5', 'pause')
            call('RR6', 'play')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B9', 'value', macro)
    elseif phase == 15 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.Ban 10', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 10', 'recall')
        if isBlue == 1 then
            call('RR5', 'pause')
            call('RR6', 'play')
        else
            call('RR5', 'play')
            call('RR6', 'pause')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B4', 'value', macro)
    elseif phase == 16 then
        call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')
        call('THIS_SCENE.Snapshots.Ban 5', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.Ban 5', 'recall')
        if isBlue == 1 then
            call('RR5', 'play')
            call('RR6', 'pause')
        else
            call('RR5', 'pause')
            call('RR6', 'play')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.B10', 'value', macro)
    elseif phase == 17 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.P9', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P9', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P9', 'recall')
        set('THIS_SCENE.Layers.Draft.Draft Selector', 'state', 'On')
        set('THIS_SCENE.Layers.Ban and Menu.Ban Select', 'state', 'Off')
        if isBlue == 1 then
            call('RR5', 'pause')
            call('RR6', 'play')
        else
            call('RR5', 'play')
            call('RR6', 'pause')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.Current Phase', 'text', 'Pick Phase 2')
        set('GFXSCENES.League.B5', 'value', macro)
    elseif phase == 18 then
        call('SCENES.League Game.LED Wall.Snapshots.Blue Pick', 'recall')
        call('THIS_SCENE.Snapshots.P4', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P4', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P4', 'recall')
        if isBlue == 1 then
            call('RR5', 'play')
            call('RR6', 'pause')
        else
            call('RR5', 'pause')
            call('RR6', 'play')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P9', 'value', macro)
    elseif phase == 19 then
        call('THIS_SCENE.Snapshots.P5', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P5', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P5', 'recall')
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P4', 'value', macro)
    elseif phase == 20 then
        call('SCENES.League Game.LED Wall.Snapshots.Red Pick', 'recall')
        call('THIS_SCENE.Snapshots.P10', 'recall')
        call('SCENES.League Game.LED Wall.Snapshots.P10', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.P10', 'recall')
        if isBlue == 1 then
            call('RR5', 'pause')
            call('RR6', 'play')
        else
            call('RR5', 'play')
            call('RR6', 'pause')
        end
        call('GFXSCENES.League.Draft Timer', 'reset')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.P5', 'value', macro)
    elseif phase == 21 then
        call('SCENES.League Game.LED Wall.Snapshots.Starting', 'recall')
        call('SCENES.League Game.Canvas.Snapshots.Starting', 'recall')
        set('THIS_SCENE.Layers.Draft.Draft Selector', 'state', 'Off')
        set('THIS_SCENE.Layers.Ban and Menu.Ban Select', 'state', 'Off')
        call('RR5', 'play')
        call('RR6', 'play')
        call('GFXSCENES.League.Draft Timer', 'reset')
        set('GFXSCENES.League.Draft Timer', 'start', '270')
        call('GFXSCENES.League.Draft Timer', 'start')
        set('GFXSCENES.League.Current Phase', 'text', 'Starting...')
        set('GFXSCENES.League.P10', 'value', macro)
        set('SCENES.Main.Layers.Background', 'sourceB', 'SCENES.League Game.Draft Extra')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

local page = get('GFXSCENES.League.Draft Page', 'value')
local phase = get('GFXSCENES.League.Phase', 'value')
local selection = get('GFXSCENES.League.Selection', 'value')

-- Adjust selection based on page
if page == 2 then
    macro = macro + 91
end

-- Check if selection matches macro
if selection == macro then
    call('GFXSCENES.League.Phase', 'increase')
    phase = get('GFXSCENES.League.Phase', 'value')
    set('GFXSCENES.League.Selection', 'value', 0)
    if phase == 7 then
        call('THIS_SCENE.Snapshots.Full Menu', 'recall')
    end

-- This was coded by Lawrance Zhenyu Lui

    set('THIS_SCENE.Macros.' .. macro .. ") " .. champions[macro], "color", "rgb(255, 0, 0)")
    snapshotSelector(phase) -- Calls the dynamically loaded function
else
    if macro <= #champions then
        set('GFXSCENES.League.Selection', 'value', macro)
        local phaseName = phases[phase]
        local phasePath = getPhasePath(phaseName)
        local phasePathCanvas = getPhasePathCanvas(phaseName)
        local phasePathLED = getPhasePathLED(phaseName)
        local transitionPath = getTransitionPath(phaseName)
        local transitionPathCanvas = getTransitionPathCanvas(phaseName)
        local transitionPathLED = getTransitionPathLED(phaseName)
        local imageID = getImageID(phaseName, macro)
        set(phasePath, 'sourceB', tostring(imageID))
        set(phasePathLED, 'sourceB', tostring(imageID))
        call(transitionPath, 'transition_auto')
        call(transitionPathLED, 'transition_auto')

        if string.match(phaseName, "P") then
            set(phasePathCanvas, 'sourceB', tostring(imageID))
            call(transitionPathCanvas, 'transition_auto')
        end
    end
end

]]

set('GFXSCENES.League.draftCode', 'text', code)
