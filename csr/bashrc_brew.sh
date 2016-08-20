# If brew not found, don't do anything
! command -v brew && return

BREW_PREFIX="$(brew --prefix)"

# Autojump
[[ -s "$BREW_PREFIX/etc/profile.d/autojump.sh" ]] && source "$BREW_PREFIX/etc/profile.d/autojump.sh"

# fzf
source "$BREW_PREFIX/opt/fzf/shell/completion.bash" 2> /dev/null
source "$BREW_PREFIX/opt/fzf/shell/key-bindings.bash"