-- Arrays
local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()

-------------------------------------------------------------------------------------------

-- Functionality Variables
local desiredSources = {30, 31, 32, 33, 27, 28}
local desiredVolume = {0, 0, 0, 0, 0, 0}
local t = 50  -- Milliseconds to wait
local faceCam = get('GFXSCENES.Control.Face Cams', 'value')

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
        set('AUDIOMIXER.Channel ' .. i, 'volume', desiredVolume[i] / 100)
        set('MACROS.Main R2 Macros.' .. i .. ') ' .. sourceNames[sourceCurrent], 'name', i .. ') ' .. sourceNames[desiredSources[i]])
        set('GFXSCENES.Overwatch.Channel ' .. i, 'value', desiredVolume[i])
        wait_milliseconds(t)
    end
end

function faceCams()
    if faceCam == 1 then
        call('SCENES.Player POVs.Player 1.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 2.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 3.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 4.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 5.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 6.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 7.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 8.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 9.Snapshots.Overwatch', 'recall')
        call('SCENES.Player POVs.Player 10.Snapshots.Overwatch', 'recall')
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

function overwatchMV()
    wait_milliseconds(t)

    set('MV1.Inputs.4', 'source', 'SCENES.Overwatch Game.Game')
    set('MV1.Windows.4', 'audio_source', 'SCENES.Overwatch Game.Game')
    set('MV1.Inputs.6', 'source', 'SCENES.Overwatch Game.Media')
    set('MV1.Inputs.10', 'source', 'SCENES.Overwatch Game.LED Wall')
    set('MV1.Inputs.11', 'source', 'SCENES.Overwatch Game.Caster Desk')

    set('IP-AUX1', 'source', 'SCENES.Overwatch Game.LED Wall')
    set('IP-AUX2', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX3', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX4', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX5', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX6', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX7', 'source', 'SCENES.Overwatch Game.Caster Desk')
    set('MV2.Inputs.11', 'source', 'SCENES.Overwatch Game.Canvas')
end

-------------------------------------------------------------------------------------------
-- Main Script

set('RR8', 'clip', 'MEDIA/ramrec/Common/Stinger.rr')
call('RR8', 'begin')

wait_milliseconds(t)
set('GFXSCENES.Control.Game', 'value', 2)                          -- Set's it to 2 indicating Overwatch
set('SCENES.Main.Layers.Misc R1', 'sourceOptions', '1000077968,')
set('SCENES.Main.Layers.Misc R2', 'sourceOptions', '1000077969,')
set('SCENES.Main.Layers.Row 3', 'sourceOptions', '1000077971,')
set('SCENES.Main.Layers.Row 4', 'sourceOptions', '1000077973,')
set('SCENES.Main.Layers.Background', 'sourceOptions', '1000065377,')

set('SCENES.Main.Layers.Transition', 'state', 'On') -- Enable the Main scene's "Transition" layer

audioSet()
set('GFX1', 'scene', '1000078027')

call('MVPRESETS.Game 1', 'recall', '5060') --| Sets the Multi View
call('MVPRESETS.Game 2', 'recall', '5061') --|

overwatchMV()

if get('GFXSCENES.Control.PlayerMV', 'value') >= 1 then -- Deactivate the any MV togglers if they are on
    call('MACROS.Overwatch R4 Macros.MV', 'play')
end

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', '1000065348')

--faceCams()

set('AP1', 'playlist', '1000167600,1000167601,1000167602,1000167603,1000167604,1000167605,1000167606,1000167607,1000167608,1000167609,1000167610,1000167611,1000167612,1000167613,1000167614,1000167615,1000167616,1000167617,1000167618,1000167619,1000167620,1000167621,1000167622,1000167623,1000167624,1000167625,1000167626,1000167627,1000167628,1000167629,1000167630,1000167631,1000167632,1000167633,1000167634,1000167635,1000167636,1000167637,1000167638,1000167639,1000167640,1000167641,1000167642,1000167643,1000167644,1000167645,1000167646,1000167647,')
set('AP1', 'playlist_idx', '27')
call('AP1', 'load_clip', '1000167627')
call('AP1', 'play')
set('AP1', 'repeat_playlist', '1')
