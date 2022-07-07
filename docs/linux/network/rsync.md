# rsync

### Resume a partially copied file
```sh
rsync -a append source-file destination
```

### remote backups with rsync
```sh
rsync delete -az -e 'ssh -c blowfish -i /your/.ssh/backup_key -ax' /path/to/backup remote-host:/dest/path/
```

### File count into directories
```sh
rsync stats dry-run -ax /home/myself/ /tmp
```

### rsync Command that limits bandwidth
```sh
rsync -arvx numeric-ids stats progress bwlimit=1000 file server:destination_directory
```

### Real full backup copy of /etc folder
```sh
rsync -a /etc /destination
```

### Transfer files with rsync over ssh on a non-standard port.
```sh
rsync -P -e 'ssh -p PORT' SRC DEST
```

### shows which files differ in two direcories
```sh
rsync -avz dry-run /somewhere/source_directory /somewhereelse/target_directory
```

### Upload - rsync using key pair
```sh
rsync -avvvz -e "ssh -i /root/.ec2/id_rsa-gsg-keypair"  archive progress /root/.ec2/id_rsa-gsg-keypair  root@ec2-75-101-212-113.compute-1.amazonaws.com:/root
```

### Upload - rsync using key pair
```sh
rsync -avvvz -e "ssh -i /root/.ec2/id_rsa-gsg-keypair" archive progress /root/.ec2/id_rsa-gsg-keypair root@ec2-75-101-212-113.compute-1.amazonaws.com:/root
```

### Sync two directories
```sh
rsync -a -v delete sending_directory target_directory
```

### rsync with progress bar.
```sh
rsync -av progress ./file.txt user@host:/path/to/dir
```

### Create a mirror of a local folder, on a remote server
```sh
rsync -e "/usr/bin/ssh -p22" -a progress stats delete -l -z -v -r -p /root/files/ user@remote_server:/root/files/
```

### Start a quick rsync daemon for fast copying on internal secure network
```sh
rsync daemon port 9999 no-detach -v config .rsyncd.conf
```

### Best command EVER!!
```sh
rsync
```

### rsync + find
```sh
rsync -avz -e ssh files-from=<(find -mtime +30 -mtime -60) source dest
```

### Migrate Server with rsync
```sh
rsync -ayz -e ssh exclude=/proc exclude=/sys exclude=/dev / root@NEWHOST:/MNTDIR
```

### create an incremental backup of a directory using hard links
```sh
rsync -a delete link-dest=../lastbackup $folder $dname/
```

### Copy the contents of one partition to another
```sh
rsync -avxHAXW info=progress2 /old-disk /new-disk/
```

### Rsync two directories with filtered extensions
```sh
rsync -rv include '*/' include '*.txt' exclude '*' srcDir/ desDir/
```

### Remote copy directories and files through an SSH tunnel host
```sh
rsync -avz -e 'ssh -A sshproxy ssh' srcdir remhost:dest/path/
```

### syncronizing datas beetween two folder (A and B) excluding some directories in A (dir1 and dir2)
```sh
rsync -av ignore-existing exclude="dir1" exclude="dir2" /pathA /pathB
```

### How to backup hard disk timely?
```sh
rsync -a link-dest=/media/backup/$HOSTNAME/$PREVDATE 'exclude=/[ps][ry][os]' exclude=/media/backup/$HOSTNAME / /media/backup/$HOSTNAME/$DATE/
```

### Resume scp of a big file
```sh
rsync partial progress rsh=ssh  $file_source $user@$host:$destination_file
```

### Rsync a directory excluding pesky .svn dirs
```sh
rsync -rv exclude .svn src/dir/ dest/dir/
```

### rsync over ssh via non-default ssh port
```sh
rsync -e 'ssh -p PORT' user@host:SRC DEST
```

### Rsync files with spaces
```sh
rsync [options]  * target
```

### Start a quick rsync daemon for fast copying on internal secure network
```sh
rsync daemon port 1234 no-detach -v config rsyncd.conf
```

### Rsync remote data as root using sudo
```sh
rsync rsync-path 'sudo rsync' username@source:/folder/ /local/
```

### rsync instead of scp
```sh
rsync progress partial rsh="ssh -p 8322" bwlimit=100 ipv4 user@domain.com:~/file.tgz .
```

### Copy specific files recursively using the same tree organization.
```sh
rsync -vd files-from=<(find .  -name entries -print ) .   ../target_directory
```

### resume scp-filetransfer with rsync
```sh
rsync partial progress rsh=ssh user@host:remote-file local-file
```

### Backup entire directory using rsync
```sh
rsync -avzhP <[[user@]host1:]directory1> <[[user@]host2:]directory2>
```

### exclude file(s) from rsync
```sh
rsync -vazuK exclude "*.mp3" exclude "*.svn*" * user@host:/path
```

### Copy with progress
```sh
rsync progress file1 file2
```

### Synchronise a file from a remote server
```sh
rsync -av -e ssh user@host:/path/to/file.txt .
```

### Copy a file from a remote server to your local box using on-the-fly compression
```sh
rsync -Pz user@remotehost:/path/file.dat .
```

### Sync the existing directory structure to destination, without transferring any files
```sh
rsync -av -f"+ */" -f"- *" [source] [dest]
```

### Resume scp of a big file
```sh
rsync -a -v stats -e ssh /home root@<newserver>:/root/
```

### move a lot of files over ssh
```sh
rsync -az /home/user/test user@sshServer:/tmp/
```

### How to backup hard disk timely?
```sh
rsync -av link-dest=$(ls -1d /backup/*/ | tail -1) /data/ /backup/$(date +%Y%m%d%H%M)/
```

### Resume aborted scp file transfers
```sh
rsync partial progress rsh=ssh SOURCE DESTINATION
```

### Virtualbox rsync copy (without defining any virtualbox configuration)
```sh
rsync -a progress -e 'ssh -p 2200 -i .vagrant/machines/default/virtualbox/private_key' vagrant@127.0.0.1:/vagrant/vm/old_timecapsule_backup /Volumes/2TB/
```

### rsync over ssh using alternative port number
```sh
rsync -arvz -e 'ssh -p 2233' progress delete remote-user@remote-server.org:/path/to/folder /path/to/local/folder
```

### Rsync between two servers
```sh
rsync -zav progress original_files_directory/ root@host(IP):/path/to/destination/
```

### sync two folders except hidden files
```sh
rsync -vau exclude='.*' SOURCE-PATH/myfold TARGET-PATH
```

### Copy files based on extension with recursive and keeping directory structure
```sh
rsync -rv include '*/' include '*.jar' exclude '*' srcDir desDir
```

### Copy recursivelly files of specific filetypes
```sh
rsync -rvtW progress include='*.wmv' include='*.mpg' exclude='*.*' <sourcedir> <destdir>
```

### Transfer Entire recursive from one host to another. Only copies files that are newer or do not exist
```sh
rsync -azE -e "ssh -pPortnumber" src_dir user@hostB:dest_dir
```

### Backup files incremental with rsync to a NTFS-Partition
```sh
rsync -rtvu modify-window=1 progress /media/SOURCE/ /media/TARGET/
```

### Microsoft Robocopy imitation (with recursion, pruning, and compression)
```sh
rsync -ahhmz progress stats [[user@]host:]/source/path/ [[user@]host:]/destination/path/
```

### Sync copy directories except (OSX)
```sh
rsync -rP exclude=x source/ target/
```

### The fastest remote directory rsync over ssh archival I can muster (40MB/s over 1gb NICs)
```sh
rsync -aHAXxv numeric-ids delete progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>
```

### Transfer with rsync a file using SSH with a forced HMAC integrity algorithm
```sh
rsync -av -e "ssh -o MACs=hmac-ripemd160" progress partial user@remotehost://path/to/remote/stuff .
```

### make rsync progress output suitable for shell script reading
```sh
rsync progress user@host:/path/to/source /path/to/target/ | stdbuf -oL tr '\r' '\n' >> rsyncprogress.txt
```

### Synchronize directory copy
```sh
rsync -avz ~/src ~/des/
```

### rsync from remote to local with non standard ssh port
```sh
rsync -avz -e "ssh -p $portNumber" user@remote.host:/path/to/copy /local/path
```

### rsync from remote to local
```sh
rsync -chavzP stats user@remote.host:/path/to/copy /path/to/local/storage
```

### Optimal way of deleting huge numbers of files
```sh
rsync -a delete empty-dir/ target-dir/
```

### copy with progress bar - rsync
```sh
rsync -rv <src> <dst> progress
```

### Incremental copy to remote host
```sh
rsync -v ignore-existing `ls | head -n 40` root@localhost:/location
```

### copy root to new device
```sh
rsync -aHux exclude=/proc/* exclude=/sys/* /* /mnt/target/
```

### copy with progress bar - rsync
```sh
rsync -aP no-whole-file inplace
```

### Sync files in /var/www/html dir with other server excluding files in exclude_files.txt
```sh
rsync  -arl  rsh=ssh progress exclude-from=/etc/localbin/exclude_files.txt  /var/www/html/source/* <user>@<server>:/var/www/html/source/
```

### rsync a hierarchy but matching only one filename
```sh
rsync -avz dry-run include="only-include-this-filename" -f 'hide,! */' source/folder/ target/folder/
```

### rsync...
```sh
rsync -avz -e ssh user@host:/srcpath destpath
```

### All what exists in dir B and not in dir A will be copied from dir B to new or existing dir C
```sh
rsync -v -r size-only compare-dest=../A/ B/ C/
```

### rsync progress indicator which updates in-place
```sh
rsync recursive info=progress2 <src> <dst>
```

### Copy only hidden files and directories with rsync.
```sh
rsync -a /path/from/.[^.]* /path/to
```

### Incremental Backup via rsync
```sh
rsync -aAXv / exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/home/*","/lost+found/*"} <backup path> > <path_of log file>
```

### rsync over ssh
```sh
rsync -avz -e ssh username@hostname:/path/to/remote/dir/ /path/to/local/dir/
```

### Real full backup copy of /etc folder
```sh
rsync -a /etc /destination
```

### rsync with progress bar.
```sh
rsync -av progress ./file.txt user@host:/path/to/dir
```

### Create a mirror of a local folder, on a remote server
```sh
rsync -e "/usr/bin/ssh -p22" -a progress stats delete -l -z -v -r -p /root/files/ user@remote_server:/root/files/
```

### rsync + find
```sh
rsync -avz -e ssh files-from=<(find -mtime +30 -mtime -60) source dest
```

### Migrate Server with rsync
```sh
rsync -ayz -e ssh exclude=/proc exclude=/sys exclude=/dev / root@NEWHOST:/MNTDIR
```

### create an incremental backup of a directory using hard links
```sh
rsync -a delete link-dest=../lastbackup $folder $dname/
```

### Copy the contents of one partition to another
```sh
rsync -avxHAXW info=progress2 /old-disk /new-disk/
```

### Rsync two directories with filtered extensions
```sh
rsync -rv include '*/' include '*.txt' exclude '*' srcDir/ desDir/
```

### Remote copy directories and files through an SSH tunnel host
```sh
rsync -avz -e 'ssh -A sshproxy ssh' srcdir remhost:dest/path/
```

### syncronizing datas beetween two folder (A and B) excluding some directories in A (dir1 and dir2)
```sh
rsync -av ignore-existing exclude="dir1" exclude="dir2" /pathA /pathB
```

### How to backup hard disk timely?
```sh
rsync -a link-dest=/media/backup/$HOSTNAME/$PREVDATE 'exclude=/[ps][ry][os]' exclude=/media/backup/$HOSTNAME / /media/backup/$HOSTNAME/$DATE/
```

### Resume scp of a big file
```sh
rsync partial progress rsh=ssh  $file_source $user@$host:$destination_file
```

### Rsync a directory excluding pesky .svn dirs
```sh
rsync -rv exclude .svn src/dir/ dest/dir/
```

### rsync over ssh via non-default ssh port
```sh
rsync -e 'ssh -p PORT' user@host:SRC DEST
```

### Rsync files with spaces
```sh
rsync [options]  * target
```

### Start a quick rsync daemon for fast copying on internal secure network
```sh
rsync daemon port 1234 no-detach -v config rsyncd.conf
```

### Rsync remote data as root using sudo
```sh
rsync rsync-path 'sudo rsync' username@source:/folder/ /local/
```

### rsync instead of scp
```sh
rsync progress partial rsh="ssh -p 8322" bwlimit=100 ipv4 user@domain.com:~/file.tgz .
```

### Copy specific files recursively using the same tree organization.
```sh
rsync -vd files-from=<(find .  -name entries -print ) .   ../target_directory
```

### resume scp-filetransfer with rsync
```sh
rsync partial progress rsh=ssh user@host:remote-file local-file
```

### Backup entire directory using rsync
```sh
rsync -avzhP <[[user@]host1:]directory1> <[[user@]host2:]directory2>
```

### exclude file(s) from rsync
```sh
rsync -vazuK exclude "*.mp3" exclude "*.svn*" * user@host:/path
```

### Copy with progress
```sh
rsync progress file1 file2
```

### Synchronise a file from a remote server
```sh
rsync -av -e ssh user@host:/path/to/file.txt .
```

### Copy a file from a remote server to your local box using on-the-fly compression
```sh
rsync -Pz user@remotehost:/path/file.dat .
```

### Sync the existing directory structure to destination, without transferring any files
```sh
rsync -av -f"+ */" -f"- *" [source] [dest]
```

### Resume scp of a big file
```sh
rsync -a -v stats -e ssh /home root@<newserver>:/root/
```

### move a lot of files over ssh
```sh
rsync -az /home/user/test user@sshServer:/tmp/
```

### How to backup hard disk timely?
```sh
rsync -av link-dest=$(ls -1d /backup/*/ | tail -1) /data/ /backup/$(date +%Y%m%d%H%M)/
```

### Resume aborted scp file transfers
```sh
rsync partial progress rsh=ssh SOURCE DESTINATION
```

### Virtualbox rsync copy (without defining any virtualbox configuration)
```sh
rsync -a progress -e 'ssh -p 2200 -i .vagrant/machines/default/virtualbox/private_key' vagrant@127.0.0.1:/vagrant/vm/old_timecapsule_backup /Volumes/2TB/
```

### rsync over ssh using alternative port number
```sh
rsync -arvz -e 'ssh -p 2233' progress delete remote-user@remote-server.org:/path/to/folder /path/to/local/folder
```

### Rsync between two servers
```sh
rsync -zav progress original_files_directory/ root@host(IP):/path/to/destination/
```

### sync two folders except hidden files
```sh
rsync -vau exclude='.*' SOURCE-PATH/myfold TARGET-PATH
```

### Copy files based on extension with recursive and keeping directory structure
```sh
rsync -rv include '*/' include '*.jar' exclude '*' srcDir desDir
```

### Copy recursivelly files of specific filetypes
```sh
rsync -rvtW progress include='*.wmv' include='*.mpg' exclude='*.*' <sourcedir> <destdir>
```

### Transfer Entire recursive from one host to another. Only copies files that are newer or do not exist
```sh
rsync -azE -e "ssh -pPortnumber" src_dir user@hostB:dest_dir
```

### Backup files incremental with rsync to a NTFS-Partition
```sh
rsync -rtvu modify-window=1 progress /media/SOURCE/ /media/TARGET/
```

### Microsoft Robocopy imitation (with recursion, pruning, and compression)
```sh
rsync -ahhmz progress stats [[user@]host:]/source/path/ [[user@]host:]/destination/path/
```

### Sync copy directories except (OSX)
```sh
rsync -rP exclude=x source/ target/
```

### The fastest remote directory rsync over ssh archival I can muster (40MB/s over 1gb NICs)
```sh
rsync -aHAXxv numeric-ids delete progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>
```

### Transfer with rsync a file using SSH with a forced HMAC integrity algorithm
```sh
rsync -av -e "ssh -o MACs=hmac-ripemd160" progress partial user@remotehost://path/to/remote/stuff .
```

### make rsync progress output suitable for shell script reading
```sh
rsync progress user@host:/path/to/source /path/to/target/ | stdbuf -oL tr '\r' '\n' >> rsyncprogress.txt
```

### Synchronize directory copy
```sh
rsync -avz ~/src ~/des/
```

### rsync from remote to local with non standard ssh port
```sh
rsync -avz -e "ssh -p $portNumber" user@remote.host:/path/to/copy /local/path
```

### rsync from remote to local
```sh
rsync -chavzP stats user@remote.host:/path/to/copy /path/to/local/storage
```

### Optimal way of deleting huge numbers of files
```sh
rsync -a delete empty-dir/ target-dir/
```

### copy with progress bar - rsync
```sh
rsync -rv <src> <dst> progress
```

### Incremental copy to remote host
```sh
rsync -v ignore-existing `ls | head -n 40` root@localhost:/location
```

### copy root to new device
```sh
rsync -aHux exclude=/proc/* exclude=/sys/* /* /mnt/target/
```

### copy with progress bar - rsync
```sh
rsync -aP no-whole-file inplace
```

### All what exists in dir B and not in dir A will be copied from dir B to new or existing dir C
```sh
rsync -v -r size-only compare-dest=../A/ B/ C/
```
