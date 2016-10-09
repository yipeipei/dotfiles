#!/usr/bin/env bash
# Clean CSR home and install essentials

# Prevent damage
PASS="doje yeqy sjmu ooxm"

echo This will REMOVE ALL files in your home directory on CSR.
echo Type following passphrase to proceed: $PASS
read INPUT

if [[ "$INPUT" != "$PASS" ]]; then
    echo Input not match.
    exit
fi


echo Proceed.
source bashrc_csr.sh  # for $CSR_BASE

# Clean home
ssh "$CSR_BASE" << EOF
# rm -rf *
# rm -rf .*
EOF

# Install essentials
scp bashrc_csr.sh "$CSR_BASE:/tmp"  # for base settings

ssh "$CSR_BASE" << "EOF"
source /tmp/bashrc_csr.sh
rm /tmp/bashrc_csr.sh

# Linuxbrew
git clone --depth 1 https://github.com/Linuxbrew/brew.git "$HOMEBREW_PREFIX"
brew install gcc
brew install git
brew install python3

# dotfiles
git clone https://github.com/yipeipei/dotfiles.git ~/wd/git/gh/dotfiles
cd ~/wd/git/gh/dotfiles
git remote set-url origin git@github.com:yipeipei/dotfiles.git
make setup-csr
EOF
