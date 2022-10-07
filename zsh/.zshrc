# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

# ZSH/OMZ config
ZSH_THEME="robbyrussell"                                               # the theme
HYPHEN_INSENSITIVE="true"                                              # hyphen insensitive
zstyle ':omz:update' mode reminder                                     # just remind me to update when it's time
ENABLE_CORRECTION="true"                                               # command autocorrect
plugins=(git sudo vi-mode zsh-autosuggestions zsh-syntax-highlighting) # plugin list
HISTFILE=~/.zsh_history                                                # where is the history file
HISTSIZE=1000000                                                       # how many things in history
SAVEHIST=1000000                                                       # how many things in history
setopt incappendhistory                                                # incrementally append things to history
unsetopt beep                                                          # no beep
bindkey -e                                                             # i forgor

# Oh my zsh
source $ZSH/oh-my-zsh.sh

# env vars
export LANG=en_GB.UTF-8
export EDITOR=nvim
export ARCHFLAGS="-arch x86_64"
export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:$HOME/.config/vifm/scripts"
export GPG_TTY=$(tty)
export mesa_glthread=true
export CC=clang
export CXX=clang++
export CC_LD=mold
export CXX_LD=mold

# Aliases
alias bat=bat --force-colorization --theme ansi
alias btm=btm -Smkg
alias exa=exa -ah@ --colour=auto --icons --git --group-directories-first
alias lexa=exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first
alias fd=fd -uuij 4
alias procs=procs --tree --color always
alias ren=perl-rename -vV git
alias rg=rg -uuupj 4
alias tokei=tokei --hidden
alias tree-rs=tree-rs -aC
alias brachyura=java -jar brachyura-bootstrap-0.jar
alias python=python3
alias pip=pip3
alias obsidian=flatpak run md.obsidian.Obsidian
alias vifm=~/.config/vifm/scripts/vifmrun

# afetch
afetch

# zoxide
eval "$(zoxide init zsh)"

# starship
eval "$(starship init zsh)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
