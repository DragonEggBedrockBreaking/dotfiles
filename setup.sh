#!/bin/bash
if !which paru >/dev/null; then
    echo "Installing paru"
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

if !grep -Fxq "chaotic-aur" /etc/pacman.conf; then
    echo "Setting up chaotic-aur"
    pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
    pacman-key -lsign-key FBA220DFC880C036
    sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
fi

echo "Setting up pacman"
sudo rm /etc/pacman.conf
sudo cp ./pacman/pacman.conf /etc/

echo "Updating system"
paru -Syu --noconfirm

echo "Installing Pacman Packages"
paru -S --needed --noconfirm - < ./packages/pacman.list

echo "Setting up dameons"
sudo systemctl disable - < ./packages/systemctl_disable.list
sudo systemctl enable --now - < ./packages/systemctl_enable.list

echo "Installing Flatpak Packages"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub --user - < ./packages/flatpak_flathub.list
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flathub install flathub-beta --user - < ./packages/flatpak_flathub_beta.list

echo "Installing Cargo and Cargo Packages"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install - < ./packages/cargo.list

echo "Install Sdkman and Sdkman Packages"
curl -s "https://get.sdkman.io" | bash
source $HOME/.sdkman/bin/sdkman-init.sh
sdk install - < ./packages/sdk.list

echo "Installing Npm packages"
npm install - < ./packages/npm.list

echo "Installing Pip and Pip Packages"
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install -y - < ./packages/pip.list

echo "Installing VisualStudioCode Extensions"
code --install-extension < ./packages/vscode_extensions.list

echo "Installing oh-my-zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Downloading wallpaper"
curl -L 'https://images.pexels.com/photos/3647545/pexels-photo-3647545.jpeg?cs=srgb&dl=pexels-greg-galas-3647545.jpg&fm=jpg' -o '/usr/share/budgie/pexels-greg-galas-3647545-min.jpg'

echo "Setting up dotfiles"
sudo rm /etc/lightdm/lightdm.conf /etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp ./lightdm/* /etc/lightdm/
sudo cp ./networkmanager/* /etc/networkmanager/conf.d/
mkdir -p ~/.config/
rm -rf ~/.config/nushell/
mkdir -p ~/.config/nushell/
ln -sv ./nushell/env.nu ~/.config/nushell/env.nu
ln -sv ./nushell/config.nu ~/.config/nushell/config.nu
rm ~/.config/starship.toml
ln -sv ./starship/starship.toml ~/.config/starship.toml
rm -rf ~/.config/vifm/
mkdir ~/.config/vifm/
ln -sv ./vifm/vifmrc ~/.config/vifm/vifmrc
ln -sv ./vifm/scripts/ ~/.config/vifm/scripts/
rm -rf ~/.config/wezterm/
ln -sv ./wezterm/ ~/.config/wezterm/
rm ~/.zshrc
ln -sv ./zsh/.zshrc ~/.zshrc
rm -rf ~/.config/nvim/
mkdir ~/.config/nvim/
ln -sv ./nvim/init.lua ~/.config/nvim/init.lua
echo "Please type ':qa!' and then enter once packer.nvim finishes."
nvim -c ":PackerSync"
dconf load / < ./budgie/budgie-settings

echo "Making configurations work in root (editing /etc/sudoers)"
sudo bash -c 'echo "Defaults !always_set_home, !set_home" >> /etc/sudoers'
sudo bash -c 'echo "Defaults env_keep+=HOME" >> /etc/sudoers'

echo "Changing shell"
chsh -s /usr/bin/nu

echo "Setup complete!"
echo "Rebooting in 5 seconds..."
sleep 1
echo "Rebooting in 4 seconds..."
sleep 1
echo "Rebooting in 3 seconds..."
sleep 1
echo "Rebooting in 2 seconds..."
sleep 1
echo "Rebooting in 1 second..."
sleep 1
reboot
