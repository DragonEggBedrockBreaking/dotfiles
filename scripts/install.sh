#!/bin/bash

# Install packages (assumes paru is installed)
echo "Installing packages..."
sudo add-apt-repository multiverse                                                                  # apt repo
sudo apt install $(cat packages/apt.list)                                                           # apt packages
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y                           # rust
source $HOME/.cargo/env                                                                             # setup rust
cargo install $(cat packages/cargo.list)                                                            # cargo packages (rust)
sudo npm install -g $(cat packages/npm.list)                                                        # npm packages (nodejs)
flatpak install $(cat packages/flatpak.list)                                                        # flatpak (installed manually though gui in welcome app on first boot)
sudo snap install godot4-mono                                                                       # no apt/flatpak
sudo snap install nvim --classic                                                                    # apt out of date
wget https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-Ubuntu-23.04-amd64.deb # no apt/snap/flatpak - VARIABLE URL
wget https://updates.safing.io/latest/linux_amd64/packages/portmaster-installer.deb                 # no apt/snap/flatpak - CONSTANT URL
sudo apt install ./*.deb                                                                            # install .deb packages
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh                          # no apt/snap - CONSTANT URL
chmod +x ./Miniconda3-latest-linux-x86_64.sh                                                        # make script executable
./Miniconda3-latest-linux-x86_64.sh                                                                 # run install script
rm *.sh *.deb                                                                                       # cleanup of downloads
curl -s "https://get.sdkman.io" | bash                                                              # install sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"                                                           # setup sdkman
sdk install java 8.0.382-tem                                                                        # used for older mc versions
sdk install java 21-graal                                                                           # used for newer mc versions
sdk install java 17.0.8.fx-zulu                                                                     # used for general development - default (latest sdk)

# Install fonts (unzip, move font files to ~/.fonts, rebuild font cache, cleanup) - VARIABLE URL
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip
mkdir font-temp
mv UbuntuMono.zip font-temp
cd font-temp
unzip UbuntuMono.zip
mkdir ~/.fonts
mv *.ttf ~/.fonts
cd ..
rm -rf font-temp
fc-cache ~/.fonts

# Install zgenom, then setup zsh (create symlink to config)
echo "Configuring zsh..."
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/

# Install packer.nvim, then setup nvim (create symlinks to config)
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Configuring neovim editor..."
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/

# Setup other configs (starship, update script) using symlinks
echo "Configuring starship shell prompt..."
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
echo "Adding update script..."
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/

# Change shell to zsh
echo "Changing shell..."
chsh -s /usr/bin/zsh

# End
echo "Computer has been mostly set up. Your computer will restart in 5 seconds. Press C-c to cancel and reboot later."
sleep 5s && reboot
