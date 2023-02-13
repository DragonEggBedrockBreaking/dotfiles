#!/bin/bash

paru -Syu                 # updates packages with paru
paru -Qdtq | paru -Rcns - # removes orphaned packages with paru

rustup upgrade                            # update rust

source "$HOME/.sdkman/bin/sdkman-init.sh" # start sdkman
sdk update                                # update sdkman cache
sdk selfupdate                            # update sdkman
sdk list java | rg amzn | rg "17\."           # List java versions

nvim -c ":PackerSync" # update neovim plugins
