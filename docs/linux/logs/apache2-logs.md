#  apache2-logs

### Check for bots

```sh
cat access.log | cut -d '"' -f 6 | sort | uniq | awk '$2 == "bot"'
```

### Check for botnets
```sh
cat access.log | cut -d '"' -f 6 | sort | uniq | awk '$2 == "botnet"'
```

### Check for boths above
```sh
cat access.log | cut -d '"' -f 6 | sort | uniq | awk '$2 ~ "bot"'
```
### Count requests
```sh
cat access.log | grep -v "CONNECT\|HEAD\|GET\|POST" | wc -l
```
### Print missing files

```sh
awk 'END{($9 ~ /404/)}' < /var/log/apache2/access.log | awk '{print $9": " $7}'
```

### Report on access codes

```sh
awk '{ print $9 }' /var/log/apache2/access.log | sort | uniq -c | sort -rn
```

### Report on missing files

```sh
awk '($9 ~ /404/)' /var/log/apache2/access.log | awk '{ print $7 }' | sort | uniq -c | sort -nr
```

### Print the IP address

```sh
awk '{print $1}' /var/log/apache2/access.log
```

### Print the date/time

```sh
awk '{print $4,$5}' /var/log/apache2/access.log
```

### Print the status code

```sh
awk '{print $9}' /var/log/apache2/access.log
```

### Print the size
```sh
awk '{print $10}' /var/log/apache2/access.log
```

### Count requests by response code
```sh
awk '{print $9}' /var/log/apache2/access.log | sort | uniq -c | sort -rn
```

### Find which URLs returned a status code
```sh
awk '($9 ~ /404/)' /var/log/apache2/access.log | awk '{count[$7]++}; END { for (i in count) print i, count[i] }'
```

### Find which URLs returned a status code
```sh
awk '($9 ~ /404/)' /var/log/apache2/access.log | awk '{print $7}' | sort | uniq -c | sort -returned
```

### Find useragents
```sh
cat access.log | cut -d '"' -f 6 | sort | uniq
```

### Find most used user agents
```sh
awk '{print $12}' /var/log/apache2/access.log | sort | uniq -c | sort -rn
```
### Find most used user agents
```sh
awk -F\" '{print $6}' /var/log/apache2/access.log | sort | uniq -c | sort -rn
```
### Most requested URLs
```sh
awk -F\" '{print $2}' /var/log/apache2/access.log | awk '{print $2}' | sort | uniq -c | sort -rn
```
### Post requests
```sh
awk -F\" '{print $2}' /var/log/apache2/access.log | sort | uniq -c | sort -rn
```
### discard requests that appear less than 100 times. 
```sh
awk -F\" '{print $2}' /var/log/apache2/access.log | sort | uniq -c | awk '$1>=100{print}' | sort -rn
```
### Most requested URLs containing pattern
```sh
awk -F\" '($2 ~ "/api/event"){print $2}' /var/log/apache2/access.log | awk '{print $2}' | sort | uniq -c
```
### Group most requested URLs containing pattern by hour
```sh
awk -F\" '($2 ~ "/api/event"){print $1}' /var/log/apache2/access.log
```
### Split output with tee
```sh
tail -n 1 /var/log/apache2/access.log | tee >(wc -w) >(wc -c) >(awk '{ print $1 }')
```

###  Display surrounding lines with grep
```sh
grep -C 1 -m 1 ‘jquery’ /var/log/apache2/access.log
```
### Show ip
```sh
awk '{ print "IP: " $1 }’ < /var/log/apache2/access.log
```
### Show ip + Date
```sh
awk 'END{ print "IP: " $1; print "Date: " $4$5 }' < /var/log/apache2/access.log | sed 's/\[//g;s/\]//g'
```
### B-AWK-ward output (last column)
```sh
awk 'END{print $NF}' < /var/log/apache2/access.log
```
### AWK can print text from the last column with the $NF variable:
```sh
awk 'END{print $NF}' < /var/log/apache2/access.log
```

### Dissect DNS and IP information
```sh
dig $(awk ‘END{ print $1 }’ /var/log/apache2/access.log)
```
### Read archived logfiles
```sh
awk { print “IP: “ $1 }’ < <({zcat /var/log/apache2/access.log*gz & cat /var/log/apache2/access.log)}
```

### Geolocate visitors
```sh
ip=$(dig $1 | grep -A 1 'ANSWER SECTION') | awk 'END{ print $NF }')
echo geoiplookup $ip | sed -e 's/^.*: //g'
```

### Master regular expressions
```sh
tail -n 1 /var/log/apache2/access.log | sed 's/^.*-" "//g;s/"//g
```

#### Visitor lookup
```sh
matches=$(grep $@)
last_visit=$(echo $matches | tail -n 1)
echo "IP: $(echo $last_visit | awk '{print $1 }')"
echo "Total visits: $(echo $matches | wc -l)"
echo "User Agent: $(echo $last_visit | sed -e 's/^.*-" "//g' | tr -d '"')"
echo "Last visit: $(echo $last_visit | tr -d '[]' | awk '{ print $4$5 }')"
```
