# Aliases
alias open=cygstart
alias pbcopy="cat > /dev/clipboard"
alias pbpaste="cat /dev/clipboard"

##############################################################################
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Emacs
alias edm="emacs-w32 --daemon"
alias ect="emacsclient-w32 -t"
alias ecc="emacsclient-w32 -c"

# Autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
