
on alfred_script(q)
    
    -- A list of apps to quit when switching to this state
    set appsToQuit to {}
    
    -- A list of apps to start when switching to this state
    set appsToLaunch to {"Messages", "Textual 5"}
    
    if dnd_is_enabled() then
        disable_dnd()
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

end alfred_script
