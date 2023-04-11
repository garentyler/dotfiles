if status is-interactive
    # Commands to run in interactive sessions can go here
    thefuck --alias | source
    starship init fish | source

    # Start hyprland if it's not already running.
    # if not pgrep -f Hyprland > /dev/null
    #     hyprland
    # end
end

function fish_greeting
end

