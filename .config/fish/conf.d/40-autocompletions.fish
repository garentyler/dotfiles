#!/bin/fish

if command -s thefuck > /dev/null
    thefuck --alias | source
end

if command -s starship > /dev/null
    starship init fish | source
end

