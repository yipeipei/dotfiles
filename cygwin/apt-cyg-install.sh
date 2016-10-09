#!/usr/bin/env bash
# Install apt-cyg and other packages

# wget is not installed, using lynx as fallback
lynx -source "https://raw.githubusercontent.com/transcode-open/apt-cyg/master/apt-cyg" > apt-cyg
install apt-cyg /bin
rm apt-cyg

common_tools=(
    "curl"
    "wget"
    "git"
    "tmux"
    "emacs"
    "emacs-w32"
    "aspell"
    "aspell-en"
    "gnupg"
    "gnuplot"
    "graphviz"
    "ghostscript"
    "chere"
    "fzf"
    "fzf-bash-completion"
    "fzf-bash"
    "the_silver_searcher"
    "aria2"
    "xinit"
    "xeyes"
    )

cpp_toolchain=(
    "gcc-core"
    "gcc-g++"
    "gdb"
    "make"
    "cmake"
    "swig"
    )

libboost=(
    "libboost-devel"
    "libboost_python3-devel"
    )

dev_misc=(
    # Lektor
    "openssl-devel"
    "libffi-devel"
    "ImageMagick"
    # lxml
    "libxml2-devel"
    "libxslt-devel"
    )

for package in "${common_tools[@]}" "${cpp_toolchain[@]}" "${libboost[@]}" "${dev_misc[@]}"
do
    apt-cyg install "${package}"
done

apt-cyg list > apt-cyg-list
