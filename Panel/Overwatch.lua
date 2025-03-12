-- Functionality Variables

local desiredSources = {33, 34, 35, 31, 27, 28}
--local desiredVolume = {0, 0, 0, 0, 0, 0}
local t = 50  -- Milliseconds to wait
local faceCam = get('GFXSCENES.Control.Face Cams', 'value')

-------------------------------------------------------------------------------------------
-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()

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
        --set('GFXSCENES.Valorant.Channel ' .. i, 'value', desiredVolume[i])
        wait_milliseconds(t)
    end
end

function faceCams()
    if faceCam == 1 then
        call('SCENES.Player POVs.Player 1.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 2.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 3.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 4.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 5.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 6.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 7.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 8.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 9.Snapshots.Valorant', 'recall')
        call('SCENES.Player POVs.Player 10.Snapshots.Valorant', 'recall')
    else
        call('SCENES.Player POVs.Player 1.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 2.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 3.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 4.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 5.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 6.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 7.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 8.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 9.Snapshots.Off', 'recall')
        call('SCENES.Player POVs.Player 10.Snapshots.Off', 'recall')
    end
end

function valorantMV()
    set('IP-AUX2', 'source', 'SCENES.Valorant Game.Canvas')
    set('IP-AUX3', 'source', 'SCENES.Valorant Game.Canvas')
    set('IP-AUX4', 'source', 'SCENES.Valorant Game.Canvas')
    set('IP-AUX5', 'source', 'SCENES.Valorant Game.Canvas')
    set('IP-AUX6', 'source', 'SCENES.Valorant Game.Canvas')

    set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', 'SCENES.Valorant Game.LED Wall')
    set('SCENES.Normal.Caster Desk.Layers.Background', 'sourceA', 'SCENES.Valorant Game.Caster Desk')

    set('MV2.Inputs.11', 'source', 'SCENES.Valorant Game.Canvas')
    wait_milliseconds(t)
    call('MVPRESETS.Game 2', 'store', '5061')
end

-------------------------------------------------------------------------------------------
-- Main Script

set('RR8', 'clip', 'MEDIA/ramrec/Common/Transitions/Stinger.rr')
call('RR8', 'begin')

wait_milliseconds(t)
set('GFXSCENES.Control.Game', 'value', 3)                          -- Set's it to 3 indicating Valorant
set('SCENES.Main.Layers.Misc R1', 'sourceOptions', '1000077974,')
set('SCENES.Main.Layers.Misc R2', 'sourceOptions', '1000077975,')
set('SCENES.Main.Layers.Row 1', 'sourceOptions', '1000348300,')
set('SCENES.Main.Layers.Row 2', 'sourceOptions', '1000348301,')
set('SCENES.Main.Layers.Row 3', 'sourceOptions', '1000077976,')
set('SCENES.Main.Layers.Row 4', 'sourceOptions', '1000077977,')
set('SCENES.Main.Layers.Background', 'sourceOptions', '1000077770,')

set('SCENES.Main.Layers.Transition', 'state', 'On') -- Enable the Main scene's "Transition" layer

audioSet()
set('GFX1', 'scene', '1000078028')

call('MVPRESETS.Game 1', 'recall', '5060') --| Sets the Multi View
call('MVPRESETS.Game 2', 'recall', '5061') --|
set('SCENES.Normal.Game 1.Layers.Game', 'sourceA', 'SCENES.Valorant Game.Game')
set('SCENES.Normal.Game 2.Layers.Game', 'sourceA', 'BLACK')
set('SCENES.Normal.Game 3.Layers.Game', 'sourceA', 'BLACK')

valorantMV()

if get('GFXSCENES.Control.PlayerMV', 'value') >= 1 then -- Deactivate the any MV togglers if they are on
    call('MACROS.Valorant R4 Macros.MV', 'play')
end

call('GFXSCENES.Valorant.USC', 'reset')     --| Reset the score
call('GFXSCENES.Valorant.Visitor', 'reset') --|

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', 'SCENES.Valorant Game.Draft')

--faceCams()

set('CP2', 'clip', 'MEDIA/clips/Common/Flag.mp4')
call('CP2', 'play')

set('AP1', 'playlist', '1000333579,1000333580,1000333581,1000333582,1000333583,1000333584,1000333585,1000333586,1000333587,1000333588,1000333589,1000333590,')
set('AP1', 'playlist_idx', '5')
call('AP1', 'load_clip', '1000333583')
call('AP1', 'play')
set('AP1', 'repeat_playlist', '1')

set('AP2', 'clip', '0')
set('AP2', 'playlist', '')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
