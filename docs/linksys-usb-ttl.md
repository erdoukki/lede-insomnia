[//]: #@corifeus-header

# ☕ Latest Stable LEDE Version with many plus packages

                        
[//]: #@corifeus-header:end
# Linksys USB-TTL


# TFTPD Install

https://www.hiroom2.com/2017/07/02/debian-9-tftpd-hpa-en/

```bash
apt install -y tftpd-hpa
systemctl disable tftpd-hpa
service tftpd-hpa start 
```

The default folder is:  
`/etc/default/tftpd-hpa`
which defaults to  
`/var/lib/tftpboot`


# TTL

```bash
ufw disable
ls -l /dev/ttyUSB*
apt -y install screen
sudo screen /dev/ttyUSB0 115200,cs8,-ixon,ixoff,-istrip
sudo screen /dev/ttyUSB1 115200,cs8,-ixon,ixoff,-istrip

reboot

setenv ipaddr 192.168.1.1
setenv netmask 255.255.255.0
setenv serverip 192.168.1.33

setenv firmwareName insomnia-latest-mwlwifi-lede-17.01.4-mvebu-linksys-wrt1900acs-squashfs-factory.img

setenv firmwareName insomnia-latest-mwlwifi-lede-17.01.4-mvebu-linksys-wrt3200acm-squashfs-factory.img

run update_both_images
```

```bash
ufw enable
service tftpd-hpa stop
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