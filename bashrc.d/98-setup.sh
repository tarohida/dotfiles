#!/bin/bash
setup-git () {
    read -p "ユーザー名を入力してください: " git_username
    read -p "メールアドレスを入力してください: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    echo "user.name: $(git config --global user.name)"
    echo "user.email: $(git config --global user.email)"
}

setup-dirs() {
    sudo chown root.${USER} /usr/local/bin/
    sudo chmod g+wrx /usr/local/bin/
}