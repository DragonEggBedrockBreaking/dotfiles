#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt autoremove
rustup upgrade
cargo install-update -a
sudo npm update -g
sudo snap refresh
flatpak update
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk selfupdate
sdk update
