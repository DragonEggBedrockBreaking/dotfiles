#!/bin/bash
echo "Insalling paru"
if !which paru >/dev/null; then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

echo "Updating system"
paru -Syu --noconfirm

echo "Installing Pacman Packages"
paru -S --needed --noconfirm - < ./packages/pacman_list_needed.list

echo "Setting up dameons"
sudo systemctl disable - < ./packages/systemctl_disable_needed.list
sudo systemctl enable --now - < ./packages/systemctl_enable_needed.list

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


echo "Optional pacman packages"
cat ./packages/pacman_list_optional.list
read -r -p "Do you want to install the optional pacman packages listed above (y/n)? " input
case %input in
    [yY] [eE] [sS] | [yY])
        paru -S --needed --noconfirm - < ./packages/pacman_list_optional.list
        sudo systemctl enable --now - < ./packages/systemctl_enable_optional.list
        ;;
    [nN] [oO] | [nN])
        echo "Okay, not installing pacman packages."
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

echo "Optional flatpaks"
cat ./packages/flatpak_list_names.list
read -r -p "Do you want to install the optional flatpaks listed above (y/n)? " finput
case %finput in
    [yY] [eE] [sS] | [yY])
        paru -S flatpak
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        flatpak install flathub --user - < ./packages/flatpak_list_flathub.list
        flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
        flathub install flathub-beta - < ./packages/flatpak_list_flathub_beta.list
        ;;
    [nN] [oO] | [nN])
        echo "Okay, not installing flatpaks."
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

echo "Optional cargo packages"
cat ./packages/cargo_list.list
read -r -p "Do you want to install the optional cargo packages listed above (y/n)? " cinput
case %fcnput in
    [yY] [eE] [sS] | [yY])
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        cargo install - < ./packages/cargo_list.list
        ;;
    [nN] [oO] | [nN])
        echo "Okay, not installing cargo packages."
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

echo "Optional sdkman packages"
cat ./packages/sdk_list.list
read -r -p "Do you want to install the optional sdkman packages listed above (y/n)? " cinput
case %fcnput in
    [yY] [eE] [sS] | [yY])
        curl -s "https://get.sdkman.io" | bash
        source $HOME/.sdkman/bin/sdkman-init.sh
        sdk install - < ./packages/sdk_list.list
        ;;
    [nN] [oO] | [nN])
        echo "Okay, not installing sdkman packages."
    *)
        echo "Invalid input..."
        exit 1
        ;;
esac

echo "Changing shell"
chsh -s /usr/bin/nu

echo "Setup complete! Please reboot."
