-- Macro Definition:

macro = 6

-------------------------------------------------------------------------------------------
-- Import/Run Arrays + Functionality Variables + Functions + Main Script:

local draftCode = get('GFXSCENES.Valorant.playerCode', 'text')
local loadFunction, err = load(draftCode)
if loadFunction then
    loadFunction() -- Executes the code and defines the snapshotSelector function
else
    print("Error loading snapshotSelector:", err)
end

-- This code was written by Lawrance Zhenyu Lui
