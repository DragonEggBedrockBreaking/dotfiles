# ZSH CONFIG
export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh

ZSH_THEME="daveverwer" # zsh theme
CASE_SENSITIVE="false"             # case insensitive
HYPHEN_INSENSITIVE="true"          # hyphen insensitive
zstyle ':omz:update' mode reminder # just remind me to update when it's time
unsetopt beep                      # don't beep

ENABLE_CORRECTION="true" # command autocorrection
HIST_STAMPS="yyyy/mm/dd" # fix date-time

# Plugins
plugins=(autopep8 colored-man-pages colorize fd git git-prompt pylint ripgrep rust sudo vi-mode zoxide zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Export general stuff
export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin
export LANG=en_GB.UTF-8     # set language
export LANGUAGE=en_GB.UTF-8 # set language
export EDITOR='nvim'        # set editor

# Aliases for utility commands
alias bat='bat --force-colorization --theme ansi'
alias btm='btm -Smkg'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias exalong='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias rg='rg -uuupj 4'
alias rsfetch='rsfetch -Pdeklrstuw'
alias tokei='tokei --hidden --no-ignore'
alias tree-rs='tree-rs -aC'

# Aliases for build systems
alias brachyura='java -jar brachyura-bootstrap-0.jar'

# Aliases for software
alias mmc='QT_QPA_PLATFORM=xcb mesa_glthread=false ~/Downloads/MultiMC/MultiMC'
alias mmmc='QT_QPA_PLATFORM=xcb mesa_glthread=true ~/Downloads/MultiMC/MultiMC'
alias onlyoffice='onlyoffice-desktopeditors'
alias resolve='/opt/resolve/bin/resolve'

alias run='QT_QPA_PLATFORM=xcb'

# Run as header
rsfetch
