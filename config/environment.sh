_user="pi"
_group="${_user}"
_uid="1000" # UID of primary user
_gid="${_uid}" # GID of primary user

_data="/srv/data" # Location of data directory
_logs="${_data}/logs"

_name="atlas"
_ip="192.168.0.10"

_disk_mnt="/mnt/atlas" # Where to mount the server drive
_disk_path="/atlas" # Path on removable storage to the server directory. Leave blank if the entire drive is for the server
_disk_dev="by-partuuid" # What section under /dev/disk
_disk_id="6efcdd95-02" # Appropriate ID for the above device type

_envAdd "_USER"		"${_user}"
_envAdd "_GROUP"	"${_group}"
_envAdd "_UID"		"${_uid}"
_envAdd "_GID"		"${_gid}"

_envAdd "_DATA"		"${_data}"
_envAdd "_LOGS"		"${_logs}"

_envAdd "_NAME"		"${_name}"
_envAdd "_IP"		"${_ip}"

_envAdd	"_DISK_MNT"	"${_disk_mnt}"
_envAdd "_DISK_DEV"	"${_disk_dev}"
_envAdd "_DISK_ID"	"${_disk_id}"
_envAdd	"_DISK_PATH"	"${_disk_path}"
