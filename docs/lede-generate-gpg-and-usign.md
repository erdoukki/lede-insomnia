[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Generate GPG and USIGN files

https://lede-project.org/docs/user-guide/keygen#generate_key_pair

Follow steps in the url aboce.

# TO GENERATE ON YOUR ON WORKSTATION

sudo apt install cmake
cd /build
git clone https://git.openwrt.org/project/usign.git
cd usign/
cmake .
make
sudo cp ./usign /usr/bin/usign
sudo chmod +x /usr/bin/usign


./usign -G -c "LEDE usign key of Patrik Laszlo / patrikx3" -s secret.key -p public.key

# Use the LEDE keyring

```bash
git clone https://git.lede-project.org/keyring.git
gpg --keyserver hkp://pool.sks-keyservers.net --send-keys 95F12499

cd ~/Projects/keyring/gpg/
gpg --armor --export --no-version --comment="LEDE usign key of Patrik Laszlo / patrikx3" 95F12499 > 95F12499.asc
git add 95F12499.asc
git commit -sm "LEDE usign key of Patrik Laszlo / patrikx3"

usign public key 25ad50a827ee6b11
```
[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.37-262

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end