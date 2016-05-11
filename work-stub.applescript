on alfred_script(q)

    -- A list of apps to quit when switching to this state
    set appsToQuit to {"Slack"}

    -- A list of apps to close windows (not quit) when switching to this state
    set appsToCloseWindows to {"Mail", "Messages"}

    -- A list of apps to start when switching to this state
    set appsToLaunch to {}

    -- A list of URL prefixes to close (assumes Google Chrome is browser)
    set urlsToClose to {"https://www.fastmail.com/"}

    enable_dnd()
    quit_apps(appsToQuit)
    close_app_windows(appsToCloseWindows)
    close_google_chrome_tabs(urlsToClose)
    launch_apps(appsToLaunch)

end alfred_script
