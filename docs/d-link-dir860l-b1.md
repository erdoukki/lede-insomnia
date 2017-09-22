# Kernel

#### ```CONFIG_IMG_MDC_DMA=y```

```bash
cp -avr /build/router/dir-860l-b1/source/. /build/source
./scripts/diffconfig.sh
grep -r "IMG_MDC_DMA" /build/source
```

Disable IMG_MDC_DMA