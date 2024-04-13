#!/bin/bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# bashrc.d/ 以下全て読み込み
for file in ./dotfiles/bashrc.d/* ; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done