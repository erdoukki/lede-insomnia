## Bulding

### It is very important so that Makefile is a TAB instead 8 spaces!   

#### Help for creating patching with packages
https://lede-project.org/docs/guide-developer/use-patches-with-buildsystem   
  
### To create the patch

```bash
make package/feeds/redis/redis/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/redis-4.0.2

# or
cd /build/source/build_dir/target-mips_24kc_musl-1.1.16/redis-4.0.2/

quilt push -a
quilt new 010-redis.patch
quilt edit ./deps/jemalloc/src/pages.c 
quilt edit src/Makefile 
# if work with CONFIG_EDAC_ATOMIC_SCRUB if it is atomic instructions or threads 
quilt edit src/atomicvar.h
quilt series
quilt diff
quilt refresh
```

### To edit a patch

```bash
make package/feeds/redis/redis/{clean,prepare} V=s QUILT=1

# either
cd /build/source/build_dir/target-arm_cortex-a9+vfpv3_musl-1.1.16_eabi/redis-4.0.2/

# or
cd /build/source/build_dir/target-mipsel_24kc_musl-1.1.16/redis-4.0.2

# or
cd /build/source/build_dir/target-mips_24kc_musl-1.1.16/redis-4.0.2/

quilt series
quilt refresh
quilt push 010-redis.patch
quilt edit ./deps/jemalloc/src/pages.c 
quilt edit src/Makefile 
quilt edit src/atomicvar.h
quilt diff
quilt refresh
```
