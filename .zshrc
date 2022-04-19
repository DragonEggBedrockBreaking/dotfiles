# ZSH CONFIG
export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh

ZSH_THEME="daveverwer"             # zsh theme
CASE_SENSITIVE="false"             # case insensitive
HYPHEN_INSENSITIVE="true"          # hyphen insensitive
zstyle ':omz:update' mode reminder # just remind me to update when it's time
unsetopt beep                      # don't beep

ENABLE_CORRECTION="true" # command autocorrection
HIST_STAMPS="yyyy/mm/dd" # fix date-time

# Plugins
plugins=(git-prompt vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
