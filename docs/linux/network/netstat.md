# netstat

### Displays the quantity of connections to port 80 on a per IP basis 
```sh  
clear;
while x=0; do 
	clear;date;echo "";echo "  [Count] | [IP ADDR]";echo "-------------------";
	netstat -np|grep :80|grep -v LISTEN|awk '{print $5}'|cut -d: -f1|uniq -c; sleep 5;
done
```

### Find all IP connected to my host through TCP connection and count it
```sh      
netstat -an |grep ":80" |awk '{print $5}' | sed s/::ffff://g | cut -d: -f1 |sort |uniq -c |sort -n | tail -1000 | grep -v "0.0.0.0"
```

### Equivalent to ifconfig -a in HPUX
```sh      
netstat -nr|egrep -v "Routing|Interface|lo0"|awk '{print $5}'|sort -u| \
while read l; do ifconfig $l ; echo "        Station Addr: `lanscan -ia|grep "$l "|cut -d ' ' -f 1`" ; 
done
```

### Quick network status of machine
```sh      
netstat -tn | awk 'NR>2 {print $6}' | sort | uniq -c | sort -rn
```

### Open Port Check
```sh      
netstat -an | grep color -i -E 'listen|listening'
```

### See KeepAlive counters on tcp connections
```sh      
netstat -town
```

### Show number of connections per remote IP
```sh      
netstat -antu | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n
```

### Find default gateway
```sh      
netstat -rn | awk '/UG/{print $2}'
```

### Show apps that use internet connection at the moment.
```sh      
netstat -lantp | grep -i establ | awk -F/ '{print $2}' | uniq | sort
```

### All IP connected to  my host
```sh      
netstat -nut | awk '$NF=="ESTABLISHED" {print $5}' | cut -d: -f1 | sort -u
```

### display only tcp
```sh      
netstat -4tnape
```

### check open ports (both ipv4 and ipv6)
```sh      
netstat -plnt
```

### show open ports on computer
```sh      
netstat -an | grep -i listen
```

### Sorted list of established destination connections
```sh      
netstat | grep EST | awk '{print $5}' | sort
```

### Get number of established sessions on a given port
```sh      
netstat -anp | grep :80 | grep ESTABLISHED | wc -l
```

### Get connections from a SSH tunnel
```sh      
netstat -t -p extend | grep USERNAME
```

### Check if TCP port 25 is open
```sh      
netstat -lntp
```

### Lists all listening ports together with the PID of the associated process
```sh      
netstat -tunlp
```

### list current ssh clients
```sh      
netstat -atn | grep :22 | grep ESTABLISHED | awk '{print $4}' | sed 's/:22//'
```

### Checking total connections to each Ip inserver
```sh      
netstat -alpn | grep :80 | awk '{print $4}' |awk -F: '{print $(NF-1)}' |sort | 
```

### Show the number of current httpd processes
```sh      
netstat -l -p tcp | egrep -e 'www.*[0-9]{3,4}\/(apache2|httpd)' | awk '{print$7}'
```

### Network Interfaces
```sh      
netstat -ie
```

### ```sh      
netstat with group by (ip adress)
```sh      
netstat -ntu | awk ' $5 ~ /^[0-9]/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### Prints tcp and udp connections
```sh      
netstat -nlput
```

### see the TIME_WAIT and ESTABLISHED nums of the network
```sh      
netstat -n | awk '/^tcp/ {++B[$NF]} END {for(a in B) print a, B[a]}'
```

### See a list of ports running
```sh      
netstat -an | grep -i listen
```

### Informations sur les connexions reseau
```sh      
netstat -taupe
```

### ```sh      
netstat -luntp
```sh      
netstat -luntp
```

### &#1593;&#1585;&#1590; &#1575;&#1578;&#1589;&#1575;&#1604;&#1575;&#1578; &#1604;&#1576;&#1608;&#1585;&#1578; &#1605;&#1581;&#1583;&#1583;
```sh      
netstat -antp | grep 22
```

### Display connections histogram
```sh      
netstat -an | grep ESTABLISHED | awk '\''{print $5}'\'' | awk -F: '\''{print $1}'\'' | sort | uniq -c | awk '\''{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'\''
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh      
netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq
```

### Show all programs on UDP and TCP ports with timer information
```sh      
netstat -putona
```

### Examine processes generating traffic on your website
```sh      
netstat -np | grep -v ^unix
```

### List programs with open ports and connections
```sh      
netstat -ntauple
```

### List the number and type of active network connections
```sh      
netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c
```

### Show complete URL in ```sh      
netstat output
```sh      
netstat -tup -W | column -t
```

### List Listen Port by numbers
```sh      
netstat -tlpn | sort -t: -k2 -n
```

### ```sh      
netstat with group by ip adress
```sh      
netstat -ntu | awk ' $5 ~ /^[0-9]/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### Show apps that use internet connection at the moment.
```sh      
netstat -lantp | grep -i establ | awk -F/ '{print $2}' | sort | uniq
```

### find an unused unprivileged TCP port
```sh      
netstat -atn | awk ' /tcp/ {printf("%s\n",substr($4,index($4,":")+1,length($4) )) }' | sed -e "s/://g" | sort -rnu | awk '{array [$1] = $1} END {i=32768; again=1; while (again == 1) {if (array[i] == i) {i=i+1} else {print i; again=0}}}'
```

### Show in a web server, running in the port 80, how many ESTABLISHED connections by ip it has.
```sh      
netstat -ant | grep :80 | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n
```

### Sorted list of established destination connections
```sh      
netstat | awk '/EST/{print $5}' | sort
```

### Two command output
```sh      
netstat -n | grep ESTAB |grep  :80  | tee /dev/stderr | wc -l
```

### calulate established tcp connection of local machine
```sh      
netstat -an|grep -ci "tcp.*established"
```

### Most simple way to get a list of open ports
```sh      
netstat -lnp
```

### calulate established tcp connection of local machine
```sh      
netstat -an | awk '$1 ~ /[Tt][Cc][Pp]/ && $NF ~ /ESTABLISHED/{i++}END{print "Connected:\t", i}'
```

### List all TCP opened ports on localhost in LISTEN mode
```sh      
netstat -nptl
```

### List top 20 IP from which TCP connection is in SYN_RECV state
```sh      
netstat -pant 2> /dev/null | grep SYN_ | awk '{print $5;}' | cut -d: -f1 | sort | uniq -c | sort -n | tail -20
```

### Who has the most Apache connections.
```sh      
netstat -anl | grep :80 | awk '{print $5}' | cut -d ":" -f 1 | uniq -c | sort -n | grep -c IPHERE
```

### Netstat Connection Check
```sh      
netstat -ntu | awk '{print $5}' |  cut -d: -f1 | sort | uniq -c | sort -n | tail
```

### Show complete URL in ```sh      
netstat output
```sh      
netstat -pnut -W | column -t -s $'\t'
```

### Show what PID is listening on port 80 on Linux
```sh      
netstat -alnp | grep ::80
```

### All IP connected to  my host
```sh      
netstat -lantp | grep ESTABLISHED |awk '{print $5}' | awk -F: '{print $1}' | sort -u
```

### get a process list by listen port
```sh      
netstat -ntlp | grep -w 80 | awk '{print $7}' | cut -d/ -f1
```

### IP addresses connected to port 80
```sh      
netstat -tn 2>/dev/null | grep ':80 ' | awk '{print $5}' |sed -e 's/::ffff://' | cut -f1 -d: | sort | uniq -c | sort -rn | head
```

### TCP and UDP listening sockets
```sh      
netstat -t -u -l
```

### The program listening on port 8080 through IPv6
```sh      
netstat -lnp6 | grep :8080 | sed 's#^[^\/]*/\([a-z0-9]*\)#\1#'
```

### list ips with high number of connections
```sh      
netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
```

### Show all LISTENing and open server connections, with port number and process name/pid
```sh      
netstat -tulpn
```

### Show which programs are listening on TCP and UDP ports
```sh      
netstat -plunt
```

### Show all listening and established ports TCP and UDP together with the PID of the associated process
```sh      
netstat -plantu
```

### list current ssh clients
```sh      
netstat -tn | awk '($4 ~ /:22\s*/) && ($6 ~ /^EST/) {print substr($5, 0, index($5,":"))}'
```

### tell if a port is in use
```sh      
netstat -a numeric-ports | grep 8321
```

### Lists all listening ports together with the PID of the associated process
```sh      
netstat -anpe
```

### Number of open connections per ip.
```sh      
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### find an unused unprivileged TCP port
```sh      
netstat  -atn | perl -0777 -ne '@ports = /tcp.*?\:(\d+)\s+/imsg ; for $port (32768..61000) {if(!grep(/^$port$/, @ports)) { print $port; last } }'
```

### Find default gateway
```sh      
netstat -rn | grep UG | tr -s " " | cut -d" " -f2
```

### Fetch the Gateway Ip Address
```sh      
netstat -nr | awk 'BEGIN {while ($3!="0.0.0.0") getline; print $2}'
```

### ```sh      
netstat with group by (ip adress)
```sh      
netstat -ntu | awk ' $5 ~ /^(::ffff:|[0-9|])/ { gsub("::ffff:","",$5); print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
```

### check open ports (both ipv4 and ipv6)
```sh      
netstat -plntu
```

### To find which host made maximum number of specific tcp connections
```sh      
netstat -n | grep '^tcp.*<IP>:<PORT>' | tr " " | awk 'BEGIN{FS="( |:)"}{print $6}' | sort | uniq -c | sort -n -k1 | awk '{if ($1 >= 10){print $2}}'
```

### Count TCP States From Netstat
```sh      
netstat -an | awk '/tcp/ {print $6}' | sort | uniq -c
```

### To find the LDAP clients connected to LDAP service running on Solaris
```sh      
netstat -n -f inet|awk '/\.389/{print $2}'|cut -f1-4 -d.|sort -u
```

### Summarize the number of open TCP connections by state
```sh      
netstat -nt | awk '{print $6}' | sort | uniq -c | sort -n -k 1 -r
```

### calulate established tcp connection of local machine
```sh      
netstat -an | grep -Ec '^tcp.+ESTABLISHED$'
```

### count IPv4 connections per IP
```sh      
netstat -anp |grep 'tcp\|udp' | awk '{print $5}' | sed s/::ffff:// | cut -d: -f1 | sort | uniq -c | sort -n
```

### TCP and UDP listening sockets
```sh      
netstat -tunlapo
```

### Active Internet connections (only servers)
```sh      
netstat -lnptu
```

### open listening ports
```sh      
netstat -ltn | awk -n '/tcp /{ split($4, x, ":"); print(x[2]); }' | sort -n
```

### List state of NAT.
```sh      
netstat-nat -n
```

### Check for listening services
```sh      
netstat -tuapen | grep LISTEN
```

### ```sh      
netstat with group by (ip adress)
```sh      
netstat -nt | awk -F":" '{print $2}' | sort | uniq -c
```

### Graph # of connections for each hosts.
```sh      
netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
```

### Graph # of connections for each hosts.
```sh      
netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
```

### Find out if MySQL is up and listening on Linux
```sh      
netstat -tap | grep mysql
```

### get the IP connected to the server (usefull to detect IP that should be blocked)
```sh      
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort  | uniq -c | sort -n
```

### NETSTAT ESTABLISHED
```sh      
netstat | find "ESTABLISHED"
```

### monitor all open connections to specific port
```sh      
netstat -anp | grep ":<port>"
```

### Check if TCP port 25 is open
```sh      
netstat -tln | grep :25
```

### Command results as an image capture
```sh      
netstat -rn | convert label:@- netstat.png
```

### List open TCP/UDP ports
```sh      
netstat -anp tcp udp | grep LISTEN
```

### Show number of connections per remote IP
```sh      
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'
```

### List open TCP/UDP ports
```sh      
netstat -ltun
```

### Netstat List out Remote IP's Connected to Server Only
```sh      
netstat -tn | awk '{print $5}' | egrep -v '(localhost|\*\:\*|Address|and|servers|fff|127\.0\.0)' | sed 's/:[0-99999999].*//g'
```

### find out which TCP ports are listening and opened by which process in verbose
```sh      
netstat -tlvp
```

### find an unused unprivileged TCP port
```sh      
netstat -tan | awk '$1 == "tcp" && $4 ~ /:/ { port=$4; sub(/^[^:]+:/, "", port); used[int(port)] = 1; } END { for (p = 32768; p <= 61000; ++p) if (! (p in used)) { print p; exit(0); }; exit(1); }'
```

### showing opened ports on machine
```sh      
netstat -tulpnc
```

### find an unused unprivileged TCP port
```sh      
netstat -atn | perl -ane 'if ( $F[3] =~ /(\d+)$/ ) { $x{$1}=1 } END{ print( (grep {!$x{$_}} 32768..61000)[0] . "\n" )}'
```

### Lists open ports
```sh      
netstat -antuwp | egrep "(^[^t])|(^tcp.*LISTEN)"
```

### Number of connections per IP with range 24
```sh      
netstat -tn | grep :80 | awk '{print $5}'| grep -v ':80' | cut -f1 -d: |cut -f1,2,3  -d. | sort | uniq -c| sort -n
```

### Check the connection of the maximum number of IP
```sh      
netstat -na | grep ESTABLISHED | awk '{print$5}' | awk -F : '{print$1}' | sort | uniq -c | sort -r
```

### Detect Connections On Port - Android
```sh      
netstat -lptu | grep -E "22.*ESTABLISHED" | cut -s -d ':' -f2 | awk '{print $2}'
```

### How to Kill Process that is Running on Certain Port in Windows?
```sh      
netstat -a -o -n | grep 8080
```

### List all IP's connected to port 80
```sh      
netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
```

### See who are using a specific port
```sh      
netstat -Aan | grep .80 | grep -v 127.0.0.1 | grep EST | awk '{print $6}' | cut -d "." -f1,2,3,4 | sort | uniq
```

### Equivalent to ifconfig -a in HPUX
```sh      
netstat -in
```

### Print whois info about connected ip addresses
```sh      
netstat -np inet|awk '/firefox/{split($5,a,":");z[a[1]]++} END{for(i in z){system("whois " i)}}'|less
```

### All IP connected to  my host
```sh      
netstat -nut | sed '/ESTABLISHED/!d;s/.*[\t ]\+\(.*\):.*/\1/' | sort -u
```

### Number of open connections per ip.
```sh      
netstat -an | grep 80 | wc -l
```

### Quick network status of machine
```sh      
netstat -tn | awk 'NR>2 {print $6}' | sort | uniq -c | sort -rn
```

### See KeepAlive counters on tcp connections
```sh      
netstat -town
```

### check open ports (both ipv4 and ipv6)
```sh      
netstat -plnt
```

### see the TIME_WAIT and ESTABLISHED nums of the network
```sh      
netstat -n | awk '/^tcp/ {++B[$NF]} END {for(a in B) print a, B[a]}'
```

### Display connections histogram
```sh      
netstat -an | grep ESTABLISHED | awk '\''{print $5}'\'' | awk -F: '\''{print $1}'\'' | sort | uniq -c | awk '\''{ printf("%s\t%s\t",$2,$1); for (i = 0; i < $1; i++) {printf("*")}; print ""}'\''
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh      
netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq
```

### Show all programs on UDP and TCP ports with timer information
```sh      
netstat -putona
```

### Examine processes generating traffic on your website
```sh      
netstat -np | grep -v ^unix
```

### List programs with open ports and connections
```sh      
netstat -ntauple
```

### List the number and type of active network connections
```sh      
netstat -ant | awk '{print $NF}' | grep -v '[a-z]' | sort | uniq -c
```

### Show complete URL in ```sh      
netstat output
```sh      
netstat -tup -W | column -t
```

### List Listen Port by numbers
```sh      
netstat -tlpn | sort -t: -k2 -n
```

### ```sh      
netstat with group by ip adress
```sh      
netstat -ntu | awk ' $5 ~ /^[0-9]/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### Show apps that use internet connection at the moment.
```sh      
netstat -lantp | grep -i establ | awk -F/ '{print $2}' | sort | uniq
```

### find an unused unprivileged TCP port
```sh      
netstat -atn | awk ' /tcp/ {printf("%s\n",substr($4,index($4,":")+1,length($4) )) }' | sed -e "s/://g" | sort -rnu | awk '{array [$1] = $1} END {i=32768; again=1; while (again == 1) {if (array[i] == i) {i=i+1} else {print i; again=0}}}'
```

### Show in a web server, running in the port 80, how many ESTABLISHED connections by ip it has.
```sh      
netstat -ant | grep :80 | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n
```

### Sorted list of established destination connections
```sh      
netstat | awk '/EST/{print $5}' | sort
```

### Two command output
```sh      
netstat -n | grep ESTAB |grep  :80  | tee /dev/stderr | wc -l
```

### calulate established tcp connection of local machine
```sh      
netstat -an|grep -ci "tcp.*established"
```

### Most simple way to get a list of open ports
```sh      
netstat -lnp
```

### calulate established tcp connection of local machine
```sh      
netstat -an | awk '$1 ~ /[Tt][Cc][Pp]/ && $NF ~ /ESTABLISHED/{i++}END{print "Connected:\t", i}'
```

### List all TCP opened ports on localhost in LISTEN mode
```sh      
netstat -nptl
```

### List top 20 IP from which TCP connection is in SYN_RECV state
```sh      
netstat -pant 2> /dev/null | grep SYN_ | awk '{print $5;}' | cut -d: -f1 | sort | uniq -c | sort -n | tail -20
```

### Who has the most Apache connections.
```sh      
netstat -anl | grep :80 | awk '{print $5}' | cut -d ":" -f 1 | uniq -c | sort -n | grep -c IPHERE
```

### Netstat Connection Check
```sh      
netstat -ntu | awk '{print $5}' |  cut -d: -f1 | sort | uniq -c | sort -n | tail
```

### Show complete URL in ```sh      
netstat output
```sh      
netstat -pnut -W | column -t -s $'\t'
```

### Show what PID is listening on port 80 on Linux
```sh      
netstat -alnp | grep ::80
```

### All IP connected to  my host
```sh      
netstat -lantp | grep ESTABLISHED |awk '{print $5}' | awk -F: '{print $1}' | sort -u
```

### get a process list by listen port
```sh      
netstat -ntlp | grep -w 80 | awk '{print $7}' | cut -d/ -f1
```

### IP addresses connected to port 80
```sh      
netstat -tn 2>/dev/null | grep ':80 ' | awk '{print $5}' |sed -e 's/::ffff://' | cut -f1 -d: | sort | uniq -c | sort -rn | head
```

### TCP and UDP listening sockets
```sh      
netstat -t -u -l
```

### The program listening on port 8080 through IPv6
```sh      
netstat -lnp6 | grep :8080 | sed 's#^[^\/]*/\([a-z0-9]*\)#\1#'
```

### list ips with high number of connections
```sh      
netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
```

### Show all LISTENing and open server connections, with port number and process name/pid
```sh      
netstat -tulpn
```

### Show which programs are listening on TCP and UDP ports
```sh      
netstat -plunt
```

### Show all listening and established ports TCP and UDP together with the PID of the associated process
```sh      
netstat -plantu
```

### list current ssh clients
```sh      
netstat -tn | awk '($4 ~ /:22\s*/) && ($6 ~ /^EST/) {print substr($5, 0, index($5,":"))}'
```

### tell if a port is in use
```sh      
netstat -a numeric-ports | grep 8321
```

### Lists all listening ports together with the PID of the associated process
```sh      
netstat -anpe
```

### Number of open connections per ip.
```sh      
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n
```

### find an unused unprivileged TCP port
```sh      
netstat  -atn | perl -0777 -ne '@ports = /tcp.*?\:(\d+)\s+/imsg ; for $port (32768..61000) {if(!grep(/^$port$/, @ports)) { print $port; last } }'
```

### Find default gateway
```sh      
netstat -rn | grep UG | tr -s " " | cut -d" " -f2
```

### Fetch the Gateway Ip Address
```sh      
netstat -nr | awk 'BEGIN {while ($3!="0.0.0.0") getline; print $2}'
```

### ```sh      
netstat with group by (ip adress)
```sh      
netstat -ntu | awk ' $5 ~ /^(::ffff:|[0-9|])/ { gsub("::ffff:","",$5); print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr
```

### check open ports (both ipv4 and ipv6)
```sh      
netstat -plntu
```

### To find which host made maximum number of specific tcp connections
```sh      
netstat -n | grep '^tcp.*<IP>:<PORT>' | tr " " | awk 'BEGIN{FS="( |:)"}{print $6}' | sort | uniq -c | sort -n -k1 | awk '{if ($1 >= 10){print $2}}'
```

### Count TCP States From Netstat
```sh      
netstat -an | awk '/tcp/ {print $6}' | sort | uniq -c
```

### To find the LDAP clients connected to LDAP service running on Solaris
```sh      
netstat -n -f inet|awk '/\.389/{print $2}'|cut -f1-4 -d.|sort -u
```

### Summarize the number of open TCP connections by state
```sh      
netstat -nt | awk '{print $6}' | sort | uniq -c | sort -n -k 1 -r
```

### calulate established tcp connection of local machine
```sh      
netstat -an | grep -Ec '^tcp.+ESTABLISHED$'
```

### count IPv4 connections per IP
```sh      
netstat -anp |grep 'tcp\|udp' | awk '{print $5}' | sed s/::ffff:// | cut -d: -f1 | sort | uniq -c | sort -n
```

### TCP and UDP listening sockets
```sh      
netstat -tunlapo
```

### Active Internet connections (only servers)
```sh      
netstat -lnptu
```

### open listening ports
```sh      
netstat -ltn | awk -n '/tcp /{ split($4, x, ":"); print(x[2]); }' | sort -n
```

### List state of NAT.
```sh      
netstat-nat -n
```

### Check for listening services
```sh      
netstat -tuapen | grep LISTEN
```

### ```sh      
netstat with group by (ip adress)
```sh      
netstat -nt | awk -F":" '{print $2}' | sort | uniq -c
```

### Graph # of connections for each hosts.
```sh      
netstat -an | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }'
```

### Find out if MySQL is up and listening on Linux
```sh      
netstat -tap | grep mysql
```

### get the IP connected to the server (usefull to detect IP that should be blocked)
```sh      
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort  | uniq -c | sort -n
```

### NETSTAT ESTABLISHED
```sh      
netstat | find "ESTABLISHED"
```

### monitor all open connections to specific port
```sh      
netstat -anp | grep ":<port>"
```

### Check if TCP port 25 is open
```sh      
netstat -tln | grep :25
```

### Command results as an image capture
```sh      
netstat -rn | convert label:@- netstat.png
```

### List open TCP/UDP ports
```sh      
netstat -anp tcp udp | grep LISTEN
```

### Show number of connections per remote IP
```sh      
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'
```

### List open TCP/UDP ports
```sh      
netstat -ltun
```

### Netstat List out Remote IP's Connected to Server Only
```sh      
netstat -tn | awk '{print $5}' | egrep -v '(localhost|\*\:\*|Address|and|servers|fff|127\.0\.0)' | sed 's/:[0-99999999].*//g'
```

### find out which TCP ports are listening and opened by which process in verbose
```sh      
netstat -tlvp
```

### find an unused unprivileged TCP port
```sh      
netstat -tan | awk '$1 == "tcp" && $4 ~ /:/ { port=$4; sub(/^[^:]+:/, "", port); used[int(port)] = 1; } END { for (p = 32768; p <= 61000; ++p) if (! (p in used)) { print p; exit(0); }; exit(1); }'
```

### showing opened ports on machine
```sh      
netstat -tulpnc
```

### find an unused unprivileged TCP port
```sh      
netstat -atn | perl -ane 'if ( $F[3] =~ /(\d+)$/ ) { $x{$1}=1 } END{ print( (grep {!$x{$_}} 32768..61000)[0] . "\n" )}'
```

### Lists open ports
```sh      
netstat -antuwp | egrep "(^[^t])|(^tcp.*LISTEN)"
```

### Number of connections per IP with range 24
```sh      
netstat -tn | grep :80 | awk '{print $5}'| grep -v ':80' | cut -f1 -d: |cut -f1,2,3  -d. | sort | uniq -c| sort -n
```

### Check the connection of the maximum number of IP
```sh      
netstat -na | grep ESTABLISHED | awk '{print$5}' | awk -F : '{print$1}' | sort | uniq -c | sort -r
```
