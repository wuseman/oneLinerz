# wget

### Download tar.gz and uncompress with a single command:

```sh
wget -q https://domain.com/archive.tar.gz -O - | tar xz
```

### Download tar.bz2 and uncompress with a single command:

```sh
wget -q https://domain.com/archive.tar.bz2 -O - | tar xj
```

### Download in background, limit bandwidth to 200KBps, do not ascend to parent URL, download only newer files, do not create new directories, download only htm,php and, pdf, set 5-second timeout per lin.

```sh
wget -b --limit-rate=200k -np -N -m -nd --accept=htm,html,php,pdf --wait=5 "${url}"
```

### Download recursively, span multiple hosts, convert links to local, limit recursion level to 4, fake “mozilla” user agent, ignore “robots” directives.

```sh
wget -r -H --convert-links --level=4 --user-agent=Mozilla "${url}" -e robots=off
```

### Generate a list of broken links:

```sh
wget --spider -o broken_links.log --wait 2 -r -p "${url}" -e robots=off
```

### Download new PDFs from a list of URLs:

```sh
wget -r --level=1 -H --timeout=2 -nd -N -np --accept=pdf -e robots=off -i urls.txt
```

### Save and use authentication cookie:

```sh
wget -O ~/.domain_cookie_tmp "https://domain.com/login.cgi?login=${username}&amp;password=${password}"
grep "^cookie" ~/.domain_cookie_tmp | awk -F'=' '{print $2}' > ~/.domain_cookie
wget -c --no-cookies --header="Cookie: enc=`cat ~/.domain_cookie`" -i "${url_file}" -nc
```

### Use wget with anonymous proxy:

```sh
export http_proxy=proxy_server:port 
wget -Y -O /tmp/yahoo.htm "http://www.yahoo.com"
```

### Use wget with authorized proxy:

```sh
export http_proxy=proxy_server:port
wget -Y --proxy-user=${username} --proxy-passwd=${password} -O /tmp/yahoo.htm "http://www.yahoo.com"
```

### Make a local mirror of a Web site:

```sh
wget -U Mozilla -m -k -D ${domain} --follow-ftp --limit-rate=50k --wait=5 --random-wait -np "${url}" -e robots=off
```

### Download images from a Web site:

```sh
wget -r -l 0 -U Mozilla -t 1 -nd -D ${domain} -A jpg,jpeg,gif,png "${url}" -e robots=off
```


### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com
```

### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Google text-to-speech in mp3 format
```sh
wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=hello+world

```
### Google text-to-speech in mp3 format
```sh
wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=hello+world

```
### Run bash script from web
```sh
wget -q -O - http://www.example.com/automation/remotescript.sh | bash /dev/stdin parameter1 parameter2

```
### Encrypt text to md5
```sh
wget -qO - post-data "data[Row][clear]=text" http://md5-encryption.com | grep -A1 "Md5 encrypted state" | tail -n1  | cut -d '"' -f3 | sed 's/>//g; s/<\/b//g'

```
### oracle-java install with one line ( prompt for sudo if needed)
```sh
wget http://www.duinsoft.nl/pkg/pool/all/update-sun-jre.bin && sh ./update-sun-jre.bin

```
### Go get those photos from a Picasa album (full size)
```sh
wget -O - "[PICASA ALBUM RSS LINK]" |sed 's/</\n</g' | grep media:content |sed 's/.*url='"'"'\([^'"'"']*\)'"'"'.*$/\1/' |awk -F'/' '{gsub($NF,"d/"$NF); print $0}'|```sh
wget -i -

```
### Play a stream and give back the shell
```sh
wget http://somesite.com/somestream.pls; cvlc somestream.pls&sleep 5; rm somestream.pls*

```
### get Hong Kong weather infomation from HK Observatory
```sh
wget -q -O - 'http://wap.weather.gov.hk/' | sed -r 's/<[^>]+>//g;/^UV/q' | grep -v '^$'

```
### get Hong Kong weather infomation from HK Observatory
```sh
wget -q -O - 'http://wap.weather.gov.hk/' | sed -r 's/<[^>]+>//g;/^UV/q' | tail -n4

```
### Get your external IP address
```sh
wget ifconfig.me/ip -q -O -

```
### What is my public IP-address?
```sh
wget quiet -O - checkip.dyndns.org | sed -e 's/[^:]*: //' -e 's/<.*$//'

```
### Find artist and title of a music cd, UPC code given (first result only)
```sh
wget http://www.discogs.com/search?q=724349691704 -O foobar &> /dev/null ; grep \/release\/ foobar | head -2 | tail -1 | sed -e 's/^<div>.*>\(.*\)<\/a><\/div>/\1/' ; rm foobar

```
### Get your external IP address
```sh
wget -O - http://checkip.dyndns.org|sed 's/[^0-9.]//g'

```
### Get the amount of currently registered users from i18n.counter.li.org.
```sh
wget -qO - http://i18n.counter.li.org/ | grep 'users registered' | sed 's/.*\<font size=7\>//g' | tr '\>' ' ' | sed 's/<br.*//g' | tr ' ' '\0'

```
### Weather
```sh
wget -qO- -U '' 'google.com/search?q=weather' | grep -oP '(-)?\d{1,3}\xB0[FC]'

```
### Sweep and download all mp3 (in French) of Rendez-vous avec X (Meet with Mr. X) of the French public radio
```sh
wget http://rendezvousavecmrx.free.fr/audio/mr_x_{1997..2015}_{01..12}_{01..31}.mp3

```
### Print the lastest stable version of Perl
```sh
wget -q  -O - http://www.perl.org/get.html | grep -m1 '\.tar\.gz' | sed 's/.*perl-//; s/\.tar\.gz.*//'

```
### Download all files under http://codeigniter.com/user_guide/ to the current directory
```sh
wget -r no-parent http://codeigniter.com/user_guide/ ; mv codeigniter.com/user_guide/* . ; rm -rf codeigniter.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Poke a Webserver to see what it's powered by.
```sh
wget -S -O/dev/null "INSERT_URL_HERE" 2>&1 | grep Server

```
### Download free e-books
```sh
wget -erobots=off user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -H -r -l2 max-redirect=1 -w 5 random-wait -PmyBooksFolder -nd no-parent -A.pdf http://URL

```
### translate what is in the clipboard in english and write it to the terminal
```sh
wget -qO - "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|zh-cn&v=1.0&q=`xsel`" |cut -d \" -f 6

```
### Downloads files (throughwget) from a list of URLs using a stored cookie
```sh
wget load-cookies <cookie-file> -c -i <list-of-urls>

```
###wget Command to Download Full Recursive Version of Web Page
```sh
wget -p convert-links http://www.foo.com

```
### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
wget -r -A .pdf -l 5 -nH no-parent http://example.com

```
### View external IP
```sh
wget -q ip.nu && cat index.html

```
### my command for downloading  delicious web links,
```sh
wget -r wait=5 quota=5000m tries=3 directory-prefix=/home/erin/Documents/erins_webpages  limit-rate=20k  level=1 -k -p -erobots=off -np -N  exclude-domains=del.icio.us,doubleclick.net -F -i ./delicious-20090629.htm

```
### View the newest xkcd comic.
```sh
wget -O xkcd_$(date +%y-%m-%d).png `lynx dump http://xkcd.com/|grep png`; eog xkcd_$(date +%y-%m-%d).png

```
### Download latest Git setup executable for Windows
```sh
wget no-check-certificate https://code.google.com/p/msysgit/downloads/list  -O - 2>nul | sed -n "0,/.*\(\/\/msysgit.googlecode.com\/files\/Git-.*\.exe\).*/s//http:\1/p" |wget -i - -O Git-Latest.exe

```
### transform relative URLs (shoddy hack but it works)
```sh
wget -k $URL

```
### Outgoing IP of server
```sh
wget http://www.whatismyip.org quiet -O - | cat

```
### wget ? server to server files transfer
```sh
wget -H -r ?level=1 -k -p http://www.domain.com/folder/

```
### Check your ip public using dyndns.org
```sh
wget -O - -q http://checkip.dyndns.org/ | cut -d':' -f2 | cut -d'<' -f1| cut -c2-

```
### Get your public IP using chisono.it
```sh
wget -O - -q http://www.chisono.it/ip.asp && echo

```
### Get all links of a website
```sh
wget -O- -q http://www.nomachine.com/download-package.php?Prod_Id=2067 | sed -n -e 'H;${x;s/\n/ /g;p;}' | sed -e "s/[Hh][Rr][Ee][Ff]=\"/\n/g" | cut -d "\"" -f1 | sort -u | grep deb$

```
### Get your external IP address
```sh
wget http://checkip.dyndns.org && clear && echo && echo My IP && egrep -o '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' index.html && echo && rm index.html

```
### Get the latest version of phpMyAdmin
```sh
wget http://tools.web4host.net/versions.tmp quiet -O - | grep PHPMYADMIN | sed 's/PHPMYADMIN=//' | cat

```
### Get me only those jpeg files!
```sh
wget mirror -A.jpg http://www.xs4all.nl/~dassel/wall/

```
### dont forget commands of old profile
```sh
wget http://www.commandlinefu.com/commands/by/e7__7dal

```
### Get all the reference docs for OS X from Apples Developer Connection site
```sh
wget -nd -nH -r -A pdf -I library/mac/documentation/ http://developer.apple.com/library/mac/navigation/#section=Resource%20Types&topic=Reference

```
### Forget fortunes in your terminal this grabs a random
```sh
wget -qO - snubster.com|sed -n '65p'|awk 'gsub(/<span><br>.*/,"")&&1'|perl -p -e 's:myScroller1.addItem\("<span class=atHeaderOrange>::g;s:</span> <span class=snubFontSmall>::g;s:&quot;:":g;s:^:\n:g;s:$:\n:'

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Dump HTTP header usingwget
```sh
wget server-response spider http://www.example.com/

```
### Usingwget to receive an XML atom feed of your Gmail inbox
```sh
wget -O - 'https://USERNAMEHERE:PASSWORDHERE@mail.google.com/mail/feed/atom' no-check-certificate

```
### Download a complete podcast
```sh
wget -c -v -S -T 100 tries=0 `curl -s http://ms1.espectador.com/ podcast/espectador/la_venganza_sera_terrible.xml | grep -v xml | grep link | sed 's/]*>//g'`

```
### Check your ip public using dyndns.org
```sh
wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>'

```
### Execute extension with chrome
```sh
wget -O gsplitter.crx "https://clients2.google.com/service/update2/crx?response=redirect&x=id%3Dlnlfpoefmdfplomdfppalohfbmlapjjo%26uc%26lang%3Den-US&prod=chrome&prodversion=8.0.552.224" ; google-chrome load-extension gspliter.crx

```
### Get your public ip
```sh
wget -qO - http://cfaj.freeshell.org/ipaddr.cgi

```
### Current host external IP
```sh
wget http://cmyip.com -O - -o /dev/null | awk '/\<title/ {print $4}'

```
### count occurences of each word in novel David Copperfield
```sh
wget -q -O- http://www.gutenberg.org/dirs/etext96/cprfd10.txt | sed  '1,419d' | tr "\n" " " | tr " " "\n" | perl -lpe 's/\W//g;$_=lc($_)' | grep "^[a-z]" | awk 'length > 1' | sort | uniq -c | awk '{print $2"\t"$1}'

```
### &#1089;&#1082;&#1072;&#1095;&#1072;&#1090;&#1100; &#1089;&#1072;&#1081;&#1090;
```sh
wget -r -k -l 7 -p -E -nc http://site.com/

```
### redirectwget output to the terminal, instead of a file
```sh
wget -q -O - "$@" <url>

```
### Get your external IP address
```sh
wget -q -O - checkip.dyndns.org|sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

```
### Download Youtube video with wget!
```sh
wget http://www.youtube.com/watch?v=dQw4w9WgXcQ -qO- \
| sed -n "/fmt_url_map/{s/[\'\"\|]/\n/g;p}" \
| sed -n '/^fmt_url_map/,/videoplayback/p' \
| sed -e :a -e '$q;N;5,$D;ba' \
| tr -d '\n' \
| sed -e 's/\(.*\),\(.\)\{1,3\}/\1/' | wget -i - -O surprise.flv

```

### Download all images from a site
```sh
wget -r -l1 no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images

```
### Retrieve a random command from the commandlinefu.com API
```sh
wget -qO - http://www.commandlinefu.com/commands/random/plaintext | sed -n '1d; /./p'

```
### Get your external IP address
```sh
wget -O - -q http://whatismyip.org/

```
### Lets Tux say the random fact. [add it to .bashrc to see it in new terminal window]
```sh
wget randomfunfacts.com -O - 2>/dev/null|grep \<strong\>|sed "s;^.*<i>\(.*\)</i>.*$;\1;"|cowsay -f tux

```
### Get your external IP address
```sh
wget -O - -q ip.boa.nu

```
### Get own public IP address
```sh
wget -qO- whatismyip.org

```
### get you public ip address
```sh
wget -q -nd http://www.biranchi.com/ip.php; echo "Your external ip is : `cat ip.php`"

```
###wget - 403 Forbidden Error
```sh
wget -U Mozilla http://example.com/foo.tar.gz

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Block the 6700 worst spamhosts
```sh
wget -q -O - http://someonewhocares.org/hosts/ | grep ^127 >> /etc/hosts

```
### background awget download
```sh
wget -b http://dl.google.com/android/android-sdk_r14-linux.tgz

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Block known dirty hosts from reaching your machine
```sh
wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'

```
### Find out how old a web page is
```sh
wget -S spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

```
### Download an entire ftp directory usingwget
```sh
wget -r ftp://user:pass@ftp.example.com

```
### Download from Rapidshare Premium usingwget - Part 2
```sh
wget -c -t 1 load-cookies ~/.cookies/rapidshare <URL>

```
### usewget to check if a remote file exists
```sh
wget spider -v http://www.server.com/path/file.ext

```
### Retrieve the size of a file on a server
```sh
wget spider $URL 2>&1 | awk '/Length/ {print $2}'

```
### Google Translate
```sh
wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=translation+example&sl=auto&tl=fr" | sed 's/\[\[\[\"//' | cut -d \" -f 1

```
### translate what is in the clipboard in english and write it to the terminal
```sh
wget -qO - "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6

```
### Download Apple movie trailers
```sh
wget -U "QuickTime/7.6.2 (qtver=7.6.2;os=Windows NT 5.1Service Pack 3)" `echo http://movies.apple.com/movies/someHDmovie_720p.mov | sed 's/\([0-9][0-9]\)0p/h\10p/'`

```
### Update your OpenDNS network ip
```sh
wget -q user=<username> password=<password> 'https://updates.opendns.com/nic/update?hostname=your_opendns_hostname&myip=your_ip' -O -

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### return external ip
```sh
wget -O - -q icanhazip.com

```
### download file1 file2 file3 file4 .... file 100
```sh
wget http://domain.com/file{1..100}

```
### backup your entire hosted website using cPanel backup interface andwget
```sh
wget http-user=YourUsername http-password=YourPassword http://YourWebsiteUrl:2082/getbackup/backup-YourWebsiteUrl-`date +"%-m-%d-%Y"`.tar.gz

```
### Add a GPL license file to your project
```sh
wget -O LICENSE.txt http://www.gnu.org/licenses/gpl-3.0.txt

```
### Extract tarball from internet without local saving
```sh
wget -O - http://example.com/a.gz | tar xz

```
### Find a CommandlineFu users average command rating
```sh
wget -qO- www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'

```
### ThePirateBay.org torrent search
```sh
wget -U Mozilla -qO - "http://thepiratebay.org/search/your_querry_here/0/7/0" | grep -o 'http\:\/\/torrents\.thepiratebay\.org\/.*\.torrent'

```
### add a gpg key to aptitute package manager in a ubuntu system
```sh
wget -q http://xyz.gpg -O- | sudo  apt-key add -

```
### Ping Twitter to check if you can connect
```sh
wget http://twitter.com/help/test.json -q -O -

```
### Download from Rapidshare Premium usingwget - Part 1
```sh
wget save-cookies ~/.cookies/rapidshare post-data "login=USERNAME&password=PASSWORD" -O - https://ssl.rapidshare.com/cgi-bin/premiumzone.cgi > /dev/null

```
### Get gzip compressed web page usingwget.
```sh
wget  -q -O- header\="Accept-Encoding: gzip" <url> | gunzip > out.html

```
### Get your outgoing IP address
```sh
wget http://icanhazip.com -qO-

```
### Grab all .flv files from a webpage to the current working directory
```sh
wget `lynx -dump http://www.ebow.com/ebowtube.php | grep .flv$ | sed 's/[[:blank:]]\+[[:digit:]]\+\. //g'`

```
### Recover username and password for Technicolor TC7200 admin page (vulnerability)
```sh
wget -q -O - http://192.168.0.1/goform/system/GatewaySettings.bin | strings | tail -n 2

```
### What is my ip?
```sh
wget -q -O - ifconfig.co

```
### Run remote web page, but don't save the results
```sh
wget -O /dev/null http://www.google.com

```
### What is my public IP-address?
```sh
wget -qO- ifconfig.me/ip

```
### Google voice recognition "API"
```sh
wget -q -U "Mozilla/5.0" post-file speech.flac header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium"

```
### Mirror the NASA Astronomy Picture of the Day Archive
```sh
wget -t inf -k -r -l 3 -p -m http://apod.nasa.gov/apod/archivepix.html

```
### Donwload media from *.rm from an url of type htttp://.../*.ram
```sh
wget <URL> -O- |wget -i -

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download all manuals RedHat 7 (CentOS/Fedora) with one command in Linux
```sh
wget -q -O- https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep Linux/7/pdf | cut -d \" -f 2 | awk '{print "https://access.redhat.com"$1}' | xargswget

```
### Download all music files off of a website using wget
```sh
wget -r -l1 -H -nd -A mp3 -e robots=off http://example/url

```
### Update IP filter for qBittorrent
```sh
wget -O - http://list.iblocklist.com/\?list\=ydxerpxkpcfqjaybcssw\&fileformat\=p2p\&archiveformat\=gz | gunzip > ~/ipfilter.p2p

```
### Save an HTML page, and covert it to a .pdf file
```sh
wget $URL | htmldoc webpage -f "$URL".pdf - ; xpdf "$URL".pdf &

```
### Video Google download
```sh
wget -qO- "VURL" | grep -o "googleplayer.swf?videoUrl\\\x3d\(.\+\)\\\x26thumbnailUrl\\\x3dhttp" | grep -o "http.\+" | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs echo -e | sed 's/.\{22\}$//g' | xargswget -O OUPUT_FILE

```
### Echo the latest commands from commandlinefu on the console
```sh
wget -O - http://www.commandlinefu.com/commands/browse/rss 2>/dev/null | awk '/\s*<title/ {z=match($0, /CDATA\[([^\]]*)\]/, b);print b[1]} /\s*<description/ {c=match($0, /code>(.*)<\/code>/, d);print d[1]} ' | grep -v "^$"

```
### Download YouTube Videos usingwget and youtube-dl and just using the video link
```sh
wget -O "output-filename.mp4" $( youtube-dl -g -f "format-number" "youtube-video-link" )

```
### Go get those photos from a Picasa album
```sh
wget 'link of a Picasa WebAlbum' -O - |perl -e'while(<>){while(s/"media":{"content":\[{"url":"(.+?\.JPG)//){print "$1\n"}}' |```sh
wget -w1 -i -

```
### Display a random crass ascii art from www.asciiartfarts.com
```sh
wget -qO - http://www.asciiartfarts.com/random.cgi | sed -n '/<pre>/,/<\/pre>/p' | sed -n '/<table*/,/<\/table>/p' | sed '1d' | sed '$d' | recode html..ascii

```
### download and unpack tarball without leaving it sitting on your hard drive
```sh
wget -qO - http://example.com/path/to/blah.tar.gz | tar xzf -

```
### get all pdf and zips from a website usingwget
```sh
wget reject html,htm accept pdf,zip -rl1 url

```
###wget progress bar with customized data size for dots
```sh
wget blah progress=dot -e dotbytes=100M

```
### Working random fact generator
```sh
wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;" | while read FUNFACT; do notify-send -t $((1000+300*`echo -n $FUNFACT | wc -w`)) -i gtk-dialog-info "RandomFunFact" "$FUNFACT"; done

```
### wget with resume
```sh
wget -c 
```
### add a gpg key to aptitute package manager in a ubuntu system
```sh
wget -q http://xyz.gpg -O- | sudo  apt-key add -

```
### MPD + Digitally Imported
```sh
wget -q -O - http://listen.di.fm/public2 | sed 's/},{/\n/g' | perl -n -e '/"key":"([^"]*)".*"playlist":"([^"]*)"/; print "$1\n"; system("```sh
wget -q -O - $2 | grep -E '^File' | cut -d= -f2 > di_$1.m3u")'

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download a file and uncompress it while it downloads
```sh
wget http://URL/FILE.tar.gz -O - | tar xfz -

```
### External IP (raw data)
```sh
wget -qO- http://utils.admin-linux.fr/ip.php

```
### Print trending topics on Twitter
```sh
wget http://search.twitter.com/trends.json -O - quiet | ruby -rubygems -e 'require "json";require "yaml"; puts YAML.dump(JSON.parse($stdin.gets))'

```
### Download an entire static website to your local machine
```sh
wget recursive  page-requisites convert-links www.moyagraphix.co.za

```
### Get My Public IP Address
```sh
wget -qO - http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

```
### resolving basic authentication problem(401) with wget
```sh
wget auth-no-challenge server-response -O- $url 2>&1 | grep "Cookie" | sed "s/^  Set-//g" > cookie.txt;
wget auth-no-challenge server-response http-user="user" http-password="pw" header="$(cat cookie.txt)" -O- $url
```
### Download an entire website from a specific folder on down
```sh
wget recursive no-clobber page-requisites html-extension convert-links domains website.org no-parent www.website.com/folder

```
### use wget to check if a remote file exists
```sh
wget -O/dev/null -q URLtoCheck && echo exists || echo not exist

```
### Download and install the newest dropbox beta
```sh
wget http://forums.dropbox.com && wget $(cat index.html|grep "Latest Forum Build"|cut -d"\"" -f2) && wget $(cat topic.php*|grep "Linux x86:"|cut -d"\"" -f2|sort -r|head -n1) && rm -rf ~/.dropbox* && rm index.html *.php* && tar zxvf dropbox-*.tar.gz -C ~/

```
### Download all PDFs from an authenificated website
```sh
wget -r -np -nd -A.pdf user *** password *** http://www.domain.tld/courses/***/download/

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Extract tarball from internet without local saving
```sh
wget -qO - "http://www.tarball.com/tarball.gz" | tar zxvf -

```
### Extract tarball from internet without local saving
```sh
wget -qO - "http://www.tarball.com/tarball.gz" | tar zxvf -

```
### Download all mp3's listed in an html page
```sh
wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off [url of website]

```
### let the cow suggest some commit messages for you
```sh
wget -qO- http://whatthecommit.com/index.txt | cowsay

```
### Download and install the OpenStore on the Ubuntu Phone
```sh
wget https://open.uappexplorer.com/api/download/openstore.openstore-team/openstore.*_*_armhf.click && pkcon install-local allow-untrusted openstore.*_*_armhf.click

```
### Play music from youtube without download
```sh
wget -q -O - `youtube-dl -b -g $url`| ffmpeg -i - -f mp3 -vn -acodec libmp3lame -| mpg123  -

```
### Downlaoad websites to 5 level and browse offline!
```sh
wget -k -r -l 5 http://gentoo-install.com

```
### Google dictionary of word definitions
```sh
wget -qO - "http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=steering+wheel&sl=en&tl=en&restrict=pr,de&client=te" | sed 's/dict_api\.callbacks.id100.//' | sed 's/,200,null)//'

```
### download newest adminer and rename to it's version accordingly
```sh
wget -N content-disposition http://www.adminer.org/latest.php

```
### View the newest xkcd comic.
```sh
wget `lynx dump http://xkcd.com/|grep png`

```
### Download latest NVIDIA Geforce x64 Windows driver
```sh
wget "us.download.nvidia.com$(```sh
wget -qO- "$(```sh
wget -qO- "nvidia.com/Download/processFind.aspx?psid=95&pfid=695&osid=19&lid=1&lang=en-us"|awk '/driverResults.aspx/ {print $4}'|cut -d "'" -f2|head -n 1)"|awk '/url=/ {print $2}'|cut -d '=' -f3|cut -d '&' -f1)"

```
### A simple way to securely use passwords on the command line or in scripts
```sh
wget input-file=~/donwloads.txt user="$USER" password="$(gpg2 decrypt ~/.gnupg/passwd/http-auth.gpg 2>/dev/null)"

```
### google chart api
```sh
wget -O chart.png 'http://chart.googleapis.com/chart?chs=250x100&chd=t:60,40&cht=p3&chl=Hello|World'

```
### command line fu roulette
```sh
wget -qO - www.commandlinefu.com/commands/random | grep "<div class=\"command\">" | sed 's/<[^>]*>//g; s/^[ \t]*//; s/&quot;/"/g; s/&lt;/</g; s/&gt;/>/g; s/&amp;/\&/g'

```
### Working random fact generator
```sh
wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"

```
### download specific files only from a website
```sh
wget -r -P ./dl/ -A jpg,jpeg http://captivates.com

```
### recursively walk down no more than three levels and grab any file with an extension of mp3, mpg, mpeg, or avi
```sh
wget -A mp3,mpg,mpeg,avi -r -l 3 http://www.site.com/

```
### Download all data from Google Ngram Viewer
```sh
wget -qO - http://ngrams.googlelabs.com/datasets | grep -E href='(.+\.zip)' | sed -r "s/.*href='(.+\.zip)'.*/\1/" | uniq | while read line; do ````sh
wget $line`; done

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an Entire website with wget
```sh
wget -m -k -K -E http://url/of/web/site

```
### download the contents of a remote folder in the current local folder
```sh
wget -r -l1 -np -nd http://yoururl.com/yourfolder/

```
### Grab mp3 files from your favorite netcasts, mp3blog, or sites that often have good mp3s
```sh
wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off -i ~/sourceurls.txt

```
### Decrypt MD5
```sh
wget -qO - post-data "data[Row][cripted]=1cb251ec0d568de6a929b520c4aed8d1" http://md5-decrypter.com/  | grep -A1 "Decrypted text"  | tail -n1 | cut -d '"' -f3 | sed 's/>//g; s/<\/b//g'

```
### Get own public IP address
```sh
wget http://ipecho.net/plain -O - -q ; echo

```
### Get your external IP address without curl
```sh
wget -qO- icanhazip.com

```
### speedtest
```sh
wget output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip

```
### count the appearance of a word or a string  in a given webpage
```sh
wget -q -O- PAGE_URL | grep -o 'WORD_OR_STRING' | wc -w

```
### Stream and save Youtube video
```sh
wget `youtube-dl -g 'http://www.youtube.com/watch?v=-S3O9qi2E2U'` -O - | tee -a parachute-ending.flv | mplayer -cache 8192 -

```
### download with checksum
```sh
wget -qO - http://www.google.com | tee >(md5sum) > /tmp/index.html

```
### Download latest released gitlab docker container
```sh
wget -qO- 'https://github.com'$(curl -s 'https://github.com'$(curl -s https://github.com/sameersbn/docker-gitlab/releases | grep -m 1 -o '<a.*[0-9\.]</a>' | cut -d '"' -f 2) | grep -o '<a.* rel="nofollow">' | grep 'tar.gz' | cut -d '"' -f 2)

```
### Download full FLAC albums from archive.org
```sh
wget -rc -A.flac tries=5 http://archive.org/the/url/of/the/album

```
### Get your external IP address
```sh
wget -qO - http://www.sputnick-area.net/ip;echo

```
### Git autocomplete
```sh
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash; mv git-completion.bash ~/.git-completion.bash; echo "source ~/.git-completion.bash" > ~/.bashrc; source ~/.git-completion.bash

```
### Download an entire website
```sh
wget -mkEpnp example.com

```
### Get all files of particular type (say, mp3) listed on some web page (say, audio.org)
```sh
wget -c -r no-parent -A .mp3 http://audio.org/mp3s/

```
### Download just html of a whole website
```sh
wget mirror random-wait recursive robots=off -U mozilla  -R gif,jpg,pdf reject-regex '((.*)\?(.*))|(.*)' -c [URLGOESHERE]

```
### grep BTC last trading price from BTC-E, but u can change it.. they got em all
```sh
wget -q -O- http://bitinfocharts.com/markets/btc-e/btc-usd.html |grep -o -P 'lastTrade">([0-9]{1,})(.){0,1}[0-9]{0,}' |grep -o -P '(\d)+(\.){0,1}(\d)*' |head -n 1

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### External IP address
```sh
wget http://cmyip.com -O - -o /dev/null | grep -Po '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'

```
### check broken links using wget as a spider
```sh
wget spider  -owget.log  -e robots=off wait 1 -r -p http://www.example.com

```
### Make mirror of ftp directory
```sh
wget -m ftp-user=root ftp-password=pass -A "*.csv" -nd -P "dirname" ftp://46.46.46.46/../mnt/sd/

```
### Parallel file downloading with wget
```sh
wget -nv http://en.wikipedia.org/wiki/Linux -O- | egrep -o "http://[^[:space:]]*.jpg" | xargs -P 10 -r -n 1wget -nv

```
### download whole website localls with wget mirroring
```sh
wget recursive no-clobber page-requisites html-extension convert-links restrict-file-names=windows domains website.tld http://www.website.tld

```
### Download current stable kernel version from kernel.org
```sh
wget no-check-certificate https://www.kernel.org/$(```sh
wget -qO- no-check-certificate https://www.kernel.org | grep tar | head -n1 | cut -d\" -f2)

```
### Echo the latest commands from commandlinefu on the console
```sh
wget -O - http://www.commandlinefu.com/commands/browse/rss 2>/dev/null | awk '/\s*<title/ {z=match($0, /CDATA\[([^\]]*)\]/, b);print b[1]} /\s*<description/ {c=match($0, /code>(.*)<\/code>/, d);print d[1]"\n"} '

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### download and run script from trusted webserver
```sh
wget -qO - sometrusted.web.site/tmp/somecommand | sh

```
### Run remote web page, but don't save the results
```sh
wget -q spider http://server/cgi/script

```
### Random (sfw, 1920x1080) wallpaper from wallbase.cc
```sh
wget no-use-server-timestamps  $(curl $(curl http://wallbase.cc/random/23/eqeq/1920x1080/0/100/20 | grep 'wallpaper/' | awk -F'"' '{print $2}' | head -n1) | grep -A4 bigwall | grep img | awk -F'"' '{print $2}'); feh bg-center $(ls -1t | head -n1)

```
### Make ABBA better (requires firefox)
```sh
wget -O - -q http://www.azlyrics.com/lyrics/abba/takeachanceonme.html | sed -e 's/[cC]hance/dump/g' > ~/tdom.htm && firefox ~/tdom.htm

```
### Download all images from a website in a single folder
```sh
wget -nd -r -l 2 -A jpg,jpeg,png,gif http://website-url.com

```
### Get the latest Geek and Poke comic
```sh
wget -q $(lynx dump 'http://geekandpoke.typepad.com/' | grep '\/.a\/' | grep '\-pi' | head -n 1 | awk '{print $2}') -O geekandpoke.jpg

```
### Geo Location of an IP-address
```sh
wget -qO - whatismyipaddress.com/ip/<type ip address> | grep -E "City:|Country:" | sed 's:<tr><th>::'| sed 's</th>::' | sed 's:</td>::' | sed 's:</tr>::' | sed 's:<img*::'

```
### Download all files of a certain type with wget.
```sh
wgetall () { wget -r -l2 -nd -Nc -A.$@ $@ }

```
### my command for downloading  delicious web links,
```sh
wget  -H -r  -nv level=1  -k -p -erobots=off -np -N  exclude-domains=del.icio.us,doubleclick.net exclude-directories=

```
### Define words with google. (busybox version)
```sh
wget -q -U busybox -O- "http://www.google.com/search?ie=UTF8&q=define%3A$1" | tr '<' '\n' | sed -n 's/^li>\(.*\)/\1\n/p'

```
### Download an entire static website to your local machine
```sh
wget recursive  page-requisites convert-links www.moyagraphix.co.za

```
### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
wget -O - http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http://i.imgur.com[^&]+jpg' | head -1 | xargswget -O background.jpg

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Display a quote of the day in notification bubble
```sh
wget -q -O "quote" https://www.goodreads.com/quotes_of_the_day;notify-send "$(echo "Quote of the Day";cat quote | grep '&ldquo;\|/author/show' | sed -e 's/<[a-zA-Z\/][^>]*>//g' | sed 's/&ldquo;//g' | sed 's/&rdquo;//g')"; rm -f quote

```
### Write a bootable Linux .iso file directly to a USB-stick
```sh
wget -O/dev/sdb ftp://ftp.debian.org/debian/dists/stable/main/installer-amd64/current/images/netboot/mini.iso

```
### get events from google calendar for a given dates range
```sh
wget -q -O - 'URL/full?orderby=starttime&singleevents=true&start-min=2009-06-01&start-max=2009-07-31' |  perl -lane '@m=$_=~m/<title type=.text.>(.+?)</g;@a=$_=~m/startTime=.(2009.+?)T/g;shift @m;for ($i=0;$i<@m;$i++){ print $m[$i].",".$a[$i];}';

```
### print latest `(top 10, top 3 or *) commandlinefu.com commands´`

```sh
wget -qO - http://www.commandlinefu.com/feed/tenup | xmlstarlet sel -T -t -o '&lt;x&gt;' -n -t -m rss/channel/item -o '&lt;y&gt;' -n -v description -o '&lt;/y&gt;' -n -t -o '&lt;/x&gt;' | xmlstarlet sel -T -t -m x/y -v code -n

```
### Use wget to download one page and all it's requisites for offline viewing
```sh
wget -e robots=off -E -H -k -K -p http://<page>

```
### View a random xkcd comic
```sh
wget -q http://dynamic.xkcd.com/comic/random/ -O-| sed -n '/<img src="http:\/\/imgs.xkcd.com\/comics/{s/.*\(http:.*\)" t.*/\1/;p}' | awk '{system ("```sh
wget -q " $1 " -O- | display -title $(basename " $1") -write /tmp/$(basename " $1")");}'

```
### Mirror site with rel-links, 20s delay via wget
```sh
wget -mk -w 20 http://www.example.com/

```
### Download and extract a tarball on a fly, saving it
```sh
wget -O- http://example.com/mytarball.tgz | tee mytarball.tgz | tar xzv

```
### 4chan image batch downloader
```sh
wget thread_link -qO - | sed 's/\ /\n/g' | grep -e png -e jpg | grep href | sed 's/href\=\"/http:/g' | sed 's/"//g' | uniq | xargswget

```
### Download first mp3 file linked in a RSS feed
```sh
wget `curl -s <podcast feed URL> | grep -o 'https*://[^"]*mp3' | head -1`

```
### AmazonMP3 Daily Deals
```sh
wget -qO- "http://www.amazon.com/b?ie=UTF8&node=163856011" | grep Daily | sed -e 's/<[^>]*>//g' -e 's/^ *//' -e 's/\&[^;]*;/ /'

```
### What is my public IP address
```sh
wget -qO - http://whatismyip.org | tail

```
### Download files linked in a RSS feed
```sh
wget -q -O- http://example-podcast-feed.com/rss | grep -o "<enclosure[ -~][^>]*" | grep -o "http://[ -~][^\"]*" | xargswget -c

```
###wget
```sh
wget www.google.com

```
### Get all files with a certain extension linked to on a page
```sh
wget -r -nd -q -A "*.ext" http://www.example.org/

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Google text-to-speech in mp3 format
```sh
wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=hello+world

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Poke a Webserver to see what it's powered by.
```sh
wget -S -O/dev/null "INSERT_URL_HERE" 2>&1 | grep Server

```
### Download free e-books
```sh
wget -erobots=off user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -H -r -l2 max-redirect=1 -w 5 random-wait -PmyBooksFolder -nd no-parent -A.pdf http://URL

```
### wget Command to Download Full Recursive Version of Web Page
```sh
wget -p convert-links http://www.foo.com

```
### Get all files of particular type (say, PDF) listed on some wegpage (say, example.com)
```sh
wget -r -A .pdf -l 5 -nH no-parent http://example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Dump HTTP header using wget
```sh
wget server-response spider http://www.example.com/

```
### Download Youtube video with wget!
```sh
wget http://www.youtube.com/watch?v=dQw4w9WgXcQ -qO- | sed -n "/fmt_url_map/{s/[\'\"\|]/\n/g;p}" | sed -n '/^fmt_url_map/,/videoplayback/p' | sed -e :a -e '$q;N;5,$D;ba' | tr -d '\n' | sed -e 's/\(.*\),\(.\)\{1,3\}/\1/' |wget -i - -O surprise.flv

```
### Download all images from a site
```sh
wget -r -l1 no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images

```
### Retrieve a random command from the commandlinefu.com API
```sh
wget -qO - http://www.commandlinefu.com/commands/random/plaintext | sed -n '1d; /./p'

```
### Lets Tux say the random fact. [add it to .bashrc to see it in new terminal window]
```sh
wget randomfunfacts.com -O - 2>/dev/null|grep \<strong\>|sed "s;^.*<i>\(.*\)</i>.*$;\1;"|cowsay -f tux

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Block the 6700 worst spamhosts
```sh
wget -q -O - http://someonewhocares.org/hosts/ | grep ^127 >> /etc/hosts

```
### background awget download
```sh
wget -b http://dl.google.com/android/android-sdk_r14-linux.tgz

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Block known dirty hosts from reaching your machine
```sh
wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'

```
### Find out how old a web page is
```sh
wget -S spider http://osswin.sourceforge.net/ 2>&1 | grep Mod

```
### Download an entire ftp directory usingwget
```sh
wget -r ftp://user:pass@ftp.example.com

```
### Download from Rapidshare Premium usingwget - Part 2
```sh
wget -c -t 1 load-cookies ~/.cookies/rapidshare <URL>

```
### use wget to check if a remote file exists
```sh
wget spider -v http://www.server.com/path/file.ext

```
### Retrieve the size of a file on a server
```sh
wget spider $URL 2>&1 | awk '/Length/ {print $2}'

```
### Google Translate
```sh
wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=translation+example&sl=auto&tl=fr" | sed 's/\[\[\[\"//' | cut -d \" -f 1

```
### translate what is in the clipboard in english and write it to the terminal
```sh
wget -qO - "http://ajax.googleapis.com/ajax/services/language/translate?langpair=|en&v=1.0&q=`xsel`" |cut -d \" -f 6

```
### Download Apple movie trailers
```sh
wget -U "QuickTime/7.6.2 (qtver=7.6.2;os=Windows NT 5.1Service Pack 3)" `echo http://movies.apple.com/movies/someHDmovie_720p.mov | sed 's/\([0-9][0-9]\)0p/h\10p/'`

```
### Update your OpenDNS network ip
```sh
wget -q user=<username> password=<password> 'https://updates.opendns.com/nic/update?hostname=your_opendns_hostname&myip=your_ip' -O -

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### return external ip
```sh
wget -O - -q icanhazip.com

```
### download file1 file2 file3 file4 .... file 100
```sh
wget http://domain.com/file{1..100}

```
### backup your entire hosted website using cPanel backup interface and wget
```sh
wget http-user=YourUsername http-password=YourPassword http://YourWebsiteUrl:2082/getbackup/backup-YourWebsiteUrl-`date +"%-m-%d-%Y"`.tar.gz

```
### Add a GPL license file to your project
```sh
wget -O LICENSE.txt http://www.gnu.org/licenses/gpl-3.0.txt

```
### Extract tarball from internet without local saving
```sh
wget -O - http://example.com/a.gz | tar xz

```
### Find a CommandlineFu users average command rating
```sh
wget -qO- www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/num-votes/{S+=$2; I++}END{print S/I}'

```
### ThePirateBay.org torrent search
```sh
wget -U Mozilla -qO - "http://thepiratebay.org/search/your_querry_here/0/7/0" | grep -o 'http\:\/\/torrents\.thepiratebay\.org\/.*\.torrent'

```
### add a gpg key to aptitute package manager in a ubuntu system
```sh
wget -q http://xyz.gpg -O- | sudo  apt-key add -

```
### Ping Twitter to check if you can connect
```sh
wget http://twitter.com/help/test.json -q -O -

```
### Download from Rapidshare Premium usingwget - Part 1
```sh
wget save-cookies ~/.cookies/rapidshare post-data "login=USERNAME&password=PASSWORD" -O - https://ssl.rapidshare.com/cgi-bin/premiumzone.cgi > /dev/null

```
### Get gzip compressed web page usingwget.
```sh
wget  -q -O- header\="Accept-Encoding: gzip" <url> | gunzip > out.html

```
### Get your outgoing IP address
```sh
wget http://icanhazip.com -qO-

```
### Grab all .flv files from a webpage to the current working directory
```sh
wget `lynx -dump http://www.ebow.com/ebowtube.php | grep .flv$ | sed 's/[[:blank:]]\+[[:digit:]]\+\. //g'`

```
### Recover username and password for Technicolor TC7200 admin page (vulnerability)
```sh
wget -q -O - http://192.168.0.1/goform/system/GatewaySettings.bin | strings | tail -n 2

```
### What is my ip?
```sh
wget -q -O - ifconfig.co

```
### Run remote web page, but don't save the results
```sh
wget -O /dev/null http://www.google.com

```
### What is my public IP-address?
```sh
wget -qO- ifconfig.me/ip

```
### Google voice recognition "API"
```sh
wget -q -U "Mozilla/5.0" post-file speech.flac header="Content-Type: audio/x-flac; rate=16000" -O - "http://www.google.com/speech-api/v1/recognize?lang=en-us&client=chromium"

```
### Mirror the NASA Astronomy Picture of the Day Archive
```sh
wget -t inf -k -r -l 3 -p -m http://apod.nasa.gov/apod/archivepix.html

```
### Donwload media from *.rm from an url of type htttp://.../*.ram
```sh
wget <URL> -O- |wget -i -

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download all manuals RedHat 7 (CentOS/Fedora) with one command in Linux
```sh
wget -q -O- https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/ | grep Linux/7/pdf | cut -d \" -f 2 | awk '{print "https://access.redhat.com"$1}' | xargswget

```
### Download all music files off of a website usingwget
```sh
wget -r -l1 -H -nd -A mp3 -e robots=off http://example/url

```
### Update IP filter for qBittorrent
```sh
wget -O - http://list.iblocklist.com/\?list\=ydxerpxkpcfqjaybcssw\&fileformat\=p2p\&archiveformat\=gz | gunzip > ~/ipfilter.p2p

```
### Save an HTML page, and covert it to a .pdf file
```sh
wget $URL | htmldoc webpage -f "$URL".pdf - ; xpdf "$URL".pdf &

```
### Video Google download
```sh
wget -qO- "VURL" | grep -o "googleplayer.swf?videoUrl\\\x3d\(.\+\)\\\x26thumbnailUrl\\\x3dhttp" | grep -o "http.\+" | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs echo -e | sed 's/.\{22\}$//g' | xargswget -O OUPUT_FILE

```
### Echo the latest commands from commandlinefu on the console
```sh
wget -O - http://www.commandlinefu.com/commands/browse/rss 2>/dev/null | awk '/\s*<title/ {z=match($0, /CDATA\[([^\]]*)\]/, b);print b[1]} /\s*<description/ {c=match($0, /code>(.*)<\/code>/, d);print d[1]} ' | grep -v "^$"

```
### Download YouTube Videos usingwget and youtube-dl and just using the video link
```sh
wget -O "output-filename.mp4" $( youtube-dl -g -f "format-number" "youtube-video-link" )

```
### Go get those photos from a Picasa album
```sh
wget 'link of a Picasa WebAlbum' -O - |perl -e'while(<>){while(s/"media":{"content":\[{"url":"(.+?\.JPG)//){print "$1\n"}}' |```sh
wget -w1 -i -

```
### Display a random crass ascii art from www.asciiartfarts.com
```sh
wget -qO - http://www.asciiartfarts.com/random.cgi | sed -n '/<pre>/,/<\/pre>/p' | sed -n '/<table*/,/<\/table>/p' | sed '1d' | sed '$d' | recode html..ascii

```
### download and unpack tarball without leaving it sitting on your hard drive
```sh
wget -qO - http://example.com/path/to/blah.tar.gz | tar xzf -

```
### get all pdf and zips from a website using wget
```sh
wget reject html,htm accept pdf,zip -rl1 url

```
###wget progress bar with customized data size for dots
```sh
wget blah progress=dot -e dotbytes=100M

```
### Working random fact generator
```sh
wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;" | while read FUNFACT; do notify-send -t $((1000+300*`echo -n $FUNFACT | wc -w`)) -i gtk-dialog-info "RandomFunFact" "$FUNFACT"; done
```
###wget with resume
```sh
wget -c   orwget continue

```
### add a gpg key to aptitute package manager in a ubuntu system
```sh
wget -q http://xyz.gpg -O- | sudo  apt-key add -

```
### MPD + Digitally Imported
```sh
wget -q -O - http://listen.di.fm/public2 | sed 's/},{/\n/g' | perl -n -e '/"key":"([^"]*)".*"playlist":"([^"]*)"/; print "$1\n"; system("```sh
wget -q -O - $2 | grep -E '^File' | cut -d= -f2 > di_$1.m3u")'

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download a file and uncompress it while it downloads
```sh
wget http://URL/FILE.tar.gz -O - | tar xfz -

```
### External IP (raw data)
```sh
wget -qO- http://utils.admin-linux.fr/ip.php

```
### Print trending topics on Twitter
```sh
wget http://search.twitter.com/trends.json -O - quiet | ruby -rubygems -e 'require "json";require "yaml"; puts YAML.dump(JSON.parse($stdin.gets))'

```
### Download an entire static website to your local machine
```sh
wget recursive  page-requisites convert-links www.moyagraphix.co.za

```
### Get My Public IP Address
```sh
wget -qO - http://myip.dk/ | egrep -m1 -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

```
### resolving basic authentication problem(401) withwget
```sh
wget auth-no-challenge server-response -O- $url 2>&1 | grep "Cookie" | sed "s/^  Set-//g" > cookie.txt; wget auth-no-challenge server-response http-user="user" http-password="pw" header="$(cat cookie.txt)" -O- $url

```
### Download an entire website from a specific folder on down
```sh
wget recursive no-clobber page-requisites html-extension convert-links domains website.org no-parent www.website.com/folder

```
### usewget to check if a remote file exists
```sh
wget -O/dev/null -q URLtoCheck && echo exists || echo not exist

```
### Download and install the newest dropbox beta
```sh
wget http://forums.dropbox.com &&wget $(cat index.html|grep "Latest Forum Build"|cut -d"\"" -f2) &&wget $(cat topic.php*|grep "Linux x86:"|cut -d"\"" -f2|sort -r|head -n1) && rm -rf ~/.dropbox* && rm index.html *.php* && tar zxvf dropbox-*.tar.gz -C ~/

```
### Download all PDFs from an authenificated website
```sh
wget -r -np -nd -A.pdf user *** password *** http://www.domain.tld/courses/***/download/

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Extract tarball from internet without local saving
```sh
wget -qO - "http://www.tarball.com/tarball.gz" | tar zxvf -

```
### Download all mp3's listed in an html page
```sh
wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off [url of website]

```
### let the cow suggest some commit messages for you
```sh
wget -qO- http://whatthecommit.com/index.txt | cowsay

```
### Download and install the OpenStore on the Ubuntu Phone
```sh
wget https://open.uappexplorer.com/api/download/openstore.openstore-team/openstore.*_*_armhf.click && pkcon install-local allow-untrusted openstore.*_*_armhf.click

```
### Play music from youtube without download
```sh
wget -q -O - `youtube-dl -b -g $url`| ffmpeg -i - -f mp3 -vn -acodec libmp3lame -| mpg123  -

```
### Downlaoad websites to 5 level and browse offline!
```sh
wget -k -r -l 5 http://gentoo-install.com

```
### Google dictionary of word definitions
```sh
wget -qO - "http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q=steering+wheel&sl=en&tl=en&restrict=pr,de&client=te" | sed 's/dict_api\.callbacks.id100.//' | sed 's/,200,null)//'

```
### download newest adminer and rename to it's version accordingly
```sh
wget -N content-disposition http://www.adminer.org/latest.php

```
### View the newest xkcd comic.
```sh
wget `lynx dump http://xkcd.com/|grep png`

```
### Download latest NVIDIA Geforce x64 Windows driver
```sh
wget "us.download.nvidia.com$(wget -qO- "$(wget -qO- "nvidia.com/Download/processFind.aspx?psid=95&pfid=695&osid=19&lid=1&lang=en-us"|awk '/driverResults.aspx/ {print $4}'|cut -d "'" -f2|head -n 1)"|awk '/url=/ {print $2}'|cut -d '=' -f3|cut -d '&' -f1)"

```
### A simple way to securely use passwords on the command line or in scripts
```sh
wget input-file=~/donwloads.txt user="$USER" password="$(gpg2 decrypt ~/.gnupg/passwd/http-auth.gpg 2>/dev/null)"

```
### google chart api
```sh
wget -O chart.png 'http://chart.googleapis.com/chart?chs=250x100&chd=t:60,40&cht=p3&chl=Hello|World'

```
### command line fu roulette
```sh
wget -qO - www.commandlinefu.com/commands/random | grep "<div class=\"command\">" | sed 's/<[^>]*>//g; s/^[ \t]*//; s/&quot;/"/g; s/&lt;/</g; s/&gt;/>/g; s/&amp;/\&/g'

```
### Working random fact generator
```sh
wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;"

```
### download specific files only from a website
```sh
wget -r -P ./dl/ -A jpg,jpeg http://captivates.com

```
### recursively walk down no more than three levels and grab any file with an extension of mp3, mpg, mpeg, or avi
```sh
wget -A mp3,mpg,mpeg,avi -r -l 3 http://www.site.com/

```
### Download all data from Google Ngram Viewer
```sh
wget -qO - http://ngrams.googlelabs.com/datasets | grep -E href='(.+\.zip)' | sed -r "s/.*href='(.+\.zip)'.*/\1/" | uniq | while read line; do ````sh
wget $line`; done

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### Download an Entire website withwget
```sh
wget -m -k -K -E http://url/of/web/site

```
### download the contents of a remote folder in the current local folder
```sh
wget -r -l1 -np -nd http://yoururl.com/yourfolder/

```
### Grab mp3 files from your favorite netcasts, mp3blog, or sites that often have good mp3s
```sh
wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off -i ~/sourceurls.txt

```
### Decrypt MD5
```sh
wget -qO - post-data "data[Row][cripted]=1cb251ec0d568de6a929b520c4aed8d1" http://md5-decrypter.com/  | grep -A1 "Decrypted text"  | tail -n1 | cut -d '"' -f3 | sed 's/>//g; s/<\/b//g'

```
### Get own public IP address
```sh
wget http://ipecho.net/plain -O - -q ; echo

```
### Get your external IP address without curl
```sh
wget -qO- icanhazip.com

```
### speedtest
```sh
wget output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test500.zip

```
### count the appearance of a word or a string  in a given webpage
```sh
wget -q -O- PAGE_URL | grep -o 'WORD_OR_STRING' | wc -w

```
### Stream and save Youtube video
```sh
wget `youtube-dl -g 'http://www.youtube.com/watch?v=-S3O9qi2E2U'` -O - | tee -a parachute-ending.flv | mplayer -cache 8192 -

```
### download with checksum
```sh
wget -qO - http://www.google.com | tee >(md5sum) > /tmp/index.html

```
### Download latest released gitlab docker container
```sh
wget -qO- 'https://github.com'$(curl -s 'https://github.com'$(curl -s https://github.com/sameersbn/docker-gitlab/releases | grep -m 1 -o '<a.*[0-9\.]</a>' | cut -d '"' -f 2) | grep -o '<a.* rel="nofollow">' | grep 'tar.gz' | cut -d '"' -f 2)

```
### Download full FLAC albums from archive.org
```sh
wget -rc -A.flac tries=5 http://archive.org/the/url/of/the/album

```
### Get your external IP address
```sh
wget -qO - http://www.sputnick-area.net/ip;echo

```
### Git autocomplete
```sh
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash; mv git-completion.bash ~/.git-completion.bash; echo "source ~/.git-completion.bash" > ~/.bashrc; source ~/.git-completion.bash

```
### Download an entire website
```sh
wget -mkEpnp example.com

```
### Get all files of particular type (say, mp3) listed on some web page (say, audio.org)
```sh
wget -c -r no-parent -A .mp3 http://audio.org/mp3s/

```
### Download just html of a whole website
```sh
wget mirror random-wait recursive robots=off -U mozilla  -R gif,jpg,pdf reject-regex '((.*)\?(.*))|(.*)' -c [URLGOESHERE]

```
### grep BTC last trading price from BTC-E, but u can change it.. they got em all
```sh
wget -q -O- http://bitinfocharts.com/markets/btc-e/btc-usd.html |grep -o -P 'lastTrade">([0-9]{1,})(.){0,1}[0-9]{0,}' |grep -o -P '(\d)+(\.){0,1}(\d)*' |head -n 1

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### External IP address
```sh
wget http://cmyip.com -O - -o /dev/null | grep -Po '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'

```
### check broken links usingwget as a spider
```sh
wget spider  -owget.log  -e robots=off wait 1 -r -p http://www.example.com

```
### Make mirror of ftp directory
```sh
wget -m ftp-user=root ftp-password=pass -A "*.csv" -nd -P "dirname" ftp://46.46.46.46/../mnt/sd/

```
### Parallel file downloading withwget
```sh
wget -nv http://en.wikipedia.org/wiki/Linux -O- | egrep -o "http://[^[:space:]]*.jpg" | xargs -P 10 -r -n 1wget -nv

```
### download whole website localls withwget mirroring
```sh
wget recursive no-clobber page-requisites html-extension convert-links restrict-file-names=windows domains website.tld http://www.website.tld

```
### Download current stable kernel version from kernel.org
```sh
wget no-check-certificate https://www.kernel.org/$(```sh
wget -qO- no-check-certificate https://www.kernel.org | grep tar | head -n1 | cut -d\" -f2)

```
### Echo the latest commands from commandlinefu on the console
```sh
wget -O - http://www.commandlinefu.com/commands/browse/rss 2>/dev/null | awk '/\s*<title/ {z=match($0, /CDATA\[([^\]]*)\]/, b);print b[1]} /\s*<description/ {c=match($0, /code>(.*)<\/code>/, d);print d[1]"\n"} '

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com

```
### download and run script from trusted webserver
```sh
wget -qO - sometrusted.web.site/tmp/somecommand | sh

```
### Run remote web page, but don't save the results
```sh
wget -q spider http://server/cgi/script

```
### Random (sfw, 1920x1080) wallpaper from wallbase.cc
```sh
wget no-use-server-timestamps  $(curl $(curl http://wallbase.cc/random/23/eqeq/1920x1080/0/100/20 | grep 'wallpaper/' | awk -F'"' '{print $2}' | head -n1) | grep -A4 bigwall | grep img | awk -F'"' '{print $2}'); feh bg-center $(ls -1t | head -n1)

```
### Make ABBA better (requires firefox)
```sh
wget -O - -q http://www.azlyrics.com/lyrics/abba/takeachanceonme.html | sed -e 's/[cC]hance/dump/g' > ~/tdom.htm && firefox ~/tdom.htm

```
### Download all images from a website in a single folder
```sh
wget -nd -r -l 2 -A jpg,jpeg,png,gif http://website-url.com

```
### Get the latest Geek and Poke comic
```sh
wget -q $(lynx dump 'http://geekandpoke.typepad.com/' | grep '\/.a\/' | grep '\-pi' | head -n 1 | awk '{print $2}') -O geekandpoke.jpg

```
### Geo Location of an IP-address
```sh
wget -qO - whatismyipaddress.com/ip/<type ip address> | grep -E "City:|Country:" | sed 's:<tr><th>::'| sed 's</th>::' | sed 's:</td>::' | sed 's:</tr>::' | sed 's:<img*::'

```
### Download all files of a certain type withwget.
```sh
wgetall () {wget -r -l2 -nd -Nc -A.$@ $@ }

```
### my command for downloading  delicious web links,
```sh
wget  -H -r  -nv level=1  -k -p -erobots=off -np -N  exclude-domains=del.icio.us,doubleclick.net exclude-directories=

```
### Define words with google. (busybox version)
```sh
wget -q -U busybox -O- "http://www.google.com/search?ie=UTF8&q=define%3A$1" | tr '<' '\n' | sed -n 's/^li>\(.*\)/\1\n/p'

```
### Download an entire static website to your local machine
```sh
wget recursive  page-requisites convert-links www.moyagraphix.co.za

```
### set desktop background to highest-rated image from Reddit /r/wallpapers
```sh
wget -O - http://www.reddit.com/r/wallpapers.rss | grep -Eo 'http://i.imgur.com[^&]+jpg' | head -1 | xargswget -O background.jpg

```
### Download an entire website
```sh
wget random-wait -r -p -e robots=off -U mozilla http://www.example.com
```
### Usewget to download one page and all it's requisites for offline viewing
```sh
wget -e robots=off -E -H -k -K -p http://<page>
```
