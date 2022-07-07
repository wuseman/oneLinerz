### openssh 


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove a line in a text file. Useful to fix
```sh
ssh-keygen -R <the_offending_host>
```

### Attach screen over ssh
```sh
ssh -t remote_host screen -r
```

### directly ssh to host B that is only accessible through host A
```sh
ssh -t hostA ssh hostB
```

### Remove a line in a text file. Useful to fix
```sh
ssh-keygen -R <the_offending_host>
```

### Attach screen over ssh
```sh
ssh -t remote_host screen -r
```

### directly ssh to host B that is only accessible through host A
```sh
ssh -t hostA ssh hostB
```

### Recover remote tar backup with ssh
```sh
ssh user@host "cat /path/to/backup/backupfile.tar.bz2" |tar jpxf -
```

### Send notification bubbles to the computers remotely.
```sh
ssh -X user@host 'DISPLAY=:0 notify-send "TEST MESSAGE."'
```

### dump a remote db via ssh and populate local db with postgres
```sh
ssh user@remoteserver "PGPASSWORD='passwd' pg_dump -U user bd_name | bzip2 -zv9" | bzcat | psql -U user bd_name
```

### Copy your ssh public key to a server from a machine that doesn't have ssh-copy-id
```sh
ssh user@host -c 'nc -l 55555 >> ~/.ssh/authorized_keys' & nc HOSTNAME 55555 < ~/.ssh/id_rsa.pub
```

### Copy ssh keys to user@host to enable password-less ssh logins.
```sh
ssh-keygen ptaduri@c3pusas1
```

### connect via ssh using mac address
```sh
ssh root@`for ((i=100; i<=110; i++));do arp -a 192.168.1.$i; done | grep 00:35:cf:56:b2:2g | awk '{print $2}' | sed -e 's/(//' -e 's/)//'`
```

### copy ssh id to remote host
```sh
ssh-copy-id -i .ssh/id_rsa.pub username:password@remotehost.com
```

### Quick way to play remote audio files locally ( Linux )
```sh
ssh user@remote "cat /remote/music/dir/*.mp3" | mpg123 -
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Get a MySQL DB dump from a remote machine
```sh
ssh user@host "mysqldump -h localhost -u mysqluser -pP@$$W3rD databasename | gzip -cf" | gunzip -c > database.sql
```

### ssh hostchange know_host improver
```sh
sshostnew () {sed -i "$1d" $HOME/.ssh/known_hosts ; }
```

### To generate ssh keypair(public, private) which makes use of dsa as encryption algorithm
```sh
ssh-keygen -t dsa -b 1024
```

### remote ssh xdmcp session
```sh
ssh -XfC -c blowfish user@host Xephyr dpms -fullscreen  -query localhost :5
```

### Add EC2 pem key to SSH
```sh
ssh-add ~/.ssh/KEY_PAIR_NAME.pem
```

### Function to bind MySQL hostport to forward remote MySQL connection to localhost.
```sh
sshmysql() { ssh -L 13306:127.0.0.1:3306 -N $* & }
```

### Login via SSH
```sh
ssh -l <username> <server>
```

### Login To SSH Server / Provide SSH Password Using A Shell Script
```sh
sshpass -p 't@uyM59bQ' ssh username@server.example.com
```

### Forward connections
```sh
ssh -g -L 8080:localhost:80 root@$HOST
```

### Forward remote server CUPS port to localhost
```sh
ssh -NL 12345:localhost:631 username@remote_server
```

### tail a log over ssh
```sh
ssh remotebox tail -f /var/log/remotelog
```

### Run Remote GUI Programs Using SSH Forwarding
```sh
ssh -C -X user@remotehost gui_command
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Copy ssh keys to user@host to enable password-less ssh logins.
```sh
ssh-copy-id [-i [identity_file]] [user@]machine
```

### How to run a specific command in remote server by ssh
```sh
ssh user@remotehost [anycommand](i.e uptime,w)
```

### ssh and attach to a screen in one line.
```sh
ssh -t user@host screen -x <screen name>
```

### show you the time when you lost the remote server.
```sh
ssh remotehosts;date
```

### Execute sudo command remotely with ssh
```sh
ssh -t myserver.org 'sudo ls /etc'
```

### Duplicate installed packages from one machine to the other (RPM-based systems)
```sh
ssh root@remote.host "rpm -qa" | xargs yum -y install
```

### 3 Simple Steps to X11 Forward on Mac OS X
```sh
ssh -X johndoe@123.456.789
```

### Cute, but we already had this figured out when the Linux kids were still slurping down log-sized spliffs in the back of the microbus.
```sh
ssh-keygen -R hostname
```

### Running applications require X in ssh
```sh
ssh -X -l user 192.168.1.25
```

### use .ssh file to login the server
```sh
ssh root@172.16.1.99 -i my_openssh_key.ssh -p 9999
```


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Create an SSH tunnel for accessing your remote MySQL database with a local port
```sh
ssh -CNL 3306:localhost:3306 user@site.com
```

### Start an X app remotely
```sh
ssh -f user@remote.ip DISPLAY=:0.0 smplayer movie.avi
```

### Securely stream (and save) a file from a remote server
```sh
ssh USER@HOST cat REMOTE_FILE.mp4 | tee LOCAL_FILE.mp4 | mplayer -
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -cf - /path/to/dir" | gzip > dir.tar.gz
```

### Create an SSH connection (reverse tunnel) through your firewall.
```sh
ssh -R 2001:localhost:22 [username]@[remote server ip]
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Sync MySQL Servers via secure SSH-tunnel
```sh
ssh -f -L3307:127.0.0.1:3306 -N -t -x user@host sleep 600 ; mk-table-sync execute verbose u=root,p=xxx,h=127.0.0.1,P=3307 u=root,p=xxx,h=localhost
```

### poor man's vpn
```sh
sshuttle dns -vvr user@server 0/0
```

### Stream audio over ssh
```sh
ssh [user]@[address] "mpg321 -" < [file].mp3
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### run complex remote shell cmds over ssh, without escaping quotes
```sh
ssh host -l user $(<cmd.txt)
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@server.com 'tshark -f "port !22" -w -' | wireshark -k -i -
```

### How to establish a remote Gnu screen session that you can re-connect to
```sh
ssh -t user@some.domain.com /usr/bin/screen -xRR
```

### Copy a file over SSH without SCP
```sh
ssh HOST cat < LOCALFILE ">" REMOTEFILE
```

### ssh -A user@somehost
```sh
ssh -A user@somehost
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Record output of any command using 'tee' at backend; mainly can be used to capture the output of ssh from client side while connecting to a server.
```sh
ssh user@server | tee logfilename
```

### Run local bash script on remote server
```sh
ssh -T user@server < script.sh
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Transfer large files/directories with no overhead over the network
```sh
ssh user@host "cd targetdir; tar cfp - *" | dd of=file.tar
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
ssh-keygen -R `host hostname | cut -d " " -f 4`
```

### Tell local Debian machine to install packages used by remote Debian machine
```sh
ssh remotehost 'dpkg get-selections' | dpkg set-selections && dselect install
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remotely sniff traffic and pass to snort
```sh
ssh root@pyramid \ "tcpdump -nn -i eth1 -w -" | snort -c /etc/snort/snort.conf -r -
```

### Forward port 8888 to remote machine for SOCKS Proxy
```sh
ssh -D 8888 user@site.com
```

### Copy ssh keys to user@host to enable password-less ssh logins.
```sh
ssh-copy-id user@host
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Launch firefox on a remote linux server
```sh
ssh -fY user@REMOTESERVER firefox -no-remote
```

### Dump dvd from a different machine onto this one.
```sh
ssh user@machine_A dd if=/dev/dvd0 > dvddump.iso
```

### Backup entire system through SSH
```sh
ssh -C USER@HOST tar -c exclude /proc exclude /sys / | tar -x
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Reverse SSH
```sh
ssh -f -N -R 8888:localhost:22 user@somedomain.org
```

### setup a tunnel from destination machine port 80 to localhost 2001, via a second (hub) machine.
```sh
ssh -N -L2001:localhost:80 -o "ProxyCommand ssh someuser@hubmachine nc -w 5 %h %p" someuser@destinationmachine
```

### Create a persistent remote Proxy server through an SSH channel
```sh
ssh -fND localhost:PORT USER@SSH_ENABLED_SERVER
```

### Synchronize date and time with a server over ssh
```sh
ssh user@server sudo date -s @`( date -u +"%s" )`
```

### remote diff with side-by-side ordering.
```sh
ssh $HOST -l$USER cat /REMOTE/FILE | sdiff /LOCAL/FILE -
```

### Install your ssh key file on a remote system
```sh
ssh user@remote 'cat >> ~/.ssh/authorized_keys2' < ~/.ssh/id_rsa.pub
```

### Get ssh server fingerprints
```sh
ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key.pub && ssh-keygen -l -f /etc/ssh/ssh_host_dsa_key.pub
```

### SSH Auto-login with password
```sh
sshpass -p "YOUR_PASSWORD" ssh -o StrictHostKeyChecking=no YOUR_USERNAME@SOME_SITE.COM
```

### eavesdrop
```sh
ssh USER@REMOTESYSTEM arecord - | aplay -
```

### ssh: change directory while connecting
```sh
ssh -t server 'cd /etc && $SHELL'
```

### Single use vnc-over-ssh connection
```sh
ssh -f -L 5900:localhost:5900 your.ssh.server "x11vnc -safer -localhost -nopw -once -display :0"; vinagre localhost:5900
```

### SSH connection through host in the middle; with key redirection
```sh
ssh -o "ProxyCommand ssh user@reachable_host -W %h:%p" user@unreacheable_host
```

### Remote execute command as sudoer via ssh
```sh
sshpass -p 'sshpssword' ssh -t <sshuser>@<remotehost> "echo <sudopassword> | sudo -S <command>"
```

### Get the version of sshd on a remote system
```sh
ssh -vN hostname 2>&1 | grep "remote software version"
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -zcf - /path/to/dir" > dir.tar.gz
```

### Transfer SSH public key to another machine in one step
```sh
ssh-keygen; ssh-copy-id user@host; ssh user@host
```

### Automatic ssh Session Logger
```sh
ssh(){ L="\$HOME/logs/$(date +%F_%H:%M)-$USER";/usr/bin/ssh -t "$@" "mkdir -p \"${L%/*}\";screen -xRRS $USER script -f \"$L\"";}
```

### "hidden" remote shell
```sh
ssh -T user@host /bin/bash -i
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### send file to remote machine and unzip using ssh
```sh
ssh user@host 'gunzip - > file' < file.gz
```

### remote-pbzip2 and transfer a directory to local file
```sh
ssh user@host 'tar -c use-compress-prog=pbzip2 /<dir>/<subdir>' > <localfile>.tar.bz2
```

### Harder, Faster, Stronger SSH clients
```sh
ssh -4 -C -c blowfish-cbc
```

### Change SSH RSA passphrase
```sh
ssh-keygen -f ~/.ssh/id_rsa -p
```

### gzip over ssh
```sh
ssh 10.0.0.4 "cat /tmp/backup.sql | gzip -c1" | gunzip -c > backup.sql
```

### Restore a local drive from the image on remote host via ssh
```sh
ssh user@server 'dd if=sda.img' | dd of=/dev/sda
```

### Copy from host 1 to host 2 through your host
```sh
ssh root@host1 ?cd /somedir/tocopy/ && tar -cf ? .? | ssh root@host2 ?cd /samedir/tocopyto/ && tar -xf -?
```

### Run a command on a remote machine
```sh
ssh user@host "ps aux | grep httpd | wc -l"
```

### Copy stdin to your X11 buffer
```sh
ssh user@host cat /path/to/some/file | xclip
```

### copy from host1 to host2, through your host
```sh
ssh user@<source_host>  tar cz <path> | ssh user@<destination_host>  tar vxzC <path>
```

### get a directory from one machine to another using tar and ssh
```sh
ssh somemachine "cd some dir; tar zcpf - somedirname" |tar zxpf -
```

### Stream audio over ssh ogg version
```sh
ssh [user]@[host] "ogg123 -" < [podcast].ogg
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
ssh-keygen -R $(dig +short host.domain.tld)
```

### Backup a remote database to your local filesystem
```sh
ssh user@host 'mysqldump dbname | gzip' > /path/to/backups/db-backup-`date +%Y-%m-%d`.sql.gz
```

### Debug a remote php application (behind firewall) using ssh tunnel for XDEBUG port 9000
```sh
ssh -R 9000:localhost:9000 you@remote-php-web-server.com
```

### remove hostname from known_hosts
```sh
ssh-keygen -R hostname
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh user@server.com sudo tcpdump -i eth0  -w - 'port 80'| /Applications/Wireshark.app/Contents/Resources/bin/wireshark -k -i -
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove a line from a file using sed (useful for updating known SSH server keys when they change)
```sh
ssh-keygen -R <thehost>
```

### copy from host1 to host2, through your host
```sh
ssh root@host1 "cd /somedir/tocopy/ && tar -cf - ." | ssh root@host2 "cd /samedir/tocopyto/ && tar -xf -"
```

### Forwards connections to your port 2000 to the port 22 of a remote host via ssh tunnel
```sh
ssh -NL 2000:remotehost:22 remotehost
```

### HTTP GET request on wireshark remotly
```sh
ssh USER@HOST "sudo tshark -i eth0 -f 'tcp port 80 and tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' -w -" | wireshark -k -i -
```

### Run any GUI program remotely
```sh
ssh -fX <user>@<host> <program>
```

### Get and read log from remote host (works with log on pipe, too)
```sh
ssh remoteUser@remoteHost "tail -f /var/log/scs/remoteLogName" | tee localLogName
```

### Copy files and directories from a remote machine to the local machine
```sh
ssh user@host "(cd /path/to/remote/top/dir ; tar cvf - ./*)" | tar xvf -
```

### Skip banner on ssh login prompt
```sh
ssh -q user@server
```

### Get backup from remote host, then expand in current directory using tar
```sh
ssh -l username server.tdl "tar -czf - /home/username/public_html" | tar -xzf -
```

### ssh batch jobs: query hundreds of hosts with an ssh command
```sh
ssh -tq -o "BatchMode yes" $HOST  <some_command> >> to_a_file
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Copy your SSH public key on a remote machine for passwordless login - the easy way
```sh
ssh-copy-id username@hostname
```

### Copy your SSH public key on a remote machine for passwordless login - the easy way
```sh
ssh-copy-id username@hostname
```

### Tunnel ssh through Socks Proxy
```sh
ssh -o ProxyCommand='nc -x ProxyHost:8080 %h %p' TargetHost
```

### copy remote ssh session output to local clipboard
```sh
ssh [remote-machine] "cat file" | xclip -selection c
```

### tail -f a log file over ssh into growl
```sh
ssh -t HOSTNAME 'tail -f LOGFILE' | while read; do growlnotify -t "TITLE" -m "$REPLY"; done
```

### A command to copy mysql tables from a remote host to current host via ssh.
```sh
ssh username@remotehost 'mysqldump -u <dbusername> -p<dbpassword> <dbname> tbl_name_1 tbl_name_2 tbl_name_3' | mysql -u <localusername> -p<localdbpassword> <localdbname> < /dev/stdin
```

### test moduli file  generated  for openssh
```sh
ssh-keygen -T moduli-2048 -f /tmp/moduli-2048.candidates
```

### tunnel vnc port
```sh
ssh -L 5900:localhost:5900 user@exampleserver.com
```

### A command to copy mysql tables from a remote host to current host via ssh.
```sh
ssh username@remotehost 'mysqldump -u <dbusername> -p<dbpassword> <dbname> tbl_name_1 tbl_name_2 tbl_name_3 | gzip -c -' | gzip -dc - | mysql -u <localusername> -p<localdbpassword> <localdbname>
```

### tail a log over ssh
```sh
ssh  -t remotebox "tail -f /var/log/remote.log"
```

### Backup with SSH in a archive
```sh
ssh -i $PRIVATEKEY $HOST -C 'cd $SOURCE; tar -cz numeric-owner .' | tee $DESTINATION/backup.tgz | tar -tz
```

### backup system over ssh, exlucde common dirs
```sh
ssh root@192.168.0.1 "cd /;nice -n 10 tar cvpP ?exclude={"/proc/*","/sys*","/tmp/*","/home/user/*"} /">backup.tar.gz
```

### Validate openssh key & print checksum
```sh
ssh-keygen -l -f [pubkey] | awk '{print $2}' | tr -ds ':' '' | egrep -ie "[a-f0-9]{32}"
```

### Secure netcat chat - SSH
```sh
ssh hostname nc -l 9876
```

### Live stream a remote desktop over ssh using only ffmpeg
```sh
ssh user@host "ffmpeg -f x11grab -r 5 -s 1280x720 -i :0 -f avi -" | ffplay - &>/dev/null
```

### Don't save commands in bash history (only for current session)
```sh
ssh user@hostname.domain "> ~/.bash_history"
```


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### ssh X tunneling over multiple ssh hosts (through ssh proxy)
```sh
ssh -t -X -A user@sshproxy ssh -X -A user@sshhost
```

### RDP through SSH tunnel
```sh
ssh -f -L3389:<RDP_HOST>:3389 <SSH_PROXY> "sleep 10" && rdesktop -T'<WINDOW_TITLE>' -uAdministrator -g800x600 -a8 -rsound:off -rclipboard:PRIMARYCLIPBOARD -5 localhost
```

### Remote screenshot
```sh
ssh user@remote-host "DISPLAY=:0.0 import -window root -format png -"|display -format png -
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@HOST tcpdump -U -s0 -w - 'not port 22' | wireshark -k -i -
```

### Copy a folder tree through ssh using compression (no temporary files)
```sh
ssh <host> 'tar -cz /<folder>/<subfolder>' | tar -xvz
```

### Connect to google talk through ssh by setting your IM client to use the localhost 5432 port
```sh
ssh -f -N -L 5432:talk.google.com:5222 user@home.network.com
```

### Speed Up WAN File Transfer With Compression
```sh
ssh 10.0.0.4 "gzip -c /tmp/backup.sql" |gunzip > backup.sql
```

### copy public key
```sh
ssh-copy-id host
```

### Validate openssh key & print checksum
```sh
ssh-keygen -l -f [pubkey] | cut -d ' ' -f 2 | tr -ds '\n:' ''
```

### Import MySQL db to localhost.
```sh
ssh remote_user@remote_host 'mysqldump -h localhost -u username -ppass -B db_name | gzip -cf' | gunzip -c | mysql -uroot
```

### SSL tunnel to proxy remote mysql port
```sh
ssh -T -N -L 23306:localhost:3306 root@mysql.domain.com
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### ssh to machine behind shared NAT
```sh
ssh -NR 0.0.0.0:2222:127.0.0.1:22 user@jump.host.com
```

### View ~/.ssh/known_hosts key information
```sh
ssh-keygen -l -f ~/.ssh/known_hosts
```

### Copy a file over SSH without SCP
```sh
ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@HOST tcpdump -iany -U -s0 -w - 'not port 22' | wireshark -k -i -
```

### Music streaming via ssh
```sh
ssh login@server "cat path/filename.mp3" | mplayer -
```

### Extract remote gzip tarball
```sh
ssh user@remote "cat /path/to/archive.tgz" | tar zxvf -
```

### list tomcat webapps
```sh
ssh tomcat-server ls -l webapp-dir | grep  '->' | awk ' { print $(NF-2) " " $(NF-1) " " $NF; }'
```

### Migrate wordpress db between two hosts changing the URL on the fly with encryption and compression
```sh
ssh -q ${SRC_HOST} "mysqldump add-drop-database create-options databases wordpress | sed -r \"s/${OLD_URL}/${NEW_URL}/g\" | gzip -9" | ssh ${DST_HOST} "gunzip | mysql"
```

### SSH monitor
```sh
ssh root@server 'tail max-unchanged-stats=10 -n0 -F /var/log/auth.log ' | grep Accepted | while read l ; do kdialog title "SSH monitor" passivepopup "$l" 3; done
```

### Copy uncommitted changes from remote git repository
```sh
ssh HOST '(cd REPO_DIR && git diff name-only HEAD | cpio -o -Hnewc quiet)' | cpio -iduv quiet -Hnewc
```

### Create a persistent connection to a machine
```sh
ssh -MNf <user>@<host>
```

### Create a persistent connection to a machine
```sh
ssh -MNf <user>@<host>
```


### Temporarily ignore mismatched SSH host key
```sh
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no username@host
```

### Put at the end of the rsa public key an comment(default value is the hostname)
```sh
ssh-keygen -C hello@world
```

### ssh-keygen -b 4048 -t rsa -C "comment"
```sh
ssh-keygen -b 4048 -t rsa -C "comment"
```

### Set window name when SSH'ing while using screen
```sh
ssh() { [ $TERM == screen ] && (screen -X title "${1##*@}"; command ssh "$@"; screen -X title '';exit;) || command ssh "$@"; }
```


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### runs a X session within your X session
```sh
ssh -C -Y -l$USER xserver.mynet.xx 'Xnest -geometry 1900x1150 -query localhost'
```

### immediatly attach to previous tmux session when connecting through ssh
```sh
ssh -t user@remote_host tmux attach
```

### having root on server, add user's public key to his keys (no password required)
```sh
ssh-copy-id -i user_public_key.pub root@host
```

### Multiple SSH Tunnels
```sh
ssh -L :: -L :: @
```

### having root on server, add user's public key to his keys (no password required)
```sh
ssh-copy-id -i user_public_key.pub <user>@<remotehost>
```

### Copy files between hosts while on a proxy host
```sh
ssh <source host> "cat file" | ssh <dest host> "cat - > file"
```

### VPN without VPN: Get access to networks available from your ssh server and hide behind it
```sh
sshuttle -r <username>@<sshserver> 0/0
```

### generate the moduli file for openssh if lost
```sh
ssh-keygen -G /tmp/moduli-2048.candidates -b 2048
```

### Run multiple commands on a remote host with sudo
```sh
ssh -t user@host 'sudo bash -c "ls /var/log && cat /etc/passwd"'
```

### Create & transfer tarball over ssh
```sh
ssh -c 'tar cvzf - -C /path/to/src/*' | tar xzf -
```

### scp a good script from host A which has no public access to host C, but with a hop by host B
```sh
ssh middlehost "ssh -a root@securehost '> nicescript'" < nicescript
```

### How to use rysnc over ssh tunnel
```sh
sshpass -p [password] rsync -av -e ssh [utente]@[indirizzoip]:/directorydacopiare/ /directorydidestinazione
```

### Take a screenshot of x11 over ssh pipe to view on a mac in one line
```sh
ssh user@host.com "DISPLAY=:0.0 import -window root png:-" | open -a /Applications/Preview.app -f
```

### Generate SSH key
```sh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/<ROLE>_rsa -C "Comment goes here"
```

### Anonymous ssh using tor proxy (or any socks based proxy)
```sh
ssh -o ProxyCommand="nc -X 5 -x localhost:9050 %h %p" username@remote_host
```

### SSH with debug to troubleshoot any connection issues
```sh
ssh -v jsmith@remotehost.example.com
```

### Convert an ssh2 public key to openssh format
```sh
ssh-keygen -i -f $sshkeysfile >> authorized_keys
```

### execute/start some scripts on a remote machine/server (which will terminate automatically) and disconnect from the server
```sh
ssh remoteserver 'nohup /path/to/script `</dev/null` >nohup.out 2>&1 &'
```


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove invalid host keys from ~/.ssh/known_hosts
```sh
ssh-keygen -R \[localhost\]:8022
```

### back ssh from firewalled hosts
```sh
ssh -R 5497:127.0.0.1:22 -p 62220 user@public.ip
```

### SSH connection with private key and port 222
```sh
ssh -i /root/.ssh/username\@hostname -p 222 username@hostname
```

### SSH connection with private key and port 222
```sh
ssh -i /root/.ssh/username\@hostname -p 222 username@hostname
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -czf - /path/to/dir" > dir.tar.gz
```

### ssh key generate
```sh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

### Copy your ssh public key to a server from a machine that doesn't have ssh-copy-id
```sh
ssh <user>@<host> 'mkdir -m 700 ~/.ssh; echo ' $(< ~/.ssh/id_rsa.pub) ' >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys'
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -zcf - /path/to/dir" | tar -xvz
```

### rsa 4096 key generating with passphrase
```sh
ssh-keygen -t rsa -b 4096
```

### pipe remote log web server file to lostalgia
```sh
ssh -n user@server.tr tail -f /usr/local/nginx/logs/access.log > /tmp/access | tail -f /tmp/access | logstalgia
```

### Temporarily ignore known SSH hosts
```sh
ssh -o UserKnownHostsFile=/dev/null root@192.168.1.1
```

### Sync a remote mysql database to a local db via SSH
```sh
ssh <remoteuser>@<remoteserver> \ 'mysqldump -u <user> -p<password> <database>' \ | mysql -u <user> -p<password> <database>
```

### open a screenshot of a remote desktop via ssh
```sh
ssh user@host "ffmpeg -f x11grab -s 1920x1080 -i :0 -r 1 -t 1 -f mjpeg -" | display
```

### Sync local machine date to remote machine over ssh
```sh
ssh root@host.domain.tld "date -s '"$(date)"'";
```

### Use a server as SOCKS5 proxy over SSH
```sh
ssh -D 8080 -f -N srv1
```

### Connect via SSH to VirtualBox guest VM without knowing IP address
```sh
ssh vm-user@`VBoxManage guestproperty get "vm-name" "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk '{ print $2 }'`
```

### SSH/wmic to remotely kill a process on a windows box
```sh
ssh <user>@<ip address> $(echo wmic process where \"name like \'%<process to kill>%\'\" delete)
```

### get gzipped logs from webserver to local machine
```sh
ssh user@remote "tar cfp - /path/to/log/* | gzip" > local.tar.gz
```

### Replicate a directory structure from a 'basedir' in a remote server.
```sh
ssh user@remotehost "find basedir -type d" | xargs -I {} -t mkdir -p {}
```

### send message to specific remote user
```sh
ssh youraccount@192.168.1.168 write toUsername pts/33
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```


### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove a line in a text file. Useful to fix
```sh
ssh-keygen -R <the_offending_host>
```

### Attach screen over ssh
```sh
ssh -t remote_host screen -r
```

### directly ssh to host B that is only accessible through host A
```sh
ssh -t hostA ssh hostB
```

### Recover remote tar backup with ssh
```sh
ssh user@host "cat /path/to/backup/backupfile.tar.bz2" |tar jpxf -
```

### connect via ssh using mac address
```sh
ssh root@`for ((i=100; i<=110; i++));do arp -a 192.168.1.$i; done | grep 00:35:cf:56:b2:2g | awk '{print $2}' | sed -e 's/(//' -e 's/)//'`
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Get a MySQL DB dump from a remote machine
```sh
ssh user@host "mysqldump -h localhost -u mysqluser -pP@$$W3rD databasename | gzip -cf" | gunzip -c > database.sql
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### ssh and attach to a screen in one line.
```sh
ssh -t user@host screen -x <screen name>
```

### Duplicate installed packages from one machine to the other (RPM-based systems)
```sh
ssh root@remote.host "rpm -qa" | xargs yum -y install
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Create an SSH tunnel for accessing your remote MySQL database with a local port
```sh
ssh -CNL 3306:localhost:3306 user@site.com
```

### Start an X app remotely
```sh
ssh -f user@remote.ip DISPLAY=:0.0 smplayer movie.avi
```

### Securely stream (and save) a file from a remote server
```sh
ssh USER@HOST cat REMOTE_FILE.mp4 | tee LOCAL_FILE.mp4 | mplayer -
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -cf - /path/to/dir" | gzip > dir.tar.gz
```

### Create an SSH connection (reverse tunnel) through your firewall.
```sh
ssh -R 2001:localhost:22 [username]@[remote server ip]
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Sync MySQL Servers via secure SSH-tunnel
```sh
ssh -f -L3307:127.0.0.1:3306 -N -t -x user@host sleep 600 ; mk-table-sync execute verbose u=root,p=xxx,h=127.0.0.1,P=3307 u=root,p=xxx,h=localhost
```

### poor man's vpn
```sh
sshuttle dns -vvr user@server 0/0
```

### Stream audio over ssh
```sh
ssh [user]@[address] "mpg321 -" < [file].mp3
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### run complex remote shell cmds over ssh, without escaping quotes
```sh
ssh host -l user $(<cmd.txt)
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@server.com 'tshark -f "port !22" -w -' | wireshark -k -i -
```

### How to establish a remote Gnu screen session that you can re-connect to
```sh
ssh -t user@some.domain.com /usr/bin/screen -xRR
```

### Copy a file over SSH without SCP
```sh
ssh HOST cat < LOCALFILE ">" REMOTEFILE
```

### ssh -A user@somehost
```sh
ssh -A user@somehost
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Record output of any command using 'tee' at backend; mainly can be used to capture the output of ssh from client side while connecting to a server.
```sh
ssh user@server | tee logfilename
```

### Run local bash script on remote server
```sh
ssh -T user@server < script.sh
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Transfer large files/directories with no overhead over the network
```sh
ssh user@host "cd targetdir; tar cfp - *" | dd of=file.tar
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
ssh-keygen -R `host hostname | cut -d " " -f 4`
```

### Tell local Debian machine to install packages used by remote Debian machine
```sh
ssh remotehost 'dpkg get-selections' | dpkg set-selections && dselect install
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remotely sniff traffic and pass to snort
```sh
ssh root@pyramid \ "tcpdump -nn -i eth1 -w -" | snort -c /etc/snort/snort.conf -r -
```

### Forward port 8888 to remote machine for SOCKS Proxy
```sh
ssh -D 8888 user@site.com
```

### Copy ssh keys to user@host to enable password-less ssh logins.
```sh
ssh-copy-id user@host
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Launch firefox on a remote linux server
```sh
ssh -fY user@REMOTESERVER firefox -no-remote
```

### Dump dvd from a different machine onto this one.
```sh
ssh user@machine_A dd if=/dev/dvd0 > dvddump.iso
```

### Backup entire system through SSH
```sh
ssh -C USER@HOST tar -c exclude /proc exclude /sys / | tar -x
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Reverse SSH
```sh
ssh -f -N -R 8888:localhost:22 user@somedomain.org
```

### setup a tunnel from destination machine port 80 to localhost 2001, via a second (hub) machine.
```sh
ssh -N -L2001:localhost:80 -o "ProxyCommand ssh someuser@hubmachine nc -w 5 %h %p" someuser@destinationmachine
```

### Create a persistent remote Proxy server through an SSH channel
```sh
ssh -fND localhost:PORT USER@SSH_ENABLED_SERVER
```

### Synchronize date and time with a server over ssh
```sh
ssh user@server sudo date -s @`( date -u +"%s" )`
```

### remote diff with side-by-side ordering.
```sh
ssh $HOST -l$USER cat /REMOTE/FILE | sdiff /LOCAL/FILE -
```

### Install your ssh key file on a remote system
```sh
ssh user@remote 'cat >> ~/.ssh/authorized_keys2' < ~/.ssh/id_rsa.pub
```

### Get ssh server fingerprints
```sh
ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key.pub && ssh-keygen -l -f /etc/ssh/ssh_host_dsa_key.pub
```

### SSH Auto-login with password
```sh
sshpass -p "YOUR_PASSWORD" ssh -o StrictHostKeyChecking=no YOUR_USERNAME@SOME_SITE.COM
```

### eavesdrop
```sh
ssh USER@REMOTESYSTEM arecord - | aplay -
```

### ssh: change directory while connecting
```sh
ssh -t server 'cd /etc && $SHELL'
```

### Single use vnc-over-ssh connection
```sh
ssh -f -L 5900:localhost:5900 your.ssh.server "x11vnc -safer -localhost -nopw -once -display :0"; vinagre localhost:5900
```

### SSH connection through host in the middle; with key redirection
```sh
ssh -o "ProxyCommand ssh user@reachable_host -W %h:%p" user@unreacheable_host
```

### Remote execute command as sudoer via ssh
```sh
sshpass -p 'sshpssword' ssh -t <sshuser>@<remotehost> "echo <sudopassword> | sudo -S <command>"
```

### Get the version of sshd on a remote system
```sh
ssh -vN hostname 2>&1 | grep "remote software version"
```

### Create a local compressed tarball from remote host directory
```sh
ssh user@host "tar -zcf - /path/to/dir" > dir.tar.gz
```

### Transfer SSH public key to another machine in one step
```sh
ssh-keygen; ssh-copy-id user@host; ssh user@host
```

### Automatic ssh Session Logger
```sh
ssh(){ L="\$HOME/logs/$(date +%F_%H:%M)-$USER";/usr/bin/ssh -t "$@" "mkdir -p \"${L%/*}\";screen -xRRS $USER script -f \"$L\"";}
```

### "hidden" remote shell
```sh
ssh -T user@host /bin/bash -i
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### send file to remote machine and unzip using ssh
```sh
ssh user@host 'gunzip - > file' < file.gz
```

### remote-pbzip2 and transfer a directory to local file
```sh
ssh user@host 'tar -c use-compress-prog=pbzip2 /<dir>/<subdir>' > <localfile>.tar.bz2
```

### Harder, Faster, Stronger SSH clients
```sh
ssh -4 -C -c blowfish-cbc
```

### Change SSH RSA passphrase
```sh
ssh-keygen -f ~/.ssh/id_rsa -p
```

### gzip over ssh
```sh
ssh 10.0.0.4 "cat /tmp/backup.sql | gzip -c1" | gunzip -c > backup.sql
```

### Restore a local drive from the image on remote host via ssh
```sh
ssh user@server 'dd if=sda.img' | dd of=/dev/sda
```

### Copy from host 1 to host 2 through your host
```sh
ssh root@host1 ?cd /somedir/tocopy/ && tar -cf ? .? | ssh root@host2 ?cd /samedir/tocopyto/ && tar -xf -?
```

### Run a command on a remote machine
```sh
ssh user@host "ps aux | grep httpd | wc -l"
```

### Copy stdin to your X11 buffer
```sh
ssh user@host cat /path/to/some/file | xclip
```

### copy from host1 to host2, through your host
```sh
ssh user@<source_host>  tar cz <path> | ssh user@<destination_host>  tar vxzC <path>
```

### get a directory from one machine to another using tar and ssh
```sh
ssh somemachine "cd some dir; tar zcpf - somedirname" |tar zxpf -
```

### Stream audio over ssh ogg version
```sh
ssh [user]@[host] "ogg123 -" < [podcast].ogg
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
ssh-keygen -R $(dig +short host.domain.tld)
```

### Backup a remote database to your local filesystem
```sh
ssh user@host 'mysqldump dbname | gzip' > /path/to/backups/db-backup-`date +%Y-%m-%d`.sql.gz
```

### Debug a remote php application (behind firewall) using ssh tunnel for XDEBUG port 9000
```sh
ssh -R 9000:localhost:9000 you@remote-php-web-server.com
```

### remove hostname from known_hosts
```sh
ssh-keygen -R hostname
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh user@server.com sudo tcpdump -i eth0  -w - 'port 80'| /Applications/Wireshark.app/Contents/Resources/bin/wireshark -k -i -
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove a line from a file using sed (useful for updating known SSH server keys when they change)
```sh
ssh-keygen -R <thehost>
```

### copy from host1 to host2, through your host
```sh
ssh root@host1 "cd /somedir/tocopy/ && tar -cf - ." | ssh root@host2 "cd /samedir/tocopyto/ && tar -xf -"
```

### Forwards connections to your port 2000 to the port 22 of a remote host via ssh tunnel
```sh
ssh -NL 2000:remotehost:22 remotehost
```

### HTTP GET request on wireshark remotly
```sh
ssh USER@HOST "sudo tshark -i eth0 -f 'tcp port 80 and tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' -w -" | wireshark -k -i -
```

### Run any GUI program remotely
```sh
ssh -fX <user>@<host> <program>
```

### Get and read log from remote host (works with log on pipe, too)
```sh
ssh remoteUser@remoteHost "tail -f /var/log/scs/remoteLogName" | tee localLogName
```

### Copy files and directories from a remote machine to the local machine
```sh
ssh user@host "(cd /path/to/remote/top/dir ; tar cvf - ./*)" | tar xvf -
```

### Skip banner on ssh login prompt
```sh
ssh -q user@server
```

### Get backup from remote host, then expand in current directory using tar
```sh
ssh -l username server.tdl "tar -czf - /home/username/public_html" | tar -xzf -
```

### ssh batch jobs: query hundreds of hosts with an ssh command
```sh
ssh -tq -o "BatchMode yes" $HOST  <some_command> >> to_a_file
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Copy your SSH public key on a remote machine for passwordless login - the easy way
```sh
ssh-copy-id username@hostname
```

### Tunnel ssh through Socks Proxy
```sh
ssh -o ProxyCommand='nc -x ProxyHost:8080 %h %p' TargetHost
```

### copy remote ssh session output to local clipboard
```sh
ssh [remote-machine] "cat file" | xclip -selection c
```

### tail -f a log file over ssh into growl
```sh
ssh -t HOSTNAME 'tail -f LOGFILE' | while read; do growlnotify -t "TITLE" -m "$REPLY"; done
```

### A command to copy mysql tables from a remote host to current host via ssh.
```sh
ssh username@remotehost 'mysqldump -u <dbusername> -p<dbpassword> <dbname> tbl_name_1 tbl_name_2 tbl_name_3' | mysql -u <localusername> -p<localdbpassword> <localdbname> < /dev/stdin
```

### test moduli file  generated  for openssh
```sh
ssh-keygen -T moduli-2048 -f /tmp/moduli-2048.candidates
```

### tunnel vnc port
```sh
ssh -L 5900:localhost:5900 user@exampleserver.com
```

### A command to copy mysql tables from a remote host to current host via ssh.
```sh
ssh username@remotehost 'mysqldump -u <dbusername> -p<dbpassword> <dbname> tbl_name_1 tbl_name_2 tbl_name_3 | gzip -c -' | gzip -dc - | mysql -u <localusername> -p<localdbpassword> <localdbname>
```

### tail a log over ssh
```sh
ssh  -t remotebox "tail -f /var/log/remote.log"
```

### Backup with SSH in a archive
```sh
ssh -i $PRIVATEKEY $HOST -C 'cd $SOURCE; tar -cz numeric-owner .' | tee $DESTINATION/backup.tgz | tar -tz
```

### backup system over ssh, exlucde common dirs
```sh
ssh root@192.168.0.1 "cd /;nice -n 10 tar cvpP ?exclude={"/proc/*","/sys*","/tmp/*","/home/user/*"} /">backup.tar.gz
```

### Validate openssh key & print checksum
```sh
ssh-keygen -l -f [pubkey] | awk '{print $2}' | tr -ds ':' '' | egrep -ie "[a-f0-9]{32}"
```

### Secure netcat chat - SSH
```sh
ssh hostname nc -l 9876
```

### Live stream a remote desktop over ssh using only ffmpeg
```sh
ssh user@host "ffmpeg -f x11grab -r 5 -s 1280x720 -i :0 -f avi -" | ffplay - &>/dev/null
```

### Don't save commands in bash history (only for current session)
```sh
ssh user@hostname.domain "> ~/.bash_history"
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### ssh X tunneling over multiple ssh hosts (through ssh proxy)
```sh
ssh -t -X -A user@sshproxy ssh -X -A user@sshhost
```

### RDP through SSH tunnel
```sh
ssh -f -L3389:<RDP_HOST>:3389 <SSH_PROXY> "sleep 10" && rdesktop -T'<WINDOW_TITLE>' -uAdministrator -g800x600 -a8 -rsound:off -rclipboard:PRIMARYCLIPBOARD -5 localhost
```

### Remote screenshot
```sh
ssh user@remote-host "DISPLAY=:0.0 import -window root -format png -"|display -format png -
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@HOST tcpdump -U -s0 -w - 'not port 22' | wireshark -k -i -
```

### Copy a folder tree through ssh using compression (no temporary files)
```sh
ssh <host> 'tar -cz /<folder>/<subfolder>' | tar -xvz
```

### Connect to google talk through ssh by setting your IM client to use the localhost 5432 port
```sh
ssh -f -N -L 5432:talk.google.com:5222 user@home.network.com
```

### Speed Up WAN File Transfer With Compression
```sh
ssh 10.0.0.4 "gzip -c /tmp/backup.sql" |gunzip > backup.sql
```

### copy public key
```sh
ssh-copy-id host
```

### Validate openssh key & print checksum
```sh
ssh-keygen -l -f [pubkey] | cut -d ' ' -f 2 | tr -ds '\n:' ''
```

### Import MySQL db to localhost.
```sh
ssh remote_user@remote_host 'mysqldump -h localhost -u username -ppass -B db_name | gzip -cf' | gunzip -c | mysql -uroot
```

### SSL tunnel to proxy remote mysql port
```sh
ssh -T -N -L 23306:localhost:3306 root@mysql.domain.com
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### ssh to machine behind shared NAT
```sh
ssh -NR 0.0.0.0:2222:127.0.0.1:22 user@jump.host.com
```

### View ~/.ssh/known_hosts key information
```sh
ssh-keygen -l -f ~/.ssh/known_hosts
```

### Copy a file over SSH without SCP
```sh
ssh username1@servername1 -t ssh username2@servername2 uuencode -m testfile1.tar - | uudecode > testfile1.tar
```

### analyze traffic remotely over ssh w/ wireshark
```sh
ssh root@HOST tcpdump -iany -U -s0 -w - 'not port 22' | wireshark -k -i -
```

### Music streaming via ssh
```sh
ssh login@server "cat path/filename.mp3" | mplayer -
```

### Extract remote gzip tarball
```sh
ssh user@remote "cat /path/to/archive.tgz" | tar zxvf -
```

### list tomcat webapps
```sh
ssh tomcat-server ls -l webapp-dir | grep  '->' | awk ' { print $(NF-2) " " $(NF-1) " " $NF; }'
```

### Migrate wordpress db between two hosts changing the URL on the fly with encryption and compression
```sh
ssh -q ${SRC_HOST} "mysqldump add-drop-database create-options databases wordpress | sed -r \"s/${OLD_URL}/${NEW_URL}/g\" | gzip -9" | ssh ${DST_HOST} "gunzip | mysql"
```

### SSH monitor
```sh
ssh root@server 'tail max-unchanged-stats=10 -n0 -F /var/log/auth.log ' | grep Accepted | while read l ; do kdialog title "SSH monitor" passivepopup "$l" 3; done
```

### Copy uncommitted changes from remote git repository
```sh
ssh HOST '(cd REPO_DIR && git diff name-only HEAD | cpio -o -Hnewc quiet)' | cpio -iduv quiet -Hnewc
```

### Create a persistent connection to a machine
```sh
ssh -MNf <user>@<host>
```



### Temporarily ignore mismatched SSH host key
```sh
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no username@host
```

### Put at the end of the rsa public key an comment(default value is the hostname)
```sh
ssh-keygen -C hello@world
```



### ssh-keygen -b 4048 -t rsa -C "comment"
```sh
ssh-keygen -b 4048 -t rsa -C "comment"
```

### Set window name when SSH'ing while using screen
```sh
ssh() { [ $TERM == screen ] && (screen -X title "${1##*@}"; command ssh "$@"; screen -X title '';exit;) || command ssh "$@"; }
```

### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### runs a X session within your X session
```sh
ssh -C -Y -l$USER xserver.mynet.xx 'Xnest -geometry 1900x1150 -query localhost'
```

### immediatly attach to previous tmux session when connecting through ssh
```sh
ssh -t user@remote_host tmux attach
```

### having root on server, add user's public key to his keys (no password required)
```sh
ssh-copy-id -i user_public_key.pub root@host
```

### Multiple SSH Tunnels
```sh
ssh -L :: -L :: @
```

### having root on server, add user's public key to his keys (no password required)
```sh
ssh-copy-id -i user_public_key.pub <user>@<remotehost>
```

### Copy files between hosts while on a proxy host
```sh
ssh <source host> "cat file" | ssh <dest host> "cat - > file"
```

### VPN without VPN: Get access to networks available from your ssh server and hide behind it
```sh
sshuttle -r <username>@<sshserver> 0/0
```

### generate the moduli file for openssh if lost
```sh
ssh-keygen -G /tmp/moduli-2048.candidates -b 2048
```

### Run multiple commands on a remote host with sudo
```sh
ssh -t user@host 'sudo bash -c "ls /var/log && cat /etc/passwd"'
```

### Create & transfer tarball over ssh
```sh
ssh -c 'tar cvzf - -C /path/to/src/*' | tar xzf -
```

### scp a good script from host A which has no public access to host C, but with a hop by host B
```sh
ssh middlehost "ssh -a root@securehost '> nicescript'" < nicescript
```

### How to use rysnc over ssh tunnel
```sh
sshpass -p [password] rsync -av -e ssh [utente]@[indirizzoip]:/directorydacopiare/ /directorydidestinazione
```

### Take a screenshot of x11 over ssh pipe to view on a mac in one line
```sh
ssh user@host.com "DISPLAY=:0.0 import -window root png:-" | open -a /Applications/Preview.app -f
```

### Generate SSH key
```sh
ssh-keygen -t rsa -b 4096 -f ~/.ssh/<ROLE>_rsa -C "Comment goes here"
```

### Anonymous ssh using tor proxy (or any socks based proxy)
```sh
ssh -o ProxyCommand="nc -X 5 -x localhost:9050 %h %p" username@remote_host
```

### SSH with debug to troubleshoot any connection issues
```sh
ssh -v jsmith@remotehost.example.com
```

### Convert an ssh2 public key to openssh format
```sh
ssh-keygen -i -f $sshkeysfile >> authorized_keys
```

### execute/start some scripts on a remote machine/server (which will terminate automatically) and disconnect from the server
```sh
ssh remoteserver 'nohup /path/to/script `</dev/null` >nohup.out 2>&1 &'
```



### Compare a remote file with a local file
```sh
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -
```

### SSH connection through host in the middle
```sh
ssh -t reachable_host ssh unreachable_host
```

### Remove invalid host keys from ~/.ssh/known_hosts
```sh
ssh-keygen -R \[localhost\]:8022
```

### back ssh from firewalled hosts
```sh
ssh -R 5497:127.0.0.1:22 -p 62220 user@public.ip
```

### SSH connection with private key and port 222
```sh
ssh -i /root/.ssh/username\@hostname -p 222 username@hostname
```

### Temporarily ignore known SSH hosts
```sh
ssh -o UserKnownHostsFile=/dev/null root@192.168.1.1
```

### Connect via SSH to VirtualBox guest VM without knowing IP address
```sh
ssh vm-user@`VBoxManage guestproperty get "vm-name" "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk '{ print $2 }'`
```
