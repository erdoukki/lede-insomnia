# Linksys USB-TTL

```bash
ls -l /dev/ttyUSB*
apt -y install screen
sudo screen /dev/ttyUSB0 115200,cs8,-ixon,ixoff,-istrip

reboot

setenv ipaddr 192.168.1.1
setenv netmask 255.255.255.0
setenv serverip 192.168.1.33
setenv firmwareName firmware-name
run update_both_images
```