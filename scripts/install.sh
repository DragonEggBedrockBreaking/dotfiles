#!/bin/bash

# Install packages (assumes paru is installed)
paru -Syu                                                        # Updates system packages
paru -S <packages/paru.list                                      # Installes paru packages
curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh # Installs rust

# Install zgenom, then setup zsh
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Install/setup ruby
curl -L get.rvm.io > rvm-install
zh ./rvm-install --auto-dotfiles
rvm install 3.2.2
zsh --login -c 'rvm use 3.2.2 --default'
source ~/.zshrc
gem install <packages/gem.list

# Setup other configs (starship, vifm)
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
mkdir ~/.config/helix
ln -sv $HOME/dotfiles/helix/config.toml $HOME/.config/helix/
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Final message
echo "Most things installed, please setup browser and IDEs manually"
