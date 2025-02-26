-- Functionality Variables

local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local keyboardSource = ''
local keyboardText = ''

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function button()
    keyboardText = keyboardText:sub(1, -2)
end

function getKeyboard()
    keyboardText = get(gfxKeyboard, 'text')
end

function getSource()
    keyboardSource = get(gfxKeyboardSource, 'text')
end

function setKeyboard(text)
    set(gfxKeyboard, 'text', text)
    set(keyboardSource, 'text', text)
end

-------------------------------------------------------------------------------------------
-- Main Script

getKeyboard()
getSource()
button()
setKeyboard(keyboardText)

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
