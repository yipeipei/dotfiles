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
    "aspell"
    "aspell-en"
    "gnupg"
    "gnuplot"
    "graphviz"
    "ghostscript"
    )

cpp_toolchain=(
    "gcc-core"
    "gcc-g++"
    "gdb"
    "make"
    "cmake"
    "swig"
    )

dev_misc=(
    "cygwin-debuginfo"
    # Lektor
    "openssl-devel"
    "libffi-devel"
    "ImageMagick"
    # lxml
    "libxml2-devel"
    "libxslt-devel"
    )

libboost=(
    "libboost-devel"
    "boost-debuginfo"
    "libboost_python3-devel"
    )

for package in "${common_tools[@]}" "${cpp_toolchain[@]}" "${dev_misc[@]}" "${libboost[@]}"
do
    apt-cyg install "${package}"
done

apt-cyg list > apt-cyg-list
