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

# Browser
echo "Configuring firedragon browser..."
firedragon &>/dev/null &
sleep 1
killall -q firedragon
python update_prefsjs.py

# Setup other configs (starship, helix)
echo "Configuring starship shell prompt..."
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
echo "Configuring helix editor..."
mkdir ~/.config/helix
ln -sv $HOME/dotfiles/helix/config.toml $HOME/.config/helix/
ln -sv $HOME/dotfiles/helix/languages.toml $HOME/.config/helix/
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Change shell
echo "Changing shell..."
chsh -s /usr/bin/zsh

# Final message
echo "Most things installed, please install browser addons manually. First, your computer will restart in 10 seconds. Press C-c to cancel and reboot later."
sleep 10s
reboot
