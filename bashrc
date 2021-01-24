# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source personal runcom
if [ -f ~/dotfiles/bash_colors ]; then
    source ~/dotfiles/bash_colors
else
    curl https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh > ~/dotfiles/bash_colors
fi

source ~/dotfiles/promptrc
source ~/dotfiles/bashrc.local
# source ~/dotfiles/bashrc.org

# User specific aliases and functions
# env
export LESSCHARSET=utf-8
# aliases
alias bashrc='source  ~/.bashrc'
alias heisei="echo '平成'`date -d '1988 year ago' +'%y'`'年'"
alias reiwa="echo '令和'`date -d '2018 year ago' +'%y'`'年'"
alias today="date '+%Y%m%d'"
alias crontab="crontab -i"
alias less="less -R"

# functions
delete_comment() {
    sudo cp -vip  $1 $1'.org'
    sudo cat $1'.org' | sed '/^[ \t]*#/d' | sed '/^$/d' | sudo tee $1
}

command_not_found_handle() {
    local cmd
    cmd=${1##*/}
    echo "\"${cmd}\" not found \(^o^)/"
}

if [[ -t 0 ]]; then
  stty stop undef
  stty start undef
fi
