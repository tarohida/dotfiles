#!/bin/bash

if ! command -v git &> /dev/null
then
    echo "git をインストールしてください"
    exit 1
fi

backup_dir="backup_$(date +"%Y%m%d%H%M%S")"
mkdir "$backup_dir"

# .vimrc をバックアップディレクトリに移動
if [ -e ~/.vimrc ] ; then
  mv -iv ~/.vimrc "$backup_dir"/
fi

# .bashrc をバックアップディレクトリに移動
if [ -e ~/.bashrc ] ; then
  mv -iv ~/.bashrc "$backup_dir"/
fi

# setup vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

ln -vs ~/dotfiles/bashrc ~/.bashrc

. ~/.bashrc
