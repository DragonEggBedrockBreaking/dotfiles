#!/bin/bash
echo "Insalling paru"
if !which paru >/dev/null; then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

echo "Installing Pacman Packages"
paru -S --needed --noconfirm budgie-clipboard-applet budgie-control-genter budgie-desktop budgie-extras budgie-screensaver budgie-screenshot-applet lightdm lightdm-webkit2-greeter ligthdm-webkit-theme-aether nushell nvim starship vifm wezterm zsh

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
cp ./nvim/init-pluginonly.lua ~/.config/nvim/init.lua
echo "Please type ':qa!' and then enter once packer.nvim finishes."
nvim -c ":PackerSync"
rm ~/.config/nvim/init.lua
ln -sv ./nvim/init.lua ~/.config/nvim/init.lua
dconf load / < ./budgie/budgie-settings

echo "Installing other programs"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install bat bottom dust exa fd melody procs ripgrep rsfetch tealdeer tokei tree-rs
curl -s "https://get.sdkman.io" | bash
sudo pacman -S flatpak perl-rename
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
cat pacman_list.txt

echo "Optional pacman packages"
cat flatpak_list.txt
read -r -p "Do you want to install the optional pacman packages listed above (y/n)? " input
case %input in
    [yY] [eE] [sS] | [yY])
        paru -Syu --needed --noconfirm - < ./pacman_list.txt
        ;;
    [nN] [oO] | [nN])
        echo "Okay, not installing pacman packages."
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

echo "Changing shell"
chsh -s /usr/bin/nu

echo "Setup complete! Please reboot."
