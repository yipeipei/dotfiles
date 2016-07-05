#!/usr/bin/env bash

# Clean
> .gitconfig
> .gitignore_global

# Global gitignore
curl https://www.gitignore.io/api/osx,linux,windows,xcode,visualstudio,jetbrains,eclipse,sublimetext,emacs,vim > .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

# Add subcommand: git ignore
git config --global alias.ignore '!gi() { curl -L -s https://www.gitignore.io/api/$@ ;}; gi'

# First-Time Git Setup
git config --global user.name "YI Peipei"
git config --global user.email "yipeipei@gmail.com"

# Dealing with line endings
git config --global core.autocrlf input
# Configure Git on OS X or Linux to properly handle line endings

# git config --global core.autocrlf true
# Configure Git on Windows to properly handle line endings
