# ssh-logs

Read SSH logs as a PRO from command line..

### Print failed passwords

```sh
head -n -250 /var/log/auth.log 
```

### Simple analysis of log

```sh
awk "/.*Failed password.*/ { print $1 }" /var/log/auth.log                                                                                                                                                 
```

### Print how many failed attemps tried login

```sh                                                                                                      
grep "Failed password" /var/log/auth.log | wc -l          
```

### Print all successs attempts

```sh
grep "password" /var/log/auth.log | grep -v Failed | grep -v Invalid                                                                
```

### View all log files

```sh
ls /var/log/auth.log* -lht                                                                                                        
```

### Summarize information simply

```sh
cat  /var/log/auth.log| grep "Failed password"|head -1 | awk '{while($i){print i, $i;i++}}'        
```

### Column 11 is IP and column 9 is the user name the attacker attempted.                                

```sh
cat  /var/log/auth.log| grep "Failed password"| grep invalid |head -1 | awk '{while($i){print i, $i;i++}}'                         
```

### Put the log files together and unzip them

```sh
mkdir authlog;cp /var/log/auth.log* authlog/;cd authlog;gunzip auth.log.*.gz
```

### Statistics of attacker IP

```sh
awk '{if($6=="Failed"&&$7=="password"){if($9=="invalid"){ips[$13]++;users[$11]++}else{users[$9]++;ips[$11]++}}}END{for(ip in ips){print ip, ips[ip]}}' /var/log/auth.* | wc -l
```

### Sort by number of attacks

```sh
awk '{if($6=="Failed"&&$7=="password"){if($9=="invalid"){ips[$13]++;users[$11]++}else{users[$9]++;ips[$11]++}}}END{for(ip in ips){print ip, ips[ip]}}' /var/log/auth.* | sort -k2 -rn | head
```

### Save to file

```sh
awk '{if($6=="Failed"&&$7=="password"){if($9=="invalid"){ips[$13]++;users[$11]++}else{users[$9]++;ips[$11]++}}}END{for(ip in ips){print ip, ips[ip]}}' /var/log/auth.* | sort -k2 -rn > ip.log
```

### Look at the just saved one ip.log Top 10 items in the document


head -10 ip.log | awk '{print $1" ";system("curl http://freeapi.ipip.net/"$1);print("\n")}'
```

### The user name the attacker attempted

```sh
awk '{if($6=="Failed"&&$7=="password"){if($9=="invalid"){ips[$13]++;users[$11]++}else{users[$9]++;ips[$11]++}}}END{for(user in users){print user, users[user]}}' /var/log/auth.* | sort -k2 -rn |wc -l
```

### View the number of items

```sh
awk '{if($6=="Failed"&&$7=="password"){if($9=="invalid"){ips[$13]++;users[$11]++}else{users[$9]++;ips[$11]++}}}END{for(user in users){print user, users[user]}}' /var/log/auth.* | sort -k2 -rn | head
```
