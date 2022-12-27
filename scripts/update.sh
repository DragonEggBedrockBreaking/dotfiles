#!/bin/bash

paru -Syu                 # updates packages with paru
paru -Qdtq | paru -Rcns - # removes orphaned packages with paru

rustup upgrade                            # update rust

source "$HOME/.sdkman/bin/sdkman-init.sh" # start sdkman
sdk update                                # update sdkman cache
sdk selfupdate                            # update sdkman
sdk list java | rg amzn | rg "17\."           # List java versions

nvim -c ":PackerSync" # update neovim plugins

wget -nv https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts # download hosts file
sudo rm /etc/hosts                                                                                                 # remove old hosts file
sudo mv hosts /etc                                                                                                 # move new hosts file to its location
sudo systemctl restart NetworkManager                                                                              # restart network manager to apply changes
sed -n -e "6,8 p" -e "8 q" /etc/hosts                                                                              # give the user the date
