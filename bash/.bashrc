# Env vars
export CC=clang
export CXX=clang++
export CC_LD=mold
export CXX_LD=mold

# Change to nushell if available
export SHELL_PREFERRED=~/.cargo/bin/nu
if [[ $- == *i* ]] && [[ "$PREFSHELLSET" != 1 ]] && which "$SHELL_PREFERRED" >/dev/null 2>&1
then
    export PREFSHELLSET=1
    export SHELL="$(which $SHELL_PREFERRED)"
    exec "$SHELL_PREFERRED"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
