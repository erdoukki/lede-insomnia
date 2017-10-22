[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end

# Linksys WRT 3200ACM 160Mhz

You have to find out the channel that in your country was setup with the router is working.
For me, I am Hungarian, but the router is FR based in FRANCE in EUROPE (or European Linksys is usually is FR), the ```120 channel``` is working well.

But for now, it is using the ```radar detection``` and it is changing the channels and it works.

## Check status

```bash
iw reg get
iw dev
```

## Picture

![Linksys-3200ACM-160Mhz](artifacts/images/Linksys-3200ACM-160Mhz.png "Linksys-3200ACM-160Mhz") 

## This is important

http://192.168.1.1/cgi-bin/luci/admin/network/wireless/radio0.network1

Below:
```Wireless scurity``` set ```Cipher``` to ```Force CCMP (AES)```.

```bash
reboot && exit
```

[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v17.1.54-389 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) 
 

[//]: #@corifeus-footer:end