#!/bin/bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source personal runcom
if [ ! -f ~/dotfiles/bash_colors ]; then
    curl https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh > ~/dotfiles/bash_colors
fi

test -f ~/dotfiles/bash_colors && source ~/dotfiles/bash_colors
test -f ~/dotfiles/promptrc && source ~/dotfiles/promptrc
test -f ~/dotfiles/bashrc.org && source ~/dotfiles/bashrc.org
test -f ~/dotfiles/bashrc.local && source ~/dotfiles/bashrc.local

# User specific aliases and functions
# env
export LESSCHARSET=utf-8
# aliases
alias bashrc='source  ~/.bashrc'
alias crontab="crontab -i"
alias less="less -R"
# git bash 環境の場合、 start でコマンドが通る
if ! command -v start &> /dev/null
then
    # ubuntu 環境の場合、 start でエクスプローラ (nautilus) が開くようにする
    alias start="nautilus"
fi

# functions
delete_comment() {
    cp -vip  $1 $1'.org'
    cat $1'.org' | sed '/^[ \t]*#/d' | sed '/^$/d' | tee $1
}

abpath () {
    relative_path=`echo $1|sed 's|^\./||g'`
    echo `pwd`'/'`ls ${relative_path}`
}
command_not_found_handle() {
    local cmd
    cmd=${1##*/}
    echo "\"${cmd}\" not found \(^o^)/"
}

docker-stop-all() {
    which docker >/dev/null
    if [ $? -ne 0 ];then
        echo '`docker` command not found'
        return 1;
    fi
    docker stop `docker ps -q`
}

docker-compose-up-force () {
    docker-stop-all
    docker-compose up
}

upload-pubkey-to () {
    PubKey=$(cat $1)
    Host=$2
    ssh ${Host} -C "mkdir -p ~/.ssh/ && echo ${PubKey} >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/ && chmod 600 ~/.ssh/authorized_keys"
}

setup-git () {
    read -p "ユーザー名を入力してください: " git_username
    read -p "メールアドレスを入力してください: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    echo "user.name: $(git config --global user.name)"
    echo "user.email: $(git config --global user.email)"
}
