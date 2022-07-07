# diff

### Eavesdrop on your system
```sh
diff <(lsof -p 1234) <(sleep 10; lsof -p 1234)
```

### Eavesdrop on your system
```sh
diff <(lsof -p 1234) <(sleep 10; lsof -p 1234)
```

### neat diff of remote files owned by root on different systems
```sh
diff -u <(ssh -t user@host1 sudo cat /dir1/file1) <(ssh -t user@host2 sudo cat /dir2/file2)
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff -y suppress-common-lines <(sort -k2 <(md5deep -r -b directory1)) <(sort -k2 <(md5deep -r -b directory2))
```

### Compare a remote file with a local file
```sh
diff /path/to/localfile <(ssh user@host cat /path/to/remotefile)
```

### Describe differences between files
```sh
diff changed-group-format='differs from line %dF to line %dL|' unchanged-line-format='' $FILE1 $FILE2 | sed 's/|/\n/'
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff the outputs of two programs
```sh
diff <(exiftool img_1.jpg) <(exiftool img_2.jpg)
```

### Compare two directory trees.
```sh
diff -qr <dir1> <dir2>
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### shows which files differ in two direcories
```sh
diff -qr /dirA /dirB
```

### Compare two directory trees.
```sh
diff <(cd dir1 && find | sort) <(cd dir2 && find | sort)
```

### compare three file
```sh
diff3 -a file1 file2 file3
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### find the difference between two nodes
```sh
diff <(ssh nx915000 "rpm -qa") <(ssh nx915001 "rpm -qa")
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff 2 file struct - Useful for branch diff and jars diff(uncompressed)
```sh
diff <(cd A; find -type f|xargs md5sum ) <(cd B; find -type f | xargs md5sum )
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff on two variables
```sh
diff <(echo "$a") <(echo "$b")
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff files while disregarding indentation and trailing white space
```sh
diff -b $file1 $file2 # GNU Tools
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Find usb device
```sh
diff <(lsusb) <(sleep 3s && lsusb)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Generate diff of first 500 lines of two files
```sh
diff <(head -500 product-feed.xml) <(head -500 product-feed.xml.old)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two sorted files
```sh
diff <(sort file1.txt) <(sort file2.txt)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff remote webpages using wget
```sh
diff <(wget -q -O - URL1) <(wget -q -O - URL2)
```

### Compare two directories
```sh
diff suppress-common-lines -y <(cd path_to_dir1; find .|sort) <(cd path_to_dir2; find .|sort)
```

### diff output of two commands
```sh
diff <(tail -10 file1) <(tail -10 file2)
```

### Check if x509 certificate file and rsa private key match
```sh
diff <(openssl x509 -noout -modulus -in server.crt ) <( openssl rsa -noout -modulus -in server.key )
```

### Create patch file for two directories
```sh
diff -r -u originDir updateDir > result.patch
```

### Compare two directory trees.
```sh
diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)
```

### Recursively compare two directories and output their differences on a readable format
```sh
diff -urp /originaldirectory /modifieddirectory
```

### Compare a remote file with a local file
```sh
diff <(ssh user@host cat /path/to/remotefile) /path/to/localfile
```

### Probably, most frequent use of diff
```sh
diff -Naur strip-trailing-cr
```

### Compare a remote dir with a local dir
```sh
diff -y <(ssh user@host  find /boot|sort) <(find /boot|sort)
```

### Word-based diff on reformatted text files
```sh
diff -uw <(fmt -1 {file1, file2})
```

### diff will usually only take one file from STDIN. This is a method to take the result of two streams and compare with diff. The example I use to compare two iTunes libraries but it is generally applicable.
```sh
diff <(cd /path-1; find . -type f -print | egrep -i '\.m4a$|\.mp3$') <(cd /path-2; find . f -print | egrep -i '\.m4a$|\.mp3$')
```

### diff two svn repos ignoring spaces,tabs and svnfiles
```sh
diff -wubBEr -x .svn dirA dirB
```

### diff files while disregarding indentation and trailing white space
```sh
diff <(perl -wpl -e '$_ =~ s/^\s+|\s+$//g ;' file1) <(perl -wpl -e '$_ =~ s/^\s+|\s+$//g ;' file2)
```

### Check SSH public and private keys matching
```sh
diff <(ssh-keygen -y -f ~/.ssh/id_rsa) <(cut -d' ' -f1,2 ~/.ssh/id_rsa.pub)
```

### diff process output
```sh
diffprocess () { diff <($*) <(sleep  3; $*); }
```

### Diff files on two remote hosts.
```sh
diff <(ssh alice cat /etc/apt/sources.list) <(ssh bob cat /etc/apt/sources.list)
```

### diff directories, quick cut and paste to view the changes
```sh
diff -q dir1/ dir2/ | grep differ | awk '{ print "vimdiff " $2 " " $4 }'
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff <(sort <(md5deep -r /directory/1/) |cut -f1 -d' ') <(sort <(md5deep -r /directory/2/) |cut -f1 -d' ')
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff <(sort <(md5deep -b -r /directory/1/) ) <(sort <(md5deep -b -r /directory/2/)
```

### Identify differences between directories (possibly on different servers)
```sh
diff <(ssh server01 'cd config; find . -type f -exec md5sum {} \;| sort -k 2') <(ssh server02 'cd config;find . -type f -exec md5sum {} \;| sort -k 2')
```

### diff the same file in two directories.
```sh
diff {$path1,$path2}/file_to_diff
```

### Diff XML files
```sh
diffxml() { diff -wb <(xmllint format "$1") <(xmllint format "$2"); }
```

### diff 2 remote files
```sh
diff <(ssh user@host1 cat /path/to/file) <(ssh user@host2 cat /path/to/file2)
```

### Scan your LAN for unauthorized IPs
```sh
diff <(nmap -sP 192.168.1.0/24 | grep ^Host | sed 's/.appears to be up.//g' | sed 's/Host //g') auth.hosts | sed 's/[0-9][a-z,A-Z][0-9]$//' | sed 's/</UNAUTHORIZED IP -/g'
```

### Convert diff output to HTML ins/del
```sh
diff a.txt b.txt | grep -E '^(<|>)' | sed 's:^< \(.*\):<del style="color\:red; text-decoration\: none">- \1</del><br>:' | sed 's:^> \(.*\):<ins style="color\:green; text-decoration\: none">+ \1</ins><br>:'
```

### Compare copies of a file with md5
```sh
diff <(md5sum render_pack.zip| cut -d " " -f 1) <(md5sum /media/green/render_pack.zip| cut -d " " -f 1);echo $?
```

### Using commandoutput as a file descriptor
```sh
diff rpm_output_from_other_computer <(rpm -qa|sort)
```

### diff recursively, ignoring CVS control files
```sh
diff -x "*CVS*" -r <path-1> <path-2> [<path-3>]
```

### Check fstab volumes and volumes mounted.
```sh
diff <(cat /etc/fstab | grep vol | grep -v "^#" | awk '{print $1}') <(df -h | grep vol)
```

### diff two css files to create an overriding css (e.g. for wordpress child themes)
```sh
diff -U99999 original.css modified.css  | awk '/^-/{next} {f=f"\n"$0} /^\+.*[^ ]/{yes=1} /}/ {if(yes){print f} f="";yes=0}'
```

### See which files differ in a diff
```sh
diff dir1 dir2 | diffstat
```

### Display diffed files sidebyside, with minimal differences, using the full width of the terminal.
```sh
diff -dbByw $COLUMNS FILE1 FILE2
```

### Create patch file for two directories
```sh
diff -ru originDir updateDir > result.patch
```

### Copy all file differences to an existing mirror location
```sh
diff -Naur /source/path /target/path brief | awk '{print "cp " $2 " " $4}' | sh
```

### Check the MD5
```sh
diff -ua <(w3m -dump http://www.php.net/downloads.php|fgrep -A1 '5.2.15 (tar.bz2)'|awk '/md5:/{print $2}') <(md5sum php-5.2.15.tar.bz2|awk '{print $1}')
```

### diff files ignoring comments and blank lines (lines starting with #)
```sh
diff -u <(grep -vE '^(#|$)' file1) <(grep -vE '^(#|$)' file2)
```

### Diff with Sections/Headers
```sh
diff -U 9999 file_a file_b | tail -n +3 | grep -P "^(\ Header|\-|\+)"
```

### Compares two source directories, one original and one post configure and deletes the differences in the source folder
```sh
diff ../source-dir.orig/ ../source-dir.post/ | grep "Only in" | sed -e 's/^.*\:.\(\<.*\>\)/\1/g' | xargs rm -r
```

### diff files ignoring comments and blank lines (lines starting with #)
```sh
diff -BI '^#' file{1,2}
```

### Compare a remote file with a local file
```sh
diff <(ssh $remote_site cat $file) $file
```

### Compare directories via diff
```sh
diff -rq dirA dirB
```

### To help sort through differences in .txt files
```sh
diff *txt -u | less
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff <(sort <(md5deep -r /directory/1/) | awk -F '/' '{print $1 $NF}') <(sort <(md5deep -r /directory/2/)  | awk -F '/' '{print $1 $NF}')
```

### Eavesdrop on your system
```sh
diff <(lsof -p 1234) <(sleep 10; lsof -p 1234)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff the outputs of two programs
```sh
diff <(exiftool img_1.jpg) <(exiftool img_2.jpg)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Compare two directory trees.
```sh
diff <(cd dir1 && find | sort) <(cd dir2 && find | sort)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### find the difference between two nodes
```sh
diff <(ssh nx915000 "rpm -qa") <(ssh nx915001 "rpm -qa")
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff 2 file struct - Useful for branch diff and jars diff(uncompressed)
```sh
diff <(cd A; find -type f|xargs md5sum ) <(cd B; find -type f | xargs md5sum )
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff on two variables
```sh
diff <(echo "$a") <(echo "$b")
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff files while disregarding indentation and trailing white space
```sh
diff -b $file1 $file2 # GNU Tools
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Find usb device
```sh
diff <(lsusb) <(sleep 3s && lsusb)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Generate diff of first 500 lines of two files
```sh
diff <(head -500 product-feed.xml) <(head -500 product-feed.xml.old)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### diff two sorted files
```sh
diff <(sort file1.txt) <(sort file2.txt)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Diff remote webpages using wget
```sh
diff <(wget -q -O - URL1) <(wget -q -O - URL2)
```

### diff two unsorted files without creating temporary files
```sh
diff <(sort file1) <(sort file2)
```

### Compare two directories
```sh
diff suppress-common-lines -y <(cd path_to_dir1; find .|sort) <(cd path_to_dir2; find .|sort)
```

### diff output of two commands
```sh
diff <(tail -10 file1) <(tail -10 file2)
```

### Check if x509 certificate file and rsa private key match
```sh
diff <(openssl x509 -noout -modulus -in server.crt ) <( openssl rsa -noout -modulus -in server.key )
```

### Create patch file for two directories
```sh
diff -r -u originDir updateDir > result.patch
```

### Compare two directory trees.
```sh
diff <(cd dir1 && find . | sort) <(cd dir2 && find . | sort)
```

### Recursively compare two directories and output their differences on a readable format
```sh
diff -urp /originaldirectory /modifieddirectory
```

### Compare a remote file with a local file
```sh
diff <(ssh user@host cat /path/to/remotefile) /path/to/localfile
```

### Probably, most frequent use of diff
```sh
diff -Naur strip-trailing-cr
```

### Compare a remote dir with a local dir
```sh
diff -y <(ssh user@host  find /boot|sort) <(find /boot|sort)
```

### Word-based diff on reformatted text files
```sh
diff -uw <(fmt -1 {file1, file2})
```

### diff will usually only take one file from STDIN. This is a method to take the result of two streams and compare with diff. The example I use to compare two iTunes libraries but it is generally applicable.
```sh
diff <(cd /path-1; find . -type f -print | egrep -i '\.m4a$|\.mp3$') <(cd /path-2; find . f -print | egrep -i '\.m4a$|\.mp3$')
```

### diff two svn repos ignoring spaces,tabs and svnfiles
```sh
diff -wubBEr -x .svn dirA dirB
```

### diff files while disregarding indentation and trailing white space
```sh
diff <(perl -wpl -e '$_ =~ s/^\s+|\s+$//g ;' file1) <(perl -wpl -e '$_ =~ s/^\s+|\s+$//g ;' file2)
```

### Check SSH public and private keys matching
```sh
diff <(ssh-keygen -y -f ~/.ssh/id_rsa) <(cut -d' ' -f1,2 ~/.ssh/id_rsa.pub)
```

### diff process output
```sh
diffprocess () { diff <($*) <(sleep  3; $*); }
```

### Diff files on two remote hosts.
```sh
diff <(ssh alice cat /etc/apt/sources.list) <(ssh bob cat /etc/apt/sources.list)
```

### diff directories, quick cut and paste to view the changes
```sh
diff -q dir1/ dir2/ | grep differ | awk '{ print "vimdiff " $2 " " $4 }'
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff <(sort <(md5deep -r /directory/1/) |cut -f1 -d' ') <(sort <(md5deep -r /directory/2/) |cut -f1 -d' ')
```

### Diff two directories by finding and comparing the md5 checksums of their contents.
```sh
diff <(sort <(md5deep -b -r /directory/1/) ) <(sort <(md5deep -b -r /directory/2/)
```

### Identify differences between directories (possibly on different servers)
```sh
diff <(ssh server01 'cd config; find . -type f -exec md5sum {} \;| sort -k 2') <(ssh server02 'cd config;find . -type f -exec md5sum {} \;| sort -k 2')
```

### diff the same file in two directories.
```sh
diff {$path1,$path2}/file_to_diff
```

### Diff XML files
```sh
diffxml() { diff -wb <(xmllint format "$1") <(xmllint format "$2"); }
```

### diff 2 remote files
```sh
diff <(ssh user@host1 cat /path/to/file) <(ssh user@host2 cat /path/to/file2)
```

### Scan your LAN for unauthorized IPs
```sh
diff <(nmap -sP 192.168.1.0/24 | grep ^Host | sed 's/.appears to be up.//g' | sed 's/Host //g') auth.hosts | sed 's/[0-9][a-z,A-Z][0-9]$//' | sed 's/</UNAUTHORIZED IP -/g'
```

### Convert diff output to HTML ins/del
```sh
diff a.txt b.txt | grep -E '^(<|>)' | sed 's:^< \(.*\):<del style="color\:red; text-decoration\: none">- \1</del><br>:' | sed 's:^> \(.*\):<ins style="color\:green; text-decoration\: none">+ \1</ins><br>:'
```

### Compare copies of a file with md5
```sh
diff <(md5sum render_pack.zip| cut -d " " -f 1) <(md5sum /media/green/render_pack.zip| cut -d " " -f 1);echo $?
```

### Using commandoutput as a file descriptor
```sh
diff rpm_output_from_other_computer <(rpm -qa|sort)
```

### diff recursively, ignoring CVS control files
```sh
diff -x "*CVS*" -r <path-1> <path-2> [<path-3>]
```

### Check fstab volumes and volumes mounted.
```sh
diff <(cat /etc/fstab | grep vol | grep -v "^#" | awk '{print $1}') <(df -h | grep vol)
```

### diff two css files to create an overriding css (e.g. for wordpress child themes)
```sh
diff -U99999 original.css modified.css  | awk '/^-/{next} {f=f"\n"$0} /^\+.*[^ ]/{yes=1} /}/ {if(yes){print f} f="";yes=0}'
```

### See which files differ in a diff
```sh
diff dir1 dir2 | diffstat
```

### Display diffed files sidebyside, with minimal differences, using the full width of the terminal.
```sh
diff -dbByw $COLUMNS FILE1 FILE2
```

### Create patch file for two directories
```sh
diff -ru originDir updateDir > result.patch
```

### Copy all file differences to an existing mirror location
```sh
diff -Naur /source/path /target/path brief | awk '{print "cp " $2 " " $4}' | sh
```

### Check the MD5
```sh
diff -ua <(w3m -dump http://www.php.net/downloads.php|fgrep -A1 '5.2.15 (tar.bz2)'|awk '/md5:/{print $2}') <(md5sum php-5.2.15.tar.bz2|awk '{print $1}')
```

### diff files ignoring comments and blank lines (lines starting with #)
```sh
diff -u <(grep -vE '^(#|$)' file1) <(grep -vE '^(#|$)' file2)
```

### Diff with Sections/Headers
```sh
diff -U 9999 file_a file_b | tail -n +3 | grep -P "^(\ Header|\-|\+)"
```

### Compares two source directories, one original and one post configure and deletes the differences in the source folder
```sh
diff ../source-dir.orig/ ../source-dir.post/ | grep "Only in" | sed -e 's/^.*\:.\(\<.*\>\)/\1/g' | xargs rm -r
```

### diff files ignoring comments and blank lines (lines starting with #)
```sh
diff -BI '^#' file{1,2}
```

### Compare a remote file with a local file
```sh
diff <(ssh $remote_site cat $file) $file
```

### Compare directories via diff
```sh
diff -rq dirA dirB
```
