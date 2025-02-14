-- Functionality Variables

t = 100

-------------------------------------------------------------------------------------------
-- Arrays



-------------------------------------------------------------------------------------------
-- Functions

function reloadInputs()
    set('IN_IP30', 'enabled', '0')
    set('IN_IP29', 'enabled', '0')
    set('IN_IP28', 'enabled', '0')
    set('IN_IP27', 'enabled', '0')
    wait_milliseconds(t)
    set('IN_IP30', 'enabled', '1')
    set('IN_IP29', 'enabled', '1')
    set('IN_IP28', 'enabled', '1')
    set('IN_IP27', 'enabled', '1')
end

-------------------------------------------------------------------------------------------
-- Main Script

reloadInputs()

-------------------------------------------------------------------------------------------

-- This was coded by Lawrance Zhenyu Lui
