git config --global user.name taro-hida
git config --global user.email sk8trou@gmail.com

# Evacuate old vimrc
if [ -e ~/.vimrc ] ; then
  mv -iv ~/.vimrc ~/dotfiles/vimrc.org
fi

# setup vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Evacuate and install bashrc
if [ -e ~/.bashrc ] ; then
  mv -iv ~/.bashrc ~/dotfiles/bashrc.org
fi
ln -ivs ~/dotfiles/bashrc ~/.bashrc

. ~/.bashrc

cd ~/dotfiles
