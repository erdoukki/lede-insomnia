[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# WPS

https://lede-project.org/docs/user-guide/wifi_configuration#wps_options

Minimal steps needed to get WPS running:

* Add ```option wps_pushbutton '1'``` to a config ```wifi-iface``` section that is configured for WPA2-PSK in ```/etc/config/wireless```
* opkg update
* opkg remove wpad-mini
* opkg install wpad hostapd-utils
* reboot && exit

## Actual Linksys 3200ACM WPS

Do what it says above. Then on router on the bottom right there is the WPS button. Click for like 3 seconds or more and it will work.

### Example

```text
config wifi-iface 'default_radio0'
    option device 'radio0'
    option mode 'ap'
    option ssid 'patrikx3-digi'
    option encryption 'psk2'
    option key ''*********'
    option network 'lan'
    option wps_pushbutton '1'
    
config wifi-iface 'default_radio1'
    option device 'radio1'
    option mode 'ap'
    option ssid 'patrikx3-digi-slow'
    option encryption 'psk2'
    option key '*********'
    option network 'lan'
    option wps_pushbutton '1'
```



[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.49-330 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 
 

[//]: #@corifeus-footer:end