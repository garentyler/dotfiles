# Dotfiles and packages

These are my dotfiles, with different branches for each configuration.
This readme also provides a convenient package list to install on a fresh machine.

I use [zsh](https://zsh.org/) for my shell with [starship](https://starship.rs/) for theming.

My editor of choice is [vim](https://vim.org/), and I use [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

## Installing dotfiles

- Configure the alias: `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
- Prevent recursion problems: `echo ".cfg" >> .gitignore`
- Clone the repository: `git clone --bare https://github.com/garentyler/dotfiles $HOME/.cfg`
- Checkout the contents: `config checkout`
  - This will overwrite files, just make a backup if you're worried about that
- Don't show untracked files: `config config --local status.showUntrackedFiles no`
- Vim's first run will need to install plugins (ignore the plugin error, that's what we're fixing): `vim -c "PlugInstall" -c "qa!"`
- Install the ssh public key: `cat .ssh/id_rsa.pub >> .ssh/authorized_keys && rm .ssh/id_rsa.pub`
- Repeat all of these steps as root in `/root` to get the same configuration when using `sudo`/`doas`
- Done!

## Installing packages

### macOS

- Install Xcode tools: `xcode-select --install`
- Install dotfiles as described above
- Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- Install packages: `brew install cmake cowsay ffmpeg gcc imagemagick llvm lynx make mongodb musl-cross neofetch node speedtest-cli sqlite sysbench thefuck wget youtube-dl zulu17 htop thefuck ripgrep mosh`
- Install [Rust](https://rust-lang.org/): `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Install [Starship](https://starship.rs/): `curl -sS https://starship.rs/install.sh | sh`
- Done!

### Alpine Linux

- Ensure that the `main`, `community`, and `testing` apk repositories are all enabled
- Install doas (or sudo):
  - Run all of these commands as root
  - `apk add doas doas-sudo-shim`
  - `adduser $(whoami) wheel`
    - You can change `$(whoami)` to whatever user you want
  - Edit `/etc/doas.d/doas.conf` and add `permit persist :wheel` on a new line
  - Log out and back in to enable the changes
- Install git: `doas apk add git`
- Install dotfiles as described above
- Install packages: `doas apk add sed curl wget htop mosh less mandoc man-pages ufw gcompat util-linux pciutils usbutils coreutils binutils binutils-doc findutils ripgrep iproute2 thefuck zsh zsh-doc libuser openjdk18 nodejs build-base gcc abuild gcc-doc cmake cmake-doc extra-cmake-modules extra-cmake-modules-doc docker`
- Change the user shell:
  - `doas touch /etc/login.defs`
  - `doas mkdir /etc/default`
  - `touch /etc/default/useradd`
  - `lchsh $(whoami)`
    - Change the shell to `/bin/zsh`.
    - You can change `$(whoami)` to whatever user you want
- Add services:
  - `doas rc-update add ufw`
  - `doas rc-service ufw start`
  - `doas addgroup $(whoami) docker`
    - You can change `$(whoami)` to whatever user you want
  - `doas rc-update add docker boot`
  - `doas rc-service docker start`
- Install [Rust](https://rust-lang.org/): `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
- Install [Starship](https://starship.rs/): `curl -sS https://starship.rs/install.sh | sh`
- Done!

