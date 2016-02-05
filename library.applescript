-- Determine whether a named app is running
on is_running(appName)
    tell application "System Events" to (name of processes) contains appName
end is_running

-- Determine whether Do Not Disturb is enabled in Notification Center
on dnd_is_enabled()
    tell application "System Events"
        tell application process "SystemUIServer"
            if exists menu bar item "Notification Center, Do Not Disturb enabled" of menu bar 2 then
                return true
            else
                return false
            end if
        end tell
    end tell
end dnd_is_enabled

-- Change state of Do Not Disturb
on change_dnd(itemLabel)
    tell application "System Events"
        tell application process "SystemUIServer"
            try
                key down option
                click menu bar item itemLabel of menu bar 2
                key up option
            on error
                key up option
            end try
        end tell
    end tell
end change_dnd

-- Turn Do Not Disturb off
on disable_dnd()
    change_dnd("Notification Center, Do Not Disturb enabled")
end disable_dnd

-- Turn Do Not Disturb on
on enable_dnd()
    change_dnd("Notification Center")
end enable_dnd
