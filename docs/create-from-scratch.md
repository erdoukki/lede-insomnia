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
  * MT7621   
* Target Profile  
  * Linksys WRT1900ACS => Linksys WRT1900ACS
  * Linksys WRT3200ACM => Linksys WRT3200ACM
  * D-Link DIR-860l B1 => MT7621  
    * Kernel type => MIPS FPU EMULATOR
      * it comes later with ```make -j9 kernel_menuconfig```, after the packages selected, just some info    
* Global build settings
  * Select all target specific packages by default
  * Select all kernel module packages by default
* Build the LEDE Image Build
  * Include package repositories
* Image configuration - ENTER
  * Version configuration options - ENTER
    * Release version nickname
      * INSOMNIA    
    * Manufacturer name
      * p3x
    * Manufacturer URL
      * https://pages.corifeus.com/lede-insomnia
* LUCI
  * Collections
    * luci
    * luci-ssl-openssl
  * Modules
    * luci-base
    * luc-mode-admin-full
  * Applications
    * luci-add-ntpc
    * luci-app-openvpn
    * luci-app-qos
    * luci-app-samba
    * luci-app-statistics
    * luci-add-uhttpd
    * luci-app-upnp
    * luci-app-wol
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
          * 9.x
    * SELECT ALL
  * PHP
    * php7
    * PHP7 Filter support
    * SELECT ALL
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
  * Routing and Redirection
    * ip-full
  * SSH
    * openssh-client
    * openssh-client-utils
    * openssh-sftp-server
  * VPN
    * openvpn-easy-rsa
    * openvpn-openssl
    * ipsec-tools
    * xl2tpd   
  * Version Control Systems
    * git
    * git-http
  * Web Servers/Proxies
    * apache (**if you added the patches**)
    * nginx - Select then Enter
      * Configuration
        * Select all
  * 6in4
  * cifsmount
  * hostapd-common
  * hostpad-utils
  * ppp
    * ppp-mod-pppol2tp
    * ppp-mod-pptp
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
  * Shell
    * bash 
  * database
    * mariadb
      * mariadb-client
      * mariadb-client-extra
      * mariadb-server
        * ENTER
          * clear Mariadb server lite, use full
  * bonniexx
  * coreutils - select then enter to choose
    * coreutils-date
    * coreutils-dirname
    * coreutils-md5sum
    * coreutils-nice
    * coreutils-printf
    * coreutils-readlink
    * coreutils-realpath
    * coreutils-rm
    * coreutils-rmdir
    * coreutils-sha1sum
    * coreutils-sha224sum
    * coreutils-sha256sum
    * coreutils-sha384sum
    * coreutils-sha512sum
    * coreutils-sleep
    * coreutils-tail
    * coreutils-touch
    * coreutils-uname
  * findutils-find
  * findutils-locate
  * findutils-xargs
  * grep
  * hwclock
  * less
  * less-wide
  * logrotate
  * mc - select then enter
    * Configuration
      * Enable internal editor - CLEAR, DISABLE
  * mount-utils
  * procps-ng - select then enter 
    * select all as a module
  * tar
  * whereis       
* Exit
* YES

Copy the .config file to {router-name}/.config

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

For DIR DIR-860L B1, there is no option ```CONFIG_IMG_MDC_DMA=y```, so you have to add in here:
```lede-insomnia/router/dir-860l-b1/source/target/linux/ramips/mt7621/config-4.4```. 
 
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


[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.70-517 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted) 


 

[//]: #@corifeus-footer:end