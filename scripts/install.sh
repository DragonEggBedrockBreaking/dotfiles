#!/bin/bash

# Install packages (assumes paru is installed)
echo "Installing packages..."
sudo add-apt-repository multiverse
sudo apt install $(cat packages/apt.list)
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y
source $HOME/.cargo/env
cargo install $(cat packages/cargo.list)
sudo npm install -g $(cat packages/npm.list)
flatpak install $(cat packages/flatpak.list)
sudo snap install godot4-mono
sudo snap install nvim --classic
wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-23.04-amd64.deb
wget https://updates.safing.io/latest/linux_amd64/packages/portmaster-installer.deb
sudo apt install ./*.deb
rm *.deb
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ./Miniconda3-latest-linux-x86_64.sh
./Miniconda3-latest-linux-x86_64.sh
rm *.sh
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 8.0.382-tem
sdk install java 17.0.8.fx-zulu

# Install fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/UbuntuMono.zip
mkdir font-temp
mv UbuntuMono.zip font-temp
cd font-temp
unzip UbuntuMono.zip
mkdir ~/.fonts
mv *.ttf ~/.fonts
cd ..
rm -rf font-temp
fc-cache ~/.fonts

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
echo "Computer has been mostly set up. Your computer will restart in 5 seconds. Press C-c to cancel and reboot later."
sleep 5s && reboot
