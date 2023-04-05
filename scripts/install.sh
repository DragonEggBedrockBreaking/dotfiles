#!/bin/bash

# Install packages (assumes paru is installed)
paru -Syu                                                        # Updates system packages
paru -S <packages/paru.list                                      # Installes paru packages
curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh # Installs rust
curl -s "https://get.sdkman.io" | bash                           # Installs sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"                        # Gets ready for installing sdk packages
sdk i <packages/sdk.list                                         # Installs sdk packages

# Install packer.nvim, then setup nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/

# Install zgenom, then setup zsh
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Setup other configs (starship, vifm)
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Final message
echo "Most things installed, please setup browser and IDEs manually"
