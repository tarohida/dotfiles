git config --global user.name taro-hida
git config --global user.email hidataro11@gmail.com

if [ -e ~/.vim ] ; then
  mv -ivr ~/.vim ~/dotfiles/vim.org
fi
mkdir -vp ~/dotfiles/vimfiles/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/dotfiles/vimfiles/bundle/neobundle.vim
ln -ivs ~/dotfiles/vimfiles ~/.vim

if [ -e ~/.vimrc ] ; then
  mv -iv ~/.vimrc ~/dotfiles/vimrc.org
fi
ln -ivs ~/dotfiles/vimrc ~/.vimrc

if [ -e ~/.bashrc ] ; then
  mv -iv ~/.bashrc ~/dotfiles/bashrc.org
fi
ln -ivs ~/dotfiles/bashrc ~/.bashrc

cd ~/dotfiles
