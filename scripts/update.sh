#!/bin/bash

sudo apt update
sudo apt upgrade
sudo apt autoremove
rustup upgrade
cargo install-update -a
sudo npm update -g
sudo snap refresh
flatpak update
sdk selfupdate
sdk update
