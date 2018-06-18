#! /bin/bash
_root="/atlas"

function _puppet() {
	puppetDebURL="https://apt.puppetlabs.com/puppet5-release-stretch.deb"
	wget -O /tmp/puppet.deb ${puppetDebURL} || exit 20
	dpkg -i /tmp/puppet.deb || exit 21
	rm -f /tmp/puppet.deb || exit 22
	apt-get update || exit 23
	apt-get install -y puppet || exit 24
}

if [[ "$1" == "first-boot" ]] ; then

	#if _puppet ; then
	#fi

	curl -sSL https://install.pi-hole.net > ${_root}/pihole.sh
	curl -L https://install.pivpn.io > ${_root}/pivpn.sh

	## Pi boot settings
	piConfig="/boot/config.txt"

	echo "hdmi_force_hotplug=1" > ${piConfig}
	echo "hdmi_edid_file=1" > ${piConfig}

	cp -a ${_root}/edid.dat /boot/

	shutdown -r now

elif [[ "$1" == "manual" ]] ; then
	bash ${_root}/pihole.sh && bash ${_root}/pivpn.sh && sudo shutdown -r now
else
	echo "Use argument 'first-boot' or 'manual' with this script."
fi
