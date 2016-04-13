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
    if dnd_is_enabled() then
        change_dnd("Notification Center, Do Not Disturb enabled")
    end if
end disable_dnd

-- Turn Do Not Disturb on
on enable_dnd()
    if not dnd_is_enabled() then
        change_dnd("Notification Center")
    end if
end enable_dnd

-- Quit one or more apps
on quit_apps(appList)
    repeat with i from 1 to the count of appList
        tell application (item i of appList) to quit
    end repeat
end quit_apps

-- Launch one or more apps
on launch_apps(appList)
    repeat with i from 1 to the count of appList
        tell application (item i of appList)
            -- This will launch app if not open, and sometimes open main window
            activate
            -- This will open main window as if you clicked on dock icon.
            -- Some apps choose not to do this simply on "activate"
            reopen
        end tell
    end repeat
end launch_apps

-- Close all windows (but not quit) one or more apps
on close_app_windows(appList)
    repeat with i from 1 to the count of appList
        tell application (item i of appList) to close every window
    end repeat
end close_app_windows

-- Close tabs in Google Chrome, if open
on close_google_chrome_tabs(urlList)
    tell application "Google Chrome"
        repeat with thisWindow in windows
            repeat with thisTab in tabs of thisWindow
                repeat with thisUrl in urlList
                    if URL of thisTab starts with thisUrl then
                        tell thisTab to close
                    end if
                end repeat
            end repeat
        end repeat
    end tell
end close_google_chrome_tabs
