[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
## Docker commands

```bash
# build new images
docker build -t patrikx3/lede-insomnia .

# run an image
docker run -t -i patrikx3/lede-insomnia bash

# list containers
docker ps

# run into an existing container that is running
docker exec -it <containerIdOrName> bash

# create an image for a container like
docker commit <container id> patrikx3/lede-insomnia:linksys-wrt1900acs
docker commit <container id> patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi
docker commit <container id> patrikx3/lede-insomnia:d-link-dir-860l-b1
docker commit <container id> patrikx3/lede-insomnia:linksys-wrt3200acm
docker commit <container id> patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi

# docker login before pushing
docker login

# list docker images
docker images

# upload an image to the registry
docker push patrikx3/lede-insomnia:latest
docker push patrikx3/lede-insomnia:d-link-dir-860l-b1
docker push patrikx3/lede-insomnia:linksys-wrt1900acs
docker push patrikx3/lede-insomnia:linksys-wrt3200acm
docker push patrikx3/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi
docker push patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi
```

### Save images
```bash
mkdir -p /media/backup/backup/docker
docker save patrikx3/lede-insomnia:latest | gzip > /media/backup/backup/docker/lede-insomnia:latest.tgz
sleep 5
docker save patrikx3/lede-insomnia:d-link-dir-860l-b1 | gzip > /media/backup/backup/docker/lede-insomnia:d-link-dir-860l-b1.tgz
sleep 5
docker save patrikx3/lede-insomnia:linksys-wrt1900acs | gzip > /media/backup/backup/docker/lede-insomnia:linksys-wrt1900acs.tgz
sleep 5
docker save patrikx3/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi | gzip > /media/backup/backup/docker/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi.tgz
sleep 5
docker save patrikx3/lede-insomnia:linksys-wrt3200acm | gzip > /media/backup/backup/docker/lede-insomnia:linksys-wrt3200acm.tgz
sleep 5
docker save patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi | gzip > /media/backup/backup/docker/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi.tgz
```

### Load image
```bash
gunzip -c /media/backup/backup/docker/lede-insomnia:latest.tgz | docker load
sleeep 5
gunzip -c /media/backup/backup/docker/lede-insomnia:d-link-dir-860l-b1.tgz | docker load
sleep 5
gunzip -c /media/backup/backup/docker/lede-insomnia:linksys-wrt1900acs.tgz | docker load
sleep 5
gunzip -c /media/backup/backup/docker/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi.tgz | docker load
sleep 5
gunzip -c /media/backup/backup/docker/lede-insomnia:linksys-wrt3200acm.tgz | docker load
sleep 5
gunzip -c /media/backup/backup/docker/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi.tgz | docker load
```

### For running or paused docker, use export:

```bash
docker export <dockernameortag> | gzip > mycontainer.tgz
```

### Get from the registry
```bash
docker pull patrikx3/lede-insomnia:latest
docker pull patrikx3/lede-insomnia:d-link-dir-860l-b1
docker pull patrikx3/lede-insomnia:linksys-wrt1900acs
docker pull patrikx3/lede-insomnia:linksys-wrt1900acs-eduperez-mwlwifi
docker pull patrikx3/lede-insomnia:linksys-wrt3200acm
docker pull patrikx3/lede-insomnia:linksys-wrt3200acm-eduperez-mwlwifi
```

[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.11-58

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end