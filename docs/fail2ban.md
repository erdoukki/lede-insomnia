[//]: #@corifeus-header

# ☕ Latest Stable LEDE Version with many plus packages

                        
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

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v2018.9.16-2 

[![Like Corifeus @ Facebook](https://img.shields.io/badge/LIKE-Corifeus-3b5998.svg)](https://www.facebook.com/corifeus.software) [![Donate for Corifeus / P3X](https://img.shields.io/badge/Donate-Corifeus-003087.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QZVM4V6HVZJW6)  [![Contact Corifeus / P3X](https://img.shields.io/badge/Contact-P3X-ff9900.svg)](https://www.patrikx3.com/en/front/contact) 


## P3X Sponsors

[IntelliJ - The most intelligent Java IDE](https://www.jetbrains.com)
  
[![JetBrains](https://cdn.corifeus.com/assets/svg/jetbrains-logo.svg)](https://www.jetbrains.com/) [![NoSQLBooster](https://cdn.corifeus.com/assets/png/nosqlbooster-70x70.png)](https://www.nosqlbooster.com/)

[The Smartest IDE for MongoDB](https://www.nosqlbooster.com)
  
  
 

[//]: #@corifeus-footer:end