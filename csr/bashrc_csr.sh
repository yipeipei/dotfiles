# $ echo $LD_LIBRARY_PATH
# /opt/hadoop/lib/native/:
unset LD_LIBRARY_PATH

export CSR_HOME="$HOME"
export CSR_HDFS="$HOME"
export CSR_TEMP="/tmp/$USER"
export CSR_BASE="csr48"

# Protect new file outside home
umask 0077
[[ -d "$CSR_TEMP" ]] || mkdir -p "$CSR_TEMP"

# Linuxbrew
export HOMEBREW_PREFIX="$CSR_TEMP/.linuxbrew"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"
export INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"

# Linuxbrew extra
export HOMEBREW_CACHE="$CSR_TEMP/Caches/Homebrew"
export HOMEBREW_LOGS="$CSR_TEMP/Logs/Homebrew"
export HOMEBREW_FORCE_VENDOR_RUBY=true
export HOMEBREW_NO_ANALYTICS=true
export CMAKE_PREFIX_PATH="$HOMEBREW_PREFIX"

# VNC server
alias vnc-list="vncserver -list"
alias vnc-start="vncserver :77 -geometry 1440x900"
alias vnc-end="vncserver -kill :77"
alias vnc-killall="vncserver -list | grep ^:[0-9] | cut -f1 | xargs vncserver -kill"
alias vnc-clean="rm -f /tmp/.X77-lock && rm -f /tmp/.X11-unix/X77"

##############################################################################
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Brew prefixed
[[ -f "$DOTFILES/csr/bashrc_brew.sh" ]] && source "$DOTFILES/csr/bashrc_brew.sh"