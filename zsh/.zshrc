# zgenom
source "${HOME}/.zgenom/zgenom.zsh" # setup zgenom
zgenom autoupdate                   # auto update zgenom
if ! zgenom saved; then
	zgenom ohmyzsh                                     # oh my zsh
	zgenom ohmyzsh plugins/git                         # many git aliases
	zgenom ohmyzsh plugins/sudo                        # easy sudo toggle
	zgenom ohmyzsh plugins/vi-mode                     # vi keybinds
	zgenom load zsh-users/zsh-autosuggestions          # autosuggestions
	zgenom load zsh-users/zsh-syntax-highlighting      # syntax highlighting
	zgenom load zsh-users/zsh-history-substring-search # better history traversal
	zgenom load clarketm/zsh-completions               # more completions
	zgenom save                                        # save zgenom stuff
fi

# ZSH/OMZ config
HYPHEN_INSENSITIVE="true"                              # hyphen insensitive
ENABLE_CORRECTION="true"                               # command autocorrect
HISTFILE=~/.zsh_history                                # where is the history file
HISTSIZE=1000000                                       # how many things in history
SAVEHIST=1000000                                       # how many things in history
setopt incappendhistory                                # incrementally append things to history
unsetopt beep                                          # no beep
bindkey "$terminfo[kcuu1]" history-substring-search-up # better zsh history
bindkey "$terminfo[kcuu1]" history-substring-search-up # better zsh history

# env vars
export LANG=en_GB.UTF-8              # some programs use it
export EDITOR=nvim                   # some programs use it
export GPG_TTY=$(tty)                # needed for git commits
export CC=clang                      # use clang for c
export CXX=clang++                   # use clang++ for c++
export CC_LD=mold                    # use mold as c linker
export CXX_LD=mold                   # use mold as c++ linker
export SDKMAN_DIR="$HOME/.sdkman"    # sdkman package manager stuff
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # disable dotnet telemetry
export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.local/bin:$HOME/.config/vifm/scripts"

# aliases
alias bat='bat --force-colorization --theme ansi'
alias btm='btm -Smkg'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias lexa='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias texa='exa -Th@ --colour=auto --icons --no-permissions --git'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias rg='rg -uuupj 4'
alias tokei='tokei --hidden'
alias brachyura='java -jar brachyura-bootstrap-0.jar'
alias szrc='source $HOME/.zshrc'

# set up programs
eval "$(zoxide init zsh)"                                                                      # sets up zoxide (alternative to c)
eval "$(starship init zsh)"                                                                    # sets up starship (shell theme sort of thing)
eval "$(rbenv init - zsh)"                                                                     # sets up ruby
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"       # Sets up sdkman
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh # Sets up miniconda

# Other
afetch # shell header
