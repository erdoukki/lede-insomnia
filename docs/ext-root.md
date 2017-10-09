[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Ext-root via USB driver Virgin

https://lede-project.org/docs/user-guide/extroot_configuration

* I use 3 partitions
  * /dev/sda1 - the ext root, 100gb
  * /dev/sda2 - swap, 10gb
  * /dev/sda3 - /storage, 390gb

* Move to a new terminal and log in

```bash
ssh root@192.168.1.1

opkg update

# Linksys WRT1900ACS and Linksys WRT3200ACM 
opkg install kmod-usb-core kmod-fs-ext4 kmod-usb-storage-extras blkid block-mount e2fsprogs fdisk 

# D-Link DIR-860l B1
opkg install kmod-usb3 blkid kmod-usb-storage-extras blkid block-mount fdisk e2fsprogs 

insmod xhci-mtk

# if upgrade try this
block detect > /etc/config/fstab; sed -i s/option$'\t'enabled$'\t'\'0\'/option$'\t'enabled$'\t'\'1\'/ /etc/config/fstab; sed -i s#/mnt/sda1#/overlay# /etc/config/fstab; cat /etc/config/fstab;

uci commit
reboot && exit

ssh root@192.168.1.1

blkid
df -h
# check the partitions are as wanted, and overlay is working, then we are done

# ************************************
# if i need a virgin drive, 
# sometimes the overlay with a factory install, the overlay is killed
# is not working, so you have to create a new overlay
# the rest will be working
mkfs.ext4 /dev/sda1
# say yes

# if you already have it and it is not
# overlay, then you do not need it,
# it will work
# non overlay is working,
# but the HD is virgin you need an ext4 filesytem 
mkfs.ext4 /dev/sda3
# say yes
swapon /dev/sda2

blkid

block detect > /etc/config/fstab; sed -i s/option$'\t'enabled$'\t'\'0\'/option$'\t'enabled$'\t'\'1\'/ /etc/config/fstab; sed -i s#/mnt/sda1#/overlay# /etc/config/fstab; cat /etc/config/fstab;

mkdir -p /media/storage

nano /etc/config/fstab

# set /dev/sda3 -> /media/storage

uci commit fstab
uci commit

# check the partitions are as wanted
df -h # just test

# built the overlay into the drive
mount /dev/sda1 /mnt ; tar -C /overlay -cvf - . | tar -C /mnt -xf - ; umount /mnt

# is it good? then we are good! if it is not, uncheck Keep settings 
# install the factory now and redo from creating the partition
# finally 
# check show fstab, might dont need again
uci show fstab 
cat /etc/config/fstab
df -h 

uci commit
reboot && exit

# wait so that the network is connected
ssh root@192.168.1.1 # if you have existing then there like 192.168.1.1

uci show fstab 
cat /etc/config/fstab
df -h 

# THIS IS MY OWN SETUP

# we need overlay in the storage
# setup the internet
# if it is not built in like Linksys
# my opkg-list-installed.txt 
pkg update
rm /usr/lib/opkg/info/kmod-lib-zlib-inflate.postinst || true
rm /usr/lib/opkg/info/kmod-lib-zlib-deflate.postinst || true
opkg install "opkg-list-installed.txt"

# this is my own setup, you don't needed
# just in my /dev/sda3 i have monthly, weekly and daily backup
mkdir -p /opt/ 
cd /opt 
git config --global http.sslVerify "false" 
git clone https://git-user:[********]@git.patrikx3.com/router-scripts-lede.git 

cd router-scripts-lede
./init-router

reboot && exit
```

# Ext-root via USB driver with existing data

```bash
ssh root@192.168.1.1

block detect > /etc/config/fstab; sed -i s/option$'\t'enabled$'\t'\'0\'/option$'\t'enabled$'\t'\'1\'/ /etc/config/fstab; sed -i s#/mnt/sda1#/overlay# /etc/config/fstab; cat /etc/config/fstab;

uci show fstab 
cat /etc/config/fstab
df -h 

uci commit
reboot && exit

# wait so that the network is connected
ssh root@192.168.1.1 # if you have existing then there like 192.168.1.1

uci show fstab 
cat /etc/config/fstab
df -h 


```

* When all it is done and working 
* http://192.168.1.1/cgi-bin/luci/admin/system/flashops
* CHOOSE FILE => Upload archive
* http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg
* Distribution feeds might needs to changed to cdn.corifeus.com with older versions, but the current is built in.

**Though it is pre-built, but before I had a ```sysupgrade``` and I had to add in by hand, by now you don't need it.**

**Linksys WRT1900ACS**  
**Linksys WRT3200ACM**  
```text
src/gz reboot_core http://cdn.corifeus.com/lede/17.01.3/targets/mvebu/generic/packages
src/gz reboot_base http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/base
src/gz reboot_luci http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/luci
src/gz reboot_packages http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/packages
src/gz reboot_routing http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/routing
src/gz reboot_telephony http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/telephony
src/gz reboot_node htt://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/node
src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/darkmatter
src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/redis
``` 

**D-Link DIR-860l B1**
```text
src/gz reboot_core http://cdn.corifeus.com/lede/17.01.3/targets/ramips/mt7621/packages
src/gz reboot_base http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/base
src/gz reboot_luci http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/luci
src/gz reboot_packages http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/packages
src/gz reboot_routing http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/routing
src/gz reboot_telephony http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/telephony
src/gz reboot_node http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/node
src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/darkmatter
src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/redis
``` 

[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.43-284 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 
 

[//]: #@corifeus-footer:end