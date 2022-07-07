# ping 

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Check if a machine is online
```sh
ping -c 1 -q MACHINE_IP_OR_NAME >/dev/null 2>&1 && echo ONLINE || echo OFFLINE
```

### Check if a machine is online
```sh
ping1 IPaddr_or_hostname
```

### Test internet connectivity
```sh
ping 8.8.8.8
```

### Check your internet connection by pinging Google
```sh
ping -c 3 google.com
```

### Find all machines on the network using broadcast ping
```sh
ping -b <broadcast address>
```

### Emulate sleep in DOS/BAT
```sh
ping -n 1 -w 10000 224.0.0.0
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Do one ping to a URL,  I use this in a MRTG gauge graph to monitor connectivity
```sh
ping -c 1 www.google.com | /usr/bin/awk '{print $7}' | /usr/bin/awk 'NR > 1' | /usr/bin/awk 'NR < 2' | /usr/bin/awk -F"=" '{print $2}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Alert on Mac when server is up
```sh
ping -o -i 30 HOSTNAME && osascript -e 'tell app "Terminal" to display dialog "Server is up" buttons "It?s about time" default button 1'
```

### Ping 10 times then quit
```sh
ping -c 10 hostname
```

### Get average ping(1) time from a host
```sh
ping -qc 10 server.tld | awk -F/ '/^rtt/ {print $5}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### facebook
```sh
ping www.facebook.com
```

### Check a server is up. If it isn't mail me.
```sh
ping -q -c1 -w3 brandx.jp.sme 2&>1 /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Detach a process from the current shell
```sh
ping -i1 www.google.com &> /dev/null & disown
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### ping MAC ADDRESS
```sh
ping -c 2 `arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`
```

### Get IP from hostname
```sh
ping -c 1 google.com | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Ping a URL sending output to file and STDOUT
```sh
ping google.com | tee ping-output.txt
```

### Check a server is up. If it isn't mail me.
```sh
ping -q -c1 -w3 server.example.com >& /dev/null || echo server.example.com ping failed | mail -ne -s'Server unavailable' admin@example.com
```

### Do one ping to a URL,  I use this in a MRTG gauge graph to monitor connectivity
```sh
ping -q -c 1 www.google.com|awk -F/ 'END{print $5}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Text graphing ping output filter
```sh
ping g.co|perl -ne'$|=/e=(\S+)/||next;(push@_,$1)>30&&shift@_;print"\r",(map{"\xe2\x96".chr(128+7*$_/(sort{$b<=>$a}@_)[0])." "}@_),"$1ms"'
```

### ping with timestamp
```sh
ping HOSTNAME | while read pong; do echo "$(date): $pong"; done
```

### SSH to a machine's internet address if it is not present on your local network
```sh
ping localip -c 1 -W 1 &> /dev/null && ssh localip || ssh globalip
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Do one ping to a URL,  I use this in a MRTG gauge graph to monitor connectivity
```sh
ping -q -c 1 www.google.com|tail -1|cut -d/ -f5
```

### Ping xxx.xxx.xxx.xxx ip 100000 times with size 1024bytes
```sh
ping xxx.xxx.xxx.xxx size 1024 repeat 100000
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### How to check network connection from one interface
```sh
ping -I eth0 www.yahoo.com
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### multimedia ping
```sh
ping -a IP-ADDRESS
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Check if a machine is online
```sh
ping -c 1 -q MACHINE_IP_OR_NAME >/dev/null 2>&1 && echo ONLINE || echo OFFLINE
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Alert on Mac when server is up
```sh
ping -o -i 30 HOSTNAME && osascript -e 'tell app "Terminal" to display dialog "Server is up" buttons "It?s about time" default button 1'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Check a server is up. If it isn't mail me.
```sh
ping -q -c1 -w3 brandx.jp.sme 2&>1 /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Detach a process from the current shell
```sh
ping -i1 www.google.com &> /dev/null & disown
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### ping MAC ADDRESS
```sh
ping -c 2 `arp-scan 10.1.1.0/24 | awk '/00:1b:11:dc:a9:65/ {print $1}'`
```

### Get IP from hostname
```sh
ping -c 1 google.com | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Ping a URL sending output to file and STDOUT
```sh
ping google.com | tee ping-output.txt
```

### Check a server is up. If it isn't mail me.
```sh
ping -q -c1 -w3 server.example.com >& /dev/null || echo server.example.com ping failed | mail -ne -s'Server unavailable' admin@example.com
```

### Do one ping to a URL,  I use this in a MRTG gauge graph to monitor connectivity
```sh
ping -q -c 1 www.google.com|awk -F/ 'END{print $5}'
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Text graphing ping output filter
```sh
ping g.co|perl -ne'$|=/e=(\S+)/||next;(push@_,$1)>30&&shift@_;print"\r",(map{"\xe2\x96".chr(128+7*$_/(sort{$b<=>$a}@_)[0])." "}@_),"$1ms"'
```

### ping with timestamp
```sh
ping HOSTNAME | while read pong; do echo "$(date): $pong"; done
```

### SSH to a machine's internet address if it is not present on your local network
```sh
ping localip -c 1 -W 1 &> /dev/null && ssh localip || ssh globalip
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Do one ping to a URL,  I use this in a MRTG gauge graph to monitor connectivity
```sh
ping -q -c 1 www.google.com|tail -1|cut -d/ -f5
```

### Ping xxx.xxx.xxx.xxx ip 100000 times with size 1024bytes
```sh
ping xxx.xxx.xxx.xxx size 1024 repeat 100000
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### How to check network connection from one interface
```sh
ping -I eth0 www.yahoo.com
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```

### Set audible alarm when an IP address comes online
```sh
ping -i 60 -a IP_address
```
