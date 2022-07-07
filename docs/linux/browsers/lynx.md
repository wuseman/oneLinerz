# lynx 

### Get all URLs from webpage via Regular Expression
```sh
lynx dump "http://www.google.com.br" | egrep -o "http:.*"
```

### face are
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=100000475200812&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### fb1
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### fbari
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=521826202&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### Get all links of a website
```sh
lynx -dump http://example.com/ | awk '/http/{print $2}' | sort -u
```

### List Seeon.tv Available Video Channels
```sh
lynx dump http://www.seeon.tv/channels| grep "/channels"|awk '{print $2}'|sort -u|while read links; do lynx dump "$links"|awk '/view/ {print $2}'|sort -u; done
```

### Dump HTTP header using lynx or w3m
```sh
lynx -dump -head http://www.example.com/
```

### futz.me - Send yourself notes from the command line
```sh
lynx "futz.me/xxx hey this is a test"
```

### View the newest xkcd comic.
```sh
lynx dump source http://www.xkcd.com | grep `lynx dump http://www.xkcd.com | egrep '(png|jpg)'` | grep title | cut -d = -f2,3 | cut -d '"' -f2,4 | sed -e 's/"/|/g' | awk -F"|" ' { system("display " $1);system("echo "$2); } '
```

### Get Top Trending Topic on Twiter by location
```sh
lynx dump http://en.trending-topic.com/countries/Mexico/ | grep "62]#" | sed 's/\[62\]//g'
```

### print random commandlinefu.com submission
```sh
lynx -source http://www.commandlinefu.com/commands/random | sed 's/<[^>]*>//g' |  head -1037 | tail -10 | sed -e 's/^[ \t]*//' | sed '/^$/d' | head -2
```

### What is my ip?
```sh
lynx dump "http://checkip.dyndns.org"
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | grep http| awk '{print $2 }'
```

### Get all links of a website
```sh
lynx -dump http://domaim.com | egrep -o -e 'http://[/0-9a-z.]+html'
```

### view user friends
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### Get your external IP address
```sh
lynx dump icanhazip.com
```

### commit message generator - whatthecommit.com
```sh
lynx -dump -nolist http://whatthecommit.com/|sed -n 2p
```

### Get your external IP address
```sh
lynx dump http://ip.boa.nu|sed -e 's/^[[:space:]]*//' -e 's/*[[:space:]]$//'|grep -v ^$
```

### fb
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=4&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### Visit another command line g&#333;ngfu site
```sh
lynx http://shell-fu.org/
```

### Use lynx to run repeating website actions
```sh
lynx -accept_all_cookies -cmd_script=/your/keystroke-file
```

### Get Lorum Ipsum random text from lorumipsum.com
```sh
lynx -source http://www.lipsum.com/feed/xml?amount=3|perl -p -i -e 's/\n/\n\n/g'|sed -n '/<lipsum>/,/<\/lipsum>/p'|sed -e 's/<[^>]*>//g'
```

### Weather on the Command line
```sh
lynx -dump http://api.wunderground.com/weatherstation/WXCurrentObXML.asp?ID=KCALOSAN32 | grep GMT | awk '{print $3}'
```

### find geographical location of an ip address
```sh
lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\'
```

### Takes an html file and outputs plain text from it
```sh
lynx -dump somefile.html
```

### Retrieve a random command from the commandlinefu.com API
```sh
lynx dump http://www.commandlinefu.com/commands/random/plaintext | grep .
```

### Get Futurama quotations from slashdot.org servers
```sh
lynx -head -dump http://slashdot.org|egrep 'Bender|Fry'|sed 's/X-//'
```

### u can hear all .ogg files with vlc that thier link are in url
```sh
lynx -dump -listonly 'url' | grep -oe 'http://.*\.ogg' > 11 ; vlc 11 ; mv 11 /dev/null
```

### Short URL to commandlinefu.com commands
```sh
lynx cmdl.in/9058
```

### find geographical location of an ip address
```sh
lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|sed -nr s/'^.*My IP address city: (.+)$/\1/p'
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}'
```

### Show recent earthquakes in Bay Area
```sh
lynx width=200 dump 'http://quake.usgs.gov/recenteqs/Maps/San_Francisco_eqs.htm'|sed -ne '/MAG.*/,/^References/{;s/\[[0-9][0-9]*\]//;1,/h:m:s/d;/Back to map/,$d;/^$/d;/^[ \t][ \t]*[3-9]\.[0-9][0-9]*[ \t][ \t]*/p; }'|sort -k1nr
```

### Get the Last tweet (Better than Twitter feed rrs)
```sh
lynx dump twitter.com/(username) | sed -n "132,134 p"
```

### wala
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=Bilal Butt&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### Working random fact generator
```sh
lynx -dump randomfunfacts.com | grep -A 3 U | sed 1D
```

### get tor bridges
```sh
lynx -dump 'https://bridges.torproject.org' | sed '/^bridge [0-9\.][0-9\.]*:[0-9][0-9]*/!d'
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Get all links of a website
```sh
lynx -dump http://www.cooks4arab.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Scrape all RBLs off the anti-abuse.org site
```sh
lynx -dump http://www.anti-abuse.org/multi-rbl-check/ | grep ']' | awk -F\] '{ print $2 }' | sed '/^\[/d' | egrep -v ^[A-Z]
```

### Show external IP; Short and sweet.
```sh
lynx -dump ip.nu
```

### Geographic location and more for current external IP address.
```sh
lynx -dump http://www.ip2location.com/ | sed -n '/^ *Field Name *Value *$/,/^ *\[_\] *Mobile .*Carrier.*name/p'
```

### Use lynx to run repeating website actions
```sh
lynx -accept_all_cookies -cmd_script=/your/keystroke-file
```

### Get Lorum Ipsum random text from lorumipsum.com
```sh
lynx -source http://www.lipsum.com/feed/xml?amount=3|perl -p -i -e 's/\n/\n\n/g'|sed -n '/<lipsum>/,/<\/lipsum>/p'|sed -e 's/<[^>]*>//g'
```

### Weather on the Command line
```sh
lynx -dump http://api.wunderground.com/weatherstation/WXCurrentObXML.asp?ID=KCALOSAN32 | grep GMT | awk '{print $3}'
```

### find geographical location of an ip address
```sh
lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\'
```

### Takes an html file and outputs plain text from it
```sh
lynx -dump somefile.html
```

### Retrieve a random command from the commandlinefu.com API
```sh
lynx dump http://www.commandlinefu.com/commands/random/plaintext | grep .
```

### Get Futurama quotations from slashdot.org servers
```sh
lynx -head -dump http://slashdot.org|egrep 'Bender|Fry'|sed 's/X-//'
```

### u can hear all .ogg files with vlc that thier link are in url
```sh
lynx -dump -listonly 'url' | grep -oe 'http://.*\.ogg' > 11 ; vlc 11 ; mv 11 /dev/null
```

### Short URL to commandlinefu.com commands
```sh
lynx cmdl.in/9058
```

### find geographical location of an ip address
```sh
lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|sed -nr s/'^.*My IP address city: (.+)$/\1/p'
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}'
```

### Show recent earthquakes in Bay Area
```sh
lynx width=200 dump 'http://quake.usgs.gov/recenteqs/Maps/San_Francisco_eqs.htm'|sed -ne '/MAG.*/,/^References/{;s/\[[0-9][0-9]*\]//;1,/h:m:s/d;/Back to map/,$d;/^$/d;/^[ \t][ \t]*[3-9]\.[0-9][0-9]*[ \t][ \t]*/p; }'|sort -k1nr
```

### Get the Last tweet (Better than Twitter feed rrs)
```sh
lynx dump twitter.com/(username) | sed -n "132,134 p"
```

### wala
```sh
lynx -useragent=Opera -dump 'http://www.facebook.com/ajax/typeahead_friends.php?u=Bilal Butt&__a=1' |gawk -F'\"t\":\"' -v RS='\",' 'RT{print $NF}' |grep -v '\"n\":\"' |cut -d, -f2
```

### Working random fact generator
```sh
lynx -dump randomfunfacts.com | grep -A 3 U | sed 1D
```

### get tor bridges
```sh
lynx -dump 'https://bridges.torproject.org' | sed '/^bridge [0-9\.][0-9\.]*:[0-9][0-9]*/!d'
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Get all links of a website
```sh
lynx -dump http://www.domain.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Get all links of a website
```sh
lynx -dump http://www.cooks4arab.com | awk '/http/{print $2}' | egrep "^https{0,1}"
```

### Scrape all RBLs off the anti-abuse.org site
```sh
lynx -dump http://www.anti-abuse.org/multi-rbl-check/ | grep ']' | awk -F\] '{ print $2 }' | sed '/^\[/d' | egrep -v ^[A-Z]
```
