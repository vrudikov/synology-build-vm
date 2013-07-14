name              "synology-build"
maintainer        "Uwe Mesecke"
maintainer_email  "uwe@mesecke.net"
license           "Apache 2.0"
description       "setup build environment and toolchain for Synology disk station"
version           "0.1.0"
recipe            "synology-build", "downloads toolchain"

depends "apt"

%w{ ubuntu debian }.each do |os|
  supports os
end

attribute "synology-build/toolchain/url",
  :description => "URL to toolchain archive",
  :default => "http://downloads.sourceforge.net/project/dsgpl/DSM%204.2%20Tool%20Chains/Marvell%2088F628x%20Linux%202.6.32/gcc421_glibc25_88f6281-GPL.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdsgpl%2Ffiles%2FDSM%25204.2%2520Tool%2520Chains%2FMarvell%252088F628x%2520Linux%25202.6.32%2F&ts=1373805236&use_mirror=garr"

attribute "synology-build/toolchain/checksum",
  :description => "SHA256 checksum for toolchain archive",
  :default => "ae8250eb0afc2ba11524101c39e20a455b7265d089e24b761c3d323b5ed234a5"

attribute "synology-build/toolchain/tarball",
  :description => "name of the toolchain archive",
  :default => "gcc421_glibc25_88f6281-GPL.tgz"

attribute "synology-build/toolchain/platform",
  :description => "platform name",
  :default => "arm-none-linux-gnueabi"

