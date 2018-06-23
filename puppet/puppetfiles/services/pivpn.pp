user { "$_PIVPN_USER":
	ensure		=> "present",
	uid		=> "$_PIVPN_UID",
	gid		=> "$_PIVPN_GID",
	membership	=> "inclusive",
	system		=> "true",
	home		=> "/home/pivpn",
}
group { "$_PIVPN_GROUP":
	ensure		=> "present",
	gid		=> "$_PIVPN_GID",
	system		=> "true",
}

file { "pivpn home folder":
	path		=> "$_PIVPN_DATA/home/pivpn",
	ensure		=> "directory",
	group		=> "$_PIVPN_GID",
	owner		=> "$_PIVPN_UID",
	recurse		=> "true",
}
file { "pivpn data folder":
	path		=> "$_PIVPN_DATA",
	ensure		=> "directory",
	group		=> "$_PIVPN_GID",
	owner		=> "$_PIVPN_UID",
	recurse		=> "true",
}
file { "pivpn etc/openvpn folder":
	path		=> "$_PIVPN_DATA/etc/openvpn",
	ensure		=> "directory",
	group		=> "root",
	owner		=> "root",
	recurse		=> "true",
}
file { "pivpn etc/pivpn folder":
	path		=> "$_PIVPN_DATA/etc/pivpn",
	ensure		=> "directory",
	group		=> "root",
	owner		=> "root",
	recurse		=> "true",
}
file { "pivpn log":
	path		=> "$_PIVPN_DATA/etc/pivpn/install.log",
	ensure		=> "file",
	group		=> "$_GID",
	owner		=> "$_UID",
}

file { "/home/pivpn":
	ensure		=> "link",
	target		=> "$_PIVPN_DATA/home/pivpn",
}
file { "/etc/pivpn":
	ensure		=> "link",
	target		=> "$_PIVPN_DATA/etc/pivpn",
}
file { "/etc/openvpn":
	ensure		=> "link",
	target		=> "$_PIVPN_DATA/etc/openvpn",
}
