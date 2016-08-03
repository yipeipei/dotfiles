[[ -d "/tmp/$USER" ]] || mkdir -p "/tmp/$USER"

# Info
quota -s

# Protect new file outside home
umask 0077

# Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Linuxbrew extra
export HOMEBREW_CACHE="/tmp/$USER/Caches/Homebrew"
export HOMEBREW_LOGS="/tmp/$USER/Logs/Homebrew"
export HOMEBREW_FORCE_VENDOR_RUBY=true
export HOMEBREW_NO_ANALYTICS=true
export CMAKE_PREFIX_PATH="$HOME/.linuxbrew"
