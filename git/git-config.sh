#!/usr/bin/env bash

# Clean
> .gitconfig
> .gitignore_global

# Global gitignore
curl https://www.gitignore.io/api/osx,linux,windows,xcode,visualstudio,jetbrains,eclipse,sublimetext,emacs,vim > .gitignore_global

# First-Time Git Setup
git config --global user.name "YI Peipei"
git config --global user.email "yipeipei@gmail.com"
