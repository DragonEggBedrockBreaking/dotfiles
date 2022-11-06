#!/bin/bash

paru -Syu                 # updates packages with paru
paru -Qdtq | paru -Rcns - # removes orphaned packages with paru

pip install -U $(pip list --outdated | awk 'NR>2 {print }' | xargs -n1) # update pip3 packages

rustup upgrade                            # update rust
cargo-install-update install-update --all # update cargo packages

source "$HOME/.sdkman/bin/sdkman-init.sh" # start sdkman
sdk update                                # update sdkman cache
sdk selfupdate                            # update sdkman
sdk list java | rg amzn | rg "17\."           # update java from sdkman

nvim -c ":PackerSync" # update neovim plugins

wget -nv https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts # download hosts file
sudo rm /etc/hosts                                                                                                 # remove old hosts file
sudo mv hosts /etc                                                                                                 # move new hosts file to its location
sudo systemctl restart NetworkManager                                                                              # restart network manager to apply changes
sed -n -e "6,8 p" -e "8 q" /etc/hosts                                                                              # give the user the date
