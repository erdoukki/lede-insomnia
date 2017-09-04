[//]: #@corifeus-header

  [![Build Status](https://travis-ci.org/patrikx3/lede-insomnia.svg?branch=master)](https://travis-ci.org/patrikx3/lede-insomnia)  [![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/patrikx3/lede-insomnia/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/patrikx3/lede-insomnia/?branch=master)  [![Code Coverage](https://scrutinizer-ci.com/g/patrikx3/lede-insomnia/badges/coverage.png?b=master)](https://scrutinizer-ci.com/g/patrikx3/lede-insomnia/?branch=master) 

---

 
# Latest Stable LEDE Version with many plus packages

This is an open source project. Just code.

### Node Version Requirement 
``` 
>=7.8.0 
```  
   
### Built on Node 
``` 
v8.4.0
```   
   
The ```async``` and ```await``` keywords are required.

Install NodeJs:    
https://nodejs.org/en/download/package-manager/    

# Description  

                        
[//]: #@corifeus-header:end

# LEDE Latest Stable build with custom NodeJs > 8.4, LUCI dark matter, eduperez/mwlwifi_LEDE's WIFI driver, Redis 4

... and many pre-built packages and firmwares, image builder, Linksys WR1900ACS/WRT3200ACM and D-Link DIR860l B1 is already built, but based on the READMEs, you can built a new one easy.  

## Requirements

**Docker CE**

## Info

[Redis 4 is here!](https://cdn.corifeus.com/lede/17.01.2/packages/arm_cortex-a9_vfpv3/redis/)!!!!

For your workstation you don't really NodeJs, but my Travis, Scrutinizer and my auto generated web sites are required...   
   
This is a LEDE Docker builder and a living Docker repo as well, ready to build, a lot already built.
(A big image but the most important packages are already built.)  

# Routers pre-built

If you want to install right away with LUCI:
https://cdn.corifeus.com/lede/17.01.2/

* Linksys WRT1900ACS / Linksys WRT3200ACM /Linksys WRT3200ACM-eduperez-mwlwifi
  * https://cdn.corifeus.com/lede/17.01.2/targets/mvebu/generic/
* D-Link DIR-860l B1
  * https://cdn.corifeus.com/lede/17.01.2/targets/ramips/mt7621/

If you choose the once that start with ```insomnia-```, it includes everything I could add in.


For Linksys the firmwares that start with ```insomnia-eduperez-mwlwifi``` worth trying, because your WIFI is will be flying:
https://cdn.corifeus.com/lede/17.01.2/targets/mvebu/generic/

Since, I still do not know have to generate signatures, for now, you need to disable signature verification, and then you can easy update/install/upgrade. The easiest solution I know is via LUCI :  
[http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg](http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg)    
  
In the **Configuration** tab, comment like this:  
```#option check_signature 1```
  
#### Once, I get there generating signatures, I will fix it as well...

## Docker

## Some helper is the source with all the add-ons
These are the helpers for the raw image (```patrikx3/lede-insomnia:latest```) that creates new images from raw. Of course, if you use the ```Docker Images``` with the tag, have pre-built, so if you use add / remove anything, the build will be much faster, because some will not will be needed ```compiled```.  

The tags are here:
https://hub.docker.com/r/patrikx3/lede-insomnia/tags/  
    
So building from a raw image:
```bash
docker pull patrikx3/lede-insomnia:latest
./run

# All adds the plus feeds (node, redis, darkmatter), image builder and node, redis 4, fixes Apache builder
# All set for the .config. feeds.conf and in the image builder in the repositories.confg

# the default packages http url is http://cdn.corifeus.com/lede/17.01.2

# for d-link dir 860l b1
# the make will ask for a question you can just enter out to 
# continue to build
# still is not configured so it is automatic
./make-d-link-dir-860l-b1

# here no questions in the make
./make-linksys-wrt1900acs
./make-linksys-wrt3200acm

# As additional adds eduperez-mwlwifi_LEDE
./make-linksys-wrt1900acs-eduperez-mwlwifi
./make-linksys-wrt3200acm-eduperez-mwlwifi

# DEBUG DEBUG DEBUG
# find -iname '*iwlwifi*'
# find -iname '*iwlwifi*' -exec rm -rf {} +
# rm /build/source/staging_dir/packages/mvbeu/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
# rm /build/source/bin/targets/mvebu/generic/packages/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
# rm /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/lede-imagebuilder-17.01.2-mvebu.Linux-x86_64/packages/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
# make package/kernel/mwlwifi/{clean,prepare,compile}


# but you can use you own url
# where you upload your own targets/packages
# it is important to not have a slash at the end 
./make-d-link-dir-860l-b1 "http://cdn.mine.com"
./make-linksys-wrt1900acs "http://cdn.mine.com"
./make-linksys-wrt3200acm "http://cdn.mine.com"
./make-linksys-wrt1900acs-eduperez-mwlwifi "http://cdn.mine"  
./make-linksys-wrt3200acm-eduperez-mwlwifi "http://cdn.mine.com"
```

All built packages and firmwares including the ```insomnia``` firmwares are in ```/build/source/bin```. 

### Changing the firmware 

## Pre-built

All the latest stable LEDE versions.

* docker pull patrikx3/lede-insomnia:linksys-wrt1900acs
* docker pull patrikx3/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi
* docker pull patrikx3/lede-insomnia:linksys-wrt3200acm
* docker pull patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi
* docker pull patrikx3/lede-insomnia:d-link-dir-860l-b1

You run them, but these here, the built is in: http://cdn.corifeus.com/lede/17.01.2, all the built packages and firmwares in ```/build/source/bin```, you move to a host, install the firmware and you are done, because in the ```insomnia``` firmwares there is a lot in, but this is the default, so you need to change your own hostname here:
[http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg](http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg) at ```Configuration``` tab.

You can choose to your host.  

# My repos    
   
https://hub.docker.com/r/patrikx3/lede-insomnia/tags/

https://cdn.corifeus.com/lede/  

# Linksys WRT Radar Detection
Tested on WRT1900ACSv2 and WRT3200ACM, I think will work.  
[README](linksys-wrt-radar-detection.md)

## How I built these Dockers via these links
[README](links-i-used.md)

## Docker commands
[README](docker-commands.md)

## Create packages, not neeed anymore
[My first package](create-package.md)

## Use Fail2Ban on your router
[Fail2Ban though is for DDWRT, but it is the same to set it up with LEDE with some changes, if you need info, I can give you, just it is mine private git server because of passwords.](fail2ban.md)


# Create from scratch
[README](create-from-scratch.md)


[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.10-39

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end