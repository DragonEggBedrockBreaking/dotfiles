#!/bin/bash

update --skip-mirrorlist --aur # updates packages with pacman + paru, using garuda so that extra steps are completed (e.g. update grub after it updates)
paru -Qdtq | paru -Rcns - # removes orphaned packages with paru
rustup upgrade # update rust
