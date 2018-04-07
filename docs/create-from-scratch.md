[//]: #@corifeus-header

# Latest Stable LEDE Version with many plus packages

                        
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
  * Linksys WRT Multiple  => Marvell Armada 37x/38x/XP
  * D-Link DIR-860l B1 => MediaTek Ralink MIPS
  * RPI 3 => Broadcom BCM27xx  
  
* Subtarget (Linksys missing this, not needed)
  * D-Link DIR-860l B1 => MT7621
  * RPI 3 => BCM2710  
  
* Target Profile  
  * D-Link DIR-860l B1 => D-Link DIR-860l B1  
    * Kernel type => MIPS FPU EMULATOR
      * it comes later with ```make -j9 kernel_menuconfig```, after the packages selected, just some info 
  * Linksys WRT Multiple => Multiple devices
  * RPI 3 => Raspberrry Pi 3 B/CM  


* Global build settings
  * Select all target specific packages by default
  * Select all kernel module packages by default
  * Select all userspace packages by default
  * Set build defaults for automatic builds
      
For multiple Linksys WRT go back to and select what is you want

* Target Devices (for now is only Linksys WRT Multiple)
  * Enable all profiles by default - UNCHECK
  * Use a per-device root filesystem that add profile packages
  * Linksys WRT1900ACS
  * Linksys WRT3200ACM

      
* Build the LEDE Image Build
  * Include package repositories
  
* Image configuration - ENTER
  * Version configuration options - ENTER
    * Release version code
      * insomnia    
    * Manufacturer name
      * p3x
    * Manufacturer URL
      * https://pages.corifeus.com/lede-insomnia
  * Seperate feed repositories
    * SELECT ALL
              
* Languages
  * Node.js
    * node
      * Configuration
        * Version Selection
          * 9.x
    * SELECT ALL
    
  * PHP
    * php7
    * SELECT ALL

* Libraries
  * libavahi-compat-libdnssd (*)          

* Network
  * Web Servers/Proxies
    * apache
      * Configuration - It is missing in 17.01.4
        * Enable HTTP2
    * nginx - Select then Enter
      * Configuration
        * Select all  
        
* Utilities
  * database
    * mariadb
      * mariadb-client
      * mariadb-client-extra
      * mariadb-server
        * ENTER
          *  Mariadb server lite - UNCHECK
          
  * mc - select then enter
    * Configuration
      * Enable internal editor - UNCHECK
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
```lede-insomnia/router/dir-860l-b1/source/target/linux/ramips/mt7621/config-4.4``` . 
 
More info: [D-Link DIR-860l B1](docs/d-link-dir860l-b1.md) .
 
 
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

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.183-976 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end