[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Linksys USB-TTL

```bash
ufw disable
ls -l /dev/ttyUSB*
apt -y install screen
sudo screen /dev/ttyUSB0 115200,cs8,-ixon,ixoff,-istrip

reboot

setenv ipaddr 192.168.1.1
setenv netmask 255.255.255.0
setenv serverip 192.168.1.33
setenv firmwareName insomnia-eduperez-mwlwifi-lede-mvebu-linksys-wrt3200acm-squashfs-factory.img
run update_both_images
```

```bash
ufw enable
```
[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.138-788 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=LFRV89WPRMMVE&lc=HU&item_name=Patrik%20Laszlo&item_number=patrikx3&currency_code=HUF&bn=PP%2dDonationsBF%3abtn_donate_SM%2egif%3aNonHosted)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## Sponsor

[![JetBrains](https://www.patrikx3.com/images/jetbrains-logo.svg)](https://www.jetbrains.com/)
  
 

[//]: #@corifeus-footer:end