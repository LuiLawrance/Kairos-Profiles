-- Functionality Variables

macro = 'Abyss'

-------------------------------------------------------------------------------------------
-- Import/Run Arrays + Functionality Variables + Functions + Main Script:

local draftCode = get('GFXSCENES.Valorant.mapCode', 'text')
local loadFunction, err = load(draftCode)
if loadFunction then
    loadFunction() -- Executes the code and defines the snapshotSelector function
else
    print("Error loading snapshotSelector:", err)
end

-- This code was written by Lawrance Zhenyu Lui
