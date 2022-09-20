# Nushell Environment Config File

# Use starship prompt in nushell
let-env STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""

# Environmental variables that represent the state of the prompt
let-env PROMPT_INDICATOR = { "〉 " }
let-env PROMPT_INDICATOR_VI_INSERT = { ":  " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉 " }
let-env PROMPT_MULTILINE_INDICATOR = { ":::  " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | str collect (char esep) }
  }
}

# Directories to search for scripts when calling source or use
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# Personal environment variables
let-env PATH = ($env.PATH | prepend $'/usr/local/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/.cargo/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/.local/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/.sdkman/candidates/gradle/7.5/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/.sdkman/candidates/java/current/bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/.config/vifm/scripts')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/node_modules/.bin')
let-env PATH = ($env.PATH | prepend $'($env.HOME)/go/bin')
let-env LANG = 'en_GB.UTF-8'
let-env LANGUAGE = 'en_GB.UTF-8'
let-env EDITOR = 'nvim'
let-env GPG_TTY = (tty)
let-env mesa_glthread = true
#let-env CC = clang
#let-env CXX = clang++
let-env CC_LD = mold
let-env CXX_LD = mold

# Aliases for utility commands
alias bat = bat --force-colorization --theme ansi
alias btm = btm -Smkg
alias exa = exa -ah@ --colour=auto --icons --git --group-directories-first
alias lexa = exa -lah@ --colour=auto --icons --no-permissions --git --group-directories-first
alias fd = fd -uuij 4
alias procs = procs --tree --color always
alias ren = perl-rename -vV git
alias rg = rg -uuupj 4
alias rsfetch = rsfetch -Pdeklrstuw
alias tokei = tokei --hidden
alias tree-rs = tree-rs -aC

# Aliases for programming
alias brachyura = java -jar brachyura-bootstrap-0.jar
alias python = python3
alias pip = pip3

# Aliases for software
alias mmc = ~/Downloads/MultiMC/MultiMC
alias resolve = /opt/resolve/bin/resolve
alias notepadqq = flatpak run com.notepadqq.Notepadqq
alias obsidian = flatpak run md.obsidian.Obsidian
alias okular = flatpak run org.kde.okular
alias onlyoffice = flatpak run org.onlyoffice.desktopeditors
alias mpv = flatpak run io.mpv.Mpv
alias idea = flatpak run com.jetbrains.Intellij-IDEA-Community
alias vifm = ~/.config/vifm/scripts/vifmrun

# Git aliases (copied from ohmyzsh)
alias g = git

alias ga = git add
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gav = git add --verbose
alias gap = git apply
alias gapt = git apply --3way

alias gb = git branch
alias gba = git branch -a
alias gbd = git branch -d
alias gbD = git branch -D
alias gbl = git blame -b -w
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsr = git bisect reset
alias gbss = git bisect start

alias gc = git commit -v
alias gc! = git commit -v --amend
alias gcn! = git commit -v --no-edit --amend
alias gca = git commit -v -a
alias gca! = git commit -v -a --amend
alias gcan! = git commit -v -a --no-edit --amend
alias gcans! = git commit -v -a -s --no-edit --amend
alias gcam = git commit -a -m
alias gcsm = git commit -s -m
alias gcas = git commit -a -s
alias gcasm = git commit -a -s -m
alias gcb = git checkout -b
alias gcf = git config --list

alias gcl = git clone --recurse-submodules
alias gclean = git clean -id
alias gpristine = git reset --hard && git clean -dffx
alias gcm = git checkout $(git_main_branch)
alias gcd = git checkout $(git_develop_branch)
alias gcmsg = git commit -m
alias gco = git checkout
alias gcor = git checkout --recurse-submodules
alias gcount = git shortlog -sn
alias gcp = git cherry-pick
alias gcpa = git cherry-pick --abort
alias gcpc = git cherry-pick --continue
alias gcs = git commit -S
alias gcss = git commit -S -s
alias gcssm = git commit -S -s -m

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gdct = git describe --tags $(git rev-list --tags --max-count=1)
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdup = git diff @{upstream}
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfa = git fetch --all --prune --jobs=10
alias gfa = git fetch --all --prune
alias gfo = git fetch origin

alias gg = git gui citool
alias gga = git gui citool --amend

alias ggpur = ggu
alias ggpull = git pull origin "$(git_current_branch)"
alias ggpush = git push origin "$(git_current_branch)"

alias ggsup = git branch --set-upstream-to=origin/$(git_current_branch)
alias gpsup = git push --set-upstream origin $(git_current_branch)

alias ghh = git help

alias gignore = git update-index --assume-unchanged
alias git-svn-dcommit-push = git svn dcommit && git push github $(git_main_branch):svntrunk

alias gk = \gitk --all --branches &!
alias gke = \gitk --all $(git log -g --pretty=%h) &!

alias gl = git pull
alias glg = git log --stat
alias glgp = git log --stat -p
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glo = git log --oneline --decorate
alias glol = git log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset
alias glols = git log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --stat
alias glod = git log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset
alias glods = git log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset --date=short
alias glola = git log --graph --pretty = %Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset --all
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all
alias glp = _git_log_prettily

alias gm = git merge
alias gmom = git merge origin/$(git_main_branch)
alias gmtl = git mergetool --no-prompt
alias gmtlvim = git mergetool --no-prompt --tool=vimdiff
alias gmum = git merge upstream/$(git_main_branch)
alias gma = git merge --abort

alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease
alias gpf! = git push --force
alias gpoat = git push origin --all && git push origin --tags
alias gpr = git pull --rebase
alias gpu = git push upstream
alias gpv = git push -v

alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbd = git rebase $(git_develop_branch)
alias grbi = git rebase -i
alias grbm = git rebase $(git_main_branch)
alias grbom = git rebase origin/$(git_main_branch)
alias grbo = git rebase --onto
alias grbs = git rebase --skip
alias grev = git revert
alias grh = git reset
alias grhh = git reset --hard
alias groh = git reset origin/$(git_current_branch) --hard
alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grs = git restore
alias grset = git remote set-url
alias grss = git restore --source
alias grst = git restore --staged
alias grt = cd "$(git rev-parse --show-toplevel || echo .)"
alias gru = git reset --
alias grup = git remote update
alias grv = git remote -v

alias gsb = git status -sb
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status -s
alias gst = git status
alias gsta = git stash push
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --text
alias gstu = gsta --include-untracked
alias gstall = git stash --all
alias gsu = git submodule update
alias gsw = git switch
alias gswc = git switch -c
alias gswm = git switch $(git_main_branch)
alias gswd = git switch $(git_develop_branch)

alias gts = git tag -s

alias gunignore = git update-index --no-assume-unchanged
alias gup = git pull --rebase
alias gupv = git pull --rebase -v
alias gupa = git pull --rebase --autostash
alias gupav = git pull --rebase --autostash -v
alias glum = git pull upstream $(git_main_branch)

alias gwch = git whatchanged -p --abbrev-commit --pretty=medium

alias gam = git am
alias gamc = git am --continue
alias gams = git am --skip
alias gama = git am --abort
alias gamscp = git am --show-current-patch

# rsfetch
rsfetch

# zoxide
zoxide init nushell --hook prompt | save ~/.zoxide.nu
