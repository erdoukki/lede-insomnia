[//]: #@corifeus-header

# ☕ Latest Stable LEDE Version with many plus packages

                        
[//]: #@corifeus-header:end

# Create packages

## For starting, I was using these URL's for NodeJs packages
https://github.com/nxhack/openwrt-node-packages  
https://github.com/nxhack/openwrt-node-packages/issues/15

# Create a Docker image:  

```
./build
```

## Before you create(s) the new same package(s), uninstall the current package(s)! 
Like ```opkg remove node```, ```opkg remove node-npm``` and then ```opkg install node_v8.2.1.ipk``` etc ... !!!!


## Start

```bash
./run
make -j9 menuconfig
```

* Target System
*   Linksys 1900ACS v2 => Marvell Armada 37x/38x/XP
* Target Profile
  * Linksys 1900ACS v2 => Linksys WRT1900ACS
* The Languages 
  *  Node.js, Select as M (module) 
    * Below this => Configuration => Select Version 8.x
  * node-npm, Select as M (module)
* Save
* Exit all

```bash
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-openwrt:#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.4#http://cdn.corifeus.com/lede/17.01.4#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.4#http://cdn.corifeus.com/lede/17.01.4#g' package/base-files/image-config.in
sed -i.bak 's#default "/usr/sbin#default "/opt/router-scripts-openwrt:/usr/sbin#g' package/base-files/image-config.in
echo "CONFIG_VERSION_REPO=\"http://cdn.corifeus.com/lede/17.01.4\"" >> .config
cat package/base-files/image-config.in | grep default
cat .config | grep CONFIG_VERSION_REPO
cat .config | grep CONFIG_TARGET_INIT_PATH 

# -jX is the number of threads of you CPU, I got 8
make -j9
# if error
make -j1 V=s
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