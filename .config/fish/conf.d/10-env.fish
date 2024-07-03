#!/bin/fish

set -x SHELL (command -s fish)
set -x EDITOR (command -s nvim)

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_RUNTIME_DIR "/run/user/$(id -u)"

set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x GOPATH "$XDG_DATA_HOME/go"
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"

set -x DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -x WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -x MAKEOPTS "--jobs $(nproc)"

set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

