[//]: #@corifeus-header

# ☕ Latest Stable LEDE Version with many plus packages

                        
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
  * Marvell Armada 37x/38x/XP => Linksys WRT Multiple 
  * Broadcom BCM27xx => RPI 3   
  
* Subtarget (Linksys missing this, not needed)
  * BCM2710 => RPI 3 
  
* Target Profile  
  * Multiple devices => Linksys WRT Multiple
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
          * 10.x
    * SELECT ALL
    
  * PHP
    * php7
    * SELECT ALL

* Libraries
  * libavahi-compat-libdnssd (*)          

* Network
  * Web Servers/Proxies
    * nginx - Select then Enter
      * Configuration
        * Select all  

* Utililties
  * mc --->
    * Configuration
      * enable internal editor UNCHECK
      
* Exit
* YES

Copy the .config file to {router-name}/.config

 
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

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v2018.9.16-2 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end