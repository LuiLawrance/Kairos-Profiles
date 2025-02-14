-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
local championsString = get('GFXSCENES.League.Champions', 'text')
local champions = load("return " .. championsString)()

-------------------------------------------------------------------------------------------
-- Functionality Variables

local desiredSources = {1, 2, 3, 4, 5, 6}
--local desiredVolume = {0, 0, 0, 0, 0, 0}
local t = 10  -- Milliseconds to wait

-------------------------------------------------------------------------------------------
-- Functions

function audioSet() -- Set's the Audio Channels to the desired Sources/Volume
    if get('GFXSCENES.Control.Audio Toggle Control', 'value') ~= 0 then 
        call('MACROS.Main R1 Macros.Volume', 'play')
    end

    for i = 1, 6 do
        if get('GFXSCENES.Control.Audio Control ' .. i, 'value') == 1 then
            call('MACROS.Main R1 Macros.Channel ' .. i, 'play')
        end

        local sourceCurrent = get('GFXSCENES.Control.Audio Source ' .. i, 'value')
        set('GFXSCENES.Control.Audio Source ' .. i, 'value', desiredSources[i])

        set('AUDIOMIXER.Channel ' .. i, 'source', sourceIndex[desiredSources[i]])
        --set('AUDIOMIXER.Channel ' .. i, 'volume', desiredVolume[i] / 100)
        set('MACROS.Main R2 Macros.' .. i .. ') ' .. sourceNames[sourceCurrent], 'name', i .. ') ' .. sourceNames[desiredSources[i]])
        wait_milliseconds(t)
    end
end

function clearRAM()
    for i = 1, 8 do
        set('RR' .. i, 'clip', '0')
    end
end

function unloadChampions()
    for i, champion in ipairs(champions) do
        --local ban = "MEDIA.stills.League of Legends.Bans." .. champion .. "&#46;rr"
        --local draft = "MEDIA.stills.League of Legends.Draft." .. champion .. "&#46;rr"
        local splash = "MEDIA.stills.League of Legends.Splash Arts." .. champion .. "&#46;rr"
        --set(ban, 'status', '0')
        --set(draft, 'status', '0')
        set(splash, 'status', '0')
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

call('GFXSCENES.Control.Game', 'reset')                             -- Set's it to 0 indicating no game
set('GFXSCENES.Control.MV', 'value', 0)                             -- Sets the MV Control Number to 0
set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', '7774')  -- Sets the Wall Screen to the 'Main' Scene

set('SCENES.Main.Layers.Background', 'sourceOptions', '1000057922,') -- Sets Main's Default Source Options

set('SCENES.Main.Layers.Row 1', 'sourceOptions', '1000057923,') -- Sets Row 1's sources to "Main R1"
set('SCENES.Main.Layers.Row 2', 'sourceOptions', '1000057924,') -- Sets Row 2's sources to "Main R2"
set('SCENES.Main.Layers.Row 3', 'sourceOptions', '1000057925,') -- Sets Row 3's sources to "Main R3"
set('SCENES.Main.Layers.Row 4', 'sourceOptions', '1000057926,') -- Sets Row 4's sources to "Main R4"
set('SCENES.Main.Layers.Misc R1', 'sourceOptions', '')          -- Clears Misc Row 1's sources
set('SCENES.Main.Layers.Misc R2', 'sourceOptions', '')          -- Clears Misc Row 2's sources

set('SCENES.Main.Layers.Transition', 'state', 'Off')            -- Disable the Main scene's "Transition" layer

audioSet()
clearRAM()
--unloadChampions()
set('GFX1', 'scene', '0')

set('SCENES.Main.Layers.Background', 'sourceB', 'IP29') -- Sets the Main Preview
set('SCENES.Main.Layers.Background', 'sourceA', 'IP29') -- Sets the Main View

set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', '7774')    -- Sets the LED Wall scene to Main
set('SCENES.Normal.Caster Desk.Layers.Background', 'sourceA', '7774') -- Sets the Caster Desk scene to Main

set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', 'SCENES.Main')
set('IP-AUX2', 'source', 'SCENES.Normal.Canvas PVW')
set('IP-AUX3', 'source', 'SCENES.Normal.Canvas PVW')
set('IP-AUX4', 'source', 'SCENES.Normal.Canvas PVW')
set('IP-AUX5', 'source', 'SCENES.Normal.Canvas PVW')
set('IP-AUX6', 'source', 'SCENES.Normal.Canvas PVW')
set('SCENES.Normal.Caster Desk.Layers.Background', 'sourceA', 'SCENES.Main')
--set('SCENES.Normal.Canvas PVW.Layers.Right', 'sourceA', 'IP29')         --|
--set('SCENES.Normal.Canvas PVW.Layers.Second Right', 'sourceA', 'IP29')  --|
--set('SCENES.Normal.Canvas PVW.Layers.Middle', 'sourceA', 'IP29')        --| These set the Canvas Scenes
--set('SCENES.Normal.Canvas PVW.Layers.Second Left', 'sourceA', 'IP29')   --|
--set('SCENES.Normal.Canvas PVW.Layers.Left', 'sourceA', 'IP29')          --|
--call('SCENES.Normal.Canvas PVW.Snapshots.Base Normal', 'recall')

set('SCENES.Normal.Quad.Layers.Top Left', 'sourceA', 'IP29')      --|
set('SCENES.Normal.Quad.Layers.Top Right', 'sourceA', 'IP29')     --| Set Quad Scenes
set('SCENES.Normal.Quad.Layers.Bottom Left', 'sourceA', 'IP29')   --|
set('SCENES.Normal.Quad.Layers.Bottom Right', 'sourceA', 'IP29')  --|

call('MVPRESETS.Default 1', 'recall', '5060') --| Sets the Multi View
call('MVPRESETS.Default 2', 'recall', '5061') --|

call('IN_STREAM1.PtzTrigger', 'recall_preset', '24') --|
call('IN_STREAM2.PtzTrigger', 'recall_preset', '24') --| Sets the room cameras
call('IN_STREAM3.PtzTrigger', 'recall_preset', '24') --|

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', '1000065348')

set('AP1', 'clip', '0')
set('AP2', 'clip', '0')
set('AP1', 'playlist', '')
set('AP2', 'playlist', '')
