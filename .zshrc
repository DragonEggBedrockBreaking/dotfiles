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
plugins=(autopep8 colored-man-pages colorize fd git git-prompt pylint ripgrep rust sudo vi-mode zoxide zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Export general stuff
export PATH=$PATH:~/.local/bin:~/bin:~/.cargo/bin
export LANG=en_GB.UTF-8     # set language
export LANGUAGE=en_GB.UTF-8 # set language
export EDITOR='nvim'        # set editor
export GPG_TTY=$(tty)       # gpg key stuff
export mesa_glthread=true

# Aliases for utility commands
alias bat='bat --force-colorization --theme ansi'
alias btm='btm -Smkg'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias exalong='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias ren='perl-rename -vV git'
alias rg='rg -uuupj 4'
alias rsfetch='rsfetch -Pdeklrstuw'
alias tokei='tokei --hidden'
alias tree-rs='tree-rs -aC'

# Aliases for build systems
alias brachyura='java -jar brachyura-bootstrap-0.jar'

# Aliases for software
alias mmc='~/Downloads/MultiMC/MultiMC'
alias resolve='/opt/resolve/bin/resolve'
alias notepadqq='flatpak run com.notepadqq.Notepadqq'
alias obsidian='flatpak run md.obsidian.Obsidian'
alias okular='flatpak run org.kde.okular'
alias onlyoffice='flatpak run org.onlyoffice.desktopeditors'
alias mpv='flatpak run io.mpv.Mpv'
alias vifm='~/.config/vifm/scripts/vifmrun'

# Other aliases
alias szrc='source ~/.zshrc'

# Run as header
rsfetch

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
