[//]: #@corifeus-header

# ☕ Latest Stable LEDE Version with many plus packages

                        
[//]: #@corifeus-header:end
# Info 
About updating new node version it is in README.md and create-from-scratch.md

# Terminal 1

```bash
./build-docker

# you can execute the first line in Terminal 3
# continue and start Terminal 1 and Terminal 2
./run
./make-d-link-dir-860l-b1
```

# Terminal 2
```bash
# after Terminal 1 ./build-docker is finished
./run
./make-linksys-wrt
# no execute Terminal 3
```

# Terminal 3

```bash
docker push patrikx3/lede-insomnia:latest

docker commit CONTAINER_ID patrikx3/lede-insomnia:d-link-dir-860l-b1
docker push patrikx3/lede-insomnia:d-link-dir-860l-b1

docker commit CONTAINER_ID patrikx3/lede-insomnia:linksys-wrt
docker push patrikx3/lede-insomnia:linksys-wrt
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