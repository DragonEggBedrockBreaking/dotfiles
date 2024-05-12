#!/bin/bash

# Install most packages
echo "Installing packages..."
sudo add-apt-repository multiverse # apt repo
sudo dpkg --add-architecture i386 # 32-bit packages (steam)
sudo -E gpg --no-default-keyring --keyring=/usr/share/keyrings/javinator9889-ppa-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 08633B4AAAEB49FC
sudo tee /etc/apt/sources.list.d/javinator9889-ppa.list <<<"deb [arch=amd64 signed-by=/usr/share/keyrings/javinator9889-ppa-keyring.gpg] https://ppa.javinator9889.com all main"
sudo apt update                                                                     # sync ppa and repo stuff
sudo apt install $(cat packages/apt.list)                                           # apt packages
curl --proto '=https' --tlsv1.2 -sSf 'https://sh.rustup.rs' | sh -s -- -y           # rust
flatpak install $(cat packages/flatpak.list)                                        # flatpak (installed manually though gui in welcome app on first boot)
sudo snap install --classic nvim                                                    # out of date apt
sudo snap install --beta prettier                                                   # no apt; better than npm
sudo snap install scc                                                               # np apt
sudo snap install --classic --beta zig                                              # np apt
wget https://updates.safing.io/latest/linux_amd64/packages/portmaster-installer.deb # no apt/snap/flatpak - CONSTANT URL
sudo apt install ./*.deb                                                            # install .deb packages
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh          # no apt/snap - CONSTANT URL
chmod +x ./Miniconda3-latest-Linux-x86_64.sh                                        # make script executable
./Miniconda3-latest-Linux-x86_64.sh                                                 # run install script
rm *.sh *.deb                                                                       # cleanup of downloads
curl -s "https://get.sdkman.io" | bash                                              # install sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"                                           # setup sdkman
sdk install java 8.0.412-tem                                                        # used for older mc versions
sdk install java 21.0.3-graal                                                       # used for newer mc versions - default (latest lts)
sh -c "$(curl -fsSL https://starship.rs/install.sh)"                                # install starship.rs - don't build cargo, snap doesn't work properly

# Install fonts (unzip, move font files to ~/.fonts, rebuild font cache, cleanup) - VARIABLE URL
echo "Installing UbuntuMono nerd font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip
mkdir font-temp
mv UbuntuMono.zip font-temp
cd font-temp
unzip UbuntuMono.zip
mkdir ~/.fonts
mv *.ttf ~/.fonts
cd ..
rm -rf font-temp
fc-cache ~/.fonts

# Install zgenom, packer.nvim; symlink configs; change shell
echo "Configuring zsh..."
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
source "${HOME/.zgenom/zgenom.zsh}"
rm ~/.zshrc
ln -sv $HOME/dotfiles/zsh/.zshrc $HOME/
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Configuring neovim editor..."
mkdir ~/.config/nvim
ln -sv $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/
ln -sv $HOME/dotfiles/nvim/lua/ $HOME/.config/nvim/
echo "Configuring starship shell prompt..."
rm ~/.config/starship.toml
ln -sv $HOME/dotfiles/starship/starship.toml $HOME/.config/
echo "Adding update script..."
ln -sv $HOME/dotfiles/scripts/update.sh $HOME/
ln -sv $HOME/dotfiles/scripts/sdk_package_updates.py $HOME/
echo "Changing shell..."
chsh -s /usr/bin/zsh

# End
echo "Computer has been set up. Your computer will restart in 5 seconds; press C-c to cancel."
sleep 5s && reboot
