#!/bin/bash

sudo pacman -Syu
sudo pacman -S $(cat packages/pacman.list)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru -S $(cat packages/paru.list)

echo "Configuring zsh..."
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Configuring neovim editor..."
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/
echo "Configuring starship shell prompt..."
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/

echo "Changing shell..."
chsh -s /usr/bin/zsh
echo "Enabling login manager..."
sudo systemctl enable plasmalogin 
echo "Computer has been set up. Your computer will restart in 5 seconds; press C-c to cancel."
sleep 5s && reboot
