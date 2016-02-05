on alfred_script(q)

    -- A list of apps to quit when switching to this state
    set appsToQuit to {"Messages", "Textual 5", "Slack"}

    -- A list of apps to start when switching to this state
    set appsToLaunch to {}

    if not dnd_is_enabled() then
        enable_dnd()
    end if

    repeat with i from 1 to the count of appsToQuit
        tell application (item i of appsToQuit) to quit
    end repeat

    repeat with i from 1 to the count of appsToLaunch
        tell application (item i of appsToLaunch)
            -- This will launch app if not open, and sometimes open main window
            activate
            -- This will open main window as if you clicked on dock icon.
            -- Some apps choose not to do this simply on "activate"
            reopen
        end tell
    end repeat

    tell application "Google Chrome"
        repeat with thisWindow in windows
            repeat with thisTab in tabs of thisWindow
                if URL of thisTab starts with "https://www.fastmail.com/" then
                    tell thisTab to close
                end if
            end repeat
        end repeat
    end tell

    tell application "Mail" to close every window

end alfred_script
