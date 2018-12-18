git config --global user.name taro-hida
git config --global user.email hidataro11@gmail.com

if [ -e ~/.vim ] ; then
  mv -iv ~/.vim{,.bak}
fi
mkdir -vp ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
mv ~/.vim ~/dotfiles/vimfiles
ln -is ~/dotfiles/vimfiles ~/.vim

if [ -e ~/.vimrc ] ; then
  mv -iv ~/.vimrc{,.bak}
fi
ln -is ~/dotfiles/.vimrc ~/.vimrc
if [ -e ~/.bashrc ] ; then
  mv -iv ~/.bashrc{,.bak}
fi
ln -is ~/dotfiles/.bashrc ~/.bashrc
cd ~/dotfiles
