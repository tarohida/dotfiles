# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Source personal
if [ -f ~/dotfiles/bash_colors ]; then
	source ~/dotfiles/bash_colors
else
	curl https://raw.githubusercontent.com/mercuriev/bash_colors/master/bash_colors.sh > ~/dotfiles/bash_colors
fi

source ~/dotfiles/promptrc

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
	#for use php72 in composer
	export PATH=/opt/remi/php72/root/usr/bin:/opt/remi/php72/root/usr/sbin${PATH:+:${PATH}}
	export LD_LIBRARY_PATH=/opt/remi/php72/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
	#personal 
	export MANPATH=/opt/remi/php72/root/usr/share/man:${MANPATH}

# User specific aliases and functions
#aliases
	#personal
	alias load='source  ~/.bashrc'
	alias py='python3.6'

#exec when login
echo '-------------------'
echo ' Now load .bashrc'
echo '-------------------'
