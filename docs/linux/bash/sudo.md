# sudo 

### Run the last command as root
```sh
sudo !!
```

### Run the last command as root
```sh
sudo !!
```

### Run the last command as root
```sh
sudo !!
```

### Run a file system check on your next boot.
```sh
sudo touch /forcefsck
```

### Run a file system check on your next boot.
```sh
sudo touch /forcefsck
```

### Install 4 new package files
```sh
sudo dpkg -i `ls -tr *.deb | tail -n4`
```

### how to scp to another pc on network
```sh
sudo scp <file or folder> <name of pc 1>@<IP of pc 2>:
```

### what model of computer I'm using?
```sh
sudo dmidecode -s system-product-name
```

### Use tcpdump to monitor all DNS queries and responses
```sh
sudo tcpdump -i en0 'udp port 53'
```

### list all world-writeable Linux files
```sh
sudo find / -perm -2 ! -type l -ls
```

### tcptraceroute alternative for udp packets
```sh
sudo hping3 -TV tr-stop -n -2 -p 53 ns1.server.tld
```

### Capture all tcp and udp packets in LAN, except packets coming to localhost (192.168.1.2)
```sh
sudo tcpdump -n -i eth0 -w data.pcap -v tcp or udp and 'not host 192.168.1.2'
```

### mac address change
```sh
sudo ifconfig mlan0 down; sudo ifconfig mlan0 hw ether 00:10:10:10:08:88; sudo ifconfig mlan0 up;
```

### Getting OpenPGP keys for Launchpad PPAs on Debian based systems from behind a firewall
```sh
sudo apt-key adv keyserver hkp://keys.gnupg.net:80 recv-keys [key to get here]
```

### Change your timezone
```sh
sudo cp /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

### list files/directories in current directory  sorted by file size in MB
```sh
sudo du -sm * | sort -n
```

### Run the last command as root
```sh
sudo $(history -p !!)
```

### Let yourself read the logs under /var/log/apache2 (on Debian)
```sh
sudo usermod -a -G adm "$(whoami)"
```

### Check if loopback network interface is working
```sh
sudo tcpdump -i lo -nv ip
```

### OS X: flush DNS cache
```sh
sudo killall -HUP mDNSResponder
```

### Change my shell to zsh
```sh
sudo usermod -s `which zsh` `whoami`
```

### Make Ubuntu Phone root image read/write until reboot
```sh
sudo mount -o remount,rw /
```

### Switch to rc-proposed channel on Ubuntu Phone - Nexus 4
```sh
sudo system-image-cli switch ubuntu-touch/rc-proposed/ubuntu build 0
```

### Clear disk space by retaining only currently running Docker containers and only currently required Docker images.
```sh
sudo docker rm $(sudo docker ps -q -f status=exited); sudo docker rmi $(sudo docker images -q -f dangling=true)
```

### Displays All TCP and UDP Connections
```sh
sudo netstat|head -n2|tail -n1 && sudo netstat -a|grep udp && echo && sudo netstat|head -n2|tail -n1 && sudo netstat -a|grep tcp
```

### Recursive Ownership Change
```sh
sudo chown -R user2:user2 /../../somedirectory
```

### check to see what is running on a specific port number
```sh
sudo netstat -tulpn | grep :8080
```

### recursive permission set for xampp apache user nobody
```sh
sudo chown -R nobody:admin /Applications/XAMPP/xamppfiles/htdocs/
```

### url sniffing
```sh
sudo urlsnarf -i wlan0
```

### Update iptables firewall with a temp ruleset
```sh
sudo iptables-restore < /etc/iptables.test.rules
```

### Add Ubuntu Launchpad PPA and its PGP keys at the same time
```sh
sudo add-apt-repository ppa:PPA_TO_ADD
```

### Uninstall all MacPorts that are no longer active
```sh
sudo port installed | grep -v 'active\|The' | xargs sudo port uninstall
```

### Install a remote RPM
```sh
sudo rpm -if "http://rpm_server/rpm_repo/this-app.rpm"
```

### Once Guest Additions are installed (Virtualbox), we need to make sure that the various components of this software are loaded automatically each time the system boots.
```sh
sudo nano /etc/modules-load.d/virtualbox.conf
```

### Use this command to reboot the pc in linux
```sh
sudo reboot
```

### Enable lxdm login manager in linux
```sh
sudo systemctl enable lxdm
```

### tail all logs opened by all java processes
```sh
sudo ls -l $(eval echo "/proc/{$(echo $(pgrep java)|sed 's/ /,/')}/fd/")|grep log|sed 's/[^/]* //g'|xargs -r tail -f
```

### restart Bluetooth from terminal
```sh
sudo service bluetooth restart
```

### Discover media files from a web page
```sh
sudo ngrep -lqi -p -W none ^get\|^post tcp dst port 80 -d eth0 | egrep '(flv|mp4|m4v|mov|mp3|wmv)'
```

### Upgrade Node.js via NPM
```sh
sudo npm cache clean -f | sudo npm install -g n | sudo n stable
```

### Enabling some DVD playback enhancements in Ubuntu
```sh
sudo sh /usr/share/doc/libdvdread4/install-css.sh
```

### Disable annoying sound emanations from the PC speaker
```sh
sudo rmmod pcspkr
```

### Print the local ip on a wireless connection
```sh
sudo ifconfig wlan0 | grep inet | awk 'NR==1 {print $2}' | cut -c 6-
```

### Remove all unused kernels with apt-get
```sh
sudo aptitude remove -P $(dpkg -l|awk '/^ii  linux-image-2/{print $2}'|sed 's/linux-image-//'|awk -v v=`uname -r` 'v>$0'|sed 's/-generic//'|awk '{printf("linux-headers-%s\nlinux-headers-%s-generic\nlinux-image-%s-generic\n",$0,$0,$0)}')
```

### Mac OS X (laptops ??) only :  control hibernation state more easily from Terminal.app
```sh
sudo pmset -a hibernatemode 1
```

### if you want the script run at reboot
```sh
sudo update-rc.d -f nomemioscript start 99 2 3 4 5
```

### if you want the script run at shutdown
```sh
sudo update-rc.d -f nomescript stop 90 0 6
```

### Enable passwordless login
```sh
sudo usermod -p $(mkpasswd '') user_id
```

### View your motherboard's ACPI tables (in Debian & Ubuntu)
```sh
sudo aptitude -y install iasl && sudo cat /sys/firmware/acpi/tables/DSDT > dsdt.dat && iasl -d dsdt.dat
```

### Clear Cached Memory on Ubuntu
```sh
sudo sync && sudo echo 3 | sudo tee /proc/sys/vm/drop_caches
```

### ...if you have sudo access, you could just install ssh-copy-id (Mac users: take note.  this is how you install ssh-copy-id )
```sh
sudo curl "http://hg.mindrot.org/openssh/raw-file/c746d1a70cfa/contrib/ssh-copy-id" -o /usr/bin/ssh-copy-id  &&  sudo chmod 755 /usr/bin/ssh-copy-id
```

### Shred an complete disk, by overwritting its content 10 times
```sh
sudo shred -zn10 /dev/sda
```

### List your sudo rights
```sh
sudo -l
```

### Mount a Windows share on the local network (Ubuntu)
```sh
sudo mount -t cifs //$ip_or_host/$sharename /mnt
```

### Mount a Windows share on the local network (Ubuntu) with user rights and use a specific samba user
```sh
sudo mount -t cifs -o credentials=/path/to/credenials //hostname/sharename /mount/point
```

### Show live HTTP requests being made on OS X
```sh
sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"
```

### how to Disable a guest user from the login panel Xubuntu
```sh
sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-no-guest.conf'; sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" >/usr/share/lightdm/lightdm.conf.d/50-guest-wrapper.conf'
```

### List ReverseSSH ports
```sh
sudo lsof -i -n | grep sshd | grep sshuser | grep :[PORT-RANGE] | grep -v IPv6 | awk -F\: '{print $2}' | grep -v http | awk -F" " '{print $1}'
```

### Check if TCP port 25 is open
```sh
sudo lsof -iTCP:25
```

### Get ethX mac addresses
```sh
sudo ifconfig -a | grep eth | grep HW | cut -d' ' -f11
```

### Fix grub2 boot failure using live cd
```sh
sudo grub-install root-directory=/media/ubuntu /dev/sda
```

### set the time of system
```sh
sudo date mmddhhxxyyyy
```

### Changing Hostname on Mac OS X
```sh
sudo scutil set HostName MY_NEW_HOSTNAME
```

### don't auto run gdm
```sh
sudo update-rc.d -f gdm remove
```

### open ports with iptables
```sh
sudo iptables -I INPUT -p tcp dport 3000 -j ACCEPT
```

### I am using a desktop?
```sh
sudo hal-get-property udi /org/freedesktop/Hal/devices/computer key 'system.formfactor'
```

### Get the size of all the directories in current directory (Sorted Human Readable)
```sh
sudo du -ks $(ls -d */) | sort -nr | cut -f2 | xargs -d '\n' du -sh 2> /dev/null
```

### ARP Scan
```sh
sudo arp-scan -l
```

### 32 bits or 64 bits?
```sh
sudo lshw -C cpu|grep width
```

### uninstall Air on Ubuntu
```sh
sudo dpkg -P  $(dpkg -l | grep -i adobeair)
```

### Convert .wav audio files to .gsm forman
```sh
sudo sox <file name>.wav -r 8000 <file name>.gsm
```

### Convert .wav audio files to .gsm format
```sh
sudo sox <file name>.wav -r 8000 <file name>.gsm
```

### Save iptables firewall info
```sh
sudo iptables-save > /etc/iptables.up.rules
```

### Mount an external FAT32 USB HDD
```sh
sudo mount -t vfat /dev/sdb1 /mnt/sdb1
```

### sudo for launching gui apps in background
```sh
sudo ls ; sudo gedit /etc/passwd &
```

### Suspend to ram
```sh
sudo /etc/acpi/sleep.sh sleep
```

### Send packet by ping
```sh
sudo ping -f -c 999 -s 4500 target.com
```

### Mount a Windows share on the local network (Ubuntu) with user rights and use a specific samba user
```sh
sudo mount -t cifs -o user,username="samba username" //$ip_or_host/$sharename /mnt
```

### Enable Hibernate in OS X
```sh
sudo pmset -a hibernatemode 1
```

### Shows users and 'virtual users' on your a unix-type system
```sh
sudo lsof|sed 's/  */ /g'|cut -f3 -d' '|sort -u
```

### Wait a moment and then Power off
```sh
sudo shutdown 3600 -P
```

### Find files that have been modified on your system in the past 60 minutes
```sh
sudo find / -mmin 60 -type f
```

### Stop procrastination on Facebook.com
```sh
sudo sh -c "echo '127.0.0.1 www.facebook.com' >> /etc/hosts"
```

### Chmod directories to add executable & read permission to the group safely
```sh
sudo chmod -R g=u-w,g+X *
```

### Remove packages by pattern on debian and based systems
```sh
sudo apt-get remove purge `dpkg -l | awk '{print $2}' | grep gnome` && apt-get autoremove
```

### convert .rpm to .deb using alien
```sh
sudo alien to-deb Your_PackAge.rpm
```

### Starting the VPN service
```sh
sudo service vpnclient_init start
```

### add fn brightness on notebook
```sh
sudo update-grub
```

### reloads sound when it stop playing
```sh
sudo alsa force-reload
```

### detected hardware and boot messages
```sh
sudo dmesg
```

### Use a decoy while scanning ports to avoid getting caught by the sys admin :9
```sh
sudo nmap -sS 192.168.0.10 -D 192.168.0.2
```

### Install NMAP 5.0 ,Short and sweet command to do it
```sh
sudo wget -c "http://nmap.org/dist/nmap-5.00.tar.bz2" && bzip2 -cd nmap-5.00.tar.bz2 | tar xvf - && cd nmap-5.00 && ./configure && make && sudo make install
```

### Install a deb package
```sh
sudo dpkg -i packagename.deb
```

### Prefetch like apple devices
```sh
sudo apt-get install preload
```

### Clean upgrade of Ubuntu
```sh
sudo sh -c "apt-get update;apt-get dist-upgrade;apt-get autoremove;apt-get autoclean"
```

### installing sublime-text-2 on Ubuntu 10.04
```sh
sudo -i; add-apt-repository ppa:webupd8team/sublime-text-2; apt-get update; apt-get install sublime-text-2
```

### analyze traffic remotely over ssh w/ wireshark
```sh
sudo ssh -Y remoteuser@remotehost sudo wireshark
```

### Start a new shell as root
```sh
sudo su
```

### restart network manager
```sh
sudo /etc/init.d/networking restart
```

### Adobe Updater Crashes on Mac OS X Fix
```sh
sudo /Applications/Utilities/Adobe\ Utilities.localized/Adobe\ Updater5/Adobe\ Updater.app/Contents/MacOS/Adobe\ Updater
```

### Disable Ubuntu Notification
```sh
sudo chmod -x /usr/lib/notify-osd/notify-osd
```

### How To Install Microsoft Text Fonts In Ubuntu Linux
```sh
sudo apt-get install msttcorefonts
```

### What is the sound of your memory ?
```sh
sudo cat /dev/mem > /dev/dsp
```

### system update
```sh
sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean
```

### Determine what an process is actually doing
```sh
sudo strace -pXXXX -e trace=file
```

### connect via ssh using mac address
```sh
sudo arp -s 192.168.1.200  00:35:cf:56:b2:2g temp && ssh root@192.168.1.200
```

### Run the previous command with sudo
```sh
sudo !!
```

### Simulate slow network connection locally
```sh
sudo tc qdisc add dev lo root netem delay 500ms
```

### Does a full update and cleaning in one line
```sh
sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove
```

### View files opened by a program on startup and shutdown
```sh
sudo lsof -rc command >> /tmp/command.txt
```

### Disable the ping response
```sh
sudo -s "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all"
```

### Protect directory from an overzealous rm -rf *
```sh
sudo chattr -R +i dirname
```

### Change tha mac adresse
```sh
sudo ifconfig eth0 hw ether 00:01:02:03:04:05
```

### Refresh the cache of font directory
```sh
sudo fc-cache -f -v
```

### what model of computer I'm using?
```sh
sudo hal-get-property udi /org/freedesktop/Hal/devices/computer key 'system.hardware.product'
```

### Remount root in read-write mode.
```sh
sudo mount -o remount,rw /
```

### Clone IDE Hard Disk
```sh
sudo dd if=/dev/hda1 of=/dev/hdb2
```

### A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
```sh
sudo strings /dev/mem
```

### network usage per process
```sh
sudo nethogs eth0
```

### Install a LAMP server in a Debian based distribution
```sh
sudo tasksel install lamp-server
```

### set your ssd disk as a non-rotating medium
```sh
sudo echo 0 > /sys/block/sdb/queue/rotational
```

### dd with progress bar and statistics to gzipped image
```sh
sudo dd if=/dev/sdc bs=4096 | pv -s  `sudo mount /dev/sdc /media/sdc && du -sb /media/sdc/ |awk '{print $1}' && sudo umount /media/sdc`| sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG
```

### Erase to factory a pendrive, disk or memory card, and watch the progress
```sh
sudo shred -vz -n 0 /dev/sdb
```

### Sync the date of one server to that of another.
```sh
sudo date -s  "$(ssh user@server.com "date -u")"
```

### Switch to a user with "nologin" shell
```sh
sudo -u username bash
```

### Auto Get Missing Launchpad Keys
```sh
sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg keyserver pool.sks-keyservers.net recv $key && gpg export armor $key |sudo apt-key add -; done
```

### Cap apt-get download speed
```sh
sudo apt-get -o Acquire::http::Dl-Limit=25 install <package>
```

### automount samba shares as devices in /mnt/
```sh
sudo vi /etc/fstab; Go//smb-share/gino /mnt/place smbfs defaults,username=gino,password=pass 0 0<esc>:wq; mount //smb-share/gino
```

### find unreadable file
```sh
sudo -u apache find . -not -readable
```

### show framebuffer console modes to use in grub vga option
```sh
sudo hwinfo framebuffer
```

### Find files with root setuids settings
```sh
sudo find / -user root -perm -4000 -print
```

### Mac Sleep Timer
```sh
sudo pmset schedule sleep "08/31/2009 00:00:00"
```

### BackTrack Repos
```sh
sudo apt-add-repository 'deb http://archive.offensive-security.com pwnsauce main microverse macroverse restricted universe multiverse' && wget -q http://archive.offensive-security.com/backtrack.gpg -O- | sudo apt-key add -
```

### List all process running a specfic port
```sh
sudo lsof -i :<port>
```

### Brute force discover
```sh
sudo zcat /var/log/auth.log.*.gz | awk '/Failed password/&&!/for invalid user/{a[$9]++}/Failed password for invalid user/{a["*" $11]++}END{for (i in a) printf "%6s\t%s\n", a[i], i|"sort -n"}'
```

### Limit the cpu usage of a process
```sh
sudo cpulimit -p pid -l 50
```

### Cleanup Docker
```sh
sudo docker rm $(docker ps -a -q); sudo docker rmi $(docker images -q)
```

### Run a command as root, with a delay
```sh
sudo bash -c "sleep 1h ; command"
```

### Install an mpkg from the command line on OSX
```sh
sudo installer -pkg /Volumes/someapp/someapp.mpkg -target /
```

### Show the UUID of a filesystem or partition
```sh
sudo vol_id -u /dev/sda1
```

### Cleanup debian/ubuntu package configurations
```sh
sudo dpkg-reconfigure -a
```

### Install Linux Kernel Headers
```sh
sudo apt-get install linux-headers-$(uname -r)
```

### sniff network traffic on a given interface and displays the IP addresses of the machines communicating with the current host (one IP per line)
```sh
sudo tcpdump -i wlan0 -n ip | awk '{ print gensub(/(.*)\..*/,"\\1","g",$3), $4, gensub(/(.*)\..*/,"\\1","g",$5) }' | awk -F " > " '{print $1"\n"$2}'
```

### Speed up upgrades for a debian/ubuntu based system.
```sh
sudo aptitude update; sudo apt-get -y print-uris upgrade | egrep -o -e "http://[^\']+" | sudo aria2c -c -d /var/cache/apt/archives -i -; sudo aptitude -y safe-upgrade
```

### Measure, explain and minimize a computer's electrical power consumption
```sh
sudo powertop
```

### Find all files with root SUID or SGID executables
```sh
sudo find / -type f \( -perm /4000 -a -user root \) -ls -o \( -perm /2000 -a -group root \) -ls
```

### Youtube-dl gone stale on you/stopped working (Ubuntu)?
```sh
sudo youtube-dl -U
```

### Disable WoL on eth0
```sh
sudo ethtool -s eth0 wol d
```

### list block devices
```sh
sudo lsblk -o name,type,fstype,label,partlabel,model,mountpoint,size
```

### Mount Fat USB with RWX
```sh
sudo mount -t vfat -o umask=000,uid=YOUR_UID,gid=users /dev/sdb1 /media/usb
```

### Watch memcache traffic
```sh
sudo tcpdump -i eth0 -s 65535 -A -ttt port 11211
```

### dd with progress bar and statistics
```sh
sudo dd if=/dev/sdc bs=4096 | pv -s 2G | sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG
```

### Remove all unused kernels with apt-get
```sh
sudo apt-get remove $(dpkg -l|awk '/^ii  linux-image-/{print $2}'|sed 's/linux-image-//'|awk -v v=`uname -r` 'v>$0'|sed 's/-generic*//'|awk '{printf("linux-headers-%s\nlinux-headers-%s-generic*\nlinux-image-%s-generic*\n",$0,$0,$0)}')
```

### Router discovery
```sh
sudo arp-scan 192.168.1.0/24 -interface eth0
```

### install all archive file type apps in ubuntu
```sh
sudo apt-get install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller
```

### Mac OS X: remove extra languages to save over 3 GB of space.
```sh
sudo find / -iname "*.lproj" -and \! -iname "en*" -print0 | tee /dev/stderr | sudo xargs -0 rm -rfv
```

### To get  internet connection information .
```sh
sudo /bin/netstat -tpee
```

### Set Time Zone in Ubuntu
```sh
sudo dpkg-reconfigure tzdata
```

### Show an application's environment variables
```sh
sudo sed 's/\o0/\n/g' "/proc/$(pidof -x firefox)/environ" ;# replace firefox
```

### How many Linux and Windows devices are on your network?
```sh
sudo nmap -F -O 192.168.1.1-255 | grep "Running: " > /tmp/os; echo "$(cat /tmp/os | grep Linux | wc -l) Linux device(s)"; echo "$(cat /tmp/os | grep Windows | wc -l) Window(s) devices"
```

### dd with progress bar and statistics
```sh
sudo pv -tpreb /path/to/source | sudo dd bs=4096 of=/path/to/destination
```

### GRUB2: set Super Mario as startup tune
```sh
sudo bash -c 'echo "GRUB_INIT_TUNE=\"480 165 2 165 2 165 3 554 1 587 1 554 2 370 1 554 1 523 2 349 1 523 1 494 3 165 2 165 2 165 2\"" >> /etc/default/grub && update-grub'
```

### Determine whether a CPU has 64 bit capability or not
```sh
sudo dmidecode type=processor | grep -i -A 1 charac
```

### Ad blocking on Ubuntu phone/tablet with hosts file
```sh
sudo mount -o remount,rw / && sudo cp /etc/hosts /etc/hosts.old && wget http://winhelp2002.mvps.org/hosts.txt && cp /etc/hosts ~/ && cat hosts.txt >> hosts && sudo cp hosts /etc/hosts
```

### Lists the supported memory types and how much your board can support.
```sh
sudo dmidecode -t 5,16
```

### list all opened ports on host
```sh
sudo lsof -P -i -n -sTCP:LISTEN
```

### Benchmark a hard drive
```sh
sudo hdparm -Tt /dev/sda
```

### Disable sleep mode via cli and systemd (Centos, Debian Ubuntu?)
```sh
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

### Remove all old kernels
```sh
sudo apt-get purge $(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve "$(uname -r | sed -r 's/-[a-z]+//')")
```

### create an emergency swapfile when the existing swap space is getting tight
```sh
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024000;sudo mkswap /swapfile; sudo swapon /swapfile
```

### Make sudo forget password instantly
```sh
sudo -K
```

### Root shell
```sh
sudo -i
```

### Move all files between to date
```sh
sudo find . -maxdepth 1 -cnewer olderFilesNameToMove -and ! -cnewer newerFileNameToMove -exec mv -v {} /newDirectory/ \;
```

### Find the fastest server to disable comcast's DNS hijacking
```sh
sudo netselect -v -s3 $(curl -s http://dns.comcast.net/dns-ip-addresses2.php | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq)
```

### Fix VirtualBox error
```sh
sudo usermod -a -G vboxusers <username>
```

### Change the default editor for modifying the sudoers list.
```sh
sudo update-alternatives config editor
```

### Install a Firefox add-on/theme to all users
```sh
sudo firefox -install-global-extension /path/to/add-on
```

### To find the count of each open file on a system (that supports losf)
```sh
sudo lsof | awk '{printf("%s %s %s\n", $1, $3, $NF)}' | grep -v "(" | sort -k 4 | gawk '$NF==prv{ct++;next} {printf("%d %s\n",ct,$0);ct=1;prv=$NF}' | uniq | sort -nr
```

### Suspend to ram
```sh
sudo pm-suspend
```

### How to search for files and open all of them in tabbed vim editor.
```sh
sudo find / -type f -name config.inc.php -exec vim -p {} +
```

### Debian: Mark all dependent packages as manualy installed.
```sh
sudo aptitude unmarkauto $(apt-cache depends some-deb-meta-package-name | grep Depends | cut -d: -f2)
```

### Install Restricted Multimedia Codecs in Ubuntu 14.04
```sh
sudo apt-get install libavcodec-extra
```

### Show the key code for keyboard events include the Fn keys
```sh
sudo showkey -k
```

### get diskusage of files modified during the last n days
```sh
sudo find /var/log/ -mtime -7 -type f | xargs du -ch | tail -n1
```

### Drop or block attackers IP with null routes
```sh
sudo route add xxx.xxx.xxx.xxx gw 127.0.0.1 lo
```

### View user activity per directory.
```sh
sudo lsof -u someuser -a +D /etc
```

### Limit bandwidth usage by apt-get
```sh
sudo apt-get -o Acquire::http::Dl-Limit=30 upgrade
```

### Setting reserved blocks percentage to  1%
```sh
sudo tune2fs -m 1 /dev/sda4
```

### Install Linux Kernel Headers on Debian-based systems
```sh
sudo apt-get install linux-headers-`uname -r`
```

### Rolling upgrades via aptitude
```sh
sudo sh -c "aptitude update; aptitude -DrVWZ full-upgrade; aptitude autoclean; exit"
```

### Null a file with sudo
```sh
sudo bash -c "> /var/log/httpd/access_log"
```

### apt-get upgrade with bandwidth limit
```sh
sudo apt-get -o Acquire::http::Dl-Limit=20 -o Acquire::https::Dl-Limit=20 upgrade -y
```

### remove oprhan package on debian based system
```sh
sudo deborphan | xargs sudo apt-get -y remove purge
```

### Reinstall Grub
```sh
sudo grub-install recheck /dev/sda1
```

### Get the Volume labels all bitlocker volumes had before being encrypted
```sh
sudo echo "BitLocker Volume labels:" && sudo dislocker-find | xargs -I{} sh -c 'echo -n "{} ->+ " ; sudo dislocker-metadata -V {} | grep string' | sed 's/+.*string://' | sed "s/'[^ ]* /\"/g" | sed 's/\ [^ ]*$/"/'
```

### purge all packages marked with 'rc'
```sh
sudo dpkg purge `dpkg -l | awk '/^r/{print $2}'`
```

### View any already in progress copy command in detail
```sh
sudo lsof -p1234 | grep -E "(3r|4w).*REG"
```

### cpu info
```sh
sudo dmidecode -t processor
```

### Recover deleted Binary files
```sh
sudo foremost -i /dev/sda -o /recovery
```

### Write a listing of all directories and files on the computer to a compressed file.
```sh
sudo ls -RFal / | gzip > all_files_list.txt.gz
```

### Adding a startup script to be run at bootup Ubuntu
```sh
sudo update-rc.d <scriptname> defaults
```

### Find the 10 users that take up the most disk space
```sh
sudo -s du -sm /Users/* | sort -nr | head -n 10
```

### Mount a VMware virtual disk (.vmdk) file on a Linux box
```sh
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs
```

### Set blanket packet/second limit on network interface for Ubuntu VPS server
```sh
sudo iptables -A INPUT -m limit limit 2000/sec -j ACCEPT && sudo iptables -A INPUT -j DROP
```

### Kill all processes that listen to ports begin with 50 (50, 50x, 50xxx,...)
```sh
sudo netstat -plnt | awk '($4 ~ /:50$/){sub(/\/.*/, "", $7); system("sudo kill " $7)}'
```

### Print the detailed statistics of transferred bytes by the firewall rules
```sh
sudo iptables -L -nv
```

### Restrict the use of dmesg for current user/session
```sh
sudo sh -c 'echo 1 > /proc/sys/kernel/dmesg_restrict'
```

### Watch postgresql calls from your application on localhost
```sh
sudo tcpdump -nnvvXSs 1514 -i lo0 dst port 5432
```

### Change attributes of files so you can edit them
```sh
sudo chattr -i <file that cannot be modified>
```

### view the system console remotely
```sh
sudo cat /dev/vcs1 | fold -w 80
```

### Browse system RAM in a human readable form
```sh
sudo cat /proc/kcore | strings | awk 'length > 20' | less
```

### Backup your hard drive with dd
```sh
sudo dd if=/dev/sda of=/media/disk/backup/sda.backup
```

### Upgrading packages.  Pacman can update all packages on the system with just one command. This could take quite a while depending on how up-to-date the system is. This command can synchronize the repository databases and update the system's packages.
```sh
sudo pacman -Syu
```

### Install a new kernel in Manjaro linux
```sh
sudo mhwd-kernel linux00
```

### Clean pacman cache in arch linux, manjaro linux
```sh
sudo pacman -Scc
```

### find unreadable file
```sh
sudo -u apache find . -not -perm /o+r
```

### Get all available packages on Ubuntu (or any distro that uses apt)
```sh
sudo apt-cache dumpavail | grep Package | cut -d ' ' -f 2 > available.packages
```

### Startup a VPN connection through command line
```sh
sudo nmcli con up/down id vpn-name
```

### Preserve user variables when running commands with sudo.
```sh
sudo -E rpm -Uvh "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
```

### Gathering all MAC's in your local network
```sh
sudo arp-scan interface=eth0 -l
```

### Display standard information about device
```sh
sudo  ethtool -i eth0
```

### Fix for error perl: warning: Setting locale failed.
```sh
sudo locale-gen en_GB.UTF-8 && sudo locale-gen purge && sudo dpkg-reconfigure locales
```

### A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
```sh
sudo dd if=/dev/mem | cat | strings
```

### A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
```sh
sudo dd if=/dev/mem | cat | strings
```

### easily trace all Nginx processes
```sh
sudo strace -e trace=network -p `pidof nginx | sed -e 's/ /,/g'`
```

### Spoof your wireless MAC address on OS X to 00:e2:e3:e4:e5:e6
```sh
sudo ifconfig en1 ether 00:e2:e3:e4:e5:e6
```

### Find installed network devices
```sh
sudo lshw -C network
```

### Enable verbose boot in Mac OS X Open Firmware
```sh
sudo nvram boot-args="-v"
```

### swap the java version being used
```sh
sudo update-alternatives config java
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
sudo lsof | egrep 'w.+REG' | awk '{print $10}' | sort | uniq -c | sort -n
```

### USE WITH CAUTION: perminately delete old kernel packages
```sh
sudo apt-get remove purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d')
```

### Fix Ubuntu's Broken Sound Server
```sh
sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &
```

### Check Ram Speed and Type in Linux
```sh
sudo dmidecode type 17 | more
```

### Mount a truecrypt drive from a file from the command line interactively
```sh
sudo truecrypt <truecrypt-file> <mount-point>
```

### Get the size of all the directories in current directory
```sh
sudo du -sh $(ls -d */) 2> /dev/null
```

### take a screenshot of a webpage
```sh
sudo xvfb-run server-args="-screen 0, 1024x768x24" ./webkit2png.py -o google.png http://www.google.com
```

### Export MySQL tables that begin with a string
```sh
sudo mysql -sNe 'show tables like "PREFIX_%"' DBNAME | xargs sudo mysqldump DBNAME > /tmp/dump.sql
```

### Wich program is listen on port OSX
```sh
sudo lsof -i -n -P | grep TCP
```

### Get Dell Service Tag Number from a Dell Machine
```sh
sudo dmidecode | grep Serial\ Number | head -n1
```

### Remove any RPMs matching a pattern
```sh
sudo rpm -e `rpm -qa | grep keyword`
```

### Check if you work on a virtual/physical machine in Linux
```sh
sudo dmidecode | grep Product
```

### run last command with root
```sh
sudo !!
```

### How to speedup the Ethernet device
```sh
sudo ethtool -s eth0 speed 100 duplex full
```

### Run the last command as root
```sh
sudo !-1
```

### Fix the vi zsh bindings on ubuntu
```sh
sudo sed -iorig '/\(up\|down\)/s/^/#/' /etc/zsh/zshrc
```

### Find all active ip's in a subnet
```sh
sudo arp-scan -I eth0 192.168.1.0/24
```

### Show DeviceMapper names for LVM Volumes (to disambiguate iostat logs, etc)
```sh
sudo lvdisplay |awk '/LV Name/{blockdev=$3} /Block device/{bdid=$3; sub("[0-9]*:","dm-",bdid); print bdid,blockdev;}'
```

### Display error pages in report format
```sh
sudo awk '($9 ~ /404/)' /var/log/httpd/www.domain-access_log | awk '{print $2,$9,$7,$11}' | sort | uniq -c
```

### Clean apt-get and gpg cache and keys
```sh
sudo gpg refresh-keys; sudo apt-key update; sudo rm -rf /var/lib/apt/{lists,lists.old}; sudo mkdir -p /var/lib/apt/lists/partial; sudo apt-get clean all; sudo apt-get update
```

### Purge configuration files of removed packages on  debian based systems
```sh
sudo aptitude purge `dpkg get-selections | grep deinstall | awk '{print $1}'`
```

### Show how old your linux OS installtion is
```sh
sudo tune2fs -l $(df -h / |(read; awk '{print $1; exit}')) | grep -i created
```

### what model of computer I'm using?
```sh
sudo dmidecode | grep Product
```

### List open sockets protocol/address/port/state/PID/program name
```sh
sudo netstat -punta
```

### list any Linux files without users or groups
```sh
sudo find / \( -nouser -o -nogroup \)
```

### Mark packages installed with build-dep for autoremove (on Debian/Ubuntu)
```sh
sudo aptitude markauto $(apt-cache showsrc PACKAGE | grep Build-Depends | perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g')
```

### Safely remove old unused kernels in Ubuntu/Debian
```sh
sudo aptitude purge ~ilinux-image-\[0-9\]\(\!`uname -r`\)
```

### Make a file not writable / immutable by root
```sh
sudo chattr +i <file>
```

### Throttling Bandwidth On A Mac
```sh
sudo ipfw pipe 1 config bw 50KByte/s;sudo ipfw add 1 pipe 1 src-port 80
```

### Force GNU/Linux keyboard settings, layout and configuration
```sh
sudo dpkg-reconfigure keyboard-configuration
```

### Display IP : Count of failed login attempts
```sh
sudo lastb | awk '{if ($3 ~ /([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}/)a[$3] = a[$3]+1} END {for (i in a){print i " : " a[i]}}' | sort -nk 3
```

### hibernate
```sh
sudo pm-hibernate
```

### Use tagged vlans
```sh
sudo vconfig add eth0 [VID]
```

### dhcdrop - testing/suppression/tracking false DHCP servers
```sh
sudo dhcdrop -i eth1 -y -l 00:11:22:33:44:55
```

### Remove old kernels and header data in Ubuntu/Debian
```sh
sudo apt-get -y purge $(dpkg get-selections | awk '((/^linux-/) && (/[0-9]\./) && (!/'"`uname -r | sed "s/-generic//g"`"'/)) {print $1}')
```

### Installs lamp on Ubuntu
```sh
sudo apt-get  install lamp-server^ phpmyadmin
```

### Install build dependencies for a given package
```sh
sudo apt-get build-dep rhythmbox
```

### Kill all processes that listen to ports begin with 50 (50, 50x, 50xxx,...)
```sh
sudo netstat -plnt | grep :50 | awk '{print $7}' | awk -F/ '{print $1}' | xargs kill -9
```

### Route some ips (or domain names) over VPN
```sh
sudo /sbin/route add -host 192.168.12.50 -interface ppp0
```

### Kill all processes belonging to a user
```sh
sudo -u $USER kill -9 -1
```

### the first command i type on fresh ubuntu
```sh
sudo apt-get install aptitude
```

### Add another tty device using mknod command
```sh
sudo mknod /dev/ttyS4 c 4 68
```

### Hibernate after 30minutes
```sh
sudo bash -c "sleep 30m; pm-hibernate"
```

### Ettercap MITM
```sh
sudo ettercap -T -Q -M arp -i wlan0 // //
```

### macports update
```sh
sudo port selfupdate ; echo '-' ; sudo port upgrade outdated
```

### Change directories using sudo
```sh
sudo bash -c "cd /PATH/TO/THE/DIRECTORY;bash"
```

### sync repository and do install
```sh
sudo apt-fast update && sudo apt-fast -y dist-upgrade
```

### Command used to sync arch ro manjaro mirrors
```sh
sudo pacman-mirrors -g
```

### dpkg: purge all packages matching some name
```sh
sudo dpkg -P $(sudo dpkg -l yourPkgName* | awk '$2 ~ /yourPkgName.*/' | awk '$1 ~ /.i/' | awk '{print $2}')
```

### Find directories with lots of files in them
```sh
sudo find / -type f | perl -MFile::Basename -ne '$counts{dirname($_)}++; END { foreach $d (sort keys %counts) {printf("%d\t%s\n",$counts{$d},$d);} }'|sort -rn | tee /tmp/sortedfilecount.out | head
```

### To install guest additions in arch or manjaro linux, run the following command:
```sh
sudo pacman -S virtualbox-guest-utils
```

### restart session
```sh
sudo restart lightdm
```

### Delete duplicated dictionaries in spell check list
```sh
sudo find /usr/share/hunspell/ -lname '*' -delete
```

### dpkg: purge all packages matching some name
```sh
sudo dpkg -P $(dpkg -l yourPkgName* | awk '$2 ~ /yourPkgName.*/ && $1 ~ /.i/ {print $2}')
```

### Disabling Spotlight on Mac OS
```sh
sudo mdutil -a -i off
```

### progress bar while using dd
```sh
sudo dd if=file.iso |pv| sudo dd of=/dev/sdX
```

### make pretty the netstat output for listening services
```sh
sudo netstat -plntu inet | sort -t: -k2,2n | sort stable -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | sort -s -t" " -k1,1
```

### Change user's password
```sh
sudo passwd <username>
```

### Look for the process bound to a certain port
```sh
sudo netstat -tulpn | grep :8080
```

### List wireless clients connected to an access point
```sh
sudo netdiscover -r 192.168.1.0/24 -i wlo1
```

### See who's connected to your network =D
```sh
sudo netdiscover -r 192.168.1.0/24 -iwlo1
```

### Install mysql-2.8.1 rubygem on Mac OS X 10.6 (Snow Leopard)
```sh
sudo env ARCHFLAGS="-arch x86_64" gem install mysql
```

### rescan SCSI bus
```sh
sudo apt-get install scsitools && sudo rescan-scsi-bus
```

### Find all hidden files in a directory
```sh
sudo find . -name '.*' \( -type d -exec find {} \; -prune -o -print \)
```

### Play music from pure data
```sh
sudo cat /usr/share/icons/*/*/* > /dev/dsp
```

### Switch on eeepc camera
```sh
sudo echo 1 > /proc/acpi/asus/camera
```

### Startup Nessus and initialize plugins on backtrack5
```sh
sudo /opt/nessus/sbin/nessusd
```

### Extract a .gz file with privilege
```sh
sudo sh -c 'gunzip -c source.gz > destination'
```

### Backup /etc directory
```sh
sudo tar -zcvf $(hostname)-etc-back-`date +%d`-`date +%m`-`date +%y`.tar.gz /etc && sudo chown $USER:$USER $(hostname)-etc-back*
```

### Flush DNS
```sh
sudo /etc/init.d/dns-clean
```

### Twitter the geek way
```sh
sudo pip install rainbowstream && rainbowstream -iot
```

### sudo for launching gui apps in background
```sh
sudo -b xterm
```

### Delete all php package
```sh
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
```

### sudo ssh -D 88 -fN user@xxxx.no-ip.info
```sh
sudo ssh -D 88 -fN user@xxxx.no-ip.info
```

### Send SNMP traps
```sh
sudo snmptrap -m ALL -v 2c -c public trapserver "" UCD-DEMO-MIB::ucdDemoPublic SNMPv2-MIB::sysLocation.0 s "Just here"
```

### DD with progressbar using pv for backing up entire block device
```sh
sudo dd if=/dev/block/device bs=1MB | pv -s `sudo blockdev getsize64 /dev/block/device' | gzip -9 > output.img.gz
```

### Berechtigungen nach einer Referenz ?ndern
```sh
sudo chmod reference=Referenz.foo Datei.foo
```

### Find the mounted storages
```sh
sudo find . -name "syslog*.gz" -type f | xargs gzip -cd | grep "Mounted"
```

### View all file descriptors owned by a process
```sh
sudo lsof -p `sudo ps aux | grep -i neo4j | grep -v grep | awk '{ print $2 }'`
```

### Create a package list for offline download
```sh
sudo apt-get <apt-get command and options> print-uris -qq | sed -n "s/'\([^ ]\+\)' \([^ ]\+\) \([^ ]\+\) MD5Sum:\([^ ]\+\)/wget -c \1/p" > dowload_deb_list.txt
```

### Show counts of messages in exim mail queue, grouped by recipient
```sh
sudo /usr/sbin/exim -bp | sed -n '/\*\*\* frozen \*\*\*/,+1!p' | awk '{print $1}' | tr -d [:blank:] | grep @ | sort | uniq -c | sort -n
```

### Check if TCP port 25 is open
```sh
sudo lsof -iTCP:25 -sTCP:LISTEN
```

### Total space used by open but deleted files
```sh
sudo lsof -nP | awk '/deleted/ { sum+=$8 } END { print sum }'
```

### Find out which process uses an old lib and needs a restart after a system update
```sh
sudo lsof | grep 'DEL.*lib' | cut -f 1 -d ' ' | sort -u
```

### MTR command line to show jitter and mimic network traffic
```sh
sudo mtr -s 1472 -B 0 -oLDRSWNBAWVJMXI <ip address>
```

### Adding user to printer, after installing hp-lip (Debian)
```sh
sudo adduser [username] lp && sudo adduser [username] lpadmin && sudo hp-setup -i
```

### Synchronize date and time with a server
```sh
sudo ntpdate serverip
```

### creates a ppp link between my Ubuntu development machine and BeagleBoard running Android connected via USB
```sh
sudo `which adb` ppp "shell:pppd nodetach noauth noipdefault /dev/tty" nodetach noauth noipdefault notty 192.168.0.100:192.168.0.200
```

### Find and sort by Resident Size of each process on the system in MB
```sh
sudo ps aux sort:rss | awk '{print $2"\t"$11":  "$6/1024" MB"}' | column -t | less
```

### Sniff who are using wireless. Use wireshark to watch out.pcap :]
```sh
sudo ettercap -T -w out.pcap -i wlan0 -M ARP // //
```

### Reboot to Windows (UEFI)
```sh
sudo efibootmgr bootnext `efibootmgr | sed -n "s/^Boot\([0-9]\{4\}\)\* Windows Boot Manager$/\1/p"` && reboot
```

### Manage "legacy" service run control links
```sh
sudo find /etc/rc{1..5}.d -name S99myservice -type l -exec sh -c 'NEWFN=`echo {} | sed 's/S99/K99/'` ; mv -v {} $NEWFN' \;
```

### resume other user's screen session via su, without pty error
```sh
sudo -iu {user} script -qc 'screen {screen_args}' /dev/null
```

### Kill the X Server
```sh
sudo kill -9 $( ps -e | grep Xorg | awk '{ print $1 }' )
```

### Stop Grooveshark destroying your CPU
```sh
sudo cpulimit -e Grooveshark -l 20
```

### CPU Frequency/Speed Set
```sh
sudo cpupower frequency-set -g <frequency governor>
```

### Set date and time
```sh
sudo date -s "26 OCT 2008 19:30:00"
```

### Manual CPU Frequency/Speed/Clock Set
```sh
sudo cpupower frequency-set -f <frequency in MHz>
```

### detect partitions
```sh
sudo file -bs /dev/sda | sed -e 's/.*partition 1\(.*\) code offset.*/partition 1\1/g' -e 's/\(.\);/\1\n/g'
```

### Rename your Raspberry Pi
```sh
sudo sed -i 's/raspberrypi/pita1/' /etc/hosts /etc/hostname; sudo reboot
```

### Installation Ksuperkey by one command in Kubuntu.
```sh
sudo apt-get install git gcc make libx11-dev libxtst-dev pkg-config -y && git clone https://github.com/hanschen/ksuperkey.git && cd ksuperkey && make && sudo mv ksuperkey /usr/bin/ksuperkey && cd ~ && rm -rf ksuperkey
```

### Run skype using your GTK theme
```sh
sudo sed -i 's/Exec=skype %U/Exec=skype disable-cleanlooks -style GTK %U/' /usr/share/applications/skype.desktop
```

### List partition superblocks
```sh
sudo dumpe2fs /dev/sda1 | grep superblock
```

### Fix "Unknown media type in type" warnings when installing packages
```sh
sudo sh -c "rm /usr/share/mime/packages/kde.xml && update-mime-database /usr/share/mime"
```

### Macports update and clean all packages
```sh
sudo port selfupdate && sudo port upgrade outdated && sudo port clean all installed && sudo port -f uninstall inactive
```

### Information about RAM HW.
```sh
sudo dmidecode type 17
```

### Install dpkg packages
```sh
sudo dpkg -i *.deb
```

### Wait the set time and then Power off
```sh
sudo shutdown -h <hour:minute>
```

### Null a file with sudo
```sh
sudo tee /path/to/file < /dev/null
```

### Null a file with sudo
```sh
sudo tee /path/to/file < /dev/null
```

### Fix Chromium browser not starting
```sh
sudo aa-complain /etc/apparmor.d/usr.bin.chromium-browser
```

### Delete a certificate from the macOS security keychain
```sh
sudo security delete-certificate -c 1000-sans.badssl.com
```

### Clear DNS cache on a mac
```sh
sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

### Unlock the software var/lib/dpkg/lock
```sh
sudo fuser -vki /var/lib/dpkg/lock; sudo dpkg configure -a
```

### archlinux: remove a package completely from the system
```sh
sudo pacman -Rns packagename
```

### Shutdown ubuntu
```sh
sudo shutdown -h now
```

### Clear linux cache
```sh
sudo su; sync; echo 3 > /proc/sys/vm/drop_caches
```

### nmap check port
```sh
sudo nmap -sU -p 53 8.8.8.8
```

### creating an USB Image
```sh
sudo dd if=/your.img of=/dev/rdiskx bs=1m
```

### Create a nifty overview of the hardware in your computer
```sh
sudo lshw -html > /tmp/hardware.html && xdg-open /tmp/hardware.html
```

### Set APM_level for HDD to prevent frequent parking
```sh
sudo hdparm -B 200 /dev/sda
```

### Access to a SVN repository on a different port
```sh
sudo svn co svn+ ciccio_diverso://root@192.160.150.151/svn-repo/progettino
```

### Add a custom package repository to apt sources.list
```sh
sudo echo "package url" >> /etc/apt/sources.list
```

### archlinux: updates repository mirrors according to most up to date mirrors, then speed
```sh
sudo reflector -l 5 -r -o /etc/pacman.d/mirrorlist
```

### archlinux: clears package cache of uninstalled packages
```sh
sudo pacman -Sc
```

### archlinux: clear the package cache of all packages
```sh
sudo pacman -Scc
```

### Delete large amount of files matching pattern
```sh
sudo find . -name "*.csv" | xargs /bin/rm
```

### archlinux: remove a package completely from the system.
```sh
sudo pacman -Rns packagename
```

### Allows incoming traffic from specific IP address to port 80
```sh
sudo ufw allow proto tcp from 1.2.3.4 to any port 80
```

### Create user
```sh
sudo useradd -U -m -s /bin/bash new_user
```

### Make redirects to localhost via /etc/hosts more interesting
```sh
sudo socat TCP4-LISTEN:80,bind=127.0.0.1,fork EXEC:'echo "HTTP/1.1 503 Service Unavailable";'
```

### print indepth hardware info
```sh
sudo dmidecode | more
```

### MAMP: "Can't connect to local MySQL server through socket '/tmp/mysql.sock' (2)" solution
```sh
sudo ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock
```

### Get all ProcID's for a given process
```sh
sudo <PROC_NAME> -aux |grep pals_ |tr -s " " |cut -d " " -f2
```

### change directory permissions whithout changing file permissions recursive
```sh
sudo find foldername -type d -exec chmod 755 {} ";"
```

### change file permissions whithout changing directory permissions recursive
```sh
sudo find foldername -type f -exec chmod 644 {} ";"
```

### So you are not sure are connected and iither your router or ethernet card are not working.
```sh
sudo tcpdump -i eth0 -n port 67 and 68
```

### Add user to group on OS X 10.5
```sh
sudo dscl localhost -append /Local/Default/Groups/admin GroupMembership username
```

### Run the last command as root
```sh
sudo !!
```

### Run the last command as root
```sh
sudo !!
```

### Run a file system check on your next boot.
```sh
sudo touch /forcefsck
```

### Disable annoying sound emanations from the PC speaker
```sh
sudo rmmod pcspkr
```

### List your sudo rights
```sh
sudo -l
```

### Get the size of all the directories in current directory (Sorted Human Readable)
```sh
sudo du -ks $(ls -d */) | sort -nr | cut -f2 | xargs -d '\n' du -sh 2> /dev/null
```

### ARP Scan
```sh
sudo arp-scan -l
```

### 32 bits or 64 bits?
```sh
sudo lshw -C cpu|grep width
```

### Mount a Windows share on the local network (Ubuntu) with user rights and use a specific samba user
```sh
sudo mount -t cifs -o user,username="samba username" //$ip_or_host/$sharename /mnt
```

### Find files that have been modified on your system in the past 60 minutes
```sh
sudo find / -mmin 60 -type f
```

### Stop procrastination on Facebook.com
```sh
sudo sh -c "echo '127.0.0.1 www.facebook.com' >> /etc/hosts"
```

### Use a decoy while scanning ports to avoid getting caught by the sys admin :9
```sh
sudo nmap -sS 192.168.0.10 -D 192.168.0.2
```

### Determine what an process is actually doing
```sh
sudo strace -pXXXX -e trace=file
```

### connect via ssh using mac address
```sh
sudo arp -s 192.168.1.200  00:35:cf:56:b2:2g temp && ssh root@192.168.1.200
```

### Simulate slow network connection locally
```sh
sudo tc qdisc add dev lo root netem delay 500ms
```

### Does a full update and cleaning in one line
```sh
sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoclean && sudo apt-get autoremove
```

### View files opened by a program on startup and shutdown
```sh
sudo lsof -rc command >> /tmp/command.txt
```

### Disable the ping response
```sh
sudo -s "echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all"
```

### Protect directory from an overzealous rm -rf *
```sh
sudo chattr -R +i dirname
```

### Change tha mac adresse
```sh
sudo ifconfig eth0 hw ether 00:01:02:03:04:05
```

### Refresh the cache of font directory
```sh
sudo fc-cache -f -v
```

### what model of computer I'm using?
```sh
sudo hal-get-property udi /org/freedesktop/Hal/devices/computer key 'system.hardware.product'
```

### Remount root in read-write mode.
```sh
sudo mount -o remount,rw /
```

### Clone IDE Hard Disk
```sh
sudo dd if=/dev/hda1 of=/dev/hdb2
```

### A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
```sh
sudo strings /dev/mem
```

### network usage per process
```sh
sudo nethogs eth0
```

### Install a LAMP server in a Debian based distribution
```sh
sudo tasksel install lamp-server
```

### set your ssd disk as a non-rotating medium
```sh
sudo echo 0 > /sys/block/sdb/queue/rotational
```

### dd with progress bar and statistics to gzipped image
```sh
sudo dd if=/dev/sdc bs=4096 | pv -s  `sudo mount /dev/sdc /media/sdc && du -sb /media/sdc/ |awk '{print $1}' && sudo umount /media/sdc`| sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG
```

### Erase to factory a pendrive, disk or memory card, and watch the progress
```sh
sudo shred -vz -n 0 /dev/sdb
```

### Sync the date of one server to that of another.
```sh
sudo date -s  "$(ssh user@server.com "date -u")"
```

### Switch to a user with "nologin" shell
```sh
sudo -u username bash
```

### Auto Get Missing Launchpad Keys
```sh
sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg keyserver pool.sks-keyservers.net recv $key && gpg export armor $key |sudo apt-key add -; done
```

### Cap apt-get download speed
```sh
sudo apt-get -o Acquire::http::Dl-Limit=25 install <package>
```

### automount samba shares as devices in /mnt/
```sh
sudo vi /etc/fstab; Go//smb-share/gino /mnt/place smbfs defaults,username=gino,password=pass 0 0<esc>:wq; mount //smb-share/gino
```

### find unreadable file
```sh
sudo -u apache find . -not -readable
```

### show framebuffer console modes to use in grub vga option
```sh
sudo hwinfo framebuffer
```

### Find files with root setuids settings
```sh
sudo find / -user root -perm -4000 -print
```

### Mac Sleep Timer
```sh
sudo pmset schedule sleep "08/31/2009 00:00:00"
```

### BackTrack Repos
```sh
sudo apt-add-repository 'deb http://archive.offensive-security.com pwnsauce main microverse macroverse restricted universe multiverse' && wget -q http://archive.offensive-security.com/backtrack.gpg -O- | sudo apt-key add -
```

### List all process running a specfic port
```sh
sudo lsof -i :<port>
```

### Brute force discover
```sh
sudo zcat /var/log/auth.log.*.gz | awk '/Failed password/&&!/for invalid user/{a[$9]++}/Failed password for invalid user/{a["*" $11]++}END{for (i in a) printf "%6s\t%s\n", a[i], i|"sort -n"}'
```

### Limit the cpu usage of a process
```sh
sudo cpulimit -p pid -l 50
```

### Cleanup Docker
```sh
sudo docker rm $(docker ps -a -q); sudo docker rmi $(docker images -q)
```

### Run a command as root, with a delay
```sh
sudo bash -c "sleep 1h ; command"
```

### Install an mpkg from the command line on OSX
```sh
sudo installer -pkg /Volumes/someapp/someapp.mpkg -target /
```

### Show the UUID of a filesystem or partition
```sh
sudo vol_id -u /dev/sda1
```

### Cleanup debian/ubuntu package configurations
```sh
sudo dpkg-reconfigure -a
```

### Install Linux Kernel Headers
```sh
sudo apt-get install linux-headers-$(uname -r)
```

### sniff network traffic on a given interface and displays the IP addresses of the machines communicating with the current host (one IP per line)
```sh
sudo tcpdump -i wlan0 -n ip | awk '{ print gensub(/(.*)\..*/,"\\1","g",$3), $4, gensub(/(.*)\..*/,"\\1","g",$5) }' | awk -F " > " '{print $1"\n"$2}'
```

### Speed up upgrades for a debian/ubuntu based system.
```sh
sudo aptitude update; sudo apt-get -y print-uris upgrade | egrep -o -e "http://[^\']+" | sudo aria2c -c -d /var/cache/apt/archives -i -; sudo aptitude -y safe-upgrade
```

### Measure, explain and minimize a computer's electrical power consumption
```sh
sudo powertop
```

### Find all files with root SUID or SGID executables
```sh
sudo find / -type f \( -perm /4000 -a -user root \) -ls -o \( -perm /2000 -a -group root \) -ls
```

### Youtube-dl gone stale on you/stopped working (Ubuntu)?
```sh
sudo youtube-dl -U
```

### Disable WoL on eth0
```sh
sudo ethtool -s eth0 wol d
```

### list block devices
```sh
sudo lsblk -o name,type,fstype,label,partlabel,model,mountpoint,size
```

### Mount Fat USB with RWX
```sh
sudo mount -t vfat -o umask=000,uid=YOUR_UID,gid=users /dev/sdb1 /media/usb
```

### Watch memcache traffic
```sh
sudo tcpdump -i eth0 -s 65535 -A -ttt port 11211
```

### dd with progress bar and statistics
```sh
sudo dd if=/dev/sdc bs=4096 | pv -s 2G | sudo dd bs=4096 of=~/USB_BLACK_BACKUP.IMG
```

### Remove all unused kernels with apt-get
```sh
sudo apt-get remove $(dpkg -l|awk '/^ii  linux-image-/{print $2}'|sed 's/linux-image-//'|awk -v v=`uname -r` 'v>$0'|sed 's/-generic*//'|awk '{printf("linux-headers-%s\nlinux-headers-%s-generic*\nlinux-image-%s-generic*\n",$0,$0,$0)}')
```

### Router discovery
```sh
sudo arp-scan 192.168.1.0/24 -interface eth0
```

### install all archive file type apps in ubuntu
```sh
sudo apt-get install p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller
```

### Mac OS X: remove extra languages to save over 3 GB of space.
```sh
sudo find / -iname "*.lproj" -and \! -iname "en*" -print0 | tee /dev/stderr | sudo xargs -0 rm -rfv
```

### To get  internet connection information .
```sh
sudo /bin/netstat -tpee
```

### Set Time Zone in Ubuntu
```sh
sudo dpkg-reconfigure tzdata
```

### Show an application's environment variables
```sh
sudo sed 's/\o0/\n/g' "/proc/$(pidof -x firefox)/environ" ;# replace firefox
```

### How many Linux and Windows devices are on your network?
```sh
sudo nmap -F -O 192.168.1.1-255 | grep "Running: " > /tmp/os; echo "$(cat /tmp/os | grep Linux | wc -l) Linux device(s)"; echo "$(cat /tmp/os | grep Windows | wc -l) Window(s) devices"
```

### dd with progress bar and statistics
```sh
sudo pv -tpreb /path/to/source | sudo dd bs=4096 of=/path/to/destination
```

### GRUB2: set Super Mario as startup tune
```sh
sudo bash -c 'echo "GRUB_INIT_TUNE=\"480 165 2 165 2 165 3 554 1 587 1 554 2 370 1 554 1 523 2 349 1 523 1 494 3 165 2 165 2 165 2\"" >> /etc/default/grub && update-grub'
```

### Determine whether a CPU has 64 bit capability or not
```sh
sudo dmidecode type=processor | grep -i -A 1 charac
```

### Ad blocking on Ubuntu phone/tablet with hosts file
```sh
sudo mount -o remount,rw / && sudo cp /etc/hosts /etc/hosts.old && wget http://winhelp2002.mvps.org/hosts.txt && cp /etc/hosts ~/ && cat hosts.txt >> hosts && sudo cp hosts /etc/hosts
```

### Lists the supported memory types and how much your board can support.
```sh
sudo dmidecode -t 5,16
```

### list all opened ports on host
```sh
sudo lsof -P -i -n -sTCP:LISTEN
```

### Benchmark a hard drive
```sh
sudo hdparm -Tt /dev/sda
```

### Disable sleep mode via cli and systemd (Centos, Debian Ubuntu?)
```sh
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

### Remove all old kernels
```sh
sudo apt-get purge $(dpkg -l linux-{image,headers}-"[0-9]*" | awk '/ii/{print $2}' | grep -ve "$(uname -r | sed -r 's/-[a-z]+//')")
```

### create an emergency swapfile when the existing swap space is getting tight
```sh
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024000;sudo mkswap /swapfile; sudo swapon /swapfile
```

### Make sudo forget password instantly
```sh
sudo -K
```

### Root shell
```sh
sudo -i
```

### Move all files between to date
```sh
sudo find . -maxdepth 1 -cnewer olderFilesNameToMove -and ! -cnewer newerFileNameToMove -exec mv -v {} /newDirectory/ \;
```

### Find the fastest server to disable comcast's DNS hijacking
```sh
sudo netselect -v -s3 $(curl -s http://dns.comcast.net/dns-ip-addresses2.php | egrep -o '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort | uniq)
```

### Fix VirtualBox error
```sh
sudo usermod -a -G vboxusers <username>
```

### Change the default editor for modifying the sudoers list.
```sh
sudo update-alternatives config editor
```

### Install a Firefox add-on/theme to all users
```sh
sudo firefox -install-global-extension /path/to/add-on
```

### To find the count of each open file on a system (that supports losf)
```sh
sudo lsof | awk '{printf("%s %s %s\n", $1, $3, $NF)}' | grep -v "(" | sort -k 4 | gawk '$NF==prv{ct++;next} {printf("%d %s\n",ct,$0);ct=1;prv=$NF}' | uniq | sort -nr
```

### Suspend to ram
```sh
sudo pm-suspend
```

### How to search for files and open all of them in tabbed vim editor.
```sh
sudo find / -type f -name config.inc.php -exec vim -p {} +
```

### Debian: Mark all dependent packages as manualy installed.
```sh
sudo aptitude unmarkauto $(apt-cache depends some-deb-meta-package-name | grep Depends | cut -d: -f2)
```

### Install Restricted Multimedia Codecs in Ubuntu 14.04
```sh
sudo apt-get install libavcodec-extra
```

### Show the key code for keyboard events include the Fn keys
```sh
sudo showkey -k
```

### get diskusage of files modified during the last n days
```sh
sudo find /var/log/ -mtime -7 -type f | xargs du -ch | tail -n1
```

### Drop or block attackers IP with null routes
```sh
sudo route add xxx.xxx.xxx.xxx gw 127.0.0.1 lo
```

### View user activity per directory.
```sh
sudo lsof -u someuser -a +D /etc
```

### Limit bandwidth usage by apt-get
```sh
sudo apt-get -o Acquire::http::Dl-Limit=30 upgrade
```

### Setting reserved blocks percentage to  1%
```sh
sudo tune2fs -m 1 /dev/sda4
```

### Install Linux Kernel Headers on Debian-based systems
```sh
sudo apt-get install linux-headers-`uname -r`
```

### Rolling upgrades via aptitude
```sh
sudo sh -c "aptitude update; aptitude -DrVWZ full-upgrade; aptitude autoclean; exit"
```

### Null a file with sudo
```sh
sudo bash -c "> /var/log/httpd/access_log"
```

### apt-get upgrade with bandwidth limit
```sh
sudo apt-get -o Acquire::http::Dl-Limit=20 -o Acquire::https::Dl-Limit=20 upgrade -y
```

### remove oprhan package on debian based system
```sh
sudo deborphan | xargs sudo apt-get -y remove purge
```

### Reinstall Grub
```sh
sudo grub-install recheck /dev/sda1
```

### Get the Volume labels all bitlocker volumes had before being encrypted
```sh
sudo echo "BitLocker Volume labels:" && sudo dislocker-find | xargs -I{} sh -c 'echo -n "{} ->+ " ; sudo dislocker-metadata -V {} | grep string' | sed 's/+.*string://' | sed "s/'[^ ]* /\"/g" | sed 's/\ [^ ]*$/"/'
```

### purge all packages marked with 'rc'
```sh
sudo dpkg purge `dpkg -l | awk '/^r/{print $2}'`
```

### View any already in progress copy command in detail
```sh
sudo lsof -p1234 | grep -E "(3r|4w).*REG"
```

### cpu info
```sh
sudo dmidecode -t processor
```

### Recover deleted Binary files
```sh
sudo foremost -i /dev/sda -o /recovery
```

### Write a listing of all directories and files on the computer to a compressed file.
```sh
sudo ls -RFal / | gzip > all_files_list.txt.gz
```

### Adding a startup script to be run at bootup Ubuntu
```sh
sudo update-rc.d <scriptname> defaults
```

### Find the 10 users that take up the most disk space
```sh
sudo -s du -sm /Users/* | sort -nr | head -n 10
```

### Mount a VMware virtual disk (.vmdk) file on a Linux box
```sh
sudo mount vmware-server-flat.vmdk /tmp/test/ -o ro,loop=/dev/loop1,offset=32768 -t ntfs
```

### Set blanket packet/second limit on network interface for Ubuntu VPS server
```sh
sudo iptables -A INPUT -m limit limit 2000/sec -j ACCEPT && sudo iptables -A INPUT -j DROP
```

### Kill all processes that listen to ports begin with 50 (50, 50x, 50xxx,...)
```sh
sudo netstat -plnt | awk '($4 ~ /:50$/){sub(/\/.*/, "", $7); system("sudo kill " $7)}'
```

### Print the detailed statistics of transferred bytes by the firewall rules
```sh
sudo iptables -L -nv
```

### Restrict the use of dmesg for current user/session
```sh
sudo sh -c 'echo 1 > /proc/sys/kernel/dmesg_restrict'
```

### Watch postgresql calls from your application on localhost
```sh
sudo tcpdump -nnvvXSs 1514 -i lo0 dst port 5432
```

### Change attributes of files so you can edit them
```sh
sudo chattr -i <file that cannot be modified>
```

### view the system console remotely
```sh
sudo cat /dev/vcs1 | fold -w 80
```

### Browse system RAM in a human readable form
```sh
sudo cat /proc/kcore | strings | awk 'length > 20' | less
```

### Backup your hard drive with dd
```sh
sudo dd if=/dev/sda of=/media/disk/backup/sda.backup
```

### Upgrading packages.  Pacman can update all packages on the system with just one command. This could take quite a while depending on how up-to-date the system is. This command can synchronize the repository databases and update the system's packages.
```sh
sudo pacman -Syu
```

### Install a new kernel in Manjaro linux
```sh
sudo mhwd-kernel linux00
```

### Clean pacman cache in arch linux, manjaro linux
```sh
sudo pacman -Scc
```

### find unreadable file
```sh
sudo -u apache find . -not -perm /o+r
```

### Get all available packages on Ubuntu (or any distro that uses apt)
```sh
sudo apt-cache dumpavail | grep Package | cut -d ' ' -f 2 > available.packages
```

### Startup a VPN connection through command line
```sh
sudo nmcli con up/down id vpn-name
```

### Preserve user variables when running commands with sudo.
```sh
sudo -E rpm -Uvh "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
```

### Gathering all MAC's in your local network
```sh
sudo arp-scan interface=eth0 -l
```

### Display standard information about device
```sh
sudo  ethtool -i eth0
```

### Fix for error perl: warning: Setting locale failed.
```sh
sudo locale-gen en_GB.UTF-8 && sudo locale-gen purge && sudo dpkg-reconfigure locales
```

### A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
```sh
sudo dd if=/dev/mem | cat | strings
```

### easily trace all Nginx processes
```sh
sudo strace -e trace=network -p `pidof nginx | sed -e 's/ /,/g'`
```

### Spoof your wireless MAC address on OS X to 00:e2:e3:e4:e5:e6
```sh
sudo ifconfig en1 ether 00:e2:e3:e4:e5:e6
```

### Find installed network devices
```sh
sudo lshw -C network
```

### Enable verbose boot in Mac OS X Open Firmware
```sh
sudo nvram boot-args="-v"
```

### swap the java version being used
```sh
sudo update-alternatives config java
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
sudo lsof | egrep 'w.+REG' | awk '{print $10}' | sort | uniq -c | sort -n
```

### USE WITH CAUTION: perminately delete old kernel packages
```sh
sudo apt-get remove purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d')
```

### Fix Ubuntu's Broken Sound Server
```sh
sudo killall -9 pulseaudio; pulseaudio >/dev/null 2>&1 &
```

### Check Ram Speed and Type in Linux
```sh
sudo dmidecode type 17 | more
```

### Mount a truecrypt drive from a file from the command line interactively
```sh
sudo truecrypt <truecrypt-file> <mount-point>
```

### Get the size of all the directories in current directory
```sh
sudo du -sh $(ls -d */) 2> /dev/null
```

### take a screenshot of a webpage
```sh
sudo xvfb-run server-args="-screen 0, 1024x768x24" ./webkit2png.py -o google.png http://www.google.com
```

### Export MySQL tables that begin with a string
```sh
sudo mysql -sNe 'show tables like "PREFIX_%"' DBNAME | xargs sudo mysqldump DBNAME > /tmp/dump.sql
```

### Wich program is listen on port OSX
```sh
sudo lsof -i -n -P | grep TCP
```

### Get Dell Service Tag Number from a Dell Machine
```sh
sudo dmidecode | grep Serial\ Number | head -n1
```

### Remove any RPMs matching a pattern
```sh
sudo rpm -e `rpm -qa | grep keyword`
```

### Check if you work on a virtual/physical machine in Linux
```sh
sudo dmidecode | grep Product
```

### run last command with root
```sh
sudo !!
```

### How to speedup the Ethernet device
```sh
sudo ethtool -s eth0 speed 100 duplex full
```

### Run the last command as root
```sh
sudo !-1
```

### Fix the vi zsh bindings on ubuntu
```sh
sudo sed -iorig '/\(up\|down\)/s/^/#/' /etc/zsh/zshrc
```

### Find all active ip's in a subnet
```sh
sudo arp-scan -I eth0 192.168.1.0/24
```

### Show DeviceMapper names for LVM Volumes (to disambiguate iostat logs, etc)
```sh
sudo lvdisplay |awk '/LV Name/{blockdev=$3} /Block device/{bdid=$3; sub("[0-9]*:","dm-",bdid); print bdid,blockdev;}'
```

### Display error pages in report format
```sh
sudo awk '($9 ~ /404/)' /var/log/httpd/www.domain-access_log | awk '{print $2,$9,$7,$11}' | sort | uniq -c
```

### Clean apt-get and gpg cache and keys
```sh
sudo gpg refresh-keys; sudo apt-key update; sudo rm -rf /var/lib/apt/{lists,lists.old}; sudo mkdir -p /var/lib/apt/lists/partial; sudo apt-get clean all; sudo apt-get update
```

### Purge configuration files of removed packages on  debian based systems
```sh
sudo aptitude purge `dpkg get-selections | grep deinstall | awk '{print $1}'`
```

### Show how old your linux OS installtion is
```sh
sudo tune2fs -l $(df -h / |(read; awk '{print $1; exit}')) | grep -i created
```

### what model of computer I'm using?
```sh
sudo dmidecode | grep Product
```

### List open sockets protocol/address/port/state/PID/program name
```sh
sudo netstat -punta
```

### list any Linux files without users or groups
```sh
sudo find / \( -nouser -o -nogroup \)
```

### Mark packages installed with build-dep for autoremove (on Debian/Ubuntu)
```sh
sudo aptitude markauto $(apt-cache showsrc PACKAGE | grep Build-Depends | perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g')
```

### Safely remove old unused kernels in Ubuntu/Debian
```sh
sudo aptitude purge ~ilinux-image-\[0-9\]\(\!`uname -r`\)
```

### Make a file not writable / immutable by root
```sh
sudo chattr +i <file>
```

### Throttling Bandwidth On A Mac
```sh
sudo ipfw pipe 1 config bw 50KByte/s;sudo ipfw add 1 pipe 1 src-port 80
```

### Force GNU/Linux keyboard settings, layout and configuration
```sh
sudo dpkg-reconfigure keyboard-configuration
```

### Display IP : Count of failed login attempts
```sh
sudo lastb | awk '{if ($3 ~ /([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}/)a[$3] = a[$3]+1} END {for (i in a){print i " : " a[i]}}' | sort -nk 3
```

### hibernate
```sh
sudo pm-hibernate
```

### Use tagged vlans
```sh
sudo vconfig add eth0 [VID]
```

### dhcdrop - testing/suppression/tracking false DHCP servers
```sh
sudo dhcdrop -i eth1 -y -l 00:11:22:33:44:55
```

### Remove old kernels and header data in Ubuntu/Debian
```sh
sudo apt-get -y purge $(dpkg get-selections | awk '((/^linux-/) && (/[0-9]\./) && (!/'"`uname -r | sed "s/-generic//g"`"'/)) {print $1}')
```

### Installs lamp on Ubuntu
```sh
sudo apt-get  install lamp-server^ phpmyadmin
```

### Install build dependencies for a given package
```sh
sudo apt-get build-dep rhythmbox
```

### Kill all processes that listen to ports begin with 50 (50, 50x, 50xxx,...)
```sh
sudo netstat -plnt | grep :50 | awk '{print $7}' | awk -F/ '{print $1}' | xargs kill -9
```

### Route some ips (or domain names) over VPN
```sh
sudo /sbin/route add -host 192.168.12.50 -interface ppp0
```

### Kill all processes belonging to a user
```sh
sudo -u $USER kill -9 -1
```

### the first command i type on fresh ubuntu
```sh
sudo apt-get install aptitude
```

### Add another tty device using mknod command
```sh
sudo mknod /dev/ttyS4 c 4 68
```

### Hibernate after 30minutes
```sh
sudo bash -c "sleep 30m; pm-hibernate"
```

### Ettercap MITM
```sh
sudo ettercap -T -Q -M arp -i wlan0 // //
```

### macports update
```sh
sudo port selfupdate ; echo '-' ; sudo port upgrade outdated
```

### Change directories using sudo
```sh
sudo bash -c "cd /PATH/TO/THE/DIRECTORY;bash"
```

### sync repository and do install
```sh
sudo apt-fast update && sudo apt-fast -y dist-upgrade
```

### Command used to sync arch ro manjaro mirrors
```sh
sudo pacman-mirrors -g
```

### dpkg: purge all packages matching some name
```sh
sudo dpkg -P $(sudo dpkg -l yourPkgName* | awk '$2 ~ /yourPkgName.*/' | awk '$1 ~ /.i/' | awk '{print $2}')
```

### Find directories with lots of files in them
```sh
sudo find / -type f | perl -MFile::Basename -ne '$counts{dirname($_)}++; END { foreach $d (sort keys %counts) {printf("%d\t%s\n",$counts{$d},$d);} }'|sort -rn | tee /tmp/sortedfilecount.out | head
```

### To install guest additions in arch or manjaro linux, run the following command:
```sh
sudo pacman -S virtualbox-guest-utils
```

### restart session
```sh
sudo restart lightdm
```

### Delete duplicated dictionaries in spell check list
```sh
sudo find /usr/share/hunspell/ -lname '*' -delete
```

### dpkg: purge all packages matching some name
```sh
sudo dpkg -P $(dpkg -l yourPkgName* | awk '$2 ~ /yourPkgName.*/ && $1 ~ /.i/ {print $2}')
```

### Disabling Spotlight on Mac OS
```sh
sudo mdutil -a -i off
```

### progress bar while using dd
```sh
sudo dd if=file.iso |pv| sudo dd of=/dev/sdX
```

### make pretty the netstat output for listening services
```sh
sudo netstat -plntu inet | sort -t: -k2,2n | sort stable -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | sort -s -t" " -k1,1
```

### Change user's password
```sh
sudo passwd <username>
```

### Look for the process bound to a certain port
```sh
sudo netstat -tulpn | grep :8080
```

### List wireless clients connected to an access point
```sh
sudo netdiscover -r 192.168.1.0/24 -i wlo1
```

### See who's connected to your network =D
```sh
sudo netdiscover -r 192.168.1.0/24 -iwlo1
```

### Install mysql-2.8.1 rubygem on Mac OS X 10.6 (Snow Leopard)
```sh
sudo env ARCHFLAGS="-arch x86_64" gem install mysql
```

### rescan SCSI bus
```sh
sudo apt-get install scsitools && sudo rescan-scsi-bus
```

### Find all hidden files in a directory
```sh
sudo find . -name '.*' \( -type d -exec find {} \; -prune -o -print \)
```

### Play music from pure data
```sh
sudo cat /usr/share/icons/*/*/* > /dev/dsp
```

### Switch on eeepc camera
```sh
sudo echo 1 > /proc/acpi/asus/camera
```

### Startup Nessus and initialize plugins on backtrack5
```sh
sudo /opt/nessus/sbin/nessusd
```

### Extract a .gz file with privilege
```sh
sudo sh -c 'gunzip -c source.gz > destination'
```

### Backup /etc directory
```sh
sudo tar -zcvf $(hostname)-etc-back-`date +%d`-`date +%m`-`date +%y`.tar.gz /etc && sudo chown $USER:$USER $(hostname)-etc-back*
```

### Flush DNS
```sh
sudo /etc/init.d/dns-clean
```

### Twitter the geek way
```sh
sudo pip install rainbowstream && rainbowstream -iot
```

### sudo for launching gui apps in background
```sh
sudo -b xterm
```

### Delete all php package
```sh
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
```

### sudo ssh -D 88 -fN user@xxxx.no-ip.info
```sh
sudo ssh -D 88 -fN user@xxxx.no-ip.info
```

### Send SNMP traps
```sh
sudo snmptrap -m ALL -v 2c -c public trapserver "" UCD-DEMO-MIB::ucdDemoPublic SNMPv2-MIB::sysLocation.0 s "Just here"
```

### DD with progressbar using pv for backing up entire block device
```sh
sudo dd if=/dev/block/device bs=1MB | pv -s `sudo blockdev getsize64 /dev/block/device' | gzip -9 > output.img.gz
```

### Berechtigungen nach einer Referenz ?ndern
```sh
sudo chmod reference=Referenz.foo Datei.foo
```

### Find the mounted storages
```sh
sudo find . -name "syslog*.gz" -type f | xargs gzip -cd | grep "Mounted"
```

### View all file descriptors owned by a process
```sh
sudo lsof -p `sudo ps aux | grep -i neo4j | grep -v grep | awk '{ print $2 }'`
```

### Create a package list for offline download
```sh
sudo apt-get <apt-get command and options> print-uris -qq | sed -n "s/'\([^ ]\+\)' \([^ ]\+\) \([^ ]\+\) MD5Sum:\([^ ]\+\)/wget -c \1/p" > dowload_deb_list.txt
```

### Show counts of messages in exim mail queue, grouped by recipient
```sh
sudo /usr/sbin/exim -bp | sed -n '/\*\*\* frozen \*\*\*/,+1!p' | awk '{print $1}' | tr -d [:blank:] | grep @ | sort | uniq -c | sort -n
```

### Check if TCP port 25 is open
```sh
sudo lsof -iTCP:25 -sTCP:LISTEN
```

### Total space used by open but deleted files
```sh
sudo lsof -nP | awk '/deleted/ { sum+=$8 } END { print sum }'
```

### Find out which process uses an old lib and needs a restart after a system update
```sh
sudo lsof | grep 'DEL.*lib' | cut -f 1 -d ' ' | sort -u
```

### MTR command line to show jitter and mimic network traffic
```sh
sudo mtr -s 1472 -B 0 -oLDRSWNBAWVJMXI <ip address>
```

### Adding user to printer, after installing hp-lip (Debian)
```sh
sudo adduser [username] lp && sudo adduser [username] lpadmin && sudo hp-setup -i
```

### Synchronize date and time with a server
```sh
sudo ntpdate serverip
```

### creates a ppp link between my Ubuntu development machine and BeagleBoard running Android connected via USB
```sh
sudo `which adb` ppp "shell:pppd nodetach noauth noipdefault /dev/tty" nodetach noauth noipdefault notty 192.168.0.100:192.168.0.200
```

### Find and sort by Resident Size of each process on the system in MB
```sh
sudo ps aux sort:rss | awk '{print $2"\t"$11":  "$6/1024" MB"}' | column -t | less
```

### Sniff who are using wireless. Use wireshark to watch out.pcap :]
```sh
sudo ettercap -T -w out.pcap -i wlan0 -M ARP // //
```

### Reboot to Windows (UEFI)
```sh
sudo efibootmgr bootnext `efibootmgr | sed -n "s/^Boot\([0-9]\{4\}\)\* Windows Boot Manager$/\1/p"` && reboot
```

### Manage "legacy" service run control links
```sh
sudo find /etc/rc{1..5}.d -name S99myservice -type l -exec sh -c 'NEWFN=`echo {} | sed 's/S99/K99/'` ; mv -v {} $NEWFN' \;
```

### resume other user's screen session via su, without pty error
```sh
sudo -iu {user} script -qc 'screen {screen_args}' /dev/null
```

### Kill the X Server
```sh
sudo kill -9 $( ps -e | grep Xorg | awk '{ print $1 }' )
```

### Stop Grooveshark destroying your CPU
```sh
sudo cpulimit -e Grooveshark -l 20
```

### CPU Frequency/Speed Set
```sh
sudo cpupower frequency-set -g <frequency governor>
```

### Set date and time
```sh
sudo date -s "26 OCT 2008 19:30:00"
```

### Manual CPU Frequency/Speed/Clock Set
```sh
sudo cpupower frequency-set -f <frequency in MHz>
```

### detect partitions
```sh
sudo file -bs /dev/sda | sed -e 's/.*partition 1\(.*\) code offset.*/partition 1\1/g' -e 's/\(.\);/\1\n/g'
```

### Rename your Raspberry Pi
```sh
sudo sed -i 's/raspberrypi/pita1/' /etc/hosts /etc/hostname; sudo reboot
```

### Installation Ksuperkey by one command in Kubuntu.
```sh
sudo apt-get install git gcc make libx11-dev libxtst-dev pkg-config -y && git clone https://github.com/hanschen/ksuperkey.git && cd ksuperkey && make && sudo mv ksuperkey /usr/bin/ksuperkey && cd ~ && rm -rf ksuperkey
```

### Run skype using your GTK theme
```sh
sudo sed -i 's/Exec=skype %U/Exec=skype disable-cleanlooks -style GTK %U/' /usr/share/applications/skype.desktop
```

### List partition superblocks
```sh
sudo dumpe2fs /dev/sda1 | grep superblock
```

### Fix "Unknown media type in type" warnings when installing packages
```sh
sudo sh -c "rm /usr/share/mime/packages/kde.xml && update-mime-database /usr/share/mime"
```

### Macports update and clean all packages
```sh
sudo port selfupdate && sudo port upgrade outdated && sudo port clean all installed && sudo port -f uninstall inactive
```

### Information about RAM HW.
```sh
sudo dmidecode type 17
```

### Install dpkg packages
```sh
sudo dpkg -i *.deb
```

### Wait the set time and then Power off
```sh
sudo shutdown -h <hour:minute>
```

### Null a file with sudo
```sh
sudo tee /path/to/file < /dev/null
```

### Make redirects to localhost via /etc/hosts more interesting
```sh
sudo socat TCP4-LISTEN:80,bind=127.0.0.1,fork EXEC:'echo "HTTP/1.1 503 Service Unavailable";'
```

### print indepth hardware info
```sh
sudo dmidecode | more
```
