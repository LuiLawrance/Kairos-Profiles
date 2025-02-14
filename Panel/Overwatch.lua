-- Arrays

local sourceNamesString = get('GFXSCENES.Control.sourceNames', 'text')
local sourceNames = load("return " .. sourceNamesString)()
local sourceIndexString = get('GFXSCENES.Control.sourceIndex', 'text')
local sourceIndex = load("return " .. sourceIndexString)()

-------------------------------------------------------------------------------------------
-- Functionality Variables

local desiredSources = {30, 31, 32, 29, 27, 28}
--local desiredVolume = {0, 0, 0, 0, 0, 0}
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
        --set('AUDIOMIXER.Channel ' .. i, 'volume', desiredVolume[i] / 100)
        set('MACROS.Main R2 Macros.' .. i .. ') ' .. sourceNames[sourceCurrent], 'name', i .. ') ' .. sourceNames[desiredSources[i]])
        --set('GFXSCENES.Overwatch.Channel ' .. i, 'value', desiredVolume[i])
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
    set('IP-AUX2', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX3', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX4', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX5', 'source', 'SCENES.Overwatch Game.Canvas')
    set('IP-AUX6', 'source', 'SCENES.Overwatch Game.Canvas')

    set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', 'SCENES.Overwatch Game.LED Wall')
    set('SCENES.Normal.Caster Desk.Layers.Background', 'sourceA', 'SCENES.Overwatch Game.Caster Desk')

    set('MV2.Inputs.11', 'source', 'SCENES.Overwatch Game.Canvas')
    wait_milliseconds(t)
    call('MVPRESETS.Game 2', 'store', '5061')
end

-------------------------------------------------------------------------------------------
-- Main Script

set('RR8', 'clip', 'MEDIA/ramrec/Common/Stinger.rr')
call('RR8', 'begin')

wait_milliseconds(t)
set('GFXSCENES.Control.Game', 'value', 2)                          -- Set's it to 2 indicating Overwatch
set('SCENES.Main.Layers.Misc R1', 'sourceOptions', '1000077968,')
set('SCENES.Main.Layers.Misc R2', 'sourceOptions', '1000077969,')
set('SCENES.Main.Layers.Row 1', 'sourceOptions', '1000348298,')
set('SCENES.Main.Layers.Row 2', 'sourceOptions', '1000348299,')
set('SCENES.Main.Layers.Row 3', 'sourceOptions', '1000077971,')
set('SCENES.Main.Layers.Row 4', 'sourceOptions', '1000077973,')
set('SCENES.Main.Layers.Background', 'sourceOptions', '1000065377,')

set('SCENES.Main.Layers.Transition', 'state', 'On') -- Enable the Main scene's "Transition" layer

audioSet()
set('GFX1', 'scene', '1000078027')

call('MVPRESETS.Game 1', 'recall', '5060') --| Sets the Multi View
call('MVPRESETS.Game 2', 'recall', '5061') --|
set('SCENES.Normal.Game 1.Layers.Game', 'sourceA', 'SCENES.Overwatch Game.Game 1')
set('SCENES.Normal.Game 2.Layers.Game', 'sourceA', 'SCENES.Overwatch Game.Game 2')
set('SCENES.Normal.Game 3.Layers.Game', 'sourceA', 'WHITE')

overwatchMV()

if get('GFXSCENES.Control.PlayerMV', 'value') >= 1 then -- Deactivate the any MV togglers if they are on
    call('MACROS.Overwatch R4 Macros.MV', 'play')
end

set('SCENES.Normal Config.Multipurpose.Layers.Multipurpose', 'sourceA', '1000065348')

--faceCams()

set('AP1', 'playlist', '1000278142,1000278143,1000278144,1000278145,1000278146,1000278147,1000278148,1000278149,1000278150,1000278151,1000278152,1000278153,1000278154,1000278155,1000278156,1000278157,1000278158,1000278159,1000278160,1000278161,1000278162,1000278163,1000278164,1000278165,1000278166,1000278167,1000278168,1000278169,1000278170,1000278171,1000278172,1000278173,1000278174,1000278175,1000278176,1000278177,1000278178,1000278179,1000278180,1000278181,1000278182,1000278183,1000278184,1000278185,1000278186,1000278187,1000278188,1000278189,')
set('AP1', 'playlist_idx', '27')
call('AP1', 'load_clip', '1000278168')
call('AP1', 'play')
set('AP1', 'repeat_playlist', '1')

set('AP2', 'clip', '0')
set('AP2', 'playlist', '')
