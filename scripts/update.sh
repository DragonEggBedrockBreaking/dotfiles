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
sdk list java | rg tem | rg ' 8'
sdk list java | rg 'fx\-zulu' | rg 17
sdk list java | rg 'graal ' | rg 21
