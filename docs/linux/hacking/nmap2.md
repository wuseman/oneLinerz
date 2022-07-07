# nmap2

Personal cheatsheet 

##### Nmap scan every interface that is assigned an IP
```sh
ifconfig -a | grep -Po '\b(?!255)(?:\d{1,3}\.){3}(?!255)\d{1,3}\b' | xargs nmap -A -p0-
```

### IIS
```sh
nmap -Pn -n -T3 -v -sV --version-intensity=5 -Pn -p 80 --script=http-iis-webdav-vuln <IP>
```
### JBOSS (CVE-2010-0738)
```sh
nmap -Pn -n -T3 -v -sV --version-intensity=5 -Pn -p 80 --script=http-vuln-cve2010-0738 <IP>
```
### PHP-CGI (CVE-2012-1823)
```sh
nmap -Pn -n -T3 -v -sV --version-intensity=5 -Pn -p 80 --script=http-vuln-cve2012-1823 <IP>
```
### RCE Ruby on Rails (CVE-2013-0156)
```sh
nmap -Pn -n -T3 -v -sV --version-intensity=5 -Pn -p 80 --script=http-vuln-cve2013-0156 <IP>
```
### WAF Detection
```sh
nmap -Pn -n -T3 -v -sV --version-intensity=5 -Pn -p 80 --script=http-waf-detect,http-waf-fingerprint <IP>
```
### Check Heartbleed CVE-2014-0160
```sh
nmap -Pn -n -p 443 -v -T3 --script=ssl-heartbleed,ssl-enum-ciphers,ssl-known-key --script-args vulns.showall -sV --version-intensity=5 <IP>
```

### Port scan and trying zone transfer
```sh
nmap --script=dns-transfer-zone -p 53 domain
```

## POP3

Identification and Scans

# Retrieve POP3 server capabilities (CAPA, TOP, USER, SASL, RESP-CODES, LOGIN-DELAY, PIPELINING, EXPIRE, UIDL, IMPLEMENTATION)  
```sh
nmap -v -sV --version-intensity=5 --script pop3-capabilities -p T:110 IP
```

# Try to bruteforce POP3 accounts
```sh
nmap --script pop3-brute --script-args pop3loginmethod=SASL-LOGIN -p T:110 IP
nmap --script pop3-brute --script-args pop3loginmethod=SASL-CRAM-MD5 -p T:110 IP
nmap --script pop3-brute --script-args pop3loginmethod=APOP -p T:110 IP
```

## POP3s

### Retrieve POP3 server capabilities (CAPA, TOP, USER, SASL, RESP-CODES, LOGIN-DELAY, PIPELINING, EXPIRE, UIDL, IMPLEMENTATION)  
```sh
nmap -v -sV --version-intensity=5 --script pop3-capabilities -p T:995 IP
```

### Try to bruteforce POP3 accounts
```sh
nmap --script pop3-brute --script-args pop3loginmethod=SASL-LOGIN -p T:995 IP
nmap --script pop3-brute --script-args pop3loginmethod=SASL-CRAM-MD5 -p T:995 IP
nmap --script pop3-brute --script-args pop3loginmethod=APOP -p T:995 IP
```

## MSSQL

# Using nmap NSE scripts
```sh
nmap -n -sV --version-intensity=5 -sT -Pn -p T:1433 --script=xxxx <IP>
```

## RDP

# Using nmap NSE scripts
```sh
nmap -Pn -sV --version-intensity=5 -p T:3389 --script=xxxx <IP>
```


## Samba

## Base nmap
```sh
nmap -v --script=xxxx -p T:139,445 <IP>
```

### Hard nmap
```sh
nmap -n -sV --version-intensity=5 -sU -sS -Pn -p T:139,445,U:137 --script=xxx <IP>
```

## IMAP

### IMAP scan
```sh
nmap -v -sV --version-intensity=5 --script imap-capabilities -p T:143 <IP>
```

## SNMP

### SNMP Scan
```sh
nmap -vv -sV --version-intensity=5 -sU -Pn -p 161,162 --script=snmp-netstat,snmp-processes IP
```











