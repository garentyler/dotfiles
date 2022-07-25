#!/bin/sh

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export VISUAL="vim"
export SUDO_EDITOR="$VISUAL"
export EDITOR="$VISUAL"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/libpq/lib -L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/llvm/include -I/opt/homebrew/opt/libpq/include -I/opt/homebrew/opt/mysql-client/include"
export OPENSSL_DIR="/opt/homebrew/opt/openssl@3"
export PYTHON="/opt/homebrew/bin/python3"
export CC_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-cc
export CXX_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-c++
export AR_x86_64_unknown_linux_musl=x86_64-unknown-linux-musl-ar
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=x86_64-unknown-linux-musl-ld
export BUN_INSTALL="$XDG_CONFIG_HOME/bun"
export LANG="en_US.UTF-8"
export GVIMINIT='let $MYGVIMRC="$XDG_CONFIG_HOME/vim/gvimrc" | source $MYGVIMRC'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

