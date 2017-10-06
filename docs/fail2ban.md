[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Fail2Ban is not easy, but can be done cooly!

It is for DDWRT, but even easier to use with ExtRoot and LEDE. Just don't have enough time to write down everything.

Right now, I use git but you can download the latest as well.

```bash
opkg install git git-http bash ca-bundle ca-certificates python  
 
cd /opt 
git clone https://github.com/fail2ban/fail2ban.git 
cd fail2ban 
mkdir -p /opt/log
mkdir -p /opt/run/fail2ban
mkdir -p /opt/lib/fail2ban/
cp /opt/fail2ban/config/jail.conf /opt/fail2ban/config/jail.local
cp /opt/fail2ban/config/fail2ban.conf /opt/fail2ban/config/fail2ban.local

```

# Required modification for ```fail2ban.local```
```
logtarget = /opt/log/fail2ban.log
socket = /opt/run/fail2ban/fail2ban.sock
pidfile = /opt/run/fail2ban/fail2ban.pid
dbfile = /opt/lib/fail2ban/fail2ban.sqlite3
```

# Setup
There will be an info that /etc/fail2ban is not writable, but it is not a problems
```
cd /opt/fail2ban 
setup.py install 
```

# Init script ```/opt/etc/init.d/fail2ban```
```bash
#!/usr/bin/env bash
/opt/bin/python /opt/fail2ban/bin/fail2ban-server -c /opt/fail2ban/config/ $1
```

# Startup command in like DDWRT

```bash
/opt/etc/init.d/fail2ban start
```

# Shutdown command in like DDWRT command
```bash
/opt/etc/init.d/fail2ban stop
```

by Patrik aka ```p3x-robot / p3x / corifeus```
[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.37-262

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end