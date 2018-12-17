# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#aliases

#for use php72 in composer
export PATH=/opt/remi/php72/root/usr/bin:/opt/remi/php72/root/usr/sbin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/opt/remi/php72/root/usr/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export MANPATH=/opt/remi/php72/root/usr/share/man:${MANPATH}
