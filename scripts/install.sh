#!/bin/bash

# Install packages (assumes paru is installed)
echo "Updating and installing packages..."
yes | paru -Syu                                                           # Updates system packages
yes | paru -S <packages/paru.list                                         # Installes paru packages
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y # Installs rust

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

# Browser
echo "Configuring firedragon browser..."
firedragon &>/dev/null &
sleep 1
killall -q firedragon
python update_prefsjs.py

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
echo "Computer has been set up. Your computer will restart in 5 seconds. Press C-c to cancel and reboot later."
sleep 5s
reboot
