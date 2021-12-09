# ZSH CONFIG
export ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh

fastfetch              # run as header
ZSH_THEME="daveverwer" # zsh theme
#ZSH_THEME="bira" # another nice theme
CASE_SENSITIVE="false"             # case insensitive
HYPHEN_INSENSITIVE="true"          # hyphen insensitive
zstyle ':omz:update' mode reminder # just remind me to update when it's time
unsetopt beep                      # don't beep

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true" # command autocorrection
HIST_STAMPS="yyyy/mm/dd" # fix date-time

# Plugins
plugins=(cargo colored-man-pages colorize gitignore git-prompt vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Export general stuff
export PATH=$PATH:/opt/gradle/gradle-7.3-rc-3/bin:~/.local/bin:~/node_modules/.bin:~/bin:~/go/bin
export LANG=en_GB.UTF-8     # set language
export LANGUAGE=en_GB.UTF-8 # set language
export EDITOR='nvim'        # set editor

# Export for nnn file manager
export NNN_PLUG='j:autojump;b:bulknew;d:diffs;g:dragdrop;i:imgview;p:preview-tui;r:renamer;c:togglex' # all nnn plugins
export NNN_FCOLORS='0000150a0b09090d09d0d0dd'                                                         # char/block: black, dirs: red, execs: green, normal: yellow, links: red, other: orange
export NNN_FIFO="/tmp/nnn.fifo"                                                                       # sets a temp file for nnn

# Aliases for utility commands
alias bat='bat --force-colorization --theme ansi'
alias exa='exa -ah@ --colour=auto --icons --git --group-directories-first'
alias exalong='exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first'
alias exatree='exa --tree --level=2 --colour=auto'
alias fd='fd -uuij 4'
alias procs='procs --tree --color always'
alias rg='rg -uuupj 4'
alias tokei='tokei --hidden --no-ignore'

# Aliases for git
alias gstatus='git status'
alias gfetch='git fetch'
alias gpull='git pull'
alias gcheckout='git checkout'
alias gbranch='git branch'
alias gadd='git add .'
alias gcommit='git commit -m'
alias gcommitall='git commit -a -m'
alias gpush='git push'
alias gdiff='git diff'
alias gshow='git show'
alias glog='git log'
alias ginit='git init'
alias gclone='git clone'
alias gmerge='git merge'
alias greset='git reset'
alias gstatus='git status'
alias gcherrypick='git cherry-pick'

# Aliases for software
alias nqq='flatpak run com.notepadqq.Notepadqq'
alias mpv='flatpak run io.mpv.Mpv'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
