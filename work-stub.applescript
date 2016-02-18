on alfred_script(q)

    -- A list of apps to quit when switching to this state
    set appsToQuit to {"Messages", "Slack"}
    
    -- A list of apps to close windows (not quit) when switching to this state
    set appsToCloseWindows to {"Mail"}

    -- A list of apps to start when switching to this state
    set appsToLaunch to {}
    
    -- A list of URL prefixes to close (assumes Google Chrome is browser)
    set urlsToClose to {"https://www.fastmail.com/"}

    if not dnd_is_enabled() then
        enable_dnd()
    end if

    repeat with i from 1 to the count of appsToQuit
        tell application (item i of appsToQuit) to quit
    end repeat

    repeat with i from 1 to the count of appsToCloseWindows
        tell application (item i of appsToCloseWindows) to close every window
    end repeat

    tell application "Google Chrome"
        repeat with thisWindow in windows
            repeat with thisTab in tabs of thisWindow
                repeat with thisUrl in urlsToClose
                    if URL of thisTab starts with thisUrl then
                        tell thisTab to close
                    end if
                end repeat
            end repeat
        end repeat
    end tell

    repeat with i from 1 to the count of appsToLaunch
        tell application (item i of appsToLaunch)
            -- This will launch app if not open, and sometimes open main window
            activate
            -- This will open main window as if you clicked on dock icon.
            -- Some apps choose not to do this simply on "activate"
            reopen
        end tell
    end repeat

end alfred_script
