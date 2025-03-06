-- Functionality Variables

local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local keyboardSource = ''
local keyboardText = ''

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function getSource()
    keyboardSource = get(gfxKeyboardSource, 'text')
end

function setKeyboard(text)
    set(gfxKeyboard, 'text', text)
    set(keyboardSource, 'text', text)
end

-------------------------------------------------------------------------------------------
-- Main Script

getSource()
setKeyboard('')

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
