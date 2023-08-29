#!/bin/bash

# Install packages (assumes paru is installed)
echo "Installing packages..."
sudo apt install <packages/apt.list
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y
source $HOME/.cargo/env
cargo install <packages/cargo.list
npm install <packages/npm.list
sudo snap install <packages/snap.list
flatpak install <packages/flatpak.list

# Install zgenom, then setup zsh
echo "Configuring zsh..."
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Install packer.nvim, then setup nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Configuring neovim editor..."
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/

# Setup other configs (starship, update script)
echo "Configuring starship shell prompt..."
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
echo "Adding update script..."
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Change shell
echo "Changing shell..."
chsh -s /usr/bin/zsh

# Final message
echo "Computer has been set up (some things may require manual intervention). Your computer will restart in 5 seconds. Press C-c to cancel and reboot later."
sleep 5s && reboot
