[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end

# Start

By now, the whole build system is automated. This is just for historical documentary.

# First save the existing packages

* SSH into the router

```bash
# this is my own script but you can get the installed packages with some hacking
# this is good if you want your own firmware
# that builds all packages you now have 
opkg list-installed > opkg-list-installed.txt
```

* mc
  * via Midnight Commander you add to your repo via shell patrikx3@192.168.1.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/router/{router-name}
* Copy the opkg-list-installed.txt file to {router-name}/opkg-list-installed.txt as well


# Make the raw firmware

By now, it is using faster with the helpers above, but below you can do it by hand to change everything easy.

# Build All packages

You start with:
```bash
./build-docker
```

Make sure you know there are already build docker images, so you don't really need it.

The same, if you have a server instead ```cdn.corifeus.com```, you can change it at wish.

For ```apache``` errors and there is a newer ```mwlwifi``` faster, newer package, they are in ```lede-insomnia/patches```, you can copy them safely into the ```/build/source```. 

* Target System  
  * Linksys WRT1900ACS => Marvell Armada 37x/38x/XP  
  * Linksys WRT3200ACM => Marvell Armada 37x/38x/XP
  * D-Link DIR-860l B1 => MediaTek Ralink MIPS  
* Subtarget (for D-Link, Linksys missing this, not needed)
  * MT76291   
* Target Profile  
  * Linksys WRT1900ACS => Linksys WRT1900ACS
  * Linksys WRT3200ACM => Linksys WRT3200ACM
  * D-Link DIR-860l B1 => MT7621  
    * Kernel type => MIPS FPU EMULATOR
      * it comes later with ```make -j9 kernel_menuconfig```, after the packages selected, just some info    
* Global build settings
  * Select all target specific packages by default
  * Select all kernel module packages by default
  * Select all userspace pakcages by default   
* LUCI
  * Modules
    * Translations
      * Hungarian = M
  * Collections
    * luci-ssl-openssl
  * Applications
    * luci-app-mwan3
    * luci-add-ntpc
    * luci-app-openvpn
    * luci-app-qos
    * luci-app-samba
    * luci-app-statistics
    * luci-app-upnp
    * luci-app-wol
    * luci-app-uhttpd
  * Themes
    * luci-theme-material
    * luci-theme-darkmatter
* Base system
  * ca-bundle
  * ca-certificates
  * procd
    * configuration
      * Print the shutdown to the console as well as logging it to syslog
  * qos-scripts
* Kernel modules
  * Select everything, but I think, it is now already added, except remove the below  
  * Wireless Drivers **(Required for Linksys WRT routers)**
    * kmod-mwifiex-sdio **(CLEAR, so not show M or * )**
* Languages
  * Node.js
    * node
      * Configuration
        * Version Selection
          * 8.x
  * PHP
    * php7
    * PHP7 Filter support
 * Perl
 * Python
   * python
* Libraries
  * **IN THE FUTURE, I WILL ADD ALL LIBRARIRES** ?
  * liblzo
  * librpc
* Mail
  * msmtp
* Network
  * File Transfer
    * curl
    * rsync
    * rsyncd
    * wget
  * Firewall
    * iptables
      * Enter
        * iptables-mod-ipsec
  * Open vSwitch
    * openswitch-ipsec   
  * Routing and Redirection
    * mwan3
    * ip-full
  * SSH
    * openssh-client
    * openssh-client-utils
    * openssh-sftp-server
  * VPN
    * ipsec-tools
    * openvpn-easy-rsa
    * openvpn-openssl
    * strongswan-full
    * strongswan-mod-kernel-libipsec 
    * xl2tpd
  * Web Servers/Proxies
    * apache (**if you added the patches**)
    * nginx - Select then Enter
      * Configuration
        * Select all
  * 6in4
  * cifsmount
  * hostpad-utils
  * iputils-* all
  * memcached
  * ppp
    * ppp-mod-passwordfd
    * ppp-mod-pppoa
    * ppp-mod-pppol2tp
    * ppp-mod-pptp
    * ppp-mod-radius
  * ppp-multilink
    * pppdump
    * pppoe-discovery
  * pppossh
  * pppstats
  * redis
  * samba36-client
  * wpad
* Utilities
  * Compression
    * Select all
  * Disc
    * blkid
    * fdisk
    * findfs
    * hdparm
  * Editors
    * nano
  * Filesystem
    * e2fsprogs
    * ncdu
    * swap-utils
  * Zoneinfo
    * Select all
  * Database
    * mariadb
      * ENTER and select all, except LITE
    * mysql-server
    * pgsql-cli     
    * pgsql-cli-extra
    * pgsql-server
    * sqlite3-cli
  * bonniexx
  * coreutils - select then enter to choose
    * select all
  * dmesg
  * extract
  * file
  * findutils-find
  * findutils-locate
  * findutils-xargs
  * grep
  * hwclock
  * kmod
  * less
  * less-wide
  * logrotate
  * mc - select then enter
    * Configuration
      * Select all
  * mount-utils
  * openldap-utils
  * procps-ng - select then enter 
    * select all as a module
  * rename
  * smartmontools
  * tar
  * whereis       
* Exit
* YES
* mc
   * via Midnight Commander you add to your repo via shell patrikx3@192.168.78.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/router
* Copy the .config file to {router-name}/.config

**If your target machine is MIPS and there is no hardware FPU we need MIPS_FPU_EMULATOR**

```bash
make -j9 kernel_menuconfig
```
 
* Target System  
  * D-Link DIR-860l B1 MediaTek MT7621AT, target ```ramips / mt7621```, type ```mipsel_24kc```
    * MediaTek Ralink MIPS       
* Target Profile  
  * MT7621  
* Kernel type
  * Check MIPS FPU EMULATOR
* Device Drivers
  * Check DMA Engine support
    * Press Enter
      * RALINK DMA support = M
      * MTK HSDMA support = M 
* Save  
* Exit  

# Create the make

Please open a new terminal in your Linux.

```bash
# you dont need the image-builder, but for the source it asks a questions so you need the verbose mode
# i think it is buider without multiple cores, because you will never node what is happening, a bit longer, but safe... 

# if you added in the new mwlwifi from https://github.com/eduperez/mwlwifi_LEDE

# copy the fixes form the lede-insomnia/patches/source/feeds
# if you want the edupere-mwlwifi_LEDE, and you haven't pre added the patches with the sync-the-patches-into-the-source command
make package/kernel/mwlwifi/clean

make -j1 V=s
```

# In an another terminal you can increase the buidling 

```bash
# for me using multiple cores the main build I always get errors, so I always use just 1 core
# I do this instead
# find out the PID
watch 'ps -aux | grep "make\|m4\|cc1"'
# end just to do this
sudo renice -20 -u 1000
# for docker I also added renice, I checked out the dockerd pid and I added in
ps -aux | grep dockerd
# you get the PID
sudo renice -20 10728 # this was the dockerd PID
```

# In the Docker container you are working

* The releases will be in ```/build/source/bin```  
* mc
  * via Midnight Commander you add to your repo via shell patrikx3@192.168.1.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/releases

# Create final firmware if source not working, only with image builder

## Linksys WRT1900ACS

**It is probably only needed for Linksys WRT1900ACS.**

For Linksys the raw build there is some bug, or needed a patch, so I use the image builder, with that, the network works right.

```bash
# Linksys WRT1900ACS
cd /build/lede-imagebuilder-17.01.3-mvebu.Linux-x86_64
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' .config
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="/usr/sbin#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-lede:/usr/sbin#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' repositories.conf
echo 'src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/darkmatter' >> repositories.conf
echo 'src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/redis' >> repositories.conf
echo 'src/gz reboot_node http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/node' >> repositories.conf
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
cat repositories.conf 


# opkg-list-installed.txt is in /router/{router} and I fill in there into the PACKAGES list
make -j9 image PROFILE=linksys-wrt1900acs PACKAGES="opkg-list-installed.txt" 
```


## Linksys WRT3200ACM

**It is probably only needed for Linksys WRT3200ACM**

For Linksys the raw build there is some bug, or needed a patch, so I need the image builder, with that the network works right.

```bash
# Linksys WRT3200ACM
cd /build/lede-imagebuilder-17.01.3-mvebu.Linux-x86_64
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' .config
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="/usr/sbin#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-lede:/usr/sbin#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' repositories.conf
echo 'src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/darkmatter' >> repositories.conf
echo 'src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/redis' >> repositories.conf
echo 'src/gz reboot_node http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/node' >> repositories.conf
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
cat repositories.conf 


# there is a weird module kmod-mwifiex-sdio and mwifiex-sdio-firmware , they say it is not working right now, so I skip
# opkg-list-installed.txt is in /router/{router} and I fill in there into the PACKAGES list
make -j9 image PROFILE=linksys-wrt3200acm PACKAGES="opkg-list-installed.txt" 
```
## Linksys WRT3200ACM-eduperez-mwlwifi

**It is probably only needed for Linksys WRT3200ACM**

For Linksys the raw build there is some bug, or needed a patch, so I need the image builder, with that the network works right.

```bash
# Linksys WRT3200ACM-eduperez-mwlwifi
cd /build/lede-imagebuilder-17.01.3-mvebu.Linux-x86_64
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' .config
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="/usr/sbin#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-lede:/usr/sbin#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' repositories.conf
echo 'src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/darkmatter' >> repositories.conf
echo 'src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/redis' >> repositories.conf
echo 'src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/arm_cortex-a9_vfpv3/node' >> repositories.conf
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
cat repositories.conf 

# there is a weird module kmod-mwifiex-sdio and mwifiex-sdio-firmware , they say it is not working right now, so I skip
# opkg-list-installed.txt is in /router/{router} and I fill in there into the PACKAGES list
make -j9 image PROFILE=linksys-wrt3200acm PACKAGES="opkg-list-installed.txt" 
```

In the end remove the firmwares like all-eduperez-mwlwifi*

## D-Link DIR-860l B1, it looks like the source built firmware works

But this is not needed, the source works, but just in case ...  
You can use the image builder for D-Link DIR-860l B1 as well.   
  
```bash
cd /build/lede-imagebuilder-17.01.3-ramips-mt7621.Linux-x86_64/
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' .config
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="/usr/sbin#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-lede:/usr/sbin#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.3#http://cdn.corifeus.com/lede/17.01.3#g' repositories.conf
echo 'src/gz reboot_darkmatter http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/darkmatter' >> repositories.conf
echo 'src/gz reboot_redis http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/redis' >> repositories.conf
echo 'src/gz reboot_node http://cdn.corifeus.com/lede/17.01.3/packages/mipsel_24kc/node' >> repositories.conf
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
cat repositories.conf 


# opkg-list-installed.txt is in /router/{router} and I fill in there into the PACKAGES list
make -j9 image PROFILE=dir-860l-b1 PACKAGES="firmware-opkg-list-installed.txt"
```
  
* mc
   * via Midnight Commander you add to your repo via shell patrikx3@192.168.78.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/router
* Copy the .config file to {router-name}/.config

### Does not needed for D-Link DIR-860l B1

* Go to MC via Shell
  * patrikx3@192.168.1.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/releases
* Copy the firmwares (the image-builder)

# Ext-root via USB driver

[Ext root README](ext-root.md)


# Use a built ready Docker image if there are updates

* Start the Docker with these images
  * ./run-d-link-dir-860l-b1
  * ./run-linksys-wrt
 
* If you want to copy .config, you are able to do like 
* mc
   * via Midnight Commander you add to your repo via shell patrikx3@192.168.78.30/home/patrikx3/Projects/patrikx3/p3x/lede-insomnia/router/{router}  
   
* **MAKE SURE TOUCH ALL .config FILES**   
  * touch .config
  * touch ../lede-imagebuilder-17.01.3-mvebu.Linux-x86_64/.config
  * touch ../lede-imagebuilder-17.01.3-mvebu.Linux-x86_64/repositories.conf
  * touch ../lede-imagebuilder-17.01.3-ramips-mt7621.Linux-x86_64/.config
  * touch ../lede-imagebuilder-17.01.3-ramips-mt7621.Linux-x86_64/repositories.conf
   

* check the source

```bash
cat package/base-files/image-config.in | grep default
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
```  

* check these the image-builder

```bash
cat .config | grep CONFIG_TARGET_INIT_PATH
cat .config | grep CONFIG_VERSION_REPO
```  

* update the feeds
```bash
# you probably dont need it, if this is the same version
./scripts/feeds update -a
./scripts/feeds install -a

# you start update when is new version node

# or darkmatter version
./scripts/feeds update -a -p darkmatter
./scripts/feeds install luci-theme-darkmatter

# i usually start here, like from nodejs 8.5 to 8.5.1 or 8.6
./scripts/feeds install -a -p node

# or new redis version like 4.0.1 to 4.0.2 or 4.1 etc..
./scripts/feeds update -a -p redis
./scripts/feeds install redis
```   
   
# If you want to create one package, it is like

Of course, you updated the older feeds or something. 

```bash
make package/feeds/redis/redis/clean V=s
make package/feeds/redis/redis/compile V=s

# or
make package/feeds/node/node/clean V=s
make package/feeds/node/node/compile V=s
```   
   
* pull source, add more packages, build new firmware's and on and on

## Linksys WRT1900ACS, Linksys WRT3200ACM and D-Link DIR-860l B1
```bash
# For D-Link DIR-860l B1,
# it asks some question for the verbose mode is required (i just clicked enter ..., might would be know what it is, something new, I will try it)
make -j9 menuconfig
make V=s
```

After the ```make``` it creates the packages from ```/build/source/``` ... It is above somewhere how to do it including the pre-build packages for your full router, like below...

For the firmware it is better to use the image-builder.  
It is in ```/build/lede-imagebuilder-17.01.3-mvebu.Linux-x86_64``` or ```/build/lede-imagebuilder-17.01.3-ramips-mt7621.Linux-x86_64```.
   
Voile, your packages all updated.
For the firmware there are some hacks (Linksys works with the image builder, D-Link works from the source).


[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.50-331 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 
 

[//]: #@corifeus-footer:end