# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

test -f ~/dotfiles/bashrc.org && source ~/dotfiles/bashrc.org

# User specific aliases and functions
# env
export LESSCHARSET=utf-8
# aliases
alias bashrc='source  ~/.bashrc'
alias crontab="crontab -i"
alias less="less -R"

# functions
delete_comment() {
    cp -vip  $1 $1'.org'
    cat $1'.org' | sed '/^[ \t]*#/d' | sed '/^$/d' | tee $1
}

abpath () {
    relative_path=`echo $1|sed 's|^\./||g'`
    echo `pwd`'/'`ls ${relative_path}`
}

command_not_found_handle() {
    local cmd
    cmd=${1##*/}
    echo "\"${cmd}\" not found \(^o^)/"
}

