-- Functionality Variables

local gfxCaps = 'GFXSCENES.Control.Caps'

local keyboardLocation = 'THIS_SCENE.Macros.'
local thisMacro = 'THIS_SCENE.Macros.Shift'

local caps = get(gfxCaps, 'value')

-------------------------------------------------------------------------------------------
-- Arrays

local lower = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
local upper = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}

-------------------------------------------------------------------------------------------
-- Functions

function changeColor()
    if caps == 1 then
        set(thisMacro, 'color', 'rgb(0,255,0)')
    else
        set(thisMacro, 'color', 'rgb(255,0,0)')
    end
end

function renameMacros()
    if caps == 1 then
        for i = 1, #upper do
            set(keyboardLocation .. lower[i], 'name', upper[i])
            wait_milliseconds(10)
        end
    else
        for i = 1, #lower do
            set(keyboardLocation .. upper[i], 'name', lower[i])
            wait_milliseconds(10)
        end
    end
end

function setGFX()
    if caps == 1 then
        set(gfxCaps, 'value', 0)
    else
        set(gfxCaps, 'value', 1)
    end
end

-------------------------------------------------------------------------------------------
-- Main Script

setGFX()
changeColor()
renameMacros()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
