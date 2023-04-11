#!/bin/bash

paru -Syu                 # updates packages with paru
paru -Qdtq | paru -Rcns - # removes orphaned packages with paru

rustup upgrade                            # update rust
