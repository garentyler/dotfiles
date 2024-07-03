#!/bin/fish

if command -s exa > /dev/null
  alias ls "exa --group-directories-first"
  alias ll "exa --all --long --group-directories-first"
else
  alias ls "ls --color=auto"
  alias ll "ls -lAgH --color=auto"
end

alias cp "cp -R"
alias scp "scp -r"
alias rm "rm -rf"
alias mkdir "mkdir -pv"
alias ncdu "ncdu --color dark"

# Config mapping
alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias wget "wget --hsts-file='$XDG_CACHE_HOME'/wget-hsts"
alias yarn "yarn --use-yarnrc '$XDG_CONFIG_HOME/yarn'"

# Convenience functions
alias touchbar "sudo killall TouchBarServer"
alias fucking "sudo"
alias :q "exit"
alias quit "exit"
alias vim "nvim"
if command -s Hyprland > /dev/null
  alias hyprland "exec dbus-launch --exit-with-session Hyprland"
end

# Typos
alias celar "clear"
alias sl "ls"

