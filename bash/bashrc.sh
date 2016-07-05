#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Info
ls -l $SHELL

# Zsh
if [ -n "$ZSH_VERSION" ]; then
    export ZSH=$HOME/.oh-my-zsh
    ZSH_THEME="babun"
    plugins=(git)
    export PATH=$HOME/bin:/usr/local/bin:$PATH
    source $ZSH/oh-my-zsh.sh
fi

# Base directory
export DOTFILES_BASH="${$(readlink $HOME/.bashrc)%/*}"
export DOTFILES="${DOTFILES_BASH%/*}"

# SSH
source "$DOTFILES/ssh/auto-launch-ssh-agent.sh"
ssh-add -l -E md5
