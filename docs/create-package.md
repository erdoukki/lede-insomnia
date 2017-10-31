[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
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
*   D-Link DIR 860L B1 => MediaTek Ralink MIPS 
* Target Profile
  * Linksys 1900ACS v2 => Linksys WRT1900ACS
  * D-Link DIR 860L B1 =>MT7621
* The Languages 
  *  Node.js, Select as M (module) 
    * Below this => Configuration => Select Version 8.x
  * node-npm, Select as M (module)
* Save
* Exit all

### Note
If your target machine is MIPS and there is no hardware FPU, you need MIPS_FPU_EMULATOR checked (see if there is fpuemustats in the /sys/kernel/debug/mips directory).

### Then you need first
```bash
make -j9 kernel_menuconfig
```

* Target System  
  * D-Link DIR-860L B1 MediaTek MT7621AT, target ```ramips / mt7621```, type ```mipsel_24kc```
    * MediaTek Ralink MIPS       
* Target Profile  
  * MT7621  
* Kernel type
  * Check MIPS FPU EMULATOR
* Save  
* Exit  

```bash
sed -i.bak 's#CONFIG_TARGET_INIT_PATH="#CONFIG_TARGET_INIT_PATH="/opt/router-scripts-lede:#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.4#http://cdn.corifeus.com/lede/17.01.4#g' .config
sed -i.bak 's#http://downloads.lede-project.org/releases/17.01.4#http://cdn.corifeus.com/lede/17.01.4#g' package/base-files/image-config.in
sed -i.bak 's#default "/usr/sbin#default "/opt/router-scripts-lede:/usr/sbin#g' package/base-files/image-config.in
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

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.64-493 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted) 


 

[//]: #@corifeus-footer:end