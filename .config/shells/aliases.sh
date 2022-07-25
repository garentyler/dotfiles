#/bin/sh

alias ls='ls -CF'
alias ll='ls -AlFh'
alias l='ll'
alias cp='cp -R'
alias scp='scp -r'
alias rm='rm -rf'
alias mkdir='mkdir -pv'
alias celar='clear'
alias touchbar='sudo killall TouchBarServer'
alias cloc='git ls-files | xargs wc -l' # Count lines of code = CLOC
alias qemu='qemu-system-x86_64'
alias restart='reboot'
alias code='open -a "Visual Studio Code"'
alias quit='exit'
alias fucking='sudo'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn"'
eval $(thefuck --alias)
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

