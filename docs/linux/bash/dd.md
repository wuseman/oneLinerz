## dd

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Watch the progress of 'dd'
```sh
dd if=/dev/zero | pv | dd of=/dev/null
```

### How to copy CD/DVD into hard disk (.iso)
```sh
dd if=/dev/cdrom of=whatever.iso
```

### Copy a file using dd and watch its progress
```sh
dd status=progress if=infile of=outfile bs=512
```

### Add temporary swap space
```sh
dd if=/dev/zero of=/swapfile bs=1M count=64; chmod 600 /swapfile; mkswap /swapfile; swapon /swapfile
```

### Create a CD/DVD ISO image from disk.
```sh
dd bs=1M if=/dev/scd0 of=./filename.iso OR readom -v dev='D:' f='./filename.iso' speed=2 retries=8
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& pid=$!
```

### Show stats for dd
```sh
dd if=/dev/zero of=test bs=1024k count=1024 & bash -c "while :; do clear;echo STATS FOR DD:;kill -USR1 $!; sleep 1; done"
```

### truncate half of `input.txt`
```sh
dd of=output.txt if=input.txt ibs=1 skip=$(expr `stat -c%s input.txt` / 2)
```

### extend KVM image size
```sh
dd bs=1 if=/dev/zero of=/path/to/imagename.raw seek=50G count=1 conv=notrunc
```

### Rip an ISO from a CD/DVD using the freeware dd for Windows
```sh
dd if="\\?\Device\CdRom0" of=c:\temp\disc1.iso bs=1M progress
```

### Make an iso file out of your entire hard drive
```sh
dd if=/dev/hda of=file.img
```

### Create random password in reasonable time
```sh
dd if=/dev/urandom  | tr -d -c [:print:] | tr -d " " | dd count=1 bs=20  2> /dev/null; echo
```

### HDD Performance Read Test
```sh
dd if=10gb of=/dev/zero bs=1M count=10240
```

### Compress and store the image of a disk over the network
```sh
dd if=<device> | pv | nc <target> <port>
```

### Create dummy file
```sh
dd if=/dev/zero of=filename.file bs=1024 count=10240
```

### Fill up disk space (for testing)
```sh
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df block-size=8192 / | awk 'NR!=1 {print $4-100}')
```

### Delete everything on hda
```sh
dd if=/dev/zero of=/dev/hda bs=16M
```

### Backup sda5 partition to ftp ( using pipes and gziped backup )
```sh
dd if=/dev/sda5 bs=2048 conv=noerror,sync | gzip -fc | lftp -u user,passwd domain.tld -e "put /dev/stdin -o backup-$(date +%Y%m%d%H%M).gz; quit"
```

### Compress and Backup a disk image
```sh
dd if=/dev/<device location> | gzip -c /<path to backup location>/<disk image name>.img.gz
```

### Backup the first 1MB of your volume
```sh
dd if=/dev/sdX of=/root/sdX.bin bs=1M count=1
```

### Back Up a disk to an image in your home directory
```sh
dd if=/dev/sda of=~/backup-disk-YY-MM-DD.img
```

### create a big file
```sh
dd if=/dev/zero of=/tmp/bigfile bs=1024k count=100
```

### Completly blank a disk
```sh
dd if=/dev/zero of=/dev/hda
```

### Completly blank a disk
```sh
dd if=/dev/urandom of=/dev/somedisk
```

### Generate random password
```sh
dd bs=1 count=32 if=/dev/random 2> /dev/null | md5 | grep -o '\w*'
```

### Random Beeps on Your PC Speaker
```sh
dd if=/dev/urandom of=/dev/speaker bs=1
```

### Random Beeps on Your Audio Card's Output
```sh
dd if=/dev/urandom of=/dev/dsp
```

### dd and ssh
```sh
dd if=/dev/zero bs=1M | ssh somesite dd of=/dev/null
```

### &#23558;&#19968;&#20010;&#25991;&#20214;&#25335;&#36125;&#21040;&#21478;&#19968;&#20010;&#25991;&#20214;&#30340;&#26411;&#23614;
```sh
dd if=file1 of=file2 seek=1 bs=$(stat -c%s file2)
```

### Free unused memory currently unavailable
```sh
dd if=/dev/zero of=junk bs=1M count=1K
```

### Create executable, automountable filesystem in a file, with password!
```sh
dd if=/dev/zero of=T bs=1024 count=10240;mkfs.ext3 -q T;E=$(echo 'read O;mount -o loop,offset=$O F /mnt;'|base64|tr -d '\n');echo "E=\$(echo $E|base64 -d);eval \$E;exit;">F;cat <(dd if=/dev/zero bs=$(echo 9191-$(stat -c%s F)|bc) count=1) <(cat T;rm T)>>F
```

### Rip a CD/DVD to ISO format.
```sh
dd if=/dev/cdrom of=~/cdrom_image.iso
```

### gag version of current date
```sh
ddate
```

### Test network speed without wasting disk
```sh
dd if=/dev/zero bs=4096 count=1048576 | ssh user@host.tld 'cat > /dev/null'
```

### Create a file of a given size in linux
```sh
dd if=/dev/zero of=foo.txt bs=1M count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Install a basic FreeBSD system
```sh
dd if=mfsbsd.iso | ssh distant.server dd of=/dev/sda
```

### Create a large test file (taking no space).
```sh
dd bs=1 seek=2TB if=/dev/null of=ext3.test
```

### Duplicate several drives concurrently
```sh
dd if=/dev/sda | tee >(dd of=/dev/sdb) | dd of=/dev/sdc
```

### Creating ISO Images from CDs/DVDs
```sh
dd if=/dev/cdrom of=~/cd_image.iso
```

### Copy a file using dd and watch its progress
```sh
dd if=fromfile of=tofile & DDPID=$! ; sleep 1 ; while kill -USR1 $DDPID ; do sleep 5; done
```

### Create a 5 MB blank file
```sh
dd if=/dev/zero of=testfile bs=1024 count=5000
```

### Start dd and show progress every X seconds
```sh
dd if=/path/to/inputfile of=/path/to/outputfile & pid=$! && sleep X && while kill -USR1 $pid; do sleep X; done
```

### Create a 100MB file for testing transfer speed
```sh
dd if=/dev/random of=bigfile bs=1024 count=102400
```

### Efficient remote forensic disk acquisition gpg-crypted for multiple recipients
```sh
dd if=/dev/sdb | pigz | gpg -r <recipient1> -r <recipient2> -e homedir /home/to/.gnupg | nc remote_machine 6969
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### clone an USB stick using dd + see its process
```sh
dd if=/dev/sdc of=/dev/sdd  conv=notrunc & while killall -USR1 dd; do sleep 5; done
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& pid=$!; while [[ -d /proc/$pid ]]; do kill -USR1 $pid && sleep 1 && clear; done
```

### Split a file one piece at a time, when using the split command isn't an option (not enough disk space)
```sh
dd if=inputfile of=split3 bs=16m count=32 skip=64
```

### Test disk I/O
```sh
dd if=/dev/zero of=test bs=64k count=16k conv=fdatasync
```

### A DESTRUCTIVE command to render a drive unbootable
```sh
dd if=/dev/zero of=/dev/fd0 bs=512 count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create a DOS floppy image
```sh
dd if=/dev/zero bs=1024 count=1440 > floppy.img && mkdosfs floppy.img
```

### Create a file of a given size in linux
```sh
dd if=/dev/zero of=sparse_file bs=1024 skip=1024 count=1
```

### Extract the MBR ID of a device
```sh
dd if=/dev/sda bs=1 count=4 skip=$((0x1b8)) 2>/dev/null | hexdump -n4 -e '"0x%x\n"'
```

### Convert a Nero Image File to ISO
```sh
dd bs=1k if=image.nrg of=image.iso skip=300
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& sleep 1 && pid=`pidof dd`; while [[ -d /proc/$pid ]]; do kill -USR1 $pid && sleep 10 && clear; done
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### dump 1KB of data from ram to file
```sh
dd if=/dev/mem of=file.dump bs=1024 skip=0 count=1
```

### dd if=/dev/null of=/dev/sda
```sh
dd if=/dev/null of=/dev/sda
```

### Create a file of repeated, non-zero
```sh
dd if=/dev/zero bs=64K count=1 | tr "\0" "\377" > all_ones
```

### Create a random file of a specific size
```sh
dd if=/dev/zero of=testfile.txt bs=1M count=10
```

### dd with progress bar and statistics
```sh
dd if=FILE | pv -s $(stat FILE | egrep -o "Size: [[:digit:]]*" | egrep -o "[[:digit:]]*") | dd of=OUTPUT
```

### Extract android adb ab backup to tar format (only works for non encrypted backups)
```sh
dd if=mybackup.ab bs=24 skip=1 | openssl zlib -d > mybackup.tar
```

### Clone or rescue a block device
```sh
ddrescue -v /dev/sda /dev/sdb logfile.log
```

### HDD Performance Write Test
```sh
dd if=/dev/zero of=10gb bs=1M count=10240
```

### Step#2  Create a copy of the bootload and partition table!
```sh
dd if=/dev/sda of=/home/sam/MBR.image bs=512 count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create iso image of cd/dvd
```sh
dd if=/dev/cdrom of=~/cdimage.iso
```

### Start dd and show progress every X seconds
```sh
dd if=/path/inputfile | pv | dd of=/path/outpufile
```

### A good way to write to SDCard
```sh
dd if=<image> of=/dev/sdx bs=4M iflag=direct,fullblock oflag=direct status=progress
```

### Backup a local drive into a file on the remote host via ssh
```sh
dd if=/dev/sda | ssh user@server 'dd of=sda.img'
```

### type partial command, kill this command, check something you forgot, yank the command, resume typing.
```sh
dd [...] p
```

### Dump and compress a drive over ssh with current speeds
```sh
dd if=/dev/sdb | pv -rabc | pbzip2 -c1 | pv -rabc | ssh user@192.168.0.1 'cat > /dump.bz2'
```

### Copy a file using dd and watch its progress
```sh
dd if=foo of=bar status=progress
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### create iso from partition
```sh
dd if=/dev/sdb of=/destination/usb-image.iso
```

### Recovery patition from iso
```sh
dd if=/sourceDestination/usb-image.iso of=/dev/sdb
```

### backup your BMR info
```sh
dd if=/dev/sda of=mbr.bk bs=512 count=1
```

### duckduckgo search to w3m browser
```sh
ddg(){ search=""; bang=""; for term in $@; do if [[ "$term" =~ -([A-Za-z0-9._%+-]*) ]]; then bang="\!${BASH_REMATCH[1]}" ; else search="$search%20$term" ; fi ; done ; w3m "https://www.duckduckgo.com/?q=$bang$search" ;}
```

### Remove the boot loader from a usb stick
```sh
dd if=/dev/zero of=/dev/sdb bs=446 count=1
```

### Processor / memory bandwidthd? in GB/s
```sh
dd if=/dev/zero of=/dev/null bs=1M count=32768
```

### Processor / memory bandwidthd? in GB/s
```sh
dd if=/dev/zero of=/dev/null bs=1M count=32768
```

### Calculate different hash sums of one file at the same time
```sh
dd if=file | tee >(sha1sum) >(md5sum) >(sha256sum) >/dev/null
```

### Random unsigned integer from /dev/random (0-65535)
```sh
dd if=/dev/random count=1 bs=2 2>/dev/null | od -i | awk '{print $2}' | head -1
```

### Test network performance, copying from the mem of one box, over the net to the mem of another
```sh
dd if=/dev/zero bs=256M count=1 | nc [remoteIP] [remotePort] and on the other host nc -l port >/dev/null
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create a 5 MB blank file via a seek hole
```sh
dd if=/dev/zero of=testfile.seek seek=5242879 bs=1 count=1
```

### Generate Random Passwords
```sh
dd if=/dev/urandom count=200 bs=1 2>/dev/null | tr "\n" " " | sed 's/[^a-zA-Z0-9]//g' | cut -c-16
```

### Backup a pendrive or disk under windows with dd
```sh
dd.exe progress if=\\.\Volume{0b1a0cbe-11da-11c0-ab53-003045c00008} of=pendrive.img
```

### Make ISO images on Linux
```sh
dd if=/dev/cdrom of=cd.iso
```

### Generate a Random Password
```sh
dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev
```

### Get Volume ID (Label) of ISO9660 CD-ROM
```sh
dd if=/dev/cdrom bs=1 skip=32808 count=32 conv=unblock cbs=32 2>/dev/null
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### If your disk space Used =100% displayed even after deleting the files generated the below command then Just REBOOT the System .
```sh
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df block-size=8192 / | awk 'NR!=1 {print $4-100}')
```

### dd with progress bar and statistics
```sh
dd if=/dev/urandom of=/file.img status=progress
```

### If your disk space Used =100% displayed even after deleting the files generated the below command then Just REBOOT the System .
```sh
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df block-size=8192 / | awk 'NR!=1 {print $4-100}')
```

### dd with progress bar and statistics
```sh
dd if=/dev/urandom of=/file.img status=progress
```

### [re]verify a disc with very friendly output
```sh
dd if=/dev/cdrom | pv -s 700m | md5sum | tee test.md5
```

### Create a hard-to-guess password
```sh
dd if=/dev/urandom bs=16 count=1 2>/dev/null | base64
```

### Creating Harddisk image and saving on remote server
```sh
dd if=/dev/hda | ssh root@4.2.2.2 'dd of=/root/server.img'
```

### burn iso to usb
```sh
dd if=/daten/isos/debian-8.8.0-i386-netinst.iso of=/dev/sdb bs=4M
```

### generate a one-time pad
```sh
dd if=/dev/random | pv -ptab size 128 stop-at-size | dd of=~/.onetime/to_foo.pad
```

### dd with progress bar
```sh
dd if=/dev/nst0 |pv|dd of=restored_file.tar
```

### Commands to setup my new harddrive! #4 Step! Try to recover as much as possible
```sh
ddrescue -r 1 /dev/old_disk /dev/new_disk rescued.log
```

### #3 Step! FIrst Pass quickly!
```sh
ddrescue -n /dev/old_disk /dev/new_disk rescued.log
```

### generate a one-time pad
```sh
dd if=/dev/random of=~/.onetime/to_foo.pad bs=1000 count=1
```

### dump a mounted disk to an ISO image
```sh
dd if=/dev/disk1 of=disk1.iso
```

### Open search engines from terminal
```sh
ddg(){ ARGS="$@"; xdg-open "https://www.duckduckgo.com/?q=${ARGS}"; }
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Watch the progress of 'dd'
```sh
dd if=/dev/zero | pv | dd of=/dev/null
```

### How to copy CD/DVD into hard disk (.iso)
```sh
dd if=/dev/cdrom of=whatever.iso
```

### Add temporary swap space
```sh
dd if=/dev/zero of=/swapfile bs=1M count=64; chmod 600 /swapfile; mkswap /swapfile; swapon /swapfile
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& pid=$!
```

### Compress and store the image of a disk over the network
```sh
dd if=<device> | pv | nc <target> <port>
```

### Backup sda5 partition to ftp ( using pipes and gziped backup )
```sh
dd if=/dev/sda5 bs=2048 conv=noerror,sync | gzip -fc | lftp -u user,passwd domain.tld -e "put /dev/stdin -o backup-$(date +%Y%m%d%H%M).gz; quit"
```

### Create executable, automountable filesystem in a file, with password!
```sh
dd if=/dev/zero of=T bs=1024 count=10240;mkfs.ext3 -q T;E=$(echo 'read O;mount -o loop,offset=$O F /mnt;'|base64|tr -d '\n');echo "E=\$(echo $E|base64 -d);eval \$E;exit;">F;cat <(dd if=/dev/zero bs=$(echo 9191-$(stat -c%s F)|bc) count=1) <(cat T;rm T)>>F
```

### Rip a CD/DVD to ISO format.
```sh
dd if=/dev/cdrom of=~/cdrom_image.iso
```

### gag version of current date
```sh
ddate
```

### Test network speed without wasting disk
```sh
dd if=/dev/zero bs=4096 count=1048576 | ssh user@host.tld 'cat > /dev/null'
```

### Create a file of a given size in linux
```sh
dd if=/dev/zero of=foo.txt bs=1M count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Install a basic FreeBSD system
```sh
dd if=mfsbsd.iso | ssh distant.server dd of=/dev/sda
```

### Create a large test file (taking no space).
```sh
dd bs=1 seek=2TB if=/dev/null of=ext3.test
```

### Duplicate several drives concurrently
```sh
dd if=/dev/sda | tee >(dd of=/dev/sdb) | dd of=/dev/sdc
```

### Creating ISO Images from CDs/DVDs
```sh
dd if=/dev/cdrom of=~/cd_image.iso
```

### Copy a file using dd and watch its progress
```sh
dd if=fromfile of=tofile & DDPID=$! ; sleep 1 ; while kill -USR1 $DDPID ; do sleep 5; done
```

### Create a 5 MB blank file
```sh
dd if=/dev/zero of=testfile bs=1024 count=5000
```

### Start dd and show progress every X seconds
```sh
dd if=/path/to/inputfile of=/path/to/outputfile & pid=$! && sleep X && while kill -USR1 $pid; do sleep X; done
```

### Create a 100MB file for testing transfer speed
```sh
dd if=/dev/random of=bigfile bs=1024 count=102400
```

### Efficient remote forensic disk acquisition gpg-crypted for multiple recipients
```sh
dd if=/dev/sdb | pigz | gpg -r <recipient1> -r <recipient2> -e homedir /home/to/.gnupg | nc remote_machine 6969
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### clone an USB stick using dd + see its process
```sh
dd if=/dev/sdc of=/dev/sdd  conv=notrunc & while killall -USR1 dd; do sleep 5; done
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& pid=$!; while [[ -d /proc/$pid ]]; do kill -USR1 $pid && sleep 1 && clear; done
```

### Split a file one piece at a time, when using the split command isn't an option (not enough disk space)
```sh
dd if=inputfile of=split3 bs=16m count=32 skip=64
```

### Test disk I/O
```sh
dd if=/dev/zero of=test bs=64k count=16k conv=fdatasync
```

### A DESTRUCTIVE command to render a drive unbootable
```sh
dd if=/dev/zero of=/dev/fd0 bs=512 count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create a DOS floppy image
```sh
dd if=/dev/zero bs=1024 count=1440 > floppy.img && mkdosfs floppy.img
```

### Create a file of a given size in linux
```sh
dd if=/dev/zero of=sparse_file bs=1024 skip=1024 count=1
```

### Extract the MBR ID of a device
```sh
dd if=/dev/sda bs=1 count=4 skip=$((0x1b8)) 2>/dev/null | hexdump -n4 -e '"0x%x\n"'
```

### Convert a Nero Image File to ISO
```sh
dd bs=1k if=image.nrg of=image.iso skip=300
```

### Watch the progress of 'dd'
```sh
dd if=/dev/urandom of=file.img bs=4KB& sleep 1 && pid=`pidof dd`; while [[ -d /proc/$pid ]]; do kill -USR1 $pid && sleep 10 && clear; done
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### dump 1KB of data from ram to file
```sh
dd if=/dev/mem of=file.dump bs=1024 skip=0 count=1
```

### dd if=/dev/null of=/dev/sda
```sh
dd if=/dev/null of=/dev/sda
```

### Create a file of repeated, non-zero
```sh
dd if=/dev/zero bs=64K count=1 | tr "\0" "\377" > all_ones
```

### Create a random file of a specific size
```sh
dd if=/dev/zero of=testfile.txt bs=1M count=10
```

### dd with progress bar and statistics
```sh
dd if=FILE | pv -s $(stat FILE | egrep -o "Size: [[:digit:]]*" | egrep -o "[[:digit:]]*") | dd of=OUTPUT
```

### Extract android adb ab backup to tar format (only works for non encrypted backups)
```sh
dd if=mybackup.ab bs=24 skip=1 | openssl zlib -d > mybackup.tar
```

### Clone or rescue a block device
```sh
ddrescue -v /dev/sda /dev/sdb logfile.log
```

### HDD Performance Write Test
```sh
dd if=/dev/zero of=10gb bs=1M count=10240
```

### Step#2  Create a copy of the bootload and partition table!
```sh
dd if=/dev/sda of=/home/sam/MBR.image bs=512 count=1
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create iso image of cd/dvd
```sh
dd if=/dev/cdrom of=~/cdimage.iso
```

### Start dd and show progress every X seconds
```sh
dd if=/path/inputfile | pv | dd of=/path/outpufile
```

### A good way to write to SDCard
```sh
dd if=<image> of=/dev/sdx bs=4M iflag=direct,fullblock oflag=direct status=progress
```

### Backup a local drive into a file on the remote host via ssh
```sh
dd if=/dev/sda | ssh user@server 'dd of=sda.img'
```

### type partial command, kill this command, check something you forgot, yank the command, resume typing.
```sh
dd [...] p
```

### Dump and compress a drive over ssh with current speeds
```sh
dd if=/dev/sdb | pv -rabc | pbzip2 -c1 | pv -rabc | ssh user@192.168.0.1 'cat > /dump.bz2'
```

### Copy a file using dd and watch its progress
```sh
dd if=foo of=bar status=progress
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### create iso from partition
```sh
dd if=/dev/sdb of=/destination/usb-image.iso
```

### Recovery patition from iso
```sh
dd if=/sourceDestination/usb-image.iso of=/dev/sdb
```

### backup your BMR info
```sh
dd if=/dev/sda of=mbr.bk bs=512 count=1
```

### duckduckgo search to w3m browser
```sh
ddg(){ search=""; bang=""; for term in $@; do if [[ "$term" =~ -([A-Za-z0-9._%+-]*) ]]; then bang="\!${BASH_REMATCH[1]}" ; else search="$search%20$term" ; fi ; done ; w3m "https://www.duckduckgo.com/?q=$bang$search" ;}
```

### Remove the boot loader from a usb stick
```sh
dd if=/dev/zero of=/dev/sdb bs=446 count=1
```

### Processor / memory bandwidthd? in GB/s
```sh
dd if=/dev/zero of=/dev/null bs=1M count=32768
```

### Calculate different hash sums of one file at the same time
```sh
dd if=file | tee >(sha1sum) >(md5sum) >(sha256sum) >/dev/null
```

### Random unsigned integer from /dev/random (0-65535)
```sh
dd if=/dev/random count=1 bs=2 2>/dev/null | od -i | awk '{print $2}' | head -1
```

### Test network performance, copying from the mem of one box, over the net to the mem of another
```sh
dd if=/dev/zero bs=256M count=1 | nc [remoteIP] [remotePort] and on the other host nc -l port >/dev/null
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### Create a 5 MB blank file via a seek hole
```sh
dd if=/dev/zero of=testfile.seek seek=5242879 bs=1 count=1
```

### Generate Random Passwords
```sh
dd if=/dev/urandom count=200 bs=1 2>/dev/null | tr "\n" " " | sed 's/[^a-zA-Z0-9]//g' | cut -c-16
```

### Backup a pendrive or disk under windows with dd
```sh
dd.exe progress if=\\.\Volume{0b1a0cbe-11da-11c0-ab53-003045c00008} of=pendrive.img
```

### Make ISO images on Linux
```sh
dd if=/dev/cdrom of=cd.iso
```

### Generate a Random Password
```sh
dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev
```

### Get Volume ID (Label) of ISO9660 CD-ROM
```sh
dd if=/dev/cdrom bs=1 skip=32808 count=32 conv=unblock cbs=32 2>/dev/null
```

### output your microphone to a remote computer's speaker
```sh
dd if=/dev/dsp | ssh -c arcfour -C username@host dd of=/dev/dsp
```

### If your disk space Used =100% displayed even after deleting the files generated the below command then Just REBOOT the System .
```sh
dd if=/dev/zero of=/fs/to/fill/dummy00 bs=8192 count=$(df block-size=8192 / | awk 'NR!=1 {print $4-100}')
```

### dd with progress bar and statistics
```sh
dd if=/dev/urandom of=/file.img status=progress
```

### [re]verify a disc with very friendly output
```sh
dd if=/dev/cdrom | pv -s 700m | md5sum | tee test.md5
```

### dd with progress bar
```sh
dd if=/dev/nst0 |pv|dd of=restored_file.tar
```
