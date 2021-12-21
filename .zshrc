# ZSH CONFIG
export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh

rsfetch -Pdeklrstuw    # run as header
ZSH_THEME="daveverwer" # zsh theme
CASE_SENSITIVE="false"             # case insensitive
HYPHEN_INSENSITIVE="true"          # hyphen insensitive
zstyle ':omz:update' mode reminder # just remind me to update when it's time
unsetopt beep                      # don't beep

ENABLE_CORRECTION="true" # command autocorrection
HIST_STAMPS="yyyy/mm/dd" # fix date-time

# Plugins
plugins=(autopep8 colored-man-pages colorize fd git gitignore git-prompt pylint ripgrep rust rustup sudo ufw vi-mode zoxide zsh-autosuggestions zsh-sdkman zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Export general stuff
export PATH=$PATH:/opt/gradle/gradle-7.3-rc-3/bin:~/.local/bin:~/node_modules/.bin:~/bin:~/go/bin:~/zls
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

# Aliases for software
alias nqq='flatpak run com.notepadqq.Notepadqq'
alias mpv='flatpak run io.mpv.Mpv'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
