mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
ln -Fis ~/dotfiles/.vimrc ~/.vimrc
ln -Fis ~/dotfiles/vimfiles ~/.vim
ln -Fis ~/dotfiles/.bashrc ~/.bashrc
cd ~/dotfiles
git config --global user.email hidataro11@gmail.com
git config --global user.email taro-hida

