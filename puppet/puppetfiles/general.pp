host { "system":
	name		=> "$_NAME",
	ensure		=> "present",
	ip		=> "$_IP",
}

# Mounts
# #mount { "$_DISK_MNT":
# #	ensure		=> "mounted",
# #	atboot		=> "true",
# #	device		=> "PARTUUID=$_DISK_ID",
# #	fstype		=> "ext4",
# #	options		=> "defaults,noatime",
# #}

# Symlinks
# #file { "$_ROOT":
# #	ensure		=> "link",
# #	target		=> "$_DISK_MNT$_DISK_PATH",
# #}

#mod "AlexCline-fstab", "0.5.4"

#fstab { "saturn":
#	ensure	=> "present",
#	source	=> "/dev/disk/$_DISK_DEV/$_DISK_ID",
#	dest	=> "/saturn",
#	type	=> "ext4",
#	opts	=> "defaults,noatime",
	#dump	=> 0,
	#passno	=> 0,
#}
