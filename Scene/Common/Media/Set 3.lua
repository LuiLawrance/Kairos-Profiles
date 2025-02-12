-- Macro Definition:

match = 3

-------------------------------------------------------------------------------------------
-- Arrays

local logosCode = get('GFXSCENES.Control.universityLogos', 'text')
local loadFunction, err = load(logosCode)
if loadFunction then
    loadFunction() -- Executes the code and defines the snapshotSelector function
end

-------------------------------------------------------------------------------------------
-- Main Script

call('RR5', 'pause')
call('RR6', 'pause')


for i = 1, #logos do 
    set('MEDIA.ramrec.Common.Crawls.' .. logos[i] .. '&#46;rr', 'status', '0')
end

logoT1 = get('GFXSCENES.Control.Media T1 ' .. match, 'value') - 1
logoT2 = get('GFXSCENES.Control.Media T2 ' .. match, 'value') - 1
set('MEDIA.ramrec.Common.Crawls.' .. logos[logoT1] .. '&#46;rr', 'status', '1')
set('MEDIA.ramrec.Common.Crawls.' .. logos[logoT2] .. '&#46;rr', 'status', '1')
set('RR5', 'clip', 'MEDIA/ramrec/Common/Crawls/' .. logos[logoT1] .. '.rr')
set('RR6', 'clip', 'MEDIA/ramrec/Common/Crawls/' .. logos[logoT2] .. '.rr')

--print(logoT1)
--print(logoT2)
--print(logos[logoT1])
--print(logos[logoT2])

logoT1 = get('THIS_SCENE.Layers.Match ' .. match .. '.Team 1', 'sourceA')
logoT2 = get('THIS_SCENE.Layers.Match ' .. match .. '.Team 2', 'sourceA')
set('FXINPUTS.Common.Home Team', 'source', logoT1)
set('FXINPUTS.Common.Visitor Team', 'source', logoT2)

--set('RR1', 'clip', 'MEDIA/ramrec/Common/Crawls/Michigan State University.rr')
--set('RR5', 'clip', 'MEDIA/ramrec/Common/Crawls/Michigan State University.rr')
--set('MEDIA.ramrec.Common.Crawls.Boise State University&#46;rr', 'status', '0')

set('GFXSCENES.Control.Media Selection', 'value', match)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
