#!/bin/bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# pre-hook: bashrc.d読み込み前の処理
if [ -f "./dotfiles/hook/pre.sh" ]; then
    source "./dotfiles/hook/pre.sh"
fi

# bashrc.d/ 以下全て読み込み
for file in ./dotfiles/bashrc.d/* ; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

# post-hook: bashrc.d読み込み後の処理
if [ -f "./dotfiles/hook/post.sh" ]; then
    source "./dotfiles/hook/post.sh"
fi