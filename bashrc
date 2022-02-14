# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

test -f ~/dotfiles/bashrc.org && source ~/dotfiles/bashrc.org
test -f ~/dotfiles/bashrc.local && source ~/dotfiles/bashrc.local

# User specific aliases and functions
# env
export LESSCHARSET=utf-8
# aliases
alias bashrc='source  ~/.bashrc'
alias crontab="crontab -i"
alias less="less -R"
alias open="nautilus"

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

docker-stop-all() {
    which docker >/dev/null
    if [ $? -ne 0 ];then
        echo '`docker` command not found'
        return 1;
    fi
    docker stop `docker ps -q`
}

docker-compose-up-force () {
    docker-stop-all
    docker-compose up
}

upload-pubkey-to () {
    PubKey=$(cat $1)
    Host=$2
    ssh ${Host} -C "mkdir -p ~/.ssh/ && echo ${PubKey} >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh/ && chmod 600 ~/.ssh/authorized_keys"
}
