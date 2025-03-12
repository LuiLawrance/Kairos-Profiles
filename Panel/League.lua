-- Functionality Variables

local desiredSources = {33, 34, 35, 31, 27, 28}
--local desiredVolume = {0, -10, -10, 0, -15, -18}
local t = 50  -- Milliseconds to wait

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()
local championsString = get('GFXSCENES.League.Champions', 'text')
local champions = load("return " .. championsString)()

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
        --set('GFXSCENES.League.Channel ' .. i, 'value', desiredVolume[i])
        wait_milliseconds(t)
    end
end

function leagueMV()
    set('IP-AUX2', 'source', 'SCENES.League Game.Canvas')
    set('IP-AUX3', 'source', 'SCENES.League Game.Canvas')
    set('IP-AUX4', 'source', 'SCENES.League Game.Canvas')
    set('IP-AUX5', 'source', 'SCENES.League Game.Canvas')
    set('IP-AUX6', 'source', 'SCENES.League Game.Canvas')

    set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', 'SCENES.League Game.LED Wall')
    set('SCENES.Normal.Caster Desk.Layers.Background', 'sourceA', 'SCENES.League Game.Caster Desk')

    set('MV2.Inputs.11', 'source', 'SCENES.League Game.Canvas')
    wait_milliseconds(t)
    call('MVPRESETS.Game 2', 'store', '5061')
end

function loadChampions()
    for i, champion in ipairs(champions) do
        --local ban = "MEDIA.stills.League of Legends.Bans." .. champion .. "&#46;rr"
        --local draft = "MEDIA.stills.League of Legends.Draft." .. champion .. "&#46;rr"
        local splash = "MEDIA.stills.League of Legends.Splash Arts." .. champion .. "&#46;rr"
        --set(ban, 'status', '1')
        --set(draft, 'status', '1')
        set(splash, 'status', '1')
        wait_milliseconds(t)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

set('RR8', 'clip', 'MEDIA/ramrec/Common/Transitions/Stinger.rr')
call('RR8', 'begin')

wait_milliseconds(t)
set('GFXSCENES.Control.Game', 'value', 1)                          -- Set's it to 1 indicating League of Legends
set('SCENES.Main.Layers.Misc R1', 'sourceOptions', '1000073399,')  -- Sets Misc Row 1's Sources to the "League Misc R1" Folder
set('SCENES.Main.Layers.Misc R2', 'sourceOptions', '1000077773,')  -- Sets Misc Row 2's Sources to the "League Misc R2" Folder
set('SCENES.Main.Layers.Row 1', 'sourceOptions', '1000234695,')
set('SCENES.Main.Layers.Row 2', 'sourceOptions', '1000234696,')
set('SCENES.Main.Layers.Row 3', 'sourceOptions', '1000057914,')    -- Sets Row 3's Sources to the "League R3" folder
set('SCENES.Main.Layers.Row 4', 'sourceOptions', '1000068606,')    -- Sets Row 4's Sources to the "League R4" folder
set('SCENES.Main.Layers.Background', 'sourceOptions', '1000059367,') -- Set's the Main BGD Sources

set('SCENES.Main.Layers.Transition', 'state', 'On') -- Enable the Main scene's "Transition" layer

audioSet()
--loadChampions()
set('GFX1', 'scene', '1000077191')

call('MVPRESETS.Game 1', 'recall', '5060') --| Sets the Multi View
call('MVPRESETS.Game 2', 'recall', '5061') --|
set('SCENES.Normal.Game 1.Layers.Game', 'sourceA', 'SCENES.League Game.Game')
set('SCENES.Normal.Game 2.Layers.Game', 'sourceA', 'SCENES.League Game.Replay')
set('SCENES.Normal.Game 3.Layers.Game', 'sourceA', 'BLACK')

leagueMV()

call('SCENES.Common.Media.Macros.Offline', 'play') -- Call Media scene's "Offline" macro

if get('GFXSCENES.Control.PlayerMV', 'value') >= 1 then -- Deactivate the any MV togglers if they are on
    call('MACROS.League R4 Macros.MV', 'play')
end

call('GFXSCENES.League.USC', 'reset')     --| Reset the score
call('GFXSCENES.League.Visitor', 'reset') --|

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', '1000057174')
set('GFXSCENES.League.Current Phase', 'text', 'Pick Phase 2')

set('RR5', 'repeat', '1')
set('RR6', 'repeat', '1')

--call('MACROS.League Misc R1 Macros.Stinger', 'play')               -- Plays the transition so that screen doesn't turn black when the transition MOVs are first loaded into the RAM player

set('CP2', 'clip', 'MEDIA/clips/Common/Flag.mp4')
call('CP2', 'play')

set('AP1', 'playlist', '1000362560,1000362561,1000362562,1000362563,1000362564,1000362565,1000362566,1000362567,1000362568,1000362569,1000362570,1000362571,')
set('AP1', 'playlist_idx', '0')
call('AP1', 'load_clip', '1000362560')
call('AP1', 'play')
set('AP1', 'repeat_playlist', '1')

set('AP2', 'playlist', '1000151760,1000150543,1000151762,')
set('AP2', 'playlist_idx', '0')
call('AP2', 'load_clip', '1000151760')
call('AP2', 'play')
set('AP2', 'repeat_playlist', '1')

set('RR4', 'clip', 'MEDIA/ramrec/Common/Sign Extended.rr')
set('RR3', 'clip', 'MEDIA/ramrec/Common/Sign.rr')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
