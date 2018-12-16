# dotfiles 

```
cd ~/
git clone 'https://github.com/taro-hida/dotfiles.git'
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
ln -Fis ~/dotfiles/.vimrc ~/.vimrc
ln -Fis ~/dotfiles/vimfiles ~/.vim
ln -Fis ~/dotfiles/.bashrc ~/.bashrc
cd ~/dotfiles
vim
:NeoBundleInstall
```
