# links 

### Get My Public IP Address
```sh
links2 -dump http://checkip.dyndns.com| egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Get My Public IP Address
```sh
links2 -dump http://checkip.dyndns.com | cut -d ' ' -f7
```

### Summarize Apache Extended server-status to show longest running requests
```sh
links dump 1 http://localhost/server-status|grep ^[0-9]|awk 'BEGIN {print "Seconds, PID, State, IP, Domain, TYPE, URL\n"} $4 !~ /[GCRK_.]/ {print $6, $2, $4, $11, $12, $13 " " $14|"sort -n"}'
```

### Get International Space Station sighting information for your city
```sh
links -dump "http://spaceflight.nasa.gov/realdata/sightings/cities/view.cgi?country=United_States&region=Wisconsin&city=Portage" | sed -n '//,//p'
```

### Read random news on the internet
```sh
links $( a=( $( lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort | uniq ) ) ; amax=${#a[@]} ; n=$(( `date '+%s'` % $amax )) ; echo ${a[n]} )
```

### Read random news on the internet
```sh
links `lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort -R | uniq | head -n1`
```

### Summarize Apache Extended server-status to show longest running requests
```sh
links dump 1 http://localhost/server-status|grep ^[0-9]|awk 'BEGIN {print "Seconds, PID, State, IP, Domain, TYPE, URL\n"} $4 !~ /[GCRK_.]/ {print $6, $2, $4, $11, $12, $13 " " $14|"sort -n"}'
```

### Get International Space Station sighting information for your city
```sh
links -dump "http://spaceflight.nasa.gov/realdata/sightings/cities/view.cgi?country=United_States&region=Wisconsin&city=Portage" | sed -n '//,//p'
```

### Read random news on the internet
```sh
links $( a=( $( lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort | uniq ) ) ; amax=${#a[@]} ; n=$(( `date '+%s'` % $amax )) ; echo ${a[n]} )
```

### Read random news on the internet
```sh
links `lynx -dump -listonly "http://news.google.com" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep -v "google.com" | sort -R | uniq | head -n1`
```
