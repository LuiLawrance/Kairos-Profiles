-- Functionality Variables

local macroLower = 'i'
local macroUpper = 'I'

local gfxCaps = 'GFXSCENES.Control.Caps'
local gfxKeyboard = 'GFXSCENES.Control.Keyboard'
local gfxKeyboardSource = 'GFXSCENES.Control.Keyboard Source'

local keyboardSource = ''
local keyboardText = ''

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function button()
    Caps = get(gfxCaps, 'value')

    if Caps == 0 then
        keyboardText = keyboardText .. macroUpper
    else
        keyboardText = keyboardText .. macroLower
    end
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
