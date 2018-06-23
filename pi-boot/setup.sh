#! /bin/bash
_root="/atlas"

## Pi boot settings
piConfig="/boot/config.txt"

echo "hdmi_force_hotplug=1" > ${piConfig}
echo "hdmi_edid_file=1" > ${piConfig}

cp -a ${_root}/pi-boot/edid.dat /boot/
