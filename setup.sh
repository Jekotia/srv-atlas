#! /bin/bash
_root="/srv/atlas"
_common="/srv/common"

if [ -e ${_common}/scripts/init ] ; then
	source ${_common}/scripts/init
fi

function _puppet() {
	puppetDebURL="https://apt.puppetlabs.com/puppet5-release-stretch.deb"
	wget -O /tmp/puppet.deb ${puppetDebURL} || exit 20
	dpkg -i /tmp/puppet.deb || exit 21
	rm -f /tmp/puppet.deb || exit 22
	apt-get update || exit 23
	apt-get install -y puppet || exit 24
}

if [[ "$1" == "first-run" ]] ; then

	git clone https://github.com/Jekotia/srv-common.git ${_common}
	chown -R pi:pi ${_common}

	_puppet

	source ${_root}/pi-boot/setup.sh

elif [[ "$1" == "manual" ]] ; then
	curl -sSL https://install.pi-hole.net > ${_root}/pihole.sh
	curl -L https://install.pivpn.io > ${_root}/pivpn.sh

	bash ${_root}/pihole.sh && bash ${_root}/pivpn.sh
else
	echo "Use argument 'first-boot' or 'manual' with this script."
fi
