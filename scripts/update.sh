#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt autoremove
rustup upgrade
sudo snap refresh
flatpak update

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk selfupdate
sdk update
python sdk_package_updates.py
