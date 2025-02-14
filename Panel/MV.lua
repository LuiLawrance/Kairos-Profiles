-- Functionality Variables

control = get('GFXSCENES.Control.MV', 'value')

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions



-------------------------------------------------------------------------------------------
-- Main Script

if control == 0 then
  set('GFXSCENES.Control.MV', 'value', 1)
  set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', '1305')
elseif control == 1 then
  set('GFXSCENES.Control.MV', 'value', 2)
  set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', '1306')
elseif control == 2 then
  set('GFXSCENES.Control.MV', 'value', 0)
  set('SCENES.Normal.LED Wall.Layers.Background', 'sourceA', '7774')
end

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
