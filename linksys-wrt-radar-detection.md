[//]: #@corifeus-header

## Latest Stable LEDE Version with many plus packages

---
                        
[//]: #@corifeus-header:end
# DFS / Radar Detection

It works with all Linksys latest WRT (I tested WRT1900ACS v2 and WRT3200ACM).  

Based on:  
https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307984048

## To make it work

You need to remove these:

```bash
opkg remove mwifiex-sdio-firmware kmod-mwifiex-sdio
```

In the router, check the status:

```bash
iw reg get
```

Result (of course mine is good by now):
```text
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#1
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)

phy#0
country FR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
```

What you need to test in the WIFI is to make sure that use the same country even though you bought like in Hungary. So if phy#1, phy0 says **FR**, then you need to set in you WIFI, the same country!!!

It is this https://192.168.78.1/cgi-bin/luci/admin/network/wireless/radio0.network1 at the ```Advanced Settings```, so make sure all WIFI use that! I think in Europe it is always France.
[//]: #@corifeus-footer

---

[**P3X-LEDE-INSOMNIA**](https://pages.corifeus.com/lede-insomnia) Build v1.1.9-73

[Corifeus](http://www.corifeus.com) by [Patrik Laszlo](http://patrikx3.com)

[//]: #@corifeus-footer:end