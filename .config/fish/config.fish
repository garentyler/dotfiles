if status is-interactive
    # Commands to run in interactive sessions can go here
    thefuck --alias | source
    starship init fish | source

    if test -z $TMUX
        exec tmux
    end
end

function fish_greeting
end

