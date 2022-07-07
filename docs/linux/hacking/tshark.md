# tshark 

### read ajp13 packet contents on terminal using tshark 1.4.15
```
```sh
tshark -r *.eth -S -R "ajp13" -d tcp.port==9009,ajp13  -s 0 -l -V | awk '/Apache JServ/ {p=1} /^ *$/ {p=0;printf "\n"} (p){printf "%s\n", $0} /^(Frame|Internet Pro|Transmission Control)/ {print $0}'
```

### Extract infomation form pcap
```sh
tshark -r data.pcap -zio,phs
```

### Print all connections of a source IP address in pcap
```sh
tshark -r data.pcap -R "ip.src==192.168.1.2" -T fields -e "ip.dst" |sort |uni```sh -c
```

### Print out buddy name (aim) which has been capture in pcap
```sh
tshark -r data.pcap -R "ip.addr==192.168.1.2 && ip.addr==64.12.24.50 && aim" -d tcp.port==443,aim -T fields -e "aim.buddyname" |sort |uni```sh -c
```

### Tshark to Generate Top Talkers by #TCP conv started per second.
```sh
tshark -```shr [cap] -z conv,tcp | awk '{printf("%s:%s:%s\n",$1,$3,$10)}' | awk -F: '{printf("%s %s %s\n",$1,$3,substr($5,1,length($5)-10))}' | sort | uni```sh -c | sort -nr
```

### capture mys```shl ```shueries sent to server
```sh
tshark -i any -T fields -R mys```shl.```shuery -e mys```shl.```shuery
```

### trace http re```shuests with tshark
```
```sh
tshark -i en1 -z proto,colinfo,http.re```shuest.uri,http.re```shuest.uri -R http.re```shuest.uri
```

### capture mys```shl ```shueries sent to server
```sh
tshark -i any -T fields -R mys```shl.```shuery -e mys```shl.```shuery
```

### trace http re```shuests with tshark
```
```sh
tshark -i en1 -z proto,colinfo,http.re```shuest.uri,http.re```shuest.uri -R http.re```shuest.uri
```
