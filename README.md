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

### WSL (Debian)

This section is based on [this article](https://www.thetestspecimen.com/posts/wsl2-yubikey/).

- Install [Gpg4win](https://www.gpg4win.org)
- Install wsl2-ssh-pageant:
  ```sh
  sudo apt install socat
  mkdir ~/.ssh
  wget https://github.com/BlackReloaded/wsl2-ssh-pageant/releases/download/v1.3.0/wsl2-ssh-pageant.exe -O ~/.ssh/wsl2-ssh-pageant.exe
  chmod +x ~/.ssh/wsl2-ssh-pageant.exe
  ```
- Create `~/.config/fish/conf.d/40-wsl.fish` with the contents below:
  ```fish
  set -x SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
  if ss -a | grep -q $SSH_AUTH_SOCK
    # Do nothing
  else
    rm -f $SSH_AUTH_SOCK
    setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$HOME/.ssh/wsl2-ssh-pageant.exe &>/dev/null &
  end

  set -x GPG_AGENT_SOCK "$GNUPGHOME/S.gpg-agent"
  if ss -a | grep -q $GPG_AGENT_SOCK
    # Do nothing
  else
    rm -rf $GPG_AGENT_SOCK
    setsid nohup socat UNIX-LISTEN:$GPG_AGENT_SOCK,fork EXEC:"$HOME/.ssh/wsl2-ssh-pageant.exe --gpg S.gpg-agent" &>/dev/null &
  end

  fish_add_path "/mnt/c/Program Files (x86)/GnuPG/bin/"
  alias wsl="wsl.exe"
  alias gpg="gpg.exe"
  ```
- Update the system-wide git configuration to use the correct GPG program:
  `sudo git config --system gpg.program "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe"`
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

