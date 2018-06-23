#! /bin/bash

## Pi boot settings
piConfig="/boot/config.txt"

echo >> ${piConfig}
echo "## Begin pi-boot/setup.sh" >> ${piConfig}
echo "hdmi_force_hotplug=1" >> ${piConfig}
echo "hdmi_edid_file=1" >> ${piConfig}
echo "## End pi-boot/setup.sh" >> ${piConfig}

cp -a ${_common}/pi-boot/edid.dat /boot/
