# iptables 

### Block an IP address
```sh
iptables -A INPUT -s 65.55.44.100 -j DROP
```

### View your machine firewall settings
```sh
iptables -L -n -v
```

### Delete all firewall rules in a chain or all chains
```sh
iptables -F
```

### Show current iptables rules, with line numbers
```sh
iptables -nL -v line-numbers
```

### Tired of switching between proxy and no proxy? here's the solution.
```sh
iptables -t nat -A OUTPUT -d ! 10.0.0.0/8 -p tcp dport 80 -j DNAT to-destination 10.1.1.123:3128
```

### Get an IP address out of fail2ban jail
```sh
iptables -D fail2ban-SSH -s <ip_address_to_be_set_free> -j DROP
```

### Route outbound SMTP connections through a addtional IP address rather than your primary
```sh
iptables -t nat -A POSTROUTING -p tcp dport 25 -j SNAT to-source IP_TO_ROUTE_THROUGH
```

### Remove specific entries from iptables
```sh
iptables -L INPUT line-numbers
```

### Check for Firewall Blockage.
```sh
iptables -L -n line-numbers | grep xx.xx.xx.xx
```

### Delete an IPtable rules based on row number
```sh
iptables -L -vnx line-numbers; iptables -t nat -D <chain-name> <number>
```

### Redirect port 80 to 8080
```sh
iptables -t nat -A PREROUTING -i eno12345678 -p tcp dport 80 -j REDIRECT to-port 8080
```

### Cloack an IP range from some IPs via iptables
```sh
iptables -A FORWARD -i br0 -m iprange src-range 192.168.0.x-192.168.0.y -m iprange dst-range 192.168.0.w-192.168.0.z  -j DROP
```

### Persistent saving of iptables rules
```sh
iptables-save > firewall.conf; rm -f /etc/network/if-up.d/iptables; echo '#!/bin/sh' > /etc/network/if-up.d/iptables; echo "iptables-restore < firewall.conf" >> /etc/network/if-up.d/iptables; chmod +x /etc/network/if-up.d/iptables
```

### Block an IP address from connecting to a server
```sh
iptables -A INPUT -s 222.35.138.25/32 -j DROP
```

### View firewall config including devices on linux w/netfilter
```sh
iptables -L -n -v
```

### Easy IPTables management
```sh
iptables-save > iptables.current; vi iptables.current; iptables-restore iptables.current; service iptables save
```

### Easy IPTables management
```sh
iptables-save > iptables.current; vi iptables.current; iptables-restore iptables.current; service iptables save
```

### Stop iptables completely
```sh
iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT; for table in `cat /proc/net/ip_tables_names`; do iptables -t $table -F; iptables -t $table -Z; iptables -t $table -X; done
```

### Redirect incoming traffic to SSH, from a port of your choosing
```sh
iptables -t nat -A PREROUTING -p tcp dport [port of your choosing] -j REDIRECT to-ports 22
```

### Disable all iptables rules without disconnecting yourself
```sh
iptables -F && iptables -X && iptables -P INPUT ACCEPT && iptables -OUTPUT ACCEPT
```

### Show current iptables rules, with line numbers
```sh
iptables -nL -v line-numbers
```

### Tired of switching between proxy and no proxy? here's the solution.
```sh
iptables -t nat -A OUTPUT -d ! 10.0.0.0/8 -p tcp dport 80 -j DNAT to-destination 10.1.1.123:3128
```

### Get an IP address out of fail2ban jail
```sh
iptables -D fail2ban-SSH -s <ip_address_to_be_set_free> -j DROP
```

### Route outbound SMTP connections through a addtional IP address rather than your primary
```sh
iptables -t nat -A POSTROUTING -p tcp dport 25 -j SNAT to-source IP_TO_ROUTE_THROUGH
```

### Remove specific entries from iptables
```sh
iptables -L INPUT line-numbers
```

### Check for Firewall Blockage.
```sh
iptables -L -n line-numbers | grep xx.xx.xx.xx
```

### Delete an IPtable rules based on row number
```sh
iptables -L -vnx line-numbers; iptables -t nat -D <chain-name> <number>
```

### Redirect port 80 to 8080
```sh
iptables -t nat -A PREROUTING -i eno12345678 -p tcp dport 80 -j REDIRECT to-port 8080
```

### Cloack an IP range from some IPs via iptables
```sh
iptables -A FORWARD -i br0 -m iprange src-range 192.168.0.x-192.168.0.y -m iprange dst-range 192.168.0.w-192.168.0.z  -j DROP
```

### Persistent saving of iptables rules
```sh
iptables-save > firewall.conf; rm -f /etc/network/if-up.d/iptables; echo '#!/bin/sh' > /etc/network/if-up.d/iptables; echo "iptables-restore < firewall.conf" >> /etc/network/if-up.d/iptables; chmod +x /etc/network/if-up.d/iptables
```

### Block an IP address from connecting to a server
```sh
iptables -A INPUT -s 222.35.138.25/32 -j DROP
```

### View firewall config including devices on linux w/netfilter
```sh
iptables -L -n -v
```

### Easy IPTables management
```sh
iptables-save > iptables.current; vi iptables.current; iptables-restore iptables.current; service iptables save
```

### Redirect incoming traffic to SSH, from a port of your choosing
```sh
iptables -t nat -A PREROUTING -p tcp dport [port of your choosing] -j REDIRECT to-ports 22
```
