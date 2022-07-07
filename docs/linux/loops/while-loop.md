# while-loop

### Bruteforce two ftp accounts at once

```sh
#!/bin/bash
# Author: wuseman
# Desc: Bruteforce 2 accounts at once

okMSG() {
    echo -e "[\e[1;32m*\e[0m] $*"
}

errMSG() {
    echo -e "[\e[1;31m*\e[0m] $*"
}


1() {
    curl ftp://host:port -u $line &> /dev/null
    [[ $? = "0" ]] &&  okMSG "Cracked password for $line" || errMSG "Bad password for $line"
}

2() {
    curl ftp://host:port -u $line1 &> /dev/null -u $line1 &> /dev/null
    [[ $? = "0" ]] &&  okMSG "Cracked password for $line1" || errMSG "Bad password for $line1"
}

while 
	read line;read line1; 
   	do 
    1;2;sleep 0.1;
done < test
```


### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Convert HAML to HTML on file change
```sh
while true; do filechanged=$(inotifywait -e close_write,moved_to format "%w%f" .); haml $filechanged -q no-escape-attrs > ${filechanged/.haml/.html}; done
```

### Open/Close your co-worker's cd player
```sh
while true; do eject && sleep `expr $RANDOM % 5` && eject -t; done;
```

### geolocalize ip country
```sh
while read line; do pais=$(whois "$line" | grep -E '[Cc]ountry') echo -n "IP=$line Pais=$pais" && echo done <listaip
```

### Simple calculator
```sh
while true; do read i; echo $[$i]; done
```

### progress bar for cp
```sh
while [$((or_sz=$(stat -c %s "$1"))) -gt $((ds_sz=$(stat -c %s "$2")))];do ((pct=(69*$ds_sz)/$or_sz));echo -en "\r[";for ((i=1;i<=pct;i++));do echo -n "=";done;echo -n \>;for ((i=pct;i<=68;i++));do echo -n ".";done;echo -n "] $(((100*$pct)/69))%";done
```

### Displays the number of unread messages on your gmail at the top right corner of your terminal
```sh
while sleep 30; do tput sc;tput cup 0 $(($(tput cols)-15));echo -n " New Emails: $(curl -u username:password silent https://mail.google.com/mail/feed/atom | grep 'fullcount' | grep -o '[0-9]\+')";tput rc; done &
```

### export key-value pairs list as environment variables
```sh
while read line; do export $line; done < <(cat input)
```

### terminal based annoy-a-tron
```sh
while true; do sleep $(($RANDOM/1000)) && beep -f 2000 -l $(($RANDOM/100)) ; done
```

### share single file in LAN via netcat
```sh
while :; do cat file.txt | nc -l 80; done
```

### Processes biglion quantity of sold ebay coupons/bonus codes
```sh
while true; do date; (curl -s -o 1.html http://www.biglion.ru/deals/ebay-80/ &); sleep 5; cat 1.html | grep "&#1082;&#1091;&#1087;&#1086;&#1085;&#1086;&#1074;" | awk -F"<div>" '{print $2}' | awk -F"<span>" '{print $1}'; done
```

### monitor when target host will be up
```sh
while true; do date; ssh <YOUR HOST HERE> "echo" && echo "HOST UP" && break; sleep 60; done
```

### Monitors battery usage (rate of energy charge/discharge)
```sh
while cat energy_now; do sleep 1; done |awk -v F=$(cat energy_full) -v C=60 'NR==1{P=B=$1;p=100/F} {d=$1-P; if(d!=0&&d*D<=0){D=d;n=1;A[0]=B=P}; if(n>0){r=g=($1-B)/n;if(n>C){r=($1-A[n%C])/C}}; A[n++%C]=P=$1; printf "%3d %+09.5f %+09.5f\n", p*$1, p*g, p*r}'
```

### Keep SSH tunnel open (PostgreSQL example)
```sh
while true; do nc -z localhost 3333 >|/dev/null || (ssh -NfL 3333:REMOTE_HOST:5432 USER@REMOTE_HOST); sleep 15; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### a simple alarm
```sh
while true; do while [ `date +%H%M` == "1857" ] ; do sleep 1s; yes | head -n 2000 > /dev/dsp; done; done;
```

### prints line numbers
```sh
while read str; do echo "$((++i)) - $str"; done < infile
```

### Get Informed by your box that you are awesome ;)
```sh
while $i;do `notify-send -t 200 "You are awesome :)"`;sleep 60; done;
```

### Netcat ftp honeypot centos linux (use port 22 for SSH)
```sh
while [ 1 ]; do echo -e "220 ProFTPD 1.3.3c Server [ProFTPD] \nFAILED FTP ATTEMPT  -  PORT 21" | nc -vvv -l 192.168.1.65 21 >> /var/log/honeylog.log 2>> /var/log/honeylog.log; done
```

### CPU sucker
```sh
while :; do :; done
```

### Check a internet connetion is up. If it isn't write a log.
```sh
while true; do /bin/ping -q -c1 -w3 8.8.8.8 2>&1 > /dev/null || echo "8.8.8.8 ping failed at $(date +%d/%m/%y) $(date +%H:%M:%S)" >> /var/log/ping.log; sleep 10; done &
```

### Quickly re-launch your script (python for example)
```sh
while read ; do python <script> ; done
```

### Muestra el crecimiento de un archivo por segundo
```sh
while true; do A=$(stat -c%s FILE); sleep 1; B=$(stat -c%s FILE); echo -en "\r"$(($B-$A))" Bps"; done
```

### watch filesizes (c.f. logfiles, file downloading, etc.)
```sh
while [ 1 ]; do date; ls -l /path/to/dir; sleep 1; done
```

### Monitoring a port connections
```sh
while true ; do  sleep 1 ; clear ;  (netstat -tn | grep -P ':36089\s+\d') ;  done
```

### check the status of 'dd' in progress
```sh
while killall -USR1 dd; do sleep 5; done
```

### Lists the size of certain file in every 10 seconds
```sh
while true ; do du -sk testfile ; sleep 10 ; done
```

### repeat a command every x seconds
```sh
while x=0; do foo ; sleep 1 ; done
```

### Wait for an already launched program to stop before starting a new command.
```sh
while (ps -ef | grep [r]unning_program_name); do sleep 10; done; command_to_execute
```

### hardcode dnsserver, no more rewriting of etc/resolv.conf
```sh
while sudo sed -i -e 's/^\(nameserver\).*$/\1 $dns/' /etc/resolv.conf; do sleep 15; done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create A Continuous Yahoo! News Ticker For The Terminal
```sh
while true;do n="$(curl -s http://news.yahoo.com/rss/|sed 's/</\n/g'|grep "title>"|sed -e '/^\// d' -e 's/title>/ /g' -e '1,3d'|tr '\n' ' ')";for i in $(eval echo {0..${#n}});do echo -ne "\e[s\e[0;0H${n:$i:$COLUMNS}\e[u";sleep .15;done;done &
```

### Muestra el crecimiento de un archivo por segundo
```sh
while true; do A=$(ls -l FILE | awk '{print $5}'); sleep 1; B=$(ls -l FILE | awk '{print $5}'); echo -en "\r"$(($B-$A))" Bps"; done
```

### Quickly make schema changes in Django
```sh
while true ; do scripts/bootstrap.py ; ./manage.py runserver ; done
```

### Generate load on your CPU
```sh
while true; do /bin/true; done
```

### Polls fos network port usage
```sh
while sleep 1; do  date; (netstat -a -n | grep 80) ; done
```

### See smbstatus all the time
```sh
while (( $i != 0 )) { smbstatus; sleep 5; clear }
```

### Blue Matrix
```sh
while :; do integer i=0; COL=$((RANDOM%$(tput cols))); ROW=$((RANDOM%$(tput cols))); while (( i <= COL)) do tput cup $i $ROW; echo "\033[1;34m" $(cat /dev/urandom | head -1 | cut -c1-1) 2>/dev/null; i=$(expr $i + 1); done done
```

### Monitor Applications application that are connected/new connections
```sh
while true; do netstat -p |grep "tcp"|grep color=always "/[a-z]*";sleep 1;done
```

### Periodically loop a command
```sh
while true; do ifconfig eth0 | grep "inet addr:"; sleep 60; done;
```

### Passwords from 9/11 tragedy pager intercepts (Yeah! Plain text! From wikileaks.net)
```sh
while true; do wget -r -l1 no-clobber -A.txt http://911.wikileaks.org/files/index.html; done; cat *.txt | grep pass
```

### Access variables inside a - piped while - loop
```sh
while read line; do  echo $line; done <<< "$var"
```

### Automation click every 4 second on a macro slot bar to world of warcraft for prospecting item
```sh
while true; do sleep 4 ; xdotool click 1 ; done
```

### Short one line while loop that outputs parameterized content from one file to another
```sh
while read col1 col23; do echo $col1; done < three-column.txt > first-column.txt
```

### show space used by postgres
```sh
while (( 1==1 )); do du -c . >> output.log; sleep 2; done; tail -f output.log
```

### Read directory contents recursively
```sh
while read f;do echo "$f";done < <(find .)
```

### Create a Bash command server - You can send it scripts or commands to execute
```sh
while ( nc -l 1025 | bash &> : ) ; do : ; done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Eject the CD Rom Device
```sh
while true; do eject /dev/cdrom && eject -t /dev/cdrom; done
```

### Killing processes with your mouse in an infinite loop
```sh
while true; do xkill -button any; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### climagic's New Year's Countdown clock
```sh
while V=$((`date +%s -d"2010-01-01"`-`date +%s`));do if [ $V == 0 ];then figlet 'Happy New Year!';break;else figlet $V;sleep 1;clear;fi;done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Repeatedly purge orphaned packages on Debian-like Linuxes
```sh
while [ $(deborphan | wc -l) -gt 0 ]; do dpkg purge $(deborphan); done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### make, or run a script, everytime a file in a directory is modified
```sh
while inotifywait -r -e MODIFY dir/; do make; done;
```

### Remove all leading and trailing spaces or tabs from all lines of a text file
```sh
while read l; do echo -e "$l"; done <1.txt >2.txt
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while true; do echo -ne "\e[s\e[0;$((COLUMNS-27))H$(date)\e[u"; sleep 1; done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### HTTP redirect
```sh
while [ 0 ]; do echo -e "HTTP/1.1 302 Found\nLocation: http://www.whatevs.com/index.html" | nc -vvvv -l -p 80; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### let the cow suggest some commit messages for you
```sh
while true; do lynx dump http://whatthecommit.com/ | head -n 1 | cowsay; sleep 2; done
```

### Hear the mice moving
```sh
while true; do beep -l66 -f`head -c2 /dev/input/mice|hexdump -d|awk 'NR==1{print $2%10000}'`; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Mouse Tracking
```sh
while true; do xdotool getmouselocation | sed 's/x:\(.*\) y:\(.*\) screen:.*/\1, \2/' >> ./mouse-tracking; sleep 10; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Take aWebcam Picture When the Mouse Moves
```sh
while true; do sudo cat /dev/input/mouse0|read -n1;streamer -q -o /tmp/cam.jpeg -s 640x480 > /dev/null 2>&1; sleep 10;done
```

### Put a console clock in top right corner
```sh
while true; do tput sc; tput cup 0 $(($(tput cols)-74)); w | grep load; tput rc; sleep 10; done &
```

### Displays the number of processes per state
```sh
while true; do clear;awk '{a[$3]+=1};END{for(x in a){print x,a[x]}}' /proc/[0-9]*/stat; sleep 1; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create a file server, listening in port 7000
```sh
while true; do nc -l 7000 | tar -xvf -; done
```

### Wait for file to stop changing
```sh
while [ $(( $(date +%s) - $(stat -c %Y FILENAME) )) -lt 10 ]; do sleep 1; done; echo DONE
```

### Log the current memory statistics frequently to syslog
```sh
while true; do { $(which logger) -p local4.notice `free -m | grep Mem`; sleep 60; } done &
```

### Output system statistics every 5 seconds with timestamp
```sh
while [ 1 ]; do echo -n "`date +%F_%T`" ; vmstat 1 2 | tail -1 ; sleep 4; done
```

### Console clock
```sh
while [[ 1 ]] ; do clear; banner `date +%H:%M:%S` ; sleep 1; done
```

### To get the CPU temperature continuously on the desktop
```sh
while :; do acpi -t | osd_cat -p bottom ; sleep 1; done &
```

### Poor's man Matrix script
```sh
while (true) ; do pwgen 1 ; done
```

### Pick a random image from a directory (and subdirectories) every thirty minutes and set it as xfce4 wallpaper
```sh
while :; do xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$(find <image-directory> -type f -iregex '.*\.\(bmp\|gif\|jpg\|png\)$' | sort -R | head -1)"; sleep 30m; done
```

### read a file line by line and perform some operation on each line
```sh
while read line; do echo "$(date),$(hostname),$line"; done < somefile.txt
```

### Use acpi and notify-send to report current temperature every five minutes.
```sh
while ping -c 1 127.0.0.1 > /dev/null; do acpi -t -f | while read tem; do notify-send "$tem"; done; sleep 300; done
```

### Blue Matrix
```sh
while [ 1 -lt 2 ]; do i=0; COL=$((RANDOM%$(tput cols)));ROW=$((RANDOM%$(tput cols)));while [ $i -lt $COL ]; do tput cup $i $ROW;echo -e "\033[1;34m" $(cat /dev/urandom | head -1 | cut -c1-1) 2>/dev/null ; i=$(expr $i + 1); done; done
```

### monitor what processes are waiting for IO interrupts
```sh
while true; do date; ps auxf | awk '{if($8=="D") print $0;}'; sleep 1; done
```

### Poor man's unsort (randomize lines)
```sh
while read l; do echo -e "$RANDOM\t$l"; done | sort -n | cut -f 2
```

### Display Spinner while waiting for some process to finish
```sh
while kill -0 0; do timeout 5 bash -c 'spinner=( Ooooo oOooo ooOoo oooOo ooooO oooOo ooOoo oOooo); while true; do for i in ${spinner[@]}; do for _ in seq 0 ${#i}; do echo -en "\b\b"; done; echo -ne "${i}"; sleep 0.2; done; done'; done
```

### keep a log of the active windows
```sh
while true; do (echo -n $(date  +"%F %T"):\ ; xwininfo -id $(xprop -root|grep "ACTIVE_WINDOW("|cut -d\  -f 5) | grep "Window id" | cut -d\" -f 2 ) >> logfile; sleep 60; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Matrix Style
```sh
while true ; do IFS="" read i; echo "$i"; sleep .01; done < <(tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep color "[^ ]")
```

### Labyrinth pattern
```sh
while ( true ) ; do if [ $(expr $RANDOM % 2 ) -eq 0 ] ; then echo -ne "\xE2\x95\xB1" ; else echo -ne "\xE2\x95\xB2" ; fi ; done
```

### Hold off any screensavers/timeouts
```sh
while true; do xdotool mousemove_relative 1 1; xdotool mousemove_relative  -1 -1; sleep $((60 * 4)); done
```

### Connect to FreeWifi hotspot (France) and keep the connection active
```sh
while true ; do wget quiet no-check-certificate post-data 'login=my_account_number&password=my_password&submit=Valider' 'https://wifi.free.fr/Auth' -O '/dev/null' ; sleep 600; done
```

### pop-up messages on a remote computer
```sh
while : ; do if [ ! $(ls -l commander | cut -d ' ' -f5) -eq 0 ]; then notify-send "$(less commander)"; > commander; fi; done
```

### Simple Video Surveillance by email
```sh
while true ; do fswebcam -d /dev/video0 -r 1280x1024 -F 15 - | uuencode $(date +\%Y\%m\%d\%H\%M).jpeg | mail -s "Video surveillance" me@gmail.com ; sleep 300 ; done
```

### fork performance test
```sh
while (true); do date utc; done | uniq -c
```

### Repeat a command until stopped
```sh
while true ; do echo -n "`date`";curl localhost:3000/site/sha;echo -e;sleep 1; done
```

### Watch RX/TX rate of an interface in kb/s
```sh
while [ /bin/true ]; do OLD=$NEW; NEW=`cat /proc/net/dev | grep eth0 | tr -s ' ' | cut -d' ' -f "3 11"`; echo $NEW $OLD | awk '{printf("\rin: % 9.2g\t\tout: % 9.2g", ($1-$3)/1024, ($2-$4)/1024)}'; sleep 1; done
```

### make, or run a script, everytime a file in a directory is modified
```sh
while true; do inotifywait -r -e MODIFY dir/ && make; done;
```

### Continually monitor things
```sh
while (true); do clear; uname -n; echo ""; df -h /; echo ""; tail -5 /var/log/auth.log; echo ""; vmstat 1 5; sleep 15; done
```

### shutdown if wget exit
```sh
while pgrep wget || sudo shutdown -P now; do sleep 1m; done
```

### Check wireless link quality with dialog box
```sh
while [ i != 0 ]; do sleep 1 | dialog clear gauge "Quality: " 0 0 $(cat /proc/net/wireless | grep $WIRELESSINTERFACE | awk '{print $3}' | tr -d "."); done
```

### continuously check size of files or directories
```sh
while true; do du -s <file_or_directory>; sleep <time_interval>; done
```

### Put the machine to sleep after the download(wget) is done
```sh
while [ -n "`pgrep wget`" ]; do sleep 2 ;done; [ -e "/tmp/nosleep"] || echo  mem >/sys/power/state
```

### check the status of 'dd' in progress (OS X)
```sh
while pgrep ^dd; do pkill -INFO dd; sleep 10; done
```

### Continuously show wifi signal strength on a mac
```sh
while i=1; do /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep CtlRSSI; sleep 0.5; done
```

### Use acpi and notify-send to report current temperature every five minutes.
```sh
while notify-send "`acpi -t`"; do sleep 300; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create a continuous digital clock in Linux terminal
```sh
while [ 1 ] ; do echo -en "$(date +%T)\r" ; sleep 1; done
```

### Press a key automatically
```sh
while true; do xvkbd -xsendevent -text "\[$KEY]" && sleep 2; done
```

### Simple addicting bash game.
```sh
while $8;do read n;[ $n = "$l" ]&&c=$(($c+1))||c=0;echo $c;l=$n;done
```

### Automatically download Ubuntu 10.04 when available
```sh
while true; do if wget http://releases.ubuntu.com/10.04/ubuntu-10.04-desktop-i386.iso.torrent; then ktorrent silent ubuntu-10.04-desktop-i386.iso.torrent ; date; break; else sleep 5m; fi; done
```

### beep when a server goes offline
```sh
while true; do [ "$(ping -c1W1w1 server-or-ip.com | awk '/received/ {print $4}')" != 1 ] && beep; sleep 1; done
```

### Run a command when a file is changed
```sh
while :; do n=$(md5 myfile); if [ "$h" != "$n" ]; then h=$n; scp myfile myserver:mydir/myfile; fi; sleep 1; done
```

### put command in a loop to keep trying a connection
```sh
while true; do nc <ip address of server> <port>;done
```

### monitor your CPU core temperatures in real time
```sh
while :; do sensors|grep ^Core|while read x; do printf '% .23s\n' "$x"; done; sleep 1 && clear; done;
```

### Listen to a file
```sh
while true; do cat /usr/src/linux/kernel/signal.c > /dev/dsp; done
```

### Audible warning when a downloading is finished
```sh
while [ "$(ls $filePart)" != "" ]; do sleep 5; done; mpg123 /home/.../warning.mp3
```

### Wait for file to stop changing
```sh
while [ "$(ls -l full-time TargetFile)" != "$a" ] ; do a=$(ls -l full-time TargetFile); sleep 10; done
```

### Short one line while loop that outputs parameterized content from one file to another
```sh
while read l; do echo ${l%% *}; done < three-column-list.txt > only-first-column.txt
```

### Ruby - nslookup against a list of IP`s or FQDN`s
```sh
while read n; do host $n; done < list
```

### Mortality Countdown
```sh
while [ 0 ]; do expr 2365200000 \- `date +%s` \- `date date "YYYY-mm-dd HH:MM:ss" +%s`; sleep 1; clear; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### ssh tunnel with auto reconnect ability
```sh
while [ ! -f /tmp/stop ]; do ssh -o ExitOnForwardFailure=yes -R 2222:localhost:22 target "while nc -zv localhost 2222; do sleep 5; done"; sleep 5;done
```

### Disco lights in the terminal
```sh
while true; do printf "\e[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.\e[0m"; done
```

### Run a command when a file is changed
```sh
while inotifywait -e modify /tmp/myfile; do firefox; done
```

### Console clock
```sh
while sleep 1; do echo -n "\r`date`"; done
```

### find which lines in a file are longer than N characters
```sh
while read i; do [ ${#i} -gt 72 ] && echo "$i"; done < /path/to/file
```

### Make a server's console beep when the network is down
```sh
while :; do ping -W1 -c1 -n 8.8.8.8 > /dev/null || tput bel > /dev/console; sleep 1; done
```

### Watch RX/TX rate of an interface in kb/s
```sh
while cat /proc/net/dev; do sleep 1; done | awk '/eth0/ {o1=n1; o2=n2; n1=$2; n2=$10; printf "in: %9.2f\t\tout: %9.2f\r", (n1-o1)/1024, (n2-o2)/1024}'
```

### To get the CPU temperature continuously on the desktop
```sh
while sleep 1; do acpi -t | osd_cat -p bottom; done &
```

### Print the current time on the whole screen, updated every second
```sh
while(true); do printf "%s\f" $(date +%T); sleep 1; done  | sm -
```

### One command line web server on port 80 using nc (netcat)
```sh
while true ; do nc -l 80  < index.html ; done
```

### Automatically skip bad songs in your MPD playlist.
```sh
while :; do (mpc current | grep -i nickleback && mpc next); sleep 5; done
```

### Emergency Alien Invasion Warning
```sh
while true; do xset dpms force off; sleep 0.3; xset dpms force on; xset s reset; sleep 0.3; done
```

### Play all the music in a folder, on shuffle
```sh
while [[ 1 ]]; do n=( */* ); s=${n[$(($RANDOM%${#n[@]}))]}; echo -e " - $s"; mpg123 -q "$s"; done
```

### Carriage return for reprinting on the same line
```sh
while true; do echo -ne "$(date)\r"; sleep 1; done
```

### force change password for all user
```sh
while IFS=: read u x; do passwd -e "$u"; done < /etc/passwd
```

### kvm disk info
```sh
while read X ; do printf "$X "; virsh dumpxml $X | egrep "source dev|source file"; done< <(virsh list | awk '$1 ~ /^[1-9]/ { print $2 }')
```

### Find processes blocked on IO
```sh
while [ 1 ] ;do ps aux|awk '{if ($8 ~ "D") print }'; sleep 1 ;done
```

### Automatically sync current git project with remote host while editing
```sh
while true; do rsync -vR $(git ls-files | inotifywait -q -e modify -e attrib -e close_write fromfile - format '%w') user@host:dest/dir/; done
```

### repeat a command every x seconds
```sh
while sleep 1; do foo; done
```

### Daemonize nc - Transmit a file like a http server
```sh
while ( nc -l 80 < /file.htm > : ) ; do : ; done &
```

### terminal based annoy-a-tron
```sh
while true; do sleep $(($RANDOM/1000)) && beep -f 2000 -l $(($RANDOM/100)) ; done
```

### Execute ls -lah every one second
```sh
while true; do ls -lah && sleep 1; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Backup all MySQL Databases to individual files
```sh
while read; do mysqldump $REPLY | gzip > "/backup/mysql/$REPLY.sql.gz"; done < <( mysql -e 'show databases' -s skip-column-names )
```

### Continuously listen on a port and respond with a fixed message with netcat (and respond to kill signals)
```sh
while true ; do nc -l -p 4300 -c 'echo hello'; test $? -gt 0 && break; done
```

### Matrix Style
```sh
while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;
```

### Monitor file contents that is being overwritten regularly
```sh
while sleep 1; do clear; cat /tmp/whatever.cue; done
```

### bash screensaver (scrolling ascii art with customizable message)
```sh
while [ 1 ]; do banner 'ze missiles, zey are coming! ' | while IFS="\n" read l; do echo "$l"; sleep 0.01; done; done
```

### Command line email/SMS Bomber
```sh
while true; do echo "message here" | mutt something@something.com ; done
```

### Log a command's votes
```sh
while true; do curl -s http://www.commandlinefu.com/commands/view/3643/log-a-commands-votes | grep 'id="num-votes-' | sed 's;.*id="num-votes-[0-9]*">\([0-9\-]*\)</div>;\1;' >> votes; sleep 10; done
```

### Monitoring file change while a copy
```sh
while true; do ls -all myfile; spleep 1; clear; done
```

### Matrix Style
```sh
while true; do printf "\e[32m%X\e[0m" $((RANDOM%2)); for ((i=0; i<$((RANDOM%128)); i++)) do printf " "; done; done
```

### simple pomodoro
```sh
while true; do     sleep $((40 * 60)); echo "Fuck away for some time"; sleep $((3 * 60)); done &
```

### Monitor system load and print out top offending processes
```sh
while sleep 1; do if [ $(echo "$(cat /proc/loadavg | cut -d' ' -f1) > .8 " | bc) -gt 0 ]; then echo -e "\n\a"$(date)"       \e[5m"$(cat /proc/loadavg)"\e[0m"; ps aux  sort=-%cpu|head -n 5; fi; done
```

### let the cow suggest some commit messages for you
```sh
while true; do curl -s http://whatthecommit.com | perl -p0e '($_)=m{<p>(.+?)</p>}s' | cowsay; sleep 2; done
```

### TCP server on one socket
```sh
while true; do cat "file"; done | nc -v -l 1337
```

### Display an updating clock in sh variants
```sh
while true; do date; sleep 1; done
```

### csv file of ping every minutes
```sh
while true; do (date | tr "\n" ";") && ping -q -c 1 www.google.com|tail -1|cut -d/ -f5 ;sleep 1; done >> uptime.csv
```

### Move Mouse, click there, sleep, and again....
```sh
while true; do xdotool mousemove 1390 500; xdotool click 1; sleep 1; xdotool mousemove 780 800; xdotool click 1; sleep 1; xdotool mousemove 1000 800; xdotool click 1; sleep 1;done
```

### @mail.com by adding the line in list.txt
```sh
while read line; do echo -e "$line@mail.com"; done < list.txt
```

### Show bandwidth use oneliner
```sh
while true; do cat /proc/net/dev; sleep 1; done | awk -v dc="date \"+%T\"" '/eth0/{i = $2 - oi; o = $10 - oo; oi = $2; oo = $10; dc|getline d; close(dc); if (a++) printf "%s %8.2f KiB/s in %8.2f KiB/s out\n", d, i/1024, o/1024}'
```

### Copy with TAR PV and NC
```sh
while true; do nc -l -p 50002 | pv | tar -xf -; done
```

### run a command repeatedly indefinately
```sh
while true ; do killall mc ; done
```

### Set executable permissions only to executable files
```sh
while IFS= read -r -u3 -d $'\0' file; do     file "$file" | egrep -q 'executable|ELF' && chmod +x "$file"; done 3< <(find . -type f -print0)
```

### Iterate through a file where instead of Newline characters, values are separated with a non-white space character.
```sh
while [[ COUNTER -le 10 && IFS=':' ]]; do for LINE in $(cat /tmp/list); do some_command(s) $LINE; done; COUNTER=$((COUNTER+1)); done
```

### Schedule one job after another (running).
```sh
while ps -p $PID; do sleep 1; done; script2
```

### view the 10 most cpu using processes in browser
```sh
while true; do ps aux | sort -rk 3,3 | head -n 11 | cut -c -120 | netcat -l -p 8888 2>&1 >/dev/null; done &
```

### Password server
```sh
while [ 1 ]; do cat /dev/urandom | tr -dc ' -~' | head -c 10 | ncat -l 8080 &> /dev/null; test $? -gt 128 && break; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### send DD a signal to print its progress
```sh
while :;do killall -USR1 dd;sleep 1;done
```

### watch iptables counters
```sh
while true; do iptables -nvL > /tmp/now; diff -U0 /tmp/prev /tmp/now > /tmp/diff; clear; cat /tmp/diff; mv /tmp/now /tmp/prev; slee p 1; done
```

### Pop up a Growl alert if Amtrak wifi doesn't know where to find The Google
```sh
while [ 1 ]; do (ping -c 1 google.com || growlnotify -m 'ur wifiz, it has teh sad'); sleep 10; done
```

### How to run a command on a list of remote servers read from a file
```sh
while read server; do ssh -n user@$server "command"; done < servers.txt
```

### A fun little harmless prank to pull on your friends.
```sh
while true; do sleep $(($RANDOM%50)); timeout 1 speaker-test -f 20000 -t sine 2>/dev/null; done&
```

### uncompress file that is compressed multiple times
```sh
while true; do for bzipfile in $(file *|egrep bzip2|awk '{print $1'}|cut -d':' -f1); do bunzip2 $bzipfile; done; done
```

### One liner to check out CLOSE_WAIT and TIME_WAIT connection every five seconds while debugging network apps
```sh
while true; do netstat -a|grep WAIT|wc -l; sleep 5; done
```

### Measures download speed on eth0
```sh
while true; do X=$Y; sleep 1; Y=$(ifconfig eth0|grep RX\ bytes|awk '{ print $2 }'|cut -d : -f 2); echo "$(( Y-X )) bps"; done
```

### Speak the top 6 lines of your twitter timeline every 5 minutes.....
```sh
while [ 1 ]; do curl -s -u username:password  http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' | head -n 6 |festival tts; sleep 300;done
```

### Find processes stuck in dreaded
```sh
while true; do date; ps auxf | awk '{if($8=="D") print $0;}'; sleep 1; done
```

### Monitor ElasticSearch cluster health - Useful for keeping an eye on ES when rebalancing takes place
```sh
while true; do clear; curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'; sleep 1; done
```

### Displays mpd playing status in the terminal first raw
```sh
while sleep 1; do (mpc status;mpc currentsong)|awk 'BEGIN{FS=": "}/^Artist:/{r=r""$2};/^Title:/{r=r" - "$2};/^time:/{r=$2" "r};/^state: play/{f=1}END{if(f==1){print r}}'|echo -ne "\e[s\e[0;0H\e[K\e[0;44m\e[1;33m$(cat -)\e[0m\e[u";done &
```

### Wait for Web service to spin up, aka alert me when the server stops returning a 503
```sh
while true; do curl -vsL -o /dev/null example.com 2>&1 | grep 503 > /dev/null || echo "OK: server is up."; sleep 8; done
```

### Generate random sensible passwords, and copy them to the clipboard
```sh
while true; do curl -s http://sensiblepassword.com/?harder=1 | tail -n 15 | head -n 1 | sed 's;<br/>;;' | cut -c 5- | cb; sleep 1; done
```

### Monitor a file's size
```sh
while [ 1 ]; do du /var/log/messages;sleep 60; done
```

### Continously show httpd's error log
```sh
while [ 1 ]; do tail /var/log/httpd/error_log; sleep 2; clear; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
while [ true ]; do head -n 100 /dev/urandom; sleep .1; done | hexdump -C | grep "ca fe"
```

### Powershell Curl Logs Signal Strength of Cable Modem
```sh
while(1){while((date -f ss)%10-gt0){sleep -m 300} echo "$(date -u %s) $((curl 192.168.100.1/cmSignalData.htm).parsedhtml.body.childnodes.item(1).firstchild.firstchild.childnodes.item(5).outertext|%{$_ -replace '\D+\n',''})">>modemlog.txt;sleep 1;echo .}
```

### Poor man's unsort (randomize lines)
```sh
while read l; do echo $RANDOM "$l"; done | sort -n | cut -d " " -f 2-
```

### Wait the end of prog1 and launch prog2
```sh
while pkill -0 prog1; do sleep 10; done; prog2
```

### Check whether laptop is running on battery or cable
```sh
while true;do clear;echo -n Current\ `grep voltage /proc/acpi/battery/BAT0/state | awk '{print $2" "$3" "$4}'`;for i in `seq 1 5`;do sleep 1;echo -n .;done;done
```

### pc is ghosted?!
```sh
while true; do locate *.wav | sed "{${RANDOM:1:2}q;d;}" | xargs aplay; sleep 10; done &> /dev/null &
```

### Wait for Web service to spin up, aka alert me when the server stops returning a 503
```sh
while curl -dsL example.com 2>&1 | grep 503;do sleep 8;done;echo server up
```

### checks if host /service is up on a host that doesn't respond to ping
```sh
while true; do clear; nmap ${hostname} -PN -p ${hostport}; sleep 5; done
```

### Watch RX/TX rate of an interface in kb/s
```sh
while :; do OLD=$NEW; NEW=`cat /proc/net/dev | grep eth0 | tr -s ' ' | cut -d' ' -f "3 11"`; echo $NEW $OLD | awk '{printf("\rin: % 9.2g\t\tout: % 9.2g", ($1-$3)/1024, ($2-$4)/1024)}'; sleep 1; done
```

### Show a clock in the upper right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-11));echo -e "\e[31m`date +%T`\e[39m";tput rc;done &
```

### A way to run commands on a remote computer to be displayed on the remote computer
```sh
while :;do if [ ! $(ls -l commander |cut -d ' ' -f5) -eq 0 ]; then echo "Ran command: $(less commander) @ $(date +%D) $(date +%r)" >> comm_log;"$(less commander)";> commander;fi;done
```

### Visual system load display
```sh
while [ true ]; do cat /proc/loadavg  | perl -ne 'm/(^[^ ]+)/; $L = $1; print "*" x $L; print " $L\n";' ; sleep 6; done
```

### Auto-kill auto-spawned process
```sh
while [ ! -z $(ps -A | grep -m1 kdiff3 | awk '{print $1}') ]; do kill -9 $(ps -A | grep -m1 kdiff3 | awk '{print $1}'); sleep 1; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create A Continuous Yahoo! News Ticker For The Terminal
```sh
while true;do n="$(curl -s http://news.yahoo.com/rss/|sed 's/</\n/g'|grep "title>"|sed -e '/^\// d' -e 's/title>/ /g' -e '1,3d'|tr '\n' ' ')";for i in $(eval echo {0..${#n}});do echo -ne "\e[s\e[0;0H${n:$i:$COLUMNS}\e[u";sleep .15;done;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Killing processes with your mouse in an infinite loop
```sh
while true; do xkill -button any; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### climagic's New Year's Countdown clock
```sh
while V=$((`date +%s -d"2010-01-01"`-`date +%s`));do if [ $V == 0 ];then figlet 'Happy New Year!';break;else figlet $V;sleep 1;clear;fi;done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Repeatedly purge orphaned packages on Debian-like Linuxes
```sh
while [ $(deborphan | wc -l) -gt 0 ]; do dpkg purge $(deborphan); done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### make, or run a script, everytime a file in a directory is modified
```sh
while inotifywait -r -e MODIFY dir/; do make; done;
```

### Remove all leading and trailing spaces or tabs from all lines of a text file
```sh
while read l; do echo -e "$l"; done <1.txt >2.txt
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Put a console clock in top right corner
```sh
while true; do echo -ne "\e[s\e[0;$((COLUMNS-27))H$(date)\e[u"; sleep 1; done &
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### HTTP redirect
```sh
while [ 0 ]; do echo -e "HTTP/1.1 302 Found\nLocation: http://www.whatevs.com/index.html" | nc -vvvv -l -p 80; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### let the cow suggest some commit messages for you
```sh
while true; do lynx dump http://whatthecommit.com/ | head -n 1 | cowsay; sleep 2; done
```

### Hear the mice moving
```sh
while true; do beep -l66 -f`head -c2 /dev/input/mice|hexdump -d|awk 'NR==1{print $2%10000}'`; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Mouse Tracking
```sh
while true; do xdotool getmouselocation | sed 's/x:\(.*\) y:\(.*\) screen:.*/\1, \2/' >> ./mouse-tracking; sleep 10; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Take aWebcam Picture When the Mouse Moves
```sh
while true; do sudo cat /dev/input/mouse0|read -n1;streamer -q -o /tmp/cam.jpeg -s 640x480 > /dev/null 2>&1; sleep 10;done
```

### Put a console clock in top right corner
```sh
while true; do tput sc; tput cup 0 $(($(tput cols)-74)); w | grep load; tput rc; sleep 10; done &
```

### Displays the number of processes per state
```sh
while true; do clear;awk '{a[$3]+=1};END{for(x in a){print x,a[x]}}' /proc/[0-9]*/stat; sleep 1; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create a file server, listening in port 7000
```sh
while true; do nc -l 7000 | tar -xvf -; done
```

### Wait for file to stop changing
```sh
while [ $(( $(date +%s) - $(stat -c %Y FILENAME) )) -lt 10 ]; do sleep 1; done; echo DONE
```

### Log the current memory statistics frequently to syslog
```sh
while true; do { $(which logger) -p local4.notice `free -m | grep Mem`; sleep 60; } done &
```

### Output system statistics every 5 seconds with timestamp
```sh
while [ 1 ]; do echo -n "`date +%F_%T`" ; vmstat 1 2 | tail -1 ; sleep 4; done
```

### Console clock
```sh
while [[ 1 ]] ; do clear; banner `date +%H:%M:%S` ; sleep 1; done
```

### To get the CPU temperature continuously on the desktop
```sh
while :; do acpi -t | osd_cat -p bottom ; sleep 1; done &
```

### Poor's man Matrix script
```sh
while (true) ; do pwgen 1 ; done
```

### Pick a random image from a directory (and subdirectories) every thirty minutes and set it as xfce4 wallpaper
```sh
while :; do xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/image-path -s "$(find <image-directory> -type f -iregex '.*\.\(bmp\|gif\|jpg\|png\)$' | sort -R | head -1)"; sleep 30m; done
```

### read a file line by line and perform some operation on each line
```sh
while read line; do echo "$(date),$(hostname),$line"; done < somefile.txt
```

### Use acpi and notify-send to report current temperature every five minutes.
```sh
while ping -c 1 127.0.0.1 > /dev/null; do acpi -t -f | while read tem; do notify-send "$tem"; done; sleep 300; done
```

### Blue Matrix
```sh
while [ 1 -lt 2 ]; do i=0; COL=$((RANDOM%$(tput cols)));ROW=$((RANDOM%$(tput cols)));while [ $i -lt $COL ]; do tput cup $i $ROW;echo -e "\033[1;34m" $(cat /dev/urandom | head -1 | cut -c1-1) 2>/dev/null ; i=$(expr $i + 1); done; done
```

### monitor what processes are waiting for IO interrupts
```sh
while true; do date; ps auxf | awk '{if($8=="D") print $0;}'; sleep 1; done
```

### Poor man's unsort (randomize lines)
```sh
while read l; do echo -e "$RANDOM\t$l"; done | sort -n | cut -f 2
```

### Display Spinner while waiting for some process to finish
```sh
while kill -0 0; do timeout 5 bash -c 'spinner=( Ooooo oOooo ooOoo oooOo ooooO oooOo ooOoo oOooo); while true; do for i in ${spinner[@]}; do for _ in seq 0 ${#i}; do echo -en "\b\b"; done; echo -ne "${i}"; sleep 0.2; done; done'; done
```

### keep a log of the active windows
```sh
while true; do (echo -n $(date  +"%F %T"):\ ; xwininfo -id $(xprop -root|grep "ACTIVE_WINDOW("|cut -d\  -f 5) | grep "Window id" | cut -d\" -f 2 ) >> logfile; sleep 60; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Matrix Style
```sh
while true ; do IFS="" read i; echo "$i"; sleep .01; done < <(tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep color "[^ ]")
```

### Labyrinth pattern
```sh
while ( true ) ; do if [ $(expr $RANDOM % 2 ) -eq 0 ] ; then echo -ne "\xE2\x95\xB1" ; else echo -ne "\xE2\x95\xB2" ; fi ; done
```

### Hold off any screensavers/timeouts
```sh
while true; do xdotool mousemove_relative 1 1; xdotool mousemove_relative  -1 -1; sleep $((60 * 4)); done
```

### Connect to FreeWifi hotspot (France) and keep the connection active
```sh
while true ; do wget quiet no-check-certificate post-data 'login=my_account_number&password=my_password&submit=Valider' 'https://wifi.free.fr/Auth' -O '/dev/null' ; sleep 600; done
```

### pop-up messages on a remote computer
```sh
while : ; do if [ ! $(ls -l commander | cut -d ' ' -f5) -eq 0 ]; then notify-send "$(less commander)"; > commander; fi; done
```

### Simple Video Surveillance by email
```sh
while true ; do fswebcam -d /dev/video0 -r 1280x1024 -F 15 - | uuencode $(date +\%Y\%m\%d\%H\%M).jpeg | mail -s "Video surveillance" me@gmail.com ; sleep 300 ; done
```

### fork performance test
```sh
while (true); do date utc; done | uniq -c
```

### Repeat a command until stopped
```sh
while true ; do echo -n "`date`";curl localhost:3000/site/sha;echo -e;sleep 1; done
```

### Watch RX/TX rate of an interface in kb/s
```sh
while [ /bin/true ]; do OLD=$NEW; NEW=`cat /proc/net/dev | grep eth0 | tr -s ' ' | cut -d' ' -f "3 11"`; echo $NEW $OLD | awk '{printf("\rin: % 9.2g\t\tout: % 9.2g", ($1-$3)/1024, ($2-$4)/1024)}'; sleep 1; done
```

### make, or run a script, everytime a file in a directory is modified
```sh
while true; do inotifywait -r -e MODIFY dir/ && make; done;
```

### Continually monitor things
```sh
while (true); do clear; uname -n; echo ""; df -h /; echo ""; tail -5 /var/log/auth.log; echo ""; vmstat 1 5; sleep 15; done
```

### shutdown if wget exit
```sh
while pgrep wget || sudo shutdown -P now; do sleep 1m; done
```

### Check wireless link quality with dialog box
```sh
while [ i != 0 ]; do sleep 1 | dialog clear gauge "Quality: " 0 0 $(cat /proc/net/wireless | grep $WIRELESSINTERFACE | awk '{print $3}' | tr -d "."); done
```

### continuously check size of files or directories
```sh
while true; do du -s <file_or_directory>; sleep <time_interval>; done
```

### Put the machine to sleep after the download(wget) is done
```sh
while [ -n "`pgrep wget`" ]; do sleep 2 ;done; [ -e "/tmp/nosleep"] || echo  mem >/sys/power/state
```

### check the status of 'dd' in progress (OS X)
```sh
while pgrep ^dd; do pkill -INFO dd; sleep 10; done
```

### Continuously show wifi signal strength on a mac
```sh
while i=1; do /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep CtlRSSI; sleep 0.5; done
```

### Use acpi and notify-send to report current temperature every five minutes.
```sh
while notify-send "`acpi -t`"; do sleep 300; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Create a continuous digital clock in Linux terminal
```sh
while [ 1 ] ; do echo -en "$(date +%T)\r" ; sleep 1; done
```

### Press a key automatically
```sh
while true; do xvkbd -xsendevent -text "\[$KEY]" && sleep 2; done
```

### Simple addicting bash game.
```sh
while $8;do read n;[ $n = "$l" ]&&c=$(($c+1))||c=0;echo $c;l=$n;done
```

### Automatically download Ubuntu 10.04 when available
```sh
while true; do if wget http://releases.ubuntu.com/10.04/ubuntu-10.04-desktop-i386.iso.torrent; then ktorrent silent ubuntu-10.04-desktop-i386.iso.torrent ; date; break; else sleep 5m; fi; done
```

### beep when a server goes offline
```sh
while true; do [ "$(ping -c1W1w1 server-or-ip.com | awk '/received/ {print $4}')" != 1 ] && beep; sleep 1; done
```

### Run a command when a file is changed
```sh
while :; do n=$(md5 myfile); if [ "$h" != "$n" ]; then h=$n; scp myfile myserver:mydir/myfile; fi; sleep 1; done
```

### put command in a loop to keep trying a connection
```sh
while true; do nc <ip address of server> <port>;done
```

### monitor your CPU core temperatures in real time
```sh
while :; do sensors|grep ^Core|while read x; do printf '% .23s\n' "$x"; done; sleep 1 && clear; done;
```

### Listen to a file
```sh
while true; do cat /usr/src/linux/kernel/signal.c > /dev/dsp; done
```

### Audible warning when a downloading is finished
```sh
while [ "$(ls $filePart)" != "" ]; do sleep 5; done; mpg123 /home/.../warning.mp3
```

### Wait for file to stop changing
```sh
while [ "$(ls -l full-time TargetFile)" != "$a" ] ; do a=$(ls -l full-time TargetFile); sleep 10; done
```

### Short one line while loop that outputs parameterized content from one file to another
```sh
while read l; do echo ${l%% *}; done < three-column-list.txt > only-first-column.txt
```

### Ruby - nslookup against a list of IP`s or FQDN`s
```sh
while read n; do host $n; done < list
```

### Mortality Countdown
```sh
while [ 0 ]; do expr 2365200000 \- `date +%s` \- `date date "YYYY-mm-dd HH:MM:ss" +%s`; sleep 1; clear; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### ssh tunnel with auto reconnect ability
```sh
while [ ! -f /tmp/stop ]; do ssh -o ExitOnForwardFailure=yes -R 2222:localhost:22 target "while nc -zv localhost 2222; do sleep 5; done"; sleep 5;done
```

### Disco lights in the terminal
```sh
while true; do printf "\e[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.\e[0m"; done
```

### Run a command when a file is changed
```sh
while inotifywait -e modify /tmp/myfile; do firefox; done
```

### Console clock
```sh
while sleep 1; do echo -n "\r`date`"; done
```

### find which lines in a file are longer than N characters
```sh
while read i; do [ ${#i} -gt 72 ] && echo "$i"; done < /path/to/file
```

### Make a server's console beep when the network is down
```sh
while :; do ping -W1 -c1 -n 8.8.8.8 > /dev/null || tput bel > /dev/console; sleep 1; done
```

### Watch RX/TX rate of an interface in kb/s
```sh
while cat /proc/net/dev; do sleep 1; done | awk '/eth0/ {o1=n1; o2=n2; n1=$2; n2=$10; printf "in: %9.2f\t\tout: %9.2f\r", (n1-o1)/1024, (n2-o2)/1024}'
```

### To get the CPU temperature continuously on the desktop
```sh
while sleep 1; do acpi -t | osd_cat -p bottom; done &
```

### Print the current time on the whole screen, updated every second
```sh
while(true); do printf "%s\f" $(date +%T); sleep 1; done  | sm -
```

### One command line web server on port 80 using nc (netcat)
```sh
while true ; do nc -l 80  < index.html ; done
```

### Automatically skip bad songs in your MPD playlist.
```sh
while :; do (mpc current | grep -i nickleback && mpc next); sleep 5; done
```

### Emergency Alien Invasion Warning
```sh
while true; do xset dpms force off; sleep 0.3; xset dpms force on; xset s reset; sleep 0.3; done
```

### Play all the music in a folder, on shuffle
```sh
while [[ 1 ]]; do n=( */* ); s=${n[$(($RANDOM%${#n[@]}))]}; echo -e " - $s"; mpg123 -q "$s"; done
```

### Carriage return for reprinting on the same line
```sh
while true; do echo -ne "$(date)\r"; sleep 1; done
```

### force change password for all user
```sh
while IFS=: read u x; do passwd -e "$u"; done < /etc/passwd
```

### kvm disk info
```sh
while read X ; do printf "$X "; virsh dumpxml $X | egrep "source dev|source file"; done< <(virsh list | awk '$1 ~ /^[1-9]/ { print $2 }')
```

### Find processes blocked on IO
```sh
while [ 1 ] ;do ps aux|awk '{if ($8 ~ "D") print }'; sleep 1 ;done
```

### Automatically sync current git project with remote host while editing
```sh
while true; do rsync -vR $(git ls-files | inotifywait -q -e modify -e attrib -e close_write fromfile - format '%w') user@host:dest/dir/; done
```

### repeat a command every x seconds
```sh
while sleep 1; do foo; done
```

### Daemonize nc - Transmit a file like a http server
```sh
while ( nc -l 80 < /file.htm > : ) ; do : ; done &
```

### terminal based annoy-a-tron
```sh
while true; do sleep $(($RANDOM/1000)) && beep -f 2000 -l $(($RANDOM/100)) ; done
```

### Execute ls -lah every one second
```sh
while true; do ls -lah && sleep 1; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### Backup all MySQL Databases to individual files
```sh
while read; do mysqldump $REPLY | gzip > "/backup/mysql/$REPLY.sql.gz"; done < <( mysql -e 'show databases' -s skip-column-names )
```

### Continuously listen on a port and respond with a fixed message with netcat (and respond to kill signals)
```sh
while true ; do nc -l -p 4300 -c 'echo hello'; test $? -gt 0 && break; done
```

### Matrix Style
```sh
while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;
```

### Monitor file contents that is being overwritten regularly
```sh
while sleep 1; do clear; cat /tmp/whatever.cue; done
```

### bash screensaver (scrolling ascii art with customizable message)
```sh
while [ 1 ]; do banner 'ze missiles, zey are coming! ' | while IFS="\n" read l; do echo "$l"; sleep 0.01; done; done
```

### Command line email/SMS Bomber
```sh
while true; do echo "message here" | mutt something@something.com ; done
```

### Log a command's votes
```sh
while true; do curl -s http://www.commandlinefu.com/commands/view/3643/log-a-commands-votes | grep 'id="num-votes-' | sed 's;.*id="num-votes-[0-9]*">\([0-9\-]*\)</div>;\1;' >> votes; sleep 10; done
```

### Monitoring file change while a copy
```sh
while true; do ls -all myfile; spleep 1; clear; done
```

### Matrix Style
```sh
while true; do printf "\e[32m%X\e[0m" $((RANDOM%2)); for ((i=0; i<$((RANDOM%128)); i++)) do printf " "; done; done
```

### simple pomodoro
```sh
while true; do     sleep $((40 * 60)); echo "Fuck away for some time"; sleep $((3 * 60)); done &
```

### Monitor system load and print out top offending processes
```sh
while sleep 1; do if [ $(echo "$(cat /proc/loadavg | cut -d' ' -f1) > .8 " | bc) -gt 0 ]; then echo -e "\n\a"$(date)"       \e[5m"$(cat /proc/loadavg)"\e[0m"; ps aux  sort=-%cpu|head -n 5; fi; done
```

### let the cow suggest some commit messages for you
```sh
while true; do curl -s http://whatthecommit.com | perl -p0e '($_)=m{<p>(.+?)</p>}s' | cowsay; sleep 2; done
```

### TCP server on one socket
```sh
while true; do cat "file"; done | nc -v -l 1337
```

### Display an updating clock in sh variants
```sh
while true; do date; sleep 1; done
```

### csv file of ping every minutes
```sh
while true; do (date | tr "\n" ";") && ping -q -c 1 www.google.com|tail -1|cut -d/ -f5 ;sleep 1; done >> uptime.csv
```

### Move Mouse, click there, sleep, and again....
```sh
while true; do xdotool mousemove 1390 500; xdotool click 1; sleep 1; xdotool mousemove 780 800; xdotool click 1; sleep 1; xdotool mousemove 1000 800; xdotool click 1; sleep 1;done
```

### @mail.com by adding the line in list.txt
```sh
while read line; do echo -e "$line@mail.com"; done < list.txt
```

### Show bandwidth use oneliner
```sh
while true; do cat /proc/net/dev; sleep 1; done | awk -v dc="date \"+%T\"" '/eth0/{i = $2 - oi; o = $10 - oo; oi = $2; oo = $10; dc|getline d; close(dc); if (a++) printf "%s %8.2f KiB/s in %8.2f KiB/s out\n", d, i/1024, o/1024}'
```

### Copy with TAR PV and NC
```sh
while true; do nc -l -p 50002 | pv | tar -xf -; done
```

### run a command repeatedly indefinately
```sh
while true ; do killall mc ; done
```

### Set executable permissions only to executable files
```sh
while IFS= read -r -u3 -d $'\0' file; do     file "$file" | egrep -q 'executable|ELF' && chmod +x "$file"; done 3< <(find . -type f -print0)
```

### Iterate through a file where instead of Newline characters, values are separated with a non-white space character.
```sh
while [[ COUNTER -le 10 && IFS=':' ]]; do for LINE in $(cat /tmp/list); do some_command(s) $LINE; done; COUNTER=$((COUNTER+1)); done
```

### Schedule one job after another (running).
```sh
while ps -p $PID; do sleep 1; done; script2
```

### view the 10 most cpu using processes in browser
```sh
while true; do ps aux | sort -rk 3,3 | head -n 11 | cut -c -120 | netcat -l -p 8888 2>&1 >/dev/null; done &
```

### Password server
```sh
while [ 1 ]; do cat /dev/urandom | tr -dc ' -~' | head -c 10 | ncat -l 8080 &> /dev/null; test $? -gt 128 && break; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### send DD a signal to print its progress
```sh
while :;do killall -USR1 dd;sleep 1;done
```

### watch iptables counters
```sh
while true; do iptables -nvL > /tmp/now; diff -U0 /tmp/prev /tmp/now > /tmp/diff; clear; cat /tmp/diff; mv /tmp/now /tmp/prev; slee p 1; done
```

### Pop up a Growl alert if Amtrak wifi doesn't know where to find The Google
```sh
while [ 1 ]; do (ping -c 1 google.com || growlnotify -m 'ur wifiz, it has teh sad'); sleep 10; done
```

### How to run a command on a list of remote servers read from a file
```sh
while read server; do ssh -n user@$server "command"; done < servers.txt
```

### A fun little harmless prank to pull on your friends.
```sh
while true; do sleep $(($RANDOM%50)); timeout 1 speaker-test -f 20000 -t sine 2>/dev/null; done&
```

### uncompress file that is compressed multiple times
```sh
while true; do for bzipfile in $(file *|egrep bzip2|awk '{print $1'}|cut -d':' -f1); do bunzip2 $bzipfile; done; done
```

### One liner to check out CLOSE_WAIT and TIME_WAIT connection every five seconds while debugging network apps
```sh
while true; do netstat -a|grep WAIT|wc -l; sleep 5; done
```

### Measures download speed on eth0
```sh
while true; do X=$Y; sleep 1; Y=$(ifconfig eth0|grep RX\ bytes|awk '{ print $2 }'|cut -d : -f 2); echo "$(( Y-X )) bps"; done
```

### Speak the top 6 lines of your twitter timeline every 5 minutes.....
```sh
while [ 1 ]; do curl -s -u username:password  http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' | head -n 6 |festival tts; sleep 300;done
```

### Find processes stuck in dreaded
```sh
while true; do date; ps auxf | awk '{if($8=="D") print $0;}'; sleep 1; done
```

### Monitor ElasticSearch cluster health - Useful for keeping an eye on ES when rebalancing takes place
```sh
while true; do clear; curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'; sleep 1; done
```

### Displays mpd playing status in the terminal first raw
```sh
while sleep 1; do (mpc status;mpc currentsong)|awk 'BEGIN{FS=": "}/^Artist:/{r=r""$2};/^Title:/{r=r" - "$2};/^time:/{r=$2" "r};/^state: play/{f=1}END{if(f==1){print r}}'|echo -ne "\e[s\e[0;0H\e[K\e[0;44m\e[1;33m$(cat -)\e[0m\e[u";done &
```

### Wait for Web service to spin up, aka alert me when the server stops returning a 503
```sh
while true; do curl -vsL -o /dev/null example.com 2>&1 | grep 503 > /dev/null || echo "OK: server is up."; sleep 8; done
```

### Generate random sensible passwords, and copy them to the clipboard
```sh
while true; do curl -s http://sensiblepassword.com/?harder=1 | tail -n 15 | head -n 1 | sed 's;<br/>;;' | cut -c 5- | cb; sleep 1; done
```

### Monitor a file's size
```sh
while [ 1 ]; do du /var/log/messages;sleep 60; done
```

### Continously show httpd's error log
```sh
while [ 1 ]; do tail /var/log/httpd/error_log; sleep 2; clear; done
```

### Put a console clock in top right corner
```sh
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
while [ true ]; do head -n 100 /dev/urandom; sleep .1; done | hexdump -C | grep "ca fe"
```
