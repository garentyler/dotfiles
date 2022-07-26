# Dotfiles and packages

These are my dotfiles, with different branches for each configuration.
This readme also provides a convenient package list to install on a fresh machine.

I use [zsh](https://zsh.org/) for my shell with [starship](https://starship.rs/) for theming.

My editor of choice is [vim](https://vim.org/), and I use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

## Installing dotfiles

```zsh
# Configure the alias for the current shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Prevent recursion problems
echo ".cfg" >> .gitignore

# Clone the repository
git clone --bare https://github.com/garentyler/dotfiles $HOME/.cfg

# Discard local changes
# This will overwrite files, just make a backup if you're worried about that
config reset --hard

# Load the contents of the repository
config checkout

# Ignore untracked files
config config --local status.showUntrackedFiles no

# Install [Starship](https://starship.rs/)
# sudo must be configured to install this, doas-sudo-shim isn't sufficient
curl -sS https://starship.rs/install.sh | sh

# Update the current shell
# Must be running zsh
source .zshrc

# Vim's first run will need to install plugins
# Ignore the plugin error, that's what we're fixing right now
vim -c "PlugInstall" -c "qa\!"

# Install the ssh public key
cat .ssh/id_rsa.pub >> .ssh/authorized_keys && rm .ssh/id_rsa.pub

# Repeat all of these steps as root in /root to get the same configuration when using sudo/doas
```

## Installing packages

### macOS

- Install Xcode tools: `xcode-select --install`
- Install dotfiles as described above
- Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install packages: `brew install cmake cowsay ffmpeg gcc imagemagick llvm lynx make mongodb musl-cross neofetch node speedtest-cli sqlite sysbench thefuck wget youtube-dl zulu17 htop thefuck ripgrep mosh`
- Install [Rust](https://rust-lang.org/): `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Done!

### Alpine Linux

- Ensure that the `main`, `community`, and `testing` apk repositories are all enabled
- Install sudo and doas, running all of these commands as root:
  - Add the user to the `wheel` group: `adduser $(whoami) wheel`
    - You can change `$(whoami)` to whatever user you want
  - Install sudo:
    - `apk add sudo`
    - Run `visudo` and uncomment the line with `%wheel ALL=(ALL:ALL) ALL`
  - Install doas:
    - `apk add doas`
    - Edit `/etc/doas.d/doas.conf` and add `permit persist :wheel` on a new line
  - Log out and back in to enable the changes
- Install git: `sudo apk add git`
- Install dotfiles as described above
- Install packages: `sudo apk add vim sed curl wget htop mosh less mandoc man-pages ufw gcompat util-linux pciutils usbutils coreutils binutils binutils-doc findutils ripgrep iproute2 thefuck zsh zsh-doc libuser openjdk18 nodejs yarn npm build-base gcc abuild gcc-doc cmake cmake-doc extra-cmake-modules extra-cmake-modules-doc docker docker-compose`
- Change the user shell:
  - `sudo touch /etc/login.defs`
  - `sudo mkdir /etc/default`
  - `touch /etc/default/useradd`
  - `lchsh $(whoami)`
    - Change the shell to `/bin/zsh`.
    - You can change `$(whoami)` to whatever user you want
- Add services:
  - `sudo rc-update add ufw`
  - `sudo rc-service ufw start`
  - `sudo addgroup $(whoami) docker`
    - You can change `$(whoami)` to whatever user you want
  - `sudo rc-update add docker boot`
  - `sudo rc-service docker start`
- Install [Rust](https://rust-lang.org/): `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Done!

