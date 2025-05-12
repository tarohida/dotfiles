#!/bin/bash
setup-git () {
    read -p "ユーザー名を入力してください: " git_username
    read -p "メールアドレスを入力してください: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    git config --global push.autoSetupRemote true
    echo "user.name: $(git config --global user.name)"
    echo "user.email: $(git config --global user.email)"
}

setup-dirs() {
    cat <<EOF > ./command.sh
chown -v :${USER} /usr/local/bin/ /etc/hosts
chmod -v g+wrx /usr/local/bin
chmod -v g+wr /etc/hosts
EOF

    chmod +x ./command.sh

    cat <<EOF
run this:

sudo su -
$(pwd)/command.sh

EOF
}

setup-ssh-config() {
    cat <<'EOF' >> ~/.ssh/config
Host github.com bitbucket.org
    User git

Host *
    User tarohida
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    IdentityFile ~/.ssh/id_ed25519
    Port 22

TCPKeepAlive yes
Compression yes
ServerAliveInterval 15
ServerAliveCountMax 10

ConnectionAttempts 1
VisualHostKey yes
EOF
}
