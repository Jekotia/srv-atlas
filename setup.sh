#! /bin/bash

puppetDebURL="https://apt.puppetlabs.com/puppet5-release-stretch.deb"

function _puppet() {
	wget -O /tmp/puppet.deb ${puppetDebURL} || exit 20
	dpkg -i /tmp/puppet.deb || exit 21
	rm -f /tmp/puppet.deb || exit 22
	apt-get update || exit 23
	apt-get install -y puppet || exit 24
}

#if _puppet ; then
#fi

curl -sSL https://install.pi-hole.net > /atlas/pihole.sh
curl -L https://install.pivpn.io > /atlas/pivpn.sh
