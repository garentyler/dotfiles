# Dotfiles

I use [Fish](https://fishshell.com) for my shell and [Starship](https://starship.rs) for theming.
My editor is [Neovim](https://neovim.io) and I use [Packer](https://github.com/wbthomason/packer.nvim) to manage plugins.

## Installing dotfiles

```sh
# Configure the alias for the current shell.
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Prevent recursion problems.
echo ".cfg" >> .gitignore

# Clone the repository.
git clone --bare git@github.com:garentyler/dotfiles.git $HOME/.cfg

# Discard local changes.
# This will overwrite files, just make a backup if you're worried about that.
config reset --hard

# Load the contents of the repository.
config checkout

# Ignore untracked files.
config config --local status.showUntrackedFiles no

# Open nvim and run :PackerSync to sync plugins.
```

## Installing from scratch

### macOS

- Install Xcode tools: `xcode-select --install`
- Install Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install Homebrew packages: `brew install cmake gcc llvm make neofetch node speedtest-cli thefuck wget youtube-dl htop fish`
- Install Rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Install Rust packages: `cargo install exa ripgrep`
- Install the dotfiles

### Gentoo

- Install Git: `emerge dev-vcs/git`
- Install Rust: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Install Rust packages: `cargo install exa ripgrep`
- Install the dotfiles

## Colors

My terminal and theme colors are based on Atom's perfect One Dark theme.

- Normal
  - Black: #000000
  - Red: #be5046
  - Green: #50a14f
  - Yellow: #c18401
  - Blue: #4078f2
  - Magenta: #a626a4
  - Cyan: #0184bc
  - White: #e7e9e1
- Bright
  - Black: #676767
  - Red: #e06c75
  - Green: #98c379
  - Yellow: #e5c07b
  - Blue: #528bff
  - Magenta: #c678dd
  - Cyan: #56b6c2
  - White: #fffefe

