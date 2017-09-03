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

# Warning
Right now, there was a refactor, but it will be done soon, right it is either ```all-lede-*``` all  ```insomnia-lede-*``` firmwares are that are the best.

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


For Linksys WRT3200ACM worth trying, because my WIFI is about flying:
https://cdn.corifeus.com/lede/17.01.2/targets/mvebu/generic/insomnia-eduperez-mwlwifi-lede-17.01.2-mvebu-linksys-wrt3200acm-squashfs-factory.img

Since, I still do not know have to generate signatures, for now, you need to disable signature verification, and then you can easy update/install/upgrade. The easiest solution I know is via LUCI :  
[http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg](http://192.168.1.1/cgi-bin/luci/admin/system/packages/ipkg)    
  
In the **Configuration** tab, comment like this:  
```#option check_signature 1```
  
Once, I get there generating signatures, I will fix it as well...

## Docker

## Some helper is the source with all the add-ons
These are the helpers for the raw image (```patrikx3/lede-insomnia:latest```) that is creates new images from:
```bash
# All adds the plus feeds (node, redis, darkmatter), image builder and node, redis 4, fixes Apache builder
# All set for the .config. feeds.conf and in the build the repositories.confg

# the make will ask for a question you can just enter out to 
# continue to build
# still is not configured so it is automatic
# the default packages http url is http://cdn.corifeus.com/lede/17.01.2
./make-d-link-dir-860l-b1
./make-linksys-wrt1900acs
./make-linksys-wrt3200acm

# As additional adds eduperez-mwlwifi_LEDE
./make-linksys-wrt3200acm-eduperez-mwlwifi

# but you can use you own url like
# it is important to not have a slash at the end 
./make-d-link-dir-860l-b1 "http://cdn.mine.com"
./make-linksys-wrt1900acs "http://cdn.mine.com"
./make-linksys-wrt3200acm "http://cdn.mine.com"
./make-linksys-wrt3200acm-eduperez-mwlwifi "http://cdn.mine.com"
```

### Changing the firmware 

## Pre-built

All the latest stable LEDE versions.

* docker pull patrikx3/lede-insomnia:linksys-wrt1900acs
* docker pull patrikx3/lede-insomnia:linksys-wrt3200acm
* docker pull patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi
* docker pull patrikx3/lede-insomnia:d-link-dir-860l-b1

# My repos    
   
https://hub.docker.com/r/patrikx3/lede-insomnia/tags/

https://cdn.corifeus.com/lede/  

# Linksys WRT Radar Detection
Tested on WRT1900ACSv2 and WRT3200ACM, I think most should work.  
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
[README for create from scratch](create-from-scratch.md)


[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.9-73

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end