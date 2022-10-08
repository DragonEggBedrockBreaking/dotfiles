#!/bin/bash

# Install packages (assumes paru is installed)
paru -Syu                                                        # Updates system packages
paru -S <packages/paru.list                                      # Installes paru packages
flatpak install <packages/flatpak.list                           # Installs flatpak packages
curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh # Installs rust
source "$HOME/.cargo/env"                                        # Gets ready for installing cargo packages
cargo install <packages/cargo.list                               # Installs cargo packages
pip install <packages/pip.list                                   # Installs pip packages
curl -s "https://get.sdkman.io" | bash                           # Installs sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"                        # Gets ready for installing sdk packages
sdk i <packages/sdk.list                                         # Installs sdk packages

# Install packer.nvim, then setup nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/

# Install antigen, then setup zsh
curl -L git.io/antigen >~/antigen.zsh
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Setup other configs (starship, vifm)
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
rm -rf ~/.config/vifm
mkdir ~/.config/vifm
ln -sv $HOME/dotfiles/vifm/vifmrc $HOME/.config/vifm/
ln -sv $HOME/dotfiles/vifm/scripts/ $HOME/.config/vifm/

# Final message
echo "Most things installed, please setup browser and IntelliJ manually"
