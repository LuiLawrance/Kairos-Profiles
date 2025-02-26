-- Functionality Variables

number = get('GFXSCENES.Control.Casters', 'value')

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

call('RR3', 'begin')
call('RR4', 'begin')
set('RR3', 'repeat', '0')
set('RR4', 'repeat', '0')

if number == 2 then 
    call('THIS_SCENE.Snapshots.League Caster 1', 'recall')
    set('GFXSCENES.Control.Casters', 'value', 1)
    set('THIS_SCENE.Macros.2 Caster', 'name', '1 Caster')
    set('THIS_SCENE.Macros.1 Caster', 'color', 'rgb(0,0,255)')
elseif number == 1 then
    call('THIS_SCENE.Snapshots.League Caster 2', 'recall')
    set('GFXSCENES.Control.Casters', 'value', 2)
    set('THIS_SCENE.Macros.1 Caster', 'name', '2 Caster')
    set('THIS_SCENE.Macros.2 Caster', 'color', 'rgb(0,255,0)')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
