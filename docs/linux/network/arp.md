# arp

### arp-scan -l without duplicates

```sh
arp-scan -l -g -interface (nic)
```

### Determine MAC address of remote host when you know its IP address
```sh
arping 192.168.1.2
```

### Add static arp entry to default gateway, arp poison protection
```sh 
arp -s $(route -n | awk '/^0.0.0.0/ {print $2}') \ $(arp -n | grep `route -n | awk '/^0.0.0.0/ {print $2}'`| awk '{print $3}')
```

### Scan for [samba|lanman] NetBIOS names and ip addresses in LAN by ARP.
```sh
arp-scan -I eth0 -l | perl -ne '/((\d{1,3}\.){3}\d{1,3})/ and $ip=$1 and $_=`nmblookup -A $ip` and /([[:alnum:]-]+)\s+<00>[^<]+<ACTIVE>/m and printf "%15s  %s\n",$ip,$1'
```

### List wireless clients connected to an access point
```sh
arp -i <interface>
```

### Determine MAC address of remote host when you know its IP address
```sh
arping 192.168.1.2
```

### Add static arp entry to default gateway, arp poison protection
```sh 
arp -s $(route -n | awk '/^0.0.0.0/ {print $2}') \ $(arp -n | grep `route -n | awk '/^0.0.0.0/ {print $2}'`| awk '{print $3}')
```

### Scan for [samba|lanman] NetBIOS names and ip addresses in LAN by ARP.
```sh
arp-scan -I eth0 -l | perl -ne '/((\d{1,3}\.){3}\d{1,3})/ and $ip=$1 and $_=`nmblookup -A $ip` and /([[:alnum:]-]+)\s+<00>[^<]+<ACTIVE>/m and printf "%15s  %s\n",$ip,$1'
```

### List wireless clients connected to an access point
```sh
arp -i <interface>
```
