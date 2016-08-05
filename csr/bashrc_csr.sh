# $ echo $LD_LIBRARY_PATH
# /opt/hadoop/lib/native/:
unset LD_LIBRARY_PATH

# CSR usage
function csrusage {
    STATUS_HOME_USED="$(quota -s | tail -n 1 | tr -s ' ' | cut -d' ' -f3)"
    STATUS_HDFS_USED="$(hadoop fs -count -q -h "$HOME" | tr -s ' ' | cut -d' ' -f10-11 --output-delimiter='')"
    STATUS_MEM_FREE="$(free -h | head -n 2 | tail -n 1 | tr -s ' ' | cut -d' ' -f4)"
    STATUS_TMP_FREE="$(df -h /tmp | tail -n 1 | tr -s ' ' | cut -d' ' -f4)"
    echo home used: $STATUS_HOME_USED
    echo hdfs used: $STATUS_HDFS_USED
    echo mem free:  $STATUS_MEM_FREE
    echo tmp free:  $STATUS_TMP_FREE
}
echo
csrusage

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
