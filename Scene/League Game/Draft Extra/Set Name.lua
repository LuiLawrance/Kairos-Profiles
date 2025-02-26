-- Functionality Variables

local gfxPlayerArray = 'GFXSCENES.League.Players'

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function setArray()
    local P1 = get('GFXSCENES.League.Home P1', 'text')
    local P2 = get('GFXSCENES.League.Home P2', 'text')
    local P3 = get('GFXSCENES.League.Home P3', 'text')
    local P4 = get('GFXSCENES.League.Home P4', 'text')
    local P5 = get('GFXSCENES.League.Home P5', 'text')
    local P6 = get('GFXSCENES.League.Visitor P1', 'text')
    local P7 = get('GFXSCENES.League.Visitor P2', 'text')
    local P8 = get('GFXSCENES.League.Visitor P3', 'text')
    local P9 = get('GFXSCENES.League.Visitor P4', 'text')
    local P10 = get('GFXSCENES.League.Visitor P5', 'text')

    local text = string.format("{%q, %q, %q, %q, %q, %q, %q, %q, %q, %q}", P1, P2, P3, P4, P5, P6, P7, P8, P9, P10)
    set(gfxPlayerArray, 'text', text)
    --print(text)
end

-------------------------------------------------------------------------------------------
-- Main Script

setArray()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
