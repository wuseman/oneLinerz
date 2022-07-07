# tar

### Remove all files previously extracted from a tar(.gz) file.
```sh
tar -tf <file.tar.gz> | xargs rm -r
```

### Remove all files previously extracted from a tar(.gz) file.
```sh
tar -tf <file.tar.gz> | xargs rm -r
```

### Encrypt directory with GnuPG and tar
```sh
tar zcf - foo | gpg -c cipher-algo aes256 -o foo.tgz.gpg
```

### netcat - send tar archive remotely (sending side)
```sh
tar -cjf - $DIR | nc $HOST $PORT
```

### Tar - Compress by excluding folders
```sh
tar -cvf /path/dir.tar /path/dir* exclude "/path/dir/name" exclude "/path/dir/opt"
```

### Create a tar archive using 7z compression
```sh
tar cf - /path/to/data | 7z a -si archivename.tar.7z
```

### Move files around local filesystem with tar without wasting space using an intermediate tarball.
```sh
tar -C <source> -cf - . | tar -C <destination> -xf -
```

### tar the current directory wihtout the absolute path
```sh
tar -cf "../${PWD##*/}.tar" .
```

### Encrypted Tarballs
```sh
tar -cf  - folder/ | gpg -c > folder.tpg
```

### Copy files from one dir to another using tar.
```sh
tar cf - . | (cd /new/dir; tar xvf -)
```

### Create a tar file compressed with xz.
```sh
tar cfJ tarfile.tar.xz pathnames
```

### restore <mysqldump>.tar.gz on the fly
```sh
tar xfzO <backup_name>.tar.gz | mysql -u root <database_name>
```

### Compressed Backup of the /etc
```sh
tar jcpf /home/[usuario]/etc-$(hostname)-backup-$(date +%Y%m%d-%H%M%S).tar.bz2 /etc
```

### backup file with tar
```sh
tar -cvf bind9-config-`date +%s`.tar *
```

### Unpack .tgz File On Linux
```sh
tar zxvf fileNameHere.tgz
```

### Remove all files previously extracted from a tar(.gz) file.
```sh
tar -tf <file.tar.gz> | parallel rm
```

### create tar.gz archive
```sh
tar -pczf archive_name.tar.gz /path/to/dir/or/file
```

### Real full backup copy of /etc folder
```sh
tar -cf - /etc | tar -xf - -C </destination/folder>
```

### Bulk copy large blocks of data between File Systems (run as root iff you do not own all of the files!)
```sh
tar cpof - src |( cd des; tar xpof -)
```

### tar - extract only one file
```sh
tar zxvf package.tar.gz strip 1
```

### checksum a directory / files
```sh
tar -cf - file1 dir1/ dir2/ | md5sum
```

### Move files around local filesystem with tar without wasting space using an intermediate tarball.
```sh
tar -C <source_dir> -cf . | tar -C <dest_dir> -xf -
```

### backup and remove files with access time older than 5 days.
```sh
tar -zcvpf backup_`date +"%Y%m%d_%H%M%S"`.tar.gz `find <target> -atime +5 -type f` 2> /dev/null | parallel -X rm -f
```

### Tar Pipe
```sh
tar cvf - /src | ( cd /dest ; tar xvf - )
```

### backup the old files
```sh
tar -zcps <dir> -X <(find <dir> -type f -mtime -<days>) |ssh user@backuphost tar -xzpsC /data/bkup
```

### Move files around local filesystem with tar without wasting space using an intermediate tarball.
```sh
tar -C <source_dir> -cf . | tar -C <dest_dir> -xf
```

### Unzip multi-part zip archive
```sh
tar -xfv archive.zip
```

### Tar a subversion working copy...without all those hidden directories!
```sh
tar exclude='.svn' -c -f /path/to/file.tar /path/to/directory
```

### Create a tar.gz in a single command
```sh
tar cvf - foodir | gzip > foo.tar.gz
```

### create one md5 for all files in folder
```sh
tar c folderName | md5
```

### ls -lR with a full path
```sh
tar -cvf /dev/null . | while read i; do ls -l $i; done
```

### Copy specific files to another machine, keeping the file hierarchy
```sh
tar cpfP - $(find <somedir> -type f -name *.png) | ssh user@host | tar xpfP -
```

### backup and remove files with access time older than 5 days.
```sh
tar -zcvpf backup_`date +"%Y%m%d_%H%M%S"`.tar.gz `find <target> -atime +5` 2> /dev/null | xargs rm -fr ;
```

### Exclude .svn, .git and other VCS junk for a pristine tarball
```sh
tar exclude-vcs -cf src.tar src/
```

### Pack up some files into a tarball on a remote server without writing to the local filesystem
```sh
tar -czf - * | ssh example.com "cat > files.tar.gz"
```

### backup a directory in a timestamped tar.gz
```sh
tar -czvvf backup$(date "+%Y%m%d_%H%M%S").tar.gz /path/to/dir
```

### Encrypted archive with openssl and tar
```sh
tar c folder_to_encrypt | openssl enc -aes-256-cbc -e > secret.tar.enc
```

### copy working directory and compress it on-the-fly while showing progress
```sh
tar -cf - . | pv -s $(du -sb . | awk '{print $1}') | gzip > out.tgz
```

### Encrypted archive with openssl and tar
```sh
tar create file - posix gzip  <dir> | openssl enc -e -aes256 -out <file>
```

### Create a tar of directory structure only
```sh
tar -cf ~/out.tar no-recursion files-from <(find . -type d)
```

### tar exclude files or directories
```sh
tar -cvzf home_backup.tar.gz exclude={.*,Downloads} /home/<user>
```

### throttle bandwidth with cstream
```sh
tar -cj /backup | cstream -t 777k | ssh host 'tar -xj -C /backup'
```

### Command line progress bar
```sh
tar zcf - user | pv /bin/gzip > /tmp/backup.tar.gz
```

### Tar - Compress by excluding folders
```sh
tar -cvzf arch.tgz $(find /path/dir -not -type d)
```

### untar undo
```sh
tar tfz filename.tgz |xargs rm -Rf
```

### Compare an archive with filesystem
```sh
tar dfz horde-webmail-1.2.3.tar.gz
```

### Send a backup job to a remote tape drive on another machine over SSH
```sh
tar cvzf - /directory/ | ssh root@host "cat > /dev/nst0"
```

### Archive a directory with datestamp on filename
```sh
tar zcvf somedir-$(date +%Y%m%d-%H%M).tar.gz somedir/
```

### Create a tar file with the current date in the name.
```sh
tar cfz backup-$(date iso).tar.gz somedirs
```

### tar.gz with gpg-encryption on the fly
```sh
tar -cvz /<path>/ | gpg encrypt recipient <keyID> > /<backup-path>/backup_`date +%d_%m_%Y`.tar.gz.gpg
```

### mail with attachment
```sh
tar cvzf - data1 data2 | uuencode data.tar.gz | mail -s 'data' you@host.fr
```

### oneliner to transfer a directory using ssh and tar
```sh
tar cvzf - dir | ssh my_server 'tar xzf -'
```

### Get a range of SVN revisions from svn diff and tar gz them
```sh
tar cvfz changes.tar.gz exclude-vcs `svn diff -rM:N summarize . | grep . | awk '{print $2}' | grep -E -v '^\.$'`
```

### Split a tarball into multiple parts
```sh
tar cf - <dir>|split -b<max_size>M - <name>.tar.
```

### send a file or directory via ssh compressing with lzma for low trafic
```sh
tar -cf - ./file | lzma -c | ssh user@sshserver $(cd /tmp; tar lzma -xf -)
```

### Simple complete system backup excluding files or directories
```sh
tar zcpf backup.tgz exclude=/proc exclude=backup.tgz /
```

### Update a tarball
```sh
tar -tf file.tar | tar -T - -uf file.tar
```

### Clean up after a poorly-formed tar file
```sh
tar ztf tar-lacking-subdirectory.tar.gz | xargs rm
```

### Adhoc tar backup
```sh
tar -cvzf - /source/path | ssh <targethostname> -l <username> dd of=/destination/path/backupfile.tgz
```

### strip non-constant number of directories from tar archive while decompressing
```sh
tar transform 's#.*/\([^/]*\)$#\1#' -xzvf test-archive.tar.gz
```

### copy paste multiple binary files
```sh
tar -c bins/ | gzip -9 | openssl enc -base64
```

### Tar files matching a certain wildcard
```sh
tar -czf ../header.tar.gz $(find . -name *.h)
```

### Extract tar.gz file with original permission
```sh
tar -xvpf file.tar.gz
```

### Creat a tar file for backup info
```sh
tar create file /path/$HOSTNAME-my_name_file-$(date -I).tar.gz atime-preserve -p -P same-owner -z /path/
```

### create tar archive of files in a directory and its sub-directories
```sh
tar czf /path/archive_of_foo.`date -I`.tgz /path/foo
```

### tar copy
```sh
tar cf - dir_to_cp/ | (cd path_to_put/ && tar xvf -)
```

### Unpack .tgz File On Linux
```sh
tar -axf fileNameHere.tgz
```

### Copy via tar pipe while preserving file permissions (run this command as root!)
```sh
tar -C /oldirectory -cvpf - . | tar -C /newdirector -xvf -
```

### Backup trought SSH
```sh
tar cvzf - /wwwdata | ssh root@IP "dd of=/backup/wwwdata.tar.gz"
```

### tar+pbzip2 a dir
```sh
tar exclude='patternToExclude' use-compress-program=pbzip2 -cf 'my-archive.tar.bz2' directoyToZip/
```

### Extract .tar.lzma archive
```sh
tar lzma -xvf /path/to/archive
```

### Extract multiple tar files at once in zsh
```sh
tar -xi < *.tar
```

### tar directory and compress it with showing progress and Disk IO limits
```sh
tar pcf - home | pv -s $(du -sb home | awk '{print $1}') rate-limit 500k | gzip > /mnt/c/home.tar.gz
```

### Create a tar file with the current date in the name.
```sh
tar cfz backup-`date +%F`.tgz somedirs
```

### Remote backups with tar over ssh
```sh
tar jcpf - [sourceDirs] |ssh user@host "cat > /path/to/backup/backupfile.tar.bz2"
```

### tar a directory and send it to netcat
```sh
tar cfvz - /home/user | netcat -l -p 10000
```

### Create a tar archive using xz compression
```sh
tar -cJf myarchive.tar.xz /path/to/archive/
```

### scping files with streamlines compression (tar gzip)
```sh
tar czv file1 file2 folder1 | ssh user@server tar zxv -C /destination
```

### Extract tar content without leading parent directory
```sh
tar -xaf archive.tar.gz strip-components=1
```

### tar+pbzip2 a dir
```sh
tar -c directory_to_compress/ | pbzip2 -vc > myfile.tar.bz2
```

### Compress a file or directory keeping the owner and permissions
```sh
tar -jcvf /folder/file.tar.bz2 same-owner same-permissions /folder/
```

### Create a tar archive using xz compression
```sh
tar -cvf - /path/to/tar/up | xz - > myTarArchive.tar.xz
```

### Compress files in a directory
```sh
tar -zcvf archive-name.tar.gz directory-name
```

### Create tar over SSH
```sh
tar cvzf - /folder/ | ssh root@192.168.0.1 "dd of=/dest/folder/file.tar.gz"
```

### tar via network
```sh
tar cfX - exclude_opt_weblogic . | ssh tmp-esxsb044 "cd /opt/weblogic ; tar xf -"
```

### Full  remote server backup over cstream using tar (excluding unnecessary files) (reports every 10 seconds)
```sh
tar -cj / -X /tmp/exclude.txt | cstream -v 1 -c 3 -T 10 | ssh user@host 'tar -xj -C /backupDestination'
```

### Archive and compress a directory using gunzip compression
```sh
tar -zcvf archive_name.tar.gz directory_to_compress
```

### encrypt, split and get ready for dvd a large file via tar and ccrypt
```sh
tar czf - /directory/to/tar | ccrypt -k yourpassword | split -b50m - /final/encrypted.cpt
```

### Redirect  tar extract to another directory
```sh
tar xfz filename.tar.gz -C PathToDirectory
```

### oneliner to transfer a directory using ssh and tar
```sh
tar -vzc /path/to/cool/directory | ssh -q my_server 'tar -vzx -C /'
```

### unpack tar.bz2
```sh
tar xjvf file.tar.bz2
```

### pack with tar tar.gz
```sh
tar cfvz archiv.tar.gz folder folder
```

### move a lot of files over ssh
```sh
tar -cf - /home/user/test | gzip -c | ssh user@sshServer 'cd /tmp; tar xfz -'
```

### Backup to tape, rewind and check md5
```sh
tar -cvf - $DIR_TO_BACKUP | tee >(md5sum > backup_md5.txt) > /dev/st0 && mt -f /dev/nst0 bsfm 1 && md5sum -c backup_md5.txt < /dev/st0
```

### Tar all files in a folder including hidden dot files
```sh
tar -zcvf file.tgz ./
```

### Shows the largest files in your archives
```sh
tar -tvjf backup.tar.bz2 | sort -nrk 3 | head
```

### Create a Multi-Part Archive Without Proprietary Junkware
```sh
tar czv Pictures | split -d -a 3 -b 16M - pics.tar.gz.
```

### backup your file with tar and exclude the file or directory which  you don't want
```sh
tar zcvf /path/to/your-`date +%Y-%m-%d`.tar.bz2 ./your/directory exclude ./you/dont/want/to/include
```

### Secure copy from one server to another without rsync and preserve users, etc
```sh
tar -czvf - /src/dir | ssh remotehost "(cd /dst/dir ; tar -xzvf -)"
```

### lists contents of a tar file
```sh
tar -tf /path/to/file.tar
```

### Clone perms and owner group from one file to another
```sh
tar -cpf - ./sourceFile | tar -xpf - -C ./targetDir/
```

### tar's and moves all contents of current directory to target dir
```sh
tar cf - . |(cd /targetdir; tar xvf -)
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
tar cvf my_txt_files.tar `find . -type f -name ".txt"`
```

### Untar file in current directory
```sh
tar xvzf <file.tar.gz>
```

### backup home dir exclude dot files
```sh
tar exclude=".??*" -zcvf ./home_backup_2008.tar.gz  my_home
```

### Tar a directory excluding CVS, SVN, GIT and similar directories
```sh
tar -cvj exclude-vcs -f archive.tar.bz2 somedirectory
```

### Tar a directory and its sub-directory
```sh
tar cvfz dir_name.tgz dir/
```

### have tar decide compression based on filename
```sh
tar -caf some_dir.tar.xz some_dir
```

### Tar dir excluding tmp
```sh
tar -zcvf <archive<.tar.gz exclude /home/szimbaro/tmp /home/szimbaro
```

### Create a simple backup
```sh
tar pzcvf /result_path/result.tar.gz /target_path/target_folder
```

### Backup hidden files and folders in home directory
```sh
tar zcpvf backup.tgz $(find $HOME -maxdepth 1 -name '.*' -and -not -name '.')
```

### create compressed encrypted backup
```sh
tar exclude-from=$excludefile -zcvp "$source" | openssl aes-128-cbc -salt -out $targetfile -k $key
```

### Create tarball of files modified in git
```sh
tar czf git_mods_circa_dec23.tgz files-from <(git ls-files -m)
```

### create tar.gz on solaris
```sh
tar cfp - file-to-be-archived | gzip > archive.tar.gz
```

### Remove all files previously extracted from a tar(.gz) file.
```sh
tar -tf <file.tar.gz> | xargs rm -r
```

### Create a tar archive using 7z compression
```sh
tar cf - /path/to/data | 7z a -si archivename.tar.7z
```

### Copy specific files to another machine, keeping the file hierarchy
```sh
tar cpfP - $(find <somedir> -type f -name *.png) | ssh user@host | tar xpfP -
```

### backup and remove files with access time older than 5 days.
```sh
tar -zcvpf backup_`date +"%Y%m%d_%H%M%S"`.tar.gz `find <target> -atime +5` 2> /dev/null | xargs rm -fr ;
```

### Exclude .svn, .git and other VCS junk for a pristine tarball
```sh
tar exclude-vcs -cf src.tar src/
```

### Pack up some files into a tarball on a remote server without writing to the local filesystem
```sh
tar -czf - * | ssh example.com "cat > files.tar.gz"
```

### backup a directory in a timestamped tar.gz
```sh
tar -czvvf backup$(date "+%Y%m%d_%H%M%S").tar.gz /path/to/dir
```

### Encrypted archive with openssl and tar
```sh
tar c folder_to_encrypt | openssl enc -aes-256-cbc -e > secret.tar.enc
```

### copy working directory and compress it on-the-fly while showing progress
```sh
tar -cf - . | pv -s $(du -sb . | awk '{print $1}') | gzip > out.tgz
```

### Encrypted archive with openssl and tar
```sh
tar create file - posix gzip  <dir> | openssl enc -e -aes256 -out <file>
```

### Create a tar of directory structure only
```sh
tar -cf ~/out.tar no-recursion files-from <(find . -type d)
```

### tar exclude files or directories
```sh
tar -cvzf home_backup.tar.gz exclude={.*,Downloads} /home/<user>
```

### throttle bandwidth with cstream
```sh
tar -cj /backup | cstream -t 777k | ssh host 'tar -xj -C /backup'
```

### Command line progress bar
```sh
tar zcf - user | pv /bin/gzip > /tmp/backup.tar.gz
```

### Tar - Compress by excluding folders
```sh
tar -cvzf arch.tgz $(find /path/dir -not -type d)
```

### untar undo
```sh
tar tfz filename.tgz |xargs rm -Rf
```

### Compare an archive with filesystem
```sh
tar dfz horde-webmail-1.2.3.tar.gz
```

### Send a backup job to a remote tape drive on another machine over SSH
```sh
tar cvzf - /directory/ | ssh root@host "cat > /dev/nst0"
```

### Archive a directory with datestamp on filename
```sh
tar zcvf somedir-$(date +%Y%m%d-%H%M).tar.gz somedir/
```

### Create a tar file with the current date in the name.
```sh
tar cfz backup-$(date iso).tar.gz somedirs
```

### tar.gz with gpg-encryption on the fly
```sh
tar -cvz /<path>/ | gpg encrypt recipient <keyID> > /<backup-path>/backup_`date +%d_%m_%Y`.tar.gz.gpg
```

### mail with attachment
```sh
tar cvzf - data1 data2 | uuencode data.tar.gz | mail -s 'data' you@host.fr
```

### oneliner to transfer a directory using ssh and tar
```sh
tar cvzf - dir | ssh my_server 'tar xzf -'
```

### Get a range of SVN revisions from svn diff and tar gz them
```sh
tar cvfz changes.tar.gz exclude-vcs `svn diff -rM:N summarize . | grep . | awk '{print $2}' | grep -E -v '^\.$'`
```

### Split a tarball into multiple parts
```sh
tar cf - <dir>|split -b<max_size>M - <name>.tar.
```

### send a file or directory via ssh compressing with lzma for low trafic
```sh
tar -cf - ./file | lzma -c | ssh user@sshserver $(cd /tmp; tar lzma -xf -)
```

### Simple complete system backup excluding files or directories
```sh
tar zcpf backup.tgz exclude=/proc exclude=backup.tgz /
```

### Update a tarball
```sh
tar -tf file.tar | tar -T - -uf file.tar
```

### Clean up after a poorly-formed tar file
```sh
tar ztf tar-lacking-subdirectory.tar.gz | xargs rm
```

### Adhoc tar backup
```sh
tar -cvzf - /source/path | ssh <targethostname> -l <username> dd of=/destination/path/backupfile.tgz
```

### strip non-constant number of directories from tar archive while decompressing
```sh
tar transform 's#.*/\([^/]*\)$#\1#' -xzvf test-archive.tar.gz
```

### copy paste multiple binary files
```sh
tar -c bins/ | gzip -9 | openssl enc -base64
```

### Tar files matching a certain wildcard
```sh
tar -czf ../header.tar.gz $(find . -name *.h)
```

### Extract tar.gz file with original permission
```sh
tar -xvpf file.tar.gz
```

### Creat a tar file for backup info
```sh
tar create file /path/$HOSTNAME-my_name_file-$(date -I).tar.gz atime-preserve -p -P same-owner -z /path/
```

### create tar archive of files in a directory and its sub-directories
```sh
tar czf /path/archive_of_foo.`date -I`.tgz /path/foo
```

### tar copy
```sh
tar cf - dir_to_cp/ | (cd path_to_put/ && tar xvf -)
```

### Unpack .tgz File On Linux
```sh
tar -axf fileNameHere.tgz
```

### Copy via tar pipe while preserving file permissions (run this command as root!)
```sh
tar -C /oldirectory -cvpf - . | tar -C /newdirector -xvf -
```

### Backup trought SSH
```sh
tar cvzf - /wwwdata | ssh root@IP "dd of=/backup/wwwdata.tar.gz"
```

### tar+pbzip2 a dir
```sh
tar exclude='patternToExclude' use-compress-program=pbzip2 -cf 'my-archive.tar.bz2' directoyToZip/
```

### Extract .tar.lzma archive
```sh
tar lzma -xvf /path/to/archive
```

### Extract multiple tar files at once in zsh
```sh
tar -xi < *.tar
```

### tar directory and compress it with showing progress and Disk IO limits
```sh
tar pcf - home | pv -s $(du -sb home | awk '{print $1}') rate-limit 500k | gzip > /mnt/c/home.tar.gz
```

### Create a tar file with the current date in the name.
```sh
tar cfz backup-`date +%F`.tgz somedirs
```

### Remote backups with tar over ssh
```sh
tar jcpf - [sourceDirs] |ssh user@host "cat > /path/to/backup/backupfile.tar.bz2"
```

### tar a directory and send it to netcat
```sh
tar cfvz - /home/user | netcat -l -p 10000
```

### Create a tar archive using xz compression
```sh
tar -cJf myarchive.tar.xz /path/to/archive/
```

### scping files with streamlines compression (tar gzip)
```sh
tar czv file1 file2 folder1 | ssh user@server tar zxv -C /destination
```

### Extract tar content without leading parent directory
```sh
tar -xaf archive.tar.gz strip-components=1
```

### tar+pbzip2 a dir
```sh
tar -c directory_to_compress/ | pbzip2 -vc > myfile.tar.bz2
```

### Compress a file or directory keeping the owner and permissions
```sh
tar -jcvf /folder/file.tar.bz2 same-owner same-permissions /folder/
```

### Create a tar archive using xz compression
```sh
tar -cvf - /path/to/tar/up | xz - > myTarArchive.tar.xz
```

### Compress files in a directory
```sh
tar -zcvf archive-name.tar.gz directory-name
```

### Create tar over SSH
```sh
tar cvzf - /folder/ | ssh root@192.168.0.1 "dd of=/dest/folder/file.tar.gz"
```

### tar via network
```sh
tar cfX - exclude_opt_weblogic . | ssh tmp-esxsb044 "cd /opt/weblogic ; tar xf -"
```

### Full  remote server backup over cstream using tar (excluding unnecessary files) (reports every 10 seconds)
```sh
tar -cj / -X /tmp/exclude.txt | cstream -v 1 -c 3 -T 10 | ssh user@host 'tar -xj -C /backupDestination'
```

### Archive and compress a directory using gunzip compression
```sh
tar -zcvf archive_name.tar.gz directory_to_compress
```

### encrypt, split and get ready for dvd a large file via tar and ccrypt
```sh
tar czf - /directory/to/tar | ccrypt -k yourpassword | split -b50m - /final/encrypted.cpt
```

### Redirect  tar extract to another directory
```sh
tar xfz filename.tar.gz -C PathToDirectory
```

### oneliner to transfer a directory using ssh and tar
```sh
tar -vzc /path/to/cool/directory | ssh -q my_server 'tar -vzx -C /'
```

### unpack tar.bz2
```sh
tar xjvf file.tar.bz2
```

### pack with tar tar.gz
```sh
tar cfvz archiv.tar.gz folder folder
```

### move a lot of files over ssh
```sh
tar -cf - /home/user/test | gzip -c | ssh user@sshServer 'cd /tmp; tar xfz -'
```

### Backup to tape, rewind and check md5
```sh
tar -cvf - $DIR_TO_BACKUP | tee >(md5sum > backup_md5.txt) > /dev/st0 && mt -f /dev/nst0 bsfm 1 && md5sum -c backup_md5.txt < /dev/st0
```

### Tar all files in a folder including hidden dot files
```sh
tar -zcvf file.tgz ./
```

### Shows the largest files in your archives
```sh
tar -tvjf backup.tar.bz2 | sort -nrk 3 | head
```

### Create a Multi-Part Archive Without Proprietary Junkware
```sh
tar czv Pictures | split -d -a 3 -b 16M - pics.tar.gz.
```

### backup your file with tar and exclude the file or directory which  you don't want
```sh
tar zcvf /path/to/your-`date +%Y-%m-%d`.tar.bz2 ./your/directory exclude ./you/dont/want/to/include
```

### Secure copy from one server to another without rsync and preserve users, etc
```sh
tar -czvf - /src/dir | ssh remotehost "(cd /dst/dir ; tar -xzvf -)"
```

### lists contents of a tar file
```sh
tar -tf /path/to/file.tar
```

### Clone perms and owner group from one file to another
```sh
tar -cpf - ./sourceFile | tar -xpf - -C ./targetDir/
```

### tar's and moves all contents of current directory to target dir
```sh
tar cf - . |(cd /targetdir; tar xvf -)
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
tar cvf my_txt_files.tar `find . -type f -name ".txt"`
```

### Untar file in current directory
```sh
tar xvzf <file.tar.gz>
```

### backup home dir exclude dot files
```sh
tar exclude=".??*" -zcvf ./home_backup_2008.tar.gz  my_home
```

### Tar a directory excluding CVS, SVN, GIT and similar directories
```sh
tar -cvj exclude-vcs -f archive.tar.bz2 somedirectory
```

### Tar a directory and its sub-directory
```sh
tar cvfz dir_name.tgz dir/
```

### have tar decide compression based on filename
```sh
tar -caf some_dir.tar.xz some_dir
```
