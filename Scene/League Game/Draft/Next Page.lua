-- Arrays
local championsString = get('GFXSCENES.League.Champions', 'text')
local champions = load("return " .. championsString)()
local selectedIDs = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

-------------------------------------------------------------------------------------------
-- Functionality Variables
local buttonCount = 91 -- Total number of buttons to rename
local page = get('GFXSCENES.League.Draft Page', 'value')
local phase = get('GFXSCENES.League.Phase', 'value')

-------------------------------------------------------------------------------------------
-- Functions

local function updateSelectedIDs()
    for i = 1, 10 do
        selectedIDs[i] = get('GFXSCENES.League.B' .. i, 'value')
        selectedIDs[i + 10] = get('GFXSCENES.League.P' .. i, 'value')
    end
end

-- Function to set up page 1
local function page1()
    set('GFXSCENES.League.Draft Page', 'value', 1)
    set('SCENES.League Game.Draft.Macros.Next Page', 'color', 'rgb(255,0,255)')

    -- Loop to rename buttons to the first 91 elements of champions
    for i = 1, buttonCount do
        buttonName = i .. ") " .. champions[i]

        if i > (#champions - buttonCount) then
            oldName = "SCENES.League Game.Draft.Macros." .. (i + buttonCount) .. ")"
        else
            oldName = "SCENES.League Game.Draft.Macros." .. (i + buttonCount) .. ") " .. (champions[i + buttonCount])
        end

        updateSelectedIDs()

        if i == selectedIDs[1] or i == selectedIDs[2] or i == selectedIDs[3] or i == selectedIDs[4] or i == selectedIDs[5] or i == selectedIDs[6] or i == selectedIDs[7] or i == selectedIDs[8] or i == selectedIDs[9] or i == selectedIDs[10] or i == selectedIDs[11] or i == selectedIDs[12] or i == selectedIDs[13] or i == selectedIDs[14] or i == selectedIDs[15] or i == selectedIDs[16] or i == selectedIDs[17] or i == selectedIDs[18] or i == selectedIDs[19] or i == selectedIDs[20] then
            -- Insert any specific actions here if i matches selectedIDs[1] or selectedIDs[2]
            set(oldName, "color", 'rgb(255,0,0)') -- Example: Set color to green if match
        else
            set(oldName, "color", 'rgb(255,255,255)') -- Default color
        end

        --set(oldName, "color", 'rgb(255,255,255)')
        set(oldName, "name", buttonName)
    end
end

-- Function to set up page 2
local function page2()
    set('GFXSCENES.League.Draft Page', 'value', 2)
    set('SCENES.League Game.Draft.Macros.Next Page', 'color', 'rgb(85,255,255)')

    -- Loop to rename buttons to elements from 92nd onward in champions
    for i = 1, buttonCount do
        if i > (#champions - buttonCount) then
            buttonName = (i + buttonCount) .. ")"
        else
            buttonName = (i + buttonCount) .. ")" .. ((" " .. champions[i + buttonCount]) or "")
        end

-- This was coded by Lawrance Zhenyu Lui

        oldName = "SCENES.League Game.Draft.Macros." .. i .. ") " .. champions[i]

        updateSelectedIDs()
        i = i + 91

        if i == selectedIDs[1] or i == selectedIDs[2] or i == selectedIDs[3] or i == selectedIDs[4] or i == selectedIDs[5] or i == selectedIDs[6] or i == selectedIDs[7] or i == selectedIDs[8] or i == selectedIDs[9] or i == selectedIDs[10] or i == selectedIDs[11] or i == selectedIDs[12] or i == selectedIDs[13] or i == selectedIDs[14] or i == selectedIDs[15] or i == selectedIDs[16] or i == selectedIDs[17] or i == selectedIDs[18] or i == selectedIDs[19] or i == selectedIDs[20] then
            -- Insert any specific actions here if i matches selectedIDs[1] or selectedIDs[2]
            set(oldName, "color", 'rgb(255,0,0)') -- Example: Set color to green if match
        else
            set(oldName, "color", 'rgb(255,255,255)') -- Default color
        end

        --set(oldName, "color", 'rgb(255,255,255)')
        set(oldName, "name", buttonName)
    end
end

-- Function to change buttons based on the current page and phase
local function changeButtons()
    if phase == 21 then
        -- Logic for handling phases other than 21
        --set('GFXSCENES.League.Draft Page', 'value', 3)
    else
        if page == 1 then
            page2() -- Switch to page 2, renaming to champions from 92 onward
        elseif page == 2 then
            page1() -- Switch to page 1, renaming to first 91 champions
        end
    end
end

-------------------------------------------------------------------------------------------
-- Main Script
changeButtons()
