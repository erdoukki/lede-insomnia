# DEBUG DEBUG DEBUG

```bash
# this is the good
find -iname '*kmod-mwlwifi*'

# these are all wrong :/
find -iname '*iwlwifi*'
find -iname '*iwlwifi*' -exec rm -rf {} +
find -iname '*kmod-iwlwifi*'
rm /build/source/staging_dir/packages/mvbeu/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
rm /build/source/bin/targets/mvebu/generic/packages/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
rm /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/lede-imagebuilder-17.01.2-mvebu.Linux-x86_64/packages/kmod-iwlwifi_4.4.71+2017-01-31-2_arm_cortex-a9_vfpv3.ipk
make clean
make dirclean # remove the toolchain as well 
make package/kernel/mwlwifi/{clean,prepare,compile}
```