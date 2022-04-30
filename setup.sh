#!/bin/bash
echo "Installing Pacman Packages"
sudo pacman -S lightdm lightdm-webkit2-greeter ligthdm-webkit-theme-aether nushell nvim starship vifm wezterm zsh  

echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Setting up dotfiles"
sudo rm /etc/lightdm/lightdm.conf/etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp ./lightdm/* /etc/lightdm/
mkdir -p ~/.config/
rm -rf ~/.config/nushell/
cp -r ./nushell/ .config/
rm -rf ~/.config/starship/
cp -r ./starship/ .config/
rm -rf ~/.config/vifm/
cp -r ./vifm/ .config/
rm -rf ~/.config/wezterm/
cp -r ./wezterm/ .config/
rm ~/.zshrc
cp ./zsh/zshrc ~/.zshrc
rm -rf ~/.config/nvim/*
mkdir ~/.config/nvim/
cp ./nvim/init-pluginonly.lua ~/.config/nvim/init.lua
echo "Please type ':qa' and then enter once packer.nvim finishes."
nvim -c ":PackerSync"
rm ~/.config/nvim/init.lua
cp ./nvim/init.lua ~/.config/nvim/
chsh -s /usr/bin/nu

echo "Installing other programs"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install bat bottom exa fd procs ripgrep tokei tree-rs
sudo pacman -S flatpak perl-rename

echo "Setup complete! Please reboot."
