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