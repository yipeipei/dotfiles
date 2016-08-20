# $ echo $LD_LIBRARY_PATH
# /opt/hadoop/lib/native/:
unset LD_LIBRARY_PATH

# PATH
export PATH="$DOTFILES/csr/do:$PATH"

export CSR_HOME="$HOME"
export CSR_HDFS="$HOME"
export CSR_TEMP="/tmp/$USER"
export CSR_BASE="csr48"

# Protect new file outside home
umask 0077
[[ -d "/tmp/$USER" ]] || mkdir -p "/tmp/$USER"

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

# Brew prefixed
[[ -f "$DOTFILES/csr/bashrc_brew.sh" ]] && source "$DOTFILES/csr/bashrc_brew.sh"