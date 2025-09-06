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

# hookディレクトリを作成
mkdir -p ~/dotfiles/hook

# pre.shの作成（存在しない場合のみ）
if [ ! -e ~/dotfiles/hook/pre.sh ]; then
    cat > ~/dotfiles/hook/pre.sh << 'EOF'
#!/bin/bash
# pre-hook: bashrc.d/*.sh の読み込み前に実行される処理
#

EOF
fi

# post.shの作成（存在しない場合のみ）
if [ ! -e ~/dotfiles/hook/post.sh ]; then
    cat > ~/dotfiles/hook/post.sh << 'EOF'
#!/bin/bash
# post-hook: bashrc.d/*.sh 読み込み後に実行される処理
# 最後に実行したい処理を記載
# 例)
# cd /var/www/html

EOF
fi

ln -vs ~/dotfiles/bashrc ~/.bashrc

source ~/.bashrc
