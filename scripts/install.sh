#!/bin/bash

# Install packages (assumes paru is installed)
yes | paru -Syu                                                           # Updates system packages
yes | paru -S <packages/paru.list                                         # Installes paru packages
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y # Installs rust

# Install zgenom, then setup zsh
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Setup other configs (starship, vifm)
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
mkdir ~/.config/helix
ln -sv $HOME/dotfiles/helix/config.toml $HOME/.config/helix/
ln -sv $HOME/dotfiles/helix/languages.toml $HOME/.config/helix/
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Change shell
chsh -s /usr/bin/zsh

# Final message
echo "Most things installed, please setup browser manually. First, your computer will restart in 10 seconds."
sleep 10s
reboot
