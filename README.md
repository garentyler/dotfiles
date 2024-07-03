# Dotfiles

I use [Fish](https://fishshell.com) for my shell and [Starship](https://starship.rs) for theming.
My editor is [Neovim](https://neovim.io) and I use an [AstroNvim](https//astronvim.com)-based configuration.

## Installing dotfiles

```sh
#!/usr/bin/fish
# Install required packages before installing the dotfiles.

# Configure the repo and install the dotfiles.
if test ! -d ~/.cfg
  echo "/.cfg" >> .gitignore
  git clone --bare https://github.com/garentyler/dotfiles.git $HOME/.cfg
  alias config "/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
  config reset --hard
  config checkout
  config config --local status.showUntrackedFiles no
end

# Load the new config
source ~/.config/fish/**/*.fish
rm -rf ~/.bash* ~/.zsh*

# Install the Rust toolchain.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y --no-modify-path -c rust-analyzer
cargo install exa starship ripgrep
rm -rf ~/.cargo ~/.rustup

# Update the Node.js installation to the latest LTS release.
sudo npm i -g n
sudo n lts

# Load my GPG public key and trust it.
mkdir $GNUPGHOME
chmod 700 $GNUPGHOME
echo "trusted-key A81D3172B96C09FCFD878697C632BE7F3470A10E" >> $GNUPGHOME/gpg.conf
curl https://keys.openpgp.org/vks/v1/by-fingerprint/A81D3172B96C09FCFD878697C632BE7F3470A10E | gpg --import

# Configure git.
git config --global user.name "Garen Tyler"
git config --global user.email "garentyler@garen.dev"
git config --global user.signingkey "A81D3172B96C09FCFD878697C632BE7F3470A10E"
git config --global commit.gpgsign true
```

## Installing packages

### macOS

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install cmake gcc llvm make neofetch node thefuck wget htop fish ncdu
```

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
- Update the system-wide git configuration to use the correct GPG program:
  `sudo git config --system gpg.program "/mnt/c/Program Files (x86)/GnuPG/bin/gpg.exe"`
- Install dependencies in Debian:
  ```sh
  sudo apt install gcc make cmake neofetch nodejs curl wget htop fish ncdu
  ```
- Install the dotfiles
