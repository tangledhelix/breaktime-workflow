on alfred_script(q)

    -- A list of apps to quit when switching to this state
    set appsToQuit to {}

    -- A list of apps to close windows (not quit) when switching to this state
    set appsToCloseWindows to {}

    -- A list of apps to start when switching to this state
    set appsToLaunch to {"Messages", "Slack"}

    -- A list of URL prefixes to close (assumes Google Chrome is browser)
    set urlsToClose to {}

    disable_dnd()
    quit_apps(appsToQuit)
    close_app_windows(appsToCloseWindows)
    close_google_chrome_tabs(urlsToClose)
    launch_apps(appsToLaunch)

end alfred_script
