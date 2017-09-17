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