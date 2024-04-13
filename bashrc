#!/bin/bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source personal runcom
if [ ! -f ~/dotfiles/bashrc.d/79-bash_colors ]; then
    curl -o ~/dotfiles/bashrc.d/79-bash_colors \
    https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh
fi

# bashrc.d/ 以下全て読み込み
for file in ./dotfiles/bashrc.d/* ; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done