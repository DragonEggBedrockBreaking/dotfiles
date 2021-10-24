# ZSH CONFIG
export ZSH="~/.oh-my-zsh" # path to oh-my-zsh

pfetch # run as header
ZSH_THEME="daveverwer" # zsh theme
#ZSH_THEME="bira" # another nice theme
CASE_SENSITIVE="false" # case insensitive
HYPHEN_INSENSITIVE="true" # hyphen insensitive
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
unsetopt beep # don't beep

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true" # command autocorrection
HIST_STAMPS="yyyy/mm/dd" # fix date-time

# Plugins
plugins=(cargo colored-man-pages colorize copydir copyfile gitfast gitignore git-prompt pip vi-mode zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Export stuff
export PATH=$PATH:/opt/gradle/gradle-7.3-rc-2/bin
export LANG=en_GB.UTF-8 # set language
export EDITOR='nvim' # set editor

# Aliases for commands
alias bat='bat --force-colorization --theme ansi'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias exalong='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias exatree='exa --tree --level=2 --colour=auto'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias rg='rg -uuupj 4'

# Aliases for software
alias nqq='flatpak run com.notepadqq.Notepadqq'
