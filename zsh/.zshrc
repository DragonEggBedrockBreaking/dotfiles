# Antigen
source $HOME/antigen.zsh                         # set up antigen
antigen use oh-my-zsh                            # install omz
antigen bundle git                               # git plugin (omz)
antigen bundle sudo                              # sudo plugin (omz)
antigen bundle vi-mode                           # vi plugin (omz)
antigen bundle zsh-users/zsh-autosuggestions     # autosuggestion plugin (from repo)
antigen bundle zsh-users/zsh-syntax-highlighting # syntax highlighting plugin (from repo)
antigen apply                                    # apply all changes

# ZSH/OMZ config
HYPHEN_INSENSITIVE="true" # hyphen insensitive
ENABLE_CORRECTION="true"  # command autocorrect
HISTFILE=~/.zsh_history   # where is the history file
HISTSIZE=1000000          # how many things in history
SAVEHIST=1000000          # how many things in history
setopt incappendhistory   # incrementally append things to history
unsetopt beep             # no beep

# env vars
export LANG=en_GB.UTF-8   # some programs use it
export EDITOR=nvim        # some programs use it
export GPG_TTY=$(tty)     # needed for git commits
export mesa_glthread=true # speed up mesa games
export CC=clang           # meson+ninja uses clang for c
export CXX=clang++        # meson+ninja uses clang++ for c++
export CC_LD=mold         # meson+ninja uses mold as c linker
export CXX_LD=mold        # meson+ninja uses mold as c++ linker
export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:$HOME/.config/vifm/scripts"

# Aliases
alias bat='bat --force-colorization --theme ansi'
alias btm='btm -Smkg'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias lexa='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias rg='rg -uuupj 4'
alias tokei='tokei --hidden'
alias tree-rs='tree-rs -aC'
alias brachyura='java -jar brachyura-bootstrap-0.jar'
alias obsidian='flatpak run md.obsidian.Obsidian'
alias vifm='~/.config/vifm/scripts/vifmrun'

# other
afetch                            # shell header
eval "$(zoxide init zsh)"         # sets up zoxide (alternative to c)
eval "$(starship init zsh)"       # sets up starship (shell theme sort of thing)
export SDKMAN_DIR="$HOME/.sdkman" # sdkman package manager stuff
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
