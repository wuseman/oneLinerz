# lsof

### Show 10 Largest Open Files
```sh
lsof / | awk '{ if($7 > 1048576) print $7/1048576 "MB" " " $9 " " $1 }' | sort -n -u | tail
```
### Kill a process running on port 8080
```sh
lsof -i :8080 | awk '{l=$2} END {print l}' | xargs kill
```
### Kill a process running on port 8080
```sh
lsof -i :8080 | awk 'NR > 1 {print $2}' | xargs --no-run-if-empty kill
```
### Kill a process running on port 8080
```sh
lsof -i :8080 | awk '{print $2}' | tail -n 1 | xargs kill
```
### dynamically list open files for a given process name
```sh
lsof -i -n -P | grep -e "$(ps aux | grep node | grep -v grep | awk -F' ' '{print $2}' | xargs | awk -F' ' '{str = $1; for(i = 2; i < NF; i++) {str = str "\\|" $i} print str}')"
```

### Two command output
```sh
lsof -i :80 | tee /dev/stderr | wc -l
```

### This will kill all ssh connections from a given host it does give some errors but it does work
```sh
lsof -i tcp:22 | grep 192.168.10.10 | awk "{print $2}" |xargs kill
```

### For finding out if something is listening on a port and if so what the daemon is.
```sh
lsof -i :[port number]
```

### Keep a copy of the raw Youtube FLV,MP4,etc stored in /tmp/
```sh
lsof -n -P|grep FlashXX|awk '{ print "/proc/" $2 "/fd/" substr($4, 1, length($4)-1) }'| \
	while read f;do 
		newname=$(exiftool -FileModifyDate -FileType -t -d %Y%m%d%H%M%S $f|cut -f2|tr '\n' '.'|sed 's/\.$//');echo "$f -> $newname";cp $f ~/Vids/$newname;
	done
```

### The program listening on port 8080 through IPv6
```sh
lsof -Pnl +M -i6 | grep 8080
```

### pid list by httpd listen port
```sh
lsof | awk '/*:https?/{print $2}' | sort -u
```

### View open file descriptors for a process.
```sh
lsof -p <process_id> | wc -l
```

### check open ports (both ipv4 and ipv6)
```sh
lsof -i
```

### &#38283;&#12356;&#12390;&#12427;&#12509;&#12540;&#12488;&#12434;&#35519;&#12409;&#12427;
```sh
lsof -i -n -P
```

### check open ports (both ipv4 and ipv6)
```sh
lsof -Pi | grep LISTEN
```

### Show the processes that use old libs and need a restart
```sh
lsof | grep 'DEL.*lib' | cut -f 1 -d ' ' | sort -u
```

### which program is this port belongs to ?
```sh
lsof -i tcp:80
```

### which process has a port open
```sh
lsof -i :80
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment.
```sh
lsof -P -i -n | cut -f 1 -d " "| uniq | tail -n +2
```

### List open IPv4 connections
```sh
lsof -Pnl +M -i4
```

### List files opened by a PID
```sh
lsof -p 15857
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List .log files open by a pid
```sh
lsof -p 1234 | grep -E "\.log$" | awk '{print $NF}'
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Lists all listening ports together with the PID of the associated process
```sh
lsof -Pan -i tcp -i udp
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### View details of network activity, malicious or otherwise within a port range.
```sh
lsof -i :555-7000
```

### list processes with established tcp connections (without netstat)
```sh
lsof -i -n | grep ESTABLISHED
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### determine if tcp port is open
```sh
lsof -i :22
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List all files opened by a particular command
```sh
lsof -c dhcpd
```

### Find size in kilobyte of files that are deleted but still in use and therefore consumes diskspace
```sh
lsof -ns | grep REG | grep deleted | awk '{s+=$7/1024} END {print s}'
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List processes playing sound
```sh
lsof | grep pcm
```

### Show top running processes by the number of open filehandles they have
```sh
lsof | awk '{print $1}' | sort | uniq -c | sort -rn | head
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Show established network connections
```sh
lsof -i | grep -i estab
```



### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### show all established tcp connections on os x
```sh
lsof -iTCP -sTCP:ESTABLISHED | awk '{print $1}' | sort -u
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### check open ports (both ipv4 and ipv6)
```sh
lsof -Pn | grep LISTEN
```

### Monitoring file handles used by a particular process
```sh
lsof -c <process name> -r
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### kill all processes using a directory/file/etc
```sh
lsof|grep /somemount/| awk '{print $2}'|xargs kill
```

### which process is accessing the CDROM
```sh
lsof -n | grep /media/cdrom
```

### Show what a given user has open using lsof
```sh
lsof -u www-data
```

### List pr. command in megabytes sum of deleted files that are still in use and therefore consumes diskspace
```sh
lsof -ns | grep REG | grep deleted | awk '{a[$1]+=$7;}END{for(i in a){printf("%s %.2f MB\n", i, a[i]/1048576);}}'
```

### List all open ports and their owning executables
```sh
lsof -i -P | grep -i "listen"
```

### check open ports
```sh
lsof -Pni4 | grep LISTEN
```

### find listening ports by pid
```sh
lsof -nP +p 24073 | grep -i listen | awk '{print $1,$2,$7,$8,$9}'
```

### List all active access_logs for currently running Apache or Lighttpd process
```sh
lsof -p $(netstat -ltpn|awk '$4 ~ /:80$/ {print substr($7,1,index($7,"/")-1)}')| awk '$9 ~ /access.log$/ {print $9| "sort -u"}'
```

### give me back my sound card
```sh
lsof /dev/snd/pcm*p /dev/dsp | awk ' { print $2 }' | xargs kill
```

### The program listening on port 8080 through IPv6
```sh
lsof -Pnl +M -i6:8080
```

### Keep track of diff progress
```sh
lsof -c diff -o -r1 | grep $file
```

### find out which directories in /home have the most files currently open
```sh
lsof |awk ' {if ( $0 ~ /home/) print substr($0, index($0,"/home") ) }'|cut -d / -f 1-4|sort|uniq -c|sort -bgr
```

### find established tcp connections without using netstat!!
```sh
lsof -i -n | grep ESTABLISHED
```

### List open TCP/UDP ports
```sh
lsof -i tcp -i udp
```

### Which processes are listening on a specific port (e.g. port 80)
```sh
lsof -iTCP:80 -sTCP:LISTEN
```

### List open files that have no links to them on the filesystem
```sh
lsof +L1
```

### show the working directories of running processes
```sh
lsof -bw -d cwd -a -c java
```

### List all the files that have been deleted while they were still open.
```sh
lsof | egrep "^COMMAND|deleted"
```

### List the files any process is using
```sh
lsof +p xxxx
```

### View internet connection activity in a browser
```sh
lsof -nPi | txt2html  > ~/```sh
lsof.html
```

### View network activity of any application or user in realtime
```sh
lsof -r 2 -p PID -i -a
```

### Open Port Check
```sh
lsof -ni TCP
```

### Top 15 processes with the largest number of open files
```sh
lsof +c 15 | awk '{print $1}' | sort | uniq -c | sort -rn | head
```

### Show what PID is listening on port 80 on Linux
```sh
lsof -nPi tcp:80
```

### find all open files by named process
```sh
lsof -c $processname | egrep 'w.+REG' | awk '{print $9}' | sort | uniq
```

### Find out which process uses an old lib and needs a restart after a system update
```sh
lsof | grep 'DEL.*lib' | sort -k1,1 -u
```

### Discovering all open files/dirs underneath a directory
```sh
lsof +D <dirname>
```

### find the delete file ,which is in use
```sh
lsof -n |grep delete
```

### List programs with open ports and connections
```sh
lsof -i
```

### truncate deleted files from lsof
```sh
lsof|gawk '$4~/txt/{next};/REG.*\(deleted\)$/{printf ">/proc/%s/fd/%d\n", $2,$4}'
```

### View internet connection activity in a browser
```sh
lsof -nPi | txt2html  > ~/lsof.html | gnome-open lsof.html
```

### Show a listing of open mailbox files (or whatever you want to modify it to show)
```sh
lsof | grep "/var/spool/mail/"
```

### check to see what is running on a specific port number
```sh
lsof -iTCP:8080 -sTCP:LISTEN
```

### List open file descriptor count by PID
```sh
lsof | cut -f 1 -d ' ' | uniq -c | sort -rn | head -n 10
```

### identify active network connections
```sh
lsof -i -P +c 0 +M | grep -i "$1"
```

### lsof - cleaned up for just open listening ports, the process, and the owner of the process
```sh
lsof -iTCP -sTCP:LISTEN
```

### Grabs Open Files and Then Greps Them
```sh
lsof | grep "stuff"
```

### Display any udp/tcp connections by process name or by process id
```sh
lsof -nP -c COMMAND | egrep -o '(TCP|UDP).*$' | sort -u
```

### find the process that is using a certain port e.g. port 3000
```sh
lsof -P | grep ':3000'
```

### Show all listening and established ports TCP and UDP together with the PID of the associated process
```sh
lsof -ni
```

### Display IP addresses Pidgin IM Client is connected to
```sh
lsof -p `pidof pidgin` | awk '{ print $9 }'|egrep `hostname` | grep -o ">[^:]\+:" | tr -d ":>" | while read line; do host $line; done;
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
lsof -a -d 1-99 -Fn / | grep ^n | cut -b2- | sort | uniq -c | sort -n
```

### Check which files are opened by Firefox then sort by largest size.
```sh
lsof -p $(pidof firefox) | awk '/.mozilla/ { s = int($7/(2^20)); if(s>0) print (s)" MB  "$9 | "sort -rn" }'
```

### what?s running on a given port on your machine?
```sh
lsof -i -n -P | grep :80
```

### Show which process is blocking umount (Device or resource is busy)
```sh
lsof /folder
```

### truncate deleted files from lsof

```sh
lsof | grep -i deleted | grep REG | grep -v txt | ruby -r 'pp' -e 'STDIN.each do |v| a =  v.split(/ +/); puts `:> /proc/#{a[1]}/fd/#{a[3].chop}`; end'
```

### Keep a copy of the raw Youtube FLV,MP4,etc stored in /tmp/

```sh
lsof -n -P|grep FlashXX|awk '{ print "/proc/" $2 "/fd/" substr($4, 1, length($4)-1) }'|while read f;do newname=$(exiftool -FileModifyDate -FileType -t -d %Y%m%d%H%M%S $f|cut -f2|tr '\n' '.'|sed 's/\.$//');echo "$f -> $newname";cp $f ~/Vids/$newname;done
```

### which program is this port belongs to ?
```sh
lsof -i tcp:80
```

### which process has a port open
```sh
lsof -i :80
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment.
```sh
lsof -P -i -n | cut -f 1 -d " "| uniq | tail -n +2
```

### List open IPv4 connections
```sh
lsof -Pnl +M -i4
```

### List files opened by a PID
```sh
lsof -p 15857
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List .log files open by a pid
```sh
lsof -p 1234 | grep -E "\.log$" | awk '{print $NF}'
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Lists all listening ports together with the PID of the associated process
```sh
lsof -Pan -i tcp -i udp
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### View details of network activity, malicious or otherwise within a port range.
```sh
lsof -i :555-7000
```

### list processes with established tcp connections (without netstat)
```sh
lsof -i -n | grep ESTABLISHED
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### determine if tcp port is open
```sh
lsof -i :22
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List all files opened by a particular command
```sh
lsof -c dhcpd
```

### Find size in kilobyte of files that are deleted but still in use and therefore consumes diskspace
```sh
lsof -ns | grep REG | grep deleted | awk '{s+=$7/1024} END {print s}'
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### List processes playing sound
```sh
lsof | grep pcm
```

### Show top running processes by the number of open filehandles they have
```sh
lsof | awk '{print $1}' | sort | uniq -c | sort -rn | head
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### Show established network connections
```sh
lsof -i | grep -i estab
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### show all established tcp connections on os x
```sh
lsof -iTCP -sTCP:ESTABLISHED | awk '{print $1}' | sort -u
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### check open ports (both ipv4 and ipv6)
```sh
lsof -Pn | grep LISTEN
```

### Monitoring file handles used by a particular process
```sh
lsof -c <process name> -r
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### kill all processes using a directory/file/etc
```sh
lsof|grep /somemount/| awk '{print $2}'|xargs kill
```

### Watch Network Service Activity in Real-time
```sh
lsof -i
```

### Show apps that use internet connection at the moment. (Multi-Language)
```sh
lsof -P -i -n
```

### which process is accessing the CDROM
```sh
lsof -n | grep /media/cdrom
```

### Show what a given user has open using lsof
```sh
lsof -u www-data
```

### List pr. command in megabytes sum of deleted files that are still in use and therefore consumes diskspace
```sh
lsof -ns | grep REG | grep deleted | awk '{a[$1]+=$7;}END{for(i in a){printf("%s %.2f MB\n", i, a[i]/1048576);}}'
```

### List all open ports and their owning executables
```sh
lsof -i -P | grep -i "listen"
```

### check open ports
```sh
lsof -Pni4 | grep LISTEN
```

### find listening ports by pid
```sh
lsof -nP +p 24073 | grep -i listen | awk '{print $1,$2,$7,$8,$9}'
```

### List all active access_logs for currently running Apache or Lighttpd process
```sh
lsof -p $(netstat -ltpn|awk '$4 ~ /:80$/ {print substr($7,1,index($7,"/")-1)}')| awk '$9 ~ /access.log$/ {print $9| "sort -u"}'
```

### give me back my sound card
```sh
lsof /dev/snd/pcm*p /dev/dsp | awk ' { print $2 }' | xargs kill
```

### The program listening on port 8080 through IPv6
```sh
lsof -Pnl +M -i6:8080
```

### Keep track of diff progress
```sh
lsof -c diff -o -r1 | grep $file
```

### find out which directories in /home have the most files currently open
```sh
lsof |awk ' {if ( $0 ~ /home/) print substr($0, index($0,"/home") ) }'|cut -d / -f 1-4|sort|uniq -c|sort -bgr
```

### find established tcp connections without using netstat!!
```sh
lsof -i -n | grep ESTABLISHED
```

### List open TCP/UDP ports
```sh
lsof -i tcp -i udp
```

### Which processes are listening on a specific port (e.g. port 80)
```sh
lsof -iTCP:80 -sTCP:LISTEN
```

### List open files that have no links to them on the filesystem
```sh
lsof +L1
```

### show the working directories of running processes
```sh
lsof -bw -d cwd -a -c java
```

### List all the files that have been deleted while they were still open.
```sh
lsof | egrep "^COMMAND|deleted"
```

### List the files any process is using
```sh
lsof +p xxxx
```

### View internet connection activity in a browser
```sh
lsof -nPi | txt2html  > ~/```sh
lsof.html
```

### View network activity of any application or user in realtime
```sh
lsof -r 2 -p PID -i -a
```

### Open Port Check
```sh
lsof -ni TCP
```

### Top 15 processes with the largest number of open files
```sh
lsof +c 15 | awk '{print $1}' | sort | uniq -c | sort -rn | head
```

### Show what PID is listening on port 80 on Linux
```sh
lsof -nPi tcp:80
```

### find all open files by named process
```sh
lsof -c $processname | egrep 'w.+REG' | awk '{print $9}' | sort | uniq
```

### Find out which process uses an old lib and needs a restart after a system update
```sh
lsof | grep 'DEL.*lib' | sort -k1,1 -u
```

### Discovering all open files/dirs underneath a directory
```sh
lsof +D <dirname>
```

### find the delete file ,which is in use
```sh
lsof -n |grep delete
```

### List programs with open ports and connections
```sh
lsof -i
```

### truncate deleted files from lsof
```sh
lsof|gawk '$4~/txt/{next};/REG.*\(deleted\)$/{printf ">/proc/%s/fd/%d\n", $2,$4}'
```

### View internet connection activity in a browser
```sh
lsof -nPi | txt2html  > ~/```sh
lsof.html | gnome-open ```sh
lsof.html
```

### Show a listing of open mailbox files (or whatever you want to modify it to show)
```sh
lsof | grep "/var/spool/mail/"
```

### check to see what is running on a specific port number
```sh
lsof -iTCP:8080 -sTCP:LISTEN
```

### List open file descriptor count by PID
```sh
lsof | cut -f 1 -d ' ' | uniq -c | sort -rn | head -n 10
```

### identify active network connections
```sh
lsof -i -P +c 0 +M | grep -i "$1"
```

### sof - cleaned up for just open listening ports, the process, and the owner of the process
```sh
lsof -iTCP -sTCP:LISTEN
```

### Grabs Open Files and Then Greps Them
```sh
lsof | grep "stuff"
```

### Display any udp/tcp connections by process name or by process id
```sh
lsof -nP -c COMMAND | egrep -o '(TCP|UDP).*$' | sort -u
```

### find the process that is using a certain port e.g. port 3000
```sh
lsof -P | grep ':3000'
```

### Show all listening and established ports TCP and UDP together with the PID of the associated process
```sh
lsof -ni
```

### Display IP addresses Pidgin IM Client is connected to
```sh
lsof -p `pidof pidgin` | awk '{ print $9 }'|egrep `hostname` | grep -o ">[^:]\+:" | tr -d ":>" | while read line; do host $line; done;
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
lsof -a -d 1-99 -Fn / | grep ^n | cut -b2- | sort | uniq -c | sort -n
```

### Check which files are opened by Firefox then sort by largest size.
```sh
lsof -p $(pidof firefox) | awk '/.mozilla/ { s = int($7/(2^20)); if(s>0) print (s)" MB  "$9 | "sort -rn" }'
```

### what?s running on a given port on your machine?
```sh
lsof -i -n -P | grep :80
```

### Show which process is blocking umount (Device or resource is busy)
```sh
lsof /folder
```