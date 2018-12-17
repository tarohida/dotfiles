git config --global user.name taro-hida
git config --global user.email hidataro11@gmail.com
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
if [ -e ~/.vimrc ] ; then
  mv ~/.vimrc{,.bak}
fi
ln -Fis ~/dotfiles/.vimrc ~/.vimrc
if [ -e ~/.vim ] ; then
  mv ~/.vim{,.bak}
fi
ln -Fis ~/dotfiles/vimfiles~/.vim
if [ -e ~/.bashrc ] ; then
  mv ~/.bashrc{,.bak}
fi
ln -Fis ~/dotfiles/.bashrc ~/.bashrc
cd ~/dotfiles
