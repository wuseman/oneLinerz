# for-loop

### Show numerical values for each of the 256 colors in bash
```sh
for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 80 -s '  '; echo -e "\e[m"
```

### starting 25 docker nginx instances
```sh
for i in {1..25}; do docker run -d -P aysadk/ghostdockernginx; done
```

### Show demo of toilet fonts
```sh
for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done
```

### Listen and sort your music, with prompt for deleting (minimal alternative version)
```sh
for i in *; do mplayer "$i" && rm -i "$i"; done
```

### A quick shell command to weed out the small wallpapers
```sh
for i in ~/Desktop/Personal/Wallpapers/*.jpg ; { size=$((`identify -format "%wx%h" $i | sed 's/x/*/'`)) ; if [[ $size -lt 800001 ]] then ; rm -f "$i" ; fi; }
```

### recursively add all new PHP files in a folder to SVN
```sh
for FILE in $(svn status | grep ? | grep .php); do svn add $FILE; done
```

### Replaces spaces in filename with _ and converts upper to lower case
```sh
for file in  * ; do mv "$file" `echo "$file" | tr ' ' '_' | tr '[A-Z]' '[a-z]'`; done
```

### Convert flac to mp3
```sh
for file in *.flac; do flac -cd "$file" | lame -h -b 320 - "${file%.flac}.mp3"; done
```

### One-liner to draw a spinning cursor pinwheel in a terminal
```sh
for item in \\ \| / - \\ \| / - \\ \| / - \\ \| / - \\ \| / - \\ \| / -; do echo -ne "$item \r"; sleep .2; done; echo
```

### Display a list of local shell scripts soft-linked to /usr/local/bin
```sh
for AAA in $(find /usr/local/bin -type l); do ls -gG "${AAA}"; done
```

### Sequentially repair multiple cassandra nodes at once
```sh
for s in 172.16.{1,2}2.9{0,1,2}; do echo "Repairing node $s..."; nodetool -h $s repair -pr; done
```

### Batch Convert SVG to PNG
```sh
for i in *.svg; do convert "$i" "${i%.svg}.png" & done
```

### Show numerical values for each of the 256 colors in bash for bold and normal fonts
```sh
for code in $(seq -w 0 255); do for attr in 0 1; do printf "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m" "\e[m"; done; done | column -c $((COLUMNS*2))
```

### Set ondemand governor for all cpu cores.
```sh
for i in `cat /proc/cpuinfo |grep processor|awk '{print $3}'`;do cpufreq-set -g ondemand $i;done
```

### Grep through zip files
```sh
for file in `ls -t \`find . -name "*.zip" -type f\``; do         found=`unzip -c "$file" | grep color=always "PATTERN"`;         if [[ $found ]]; then echo -e "${file}\n${found}\n"; fi done
```

### AIX: Set reserve lock=no in EMC disks that have reserve_lock=yes
```sh
for i in $(lsdev -Cc disk | grep EMC | cut -f 1 -d " " ); do  if lsattr -a reserve_lock -El $i | grep -q "reserve_lock yes"; then chdev -a reserve_lock=no -l $i; fi; done
```

### Convert Canon CR2 raw pictures to JPG
```sh
for i in *.CR2; do dcraw -c -a -h $i | ppmtojpeg > `basename $i CR2`JPG; echo $i done; done
```

### Quickly clean log files (assuming you don't want them anymore)
```sh
for file in `find /var/log/ -type f -size +5000k`; do echo " " > $file; done
```

### Quickly clean log files (assuming you don't want them anymore)
```sh
for file in `find /var/log/ -type f -size +5000k`; do  > $file; done
```

### Better "hours of video" summary for each file/dir in the current directory
```sh
for item in *;do echo -n "$item - ";find "$item" -type f -print0 | xargs -0 file -iNf - | grep video | cut -d: -f1 | xargs -d'\n' /usr/share/doc/mplayer/examples/midentify | grep ID_LENGTH | awk -F= '{sum+=$2} END {print(sum/60)}'; done | grep -v ' - 0$'
```

### strips ogg audio from webm video ( no reencoding )
```sh
for file in "$@"; do   name=$(basename "$file" .webm)   echo ffmpeg -i $file -vn -c:a copy $name.ogg    ffmpeg -i "$file" -vn -c:a copy "$name.ogg" done
```

### Funny way to use cowsay to offend people
```sh
fortune | cowsay -f sodomized-sheep
```

### Show the ndd ip settings of a solaris device
```sh
for i in `ndd /dev/ip \? | awk '{ print $1 }' | egrep -v "ip6|status|icmp|igmp|\?"` ; do echo $i `ndd -get /dev/ip $i` ; done | grep -v \?
```

### find the number of files, date masked
```sh
for i in {1..31}; do ls -1 *${YYYY}${MM}`printf "%02d" $i`* | wc -l; done
```

### avoid ssh hangs using jobs
```sh
for host in $MYHOSTS; do ping -q -c3 $H 2>&1 1>/dev/null && ssh -o 'AllowedAuthe ntications publickey' $host 'command1; command2' & for count in 1 2 3 4 5; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done
```

### Remove excess noise from a set of mp4 videos.
```sh
for f in input/*; do BN=$(basename "$f"); ffmpeg -i "$f" -vn "temp/$BN.flac"...
```

### umount rbind mount with submounts
```sh
for i in `cat /proc/mounts | awk '{print $2}' | grep ${CDIR} |sort -r` ;  do umount $i; done
```

### Convert wma to wav
```sh
for i in *.wma; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader:file="${i%.wma}.wav" "$i" ; done
```

### IP:PORT to IP:PORT:COUNTRY using geoiplookup
```sh
for IP in `cat ip.txt|awk -F: '{print $1}'`; do geoiplookup -f /usr/local/share/GeoIP/GeoIP.dat $IP|awk -F, '{print $2}'>>out.txt; done; paste -d ":" ip.txt out.txt>zoom.txt
```

### Convert ogg to mp3
```sh
for x in *.ogg; do ffmpeg -i "$x" "`basename "$x" .ogg`.mp3"; done
```

### Gather libraries used and needed by a binary
```sh
for lib in `readelf -d /usr/bin/abiword | grep NEEDED | cut -f2 -d[ | cut -f1 -d]`; do [ -e /usr/lib/$lib ] && j=/usr/lib/$lib || j=`locate -l 1 $lib`; readlink -f $j ; done
```

### Recreate all initrd files
```sh
for kern in $(grep "initrd " /boot/grub/grub.conf|grep -v ^#|cut -f 2- -d-|sed -e 's/\.img//g'); do mkinitrd -v -f /boot/initrd-$kern.img $kern; done
```

### Let's say you have a web site
```sh
for I in `find . -name "*.php"`; do sed -i "s/old name/new name/g" $I; done
```

### turn off all services in specific runlevel
```sh
for i in $(chkconfig list | grep "4:on" | awk {'print $1'}); do chkconfig level 4 "$i" off; done
```

### Shutdown all VMWare ESX VMs from commandline
```sh
for vm in `/usr/bin/vmware-cmd -l`; do      /usr/bin/vmware-cmd "${vm}" stop trysoft; done
```

### let a cow tell you your fortune
```sh
fortune | cowsay
```

### while series of video and subtitles have unmatched file names, rename subtitles the same as video files.
```sh
for jj in `seq -f "%02.0f" 1 12`; do rr=`ls *S04E$jj*.smi`; tt=`ls *S04E$jj*.avi`; mv  "$rr" "${tt%.*}.smi"; done
```

### Avoid using seq and pad numbers with leading zeros
```sh
for i in {001..999}; print $i
```

### Batch file suffix renaming
```sh
for i in *; do j=`echo $i | cut -d "-" -f1`; j=$j; mv $i $j; done
```

### search for a file in PATH
```sh
for L in `echo :$PATH | tr : '\n'`; do F=${L:-"."}/fileName; if [ -f ${F} -o -h ${F} ]; then echo ${F}; break; fi; done
```

### seq can produce the same thing as Perl's ... operator.
```sh
for i in $(seq 1 50) ; do echo Iteration $i ; done
```

### Count messages in mcabber history for each JID
```sh
for f in ~/.mcabber/histo/*; do a=`egrep "^(MR|MS)" $f | wc -l`; echo $f: $a | awk -F\/ '{print $6}'; done
```

### batch convert OGG to WAV
```sh
for f in *.ogg ; do mplayer -quiet -vo null -vc dummy -ao pcm:waveheader:file="$f.wav" "$f"  ; done
```

### Uncompress a directory full of tarred files (*.gz)
```sh
for i in *.tar.gz *.tgz; do tar -zxvf $i; done
```

### Singularize all files in a directory
```sh
for x in *s.yml; do mv $x `echo $x | sed 's/s\.yml/\.yml/'`; done
```

### ping scan for a network and says who is alive or not
```sh
for i in `seq 254`;do ping -c 1 192.168.10.$i > /dev/null && echo "$i is up"||echo "$i is down";done
```

### Replace Space In Filenames With Underscore
```sh
for file in "* *"; do mv "${file}" "${file// /_}"; done
```

### download wallpaper random
```sh
for i in $(wget -O- -U "" "http://wallbase.cc/random/23/e..." quiet|grep wallpaper/|grep -oe 'http://wallbase.cc[^"]*'); do wget $(wget -O- -U "" $i quiet|grep -oe 'http://[^"]*\.jpg');done
```

### Use curl on Windows to bulk-download the Savitabhabhi Comic Strip (for Adults)
```sh
for /L %%x in (1,1,16) do mkdir %%x & curl -R -e http://www.kirtu.com -o %%x/#1.jpg http://www.kirtu.com/toon/content/sb%x/english/sb%x_en_[001-070].jpg
```

### Get all the HTTP HEAD responses from a list of urls in a file
```sh
for file in `cat urls.txt`; do echo -n "$file " >> log.txt; curl head $file >> log.txt ; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch -r|awk '{print $1}'`;do echo -e `git show pretty=format:"%Cgreen%ci_%C(blue)%c r_%Cred%cn_%Creset" $k|head -n 1`$k;done|sort -r|awk -F"_" '{printf("%s %17s %-22s %s\n",$1,$2,$3,$4)}'
```

### convert myisam to innodb
```sh
for I in $(echo "show tables" | mysql -u<user> <database>`; do echo "ALTER TABLE  $I ENGINE = INNODB"| mysql -u<user> <database>; done
```

### Edit a single line in multiple files with sed
```sh
for f in `ls`; do sed -i '/MATCHING STRING/ { s/ORIGINAL/REPLACEMENT/; }' ${f} ; done
```

### remove the last line of all html files in a directory
```sh
for f in *.html; do head -n -1 $f > temp; cat temp > $f; rm temp; done
```

### get memory configuration (not consumption) for all running VMware virtual machines
```sh
for file in $( vmrun list | grep 'vmx$' | sort ); do printf "% 40s %s M\n" $(echo "$( echo -n ${file}:\ ; grep memsize $file )" | sed -e 's/.*\///' -e 's/"//g' -e 's/memsize.=//'); done;
```

### for loop with leading zero in bash 3
```sh
for i in {0..1}{0..9}; do echo $i; done
```

### dig this
```sh
for dnsREC in $(curl -s http://www.iana.org/assignments/dns-parameters |grep -Eo ^[A-Z\.]+\  |sed 's/TYPE//'); do echo -n "$dnsREC " && dig +short $dnsREC IANA.ORG; done
```

### force change password for all user
```sh
for i in `cat /etc/passwd | awk -F : '{ print $1 }';`; do passwd -e $i; done
```

### Creating rapidly an html menu
```sh
for menu in {1..4}; do echo -e "<ul>\n <li>menu $menu</li>\n  <ul>"; for items in {1..5}; do echo "   <li>item $items</li>"; if [ $items -eq 5 ];then echo -e "  </ul>";fi;done; echo "</ul>";done | xclip
```

### measure answer time of a web service
```sh
for i in {1..40};do echo -n $i. $(date +%H:%M:%S):\ ; (time curl 'http://ya.ru/' &> /dev/null) 2>&1|grep real;sleep 1;done
```

### find all minimum values in file with at least 100 lines
```sh
for ff in directory; do numLines=`wc -l $ff`; numLines=$(echo $numLines | sed 's/ .*//g'); min=$(sort -nrk 1 $ff | tail -1); if [ $numLines -gt 100 ]; then echo $min >> minValues; fi;done;
```

### Batch Convert SVG to PNG
```sh
for i in *; do inkscape $i export-png=`echo $i | sed -e 's/svg$/png/'`; done
```

### Filenames ROT13
```sh
for each in *; do file="$each."; name=${file%%.*}; suffix=${file#*.}; mv "$each" "$(echo $name | rot13)${suffix:+.}${suffix%.}"; done
```

### find all files of a type which don't match a specific name
```sh
for output in $(find . ! -name movie.nfo -name "*.nfo") ; do rm $output ; done
```

### Add another column printing cumulative sum of entries in first column, sum being less than or equal to 100
```sh
for f in .; do awk 'BEGIN {sum=0;flag=0} {sum=sum+$1; if (flag == 0) { print $1"\t"sum > "cumulative.'$f'" } if (sum > 100) flag=1 }' $f; done
```

### Remove an unnecessary suffix from a file name for all files in a directory
```sh
for f in $(ls *.xml.skippy); do mv $f `echo $f | sed 's|.skippy||'`; done
```

### Compress all .txt files to .txt.ta.gz and remove the original .txt
```sh
for i in "*.txt"; do tar -c -v -z -f $i.tar.gz "$i" && rm -v "$i"; done
```

### Display all installed ISO/IEC 8859 manpages
```sh
for i in $(seq 1 11) 13 14 15 16; do man iso-8859-$i; done
```

### Convert a bunch of HTML files from ISO-8859-1 to UTF-8 file encoding in a folder and all sub-folders
```sh
for x in `find . -name '*.html'` ; do iconv -f ISO-8859-1 -t UTF-8 $x > "$x.utf8"; rm $x; mv "$x.utf8" $x; done
```

### resize all JPG images in folder and create new images (w/o overwriting)
```sh
for file in *.jpg; do convert "$file" -resize 800000@ -quality 80 "small.$file"; done
```

### Get a list of commands for which there are no manpages
```sh
for file in $(ls /usr/bin ) ; do man -w $file 2>> nomanlist.txt >/dev/null ; done
```

### add title and alt-text to your collection of xkcd comics
```sh
for fn in xkcd*.png xkcd*.jpg; do echo $fn; read xw xh <<<$(identify -format '%w %h' $fn); nn="$(echo $fn | sed 's/xkcd-\([^-]\+\)-.*/\1/')"; wget -q -O xkcd-${nn}.json http://xkcd.com/$nn/info.0.json; tt="$(sed 's/.*"title": "\([^"]\+\)",.*/\1/' ...
```

### Cat files in a directory; for loop command
```sh
for f in *; do clear; cat $f; sleep .3; done
```

### Cat files in a directory; for loop command
```sh
for file in ./*; do cat "$file"; sleep 0.3
```

### Convert all the symbolic links in $PWD to copies of the referenced files
```sh
for FILE in `ls -1`; do if [ -L "$FILE" ]; then cp $(readlink "$FILE") ${FILE}_rf; rm -f $FILE; mv ${FILE}_rf "$FILE"; fi; done
```

### Update many subversion projects which reside in one directory
```sh
for d in $(find . -maxdepth 1 -type d -name '[^.]*'); do cd "$d"; svn up; cd ..; done
```

### Read multiple lines of a file based on regex matching a single line
```sh
for i in `grep -n "SomeRegEx" foo.txt | sed 's/:/ /' | awk '{print $1}'`; do echo "head -n `echo "$i+4" | bc` foo.txt | tail -n 5"; done > headsandtails.sh
```

### make a .bak backup copy of all files in directory
```sh
for i in * ; do cp $i $i.bak; done
```

### look what's running
```sh
for a in  $(ls /usr/sbin /usr/bin); do ps -fC $a;done|grep -v PPID
```

### Sort all the ".dat" files in current directory by column 3 (change it accordingly), and replace the sorted one with original.
```sh
for x in *.dat;do sort -k 3 $x >tmp && mv -f tmp $x;done
```

### Echo the local IP addresses of the machines on your local network
```sh
for i in 192.168.1.{61..71};do ping -c 1 $i &> /dev/null && echo $i;fi;done
```

### Create cheap and easy index.html file
```sh
for i in *; do echo "<li><a href='$i'>$i</a>";  done > index.html
```

### Change password in list of xml files with for and sed
```sh
for i in *.xml; do sed -i 's/foo/bar/g' "$i"; done
```

### if download end,shutdown
```sh
for ((;;)) do pgrep wget ||shutdown -h now; sleep 5; done
```

### Prefix file contents with filename
```sh
for i in $(seq 1 20); do while read line; do echo "$i: $line"; done<$i.py; done
```

### Concatenate Multiple Text Files in Windows
```sh
for %%f in (*.json) do type %%f >> aggregate.json
```

### bulk rename files with sed, one-liner
```sh
for f in *; do mv "$f" "${f/foo/bar}"; done
```

### Selecting a random file/folder of a folder
```sh
for i in *; do echo "$i"; done | shuf -n1
```

### List files in tarballs
```sh
for F in $(find ./ -name "*.tgz") ; do tar -tvzf $F ; done
```

### Have a random
```sh
fortune | cowsay $(ls/usr/share/cowsay | shuf -n1)
```

### Batch resize images (overwriting)
```sh
for f in *.png; do convert $f -resize 852x480 $f; done
```

### List alive hosts in specific subnet
```sh
for i in 192.168.1.{1..254} ; do  if ping -c1 -w1 $i &>/dev/null; then echo $i alive; fi; done
```

### batch crop images whit imagemagik
```sh
for k in *.png; do convert $k -crop <width>x<high>+<cropwidth>+<cropthigh> <newpath>/$k; done
```

### Purge frozen messages in Exim
```sh
for i in `mailq | awk '$6 ~ /^frozen$/ {print $3}'`; do exim -Mrm $i; done
```

### Listen and sort your music, with prompt for deleting
```sh
for i in $(ls *.mp3); do mplayer $i && echo "delete it? [y/n]" && read trash && if [ "$trash" == "y" ]; then rm $i; fi; do
```

### Convert images (foo.gif => foo.jpg)
```sh
for i in **/*.gif; convert $i $i:r.jpg
```

### Write in a text file the contents of all the zip files in a directory.
```sh
for file in *.zip; do unzip -l "$file" >> archiveindex.txt ; done;
```

### Unarchive entire folder
```sh
for f in *;do case "$(echo $f|sed "s/.*\.\([a-z\.]*\)/\1/g")" in zip)unzip -qqo $f&&rm $f;;tar.gz|tar.bz2)tar xf $f&&rm $f;;rar)unrar e -o+ -r -y $f&&rm $f;;7z)7z e -qqo $f;;esac;done
```

### Get the size of every directories and files in a path recursively
```sh
for i in $(ls /the/path); do du -hs /the/path/$i; done
```

### whois multiple domains
```sh
for domain in `cat list_of_domains.txt`; do echo $domain; whois $domain >> output.txt; done
```

### Reset the last modified time for each file in a git repo to its last commit time
```sh
for file in $( git ls-files ); do echo $file; touch -t $(git no-pager log date=local -1 format="%ct" $file | php -r 'echo @date( "YmdHi.s", trim( file_get_contents( "php://stdin" ) ) );') $file; done
```

### if you are alone and have to determine which switch port your server ends ... here we go
```sh
for i in $(seq 300) ; do ethtool -s eth0 autoneg on ; sleep 2 ; done
```

### unzip all zip files under a current directory in the directory those files were in
```sh
for f in `find ./ -name "*.zip"` ; do p=`pwd`; d=`dirname $f`; cd $d; b=`basename $f`; unzip $b; cd $p; done
```

### Get all members from one AD group and put them in another AD group
```sh
for /F "DELIMS=""" %i in ('dsquery group -name SourceGroupName ^| dsget group -members') do dsquery group -name TargetGroupName | dsmod group -addmbr %i
```

### find a class or file within a number of jar files
```sh
for i in `find . | grep jar$`; do echo $i; jar tvf $i | grep 'search-string'; done;
```

### Recursive and alphabetical orderly cp
```sh
for file in `find *| sort -n | sed 's% %?%g'`; do echo "${file//?/ }"; cp parents "${file//?/ }" /destinity_folder/ ;done
```

### convert all WAVs from any format (MS ADPCM) to PCM
```sh
for file in $(find -type f -iname "*wav"); do mv $file "$file"_orig.WAV; mplayer -ao pcm "$file"_orig.WAV -ao pcm:file=$file;  done
```

### Move files older than 30 days in current folder to "old" folder
```sh
for i in $(find . -mtime +30); do mv $i old/; done
```

### Search and replace in multiple files and save them with the same names - quickly and effectively!
```sh
for files in $(ls -A directory_name); do sed 's/search/replaced/g' $files > $files.new && mv $files.new $files; done;
```

### oneliner to open several times same application
```sh
for ((i=0;i<5;i++)) ; do xpenguins & done
```

### oneliner to open several times same application
```sh
for i in $(seq 5); do xpenguins & done
```

### Locate a list of processes by process name that need to be killed
```sh
for i in `ps -ef | grep tracker | awk '{print $8}' | cut -d'/' -f4 | grep -v grep`; do killall -9 $i; done
```

### Remove spaces and convert to lowercase filename with a certain extension, to be saved and called as a script with the extension as an argument.
```sh
for i in ./*.$1; do mv "$i" `echo $i | tr ' ' '_'`; done for i in ./*.$1; do mv "$i" `echo $i | tr '[A-Z]' '[a-z]'`; done for i in ./*.$1; do mv "$i" `echo $i | tr  '-' '_'`; done for i in ./*.$1; do mv "$i" `echo $i | tr -s  '_' `; done
```

### Ping all hosts on 192.168.1.0/24
```sh
for i in {0..255} ; do (ping 192.168.1.$i -c 1  > /dev/null && echo "192.168.1.$i" & ) ; done
```

### du disk top 10
```sh
for i in `du max-depth=1 $HOME | sort -n -r | awk '{print $1 ":" $2}'`; do size=`echo $i | awk -F: '{print $1}'`; dir=`echo $i | awk -F: '{print $NF}'`; size2=$(($size/1024)); echo "$size2 MB used by $dir"; done | head -n 10
```

### Remove password from any pdf in current or sub directories
```sh
for z in */*.pdf; do gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile="$z new" -c .setpdfwrite -f "$z" mv "$z new" "$z"; done
```

### Renaming files removing some unwanted extension
```sh
for i in *ext; do mv $i ${i%.ext}; done
```

### Remove lines with matched string
```sh
for i in $(find . -iname '*.html'); do sed '/String/d' $i > $i-tmp; mv $i-tmp $i; done
```

### Defragment SQLite databases used by Firefox/Win32 and other software.
```sh
for /f "delims==" %a in (' dir "%USERPROFILE%\*.sqlite" /s/b ') do echo vacuum;|"sqlite3.exe"  "%a"
```

### Remove all files previously extracted from a tar(.gz) file.
```sh
for i in $(tar -tf <file.tar.gz>); do rm $i; done;
```

### A death cow thinking in your fortune cookie
```sh
fortune -s -c -a | cowthink -d -W 45
```

### zip all files in a directory, one file per zip
```sh
for i in $( find . ); do     echo zipping file: $i     zip $i.zip $i done
```

### Rename files that have number, space and hyphen
```sh
for f in * ; do mv  "$f" "${f/[0-9][0-9] \- /}" ; done
```

### Random Password Generator (uses all chars, no repeated chars)
```sh
for i in {21..79};do echo -e "\x$i";done | tr " " "\n" | shuf | tr -d "\n"
```

### small one-line loop, change for different taste :P
```sh
for FILE in $(ls); do [COMMAND]; done
```

### print crontab entries for all the users that actually have a crontab
```sh
for USER in `ls /var/spool/cron`; do echo "=== crontab for $USER ==="; echo $USER; done
```

### Backup all MySQL Databases to individual files
```sh
for I in $(mysql -e 'show databases' -s skip-column-names); do mysqldump $I | gzip > "$I.sql.gz"; done
```

### Do some learning...
```sh
for i in $(ls /usr/bin); do whatis $i | grep -v nothing; done | more
```

### Prepend string to filename
```sh
for i in *; do mv $i prependtext$i; done
```

### Get filename from a full file path
```sh
for /F %G in ('dir /b c:\Windows\system32\notepad.exe') do ( echo %G )
```

### download file1 file2 file3 file4 .... file 100
```sh
for file in $(seq -f '%03.f' 1 $TOTAL ); do echo "($file/$TOTAL)"; curl -f -O http://domain.com/Name_$file.ext; done
```

### List files with names in quotes.
```sh
for i in *; do echo '"'$i'"'; done
```

### Find all jpgs on the PC (DOS command)
```sh
for %f in (c) do dir %f:\*.jpg /s /p
```

### Move large numbers of files
```sh
for f in *; do mv $f <target_path>; done;
```

### Convert a bunch of oggs into mp3s
```sh
for x in *.ogg; do ffmpeg -i "$x" "`basename "$x" .ogg`.mp3"
```

### a find and replace within text-based files, for batch text replacement, not using perl
```sh
for file in `find . -iname "FILENAME"`; do cat $file | sed "s/SEARCH_STRING/REPLACE_STRING/" > $file.tmp; mv $file.tmp $file; done
```

### sequence of numbers in a for loop
```sh
for f in `jot - 0 50 5` ; do ping -c 1 -m 50 10.0.2.$f ; done
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `netstat -rn |grep lan |cut -c55-60 |sort |uniq`; do ifconfig $i; done
```

### Listen to the OS X system's voices
```sh
for person in Alex Bruce Fred Kathy Vicki Victoria ; do say -v $person "Hello, my name is $person"; sleep 1; done
```

### Echo several blank lines
```sh
for i in `seq 1 100`;do echo;done
```

### for x in `ls -1`; do $SOMETHING; done
```sh
for x in `ls -1`; do $SOMETHING; done
```

### Get fresh FollowBack list for Twitter
```sh
for a in $(seq 5 8); do cat twit.txt | cut -d " " -f$a | grep "^@" | sort -u; done > followlst.txt
```

### list with full path
```sh
for file in *; do echo $PWD/$file; done
```

### Change password in list of xml files with for and sed
```sh
for i in `ls  *xml`; do  sed -e 's,oldpassword,newpassword,g' $i > $i.2 && mv -f $i.2 $i  ; done
```

### replace strings in file names
```sh
for i in $(find . -name *replaceme*);do mv "$i" "${i//replaceme/withme}"; done
```

### remove all dead symbolic links in a directory
```sh
for i in $(file * | grep broken | cut -d : -f 1); do rm $i; done
```

### Reconstruct standard permissions for directories and files in current directory
```sh
for i in `find .`; do [ -d $i ] && chmod 755 $i || chmod 644 $i; done
```

### list with full path
```sh
for file in * .*; do echo $PWD/$file; done
```

### mkdir some file and mv some file
```sh
for i in `seq 100`;do mkdir f{1..100} touch myfile$i mv myfile$i f$i;done
```

### &#32331;&#12364;&#12387;&#12390;&#12356;&#12427;SCSI&#12487;&#12451;&#12473;&#12463;&#12398;&#12471;&#12522;&#12450;&#12523;&#30058;&#21495;&#12434;&#34920;&#31034;&#12377;&#12427;(for zsh)
```sh
for i in {0..11} ; echo da$i `camcontrol inquiry da$i -S`
```

### Save disk space by removing help and documentation files
```sh
for i in {a..z};do sudo rm /usr/share/doc/$i*/*;done
```

### for i in $(grep 'mystring' myfile1)|awk '{print $1}'); do grep $1 myfile2;done
```sh
for i in $(grep 'mystring' myfile1)|awk '{print $1}'); do grep $1 myfile2;done
```

### Five Minutes To Go
```sh
for i in $(seq 0 5) ; do echo "5 - $i" | bc -l ; sleep 60 ; done && echo "bye, bye" && shutdown -h now
```

### do a directory disk usage summary without giving the details for the subdirectories
```sh
for dir in $(ls); do du -sk ${dir}; done
```

### Replace multiple file extensions with a single extension
```sh
for f in t1.bmp t2.jpg t3.tga; do echo ${f%.*}.png; done
```

### Copy something to multiple SSH hosts with a Bash loop
```sh
for h in host1 host2 host3 host4 ; { scp file user@$h:/destination_path/ ; }
```

### download 10 random wallpapers from google
```sh
for i in {1..10};do wget $(wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=en&q=wallpaper+HD&start=$(($RANDOM%900+100))" quiet | grep -oe 'http://[^"]*\.jpg' | head -1);done
```

### change exif data in all jpeg's
```sh
for f in *.jpg; do exif ifd=0 tag=0x0110 set-value="LOMO LC-A" output=$f $f; exif ifd=0 tag=0x010f set-value="LOMO" output=$f $f; 	done }
```

### Determine if photos have been rotated to portrait orientation instead of normal landscape orientation
```sh
for i in *; do identify $i | awk  '{split($3,a,"x"); if (a[2]>a[1]) print $1;}'; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|sed s/^..//`;do echo -e `git log -1 pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"`\\t"$k";done|sort
```

### Display any tcp connections to apache
```sh
for i in `ps aux | grep httpd | awk '{print $2}'`; do lsof -n -p $i | grep ESTABLISHED; done;
```

### Backup all mysql databases to individual files on a remote server
```sh
for I in $(mysql -e 'show databases' -u root password=root -s skip-column-names); do mysqldump -u root password=root $I | gzip -c | ssh user@server.com "cat > /remote/$I.sql.gz"; done
```

### eth-tool summary of eth# devices
```sh
for M in 0 1 2 3 ; do echo eth$M ;/sbin/ethtool eth$M | grep -E "Link|Speed" ; done
```

### Quickly add user accounts to the system and force a password change on first login
```sh
for name in larry moe schemp; do useradd $name; echo 'password' | passwd stdin $name; chage -d 0 $name; done
```

### Print ASCII Character Chart
```sh
for i in {1..256};do p="  $i";echo -e "${p: -3} \\0$(($i/64*100+$i%64/8*10+$i%8))";done|cat -t|column -c120
```

### Graphically show percent of mount space used
```sh
for m in `df -P | awk -F ' ' '{print $NF}' | sed -e "1d"`;do n=`df -P | grep "$m$" | awk -F ' ' '{print $5}' | cut -d% -f1`;i=0;if [[ $n =~ ^-?[0-9]+$ ]];then printf '%-25s' $m;while [ $i -lt $n ];do echo -n '=';let "i=$i+1";done;echo " $n";fi;done
```

### Convert PDF to JPG
```sh
for file in `ls *.pdf`; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 $file `echo $file | sed 's/\.pdf$/\.jpg/'`; done
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; espeak $x & done
```

### Sort your music
```sh
for file in *.mp3;do mkdir -p "$(mp3info -p "%a/%l" "$file")" && ln -s "$file" "$(mp3info -p "%a/%l/%t.mp3" "$file")";done
```

### Waste time for about 3 minutes
```sh
for i in {1..20}; do fortune -w ; sleep 3; clear; done
```

### Convert multiple files using avidemux
```sh
for i in `ls`;do avidemux  video-codec Xvid4 load $i save $i.mp4 quit; done
```

### Replicate a directory structure dropping the files
```sh
for x in `find /path/ -type d | cut -b bytesoffoldername-`; do mkdir -p newpath/$x; done
```

### Simplified video file renaming
```sh
for f in *;do mplayer $f;read $n;mv $f $n;done
```

### Download entire commandlinefu archive to single file
```sh
for x in `seq 0 25 $(curl "http://www.commandlinefu.com/commands/browse"|grep "Terminal - All commands" |perl -pe 's/.+(\d+),(\d+).+/$1$2/'|head -n1)`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x" ; done > a.txt
```

### convert all flac files in a folder to mp3 files with a bitrate of 192 kbps
```sh
for f in *;do flac -cd $f |lame -b 192 - $f.mp3;done
```

### Rename all (jpg) files written as 3 number in 4 numbers.
```sh
for i in ???.jpg; do mv $i $(printf %04d $(basename $i .jpg) ).jpg ; done
```

### convert filenames in current directory to lowercase
```sh
for i in *; do mv "$i" "$(echo $i|tr A-Z a-z)"; done
```

### Transcode .flac to .wav with gstreamer
```sh
for i in *.flac; do gst-launch filesrc location="$i" ! flacdec ! wavenc ! filesink location="${i%.flac}.wav"; done
```

### open a seperate konsole tab and ssh to each of  N  servers (konsole 4.2+)
```sh
for i in $(cat listofservers.txt); do konsole new-tab -e ssh $i; done
```

### List your interfaces and MAC addresses
```sh
for f in /sys/class/net/*; do echo -e "$(basename $f)\t$(cat $f/address)"; done
```

### Fork Bomb for Windows
```sh
for /l %a in (0,0,0) do start
```

### A rainbow-colored Tux gives a fortune cookie for the day. Great
```sh
fortune -s | cowsay -f tux | lolcat -s 64
```

### Downsample mp3s to 128K
```sh
for f in *.mp3 ; do lame mp3input -b 128 "$f" ./resamp/"$f" ; done
```

### Unrar all multipart rar archives in directory
```sh
for f in /*part1.rar;do unrar e .$f.;done
```

### en/decrypts files in a specific directory
```sh
for a in path/* ; do ccenrypt -K <password> $a; done
```

### Simplest  port scanner
```sh
for p in {1..1023}; do(echo >/dev/tcp/localhost/$p) >/dev/null 2>&1 && echo "$p open"; done
```

### List PCI device with class and vendor/device IDs
```sh
for device in /sys/bus/pci/devices/*; do echo "$(basename ${device} | cut -c '6-') $(cut -c '3-6' ${device}/class): $(cut -c '3-' ${device}/vendor):$(cut -c '3-' ${device}/device)"; done
```

### a for loop with filling 0 format, with seq
```sh
for i in `seq -f %03g 5 50 111`; do echo $i ; done
```

### print crontab entries for all the users that actually have a crontab
```sh
for USER in `cut -d ":" -f1 </etc/passwd`; do crontab -u ${USER} -l 1>/dev/null 2>&1; if [ ! ${?} -ne 0 ]; then echo -en "- crontab for ${USER} -\n$(crontab -u ${USER} -l)\n"; fi; done
```

### Go to the next sibling directory in alphabetical order
```sh
for d in `find .. -mindepth 1 -maxdepth 1 -type d | sort`; do if [[ `basename $d` > `basename $PWD` ]]; then cd $d; break; fi; done
```

### Add "prefix" on a buch of files
```sh
for a in *; do mv $a prefix${a}; done
```

### convert single digit to double digits
```sh
for i in ?.ogg; do mv $i 0$i; done
```

### Count down from 10
```sh
for (( i = 10; i > 0; i )); do echo "$i"; sleep 1; done
```

### Convert PNG to GIF
```sh
for file in *.png; do convert "$file" "$(basename $file .png).gif"; done
```

### Grab a list of MP3s out of Firefox's cache
```sh
for i in `ls ~/.mozilla/firefox/*/Cache`; do file $i | grep -i mpeg | awk '{print $1}' | sed s/.$//; done
```

### c_rehash replacement
```sh
for file in *.pem; do ln -s $file `openssl x509 -hash -noout -in $file`.0; done
```

### Get information on your graphics card on linux (such as graphics memory size)
```sh
for I in `/sbin/lspci |awk '/VGA/{print $1}'`;do /sbin/lspci -v -s $I;done
```

### Count number of Line for all the files in a directory recursively
```sh
for file in `find . -type f`; do cat $file; done | wc -l
```

### Show all available cows
```sh
for i in /usr/share/cowsay/cows/*.cow; do cowsay -f $i "$i"; done
```

### Quickly analyse an Apache error log
```sh
for i in emerg alert crit error warn ; do awk '$6 ~ /^\['$i'/ {print substr($0, index($0,$6)) }' error_log | sort | uniq -c | sort -n | tail -1;  done
```

### Compression formats Benchmark
```sh
for a in bzip2 lzma gzip;do echo -n>$a;for b in $(seq 0 256);do dd if=/dev/zero of=$b.zero bs=$b count=1;c=$(date +%s%N);$a $b.zero;d=$(date +%s%N);total=$(echo $d-$c|bc);echo $total>>$a;rm $b.zero *.bz2 *.lzma *.gz;done;done
```

### Create test images
```sh
for i in {1..100}; do convert -background lightblue -fill blue  -size 100x100  -pointsize 24  -gravity center label:$i  $i.jpg; done
```

### Extract all 7zip files in current directory taking filename spaces into account
```sh
for file in *.7z; do 7zr e "$file"; done
```

### A "Web 2.0" domain name generator and look for register availability
```sh
for domain in $(pwgen -1A0B 6 10); do echo -ne "$domain.com "; if [ -z "$(whois -H $domain.com | grep -o 'No match for')" ];  then echo -ne "Not "; fi; echo "Available for register"; done
```

### Bingo-like raffle
```sh
for i in $(seq 1 100 | sort -R); do echo $i; sleep 5; done
```

### Printing multiple years with Unix cal command
```sh
for y in $(seq 2009 2011); do cal $y; done
```

### Multiplication table
```sh
for y in {1..10}; do for x in {1..10}; do echo -n "| $x*$y=$((y*x)) "; done; echo; done|column -t
```

### List all groups and the user names that were in each group
```sh
for u in `cut -f1 -d: /etc/passwd`; do echo -n $u:; groups $u; done | sort
```

### Ping sweep without NMAP
```sh
for i in `seq 1 255`; do ping -c 1 10.10.10.$i | tr \\n ' ' | awk '/1 received/ {print $2}'; done
```

### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
for f in *.txt;do mv ${f%txt}{txt,md}; done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in $(seq 0 5 100); do echo $i; sleep 1; done | dialog gauge "Install..." 6 40
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in $(seq 0 5 100); do echo $i; sleep 1; done | zenity progress title "Installing Foobar" text "Pleae wait until process has finished."
```

### Get shellcode of the binary using objdump
```sh
for i in $(objdump -d binary -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
```

### Backup all MySQL Databases to individual files
```sh
for db in $(mysql -e 'show databases' -s skip-column-names); do mysqldump $db | gzip > "/backups/mysqldump-$(hostname)-$db-$(date +%Y-%m-%d-%H.%M.%S).gz"; done
```

### Show memory usage of all docker / lxc containers
```sh
for line in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker ps | grep $line | awk '{printf $NF" "}' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done
```

### Mount important virtual system directories under chroot'ed directory
```sh
for i in sys dev proc; do sudo mount bind /$i /mnt/xxx/$i; done
```

### Batch file name renaming (copying or moving) w/ glob matching.
```sh
for x in *.ex1; do mv "${x}" "${x%ex1}ex2"; done
```

### Convert multiple pdf's to jpg in linux using the convert command
```sh
for i in *.pdf ; do convert "$i" "${i%.*}.jpg" ; done
```

### Command to rename multiple file in one go
```sh
for f in ./*.xls; do mv "$f" "${f%.*}.ods"; done
```

### Convert PDF to JPG
```sh
for file in *.pdf; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 "$file" "${file//.pdf/.jpg}"; done
```

### Symlink all files from a base directory to a target directory
```sh
for f in $(ls -d /base/*); do ln -s $f /target; done && ls -al /target
```

### enable all bash completions in gentoo
```sh
for x in $(eselect bashcomp list | sed -e 's/ //g' | cut -d']' -f2 | sed -e 's/\*//');do eselect bashcomp enable $x global;sleep 0.5s;done
```

### Show crontabs for all users
```sh
for user in $(cut -f1 -d: /etc/passwd); do echo "### Crontabs for $user ####"; crontab -u $user -l; done
```

### VMware Server print out the state of all registered Virtual Machines.
```sh
for vm in $(vmware-cmd -l);do echo -n "${vm} ";vmware-cmd ${vm} getstate|awk '{print $2 " " $3}';done
```

### Uniformly correct filenames in a directory
```sh
for i in  *;do mv "$i" "$(echo $i | sed s/PROBLEM/FIX/g)";done
```

### rename all images in folder with prefix of date and time from exif data
```sh
for i in `ls` ; do date=$(identify -format %[exif:DateTime] $i); date=${date//:/-}; date=${date// /_}; mv $i ${date}__$i; done
```

### Stop Flash from tracking everything you do.
```sh
for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done
```

### Show numerical values for each of the 256 colors in ZSH
```sh
for code in {000..255}; do print -P  "$code: %F{$code}Test%f"; done
```

### Localize provenance of current established connections
```sh
for i in $(netstat inet -n|grep ESTA|awk '{print $5}'|cut -d: -f1);do geoiplookup $i;done
```

### Add all files not under subversion control
```sh
for i in $(svn st | grep "?" | awk '{print $2}'); do svn add $i; done;
```

### List your installed Chromium extensions (with url to each page)
```sh
for i in $(find ~/.config/chromium/*/Extensions -name 'manifest.json'); do n=$(grep -hIr name $i| cut -f4 -d '"'| sort);u="https://chrome.google.com/extensions/detail/";ue=$(basename $(dirname $(dirname $i))); echo -e "$n:\n$u$ue\n" ; done
```

### resize all images in a folder
```sh
for i in *.JPG; do convert -resize 1000x1000 -quality 85 $i `basename $i .png`-klein.png; done
```

### Hypnosis
```sh
for count in $(seq 2 1001); do espeak "$count sheeps";sleep 2;done
```

### Hypnosis
```sh
for count in $(seq 2 1001); do say "$count sheeps";sleep 2;done
```

### Recover tmp flash videos (deleted immediately by the browser plugin)
```sh
for h in `find /proc/*/fd -ilname "/tmp/Flash*" 2>/dev/null`; do ln -s "$h" `readlink "$h" | cut -d' ' -f1`; done
```

### Generate random valid mac addresses
```sh
for i in {0..1200}; do for i in {1..12} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/:\1/g' | sed 's/.\(.*\)/\1/' ; echo; done
```

### Generate random valid mac addresses
```sh
for i in {1..6}; do printf "%0.2X:" $[ $RANDOM % 0x100 ]; done | sed 's/:$/\n/'
```

### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
for f in *.txt; do mv $f `basename $f .txt`.md; done;
```

### search for files or directories, then show a sorted list of just the unique directories where the matches occur
```sh
for i in $(locate your_search_phrase); do dirname $i; done | sort | uniq
```

### Recursively remove all files in a CVS directory
```sh
for dir in $(find -type d ! -name CVS); do for file in $(find $dir -maxdepth 1 -type f); do rm $file; cvs delete $file; done; done
```

### Clone perms and owner group from one file to another
```sh
for i in chmod chown; do sudo "$i" reference=/home/user/copyfromfile /tmp/targetfile; done
```

### Kill any lingering ssh processes
```sh
for i in `ps aux | grep ssh | grep -v grep | awk {'print $2'}` ; do kill $i; done
```

### Create multiple mp4 files using avidemux
```sh
for i in *;do avidemux  video-codec Xvid4 audio-codec mp3 load "${i}" save "`echo "$i" | sed -e 's/\....$//'`.done.mp4" quit; done
```

### Netcat brute force on administration login panel
```sh
for i in $(cat adm);do echo -e "GET /${i} HTTP/1.0\n\r\n\r \nHost: 192.168.77.128\r\n\r\n \nConnection: close\r\n"|nc -w 1 192.168.77.128 80 |grep -i "200 OK" 2>/dev/null >/dev/null;[ $? -eq "0" ] && echo "Found ${i}" && break;echo "$i";sleep 1;done
```

### The Hidden PS
```sh
for p in `ps L|cut -d' ' -f1`;do echo -e "`tput clear;read -p$p -n1 p`";ps wwo pid:6,user:8,comm:10,$p kpid -A;done
```

### Convert all Flac in a directory to Mp3 using maximum quality variable bitrate
```sh
for file in *.flac; do flac -cd "$file" | lame -q 0 vbr-new -V 0 - "${file%.flac}.mp3"; done
```

### Tune your guitar from the command line.
```sh
for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done
```

### convert all files in a dir of a certain type to flv
```sh
for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.flv"; done
```

### Unrar multiple directories into current working directory
```sh
for x in */*.rar; do unrar x $x; done
```

### Convert multiple flac files to mp3
```sh
for file in *.flac; do $(flac -cd "$file" | lame -h - "${file%.flac}.mp3"); done
```

### old man's advice
```sh
fortune | toilet -w $(($(tput cols)-5)) -f pagga | cowsay -n -f beavis.zen
```

### Connect to all running screen instances
```sh
for i in `screen -ls | perl -ne'if(/^\s+\d+\.([^\s]+)/){print $1, " "}'`; do gnome-terminal -e "screen -x $i"; done
```

### Encrypt every file in the current directory with 256-bit AES, retaining the original.
```sh
for f in * ; do [ -f $f ] && openssl enc -aes-256-cbc -salt -in $f -out $f.enc -pass file:/tmp/password-file ; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|perl -pe s/^..//`;do echo -e `git show pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r
```

### Open multiple tabs in Firefox from a file containing urls
```sh
for line in `cat $file`; do firefox -new-tab "$line" & 2>/dev/null; sleep 1; done
```

### Find all folder in /var that contains log in their path and have more than 10 files inside them, print the folder and the count
```sh
for i in `find -L /var/ -wholename \*log\* -type d`; do COUNT=`ls -1U $i | wc -l`; if [ $COUNT -gt 10 ]; then echo $i $COUNT; fi; done
```

### Compare prices in euro of the HTC Desire on all the european websites of Expansys.
```sh
for i in be bg cz de es fi fr hu it lv lu at pl pt ro sk si  ; do echo -n "$i " ; wget -q -O - http://www.expansys.$i/d.aspx?i=196165 | grep price | sed "s/.*<p id='price'><strong>&euro; \([0-9]*[,.][0-9]*\).*/\1/g"; done
```

### Display usb power mode on all devices
```sh
for i in `find /sys/devices/*/*/usb* -name level` ; do echo -n "$i: " ; cat $i ; done
```

### Join a folder full of split files
```sh
for file in *.001; do NAME=`echo $file | cut -d. -f1,2`; cat "$NAME."[0-9][0-9][0-9] > "$NAME"; done
```

### Print all environment variables, including hidden ones
```sh
for _a in {A..Z} {a..z};do _z=\${!${_a}*};for _i in `eval echo "${_z}"`;do echo -e "$_i: ${!_i}";done;done|cat -Tsv
```

### Make directories for and mount all iso files in a folder
```sh
for file in *.iso; do mkdir `basename $file | awk -F. '{print $1}'`; sudo mount -t iso9660 -o loop $file `basename $file | awk -F. '{print $1}'`;  done
```

### parted - scripted partitioning (of all multipathed SAN LUNs)
```sh
for i in $(multipath -ll | grep "3PARdata,VV"|awk '{print $1}') ; do parted -a optimal /dev/mapper/$i script  mklabel gpt mkpart primary 1 -1 set 1 lvm on ; done
```

### Ping scanning without nmap
```sh
for i in {1..254}; do ping -c 1 -W 1 10.1.1.$i | grep 'from'; done
```

### Bruteforce dm-crypt using shell expansion
```sh
for a in {p,P}{a,A,4}{s,S,5}{s,S,5}; do echo $a|cryptsetup luksOpen /dev/sda5 $a && echo KEY FOUND: $a; done
```

### Rename files to be all in CAPITALS
```sh
for n in * ; do mv $n `echo $n | tr '[:lower:]' '[:upper:]'`; done
```

### Adding Prefix to File name
```sh
for i in *.pdf; do mv "$i" CS749__"$i"; done
```

### Let keyboard LED blink
```sh
for a in $(seq 15); do (xset led 3);(xset -led 3);sleep .9;done
```

### E-mail a traditional Berkeley mbox to another recipient as individual e-mails.
```sh
formail -Y -s /usr/sbin/sendmail bar@example.com < /var/mail/foo
```

### Print a row of 50 hyphens
```sh
for i in `seq 1 1 50`; do  echo -n -; done
```

### Convert wma to mp3@128k
```sh
for f in *.wma; do ffmpeg -i "$f" -ab 128k "${f%.wma}.mp3" -ab 128K; done
```

### Unbelievable Shell Colors, Shading, Backgrounds, Effects for Non-X
```sh
for c in `seq 0 255`;do t=5;[[ $c -lt 108 ]]&&t=0;for i in `seq $t 5`;do echo -e "\e[0;48;$i;${c}m|| $i:$c `seq -s+0 $(($COLUMNS/2))|tr -d '[0-9]'`\e[0m";done;done
```

### Umount only the NFS related to 'string'
```sh
for i in `df -P |grep string|cut -f2 -d%|cut -c2-100`; do umount -l -f $i;done
```

### Printing multiple years with Unix cal command
```sh
for y in 2009 2010 2011; do cal $y; done
```

### Download 10 random wallpapers from images.google.com
```sh
for((i=0;i<10;i++)) do tmp=`wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=es&q=wallpaper&sa=N&start=$(($RANDOM%700+100))&ndsp=10" quiet|grep -oe 'http://[^"]*\.jpg'|head -1`;[[ $tmp != "" ]] && wget $tmp || echo "Error $[$i+1]";done
```

### Copy 3 files from 3 different servers and adds server name tag to file copied
```sh
for i in `seq 1 3`; do scp finku@server$i:file.txt server$i-file.txt; done
```

### Testing ftp server status
```sh
for host in $(cat ftps.txt) ; do if echo -en "o $host 21\nquit\n" |telnet 2>/dev/null |grep -v 'Connected to' >/dev/null; then echo -en "FTP $host KO\n"; fi done
```

### Set name of windows in tmux/byobu to hostnames of servers you're connected to
```sh
for i in $(tmux list-windows -F '#{window_index}'); do panenames=$(tmux list-panes -t $i -F '#{pane_title}' | sed -e 's/:.*$//' -e 's/^.*@//' | uniq); windowname=$(echo ${panenames} | sed -e 's/ /|/g'); tmux rename-window -t $i $windowname; done
```

### show ALL iptable rules
```sh
for i in `cat /proc/net/ip_tables_names`; do iptables -nL -v line-numbers -t $i ; done
```

### listen to an offensive fortune
```sh
fortune -o | espeak
```

### LIst svn commits by user for a date range
```sh
for i in `svn log -r{2011-02-01}:HEAD | awk '$3 == "user" {print $1}'`; do svn log -v -$i;done
```

### Kill all processes that don't belong to root/force logoff
```sh
for i in $(pgrep -v -u root);do kill -9 $i;done
```

### Change size of lots of image files.
```sh
for File in *.jpg; do mogrify -resize 1024 -quality 96 $File; done
```

### Archive all folders in a directory into their own tar.bz2 file
```sh
for i in */; do echo tar -cjf "${i%/}.tar.bz2" "$i"; done
```

### Create a bunch of dummy text files
```sh
for i in `seq 1 4096`; do tr -dc A-Za-z0-9 </dev/urandom | head -c8192 > dummy$i.rnd; done
```

### Create a bunch of dummy text files
```sh
for i in {1..4096}; do base64 /dev/urandom | head -c 8192 > dummy$i.rnd ; done
```

### Kill google chrome process
```sh
for i in $(ps x | grep chrome | cut -d"?" -f1 | grep -v chrome); do kill -9 $i ; done
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `lanscan -i | awk '{print $1}'` ; do ifconfig $i ; done
```

### List hostnames of all IPs
```sh
for IP in $(/sbin/ifconfig | fgrep addr: | sed 's/.*addr:\([[0-9.]*\) .*/\1/') ; do host $IP | awk '{print $5}'; done
```

### Renames all files in the current directory such that the new file contains no space characters.
```sh
for file in *; do mv -v "$file" "$(sed 's/ //g' <(echo $file))"; done
```

### for x in `psql -e\l | awk '{print $1}'| egrep -v "(^List|^Name|\-\-\-\-\-|^\()"`; do pg_dump -C $x | gzip > /backups/$x-back.gz
```sh
for x in `psql -e\l | awk '{print $1}'| egrep -v "(^List|^Name|\-\-\-\-\-|^\()"`; do pg_dump -C $x | gzip > /var/lib/pgsql/backups/$x-nightly.dmp.gz; done
```

### Batch convert PNG to JPEG
```sh
for i in *.png; do convert "$i" "${i%.png}.jpg" && rm "$i" && echo "$i is converted."; done
```

### Replace spaces in filename
```sh
for i in *\ *; do if [ -f "$i" ]; then mv "$i" ${i// /_}; fi; done
```

### convert png into jpg using imagemagick
```sh
for img in *.png; do   convert "$img" "$img.jpg" ; done
```

### Create a simple playlist sort by Genre using mp3info
```sh
for file in $(find ~/ -iname "*.mp3");do c=$(mp3info $file|grep Genre|cut -f 3 -d :|cut -f 2 -d " ");if [ -z "$c" ];then c="Uncategorized";fi;if [ ! -e $c ];then touch $c.m3u;fi;echo "$file">>$c.m3u;done
```

### Download all videos in your Boxee queue
```sh
for i in $(curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/object/url | cut -d "=" -f 2,3); do get_flash_videos $i; done
```

### File rotation without rename command
```sh
for i in {6..1} ; do for f in *.$i.gz ; do mv "$f" "${f/.$i.gz}".$((i+1)).gz 2> /dev/null ; done; done
```

### Check the status of a network interface
```sh
for i in `ls /sys/class/net/`; do echo $i: `cat /sys/class/net/$i/operstate`; done
```

### enable all bash completions in gentoo
```sh
for i in `eselect bashcomp list | awk '{print $2}'`; do eselect bashcomp enable $i; done
```

### Increment the filename of png in a given directory by one
```sh
for i in `ls -r *.png`; do mv $i `printf "%03d.png" $(( 10#${i%.png}+1 ))`; done
```

### cycle through everything sox knows how to read, playing only the first three seconds
```sh
for x in 8svx aif aifc aiff aiffc ... wv wve xa xi ; do echo $x ; play -q -t $x soundfile trim 0 3  ; done
```

### Find file containing namespace in a directory of jar files.
```sh
for f in *.jar; do if jar -tf $f | grep -q javax.servlet; then echo $f; fi; done
```

### Clear ARP table in linux.
```sh
for arptable in `arp | grep "eth1" | cut -d " " -f1`; do arp -d $arptable; done
```

### Using Git, stage all manually deleted files.
```sh
for x in `git status | grep deleted | awk '{print $3}'`; do git rm $x; done
```

### Rename duplicates from MusicBrainz Picard
```sh
for i in */*/*\(1\)*; do mv -f "$i" "${i/ (1)}"; done
```

### One liner to parse all epubs in a directory and use the calibre ebook-convert utility to convert them to mobi format
```sh
for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation extra-css="/yourdir/calibre.css" asciiize enable-heuristics;done
```

### Download all MegaTokyo strips
```sh
for i in $(seq 1 `curl http://megatokyo.com 2>/dev/null|grep current|cut -f6 -d\"`);do wget http://megatokyo.com/`curl http://megatokyo.com/strip/${i} 2>/dev/null|grep  src=\"strips\/|cut -f4 -d\"`;done
```

### Number of .... indicate how far down to cd
```sh
for i in {1..6};do c=;d=;for u in `eval echo {1..$i}`;do c="$c../";d="$d..";eval "$d(){ cd $c;}"; eval "$d.(){ cd $c;}";done;done
```

### Convert every eps in a directory to pdf
```sh
for f in *.eps;do ps2pdf -dEPSCrop $f `basename $f .eps`.pdf; done
```

### aptbackup restore
```sh
for p in `grep -v deinstall /var/mobile/Library/Preferences/aptbackup_dpkg-packages.txt | cut fields=1`; do apt-get -y force-yes install $p; done
```

### Removing images by size
```sh
for arq in *.png; do size=$(identify $arq | cut -f3 -d" "); [ $size == "280x190" ] || rm $arq ; done
```

### convert uppercase filenames in current directory to lowercase
```sh
for x in *;do mv "$x" "`echo $x|tr [A-Z] [a-z]`";done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|sed s/^..//`;do echo -e `git log -1 pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k" `\\t"$k";done|sort
```

### search string in _all_ revisions
```sh
for i in `git log all oneline format=%h`; do git grep SOME_STRING $i; done
```

### SAR - List the average memory usage for all days recorded under '/var/log/sa/*' using sar -r.
```sh
for i in `ls /var/log/sa/|grep -E "sa[0-9][0-9]"`;do echo -ne "$i  ";sar -r -f /var/log/sa/$i|awk '{ printf "%3.2f\n",($4-$6-$7)*100/(3+$4)}'|grep -Eiv "average|linux|^ |0.00|^-" |awk '{sum+=$1 }END{printf "Average = %3.2f%%\n",sum/NR}';done
```

### Generate 2000 images with its number written on it
```sh
for i in {1..2000}; do convert -size 200x100 xc:#000000 -font Arial -pointsize 22 -fill white -gravity center -draw "text 0,0 '$i'" $i.png; done
```

### count of files from each subfolder
```sh
for i in `find /home/ -maxdepth 1 -type d`; do  echo -n $i " ";find $i|wc -l; done
```

### Sort movies by length, longest first
```sh
for i in *.avi; do echo -n "$i:";totem-gstreamer-video-indexer $i | grep DURATION | cut -d "=" -f 2 ; done | sort -t: -k2 -r
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `netstat -rn|egrep -v "Interface|Routing"|awk '{print $5}'`;do ifconfig $i;done
```

### du and sort to find the biggest directories in defined filesystem
```sh
for i in G M K; do du -hx /var/ | grep [0-9]$i | sort -nr -k 1; done | less
```

### Find out the active XOrg Server DISPLAY number (from outside)
```sh
for p in $(pgrep -t $(cat /sys/class/tty/tty0/active)); do d=$(awk -v RS='\0' -F= '$1=="DISPLAY" {print $2}' /proc/$p/environ 2>/dev/null); [[ -n $d ]] && break; done; echo $d
```

### It decripts all pgp files in a selection folder and move the output into a file.
```sh
for x in *.pgp do `cat /file_with_the_passphrase.dat|(gpg batch no-tty yes passphrase-fd=0 decrypt `basename $x`; ) > 'dump_content.dat'` done;
```

### Partition a sequence of disk drives for LVM with fdisk
```sh
for x in {a..d}; do echo -e "n\np\n\n\n\nt\n8e\nw\n" | fdisk /dev/sd"$x"; done
```

### remove the last of all html files in a directory
```sh
for f in *.html; do sed '$d' -i "$f"; done
```

### Execute a command on multiple hosts in parallel
```sh
for host in host1 host2 host3; do ssh -n user@$host <command> > $host.log & done; wait
```

### convert a mp4 video file to mp3 audio file (multiple files)
```sh
for f in *.mp4; do avconv -i "$f" -b 256k "${f%.mp4}.mp3"; done
```

### rename files according to date created
```sh
for i in *.jpg; do dst=$(exif -t 0x9003 -m $i ) && dst_esc=$(echo $dst | sed 's/ /-/g' ) && echo mv $i $dst_esc.jpg ; done
```

### Count the number of man pages per first character (a-z)
```sh
for i in {a..z} ; do  man -k $i |grep -i "^$i" |wc | awk 'BEGIN { OFS = ":"; ORS = "" }{print  $1, "\t"}' && echo $i  ;done
```

### Show only existing executable dirs in PATH using only builtin bash commands
```sh
for p in ${PATH//:/ }; do [[ -d $p && -x $p ]] && echo $p; done
```

### quickly change all .html extensions on files in folder to .htm
```sh
for i in *.html ; do mv $i ${i%.html}.htm ; done
```

### ping as traceroute
```sh
for i in {1..30}; do  ping -t $i -c 1 google.com; done | grep "Time to live exceeded"
```

### GZip all files in a directory separately
```sh
for file in *.foo; do gzip "$file"; done
```

### Destroy all disks on system simultaneously
```sh
for i in `sudo /sbin/fdisk -l |grep Disk |grep dev |awk '{ print $2 }' |sed s/://g` ; do sudo /usr/bin/dd if=/dev/urandom of=$i bs=8M & done
```

### Recursive replace of directory and file names in the current directory.
```sh
for i in `find -name '*oldname*'`; do "mv $i ${i/oldname/newname/}"; done
```

### Adding specific CustomLog for each Virtual Domain of Apache
```sh
for arquivo in `ls -1` ; do sed -i '/ErrorLog/a\ \ \ \ \ \ \ \ CustomLog \/var\/log\/apache2\/access_'"$file"'_log combined' /root/site-bak/${file} ; done
```

### Show crontabs for all users
```sh
for i in /var/spool/cron/tabs/*; do echo ${i##*/}; sed 's/^/\t/' $i; echo; done
```

### Perform a C-style loop in Bash.
```sh
for (( i = 0; i < 100; i++ )); do echo "$i"; done
```

### Just convert your all books DJVU format to PDF, with one line
```sh
for i in *.djvu; do djvu2pdf $i && echo "Finished -> $i"; done;
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `lanscan -i | awk '{print $1}'` ; do ifconfig $i ; done 2> /dev/null
```

### Batch Convert SVG to PNG
```sh
for i in *.svg; do convert "$i" "${i%.svg}.png"; done
```

### Update Ogg Vorbis file comments
```sh
for f in *.ogg; do vorbiscomment -l "$f" | sed 's/peter gabriel/Peter Gabriel/' | vorbiscomment -w "$f"; done
```

### Writes ID3 tags using the file name as the title.
```sh
for x in *.mp3; do y=`echo $x | sed 's/...\(.*\)/\1/' | sed 's/.mp3//ig'`; id3v2 TIT2 "$y" "$x"; done
```

### Create a false directory structure for testing your commands
```sh
for each in /usr/bin/*; do echo $each | sed 's/\/usr\/bin\///' | xargs touch; done
```

### Formatted list - WWNs of all LUNs
```sh
for i in /sys/block/sd* ; do wwn=`/lib/udev/scsi_id -g -s /block/${i##*/}` ; [ "$wwn" != "" ] && echo -e ${i##*/}'\t'$wwn ;done
```

### Binary clock
```sh
for a in $(date +"%H%M"|cut -b1,2,3,4 output-delimiter=" ");do case "$a" in 0)echo "....";;1)echo "...*";;2)echo "..*.";;3)echo "..**";;4)echo ".*..";;5)echo ".*.*";;6)echo ".**.";;7)echo ".***";;8)echo "*...";;9)echo "*..*";;esac;done
```

### Open multiple tabs in Firefox from a file containing urls
```sh
for /F %i in (url_list.txt) do Firefox.exe -new-tab "%i"
```

### Convert MP3s & an image to MP4 videos using ffmpeg
```sh
for name in *.mp3; do ffmpeg -loop 1 -i imagename.jpg -i "$name" -shortest -c:v libx264 -preset ultrafast -c:a copy "${name%.*}.mp4"; done
```

### create SQL-statements from textfile with awk
```sh
for each in `cut -d " " -f 1 inputfile.txt`; do echo "select * from table where id = \"$each\";"; done
```

### avoid ssh hangs using jobs
```sh
for host in $HOSTNAMES; do ping -q -c3 $host && ssh $host 'command' & for count in {1..15}; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done &>/dev/null
```

### Get all these commands in a text file with description.
```sh
for x in `jot - 0 2400 25`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x"  ; done > commandlinefu.txt
```

### for all flv files in a dir, grab the first frame and make a jpg.
```sh
for f in *.flv; do ffmpeg -y -i "$f" -f image2 -ss 10 -vframes 1 -an "${f%.flv}.jpg"; done
```

### Restore permissions or ownership from a backup directroy
```sh
for x in `find /dir_w_wrong_ownership/`; do y=`echo "$x" | sed 's,/dir_w_wrong_ownership/,/backup_dir/,'`; chown reference $y $x; done;
```

### Download German word pronounciation as mp3 file
```sh
for w in [WORT1] [WORTn]; do wget -O $w.mp3 $(wget -O - "http://www.duden.de/rechtschreibung/$w" | grep -o "http://www.duden.de/_media_/audio/[^\.]*\.mp3"); done
```

### Iterate through screens
```sh
for pid in `screen -ls | grep -v $STY | grep tached | awk '{print $1;}' | perl -nle '$_ =~ /^(\d+)/; print $1;'`; do screen -x $pid; done
```

### Find all relevant certificates (excluding some dirs) and list them each
```sh
for crt in $(locate -r '.+\.crt' | grep -v "/usr/share/ca-certificates/"); do  ls -la $crt; done
```

### convert single digit to double digits
```sh
for i in [0-9].ogg; do mv {,0}$i; done
```

### Decompress all .tar.gz files and remove the compressed .tar.gz
```sh
for i in *.tar.gz; do tar -x -v -z -f $i && rm -v $i; done
```

### Delimiter Hunting
```sh
for i in `seq 0 9` A B C D E F; do for j in `seq 0 9` A B C D E F; do HEX=\$\'\\x${i}${j}\'; if ! eval grep -qF "$HEX" file; then eval echo $HEX \\x${i}${j}; fi; done; done 2> /dev/null | less
```

### Displays user-defined ps output and pidstat output about the top CPU or MEMory users.
```sh
for i in $(ps -eo pid,pmem,pcpu| sort -k 3 -r|grep -v PID|head -10|awk '{print $1}');do diff -yw <(pidstat -p $i|grep -v Linux) <(ps -o euser,pri,psr,pmem,stat -p $i|tail);done
```

### Revert all modified files in an SVN repo
```sh
for file in `svn st | awk '{print $2}'`; do svn revert $file; done
```

### List image attributes from a folder of JPEG images
```sh
for file in *.jpg; do identify -format '%f %b %Q %w %h' $file; done
```

### A line across the entire width of the terminal
```sh
for ((i=0; i<$(tput cols); i++)); do echo -e "=\c" ;done
```

### use md5sum -c recursively through subdirectory tree when every directory has its own checksum file
```sh
for i in $(find . -name *md5checksum_file* | sed 's/\(\.\/.*\)md5checksum_file.txt/\1/'); do cd "$i"; md5sum -c "md5checksum_file.txt"; cd -; done | tee ~/checksum_results.txt | grep -v "<current directory>"
```

### Recursive find all mp4s in a folder and convert to ogv if the ogv does not exist or the mp4 is newer then the current ogv
```sh
for file in $(find . -name *.mp4); do ogv=${file%%.mp4}.ogv; if test "$file" -nt "$ogv"; then echo $file' is newer then '$ogv; ffmpeg2theora $file; fi done
```

### Linux zsh one-liner to Determine which processes are using the most swap space currently
```sh
for i in $(ps -ef | awk '{print $2}') ; { swp=$( awk '/Swap/{sum+=$2} END {print sum}' /proc/$i/smaps ); if [[ -n $swp && 0 != $swp ]] ; then echo -n "\n $swp $i "; cat /proc/$i/cmdline ; fi; } | sort -nr
```

### List all broadcast addresses for the routes on your host.
```sh
for net in $(ip route show | cut -f1 -d\  | grep -v default); do ipcalc $net | grep Broadcast | cut -d\  -f 2; done
```

### The letter your commands most often start with
```sh
for i in {a..z}; do echo $(cat ~/.bash_history | grep ^$i.* | wc -l) $i; done | sort -n -r
```

### Backup all files matching a pattern to files with a timestamp
```sh
for FILE in *.conf; do cp $FILE{,.`date +%Y%m%dt%M:%H:%S`}; done
```

### Check SSH fingerprints
```sh
for id in `ls -1 ~/.ssh | grep -v "authorized\|known_hosts\|config\|\."` ; do echo -n "$id: " ; ssh-keygen -l -f .ssh/$id ; done
```

### delete all bitbucket repos via rest API v2 (req: jq and curl)
```sh
for repo in `curl -s -u 'USERNAME:PASSWORD' -X GET -H "Content-Type: application/json" 'https://api.bitbucket.org/2.0/repositories/USER|jq -r .values[].links.self.href`; do curl -s -u 'USERNAME:PASSWORD' -X DELETE $repo;done
```

### Check if commands are available on your system
```sh
for c in gcc bison dialog bc asdf; do if ! which $c >/dev/null; then echo Required program $c is missing ; exit 1; fi; done
```

### Print all words in a file sorted by length
```sh
for a in $(< FILENAME); do echo "$(bc <<< $(wc -m<<<$a)-1) $a";done|sort -n
```

### List prime numbers from 2 to 100
```sh
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo
```

### Turn off and Stop multiple linux services with for loop
```sh
for i in rpcbind  nfslock  lldpad fcoe rpcidmapd; do service $i stop; chkconfig $i off; done
```

### Check syntax of all PHP files before an SVN commit
```sh
for i in `svn status | egrep '^(M|A)' | sed -r 's/\+\s+//' | awk '{ print $2 }'` ; do if [ ! -d $i ] ; then php -l $i ; fi ; done
```

### Overwrite local files from copies in a flat directory, even if they're in a different directory structure
```sh
for f in $(find * -maxdepth 0 -type f); do file=$(find ~/target -name $f); if [ -n "$file" ]; then cp $file ${file}.bak; mv $f $file; fi; done
```

### Calculate days on which Friday the 13th occurs
```sh
for y in $(seq 1996 2018); do echo -n "$y -> "; for m in $(seq 1 12); do NDATE=$(date date "$y-$m-13" +%A); if [ $NDATE == 'Friday' ]; then PRINTME=$(date date "$y-$m-13" +%B);echo -n "$PRINTME "; fi; done; echo; done
```

### cpanel umount virtfs mounts
```sh
for i in `cat /proc/mounts | grep /home/virtfs | cut -d ? ? -f 2 ` ; do umount $i; done
```

### How to find all open files by a process in Solaris 10
```sh
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done
```

### Recursively remove all empty directories
```sh
for foo in <list of directories>; do while find $foo -type d -empty 2>/dev/null| grep -q "."; do find $foo -type d -empty -print0 | xargs -0 rmdir; done; done
```

### Batch image resize
```sh
for a in `ls`; do echo $a && convert $a -resize <Width>x<Height> $a; done
```

### Discover unoptimized MySQL tables and optimize them.
```sh
for table in $(echo "select concat(TABLE_SCHEMA, '.', TABLE_NAME) from information_schema.TABLES where TABLE_SCHEMA NOT IN ('information_schema','mysql') and Data_free > 0" | mysql skip-column-names); do echo "optimize table ${table}" | mysql; done;
```

### Iteratively change part of image
```sh
for i in *.png; do convert "$i" \( ../Source_dir/source.png -crop 120x300+650+75 +repage \) -gravity NorthWest -geometry +650+75 -compose copy -composite ../Dest_Dir/"$i" & done
```

### Insert a date before the suffix of all the json files in a directory
```sh
for i in `ls`; do mv "$i" "`echo $i | sed s/.json/_20160428.json/`"; done
```

### Convert all FLV's in a directory to Ogg Theora (video)
```sh
for i in $(ls *.flv); do ffmpeg2theora -v 6 optimize $i; done
```

### One liner to parse all epubs in a directory and use the calibre ebook-convert utility to convert them to mobi format
```sh
for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize enable-heuristics;done
```

### Batch JPEG rename to date using ImageMagick
```sh
for fil in *.JPG; do datepath="$(identify -verbose $fil | grep DateTimeOri | awk '{print $2"_"$3 }' | sed s%:%_%g)"; mv -v $fil $datepath.jpg; done
```

### convert single digit to double digits
```sh
for f ([0-9].txt) zmv $f '${(l:1::0:)}'$f
```

### Batch symbolic links creation
```sh
for i in '/tmp/file 1.txt' '/tmp/file 2.jpg'; do ln -s "$i" "$i LINK"; done
```

### List files that are not owned by any installed package
```sh
for file in /usr/bin/*; do pacman -Qo "$file" &> /dev/null || echo "$file"; done
```

### Add crc32 checksum in the filenames of all mp4
```sh
for file in *.mp4; do mv "$file" "${file%.*} [$(cksfv -b -q "$file" | egrep -o "\b[A-F0-9]{8}\b$")].${file#*.}"; done
```

### How to HTMLize many files containing accents ?|?|?|?|?
```sh
for i in `grep -ri "?\|?\|?\|?\|?" * col | cut -d: -f1 |sort -u `;do sed -i "s/?/\&aacute;/g" $i; sed -i "s/?/\&eacute;/g" $i; sed -i "s/?/\&iacute;/g" $i; sed -i "s/?/\&oacute;/g" $i; sed -i "s/?/\&uacute;/g" $i; echo "HTMLizing file [$i]";done
```

### for loop, counting forward for backward
```sh
for i in {1..15}; do echo $i; done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in `seq 0 100`;do timeout 6 dialog gauge "Install..." 6 40 "$i";done
```

### simulate Simultaneous connections with curl
```sh
for i in {0..60}; do (curl -Is http://46.101.214.181:10101 | head -n1 &) 2>/dev/null; sleep 1;  done;
```

### Change all the limits that can be changed to unlimited
```sh
for fl in $(ulimit -a | awk '{ gsub(":", "", $1); print $1}'); do ulimit $fl unlimited; done
```

### Zip all subdirectories into zipfiles
```sh
for f in `find . \( ! -name . -prune \) -type d -print`; do zip $f.zip $f; done
```

### Remove acentuation from file names in a directory.
```sh
for i in *; do mv -vi "$i" "`echo "$i"|sed y/????????????????????????/AAAAEEIOOUUCaaaaeeioouuc/`"; done; sync
```

### List encoding of ? in all avalible char sets
```sh
for i in `recode -l | cut -d" " -f 1`; do echo $i": ?" | recode utf-8..$i -s -p >> temp; done; vim temp
```

### Resolve *.so dependencies in current directory and copy to /tmp/build directory
```sh
for f in $(find . -name "*.so"); do ldd -v $(realpath $f) | grep -Eo "(/[a-z0-9\_.+-]+)*" | uniq | xargs -I % cp parents % /tmp/build; done
```

### Random IPv4 address
```sh
for i in a b c d; do echo -n $(($RANDOM % 256)).; done | sed -e 's/\.$//g'
```

### Unmount all CIFS drives
```sh
for D in `mount -lt cifs | sed 's/.*on \(\/.\+\) type.*/\1/'`; do echo -n "UNMOUNTING $D..."; sudo umount $D; echo " [DONE]"; done;
```

### To find a class/properties/xml in collection of jars
```sh
for i in `find . -name "*.jar"`; do jar -tvf $i | grep -v /$ | awk -v file=$i '{print file ":" $8}'; done > all_jars.txt
```

### Download all Phrack .tar.gzs
```sh
for ((i=1; i<67; i++))   do     wget http://www.phrack.org/archives/tgz/phrack${i}.tar.gz -q;  done
```

### Search for a pattern across files in a code base (leaving out CVS directories)
```sh
for f in $(find /path/to/base -type f | grep -vw CVS); do grep -Hn PATTERN $f; done
```

### To Find CVE fix from the rpm log
```sh
for i in $(cat vulns.txt); do echo $i; rpm -qa ?changelog | grep -i $i; done
```

### Create a false directory structure for testing your commands
```sh
for i in /usr/bin/* ;do touch ${i##*/}; done
```

### Automatically update all the installed python packages
```sh
for i in `pip list -o format legacy|awk '{print $1}'` ; do pip install upgrade $i; done
```

### Extract the right stereo channel from all the wav files in current dir (left channel would be 'remix 1')
```sh
for i in *.wav; do sox "$i" "${i%.*}_RightChan.wav" remix 2; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in $(git branch | sed /\*/d); do echo "$(git log -1 pretty=format:"%ct" $k) $k"; done | sort -r | awk '{print $2}'
```

### Extract audio from dvd vobs in current dir
```sh
for i in *.VOB; do mplayer "$i" -ao pcm:file="${i%.*}.wav"; done
```

### Deleting directory recurcive. Directories will be deleled when empty or contains only .svn subdirectory
```sh
for I in $(find . -depth -type d -not -path  "*/.svn*" -print) ; do N="$(ls -1A ${I} | wc -l)"; if [[ "${N}" -eq 0 || "${N}" -eq 1 &&  -n $(ls -1A | grep .svn) ]] ; then svn rm force "${I}"; fi ; done
```

### Delete keys from Redis by matching a pattern
```sh
for key in `echo 'KEYS pattern*' | redis-cli | awk '{print $1}'`; do echo DEL $key; done | redis-cli
```

### stress test curl  60 connection simulate
```sh
for i in {0..60}; do (curl -Is http://<domain/ip> | head -n1 &) 2>/dev/null; sleep 1;  done;
```

### purge old stale messages on a qmail queue
```sh
for i in `grep "unable to stat" /var/log/syslog | cut -d "/" -f 3 | sort | uniq`; do find /var/qmail/queue -name $i -type f -exec rm -v {} \; ; done
```

### File rename with regexp
```sh
for i in xxxx*.mp4; do j=`echo $i | sed 's/ - \([0-9][0-9]\). / S1E\1 - /g'`; mv "$i" "$j"; done
```

### sync a directory of corrupted jpeg with a source directory
```sh
for i in *jpg; do jpeginfo -c $i | grep -E "WARNING|ERROR" | cut -d " " -f 1 | xargs -I '{}' find /mnt/sourcerep -name {} -type f -print0 | xargs -0 -I '{}' cp -f {} ./ ; done
```

### Count open file handles for a specific user ID
```sh
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done
```

### Remove password from PDF
```sh
for F in *.pdf ; do qpdf password=your_password decrypt "$F" "$(basename $F .pdf)-nopw.pdf" ; done
```

### Numeric zero padding file rename
```sh
for i in $(seq -w 0 100) ; do mv prefix$(( 10#$i )).jpg prefix${i}.jpg ; done
```

### replace dots in filenames with dashes, using sed
```sh
for f in *; do fn=`echo $f | sed 's/\(.*\)\.\([^.]*\)$/\1\n\2/;s/\./-/g;s/\n/./g'`; mv $f $fn; done
```

### DNS cache snooping
```sh
for i in `cat names.txt`; do host -r $i [nameserver]; done
```

### Show numerical values for each of the 256 colors in bash
```sh
for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
```

### Show numerical values for each of the 256 colors in bash
```sh
for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
```

### Converts to PDF all the OpenOffice.org files in the directory
```sh
for i in $(ls *.od{tp}); do unoconv -f pdf $i; done
```

### grep all pdf files in a folder
```sh
for i in *.pdf; do echo $i-; echo; pdftotext $i - | grep -i Yourpattern; done
```

### Recursively set the files to ignore in all folders for svn
```sh
for folder in $( find $( pwd ) -maxdepth 1 -type d | grep -v .svn ); do svn propset svn:ignore -F ignorelist ${folder}; done
```

### Check if the files in current directory has the RPATH variable defined
```sh
for i in *; do file $i | grep -q ELF || continue; readelf -d $i | grep -q RPATH || echo $i; done
```

### Sets performance CPU governer of all cores of a 4-core CPU.
```sh
for i in {0..3}; do cpufreq-set -c $i -g performance; done
```

### Sort by size all hardlinked files in the current directory (and subdirectories)
```sh
for a in $(find . -xdev -type f -printf '%i\n'|sort|uniq -d);do find . -xdev -inum $a -printf '%s %i %m %n %U %G %AD %Ar %p\n';done|sort -n|awk '{if(x!=$2){print "-"};x=$2;print $0}'
```

### Count number of javascript files in subdirectories
```sh
for f in `find . -type d`; do  pushd . > /dev/null ; echo -e `cd $f ; find . -name \*\.js | wc -l` "\t" $f | grep -v ^0 ; popd >/dev/null; done | sort -n -k 1 -r | less
```

### resize all the images returned by ls command and append "new_" to the resized images
```sh
for file in `ls *.png`;do convert $file -resize 65% new_$file; done
```

### See crontabs for all users that have one
```sh
for USER in /var/spool/cron/*; do echo "- crontab for $USER -"; cat "$USER"; done
```

### Convert all flac files in dir to mp3 320kbps using ffmpeg
```sh
for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
```

### Delete all active Brightbox cloud servers
```sh
for server in `brightbox-servers list |grep active|awk '{ print $1}'`;do brightbox-servers destroy $server;done
```

### Destroy all unmapped Brightbox Cloud IPs
```sh
for ip in `brightbox-cloudips list |grep unmapped|awk '{ print $1}'`;do brightbox-cloudips destroy $ip;done
```

### number kill your terminal
```sh
for ((i=0; i>-1000; i)); do echo "${!i}"; done
```

### Parse History For specified Commands, Persist to Individual Log Files
```sh
for i in [enter list of commands]; do history |grep -i "$i" >> ~/histories/"${i}"_hist.txt;done
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
for HOSTTOREMOVE in $(dig +short host.domain.tld); do ssh-keygen -qR $HOSTTOREMOVE; done
```

### Check syntax of all Perl modules or scripts underneath the current directory
```sh
for code in $(find . -type f -name '*.p[ml]'); do perl -c "$code"; done
```

### Rerun a command until there are no changes, but no more than N times.
```sh
for times in $(seq 10) ; do puppet agent -t && break ; done
```

### changing permissions to many folders, sub folders and files in the current directory.
```sh
for i in * ; do chmod -R 777 $i;done
```

### Detect broken video files with mplayer and bash in the current directory
```sh
for i in *.flv *.mkv *.avi; do mplayer -ao null -vo null -ss 0 -endpos 1 >/dev/null "$i" 2> >(grep -qi error && echo >&2 "$i seems bad"); done
```

### how to like to know if a host is ON
```sh
for ip in $(seq 1 25); do ping -c 1 192.168.0.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.0.$ip UP" || : ; done
```

### fetch 1600 jokes from robsjokes.com into a single file, which is fortunable
```sh
for i in `seq -w 1600` ; do links -dump http://www.robsjokes.com/$i/index.html | sed '/Random Joke/,/Next Joke/!d' | sed '/^$/,/^$/!d' >> ~/temp/Rob.jokes ; echo '%' >> ~/temp/Rob.jokes ; done
```

### Massive rename filenames
```sh
for i in `find -name '*_test.rb'` ; do mv $i ${i%%_test.rb}_spec.rb ; done
```

### Create a file list of all package files installed on your Red-Hat-like system for easy grepping
```sh
for i in `rpm -qva | sort ` ; do ; echo "===== $i =====" ; rpm -qvl $i ; done > /tmp/pkgdetails
```

### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
for i in ./*foo*;do mv  "$i" "${i//foo/bar}";done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in {0..600}; do echo $i; sleep 1; done | dialog gauge "Install..." 6 40
```

### Have a random "cow" say a random thing
```sh
fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
```

### Grap all images with the tags 'bitch' and 'bw'  from a flickr photofeed
```sh
for URL in `wget -O - http://api.flickr.com/services/feeds/photos_public.gne?tags=bitch,bw 2>/dev/null | grep -E -o "http[^ ]+?jpg" | grep -v "_m" | uniq | grep -v 'buddy'  `; do FILE=`echo $URL | grep -E -o "[0-9a-z_]+\.jpg"`; curl $URL > $FILE; done;
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done
```

### Disaster Snapshot (procmail)
```sh
for x in `grep server /tmp/error.log | awk '{print $3}'`; do \ t=`date "+%d-%m-%H%M%S"` ; ssh -q -t admin@$x.domain.com 'pstree -auln' > ~/snapshots/$x-$t.out \ done
```

### let a cow tell you your fortune
```sh
fortune | cowsay -f tux
```

### Search vmware vmx files if Linux guests are set to sync time to host
```sh
for x in `find /vmfs/volumes/ -name *vmx -exec grep -H linux.iso {} \;  |cut -d : -f 1`; do echo $x; grep -i sync $x; done;
```

### Simple file wipe
```sh
for F in `find ./ -type f`;do SIZE=`ls -s $F | awk -F" " '{print $1}'`; dd if=/dev/urandom of=$F bs=1024 count=$SIZE;done
```

### Batch rename files by their epoch last modified time.
```sh
for i in somefiles*.png ; do echo "$i" ; N=$(stat -c %Y $i); mv -i $i $N.png; done
```

### move all the .bak backup copies to their original names (rename files by stripping the extension)
```sh
for i in *.bak ; do nuname=`echo $i | sed 's/\.[^\.]*$//'`; echo renaming $i to $nuname;mv $i $nuname; done
```

### Extract multiple file in a directory
```sh
for i in *.tar.gz; do tar -xzf $i; done
```

### Register all DLLs in a given folder
```sh
for %1 in (*.dll) do regsvr32 /s  %1
```

### Download a set of files that are numbered
```sh
for i in `seq -w 1 50`; do wget continue \ http://commandline.org.uk/images/posts/animal/$i.jpg; done
```

### Remount all NFS mounts on a host
```sh
for P in $(mount | awk '/type nfs / {print $3;}'); do echo $P; sudo umount $P && sudo mount $P && echo "ok :)"; done
```

### Download the last most popular 20 pictures from 500px
```sh
for line in `wget referer='http://500px.com/' quiet -O- http://500px.com/popular | grep "from=popular" | sed -n 's/.*<img src="\([^"]*\)".*/\1/p' | sed s/"3.jpg"/"4.jpg"/ | sed s/"?t".*$//`; do wget -O $RANDOM.jpg quiet "$line"; done
```

### copy zip files which contains XXX
```sh
for i in *RET.zip; do unzip -l "$i"| grep -B 4 XXX | grep RET| sed "s/.\+EPS/EPS/" |xargs -I '{}' cp '{}' out/'{}';done;
```

### List Canon CR2 raw files which have been in-camera rated (5Dmk3+)
```sh
for I in *.CR2; do if [ `exiv2 pr -p a -u $I | grep 'xmp.Rating' | awk '{ print $4 }'` == "1" ]; then echo $I; fi; done
```

### Name retina images. if you get a bunch of retina images named like name.png, you can use this script to rename them properly. ie. name@2x.png
```sh
for f in *.png; do mv $f  `basename  $f  .png`@2x.png; done
```

### Mass rename files in git
```sh
for file in $(git ls-files | grep old_name_pattern); do git mv $file $(echo $file | sed -e 's/old_name_pattern/new_name_pattern/'); done
```

### find svn uncommitted files and list their properties
```sh
for d in `ls -d *`; do svn status $d |  awk '{print $2}'; done | xargs ls -l {} \;
```

### Do a search-and-replace in a file after making a backup
```sh
for file in <filename>; do cp $file{,.bak} && sed 's/old/new/g' $file.bak > $file; done
```

### Remove all installed packages from a python virtualenv
```sh
for i in $(pip freeze | awk -F== '{print $1}'); do pip uninstall $i; done
```

### Rename files with unique, randomly generated file names
```sh
for i in *.txt; do j=`mktemp | awk -F. '{print $2".txt"}'`; mv "$i" "$j"; done
```

### Download entire commandlinefu archive to single file
```sh
for x in `jot - 0 \`curl "http://www.commandlinefu.com/commands/browse"|grep "Terminal - All commands" |perl -pe 's/.+(\d+),(\d+).+/$1$2/'|head -n1\` 25`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x" ; done >a.txt
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
for i in in $(vgdisplay -v vg00 | grep "LV Name" | awk '{ print $3 };'); do; lvextend -m 1 $i /dev/disk/<here-goes-the-disk>; done
```

### Extract the daily average number of iops
```sh
for x in `seq -w 1 30`; do sar -b -f /var/log/sa/sa$x | gawk '/Average/ {print $2}'; done
```

### type fortune in real time
```sh
fortune | pv -qL 10
```

### Delete all files found in directory A from directory B
```sh
for file in <directory A>/*; do rm <directory B>/`basename $file`; done
```

### resize all images in folder and create new images (w/o overwriting)
```sh
for file in *; do convert $file -resize 800x600 resized-$file; done
```

### Find a machine's IP address and FQDN
```sh
for i in `ip addr show dev eth1 | grep inet | awk '{print $2}' | cut -d/ -f1`; do echo -n $i; echo -en '\t'; host $i | awk '{print $5}'; done
```

### Empty a file
```sh
for file in `ls *.log`; do `:> $file`; done
```

### Determine what process is listening on a port on Solaris, without lsof
```sh
for x in `ptree | awk '{print $1}'`; do pfiles $x | grep ${PORT} > /dev/null 2>&1; if [ x"$?" == "x0" ]; then ps -ef | grep $x | grep -v grep; fi; done 2> /dev/null
```

### Kill all processes found in grep
```sh
for line in `ps aux | grep <string> | awk '{print $2}'`; do sudo kill $line; done;
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; echo $x | festival tts & done
```

### Show the 1000*1000 and 1024*1024 size of HDs on system
```sh
for I in $(awk '/d[a-z]+$/{print $4}' /proc/partitions); do sudo hdparm -I '/dev/'$I; done | grep 'device size with M'
```

### Find installed packages that are not in the portage tree anymore.
```sh
for f in $(qlist -IC); do stat /usr/portage/"$f" > /dev/null; done
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; hours=$(($x/3600)); minutes=$(($x%3600/60)); seconds=$(($x%60)); echo "$hours hours $minutes minutes $seconds seconds have elapsed" | festival tts & done
```

### Adding Netvibes subscription option to Firefox and add multiple rss feeds to netvibes
```sh
for var in "$@"  do 	echo $var 	URL="http://www.netvibes.com/subscribe.php?type=rss&url=$var" 	sensible-browser $URL  	 done
```

### 10 files backup rotate in crontab
```sh
for file in $(find /var/backup -name "backup*" -type f |sort -r | tail -n +10); do rm -f $file; done ; tar czf /var/backup/backup-system-$(date "+\%Y\%m\%d\%H\%M-\%N").tgz  exclude /home/dummy /etc /home /opt 2>&- && echo "system backup ok"
```

### Git reset added new files
```sh
for f in `git status | grep new | awk '{print $3}'`; do git reset HEAD $f ; done
```

### Kill multiple Locked connection by a single user in MYSQL DB
```sh
for i in `mysqladmin -h x.x.x.x user=root -pXXXX processlist | grep <<username>>| grep <<Locked>>| awk {'print $2'}` do mysqladmin -h x.x.x.x user=root -pXXX kill $i; done;
```

### Run a command in every (direct) sub-folder
```sh
for i in */; do echo run_command "${i}"; done
```

### List alive hosts in specific subnet
```sh
for ip in `seq 1 255`; do ping -c 1 192.168.1.$ip ; done | grep ttl
```

### Changes the initial login group for all users with GID > 500 (specified with LIMIT), to group YOURGROUP
```sh
for I in $(awk -v LIMIT=500 -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd | cut -f 1-1 -d ':' | xargs); do usermod -g YOURGROUP $I ; done
```

### for ssh uptime
```sh
for k in `seq -w 1 50` ; do ssh 192.168.100.$k uptime ; done
```

### Backup all MySQL Databases to individual files
```sh
for I in `echo "show databases;" | mysql | grep -v Database`; do    mysqldump $I > "$I.sql"; done
```

### Port scan a range of hosts with Netcat.
```sh
for i in {21..29}; do nc -v -n -z -w 1 192.168.0.$i 443; done
```

### Recursively replace a string in files with lines matching string
```sh
for i in `find . -type f`; do sed -i '/group name/s/>/ deleteMissing="true">/' $i; done
```

### mkdir some file and mv some file
```sh
for i in `seq 100`; do mkdir f${i}; touch ./f${i}/myfile$i ;done
```

### Call `svn mv` recursively to rename the C prefix from class names
```sh
for i in $(find . -regex '.*\/C.*\.cpp'); do svn mv `perl -e 'my $s=$ARGV[0]; $s=~m/(.*\/)C(.*)/; print "$s $1$2"' "$i"`; done
```

### one liner to rename files with for and sed
```sh
for fn in *.epub; do echo mv \"$fn\" \"`echo "$fn" | sed -E 's/\.*\/*(.*)( - )(.*)(\.[^\.]+)$/\3\2\1\4/' | sed -E 's/(.*) ([^ ]+)( - )(.*)/\2, \1\3\4/' `\";done | sh
```

### Sort I/O activity by PID number.
```sh
for i in $(ps -eo pid|grep -v PID);do echo ""; echo -n "==$i== ";awk '/^read|^write/{ORS=" "; print}' /proc/$i/io 2>/dev/null; echo -n " ==$i=="; done|sort -nrk5|awk '{printf "%s\n%s %s\n%s %s\n%s\n\n",$1,$2,$3,$4,$5,$6}'
```

### Prefix file contents with filename
```sh
for i in *; do sed -i "s/^/$i: /" $i; done
```

### Convert all Microsoft Word files in current directory to HTML.
```sh
for f in *.doc ; do wvHtml $f ${f%.doc}.html ; done
```

### Create several copies of a file
```sh
for i in {1..5}; do cp test{,$i};done
```

### Find & remove files that are duplicates but with different extensions recursively
```sh
for f in `comm -1 -2 <(sort <(find contrib/image/ -name *.png | sed 's/\.[^.]*$//')) <(sort <(find contrib/image/ -name *.jpg | sed 's/\.[^.]*$//'))`;do rm "$f.png" && echo "deleted: $f.png";done
```

### Find & remove files that are duplicates but with different extensions recursively
```sh
for f in `comm -1 -2 <(sort <(find contrib/image/ -name *.png | sed 's/\.[^.]*$//')) <(sort <(find contrib/image/ -name *.jpg | sed 's/\.[^.]*$//'))`;do rm "$f.png" && echo "deleted: $f.png";done
```

### Print out which hosts are not running specific process
```sh
for i in `cat hosts_list`;  do RES=`ssh myusername@${i} "ps -ef " |awk '/[p]rocessname/ {print $2}'`; test "x${RES}" = "x" && echo $i; done
```

### Bulk add urls to your Instapaper account
```sh
for url in `cat urls `; do title=`curl $url 2>&1 | grep -i '<title>.*</title>'` && curl $url > /tmp/u && mail -s "$title" your-private-instapaper-address@instapaper.com < /tmp/u ; done
```

### Generate Pascal's Triangle
```sh
for((r=1;r<10;r++));do v=1;echo -n "$v ";for((c=1;c<$r;c++));do v2=$(($(echo "$v*($r-$c)/$c")));echo -n "$v2 ";v=$v2;done;echo;done
```

### replace file name
```sh
for i in * ; do mv $i $[j++].mp3 ; done
```

### Printing multiple years with Unix cal command
```sh
for y in {2009..2013}; do cal $y; done
```

### Use wbinfo to output a table with basic user information from the default domain controller.
```sh
for DOMAIN in $(wbinfo -m); do WBSEP=$(wbinfo separator); ADSERVER=$(wbinfo ... (Read description for full command)))
```

### walk in a directory for specific files and copy it to desired destination
```sh
for file in ./data/message-snapshots/*.jpg; do cp "$file" /data/digitalcandy/ml/images/; done
```

### Recursively convert all APE to FLAC
```sh
for f in */*.ape; do avconv -i "$f" "${f%.ape}.flac"; done
```

### Sort movies by length, longest first
```sh
for i in *.avi; do echo -n "$i:";mediainfo $i|head | grep PlayTime | cut -d: -f2 ; done | sort -t: -k2 -r
```

### Replace spaces in filenames with underscores
```sh
for f in *;do mv "$f" "${f// /_}";done
```

### clean php files from base64_decode() hack
```sh
for f in `find . -name "*.php"`; do perl -p -i.bak -e 's/<\?php \/\*\*\/ eval\(base64_decode\(\"[^\"]+"\)\);\?>//' $f; done
```

### Show numerical values for each of the 256 colors in ZSH
```sh
for i in {0..255}; do echo -e "\e[38;05;${i}m\\\e[38;05;${i}m"; done | column -c 80 -s '  '; echo -e "\e[m"
```

### Cycle through all active screen sessions
```sh
for s in /tmp/screens/S-$USER/*; do screen -r "$(basename "$s")"; done
```

### Extract all archives from current folder, each archive in its own folder.
```sh
for ARG in * ; do sudo -u USER 7z x -o"$(echo $ARG|sed 's/\(.*\)\..*/\1/')" "$ARG" ; done
```

### traverses directories of $host and $share to created a unified place for rsync backups
```sh
for host in *; do { if [ -d $host ]; then { cd ${host}; for share in *; do { if [ -d $share ]; then { cd $share; rsync -av delete rsyncuser@$host::$share . 2>../$share.err 1>../$share.log; cd ..; }; fi; }; done; cd ..; }; fi; }; done;
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
for i in $(find . -type f); do mv "$i" "$(echo $i|tr A-Z a-z)"; done
```

### Remove all lines beginning with words from another file
```sh
for wrd in `cat file2` ; do   sed -i .bk "/^$wrd/d" file1; done
```

### Alphanumeric incrementating (uppercase)
```sh
for ((i=65;i<91;i++)); do  printf "\\$(printf '%03o' $i) "; done
```

### Enumerar Registros MX
```sh
for domain in $(cat dominios.txt); do nslookup -type=mx $domain ; done >ejemplo.txt
```

### Get tagged flashcards from Anki databases
```sh
for i in `ls *.anki`; do sqlite3 $i "select (cards.question || '||' || cards.answer) from cards, facts where cards.factid=facts.id and facts.tags like '%mytag%';" >> mytag.csv; done
```

### FizzBuzz in one line of Bash
```sh
for i in {1..100};do((i%3))&&x=||x=Fizz;((i%5))||x+=Buzz;echo ${x:-$i};done|column
```

### bulk git pull
```sh
for dir in ~/git/*; do (cd "$dir" && git pull); done
```

### Print all words in a file sorted by length
```sh
for a in $(cat sample.txt); do echo "$(wc -m<<<$a) $a";done|sort -n
```

### Recursively unrar in different folders
```sh
for i in `ls` ; do cd $i ; pwd; for f in `ls *.rar` ; do unrar e $f ; done ; cd .. ; done
```

### Cleaning that files I extracted here instead of there
```sh
for i in $(tar tf example.tar.gz); do rm -r $i; done
```

### Print all words in a file sorted by length
```sh
for a in $(cat sample.txt); do echo "${#a} $a";done|sort -n
```

### list all process
```sh
for i in `pidof java`; do echo $i; ll /proc/$i; done;
```

### Print all words in a file sorted by length
```sh
for w in $(tr 'A-Z ,."()?!;:' 'a-z\n' < sample.txt); do echo ${#w} $w; done | sort -u | sort -n
```

### Batch transcode .flac to .mp3 with gstreamer
```sh
for i in *.flac; do gst-launch filesrc location="$i" ! flacdec ! audioconvert ! lamemp3enc target=quality quality=2 ! id3v2mux ! filesink location="${i%.flac}.mp3"; done
```

### Replace spaces in a filename with hyphens
```sh
for f in * ; do mv "$f" $( echo $f | tr ' ' '-' ) ; done
```

### Get a summary of network devices in the system
```sh
for i in /sys/class/net/*; do e=`basename $i`; echo "# $e"; sudo ethtool $e | grep -E "Link|Speed" ; done
```

### for loop with leading zeros
```sh
for s in `seq -f %02.0f 5 15`; do echo $s; done
```

### Convert mp4 to mp3 in a directory
```sh
for a in $(find . -maxdepth 1 -name "*.mp4" -type f -printf "%f\n" | rev | cut -d '.' -f2- | rev | sort -u); do if [ ! -f "$a.mp3" ]; then  avconv -i "$a."* -vn  -ab 128 "$a.mp3"; fi done
```

### Convert Raw pictures to jpg
```sh
for img in $( ls *.CR2 ); do convert $img $img.jpg; done
```

### Recompress all files in current directory from gzip to bzip2
```sh
for gz in `find . -type f -name '*.gz' -print`; do f=`basename $gz .gz` && d=`dirname $gz` && echo -n `ls -s $gz` "... " && gunzip -c $gz | bzip2 - -c > $d/$f.bz2 && rm -f $gz && echo `ls -s $d/$f.bz2`; done
```

### Trim png files in a folder
```sh
for file in `ls *.png`; do convert -trim $file $file; done
```

### Trim png files in a folder
```sh
for file in *.png; do mogrify -trim "$file"; done
```

### Show crontabs for all users
```sh
for user in $(getent passwd|cut -f1 -d:); do echo "### Crontabs for $user ####"; crontab -u $user -l; done
```

### Get bucket policy from a s3 buckets list
```sh
for i in (aws s3api list-buckets query "Buckets[].Name" | cut -d"," -f1 | grep -vE "\[|\]"); echo $i ; aws s3api get-bucket-policy bucket (echo $i | xargs); end
```

### Show crontabs for all users
```sh
for i in /var/spool/cron/*; do echo ${i##*/}; sed 's/^/\t/' $i; echo; done
```

### Unrar all files in a directory
```sh
for f in *.rar;do unrar e ?$f?;done
```

### bulk rename files with sed, one-liner
```sh
for i in *; do mv $i $(echo $i | sed 's/foo/bar/'); done
```

### Fetch all GPG keys that are currently missing in your keyring
```sh
for i in `gpg list-sigs | perl -ne 'if(/User ID not found/){s/^.+([a-fA-F0-9]{8}).*/\1/; print}' | sort | uniq`; do gpg keyserver-options no-auto-key-retrieve recv-keys $i; done
```

### check a list of domains registered on godaddy
```sh
for i in `wget -O url|grep '<a rel="nofollow"'|grep http|sed 's|.*<a rel="nofollow" class="[^"]\+" href="[^"]*https\?://\([^/]\+\)[^"]*">[^<]\+</a>.*|\1|'`;do if test -n "$(whois $i|grep -i godaddy)";then echo $i uses GoDaddy;fi;sleep 20;done
```

### Count music files in each directory
```sh
for i in */; do echo $(find $i -type f -regextype posix-extended -regex ".*\.(mp3|ogg|wav|flac)" | wc -l) $i ; done
```

### Unzip all zip files in a directory into a newly created directory based on zip file name
```sh
for f in *.zip; do unzip -d "${f%*.zip}" "$f"; done
```

### Transcode original FLAC files to downsampled MP3 files in exclusive folder
```sh
for i in *.flac; do  flac -d -c "${i}" |lame -h preset 196 ta "Artist Here" tl "Disc Title Here"  add-id3v2 - "./MP3/$i.mp3"; done
```

### display list of files in a directory sorted by amount of lines different with original.txt.
```sh
for f in $(ls -A ./dir); do echo -n $f && diff original.txt ./dir/$f | wc -l ; done | perl -ne 'my $h={}; while (<>) { chomp; if (/^(\S+?)\s*(\d+?)$/){$h->{$1}=$2;} }; for my $k (sort { $h->{$a} $h->{$b} } keys %$h ){ print "$k\t$h->{$k}\n"}'
```

### Fix all the commit log messages from a user of a bad subversion client
```sh
for R in `svn log file:///path/repo | grep ^r | grep dude | cut -d' ' -f1 | cut -dr -f2`; do svn ps svn:log revprop -r $R "`svn pg svn:log revprop -r $R file:///path/repo; perl -e 'print ".\n";' | fromdos`" file:///path/repo; done
```

### Show numerical values for each of the 256 colors in bash
```sh
for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 80 -s '  '; echo -e "\e[m"
```

### let a cow tell you your fortune
```sh
fortune | cowsay
```

### seq can produce the same thing as Perl's ... operator.
```sh
for i in $(seq 1 50) ; do echo Iteration $i ; done
```

### Convert a bunch of HTML files from ISO-8859-1 to UTF-8 file encoding in a folder and all sub-folders
```sh
for x in `find . -name '*.html'` ; do iconv -f ISO-8859-1 -t UTF-8 $x > "$x.utf8"; rm $x; mv "$x.utf8" $x; done
```

### resize all JPG images in folder and create new images (w/o overwriting)
```sh
for file in *.jpg; do convert "$file" -resize 800000@ -quality 80 "small.$file"; done
```

### Create cheap and easy index.html file
```sh
for i in *; do echo "<li><a href='$i'>$i</a>";  done > index.html
```

### Ping all hosts on 192.168.1.0/24
```sh
for i in {0..255} ; do (ping 192.168.1.$i -c 1  > /dev/null && echo "192.168.1.$i" & ) ; done
```

### du disk top 10
```sh
for i in `du max-depth=1 $HOME | sort -n -r | awk '{print $1 ":" $2}'`; do size=`echo $i | awk -F: '{print $1}'`; dir=`echo $i | awk -F: '{print $NF}'`; size2=$(($size/1024)); echo "$size2 MB used by $dir"; done | head -n 10
```

### Backup all MySQL Databases to individual files
```sh
for I in $(mysql -e 'show databases' -s skip-column-names); do mysqldump $I | gzip > "$I.sql.gz"; done
```

### Do some learning...
```sh
for i in $(ls /usr/bin); do whatis $i | grep -v nothing; done | more
```

### Replace multiple file extensions with a single extension
```sh
for f in t1.bmp t2.jpg t3.tga; do echo ${f%.*}.png; done
```

### Copy something to multiple SSH hosts with a Bash loop
```sh
for h in host1 host2 host3 host4 ; { scp file user@$h:/destination_path/ ; }
```

### download 10 random wallpapers from google
```sh
for i in {1..10};do wget $(wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=en&q=wallpaper+HD&start=$(($RANDOM%900+100))" quiet | grep -oe 'http://[^"]*\.jpg' | head -1);done
```

### change exif data in all jpeg's
```sh
for f in *.jpg; do exif ifd=0 tag=0x0110 set-value="LOMO LC-A" output=$f $f; exif ifd=0 tag=0x010f set-value="LOMO" output=$f $f; 	done }
```

### Determine if photos have been rotated to portrait orientation instead of normal landscape orientation
```sh
for i in *; do identify $i | awk  '{split($3,a,"x"); if (a[2]>a[1]) print $1;}'; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|sed s/^..//`;do echo -e `git log -1 pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"`\\t"$k";done|sort
```

### Display any tcp connections to apache
```sh
for i in `ps aux | grep httpd | awk '{print $2}'`; do lsof -n -p $i | grep ESTABLISHED; done;
```

### Backup all mysql databases to individual files on a remote server
```sh
for I in $(mysql -e 'show databases' -u root password=root -s skip-column-names); do mysqldump -u root password=root $I | gzip -c | ssh user@server.com "cat > /remote/$I.sql.gz"; done
```

### eth-tool summary of eth# devices
```sh
for M in 0 1 2 3 ; do echo eth$M ;/sbin/ethtool eth$M | grep -E "Link|Speed" ; done
```

### Quickly add user accounts to the system and force a password change on first login
```sh
for name in larry moe schemp; do useradd $name; echo 'password' | passwd stdin $name; chage -d 0 $name; done
```

### Print ASCII Character Chart
```sh
for i in {1..256};do p="  $i";echo -e "${p: -3} \\0$(($i/64*100+$i%64/8*10+$i%8))";done|cat -t|column -c120
```

### Graphically show percent of mount space used
```sh
for m in `df -P | awk -F ' ' '{print $NF}' | sed -e "1d"`;do n=`df -P | grep "$m$" | awk -F ' ' '{print $5}' | cut -d% -f1`;i=0;if [[ $n =~ ^-?[0-9]+$ ]];then printf '%-25s' $m;while [ $i -lt $n ];do echo -n '=';let "i=$i+1";done;echo " $n";fi;done
```

### Convert PDF to JPG
```sh
for file in `ls *.pdf`; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 $file `echo $file | sed 's/\.pdf$/\.jpg/'`; done
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; espeak $x & done
```

### Sort your music
```sh
for file in *.mp3;do mkdir -p "$(mp3info -p "%a/%l" "$file")" && ln -s "$file" "$(mp3info -p "%a/%l/%t.mp3" "$file")";done
```

### Waste time for about 3 minutes
```sh
for i in {1..20}; do fortune -w ; sleep 3; clear; done
```

### Convert multiple files using avidemux
```sh
for i in `ls`;do avidemux  video-codec Xvid4 load $i save $i.mp4 quit; done
```

### Replicate a directory structure dropping the files
```sh
for x in `find /path/ -type d | cut -b bytesoffoldername-`; do mkdir -p newpath/$x; done
```

### Simplified video file renaming
```sh
for f in *;do mplayer $f;read $n;mv $f $n;done
```

### Download entire commandlinefu archive to single file
```sh
for x in `seq 0 25 $(curl "http://www.commandlinefu.com/commands/browse"|grep "Terminal - All commands" |perl -pe 's/.+(\d+),(\d+).+/$1$2/'|head -n1)`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x" ; done > a.txt
```

### convert all flac files in a folder to mp3 files with a bitrate of 192 kbps
```sh
for f in *;do flac -cd $f |lame -b 192 - $f.mp3;done
```

### Rename all (jpg) files written as 3 number in 4 numbers.
```sh
for i in ???.jpg; do mv $i $(printf %04d $(basename $i .jpg) ).jpg ; done
```

### convert filenames in current directory to lowercase
```sh
for i in *; do mv "$i" "$(echo $i|tr A-Z a-z)"; done
```

### Transcode .flac to .wav with gstreamer
```sh
for i in *.flac; do gst-launch filesrc location="$i" ! flacdec ! wavenc ! filesink location="${i%.flac}.wav"; done
```

### open a seperate konsole tab and ssh to each of  N  servers (konsole 4.2+)
```sh
for i in $(cat listofservers.txt); do konsole new-tab -e ssh $i; done
```

### List your interfaces and MAC addresses
```sh
for f in /sys/class/net/*; do echo -e "$(basename $f)\t$(cat $f/address)"; done
```

### Fork Bomb for Windows
```sh
for /l %a in (0,0,0) do start
```

### A rainbow-colored Tux gives a fortune cookie for the day. Great
```sh
fortune -s | cowsay -f tux | lolcat -s 64
```

### Downsample mp3s to 128K
```sh
for f in *.mp3 ; do lame mp3input -b 128 "$f" ./resamp/"$f" ; done
```

### Unrar all multipart rar archives in directory
```sh
for f in /*part1.rar;do unrar e .$f.;done
```

### en/decrypts files in a specific directory
```sh
for a in path/* ; do ccenrypt -K <password> $a; done
```

### Simplest  port scanner
```sh
for p in {1..1023}; do(echo >/dev/tcp/localhost/$p) >/dev/null 2>&1 && echo "$p open"; done
```

### List PCI device with class and vendor/device IDs
```sh
for device in /sys/bus/pci/devices/*; do echo "$(basename ${device} | cut -c '6-') $(cut -c '3-6' ${device}/class): $(cut -c '3-' ${device}/vendor):$(cut -c '3-' ${device}/device)"; done
```

### a for loop with filling 0 format, with seq
```sh
for i in `seq -f %03g 5 50 111`; do echo $i ; done
```

### print crontab entries for all the users that actually have a crontab
```sh
for USER in `cut -d ":" -f1 </etc/passwd`; do crontab -u ${USER} -l 1>/dev/null 2>&1; if [ ! ${?} -ne 0 ]; then echo -en "- crontab for ${USER} -\n$(crontab -u ${USER} -l)\n"; fi; done
```

### Go to the next sibling directory in alphabetical order
```sh
for d in `find .. -mindepth 1 -maxdepth 1 -type d | sort`; do if [[ `basename $d` > `basename $PWD` ]]; then cd $d; break; fi; done
```

### Add "prefix" on a buch of files
```sh
for a in *; do mv $a prefix${a}; done
```

### convert single digit to double digits
```sh
for i in ?.ogg; do mv $i 0$i; done
```

### Count down from 10
```sh
for (( i = 10; i > 0; i )); do echo "$i"; sleep 1; done
```

### Convert PNG to GIF
```sh
for file in *.png; do convert "$file" "$(basename $file .png).gif"; done
```

### Grab a list of MP3s out of Firefox's cache
```sh
for i in `ls ~/.mozilla/firefox/*/Cache`; do file $i | grep -i mpeg | awk '{print $1}' | sed s/.$//; done
```

### c_rehash replacement
```sh
for file in *.pem; do ln -s $file `openssl x509 -hash -noout -in $file`.0; done
```

### Get information on your graphics card on linux (such as graphics memory size)
```sh
for I in `/sbin/lspci |awk '/VGA/{print $1}'`;do /sbin/lspci -v -s $I;done
```

### Count number of Line for all the files in a directory recursively
```sh
for file in `find . -type f`; do cat $file; done | wc -l
```

### Show all available cows
```sh
for i in /usr/share/cowsay/cows/*.cow; do cowsay -f $i "$i"; done
```

### Quickly analyse an Apache error log
```sh
for i in emerg alert crit error warn ; do awk '$6 ~ /^\['$i'/ {print substr($0, index($0,$6)) }' error_log | sort | uniq -c | sort -n | tail -1;  done
```

### Compression formats Benchmark
```sh
for a in bzip2 lzma gzip;do echo -n>$a;for b in $(seq 0 256);do dd if=/dev/zero of=$b.zero bs=$b count=1;c=$(date +%s%N);$a $b.zero;d=$(date +%s%N);total=$(echo $d-$c|bc);echo $total>>$a;rm $b.zero *.bz2 *.lzma *.gz;done;done
```

### Create test images
```sh
for i in {1..100}; do convert -background lightblue -fill blue  -size 100x100  -pointsize 24  -gravity center label:$i  $i.jpg; done
```

### Extract all 7zip files in current directory taking filename spaces into account
```sh
for file in *.7z; do 7zr e "$file"; done
```

### A "Web 2.0" domain name generator and look for register availability
```sh
for domain in $(pwgen -1A0B 6 10); do echo -ne "$domain.com "; if [ -z "$(whois -H $domain.com | grep -o 'No match for')" ];  then echo -ne "Not "; fi; echo "Available for register"; done
```

### Bingo-like raffle
```sh
for i in $(seq 1 100 | sort -R); do echo $i; sleep 5; done
```

### Printing multiple years with Unix cal command
```sh
for y in $(seq 2009 2011); do cal $y; done
```

### Multiplication table
```sh
for y in {1..10}; do for x in {1..10}; do echo -n "| $x*$y=$((y*x)) "; done; echo; done|column -t
```

### List all groups and the user names that were in each group
```sh
for u in `cut -f1 -d: /etc/passwd`; do echo -n $u:; groups $u; done | sort
```

### Ping sweep without NMAP
```sh
for i in `seq 1 255`; do ping -c 1 10.10.10.$i | tr \\n ' ' | awk '/1 received/ {print $2}'; done
```

### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
for f in *.txt;do mv ${f%txt}{txt,md}; done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in $(seq 0 5 100); do echo $i; sleep 1; done | dialog gauge "Install..." 6 40
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in $(seq 0 5 100); do echo $i; sleep 1; done | zenity progress title "Installing Foobar" text "Pleae wait until process has finished."
```

### Get shellcode of the binary using objdump
```sh
for i in $(objdump -d binary -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
```

### Backup all MySQL Databases to individual files
```sh
for db in $(mysql -e 'show databases' -s skip-column-names); do mysqldump $db | gzip > "/backups/mysqldump-$(hostname)-$db-$(date +%Y-%m-%d-%H.%M.%S).gz"; done
```

### Show memory usage of all docker / lxc containers
```sh
for line in `docker ps | awk '{print $1}' | grep -v CONTAINER`; do docker ps | grep $line | awk '{printf $NF" "}' && echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; done
```

### Mount important virtual system directories under chroot'ed directory
```sh
for i in sys dev proc; do sudo mount bind /$i /mnt/xxx/$i; done
```

### Batch file name renaming (copying or moving) w/ glob matching.
```sh
for x in *.ex1; do mv "${x}" "${x%ex1}ex2"; done
```

### Convert multiple pdf's to jpg in linux using the convert command
```sh
for i in *.pdf ; do convert "$i" "${i%.*}.jpg" ; done
```

### Command to rename multiple file in one go
```sh
for f in ./*.xls; do mv "$f" "${f%.*}.ods"; done
```

### Convert PDF to JPG
```sh
for file in *.pdf; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 "$file" "${file//.pdf/.jpg}"; done
```

### Symlink all files from a base directory to a target directory
```sh
for f in $(ls -d /base/*); do ln -s $f /target; done && ls -al /target
```

### enable all bash completions in gentoo
```sh
for x in $(eselect bashcomp list | sed -e 's/ //g' | cut -d']' -f2 | sed -e 's/\*//');do eselect bashcomp enable $x global;sleep 0.5s;done
```

### Show crontabs for all users
```sh
for user in $(cut -f1 -d: /etc/passwd); do echo "### Crontabs for $user ####"; crontab -u $user -l; done
```

### VMware Server print out the state of all registered Virtual Machines.
```sh
for vm in $(vmware-cmd -l);do echo -n "${vm} ";vmware-cmd ${vm} getstate|awk '{print $2 " " $3}';done
```

### Uniformly correct filenames in a directory
```sh
for i in  *;do mv "$i" "$(echo $i | sed s/PROBLEM/FIX/g)";done
```

### rename all images in folder with prefix of date and time from exif data
```sh
for i in `ls` ; do date=$(identify -format %[exif:DateTime] $i); date=${date//:/-}; date=${date// /_}; mv $i ${date}__$i; done
```

### Stop Flash from tracking everything you do.
```sh
for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done
```

### Show numerical values for each of the 256 colors in ZSH
```sh
for code in {000..255}; do print -P  "$code: %F{$code}Test%f"; done
```

### Localize provenance of current established connections
```sh
for i in $(netstat inet -n|grep ESTA|awk '{print $5}'|cut -d: -f1);do geoiplookup $i;done
```

### Add all files not under subversion control
```sh
for i in $(svn st | grep "?" | awk '{print $2}'); do svn add $i; done;
```

### List your installed Chromium extensions (with url to each page)
```sh
for i in $(find ~/.config/chromium/*/Extensions -name 'manifest.json'); do n=$(grep -hIr name $i| cut -f4 -d '"'| sort);u="https://chrome.google.com/extensions/detail/";ue=$(basename $(dirname $(dirname $i))); echo -e "$n:\n$u$ue\n" ; done
```

### resize all images in a folder
```sh
for i in *.JPG; do convert -resize 1000x1000 -quality 85 $i `basename $i .png`-klein.png; done
```

### Hypnosis
```sh
for count in $(seq 2 1001); do espeak "$count sheeps";sleep 2;done
```

### Hypnosis
```sh
for count in $(seq 2 1001); do say "$count sheeps";sleep 2;done
```

### Recover tmp flash videos (deleted immediately by the browser plugin)
```sh
for h in `find /proc/*/fd -ilname "/tmp/Flash*" 2>/dev/null`; do ln -s "$h" `readlink "$h" | cut -d' ' -f1`; done
```

### Generate random valid mac addresses
```sh
for i in {0..1200}; do for i in {1..12} ; do echo -n ${hexchars:$(( $RANDOM % 16 )):1} ; done | sed -e 's/\(..\)/:\1/g' | sed 's/.\(.*\)/\1/' ; echo; done
```

### Generate random valid mac addresses
```sh
for i in {1..6}; do printf "%0.2X:" $[ $RANDOM % 0x100 ]; done | sed 's/:$/\n/'
```

### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
for f in *.txt; do mv $f `basename $f .txt`.md; done;
```

### search for files or directories, then show a sorted list of just the unique directories where the matches occur
```sh
for i in $(locate your_search_phrase); do dirname $i; done | sort | uniq
```

### Recursively remove all files in a CVS directory
```sh
for dir in $(find -type d ! -name CVS); do for file in $(find $dir -maxdepth 1 -type f); do rm $file; cvs delete $file; done; done
```

### Clone perms and owner group from one file to another
```sh
for i in chmod chown; do sudo "$i" reference=/home/user/copyfromfile /tmp/targetfile; done
```

### Kill any lingering ssh processes
```sh
for i in `ps aux | grep ssh | grep -v grep | awk {'print $2'}` ; do kill $i; done
```

### Create multiple mp4 files using avidemux
```sh
for i in *;do avidemux  video-codec Xvid4 audio-codec mp3 load "${i}" save "`echo "$i" | sed -e 's/\....$//'`.done.mp4" quit; done
```

### Netcat brute force on administration login panel
```sh
for i in $(cat adm);do echo -e "GET /${i} HTTP/1.0\n\r\n\r \nHost: 192.168.77.128\r\n\r\n \nConnection: close\r\n"|nc -w 1 192.168.77.128 80 |grep -i "200 OK" 2>/dev/null >/dev/null;[ $? -eq "0" ] && echo "Found ${i}" && break;echo "$i";sleep 1;done
```

### The Hidden PS
```sh
for p in `ps L|cut -d' ' -f1`;do echo -e "`tput clear;read -p$p -n1 p`";ps wwo pid:6,user:8,comm:10,$p kpid -A;done
```

### Convert all Flac in a directory to Mp3 using maximum quality variable bitrate
```sh
for file in *.flac; do flac -cd "$file" | lame -q 0 vbr-new -V 0 - "${file%.flac}.mp3"; done
```

### Tune your guitar from the command line.
```sh
for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done
```

### convert all files in a dir of a certain type to flv
```sh
for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.flv"; done
```

### Unrar multiple directories into current working directory
```sh
for x in */*.rar; do unrar x $x; done
```

### Convert multiple flac files to mp3
```sh
for file in *.flac; do $(flac -cd "$file" | lame -h - "${file%.flac}.mp3"); done
```

### old man's advice
```sh
fortune | toilet -w $(($(tput cols)-5)) -f pagga | cowsay -n -f beavis.zen
```

### Connect to all running screen instances
```sh
for i in `screen -ls | perl -ne'if(/^\s+\d+\.([^\s]+)/){print $1, " "}'`; do gnome-terminal -e "screen -x $i"; done
```

### Encrypt every file in the current directory with 256-bit AES, retaining the original.
```sh
for f in * ; do [ -f $f ] && openssl enc -aes-256-cbc -salt -in $f -out $f.enc -pass file:/tmp/password-file ; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|perl -pe s/^..//`;do echo -e `git show pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r
```

### Open multiple tabs in Firefox from a file containing urls
```sh
for line in `cat $file`; do firefox -new-tab "$line" & 2>/dev/null; sleep 1; done
```

### Find all folder in /var that contains log in their path and have more than 10 files inside them, print the folder and the count
```sh
for i in `find -L /var/ -wholename \*log\* -type d`; do COUNT=`ls -1U $i | wc -l`; if [ $COUNT -gt 10 ]; then echo $i $COUNT; fi; done
```

### Compare prices in euro of the HTC Desire on all the european websites of Expansys.
```sh
for i in be bg cz de es fi fr hu it lv lu at pl pt ro sk si  ; do echo -n "$i " ; wget -q -O - http://www.expansys.$i/d.aspx?i=196165 | grep price | sed "s/.*<p id='price'><strong>&euro; \([0-9]*[,.][0-9]*\).*/\1/g"; done
```

### Display usb power mode on all devices
```sh
for i in `find /sys/devices/*/*/usb* -name level` ; do echo -n "$i: " ; cat $i ; done
```

### Join a folder full of split files
```sh
for file in *.001; do NAME=`echo $file | cut -d. -f1,2`; cat "$NAME."[0-9][0-9][0-9] > "$NAME"; done
```

### Print all environment variables, including hidden ones
```sh
for _a in {A..Z} {a..z};do _z=\${!${_a}*};for _i in `eval echo "${_z}"`;do echo -e "$_i: ${!_i}";done;done|cat -Tsv
```

### Make directories for and mount all iso files in a folder
```sh
for file in *.iso; do mkdir `basename $file | awk -F. '{print $1}'`; sudo mount -t iso9660 -o loop $file `basename $file | awk -F. '{print $1}'`;  done
```

### parted - scripted partitioning (of all multipathed SAN LUNs)
```sh
for i in $(multipath -ll | grep "3PARdata,VV"|awk '{print $1}') ; do parted -a optimal /dev/mapper/$i script  mklabel gpt mkpart primary 1 -1 set 1 lvm on ; done
```

### Ping scanning without nmap
```sh
for i in {1..254}; do ping -c 1 -W 1 10.1.1.$i | grep 'from'; done
```

### Bruteforce dm-crypt using shell expansion
```sh
for a in {p,P}{a,A,4}{s,S,5}{s,S,5}; do echo $a|cryptsetup luksOpen /dev/sda5 $a && echo KEY FOUND: $a; done
```

### Rename files to be all in CAPITALS
```sh
for n in * ; do mv $n `echo $n | tr '[:lower:]' '[:upper:]'`; done
```

### Adding Prefix to File name
```sh
for i in *.pdf; do mv "$i" CS749__"$i"; done
```

### Let keyboard LED blink
```sh
for a in $(seq 15); do (xset led 3);(xset -led 3);sleep .9;done
```

### E-mail a traditional Berkeley mbox to another recipient as individual e-mails.
```sh
formail -Y -s /usr/sbin/sendmail bar@example.com < /var/mail/foo
```

### Print a row of 50 hyphens
```sh
for i in `seq 1 1 50`; do  echo -n -; done
```

### Convert wma to mp3@128k
```sh
for f in *.wma; do ffmpeg -i "$f" -ab 128k "${f%.wma}.mp3" -ab 128K; done
```

### Unbelievable Shell Colors, Shading, Backgrounds, Effects for Non-X
```sh
for c in `seq 0 255`;do t=5;[[ $c -lt 108 ]]&&t=0;for i in `seq $t 5`;do echo -e "\e[0;48;$i;${c}m|| $i:$c `seq -s+0 $(($COLUMNS/2))|tr -d '[0-9]'`\e[0m";done;done
```

### Umount only the NFS related to 'string'
```sh
for i in `df -P |grep string|cut -f2 -d%|cut -c2-100`; do umount -l -f $i;done
```

### Printing multiple years with Unix cal command
```sh
for y in 2009 2010 2011; do cal $y; done
```

### Download 10 random wallpapers from images.google.com
```sh
for((i=0;i<10;i++)) do tmp=`wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=es&q=wallpaper&sa=N&start=$(($RANDOM%700+100))&ndsp=10" quiet|grep -oe 'http://[^"]*\.jpg'|head -1`;[[ $tmp != "" ]] && wget $tmp || echo "Error $[$i+1]";done
```

### Copy 3 files from 3 different servers and adds server name tag to file copied
```sh
for i in `seq 1 3`; do scp finku@server$i:file.txt server$i-file.txt; done
```

### Testing ftp server status
```sh
for host in $(cat ftps.txt) ; do if echo -en "o $host 21\nquit\n" |telnet 2>/dev/null |grep -v 'Connected to' >/dev/null; then echo -en "FTP $host KO\n"; fi done
```

### Set name of windows in tmux/byobu to hostnames of servers you're connected to
```sh
for i in $(tmux list-windows -F '#{window_index}'); do panenames=$(tmux list-panes -t $i -F '#{pane_title}' | sed -e 's/:.*$//' -e 's/^.*@//' | uniq); windowname=$(echo ${panenames} | sed -e 's/ /|/g'); tmux rename-window -t $i $windowname; done
```

### show ALL iptable rules
```sh
for i in `cat /proc/net/ip_tables_names`; do iptables -nL -v line-numbers -t $i ; done
```

### listen to an offensive fortune
```sh
fortune -o | espeak
```

### LIst svn commits by user for a date range
```sh
for i in `svn log -r{2011-02-01}:HEAD | awk '$3 == "user" {print $1}'`; do svn log -v -$i;done
```

### Kill all processes that don't belong to root/force logoff
```sh
for i in $(pgrep -v -u root);do kill -9 $i;done
```

### Change size of lots of image files.
```sh
for File in *.jpg; do mogrify -resize 1024 -quality 96 $File; done
```

### Archive all folders in a directory into their own tar.bz2 file
```sh
for i in */; do echo tar -cjf "${i%/}.tar.bz2" "$i"; done
```

### Create a bunch of dummy text files
```sh
for i in `seq 1 4096`; do tr -dc A-Za-z0-9 </dev/urandom | head -c8192 > dummy$i.rnd; done
```

### Create a bunch of dummy text files
```sh
for i in {1..4096}; do base64 /dev/urandom | head -c 8192 > dummy$i.rnd ; done
```

### Kill google chrome process
```sh
for i in $(ps x | grep chrome | cut -d"?" -f1 | grep -v chrome); do kill -9 $i ; done
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `lanscan -i | awk '{print $1}'` ; do ifconfig $i ; done
```

### List hostnames of all IPs
```sh
for IP in $(/sbin/ifconfig | fgrep addr: | sed 's/.*addr:\([[0-9.]*\) .*/\1/') ; do host $IP | awk '{print $5}'; done
```

### Renames all files in the current directory such that the new file contains no space characters.
```sh
for file in *; do mv -v "$file" "$(sed 's/ //g' <(echo $file))"; done
```

### for x in `psql -e\l | awk '{print $1}'| egrep -v "(^List|^Name|\-\-\-\-\-|^\()"`; do pg_dump -C $x | gzip > /backups/$x-back.gz
```sh
for x in `psql -e\l | awk '{print $1}'| egrep -v "(^List|^Name|\-\-\-\-\-|^\()"`; do pg_dump -C $x | gzip > /var/lib/pgsql/backups/$x-nightly.dmp.gz; done
```

### Batch convert PNG to JPEG
```sh
for i in *.png; do convert "$i" "${i%.png}.jpg" && rm "$i" && echo "$i is converted."; done
```

### Replace spaces in filename
```sh
for i in *\ *; do if [ -f "$i" ]; then mv "$i" ${i// /_}; fi; done
```

### convert png into jpg using imagemagick
```sh
for img in *.png; do   convert "$img" "$img.jpg" ; done
```

### Create a simple playlist sort by Genre using mp3info
```sh
for file in $(find ~/ -iname "*.mp3");do c=$(mp3info $file|grep Genre|cut -f 3 -d :|cut -f 2 -d " ");if [ -z "$c" ];then c="Uncategorized";fi;if [ ! -e $c ];then touch $c.m3u;fi;echo "$file">>$c.m3u;done
```

### Download all videos in your Boxee queue
```sh
for i in $(curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/object/url | cut -d "=" -f 2,3); do get_flash_videos $i; done
```

### File rotation without rename command
```sh
for i in {6..1} ; do for f in *.$i.gz ; do mv "$f" "${f/.$i.gz}".$((i+1)).gz 2> /dev/null ; done; done
```

### Check the status of a network interface
```sh
for i in `ls /sys/class/net/`; do echo $i: `cat /sys/class/net/$i/operstate`; done
```

### enable all bash completions in gentoo
```sh
for i in `eselect bashcomp list | awk '{print $2}'`; do eselect bashcomp enable $i; done
```

### Increment the filename of png in a given directory by one
```sh
for i in `ls -r *.png`; do mv $i `printf "%03d.png" $(( 10#${i%.png}+1 ))`; done
```

### cycle through everything sox knows how to read, playing only the first three seconds
```sh
for x in 8svx aif aifc aiff aiffc ... wv wve xa xi ; do echo $x ; play -q -t $x soundfile trim 0 3  ; done
```

### Find file containing namespace in a directory of jar files.
```sh
for f in *.jar; do if jar -tf $f | grep -q javax.servlet; then echo $f; fi; done
```

### Clear ARP table in linux.
```sh
for arptable in `arp | grep "eth1" | cut -d " " -f1`; do arp -d $arptable; done
```

### Using Git, stage all manually deleted files.
```sh
for x in `git status | grep deleted | awk '{print $3}'`; do git rm $x; done
```

### Rename duplicates from MusicBrainz Picard
```sh
for i in */*/*\(1\)*; do mv -f "$i" "${i/ (1)}"; done
```

### One liner to parse all epubs in a directory and use the calibre ebook-convert utility to convert them to mobi format
```sh
for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation extra-css="/yourdir/calibre.css" asciiize enable-heuristics;done
```

### Download all MegaTokyo strips
```sh
for i in $(seq 1 `curl http://megatokyo.com 2>/dev/null|grep current|cut -f6 -d\"`);do wget http://megatokyo.com/`curl http://megatokyo.com/strip/${i} 2>/dev/null|grep  src=\"strips\/|cut -f4 -d\"`;done
```

### Number of .... indicate how far down to cd
```sh
for i in {1..6};do c=;d=;for u in `eval echo {1..$i}`;do c="$c../";d="$d..";eval "$d(){ cd $c;}"; eval "$d.(){ cd $c;}";done;done
```

### Convert every eps in a directory to pdf
```sh
for f in *.eps;do ps2pdf -dEPSCrop $f `basename $f .eps`.pdf; done
```

### aptbackup restore
```sh
for p in `grep -v deinstall /var/mobile/Library/Preferences/aptbackup_dpkg-packages.txt | cut fields=1`; do apt-get -y force-yes install $p; done
```

### Removing images by size
```sh
for arq in *.png; do size=$(identify $arq | cut -f3 -d" "); [ $size == "280x190" ] || rm $arq ; done
```

### convert uppercase filenames in current directory to lowercase
```sh
for x in *;do mv "$x" "`echo $x|tr [A-Z] [a-z]`";done
```

### Show git branches by date - useful for showing active branches
```sh
for k in `git branch|sed s/^..//`;do echo -e `git log -1 pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k" `\\t"$k";done|sort
```

### search string in _all_ revisions
```sh
for i in `git log all oneline format=%h`; do git grep SOME_STRING $i; done
```

### SAR - List the average memory usage for all days recorded under '/var/log/sa/*' using sar -r.
```sh
for i in `ls /var/log/sa/|grep -E "sa[0-9][0-9]"`;do echo -ne "$i  ";sar -r -f /var/log/sa/$i|awk '{ printf "%3.2f\n",($4-$6-$7)*100/(3+$4)}'|grep -Eiv "average|linux|^ |0.00|^-" |awk '{sum+=$1 }END{printf "Average = %3.2f%%\n",sum/NR}';done
```

### Generate 2000 images with its number written on it
```sh
for i in {1..2000}; do convert -size 200x100 xc:#000000 -font Arial -pointsize 22 -fill white -gravity center -draw "text 0,0 '$i'" $i.png; done
```

### count of files from each subfolder
```sh
for i in `find /home/ -maxdepth 1 -type d`; do  echo -n $i " ";find $i|wc -l; done
```

### Sort movies by length, longest first
```sh
for i in *.avi; do echo -n "$i:";totem-gstreamer-video-indexer $i | grep DURATION | cut -d "=" -f 2 ; done | sort -t: -k2 -r
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `netstat -rn|egrep -v "Interface|Routing"|awk '{print $5}'`;do ifconfig $i;done
```

### du and sort to find the biggest directories in defined filesystem
```sh
for i in G M K; do du -hx /var/ | grep [0-9]$i | sort -nr -k 1; done | less
```

### Find out the active XOrg Server DISPLAY number (from outside)
```sh
for p in $(pgrep -t $(cat /sys/class/tty/tty0/active)); do d=$(awk -v RS='\0' -F= '$1=="DISPLAY" {print $2}' /proc/$p/environ 2>/dev/null); [[ -n $d ]] && break; done; echo $d
```

### It decripts all pgp files in a selection folder and move the output into a file.
```sh
for x in *.pgp do `cat /file_with_the_passphrase.dat|(gpg batch no-tty yes passphrase-fd=0 decrypt `basename $x`; ) > 'dump_content.dat'` done;
```

### Partition a sequence of disk drives for LVM with fdisk
```sh
for x in {a..d}; do echo -e "n\np\n\n\n\nt\n8e\nw\n" | fdisk /dev/sd"$x"; done
```

### remove the last of all html files in a directory
```sh
for f in *.html; do sed '$d' -i "$f"; done
```

### Execute a command on multiple hosts in parallel
```sh
for host in host1 host2 host3; do ssh -n user@$host <command> > $host.log & done; wait
```

### convert a mp4 video file to mp3 audio file (multiple files)
```sh
for f in *.mp4; do avconv -i "$f" -b 256k "${f%.mp4}.mp3"; done
```

### rename files according to date created
```sh
for i in *.jpg; do dst=$(exif -t 0x9003 -m $i ) && dst_esc=$(echo $dst | sed 's/ /-/g' ) && echo mv $i $dst_esc.jpg ; done
```

### Count the number of man pages per first character (a-z)
```sh
for i in {a..z} ; do  man -k $i |grep -i "^$i" |wc | awk 'BEGIN { OFS = ":"; ORS = "" }{print  $1, "\t"}' && echo $i  ;done
```

### Show only existing executable dirs in PATH using only builtin bash commands
```sh
for p in ${PATH//:/ }; do [[ -d $p && -x $p ]] && echo $p; done
```

### quickly change all .html extensions on files in folder to .htm
```sh
for i in *.html ; do mv $i ${i%.html}.htm ; done
```

### ping as traceroute
```sh
for i in {1..30}; do  ping -t $i -c 1 google.com; done | grep "Time to live exceeded"
```

### GZip all files in a directory separately
```sh
for file in *.foo; do gzip "$file"; done
```

### Destroy all disks on system simultaneously
```sh
for i in `sudo /sbin/fdisk -l |grep Disk |grep dev |awk '{ print $2 }' |sed s/://g` ; do sudo /usr/bin/dd if=/dev/urandom of=$i bs=8M & done
```

### Recursive replace of directory and file names in the current directory.
```sh
for i in `find -name '*oldname*'`; do "mv $i ${i/oldname/newname/}"; done
```

### Adding specific CustomLog for each Virtual Domain of Apache
```sh
for arquivo in `ls -1` ; do sed -i '/ErrorLog/a\ \ \ \ \ \ \ \ CustomLog \/var\/log\/apache2\/access_'"$file"'_log combined' /root/site-bak/${file} ; done
```

### Show crontabs for all users
```sh
for i in /var/spool/cron/tabs/*; do echo ${i##*/}; sed 's/^/\t/' $i; echo; done
```

### Perform a C-style loop in Bash.
```sh
for (( i = 0; i < 100; i++ )); do echo "$i"; done
```

### Just convert your all books DJVU format to PDF, with one line
```sh
for i in *.djvu; do djvu2pdf $i && echo "Finished -> $i"; done;
```

### Equivalent to ifconfig -a in HPUX
```sh
for i in `lanscan -i | awk '{print $1}'` ; do ifconfig $i ; done 2> /dev/null
```

### Batch Convert SVG to PNG
```sh
for i in *.svg; do convert "$i" "${i%.svg}.png"; done
```

### Update Ogg Vorbis file comments
```sh
for f in *.ogg; do vorbiscomment -l "$f" | sed 's/peter gabriel/Peter Gabriel/' | vorbiscomment -w "$f"; done
```

### Writes ID3 tags using the file name as the title.
```sh
for x in *.mp3; do y=`echo $x | sed 's/...\(.*\)/\1/' | sed 's/.mp3//ig'`; id3v2 TIT2 "$y" "$x"; done
```

### Create a false directory structure for testing your commands
```sh
for each in /usr/bin/*; do echo $each | sed 's/\/usr\/bin\///' | xargs touch; done
```

### Formatted list - WWNs of all LUNs
```sh
for i in /sys/block/sd* ; do wwn=`/lib/udev/scsi_id -g -s /block/${i##*/}` ; [ "$wwn" != "" ] && echo -e ${i##*/}'\t'$wwn ;done
```

### Binary clock
```sh
for a in $(date +"%H%M"|cut -b1,2,3,4 output-delimiter=" ");do case "$a" in 0)echo "....";;1)echo "...*";;2)echo "..*.";;3)echo "..**";;4)echo ".*..";;5)echo ".*.*";;6)echo ".**.";;7)echo ".***";;8)echo "*...";;9)echo "*..*";;esac;done
```

### Open multiple tabs in Firefox from a file containing urls
```sh
for /F %i in (url_list.txt) do Firefox.exe -new-tab "%i"
```

### Convert MP3s & an image to MP4 videos using ffmpeg
```sh
for name in *.mp3; do ffmpeg -loop 1 -i imagename.jpg -i "$name" -shortest -c:v libx264 -preset ultrafast -c:a copy "${name%.*}.mp4"; done
```

### create SQL-statements from textfile with awk
```sh
for each in `cut -d " " -f 1 inputfile.txt`; do echo "select * from table where id = \"$each\";"; done
```

### avoid ssh hangs using jobs
```sh
for host in $HOSTNAMES; do ping -q -c3 $host && ssh $host 'command' & for count in {1..15}; do sleep 1; jobs | wc -l | grep -q ^0\$ && continue; done; kill %1; done &>/dev/null
```

### Get all these commands in a text file with description.
```sh
for x in `jot - 0 2400 25`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x"  ; done > commandlinefu.txt
```

### for all flv files in a dir, grab the first frame and make a jpg.
```sh
for f in *.flv; do ffmpeg -y -i "$f" -f image2 -ss 10 -vframes 1 -an "${f%.flv}.jpg"; done
```

### Restore permissions or ownership from a backup directroy
```sh
for x in `find /dir_w_wrong_ownership/`; do y=`echo "$x" | sed 's,/dir_w_wrong_ownership/,/backup_dir/,'`; chown reference $y $x; done;
```

### Download German word pronounciation as mp3 file
```sh
for w in [WORT1] [WORTn]; do wget -O $w.mp3 $(wget -O - "http://www.duden.de/rechtschreibung/$w" | grep -o "http://www.duden.de/_media_/audio/[^\.]*\.mp3"); done
```

### Iterate through screens
```sh
for pid in `screen -ls | grep -v $STY | grep tached | awk '{print $1;}' | perl -nle '$_ =~ /^(\d+)/; print $1;'`; do screen -x $pid; done
```

### Find all relevant certificates (excluding some dirs) and list them each
```sh
for crt in $(locate -r '.+\.crt' | grep -v "/usr/share/ca-certificates/"); do  ls -la $crt; done
```

### convert single digit to double digits
```sh
for i in [0-9].ogg; do mv {,0}$i; done
```

### Decompress all .tar.gz files and remove the compressed .tar.gz
```sh
for i in *.tar.gz; do tar -x -v -z -f $i && rm -v $i; done
```

### Delimiter Hunting
```sh
for i in `seq 0 9` A B C D E F; do for j in `seq 0 9` A B C D E F; do HEX=\$\'\\x${i}${j}\'; if ! eval grep -qF "$HEX" file; then eval echo $HEX \\x${i}${j}; fi; done; done 2> /dev/null | less
```

### Displays user-defined ps output and pidstat output about the top CPU or MEMory users.
```sh
for i in $(ps -eo pid,pmem,pcpu| sort -k 3 -r|grep -v PID|head -10|awk '{print $1}');do diff -yw <(pidstat -p $i|grep -v Linux) <(ps -o euser,pri,psr,pmem,stat -p $i|tail);done
```

### Revert all modified files in an SVN repo
```sh
for file in `svn st | awk '{print $2}'`; do svn revert $file; done
```

### List image attributes from a folder of JPEG images
```sh
for file in *.jpg; do identify -format '%f %b %Q %w %h' $file; done
```

### A line across the entire width of the terminal
```sh
for ((i=0; i<$(tput cols); i++)); do echo -e "=\c" ;done
```

### use md5sum -c recursively through subdirectory tree when every directory has its own checksum file
```sh
for i in $(find . -name *md5checksum_file* | sed 's/\(\.\/.*\)md5checksum_file.txt/\1/'); do cd "$i"; md5sum -c "md5checksum_file.txt"; cd -; done | tee ~/checksum_results.txt | grep -v "<current directory>"
```

### Recursive find all mp4s in a folder and convert to ogv if the ogv does not exist or the mp4 is newer then the current ogv
```sh
for file in $(find . -name *.mp4); do ogv=${file%%.mp4}.ogv; if test "$file" -nt "$ogv"; then echo $file' is newer then '$ogv; ffmpeg2theora $file; fi done
```

### Linux zsh one-liner to Determine which processes are using the most swap space currently
```sh
for i in $(ps -ef | awk '{print $2}') ; { swp=$( awk '/Swap/{sum+=$2} END {print sum}' /proc/$i/smaps ); if [[ -n $swp && 0 != $swp ]] ; then echo -n "\n $swp $i "; cat /proc/$i/cmdline ; fi; } | sort -nr
```

### List all broadcast addresses for the routes on your host.
```sh
for net in $(ip route show | cut -f1 -d\  | grep -v default); do ipcalc $net | grep Broadcast | cut -d\  -f 2; done
```

### The letter your commands most often start with
```sh
for i in {a..z}; do echo $(cat ~/.bash_history | grep ^$i.* | wc -l) $i; done | sort -n -r
```

### Backup all files matching a pattern to files with a timestamp
```sh
for FILE in *.conf; do cp $FILE{,.`date +%Y%m%dt%M:%H:%S`}; done
```

### Check SSH fingerprints
```sh
for id in `ls -1 ~/.ssh | grep -v "authorized\|known_hosts\|config\|\."` ; do echo -n "$id: " ; ssh-keygen -l -f .ssh/$id ; done
```

### delete all bitbucket repos via rest API v2 (req: jq and curl)
```sh
for repo in `curl -s -u 'USERNAME:PASSWORD' -X GET -H "Content-Type: application/json" 'https://api.bitbucket.org/2.0/repositories/USER|jq -r .values[].links.self.href`; do curl -s -u 'USERNAME:PASSWORD' -X DELETE $repo;done
```

### Check if commands are available on your system
```sh
for c in gcc bison dialog bc asdf; do if ! which $c >/dev/null; then echo Required program $c is missing ; exit 1; fi; done
```

### Print all words in a file sorted by length
```sh
for a in $(< FILENAME); do echo "$(bc <<< $(wc -m<<<$a)-1) $a";done|sort -n
```

### List prime numbers from 2 to 100
```sh
for num in `seq 2 100`;do if [ `factor $num|awk '{print $2}'` == $num ];then echo -n "$num ";fi done;echo
```

### Turn off and Stop multiple linux services with for loop
```sh
for i in rpcbind  nfslock  lldpad fcoe rpcidmapd; do service $i stop; chkconfig $i off; done
```

### Check syntax of all PHP files before an SVN commit
```sh
for i in `svn status | egrep '^(M|A)' | sed -r 's/\+\s+//' | awk '{ print $2 }'` ; do if [ ! -d $i ] ; then php -l $i ; fi ; done
```

### Overwrite local files from copies in a flat directory, even if they're in a different directory structure
```sh
for f in $(find * -maxdepth 0 -type f); do file=$(find ~/target -name $f); if [ -n "$file" ]; then cp $file ${file}.bak; mv $f $file; fi; done
```

### Calculate days on which Friday the 13th occurs
```sh
for y in $(seq 1996 2018); do echo -n "$y -> "; for m in $(seq 1 12); do NDATE=$(date date "$y-$m-13" +%A); if [ $NDATE == 'Friday' ]; then PRINTME=$(date date "$y-$m-13" +%B);echo -n "$PRINTME "; fi; done; echo; done
```

### cpanel umount virtfs mounts
```sh
for i in `cat /proc/mounts | grep /home/virtfs | cut -d ? ? -f 2 ` ; do umount $i; done
```

### How to find all open files by a process in Solaris 10
```sh
for i in `pfiles pid|grep S_IFREG|awk '{print $5}'|awk -F":" '{print $2}'`; do find / -inum $i |xargs ls -lah; done
```

### Recursively remove all empty directories
```sh
for foo in <list of directories>; do while find $foo -type d -empty 2>/dev/null| grep -q "."; do find $foo -type d -empty -print0 | xargs -0 rmdir; done; done
```

### Batch image resize
```sh
for a in `ls`; do echo $a && convert $a -resize <Width>x<Height> $a; done
```

### Discover unoptimized MySQL tables and optimize them.
```sh
for table in $(echo "select concat(TABLE_SCHEMA, '.', TABLE_NAME) from information_schema.TABLES where TABLE_SCHEMA NOT IN ('information_schema','mysql') and Data_free > 0" | mysql skip-column-names); do echo "optimize table ${table}" | mysql; done;
```

### Iteratively change part of image
```sh
for i in *.png; do convert "$i" \( ../Source_dir/source.png -crop 120x300+650+75 +repage \) -gravity NorthWest -geometry +650+75 -compose copy -composite ../Dest_Dir/"$i" & done
```

### Insert a date before the suffix of all the json files in a directory
```sh
for i in `ls`; do mv "$i" "`echo $i | sed s/.json/_20160428.json/`"; done
```

### Convert all FLV's in a directory to Ogg Theora (video)
```sh
for i in $(ls *.flv); do ffmpeg2theora -v 6 optimize $i; done
```

### One liner to parse all epubs in a directory and use the calibre ebook-convert utility to convert them to mobi format
```sh
for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize enable-heuristics;done
```

### Batch JPEG rename to date using ImageMagick
```sh
for fil in *.JPG; do datepath="$(identify -verbose $fil | grep DateTimeOri | awk '{print $2"_"$3 }' | sed s%:%_%g)"; mv -v $fil $datepath.jpg; done
```

### convert single digit to double digits
```sh
for f ([0-9].txt) zmv $f '${(l:1::0:)}'$f
```

### Batch symbolic links creation
```sh
for i in '/tmp/file 1.txt' '/tmp/file 2.jpg'; do ln -s "$i" "$i LINK"; done
```

### List files that are not owned by any installed package
```sh
for file in /usr/bin/*; do pacman -Qo "$file" &> /dev/null || echo "$file"; done
```

### Add crc32 checksum in the filenames of all mp4
```sh
for file in *.mp4; do mv "$file" "${file%.*} [$(cksfv -b -q "$file" | egrep -o "\b[A-F0-9]{8}\b$")].${file#*.}"; done
```

### How to HTMLize many files containing accents ?|?|?|?|?
```sh
for i in `grep -ri "?\|?\|?\|?\|?" * col | cut -d: -f1 |sort -u `;do sed -i "s/?/\&aacute;/g" $i; sed -i "s/?/\&eacute;/g" $i; sed -i "s/?/\&iacute;/g" $i; sed -i "s/?/\&oacute;/g" $i; sed -i "s/?/\&uacute;/g" $i; echo "HTMLizing file [$i]";done
```

### for loop, counting forward for backward
```sh
for i in {1..15}; do echo $i; done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in `seq 0 100`;do timeout 6 dialog gauge "Install..." 6 40 "$i";done
```

### simulate Simultaneous connections with curl
```sh
for i in {0..60}; do (curl -Is http://46.101.214.181:10101 | head -n1 &) 2>/dev/null; sleep 1;  done;
```

### Change all the limits that can be changed to unlimited
```sh
for fl in $(ulimit -a | awk '{ gsub(":", "", $1); print $1}'); do ulimit $fl unlimited; done
```

### Zip all subdirectories into zipfiles
```sh
for f in `find . \( ! -name . -prune \) -type d -print`; do zip $f.zip $f; done
```

### Remove acentuation from file names in a directory.
```sh
for i in *; do mv -vi "$i" "`echo "$i"|sed y/????????????????????????/AAAAEEIOOUUCaaaaeeioouuc/`"; done; sync
```

### List encoding of ? in all avalible char sets
```sh
for i in `recode -l | cut -d" " -f 1`; do echo $i": ?" | recode utf-8..$i -s -p >> temp; done; vim temp
```

### Resolve *.so dependencies in current directory and copy to /tmp/build directory
```sh
for f in $(find . -name "*.so"); do ldd -v $(realpath $f) | grep -Eo "(/[a-z0-9\_.+-]+)*" | uniq | xargs -I % cp parents % /tmp/build; done
```

### Random IPv4 address
```sh
for i in a b c d; do echo -n $(($RANDOM % 256)).; done | sed -e 's/\.$//g'
```

### Unmount all CIFS drives
```sh
for D in `mount -lt cifs | sed 's/.*on \(\/.\+\) type.*/\1/'`; do echo -n "UNMOUNTING $D..."; sudo umount $D; echo " [DONE]"; done;
```

### To find a class/properties/xml in collection of jars
```sh
for i in `find . -name "*.jar"`; do jar -tvf $i | grep -v /$ | awk -v file=$i '{print file ":" $8}'; done > all_jars.txt
```

### Download all Phrack .tar.gzs
```sh
for ((i=1; i<67; i++))   do     wget http://www.phrack.org/archives/tgz/phrack${i}.tar.gz -q;  done
```

### Search for a pattern across files in a code base (leaving out CVS directories)
```sh
for f in $(find /path/to/base -type f | grep -vw CVS); do grep -Hn PATTERN $f; done
```

### To Find CVE fix from the rpm log
```sh
for i in $(cat vulns.txt); do echo $i; rpm -qa ?changelog | grep -i $i; done
```

### Create a false directory structure for testing your commands
```sh
for i in /usr/bin/* ;do touch ${i##*/}; done
```

### Automatically update all the installed python packages
```sh
for i in `pip list -o format legacy|awk '{print $1}'` ; do pip install upgrade $i; done
```

### Extract the right stereo channel from all the wav files in current dir (left channel would be 'remix 1')
```sh
for i in *.wav; do sox "$i" "${i%.*}_RightChan.wav" remix 2; done
```

### Show git branches by date - useful for showing active branches
```sh
for k in $(git branch | sed /\*/d); do echo "$(git log -1 pretty=format:"%ct" $k) $k"; done | sort -r | awk '{print $2}'
```

### Extract audio from dvd vobs in current dir
```sh
for i in *.VOB; do mplayer "$i" -ao pcm:file="${i%.*}.wav"; done
```

### Deleting directory recurcive. Directories will be deleled when empty or contains only .svn subdirectory
```sh
for I in $(find . -depth -type d -not -path  "*/.svn*" -print) ; do N="$(ls -1A ${I} | wc -l)"; if [[ "${N}" -eq 0 || "${N}" -eq 1 &&  -n $(ls -1A | grep .svn) ]] ; then svn rm force "${I}"; fi ; done
```

### Delete keys from Redis by matching a pattern
```sh
for key in `echo 'KEYS pattern*' | redis-cli | awk '{print $1}'`; do echo DEL $key; done | redis-cli
```

### stress test curl  60 connection simulate
```sh
for i in {0..60}; do (curl -Is http://<domain/ip> | head -n1 &) 2>/dev/null; sleep 1;  done;
```

### purge old stale messages on a qmail queue
```sh
for i in `grep "unable to stat" /var/log/syslog | cut -d "/" -f 3 | sort | uniq`; do find /var/qmail/queue -name $i -type f -exec rm -v {} \; ; done
```

### File rename with regexp
```sh
for i in xxxx*.mp4; do j=`echo $i | sed 's/ - \([0-9][0-9]\). / S1E\1 - /g'`; mv "$i" "$j"; done
```

### sync a directory of corrupted jpeg with a source directory
```sh
for i in *jpg; do jpeginfo -c $i | grep -E "WARNING|ERROR" | cut -d " " -f 1 | xargs -I '{}' find /mnt/sourcerep -name {} -type f -print0 | xargs -0 -I '{}' cp -f {} ./ ; done
```

### Count open file handles for a specific user ID
```sh
for x in `ps -u 500 u | grep java | awk '{ print $2 }'`;do ls /proc/$x/fd|wc -l;done
```

### Remove password from PDF
```sh
for F in *.pdf ; do qpdf password=your_password decrypt "$F" "$(basename $F .pdf)-nopw.pdf" ; done
```

### Numeric zero padding file rename
```sh
for i in $(seq -w 0 100) ; do mv prefix$(( 10#$i )).jpg prefix${i}.jpg ; done
```

### replace dots in filenames with dashes, using sed
```sh
for f in *; do fn=`echo $f | sed 's/\(.*\)\.\([^.]*\)$/\1\n\2/;s/\./-/g;s/\n/./g'`; mv $f $fn; done
```

### DNS cache snooping
```sh
for i in `cat names.txt`; do host -r $i [nameserver]; done
```

### Show numerical values for each of the 256 colors in bash
```sh
for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
```

### Converts to PDF all the OpenOffice.org files in the directory
```sh
for i in $(ls *.od{tp}); do unoconv -f pdf $i; done
```

### grep all pdf files in a folder
```sh
for i in *.pdf; do echo $i-; echo; pdftotext $i - | grep -i Yourpattern; done
```

### Recursively set the files to ignore in all folders for svn
```sh
for folder in $( find $( pwd ) -maxdepth 1 -type d | grep -v .svn ); do svn propset svn:ignore -F ignorelist ${folder}; done
```

### Check if the files in current directory has the RPATH variable defined
```sh
for i in *; do file $i | grep -q ELF || continue; readelf -d $i | grep -q RPATH || echo $i; done
```

### Sets performance CPU governer of all cores of a 4-core CPU.
```sh
for i in {0..3}; do cpufreq-set -c $i -g performance; done
```

### Sort by size all hardlinked files in the current directory (and subdirectories)
```sh
for a in $(find . -xdev -type f -printf '%i\n'|sort|uniq -d);do find . -xdev -inum $a -printf '%s %i %m %n %U %G %AD %Ar %p\n';done|sort -n|awk '{if(x!=$2){print "-"};x=$2;print $0}'
```

### Count number of javascript files in subdirectories
```sh
for f in `find . -type d`; do  pushd . > /dev/null ; echo -e `cd $f ; find . -name \*\.js | wc -l` "\t" $f | grep -v ^0 ; popd >/dev/null; done | sort -n -k 1 -r | less
```

### resize all the images returned by ls command and append "new_" to the resized images
```sh
for file in `ls *.png`;do convert $file -resize 65% new_$file; done
```

### See crontabs for all users that have one
```sh
for USER in /var/spool/cron/*; do echo "- crontab for $USER -"; cat "$USER"; done
```

### Convert all flac files in dir to mp3 320kbps using ffmpeg
```sh
for FILE in *.flac; do ffmpeg -i "$FILE" -b:a 320k "${FILE[@]/%flac/mp3}"; done;
```

### Delete all active Brightbox cloud servers
```sh
for server in `brightbox-servers list |grep active|awk '{ print $1}'`;do brightbox-servers destroy $server;done
```

### Destroy all unmapped Brightbox Cloud IPs
```sh
for ip in `brightbox-cloudips list |grep unmapped|awk '{ print $1}'`;do brightbox-cloudips destroy $ip;done
```

### number kill your terminal
```sh
for ((i=0; i>-1000; i)); do echo "${!i}"; done
```

### Parse History For specified Commands, Persist to Individual Log Files
```sh
for i in [enter list of commands]; do history |grep -i "$i" >> ~/histories/"${i}"_hist.txt;done
```

### Remove invalid key from the known_hosts file for the IP address of a host
```sh
for HOSTTOREMOVE in $(dig +short host.domain.tld); do ssh-keygen -qR $HOSTTOREMOVE; done
```

### Check syntax of all Perl modules or scripts underneath the current directory
```sh
for code in $(find . -type f -name '*.p[ml]'); do perl -c "$code"; done
```

### Rerun a command until there are no changes, but no more than N times.
```sh
for times in $(seq 10) ; do puppet agent -t && break ; done
```

### changing permissions to many folders, sub folders and files in the current directory.
```sh
for i in * ; do chmod -R 777 $i;done
```

### Detect broken video files with mplayer and bash in the current directory
```sh
for i in *.flv *.mkv *.avi; do mplayer -ao null -vo null -ss 0 -endpos 1 >/dev/null "$i" 2> >(grep -qi error && echo >&2 "$i seems bad"); done
```

### how to like to know if a host is ON
```sh
for ip in $(seq 1 25); do ping -c 1 192.168.0.$ip>/dev/null; [ $? -eq 0 ] && echo "192.168.0.$ip UP" || : ; done
```

### fetch 1600 jokes from robsjokes.com into a single file, which is fortunable
```sh
for i in `seq -w 1600` ; do links -dump http://www.robsjokes.com/$i/index.html | sed '/Random Joke/,/Next Joke/!d' | sed '/^$/,/^$/!d' >> ~/temp/Rob.jokes ; echo '%' >> ~/temp/Rob.jokes ; done
```

### Massive rename filenames
```sh
for i in `find -name '*_test.rb'` ; do mv $i ${i%%_test.rb}_spec.rb ; done
```

### Create a file list of all package files installed on your Red-Hat-like system for easy grepping
```sh
for i in `rpm -qva | sort ` ; do ; echo "===== $i =====" ; rpm -qvl $i ; done > /tmp/pkgdetails
```

### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
for i in ./*foo*;do mv  "$i" "${i//foo/bar}";done
```

### pretend to be busy in office to enjoy a cup of coffee
```sh
for i in {0..600}; do echo $i; sleep 1; done | dialog gauge "Install..." 6 40
```

### Have a random "cow" say a random thing
```sh
fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
```

### Grap all images with the tags 'bitch' and 'bw'  from a flickr photofeed
```sh
for URL in `wget -O - http://api.flickr.com/services/feeds/photos_public.gne?tags=bitch,bw 2>/dev/null | grep -E -o "http[^ ]+?jpg" | grep -v "_m" | uniq | grep -v 'buddy'  `; do FILE=`echo $URL | grep -E -o "[0-9a-z_]+\.jpg"`; curl $URL > $FILE; done;
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
for ii in $(find /path/to/docroot -type f -name \*.php); do echo $ii; wc -lc $ii | awk '{ nr=$2/($1 + 1); printf("%d\n",nr); }'; done
```

### Disaster Snapshot (procmail)
```sh
for x in `grep server /tmp/error.log | awk '{print $3}'`; do \ t=`date "+%d-%m-%H%M%S"` ; ssh -q -t admin@$x.domain.com 'pstree -auln' > ~/snapshots/$x-$t.out \ done
```

### let a cow tell you your fortune
```sh
fortune | cowsay -f tux
```

### Search vmware vmx files if Linux guests are set to sync time to host
```sh
for x in `find /vmfs/volumes/ -name *vmx -exec grep -H linux.iso {} \;  |cut -d : -f 1`; do echo $x; grep -i sync $x; done;
```

### Simple file wipe
```sh
for F in `find ./ -type f`;do SIZE=`ls -s $F | awk -F" " '{print $1}'`; dd if=/dev/urandom of=$F bs=1024 count=$SIZE;done
```

### Batch rename files by their epoch last modified time.
```sh
for i in somefiles*.png ; do echo "$i" ; N=$(stat -c %Y $i); mv -i $i $N.png; done
```

### move all the .bak backup copies to their original names (rename files by stripping the extension)
```sh
for i in *.bak ; do nuname=`echo $i | sed 's/\.[^\.]*$//'`; echo renaming $i to $nuname;mv $i $nuname; done
```

### Extract multiple file in a directory
```sh
for i in *.tar.gz; do tar -xzf $i; done
```

### Register all DLLs in a given folder
```sh
for %1 in (*.dll) do regsvr32 /s  %1
```

### Download a set of files that are numbered
```sh
for i in `seq -w 1 50`; do wget continue \ http://commandline.org.uk/images/posts/animal/$i.jpg; done
```

### Remount all NFS mounts on a host
```sh
for P in $(mount | awk '/type nfs / {print $3;}'); do echo $P; sudo umount $P && sudo mount $P && echo "ok :)"; done
```

### Download the last most popular 20 pictures from 500px
```sh
for line in `wget referer='http://500px.com/' quiet -O- http://500px.com/popular | grep "from=popular" | sed -n 's/.*<img src="\([^"]*\)".*/\1/p' | sed s/"3.jpg"/"4.jpg"/ | sed s/"?t".*$//`; do wget -O $RANDOM.jpg quiet "$line"; done
```

### copy zip files which contains XXX
```sh
for i in *RET.zip; do unzip -l "$i"| grep -B 4 XXX | grep RET| sed "s/.\+EPS/EPS/" |xargs -I '{}' cp '{}' out/'{}';done;
```

### List Canon CR2 raw files which have been in-camera rated (5Dmk3+)
```sh
for I in *.CR2; do if [ `exiv2 pr -p a -u $I | grep 'xmp.Rating' | awk '{ print $4 }'` == "1" ]; then echo $I; fi; done
```

### Name retina images. if you get a bunch of retina images named like name.png, you can use this script to rename them properly. ie. name@2x.png
```sh
for f in *.png; do mv $f  `basename  $f  .png`@2x.png; done
```

### Mass rename files in git
```sh
for file in $(git ls-files | grep old_name_pattern); do git mv $file $(echo $file | sed -e 's/old_name_pattern/new_name_pattern/'); done
```

### find svn uncommitted files and list their properties
```sh
for d in `ls -d *`; do svn status $d |  awk '{print $2}'; done | xargs ls -l {} \;
```

### Do a search-and-replace in a file after making a backup
```sh
for file in <filename>; do cp $file{,.bak} && sed 's/old/new/g' $file.bak > $file; done
```

### Remove all installed packages from a python virtualenv
```sh
for i in $(pip freeze | awk -F== '{print $1}'); do pip uninstall $i; done
```

### Rename files with unique, randomly generated file names
```sh
for i in *.txt; do j=`mktemp | awk -F. '{print $2".txt"}'`; mv "$i" "$j"; done
```

### Download entire commandlinefu archive to single file
```sh
for x in `jot - 0 \`curl "http://www.commandlinefu.com/commands/browse"|grep "Terminal - All commands" |perl -pe 's/.+(\d+),(\d+).+/$1$2/'|head -n1\` 25`; do curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x" ; done >a.txt
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
for i in in $(vgdisplay -v vg00 | grep "LV Name" | awk '{ print $3 };'); do; lvextend -m 1 $i /dev/disk/<here-goes-the-disk>; done
```

### Extract the daily average number of iops
```sh
for x in `seq -w 1 30`; do sar -b -f /var/log/sa/sa$x | gawk '/Average/ {print $2}'; done
```

### type fortune in real time
```sh
fortune | pv -qL 10
```

### Delete all files found in directory A from directory B
```sh
for file in <directory A>/*; do rm <directory B>/`basename $file`; done
```

### resize all images in folder and create new images (w/o overwriting)
```sh
for file in *; do convert $file -resize 800x600 resized-$file; done
```

### Find a machine's IP address and FQDN
```sh
for i in `ip addr show dev eth1 | grep inet | awk '{print $2}' | cut -d/ -f1`; do echo -n $i; echo -en '\t'; host $i | awk '{print $5}'; done
```

### Empty a file
```sh
for file in `ls *.log`; do `:> $file`; done
```

### Determine what process is listening on a port on Solaris, without lsof
```sh
for x in `ptree | awk '{print $1}'`; do pfiles $x | grep ${PORT} > /dev/null 2>&1; if [ x"$?" == "x0" ]; then ps -ef | grep $x | grep -v grep; fi; done 2> /dev/null
```

### Kill all processes found in grep
```sh
for line in `ps aux | grep <string> | awk '{print $2}'`; do sudo kill $line; done;
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; echo $x | festival tts & done
```

### Show the 1000*1000 and 1024*1024 size of HDs on system
```sh
for I in $(awk '/d[a-z]+$/{print $4}' /proc/partitions); do sudo hdparm -I '/dev/'$I; done | grep 'device size with M'
```

### Find installed packages that are not in the portage tree anymore.
```sh
for f in $(qlist -IC); do stat /usr/portage/"$f" > /dev/null; done
```

### Have your sound card call out elapsed time.
```sh
for ((x=0;;x+=5)); do sleep 5; hours=$(($x/3600)); minutes=$(($x%3600/60)); seconds=$(($x%60)); echo "$hours hours $minutes minutes $seconds seconds have elapsed" | festival tts & done
```

### Adding Netvibes subscription option to Firefox and add multiple rss feeds to netvibes
```sh
for var in "$@"  do 	echo $var 	URL="http://www.netvibes.com/subscribe.php?type=rss&url=$var" 	sensible-browser $URL  	 done
```

### 10 files backup rotate in crontab
```sh
for file in $(find /var/backup -name "backup*" -type f |sort -r | tail -n +10); do rm -f $file; done ; tar czf /var/backup/backup-system-$(date "+\%Y\%m\%d\%H\%M-\%N").tgz  exclude /home/dummy /etc /home /opt 2>&- && echo "system backup ok"
```

### Git reset added new files
```sh
for f in `git status | grep new | awk '{print $3}'`; do git reset HEAD $f ; done
```

### Kill multiple Locked connection by a single user in MYSQL DB
```sh
for i in `mysqladmin -h x.x.x.x user=root -pXXXX processlist | grep <<username>>| grep <<Locked>>| awk {'print $2'}` do mysqladmin -h x.x.x.x user=root -pXXX kill $i; done;
```

### Run a command in every (direct) sub-folder
```sh
for i in */; do echo run_command "${i}"; done
```

### List alive hosts in specific subnet
```sh
for ip in `seq 1 255`; do ping -c 1 192.168.1.$ip ; done | grep ttl
```

### Changes the initial login group for all users with GID > 500 (specified with LIMIT), to group YOURGROUP
```sh
for I in $(awk -v LIMIT=500 -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd | cut -f 1-1 -d ':' | xargs); do usermod -g YOURGROUP $I ; done
```

### for ssh uptime
```sh
for k in `seq -w 1 50` ; do ssh 192.168.100.$k uptime ; done
```

### Backup all MySQL Databases to individual files
```sh
for I in `echo "show databases;" | mysql | grep -v Database`; do    mysqldump $I > "$I.sql"; done
```

### Port scan a range of hosts with Netcat.
```sh
for i in {21..29}; do nc -v -n -z -w 1 192.168.0.$i 443; done
```

### Recursively replace a string in files with lines matching string
```sh
for i in `find . -type f`; do sed -i '/group name/s/>/ deleteMissing="true">/' $i; done
```

### mkdir some file and mv some file
```sh
for i in `seq 100`; do mkdir f${i}; touch ./f${i}/myfile$i ;done
```

### Call `svn mv` recursively to rename the C prefix from class names
```sh
for i in $(find . -regex '.*\/C.*\.cpp'); do svn mv `perl -e 'my $s=$ARGV[0]; $s=~m/(.*\/)C(.*)/; print "$s $1$2"' "$i"`; done
```

### one liner to rename files with for and sed
```sh
for fn in *.epub; do echo mv \"$fn\" \"`echo "$fn" | sed -E 's/\.*\/*(.*)( - )(.*)(\.[^\.]+)$/\3\2\1\4/' | sed -E 's/(.*) ([^ ]+)( - )(.*)/\2, \1\3\4/' `\";done | sh
```

### Sort I/O activity by PID number.
```sh
for i in $(ps -eo pid|grep -v PID);do echo ""; echo -n "==$i== ";awk '/^read|^write/{ORS=" "; print}' /proc/$i/io 2>/dev/null; echo -n " ==$i=="; done|sort -nrk5|awk '{printf "%s\n%s %s\n%s %s\n%s\n\n",$1,$2,$3,$4,$5,$6}'
```

### Prefix file contents with filename
```sh
for i in *; do sed -i "s/^/$i: /" $i; done
```

### Convert all Microsoft Word files in current directory to HTML.
```sh
for f in *.doc ; do wvHtml $f ${f%.doc}.html ; done
```

### Create several copies of a file
```sh
for i in {1..5}; do cp test{,$i};done
```

### Find & remove files that are duplicates but with different extensions recursively
```sh
for f in `comm -1 -2 <(sort <(find contrib/image/ -name *.png | sed 's/\.[^.]*$//')) <(sort <(find contrib/image/ -name *.jpg | sed 's/\.[^.]*$//'))`;do rm "$f.png" && echo "deleted: $f.png";done
```

### Replace spaces in filenames with underscores
```sh
for f in *;do mv "$f" "${f// /_}";done
```
