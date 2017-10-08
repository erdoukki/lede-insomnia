[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# Kernel

#### ```CONFIG_IMG_MDC_DMA=y```

```bash
cp -avr /build/router/dir-860l-b1/source/. /build/source
./scripts/diffconfig.sh
grep -r "IMG_MDC_DMA" /build/source
```

Disable IMG_MDC_DMA
[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.42-280

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end