# masscan

### Target specification
```sh
masscan 10.0.0.1 
```

```sh
masscan 10.0.0.0/24 192.168.1.0/24
```

### Exclude IP file
```sh
masscan 10.0.0.1/24 --excludeFile <file>
```
### Exclude a single IP from the scan
```sh
masscan 180.215.0.0/16 --exclude=180.215.122.120
```
Port specification

### Port specification
```sh
masscan 10.0.0.0.1 -p 80
```

```sh
masscan 10.0.0.0.1 -p 0-65535
```

```sh
masscan 10.0.0.0.1 -p 80,443
```

### UDP Scan
```sh
masscan 10.0.0.0.1 -pU 53
```

## Timing and Performance

### Used to scan in offline mode. It does not send any traffic but just estimate the time length
```sh
masscan 0.0.0.0/24 --offline
```

### Using the rate to send X packets per second
```sh
masscan 10.0.0.1/24 --rate 10000
```

### Get banners from services (only few protocols supported)

Problem is that masscan uses his own TCP/IP stack so when the local system received a SYN-ACK from the probed target, it responds with a TST packet that kills the connection before the banner information can be grabbed. You can use --source-ip to assign another IP to prevent
```sh
masscan 10.0.0.1 --banners
```

### Assign masscan to another IP
```sh
masscan 10.0.0.1 --source-ip 192.168.1.200
```

### Include a ping
```sh
masscan 10.0.0.1 --ping
```

### Change the default user agent
```sh
masscan 10.0.0.1 --http-user-agent <user-agent>
```

### Report only open ports
```sh
masscan 10.0.0.1 --open-only
```

### Save sent packet in PCAP
```sh
masscan 10.0.0.1 --pcap <filename>
```

### Print packets in terminal (ok in low rate but RIP terminal with high rates)
```sh
masscan 10.0.0.1 --packet-trace
```

Output

### Output in binary mode
```sh
masscan 10.1.1.1/24 -p 80 -oB <filename>
```

### Output in XML format
```sh
masscan 10.1.1.1/24 -p 80 -oX <filename>
```

### Output in grepable format
```sh
masscan 10.1.1.1/24 -p 80 -oG <filename>
```

### Output in JSON format
```sh
masscan 10.1.1.1/24 -p 80 -oJ <filename>
```

### Output in simple list format
```sh
masscan 10.1.1.1/24 -p 80 -oL <filename>
```

### Read a binary output and writes it to the console
```sh
masscan --readscan bin-test.scan
```

### Read a binary scan and convert it to another format
```sh
masscan --readscan bin-test.scan -oX bin-test.xml
```

Complete commands

### Quick port identification
### - Subnet target
### - Port range
### - High speed
```sh
masscan 10.1.1.1/24 -p 0-65535 --rate 1000000 --open-only --http-user-agent \
"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0"\
 -oL "output.txt"
```

### Multiple targets specific scan
### - Known ports
### - Fast rate 100.000
### - Banner grabbing and another source IP
### - Only open ports
### - Modified user-agent
```sh
masscan <target1> <target2> <target3> -p 80,433 --rate 100000 --banners --open-only\
--http-user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0"\
--source-ip 192.168.100.200 -oL "output.txt" 
```

### TOP 20 ports scanning
### Modified user-agent
### Medium speed
```sh
masscan <target> -p 21,22,23,25,53,80,110,111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080\
--http-user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:67.0) Gecko/20100101 Firefox/67.0"\
--rate 100000 --oL "output.txt"
```

### In some cases, masscan can be better than nmap
### For example, when searching for a big range on some ports only
### (Internal pentest for example) you can do multiple iterations of scans
### XML output are interesting for db_import in metasploit
```sh
sudo masscan <target/16> -p 22 --rate 2000 -oX output_port_22.xml
```
