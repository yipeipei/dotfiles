# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Homebrew
export HOMEBREW_NO_ANALYTICS=true
export PATH="/usr/local/sbin:$PATH"

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
