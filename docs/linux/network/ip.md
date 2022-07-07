# ip 

### Get the IP address
```sh
ip a s eth0 | awk -F"[/ ]+" '/inet / {print $3}'
```

### Block an IP address
```sh
ip route show | awk '$3 ~ /^[1-9]+/ {print $3;}'
```

### Show Network IP and Subnet
```sh
ip -4 addr show eth0 | awk ' /inet/ {print $2}'
```

### Show ip address
```
```sh
ip -f inet addr show eth0
```

### Network Interfaces
```sh
ip link
```

### List your MACs address
```sh
ip addr show eth0 | grep ether | awk '{print $2}'
```

### Get internal and external IP addresses
```sh
ip addr|grep "inet "
```

### flush cached dns lookups
```sh
ip a
```

### Get the IP address
```sh
ip a s eth0 | grep "inet " | head -n 1 | awk '{print $2}' | cut -f1 -d'/'
```

### Delete all firewall rules in a chain or all chains
```sh

ip route | awk '/default/{print $3}'
```

### Get all mac address
```sh
ip link show
```

### Print IP of any interface. Useful for scripts.
```
```sh
ip route show dev ppp0 | awk '{ print $7 }'
```

### Show all configured ipv4
```
```sh
ip -o -4 a s
```

### Show current iptables rules, with line numbers
```
```sh

ip a s eth0 | awk -F'[/ ]+' '/inet[^6]/{print $3}'
```

### List your MACs address
```sh
ip link | awk '/link/ {print $2}'
```

### Get the IP address
```sh
ip -f inet a | awk '/inet / { print $2 }'
```

### Get IPv4 of eth0 for use with scripts
```
```sh
ip addr show eth0 | awk '/inet / {FS = "/"; $0 = $2; print $1}'
```

### Put public IP address in a variable
```sh
ip=$(curl ip.pla1.net)
```

### Route outbound SMTP connections through a addtional IP address rather than your primary
```sh

ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+'
```

### Fetch the Gateway Ip Address
```sh
ip route list match 0.0.0.0/0 | cut -d " " -f 3
```

### add a ip address to a network device
```
```sh
ip addr add 192.168.10.1/24 dev eth0
```

### Remove specific entries from iptables
```
```sh

ip -o -4 a s | awk -F'[ /]+' '$2!~/lo/{print $4}'
```

### Show LAN IP with ip(8)
```
```sh
ip route show dev eth0 | awk '{print $7}'
```

### Check for Firewall Blockage.
```sh

ip route | grep default | awk '{print $3}'
```

### Print a single route to a destination and its contents exactly as the kernel sees it
```sh
ip route get dest_ip
```

### Delete an IPtable rules based on row number
```sh

ip -o -4 addr show | awk -F '[ /]+' '/global/ {print $4}'
```

### Get ethX mac addresses
```sh
ip link | grep 'link/ether' | awk '{print $2}'
```

### Prevent an IPv6 address on an interface from being used as source address of packets.
```sh
ip addr change 2001:db8:1:2::ab dev eth0 preferred_lft 0
```

### Another way to see the network interfaces
```sh
ip addr show
```

### Print the IPv4 address of a given interface
```sh
ip addr show enp3s0 | awk '/inet[^6]/{print $2}' | awk -F'/' '{print $1}'
```

### Provide information on IPC (Inter-process communication) facilities
```sh

ip a s eth0 | sed -nr 's!.*inet ([^/]+)/.*!\1!p'
```

### Find Mac address
```sh
ip li | grep ether | awk '{print $2}'
```

### List your MACs address
```sh
ip li | grep ff
```

### Redirect port 80 to 8080
```sh

ip addr show eth0 |grep 'inet\b' |awk '{print $2}' |sed  -r -e 's/\/.*?//g'
```

### List you configure's ip address in your system
```
```sh
ip addr list | grep global | awk '{print $7"\t"$2}'
```

### Remove semaphores
```sh

ip addr show |grep -w inet | grep -v 127.0.0.1 | awk '{ print $2}'| cut -d "/" -f 2
```

### Clear IPC Message Queue
```sh

ip -f inet addr |grep "global eth0$"|awk '{print $2}'|cut -d '/' -f 1
```

### Remove all message queues owned by user foo
```sh

ip addr show dev eth0 | awk '/inet/ {sub(/\//, " "); print $2}'
```

### Block an IP address from connecting to a server
```sh

ip link show eth0 | grep "link/ether" | awk '{print $2}'
```

### simple echo of IPv4 IP addresses assigned to a machine
```sh
ip addr | awk '/inet / {sub(/\/.*/, "", $2); print $2}'
```

### Geolocate a given IP address
```sh

ip route list 0/0
```

### Easy IPTables management
```sh

ip -4 route list 0/0
```

### Redirect incoming traffic to SSH, from a port of your choosing
```sh

ip addr show | grep "inet " | while read INET IP TRASH; do if [ $IP != "127.0.0.1/8" ]; then echo $IP; exit 0; fi; done | sed s:/[1-9][1-9]:"":
```

### network throughput test
```sh

ip route | awk '/default/{print $3}'
```

### Get all mac address
```sh
ip link show
```

### Print IP of any interface. Useful for scripts.
```
```sh
ip route show dev ppp0 | awk '{ print $7 }'
```

### Show all configured ipv4
```
```sh
ip -o -4 a s
```

### Show current iptables rules, with line numbers
```
```sh

ip a s eth0 | awk -F'[/ ]+' '/inet[^6]/{print $3}'
```

### List your MACs address
```sh
ip link | awk '/link/ {print $2}'
```

### Get the IP address
```sh
ip -f inet a | awk '/inet / { print $2 }'
```

### Get IPv4 of eth0 for use with scripts
```
```sh
ip addr show eth0 | awk '/inet / {FS = "/"; $0 = $2; print $1}'
```

### Put public IP address in a variable
```sh
ip=$(curl ip.pla1.net)
```

### Route outbound SMTP connections through a addtional IP address rather than your primary
```sh

ip route get 8.8.8.8 2>/dev/null|grep -Eo 'src [0-9.]+'|grep -Eo '[0-9.]+'
```

### Fetch the Gateway Ip Address
```sh
ip route list match 0.0.0.0/0 | cut -d " " -f 3
```

### add a ip address to a network device
```
```sh
ip addr add 192.168.10.1/24 dev eth0
```

### Remove specific entries from iptables
```
```sh

ip -o -4 a s | awk -F'[ /]+' '$2!~/lo/{print $4}'
```

### Show LAN IP with ip(8)
```
```sh
ip route show dev eth0 | awk '{print $7}'
```

### Check for Firewall Blockage.
```sh

ip route | grep default | awk '{print $3}'
```

### Print a single route to a destination and its contents exactly as the kernel sees it
```sh
ip route get dest_ip
```

### Delete an IPtable rules based on row number
```sh

ip -o -4 addr show | awk -F '[ /]+' '/global/ {print $4}'
```

### Get ethX mac addresses
```sh
ip link | grep 'link/ether' | awk '{print $2}'
```

### Prevent an IPv6 address on an interface from being used as source address of packets.
```sh
ip addr change 2001:db8:1:2::ab dev eth0 preferred_lft 0
```

### Another way to see the network interfaces
```sh
ip addr show
```

### Print the IPv4 address of a given interface
```sh
ip addr show enp3s0 | awk '/inet[^6]/{print $2}' | awk -F'/' '{print $1}'
```

### Provide information on IPC (Inter-process communication) facilities
```sh

ip a s eth0 | sed -nr 's!.*inet ([^/]+)/.*!\1!p'
```

### Find Mac address
```sh
ip li | grep ether | awk '{print $2}'
```

### List your MACs address
```sh
ip li | grep ff
```

### Redirect port 80 to 8080
```sh

ip addr show eth0 |grep 'inet\b' |awk '{print $2}' |sed  -r -e 's/\/.*?//g'
```

### List you configure's ip address in your system
```
```sh
ip addr list | grep global | awk '{print $7"\t"$2}'
```

### Remove semaphores
```sh

ip addr show |grep -w inet | grep -v 127.0.0.1 | awk '{ print $2}'| cut -d "/" -f 2
```

### Clear IPC Message Queue
```sh

ip -f inet addr |grep "global eth0$"|awk '{print $2}'|cut -d '/' -f 1
```

### Remove all message queues owned by user foo
```sh

ip addr show dev eth0 | awk '/inet/ {sub(/\//, " "); print $2}'
```

### Block an IP address from connecting to a server
```sh

ip link show eth0 | grep "link/ether" | awk '{print $2}'
```

### simple echo of IPv4 IP addresses assigned to a machine
```sh
ip addr | awk '/inet / {sub(/\/.*/, "", $2); print $2}'
```

### Geolocate a given IP address
```sh

ip route list 0/0
```

### Easy IPTables management
```sh
