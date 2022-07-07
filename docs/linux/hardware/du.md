# du 

### Print total size of specified files and subdirectories
```sh
du -sk * | awk '{print $1} END {print "[+z1<y]sy\nlyx\np"}' | dc
```

### Display a numbered list of 50 biggets files sorted by size (human readable)
```sh
du -ah | sort -hr | head -n50 | cat -n
```

### Find the 10 lusers winners of the "I take up the most disk space" award
```sh
du -sh /home/*|sort -rh|head -n 10
```

### Current directory files and subdirectories ordered by size
```sh
du -ks * | sort -n
```

### get size of a file
```sh
du -hs file-name
```

### easily find megabyte eating files or directories
```sh
du -kd | egrep -v "/.*/" | sort -n
```

### List directories sorted by size
```sh
du -sh * | sort -h
```

### centos list directories sorted by size
```sh
du -h max-depth=1 /home/ | sort -n
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sch *
```

### easily find megabyte eating files or directories
```sh
du -cks * | sort -rn | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
```

### List complete size of directories (do not consider hidden directories)
```sh
du max-depth=1 | grep -v '\.\/\.'
```

### List complete size of directories (do not consider hidden directories)
```sh
du -sh * | grep -v '\.\/\.'
```

### List complete size of directories (do not consider hidden directories)
```sh
du -sh `ls -p | grep /`
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hs *
```

### identify big file
```sh
du -s * | sort -nr | head
```

### sort and show disk space (largest first) with human readable sizes
```sh
du -hs `du -sk * | sort -rn | cut -f2-`
```

### top ten of biggest files/dirs in $PWD
```sh
du -sm *|sort -rn|head -10
```

### Check the reserved block percentage of an Ext2/3 filesystem
```sh
dumpe2fs -h /dev/sdX
```

### List top ten files/directories sorted by size
```sh
du -s * | sort -nr | head | cut -f2 | parallel -k du -sh
```

### show large folders and files, including hidden
```sh
du -shc .[^.]* * | grep [MG]
```

### List complete size of directories (do not consider hidden directories)
```sh
du -hs */
```

### find dis1k space
```sh
du -s `find . -maxdepth 1 \! -name '.'` | sort -n | tail
```

### List the largest directories & subdirectoties in the current directory sorted from largest to smallest.
```sh
du -k | sort -r -n | more
```

### Outputs size of /example/folder in human readable format.
```sh
du -hs /example/folder/
```

### List all files in current directory by size
```sh
du -sh *
```

### Get top 10 largest directories under cwd
```sh
du | sort -n | tail -11 | head
```

### shell function to find duplicate lines in a series of files or in stdin
```sh
dups() { sort "$@" | uniq -d; }
```

### Sort the size usage of a directory tree by gigabytes, kilobytes, megabytes, then bytes.
```sh
du -b max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'
```

### Show the size of a directory
```sh
du -sh some/directory
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
du -h <Directory>
```

### Get the size of all the directories in current directory
```sh
du max-depth=1
```

### Show when filesystem was created
```sh
dumpe2fs -h /dev/DEVICE | grep 'created'
```

### Find the 20 biggest directories on the current filesystem
```sh
du -xk | sort -n | tail -20
```

### Outputs a sorted list of disk usage to a text file
```sh
du | sort -gr > file_sizes
```

### List top ten files/directories sorted by size
```sh
du -sb *|sort -nr|head|awk '{print $2}'|xargs du -sh
```

### Find all directories on filesystem containing more than 99MB
```sh
du -hS / | perl -ne '(m/\d{3,}M\s+\S/ || m/G\s+\S/) && print'
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sh */
```

### Simplest way to get size (in bytes) of a file
```sh
du -b filename
```

### Dump root ext3 fs over ssh
```sh
dump 0f - / | bzip -c9 | ssh user@host "cat > /home/user/root.dump.bz2"
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
du -hs * | grep '^[0-9,]*[MG]' | sort -rn
```

### Numerically sorted human readable disk usage
```sh
du -x max-depth=1 | sort -n | awk '{ print $2 }' | xargs du -hx max-depth=0
```

### nice disk usage, sorted by size, see description for full command
```sh
du -sk ./* | sort -nr
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -sh * | sort -rh | head
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sch ./*
```

### Find the 10 users that take up the most disk space
```sh
du -sm /home/* | sort -nr | head -n 10
```

### Provide the ten largest subfolders in the current folder
```sh
du -hsx * | sort -rh | head -10
```

### easily find megabyte eating files or directories
```sh
du -hs *|grep M|sort -n
```

### List the size of all sub folders and files from the current location, with sorting
```sh
du -a max-depth=1 | sort -n
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du max-depth=1|sort -n|cut -f2|tr '\n' '\0'|xargs -0 du -sh 2>/dev/null
```

### Find the biggest files
```sh
du -sk * | sort -rn | head
```

### Get the size of all the directories in current directory
```sh
du -hd 1
```

### Alternative size (human readable) of files and directories (biggest last)
```sh
du -ms * .[^.]*| sort -nk1
```

### Ultimate current directory usage command
```sh
du -a max-depth=1 | sort -n | cut -d/ -f2 | sed '$d' | while read i; do if [ -f $i ]; then du -h "$i"; else echo "$(du -h max-depth=0 "$i")/"; fi; done
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
du | sort -nr | cut -f2- | xargs du -hs
```

### Sum file sizes
```sh
du -scb
```

### Alternative size (human readable) of files and directories (biggest last)
```sh
du -ms * | sort -nk1
```

### List by size all of the directories in a given tree.
```sh
du -h /path | sort -h
```

### list the top 15 folders by decreasing size in MB
```sh
du -xB M max-depth=2 /var | sort -rn | head -n 15
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du max-depth=1 -h * |sort -n -k 1 |egrep 'M|G'
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sk  * | sort -n | perl -pe '@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'
```

### Sort contents of a directory with human readable output
```sh
du -hs * | sort -h
```

### du and sort to find the biggest directories in defined filesystem
```sh
du -x / | sort -rn | less
```

### List subfolders from largest to smallest with sizes in human readable form
```sh
du -hd1 | sort -hr
```

### A sorted summary of disk usage including hidden files and folders
```sh
du -hs .[^.]* * | sort -h
```

### List directories sorted by (human readable) size
```sh
du -h time max-depth=1 | sort -hr
```

### Show biggest files/directories, biggest first with 'k,m,g' eyecandy
```sh
du max-depth=1 | sort -r -n | awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}'
```

### View disk usage
```sh
du -hL max-depth=1
```

### Summary of disk usage, excluding other filesystems, summarised and sorted by size
```sh
du -xks * | sort -n
```

### Dump snapshot of UFS2 filesystem, then gzip it
```sh
dump -0Lauf - /dev/adXsYz | gzip > /path/to/adXsYz.dump.gz
```

### Dump the root directory to an external hard drive
```sh
dump -0 -M -B 4000000 -f /media/My\ Passport/Fedora10bckup/root_dump_fedora -z2 /
```

### List 10 largest directories in current directory
```sh
du -hs */ | sort -hr | head
```

### Sort content of a directory including hidden files.
```sh
du -sch .[!.]* * |sort -h
```

### List all files/folders in working directory with their total size in Megabytes
```sh
du max-depth=1 -m
```

### List the biggest accessible  files/dirs in current directory, sorted
```sh
du -ms * 2>/dev/null |sort -nr|head
```

### Display the size of all your home's directories
```sh
du -sh ~/*
```

### List 10 largest directories in current directory
```sh
du . -mak|sort -n|tail -10
```

### Human readable directory sizes for current directory, sorted descending
```sh
du -hsx * | sort -rh
```

### Display the human-readable sizes of all files and folders in the current directory with 3 decimal places
```sh
du -Lsbc * |awk 'function hr(bytes){hum[1024**4]="TiB";hum[1024**3]="GiB";hum[1024**2]="MiB";hum[1024]="kiB";for(x=1024**4;x>=1024;x/=1024){if(bytes>=x){return sprintf("%8.3f %s",bytes/x,hum[x]);}}return sprintf("%4d     B",bytes);}{print hr($1) "\t" $2}'
```

### simple du command to give size of next level of subfolder in MB
```sh
du max-depth=1 -B M |sort -rn
```

### Find directories over 50MB in the home directory
```sh
du -k ~/* | awk '$1 > 50000' | sort -nr
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du max-depth=1 -h * |sort -h -k 1 |egrep '(M|G)\s'
```

### Show total size of each subdirectory, broken down by KB,MB,GB,TB
```sh
du max-depth=1 | sort -nr | awk ' BEGIN { split("KB,MB,GB,TB", Units, ","); } { u = 1; while ($1 >= 1024) { $1 = $1 / 1024; u += 1 } $1 = sprintf("%.1f %s", $1, Units[u]); print $0; } '
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hs *|sort -h
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
du -sm $dirname
```

### sort the output of the 'du' command by largest first, using human readable output.
```sh
du -h max-depth=1 |sort -rh
```

### Display total Kb/Mb/Gb of a folder and each file
```sh
du -hc *
```

### Find top 10 largest files
```sh
du -a /var | sort -n -r | head -n 10
```

### Which files/dirs waste my disk space
```sh
du -Sh | sort -h | tail
```

### Get the size of all the directories in current directory (Sorted Human Readable)
```sh
du -h | sort -hr
```

### List the Sizes of Folders and Directories
```sh
du -h max-depth=1 /path/folder/
```

### List the Sizes of Folders and Directories
```sh
du -hs /path/to/folder/*
```

### One line Perl Script to determine the largest file sizes on a Linux Server
```sh
du -k | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf  ("%6.1f\t%s\t%25s  %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}' | more
```

### directory size with subdirectories, sorted list
```sh
du -m max-depth=1 [DIR] | sort -nr
```

### find the path of biggest used space
```sh
du -a / | sort -n -r | head -n 10
```

### Which files/dirs waste my disk space
```sh
du -aB1m|awk '$1 >= 100'
```

### du with colored bar graph
```sh
du -x max-depth=1|sort -rn|awk -F / -v c=$COLUMNS 'NR==1{t=$1} NR>1{r=int($1/t*c+.5); b="\033[1;31m"; for (i=0; i<r; i++) b=b"#"; printf " %5.2f%% %s\033[0m %s\n", $1/t*100, b, $2}'|tac
```

### get date time of foler/file created  with du -csh
```sh
du -csh time *|sort -n|tail
```

### list size and directies in curretn folder
```sh
du -sh ./*/
```

### Display sorted, human readable list of file and folders sizes in your current working directory
```sh
du -had 1 | sort -h
```

### human readable total directory size
```sh
du -cah /path/to/folder/ | grep total
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -h max-depth=1 | sort -hr
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hd1 |sort -h
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -s * | sort -n | tail
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -s * | sort -n | tail
```

### List only X byte files in the current directory
```sh
du -hs * |egrep -i "^(\s?\d+\.?\d+G)"
```

### histogram of file size
```sh
du -sm *| sort -nr | awk '{ size=4+5*int($1/5); a[size]++ }; END { print "size(from->to) 	number 	graph"; for(i in a){ printf("%d 	%d 	",i,a[i]) ; hist=a[i]; while(hist>0){printf("#") ; hist=hist-5} ; printf("\n")}}'
```

### list the top 15 folders by decreasing size in MB
```sh
du -mx [directory] | grep -P '^\d{4}' | sort -rn
```

### Total sum of directories
```sh
du -sh
```

### Sum of directories
```sh
du -sh *
```

### Quickly get summary of sizes for files and folders
```sh
du -sh *
```

### Gets directory size on sub directories in current dir with human readable size
```sh
du -h max-depth=1
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du . | sort -nr | awk '{split("KB MB GB TB", arr); idx=1; while ( $1 > 1024 ) { $1/=1024; idx++} printf "%10.2f",$1; print " " arr[idx] "\t" $2}' | head -25
```

### Current sub-folders sizes
```sh
du -sh *
```

### List size of individual folder in current directory
```sh
du -hs *
```

### find directories on your machine that are taking up greater than 1G
```sh
du -h -d 1 | ack '\d+\.?\d+G' | sort -hr
```

### Find the 10 users that take up the most disk space
```sh
du -sm /home/* | sort -n | tail -10
```

### list all files or directories consuming 1Mb or more
```sh
du -sc .[!.]* * |grep '^[0-9]{4}'
```

### Sort all files and directories by size, rounded to the nearest megabyte. (Substitute custom path for *.)
```sh
du -ms * | sort -nr
```

### IBM AIX: List directory size with max depth
```sh
du -g | perl -ne 'print if (tr#/#/# == <maximum depth>)'
```

### List sub dir, sort by size, the biggest at the end, with human presentation
```sh
du max-depth=1 -x -k | sort -n | awk 'function human(x) { s="KMGTEPYZ"; while (x>=1000 && length(s)>1) {x/=1024; s=substr(s,2)} return int(x+0.5) substr(s,1,1)"iB" } {gsub(/^[0-9]+/, human($1)); print}'
```

### List Big Files/Directories
```sh
du -h |grep -P "^\S*G"
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hs * | sort -h
```

### Show size of in MB of the current directory.
```sh
du -sh `pwd`
```

### A sorted summary of disk usage including hidden files and folders
```sh
du -ks .[^.]* * | sort -n
```

### list all directory sizes and sort by size
```sh
du -ks * | sort -nr | cut -f2 | xargs -d '\n' du -sh
```

### Which files/dirs waste my disk space
```sh
du -ah | sort -h | tail
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -sk * |sort -rn |head
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du -cs * .[^\.]* | sort -n
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sh *
```

### get biggest directories
```sh
du -kh max-depth=1 | sort -n |head
```

### Find directories in pwd, get disk usage, sort results
```sh
du -a | sort -nr | head -10
```

### Check the reserved block percentage of an Ext2/3 filesystem
```sh
dumpe2fs -h /dev/sda1 2> /dev/null | awk -F ':' '{ if($1 == "Reserved block count") { rescnt=$2 } } { if($1 == "Block count") { blkcnt=$2 } } END { print "Reserved blocks: "(rescnt/blkcnt)*100"%" }'
```

### -h  means  human readable
```sh
du -h
```

### Sort subdirectories by size
```sh
du -h max-depth=1 | sort -hr
```

### -h  means  human readable
```sh
du -h
```

### Sort subdirectories by size
```sh
du -h max-depth=1 | sort -hr
```

### Shows the size of folders and files, sorted from highest to lowest
```sh
du -sh * | sort -rh
```

### Which files/dirs waste my disk space
```sh
du -h / | grep -w "[0-9]*G"
```

### du show hidden files all files
```sh
du -sch .[!.]* * |sort -h
```

### Find and sort out folders by size
```sh
du -s $(ls -l | grep '^d' | awk '{print $9}') | sort -nr
```

### See how much space is used by a file or directory
```sh
du -hs /path/to/target
```

### calculate file as describe in one txt file
```sh
du -ch `cat test_file.txt`
```

### Dumpe2fs, FSck running
```sh
dumpe2fs -h /dev/xvda1 | egrep -i 'mount count|check'
```

### Which files/dirs waste my disk space
```sh
du -xm max-depth 2 /var/log | sort -rn | head
```

### easily find megabyte eating files or directories
```sh
du -cks * | sort -rn | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done
```

### List complete size of directories (do not consider hidden directories)
```sh
du -hs */
```

### List the largest directories & subdirectoties in the current directory sorted from largest to smallest.
```sh
du -k | sort -r -n | more
```

### Sort the size usage of a directory tree by gigabytes, kilobytes, megabytes, then bytes.
```sh
du -b max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'
```

### Get the size of all the directories in current directory
```sh
du max-depth=1
```

### Show when filesystem was created
```sh
dumpe2fs -h /dev/DEVICE | grep 'created'
```

### Find the 20 biggest directories on the current filesystem
```sh
du -xk | sort -n | tail -20
```

### Outputs a sorted list of disk usage to a text file
```sh
du | sort -gr > file_sizes
```

### List top ten files/directories sorted by size
```sh
du -sb *|sort -nr|head|awk '{print $2}'|xargs du -sh
```

### Find all directories on filesystem containing more than 99MB
```sh
du -hS / | perl -ne '(m/\d{3,}M\s+\S/ || m/G\s+\S/) && print'
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sh */
```

### Simplest way to get size (in bytes) of a file
```sh
du -b filename
```

### Dump root ext3 fs over ssh
```sh
dump 0f - / | bzip -c9 | ssh user@host "cat > /home/user/root.dump.bz2"
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
du -hs * | grep '^[0-9,]*[MG]' | sort -rn
```

### Numerically sorted human readable disk usage
```sh
du -x max-depth=1 | sort -n | awk '{ print $2 }' | xargs du -hx max-depth=0
```

### nice disk usage, sorted by size, see description for full command
```sh
du -sk ./* | sort -nr
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -sh * | sort -rh | head
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sch ./*
```

### Find the 10 users that take up the most disk space
```sh
du -sm /home/* | sort -nr | head -n 10
```

### Provide the ten largest subfolders in the current folder
```sh
du -hsx * | sort -rh | head -10
```

### easily find megabyte eating files or directories
```sh
du -hs *|grep M|sort -n
```

### List the size of all sub folders and files from the current location, with sorting
```sh
du -a max-depth=1 | sort -n
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du max-depth=1|sort -n|cut -f2|tr '\n' '\0'|xargs -0 du -sh 2>/dev/null
```

### Find the biggest files
```sh
du -sk * | sort -rn | head
```

### Get the size of all the directories in current directory
```sh
du -hd 1
```

### Alternative size (human readable) of files and directories (biggest last)
```sh
du -ms * .[^.]*| sort -nk1
```

### Ultimate current directory usage command
```sh
du -a max-depth=1 | sort -n | cut -d/ -f2 | sed '$d' | while read i; do if [ -f $i ]; then du -h "$i"; else echo "$(du -h max-depth=0 "$i")/"; fi; done
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
du | sort -nr | cut -f2- | xargs du -hs
```

### Sum file sizes
```sh
du -scb
```

### Alternative size (human readable) of files and directories (biggest last)
```sh
du -ms * | sort -nk1
```

### List by size all of the directories in a given tree.
```sh
du -h /path | sort -h
```

### list the top 15 folders by decreasing size in MB
```sh
du -xB M max-depth=2 /var | sort -rn | head -n 15
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du max-depth=1 -h * |sort -n -k 1 |egrep 'M|G'
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sk  * | sort -n | perl -pe '@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:$1." ".$SI[((length $2)/3)]."\t":e'
```

### Sort contents of a directory with human readable output
```sh
du -hs * | sort -h
```

### du and sort to find the biggest directories in defined filesystem
```sh
du -x / | sort -rn | less
```

### List subfolders from largest to smallest with sizes in human readable form
```sh
du -hd1 | sort -hr
```

### A sorted summary of disk usage including hidden files and folders
```sh
du -hs .[^.]* * | sort -h
```

### List directories sorted by (human readable) size
```sh
du -h time max-depth=1 | sort -hr
```

### Show biggest files/directories, biggest first with 'k,m,g' eyecandy
```sh
du max-depth=1 | sort -r -n | awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}'
```

### View disk usage
```sh
du -hL max-depth=1
```

### Summary of disk usage, excluding other filesystems, summarised and sorted by size
```sh
du -xks * | sort -n
```

### Dump snapshot of UFS2 filesystem, then gzip it
```sh
dump -0Lauf - /dev/adXsYz | gzip > /path/to/adXsYz.dump.gz
```

### Dump the root directory to an external hard drive
```sh
dump -0 -M -B 4000000 -f /media/My\ Passport/Fedora10bckup/root_dump_fedora -z2 /
```

### List 10 largest directories in current directory
```sh
du -hs */ | sort -hr | head
```

### Sort content of a directory including hidden files.
```sh
du -sch .[!.]* * |sort -h
```

### List all files/folders in working directory with their total size in Megabytes
```sh
du max-depth=1 -m
```

### List the biggest accessible  files/dirs in current directory, sorted
```sh
du -ms * 2>/dev/null |sort -nr|head
```

### Display the size of all your home's directories
```sh
du -sh ~/*
```

### List 10 largest directories in current directory
```sh
du . -mak|sort -n|tail -10
```

### Human readable directory sizes for current directory, sorted descending
```sh
du -hsx * | sort -rh
```

### Display the human-readable sizes of all files and folders in the current directory with 3 decimal places
```sh
du -Lsbc * |awk 'function hr(bytes){hum[1024**4]="TiB";hum[1024**3]="GiB";hum[1024**2]="MiB";hum[1024]="kiB";for(x=1024**4;x>=1024;x/=1024){if(bytes>=x){return sprintf("%8.3f %s",bytes/x,hum[x]);}}return sprintf("%4d     B",bytes);}{print hr($1) "\t" $2}'
```

### simple du command to give size of next level of subfolder in MB
```sh
du max-depth=1 -B M |sort -rn
```

### Find directories over 50MB in the home directory
```sh
du -k ~/* | awk '$1 > 50000' | sort -nr
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du max-depth=1 -h * |sort -h -k 1 |egrep '(M|G)\s'
```

### Show total size of each subdirectory, broken down by KB,MB,GB,TB
```sh
du max-depth=1 | sort -nr | awk ' BEGIN { split("KB,MB,GB,TB", Units, ","); } { u = 1; while ($1 >= 1024) { $1 = $1 / 1024; u += 1 } $1 = sprintf("%.1f %s", $1, Units[u]); print $0; } '
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hs *|sort -h
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
du -sm $dirname
```

### sort the output of the 'du' command by largest first, using human readable output.
```sh
du -h max-depth=1 |sort -rh
```

### Display total Kb/Mb/Gb of a folder and each file
```sh
du -hc *
```

### Find top 10 largest files
```sh
du -a /var | sort -n -r | head -n 10
```

### Which files/dirs waste my disk space
```sh
du -Sh | sort -h | tail
```

### Get the size of all the directories in current directory (Sorted Human Readable)
```sh
du -h | sort -hr
```

### List the Sizes of Folders and Directories
```sh
du -h max-depth=1 /path/folder/
```

### List the Sizes of Folders and Directories
```sh
du -hs /path/to/folder/*
```

### One line Perl Script to determine the largest file sizes on a Linux Server
```sh
du -k | sort -n | perl -ne 'if ( /^(\d+)\s+(.*$)/){$l=log($1+.1);$m=int($l/log(1024)); printf  ("%6.1f\t%s\t%25s  %s\n",($1/(2**(10*$m))),(("K","M","G","T","P")[$m]),"*"x (1.5*$l),$2);}' | more
```

### directory size with subdirectories, sorted list
```sh
du -m max-depth=1 [DIR] | sort -nr
```

### find the path of biggest used space
```sh
du -a / | sort -n -r | head -n 10
```

### Which files/dirs waste my disk space
```sh
du -aB1m|awk '$1 >= 100'
```

### du with colored bar graph
```sh
du -x max-depth=1|sort -rn|awk -F / -v c=$COLUMNS 'NR==1{t=$1} NR>1{r=int($1/t*c+.5); b="\033[1;31m"; for (i=0; i<r; i++) b=b"#"; printf " %5.2f%% %s\033[0m %s\n", $1/t*100, b, $2}'|tac
```

### get date time of foler/file created  with du -csh
```sh
du -csh time *|sort -n|tail
```

### list size and directies in curretn folder
```sh
du -sh ./*/
```

### Display sorted, human readable list of file and folders sizes in your current working directory
```sh
du -had 1 | sort -h
```

### human readable total directory size
```sh
du -cah /path/to/folder/ | grep total
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -h max-depth=1 | sort -hr
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hd1 |sort -h
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -s * | sort -n | tail
```

### List only X byte files in the current directory
```sh
du -hs * |egrep -i "^(\s?\d+\.?\d+G)"
```

### histogram of file size
```sh
du -sm *| sort -nr | awk '{ size=4+5*int($1/5); a[size]++ }; END { print "size(from->to) 	number 	graph"; for(i in a){ printf("%d 	%d 	",i,a[i]) ; hist=a[i]; while(hist>0){printf("#") ; hist=hist-5} ; printf("\n")}}'
```

### list the top 15 folders by decreasing size in MB
```sh
du -mx [directory] | grep -P '^\d{4}' | sort -rn
```

### Total sum of directories
```sh
du -sh
```

### Sum of directories
```sh
du -sh *
```

### Quickly get summary of sizes for files and folders
```sh
du -sh *
```

### Gets directory size on sub directories in current dir with human readable size
```sh
du -h max-depth=1
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du . | sort -nr | awk '{split("KB MB GB TB", arr); idx=1; while ( $1 > 1024 ) { $1/=1024; idx++} printf "%10.2f",$1; print " " arr[idx] "\t" $2}' | head -25
```

### Current sub-folders sizes
```sh
du -sh *
```

### List size of individual folder in current directory
```sh
du -hs *
```

### find directories on your machine that are taking up greater than 1G
```sh
du -h -d 1 | ack '\d+\.?\d+G' | sort -hr
```

### Find the 10 users that take up the most disk space
```sh
du -sm /home/* | sort -n | tail -10
```

### list all files or directories consuming 1Mb or more
```sh
du -sc .[!.]* * |grep '^[0-9]{4}'
```

### Sort all files and directories by size, rounded to the nearest megabyte. (Substitute custom path for *.)
```sh
du -ms * | sort -nr
```

### IBM AIX: List directory size with max depth
```sh
du -g | perl -ne 'print if (tr#/#/# == <maximum depth>)'
```

### List sub dir, sort by size, the biggest at the end, with human presentation
```sh
du max-depth=1 -x -k | sort -n | awk 'function human(x) { s="KMGTEPYZ"; while (x>=1000 && length(s)>1) {x/=1024; s=substr(s,2)} return int(x+0.5) substr(s,1,1)"iB" } {gsub(/^[0-9]+/, human($1)); print}'
```

### List Big Files/Directories
```sh
du -h |grep -P "^\S*G"
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -hs * | sort -h
```

### Show size of in MB of the current directory.
```sh
du -sh `pwd`
```

### A sorted summary of disk usage including hidden files and folders
```sh
du -ks .[^.]* * | sort -n
```

### list all directory sizes and sort by size
```sh
du -ks * | sort -nr | cut -f2 | xargs -d '\n' du -sh
```

### Which files/dirs waste my disk space
```sh
du -ah | sort -h | tail
```

### Get the 10 biggest files/folders for the current direcotry
```sh
du -sk * |sort -rn |head
```

### Shows size of dirs and files, hidden or not, sorted.
```sh
du -cs * .[^\.]* | sort -n
```

### List the size (in human readable form) of all sub folders from the current location
```sh
du -sh *
```

### get biggest directories
```sh
du -kh max-depth=1 | sort -n |head
```

### Find directories in pwd, get disk usage, sort results
```sh
du -a | sort -nr | head -10
```

### Check the reserved block percentage of an Ext2/3 filesystem
```sh
dumpe2fs -h /dev/sda1 2> /dev/null | awk -F ':' '{ if($1 == "Reserved block count") { rescnt=$2 } } { if($1 == "Block count") { blkcnt=$2 } } END { print "Reserved blocks: "(rescnt/blkcnt)*100"%" }'
```

### -h  means  human readable
```sh
du -h
```

### Sort subdirectories by size
```sh
du -h max-depth=1 | sort -hr
```
