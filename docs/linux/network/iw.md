# iw

### Print wifi access points sorted by signa
```sh
iw dev IFACE scan | egrep "SSID|signal" | awk -F ":" '{print $2}' | sed 'N;s/\n/:/' | sort
```