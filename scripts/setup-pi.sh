#! /bin/bash

source $_SCRIPT_INIT

puppetDebURL="https://apt.puppetlabs.com/puppet5-release-stretch.deb"

function _snippets () {
	if [ ! -e $sslRoot/dehydrated ] ; then
		git submodule add https://github.com/lukas2511/dehydrated.git $sslRoot/dehydrated
	fi
	if [ ! -e $sslRoot/dns-01-manual ] ; then
		git submodule add https://github.com/owhen/dns-01-manual.git $sslRoot/dns-01-manual
		chmod +x ${_ROOT}/ssl/dns-01-manual/hook.sh
	fi
}


function _general () {
	apt-get update && apt-get upgrade -y && apt-get dis-upgrade -y || exit 1
	echo 'alias docker="sudo docker"' >> /home/pi/.profile
	echo 'alias docker-compose="sudo docker-compose"' >> /home/pi/.profile
}

function _mounts () {
	mkdir -p ${_DISK_MNT} || exit 10

#	echo "PARTUUID=${_DISK_DEVtarget}  ${_DISK_MNT}     ext4    defaults,noatime  0       1" >> /etc/fstab || exit 11
	mount /dev/disk/${_DISK_DEV}/${_DISK_ID} ${_DISK_MNT} || exit 12
}

function _puppet() {
	wget -O /tmp/puppet.deb ${puppetDebURL} || exit 20
	dpkg -i /tmp/puppet.deb || exit 21
	rm -f /tmp/puppet.deb || exit 22
	apt-get update || exit 23
	apt-get install -y puppet || exit 24
}

function _docker () {
	${_ROOT}/docker/scripts/docker-engine.sh || exit 30
	${_ROOT}/docker/scripts/docker-compose.sh || exit 31
}

function _pi () {
	rm -rf /tmp/zsh || exit 53
	git clone ${_ROOT}/data/gogs/git/jekotia/.zsh.git /tmp/zsh || exit 50
#	sed -i.bak 's/zshSource=.*/zshSource="\/saturn\/data\/gogs\/git\/jekotia\/.zsh.git"/g' /tmp/zsh/shell-setup.sh || exit 51
	awk '{gsub(/zshSource=.*/,"zshSource=/saturn/data/gogs/git/jekotia/.zsh.git",column_number)}' /tmp/zsh/shell-setup.sh || exit 51
#	bash /tmp/zsh/shell-setup.sh "pi" || exit 52
}

function _configure () {
	puppet apply ${_ROOT}/puppet/computer.pp
	puppet apply ${_ROOT}/puppet/users-groups.pp
	puppet apply ${_ROOT}/puppet/files.pp
	puppet apply ${_ROOT}/puppet/cron.pp
	puppet apply ${_ROOT}/puppet/symlinks.pp
	puppet apply ${_ROOT}/puppet/mounts.pp
	puppet apply ${_ROOT}/puppet/packages.pp
}

_isRoot "exit"
_pi
#_general

#_mounts

#_pi

#_puppet

#_docker

