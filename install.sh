git config --global user.name taro-hida
git config --global user.email hidataro11@gmail.com

if [ -e ~/.vim ] ; then
  mv -iv ~/.vim{,.org}
fi
mkdir -vp ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
mv -iv ~/.vim ~/dotfiles/vimfiles
ln -ivs ~/dotfiles/vimfiles ~/.vim

if [ -e ~/.vimrc ] ; then
  mv -iv ~/.vimrc{,.org}
fi
ln -ivs ~/dotfiles/vimrc ~/.vimrc
if [ -e ~/.bashrc ] ; then
  mv -iv ~/.bashrc{,.org}
fi
ln -ivs ~/dotfiles/bashrc ~/.bashrc
cd ~/dotfiles
