[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Strongswan VPN

Set config:

```
#kernel-modules---network-support	kmod-ipsec
#kernel-modules---network-support	kmod-ipsec4	
#kernel-modules---network-support	kmod-ipsec6	
#kernel-modules---netfilter-extensions	kmod-ipt-ipsec	

network---vpn strongswan
network---vpn	ipsec-tools
network---vpn	strongswan-mod-kernel-libipsec	5.5.3-1	
network---firewall	iptables-mod-ipsec
network---open-vswitch	openvswitch-ipsec	
luci strongswan?
```

Set menu config:

```bash
cp -avr /build/router/dir-860l-b1/source/. /build/source
cp -avr /build/router/linksys-wrt1900acs/source/. /build/source
cp -avr /build/router/linksys-wrt3200acm/source/. /build/source
```

## Settings
* Luci
  * Modules
    * Translations
      * Hungarian = M
  * Application
    * luci-app-uhttpd

* Network
  * Firewall
    * iptables
      * Enter
        * iptables-mod-ipsec
  * Open vSwitch
    * openswitch-ipsec
  * VPN
    * ipsec-tools
    * strongswan-full
    * strongswan-mod-kernel-libipsec

[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/) Build v1.1.40-277

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end