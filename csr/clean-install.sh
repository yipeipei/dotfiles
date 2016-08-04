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

# Clean home
ssh csr48 << EOF
rm -rf *
rm -rf .*
EOF

# Install essentials
scp bashrc_csr.sh csr48:/tmp

ssh csr48 << EOF
source /tmp/bashrc_csr.sh
rm /tmp/bashrc_csr.sh

# Linuxbrew
git clone --depth 1 https://github.com/Linuxbrew/brew.git ~/.linuxbrew
brew install gcc
brew install gdb
brew install make
brew install cmake
brew install git
brew install python3
brew install boost --with-icu4c
brew install boost-python
brew install swig

# dotfiles
git clone https://github.com/yipeipei/dotfiles.git ~/wd/git/gh/dotfiles
cd ~/wd/git/gh/dotfiles
git remote set-url origin git@github.com:yipeipei/dotfiles.git
make setup-csr
EOF
