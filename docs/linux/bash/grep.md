# grep

I usually using `ripgrep` for the same thing as grep, mostly commands works fine with `ripgrep` too

### Print number of CPU's in a system
```sh
grep -c '^$' /proc/cpuinfo
```
### Grep for 2 (or more) words anywhere on each line of a file
```sh
grep -E "(.*)(ERROR)(.*)(FAULT)(.*)" log.txt
```
### Grep directory and sub-directories
```sh
grep -r <searchterm> .
```
### Grep an array item, like a_var[11], in a file
```sh
grep -n "arrname\[[[:digit:]]\+\]" filename
```
### Grep directory and sub-directories
```sh
grep -r <searchterm> .
```
### Regex to reliably search a file for valid IP addresses (and external IP addresses)
```sh
grep -Eoa "\b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b" Filetosearch.txt
```
### CSV list of infected URLS detected by ClamAV
```sh
grep "FOUND" /var/log/squidclamav.log | awk '{print $5"-"$2"-"$3","$4","$11}' | sed -e 's/\,http.*url=/\,/g' | sed -e 's/&/\,/g' | sed -e 's/source=//g' |sed -e 's/user=//g' | sed -e 's/virus=//g' | sed -e 's/stream\:+//g' | sed -e 's/\+FOUND//g'```
### Edit all files found having a specific string found by grep
```sh
grep -ir 'foo' * | awk '{print $1}' | sed -e 's/://' | xargs vim
```
### Edit all files found having a specific string found by grep
```sh
grep -ir 'foo' * | awk -F '{print $1}' | xargs vim
```
### List fonts used by an SVG file
```sh
grep 'font-family:[^;]*' <input file.svg> | sed 's/.*font-family:\([^;]*\).*/\1/g' | sort | uniq
```
### grep tab (\t)
```sh
grep $'\t' sample.txt
```
### Find which service was used by which port number
```sh
grep '\<110/' /etc/services; grep '\b110/' /etc/services
```
### Add ofxAddons mentioned in source files, into addons.make
```sh
grep -hor ofx[a-zA-Z]*.h src/ | grep -o ofx[^\.]* >> addons.make
```
### finding cr-lf files aka dos files with ^M characters
```sh
grep -UIlr "^M" *
```
### Search for specific IPs taken form a text file within the apache access log
```sh
grep -E ":(`cat bnd-ips.txt | sed 's/\./\\./g' | tr '\n' '|'`)"  access.log
```
### Recursively grep thorugh directory for string in file.
```sh
grep -r -i "phrase" directory/
```
### List your installed Firefox extensions
```sh
grep -hIr -m 1 :name ~/.mozilla/firefox/*.$USER/extensions | tr '<>=' '"""' | cut -f3 -d'"' | sort -u
```
### Remove blank lines from a file
```sh
grep -v "^$" file
```
### find the device when you only know the mount point
```sh
grep -w /media/KINGSTON /proc/mounts | cut -d " " -f
```
### Exclude svn directories with grep
```sh
grep -r exclude-dir=.svn PATTERN PATH
```
### Grep Recursively Through Single File Extension
```sh
grep include=*.py -lir "delete" .
```
### find php files even without extension
```sh
grep -Ilr "<?php" .
```
### convert chrome html export to folders, links and descriptions
```sh
grep -E '<DT><A|<DT><H3' bookmarks.html | sed 's/<DT>//' | sed '/Bookmarks bar/d' | sed 's/ ADD_DATE=\".*\"//g' | sed 's/^[ \t]*//' | tr '<A HREF' '<a href'
```
### Do an OR search using grep to look for more than one search term
```sh
grep -i '<searchTerm>\|<someOtherSearchTerm>' <someFileName>
```
### Show all TODOs and a few relative lines after it.
```sh
grep -rnA 10 TODO *
```
### Grep for a TAB
```sh
grep $'\t' file.txt
```
### Count emails in an MBOX file
```sh
grep -c '^From ' mbox_file
```
### prints line numbers
```sh
grep -n . datafile ;
```
### Grep for text within all files in a folder structure
```sh
grep color -R "text" directory/
```
### How To Get the Apache Document Root
```sh
grep -i '^DocumentRoot' /etc/httpd/conf/httpd.conf | cut -f2 -d'"'
```
### find names of files ending in log that have both foo and bar
```sh
grep -l bar *.log | xargs grep -l foo
```
### Multiple open files and go directly to the line where some string is
```sh
grep -rl string_to_find  public_html/css/ | xargs -I '{}' vim +/string_to_find  {} -c ":s/string_to_find/string_replaced"
```
### change the all files which contains xxxxx to yyyyyy
```sh
grep -r -l xxxxx . | xargs perl -i -pe "s/xxxxx/yyyyy/g"
```
### Search for a string in all files recursively
```sh
grep string * -R
```
### Analyse a PHP file for instantations and static calls
```sh
grep -o "\(new \(\w\+\)\|\w\+::\)" file.php | sed 's/new \|:://' | sort | uniq -c | sort
```
### find a word in multiple files avoiding svn
```sh
grep -r 'keyword keyword2' your/path/ | grep -v svn
```
### determine if CPU is 32-bit or 64-bit
```sh
grep lm /proc/cpuinfo
```
### count how many times a string appears in a (source code) tree
```sh
grep -rc logged_in app/ | cut -d : -f 2 | awk '{sum+=$1} END {print sum}'
```
### edit files in current and subdir, remove all lines that containing certain string
```sh
grep -r "sampleString" . |uniq | cut -d: -f1 | xargs sed -i "/sampleString/d"
```
### Remove today's Debian installed packages
```sh
grep -e `date +%Y-%m-%d` /var/log/dpkg.log | awk '/install / {print $4}' | uniq | xargs apt-get -y remove
```
### List your installed Firefox extensions
```sh
grep -hIr :name ~/.mozilla/firefox/*.default/extensions | tr '<>=' '"""' | cut -f3 -d'"' | sort -u
```
### Get the password for PostgreSQL backend db for VMware  vRA
```sh
grep -i s2enc /etc/vcac/server.xml | sed -e 's/.* password=\"\([^\"]*\)\".*/\1/' | xargs -n 1 vcac-config prop-util -d p 2>/dev/null; echo
```
### Show a config file without comments
```sh
grep -Pv '^\S*(#|$)'
```
### Read Nth column (e.g. 2nd column) of a row of data in a file that has a specific word (e.g. HOME) on that row and extract the last delimited value for the specified delimiter (e.g. /)
```sh
grep 'HOME.*' data.txt | awk '{print $2}' | awk '{FS="/"}{print $NF}'  OR USE ALTERNATE WAY awk '/HOME/ {print $2}' data.txt | awk -F'/' '{print $NF}'
```
### remove exact phrase from multiple files
```sh
grep -r "mystring" . |uniq | cut -d: -f1 | xargs sed -i "s/mystring//"
```
### Execute a command if a file exists
```sh
grep -sq "" /etc/lsb-release && lsb_release -rd
```
### find files containing text
```sh
grep -H -r "string" ./* >> grep.txt
```
### extract a certain number of lines from a file and dump them to another file
```sh
grep '' -m X file1 > file2
```
### Find the files that include a TODO statement within a project
```sh
grep exclude-dir=.svn exclude=*~ -i "TODO" -rl .
```
### grep 'hoge' **/*  => Argument list too long
```sh
grep -r hoge .
```
### rgrep: recursive grep without .svn
```sh
grep query -r . exclude-dir=.svn
```
### Find files containing "text"
```sh
grep -lir "text to find" *
```
### Find out how much data is waiting to be written to disk
```sh
grep ^Dirty /proc/meminfo
```
### Find String
```sh
grep -iR find_me ./
```
### View only non-comment non-empty lines in a configuration file
```sh
grep '^[^#]' squid.conf
```
### Print the matched line, along with the 3 lines after it.
```sh
grep -A 3 -i "example" demo_text
```
### grep binary (hexadecimal) patterns
```sh
grep -P "\x05\x00\xc0" mybinaryfile
```
### find the difference in 2 files with grep (diff alternative)
```sh
grep -vf file1 file2
```
### remove comment '#' in conf files.
```sh
grep -v ^# file.conf | grep -v ^$ > new_file.conf
```
### grep directory and sub-directories
```sh
grep -r <searchterm> *
```
### Remove newlines from output
```sh
grep . filename
```
### Grep syslog today last hour
```sh
grep -i "$(date +%b\ %d\ %H)" syslog
```
### Grep log between range of minutes
```sh
grep -i "$(date +%b" "%d )13:4[0-5]" syslog
```
### Colorized grep in less
```sh
grep color=always | less -R
```
### Remove blank lines from a file using grep and save output to new file
```sh
grep . filename > newfilename
```
### Get all possible problems from any log files
```sh
grep -2 -iIr "err\|warn\|fail\|crit" /var/log/*
```
### intersection between two files
```sh
grep -Fx -f file1 file2
```
### Count occurrences per minute in a log file
```sh
grep <something> logfile | cut -c2-18 | uniq -c
```
### Search and Replace across multiple files
```sh
grep -lr -e '<oldword>' * | xargs sed -i 's/<oldword>/<newword>/g'
```
### Quick key/value display within /proc or /sys
```sh
grep -r . /sys/class/net/eth0/statistics
```
### Remove today's installed packages
```sh
grep "install " /var/log/dpkg.log | awk '{print $4}' | xargs apt-get -y remove purge
```
### Print number of mb of free ram
```sh
grep '^MemFree:' /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f MB\n", mem }'
```
### Number of CPU's in a system
```sh
grep "processor" /proc/cpuinfo | wc -l
```
### recursive search and replace old with new string, inside files
```sh
grep -rl oldstring . | parallel sed -i -e 's/oldstring/newstring/'
```
### delete files containing matching text
```sh
grep -r -Z -l "<text>" . | xargs -0 echo rm
```
### grep apache access.log and list IP's by hits and date - sorted
```sh
grep Mar/2009 /var/log/apache2/access.log |  awk '{ print $1 }' | sort -n | uniq -c | sort -rn | head
```
### find files containing text
```sh
grep -lir "some text" *
```
### Recover a deleted file
```sh
grep -a -B 25 -A 100 'some string in the file' /dev/sda1 > results.txt
```
### embed referred images in HTML files
```sh
grep -ioE "(url\(|src=)['\"]?[^)'\"]*" a.html | grep -ioE "[^\"'(]*.(jpg|png|gif)" | \
while read l ; do 
    sed -i "s>$l>data:image/${l/[^.]*./};base64,`openssl enc -base64 -in $l| tr -d '\n'`>" a.html ; 
done;
```
### Remove comments and empty lines from a conf file
```sh
grep ^[^#] /etc/file.conf
```
### Replace all tabs with spaces in an application
```sh
grep -PL "\t" -r . |  grep -v ".svn" | xargs sed -i 's/\t/    /g'
```
### Finding the number of cpu's
```sh
grep -c -e '^cpu[0-9]\+' /proc/stat
```
### extract email adresses from some file (or any other pattern)
```sh
grep -Eio '([[:alnum:]_.]+@[[:alnum:]_]+?\.[[:alpha:].]{2,6})' file.html
```
### grep for tabs without using Ctrl-V trick
```sh
grep -P '\t' filename
```
### List the CPU model name
```sh
grep "model name" /proc/cpuinfo
```
### cat a bunch of small files with file indication
```sh
grep . *
```
### Edit all files found having a specific string found by grep
```sh
grep -Hrli 'foo' * | xargs vim
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -r <pattern> * .[!.]*
```
### Search for a string in all files recursively
```sh
grep -ir string *
```
### Find common groups between two users
```sh
grep -xFf <(groups user1|cut -f3- -d\ |sed 's/ /\n/g') <(groups user2|cut -f3- -d\ |sed 's/ /\n/g')
```
### Regenerate the /etc/mtab file
```sh
grep -v rootfs /proc/mounts > /etc/mtab
```
### Search files with js declarations inside
```sh
grep -r "<script" | grep -v src | awk -F: '{print $1}' | uniq
```
### Extract IPv4 addressess from file
```sh
grep  -Eo  \([0-9]\{1,3\}[\.]\)\{3\}[0-9] file | sort | uniq
```
### grep -v with multiple patterns.
```sh
grep test somefile | grep -v -e error -e critical -e warning
```
### Search some text from all files inside a directory
```sh
grep -Hrn "text" .
```
### Recursively grep thorugh directory for string in file.
```sh
grep -rni string dir
```
### Output files without comments or empty lines
```sh
grep -v "^\($\|#\)" <filenames>
```
### Search through files, ignoring .svn
```sh
grep <pattern> -R . exclude-dir='.svn'
```
### grep lines containing two consecutive hyphens
```sh
grep   file
```
### Check if *hardware* is 32bit or 64bit
```sh
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits
```
### Lists unambigously names of all xml elements used in files in current directory
```sh
grep -h -o '<[^/!?][^ >]*' * | sort -u | cut -c2-
```
### Remove text from file1 which is in file2 and stores it in an other file
```sh
grep -Fvf file1 file2 > file-new
```
### Extract all 404 errors from your apache accesslog (prefix lines by occurrences number)
```sh
grep "HTTP/1.1\" 404" access_log | awk '{print $7 } ' | sort | uniq -c | sort -n
```
### Search trought pidgin's conversation logs for "searchterm", and output the result.
```sh
grep -Ri searchterm  ~/.purple/logs/*  | sed -e 's/<.*?>//g'
```
### Prints line numbers
```sh
grep -n "^" <filename>
```
### display a one-liner of current nagios exit statuses. great with netcat/irccat
```sh
grep current_state= /var/log/nagios/status.dat|sort|uniq -c|sed -e "s/[\t ]*\([0-9]*\).*current_state=\([0-9]*\)/\2:\1/"|tr "\n" " "
```
### Shows the torrent file name along with the trackers url
```sh
grep -ao -HP "http://[^/]*/" *
```
### grep -v with multiple patterns.
```sh
grep 'test' somefile | grep -vE '(error|critical|warning)'
```
### Read funny developer comments in the Linux source tree
```sh
grep -2riP '\b(fuck|shit|bitch|tits|ass\b)' /usr/src/linux/
```
### Dump a configuration file without comments or whitespace...
```sh
grep -v "\ *#\|^$" /etc/path/to.config
```
### Find all files containing a word
```sh
grep -rHi searchphrase *.php
```
### Returns the number of cores in a linux machine.
```sh
grep -c ^processor /proc/cpuinfo
```
### peak amount of memory occupied by any process with "FOO" in its name
```sh
grep VmHWM /proc/$(pgrep -d '/status /proc/' FOO)/status
```
### Determine configure options used for MySQL binary builds
```sh
grep CONFIG $(which mysqlbug)
```
### Remove blank lines from a file using grep and save output to new file
```sh
grep -v "^$" filename > newfilename
```
### Makes a Zenity select list based on entries in your wpa_supplicant.conf
```sh
grep -oE "ssid=\".*\"" /etc/wpa_supplicant.conf | cut -c6- | sed s/\"//g | zenity list title="Choose Access Point" column="SSID"
```
### strip config files of comments
```sh
grep -vE '^$|^[\s]*[;#]'
```
### Creates PodFeeds.txt, a file that lists the URLs of rhythmbox podcasts from the rhythmdb.xml file.
```sh
grep -A 5 -e podcast-feed rhythmdb.xml | grep -e "<location>" | sed 's: *</*[a-t]*>::g' > PodFeeds.txt
```
### Sort and count subjects of emails stuck in Exim queue
```sh
grep -R Subject /var/spool/exim/input/ | sed s/^.*Subject:\ // | sort | uniq -c | sort -n > ~/email_sort.$(date +%m.%d.%y).txt
```
### Get debian package names corresponding to latex packages used in a document
```sh
grep -R usepackage * | cut -d']' -f2 | cut -s -d'{' -f 2 | sed s/"}"/.sty"}"/g | cut -d'}' -f1 | sort | uniq | xargs dpkg -S | cut -d':' -f1 | sort | uniq
```
### recursive search and replace old with new string, inside files
```sh
grep -rlZ oldstring . | xargs -0 sed -i -e 's/oldstring/newstring/'
```
### Count lines in a file with grep
```sh
grep -c ".*" filename
```
### Search and replace in multiple files recursively
```sh
grep -lr "foo" . | xargs sed -i "s/foo/bar/g"
```
### List last opened tabs in firefox browser
```sh
grep -Eo '"entries":\[{"url":"[^"]*"' "$HOME/.mozilla/firefox/*.default/sessionstore.js" | sed 's/^.*:"//; s/"$//'
```
### view all lines without comments.
```sh
grep -v "^#" file.txt | more
```
### List the CPU model name
```sh
grep 'model\|MHz' /proc/cpuinfo  |tail -n 2
```
### Look up a unicode character by name
```sh
grep -i "$*" /usr/lib/perl5/Unicode/CharName.pm | while read a b; do /usr/bin/printf "\u$a\tU+%s\t%s\n"  "$b"; done
```
### count match string lines from file(s)
```sh
grep -in "search_string" /to/your/path
```
### extract email adresses from some file (or any other pattern)
```sh
grep -aEio '([[:alnum:]_.-\+\-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -nisI <pattern> * .[!.]*
```
### apache statistics
```sh
grep "10/Sep/2013" access.log| cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c | awk '{ if ($1 > 10) print $0}'
```
### Grep by paragraph instead of by line.
```sh
grepp() { [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";}
```
### Sort netflow packet capture
```sh
grep -o -P '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}\s->\s{5}[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}' <capture file> | tr -d ' ' | sed  's/:.....//g' | sort -n | uniq -c | sort -nr
```
### check spell in c source code
```sh
grep -o -h -rE '".*"' * | ispell -l -p ~/mydict | sort -u
```
### find files containing text
```sh
grep -lir "sometext" * > sometext_found_in.log
```
### find files beginning with filename* that do not include "string"
```sh
grep -L "string" filename*
```
### Number of CPU's in a system
```sh
grep -c ^processor /proc/cpuinfo
```
### This allows you to find a string on a set of files recursivly
```sh
grep -rF include='*.txt' stringYouLookFor *
```
### sorted list of dhcp allocations
```sh
grep ^lease /var/lib/dhcp/dhcpd.leases | cut -d ' ' -f 2 | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n | uniq
```
### Extract all IPs from a file
```sh
grep -E '([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})' -o tmp
```
### Search for string through files
```sh
grep -Rl "pattern" files_or_dir
```
### Number of CPU's in a system
```sh
grep -cE "^processor" /proc/cpuinfo
```
### Grep colorized
```sh
grep -i color=auto
```
### Show lines that are not commented out
```sh
grep "^[^#;]" /etc/php.ini
```
### get with grep exact x strings matches from output
```sh
grep "^[A-Za-z0-9]\{6\}$" myfile.txt
```
### Check where mail was sent from
```sh
grep cwd /var/log/exim_mainlog | grep -v /var/spool | awk -F"cwd=" '{print $2}' | awk '{print $1}' | sort | uniq -c | sort -n
```
### Show a config file without comments
```sh
grep -v ^# /etc/somefile.conf | grep .
```
### Search in files
```sh
grep -i -h 'account.journal.cashbox.line' *.py
```
### cat a config file removing all comments and blank lines
```sh
grep -vh '^[[:space:]]*\(#\|$\)' <file>
```
### Remove comments and empty lines from a file
```sh
grep -v '^#\|^$' /etc/hdparm.conf
```
### Grep for word in directory (recursive)
```sh
grep color=auto -iRnH "$search_word" $directory
```
### Find all files matching 'name.xml' and search for 'text' within them
```sh
grep -nH "text" -r . include *name.xml
```
### shows whether your CPU supports 64bit mode
```sh
grep -q ' lm ' /proc/cpuinfo; [ $? -eq 0 ] && echo '64bit supported'
```
### Get the URL for the git-annex webapp
```sh
grep URL ~/annex/.git/annex/webapp.html | tr -d '">' | awk -F= '{print $4 "=" $5}'
```
### IP list of aborted mail logins
```sh
grep -i "aborted login" /var/log/maillog | awk 'BEGIN{FS="="}{print substr($4,8)}' | cut -d"," -f1
```
### Btrfs: Find file names with checksum errors
```sh
grep "checksum error at logical" /var/log/messages |  egrep -o "[^ ]+$" | tr -d ')' | sort | uniq
```
### Grep for non-empty lines that do not start with # (comments) or <some-char> and does not include <some-char>
```sh
grep -v -e '^$' -e '^[#\[]' -e '\/' some_file
```
### Find in all files in the current directory, just a find shorthand
```sh
grep -H -n "pattern" *
```
### grep lines containing two consecutive hyphens
```sh
grep "\-\-" file
```
### Get a quote from Pooh
```sh
grep -Pooh .*t..r,.* /etc/init.d/*
```
### Grep auth log and print ip of attackers
```sh
grep Failed auth.log | rev | cut -d\  -f4 | rev | sort -u
```
### calculate how many different lines between two files
```sh
grep -Fvxf $(file1) $(file2) | wc -l
```
### Lists unambigously names of all xml elements used in files in current directory
```sh
grep -Eho '<[a-ZA-Z_][a-zA-Z0-9_-:]*' * | sort -u | cut -c2-
```
### move linenumbers of grep output to end of line
```sh
grep -n log4j MainPm.java  | sed -e 's/^\([^:]*\):\(.*\)/\2 \1/'
```
### Search Objective-C source file for tag listing and sort
```sh
grep '.tag =' <file> | awk '{print $3}' | awk 'sub(/[;]/, x)' | sort -n
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -RnisI <pattern> *
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -RnisI <pattern> *
```
### Check if a file is text
```sh
grep -qIm1 . $file
```
### See how many times you've typed 'ls' by itself
```sh
grep -c ^ls$ ~/.bash_history
```
### Matching Strings
```sh
grep -l <string-to-match> * | xargs grep -c <string-not-to-match> | grep '\:0'
```
### remove script from infected html files
```sh
grep -ZlRr -e BAD_SCRIPT_LINE * |xargs -0 sed -i 's/BAD_SCRIPT_LINE//g'
```
### Extract names and email addresses from LDIF files
```sh
grep -E '^(cn|mail):' file.ldif | sed -e 's/^[a-z]*: //'
```
### Display playing parameters of soundcards
```sh
grep -r "" /proc/asound/card*/pcm*/sub*/hw_params
```
### extract email adresses from some file (or any other pattern)
```sh
grep -aEio '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### find php command backdoor
```sh
grep -RPl include=*.{php,txt,asp} "(passthru|shell_exec|system|phpinfo|base64_decode|chmod|mkdir|fopen|fclose|readf?ile) *\(" /var/www/
```
### Show CPU idle and used time
```sh
grep "cpu " /proc/stat | awk -F ' ' '{total = $2 + $3 + $4 + $5} END {print "idle \t used\n" $5*100/total "% " $2*100/total "%"}'
```
### lines in file2 that are not in file1
```sh
grep -Fxv -f file1 file2
```
### Shows the line of the string you want to search for (like in normal grep) plus 'n' number of lines above and below it.
```sh
grep -C <no_of_lines> <string>
```
### grep for specific function invocations
```sh
grep -E -rn color=always exclude-dir=".svn" exclude-dir="packages" exclude="*.swp" "(emit|on)\([\'\"]leader" ~/project/ | less -R
```
### grep 2 words existing on the same line
```sh
grep -E/egrep 'word1.*word2|word2.*word1' "$@"
```
### Search ruby-files with non-ascii character, but without encoding directive
```sh
grep -l include '*.rb' include '*.rake' '^[^#]*[^a-zA-Z0-9[:punct:][:space:]]' -R . | xargs -L1 awk '!/encoding/ && NR < 2 { print FILENAME }'
```
### Fix SELinux problem with Postfix on Centos
```sh
grep postfix /var/log/messages | audit2allow -M mypolicy
```
### Find text in all files, except in files matching a pattern
```sh
grep -lir 'aMethodName' * | grep -v 'target'
```
### Get HTTP Codes for All Websites in Apache Configuration files.
```sh
grep -h  'Server\(Name\|Alias\)' /etc/httpd/conf.d/*.conf | sed 's#\s*Server\(Name\|Alias\)\s*##g' | tr ' ' "\n" | xargs -I{} sh -c 'echo {},`curl -s -o /dev/null -w "%{http_code}" {}`'
```
### grep certain file types recursively
```sh
grep -r include="*.[ch]" pattern .
```
### Finds javascript lodash/underscore methods in source code
```sh
grep -roh '_\.[^(]*' *.js
```
### recursive grep of text files
```sh
grep -Ir foo *
```
### Get the first non-empty line in a text file
```sh
grep . "$f" | head -n1
```
### checklist for 64-bit java on Linux
```sh
grep -l 'flags.*\<lm\>' /proc/cpuinfo && (getconf LONG_BIT | grep '64') && java -version
```
### Match non-empty lines
```sh
grep -v "^\W$" <filename>
```
### Check if *hardware* is 32bit or 64bit
```sh
grep " lm " /proc/cpuinfo > /dev/null && echo "64-bit" || echo "32-bit"
```
### extract email adresses from some file (or any other pattern)
```sh
grep -Eio '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### list all available disks and disk partitions
```sh
grep -e "[sh]d[a-l][0-9]\?" /proc/partitions | awk '{print $4}'
```
### grep all class definitions from all files in current directory
```sh
grep -RE 'class\s+(\w+)' color *
```
### Count empty lines using grep
```sh
grep -c "^$" filename
```
### Grep ip addresses from access attempts to a page and add them to an ipset referenced by an iptables rule
```sh
grep page.php /var/log/httpd/access_log|awk '{print $1}'|sort|uniq|perl -e 'while (<STDIN>){chomp; $cmd=`ipset add banned -! -q $_`; }'
```
### Display how much memory installed on system
```sh
grep MemTotal: /proc/meminfo    # display how much memory installed
```
### grep for ip4 addresses
```sh
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
```
### to remove blank line
```sh
grep . filename >filename1
```
### grep tab chars
```sh
grep "^V<TAB>" your_file
```
### grep multiple value matches that matches all togetger  one the same value(concurrency) also
```sh
grep '^\(default\|smtp\|relay\)[^ ]*concurrency[^ ]*'
```
### Export usernames and passwords from sslstrip log
```sh
grep -i -f password_tokens sslstrip.log | awk ' BEGIN { RS="&" } { print $1 }' | grep -i -f tokens_file
```
### grep for text in a specific file type
```sh
grep -rnw <directory to search for> -e include \*.x "your_text"
```
### look some php code by some keywords
```sh
grep -r include=*.php "something" /foo/bar
```
### grep for text in a specific file type
```sh
grep -rnw include \*.x -e "text" <dir>
```
### count match string lines from file(s)
```sh
grep -c "search_string" /path/to/file
```
### Reads a list of urls, fetches each one and logs the url and http status code
```sh
grep "$1" urls.txt | awk '{print "curl write-out "$0"=http-%{http_code}\"\n\" silent output /dev/null "$0'} | sh >> responses.txt
```
### Get all domains from html
```sh
grep -oP '(?<=www\.)\s?[^\/]*' file | uniq
```
### GREP a PDF file.
```sh
grep -i '[^script$]' 1.txt
```
### Recursive grep of all c++ source under the current directory
```sh
grep -R include=*.cpp include=*.h exclude=*.inl.h "string" .
```
### Remove superfluous from conf file
```sh
grep -Ev '^( *$|#)' < conf.file
```
### extract only the subroutine names from a perl script
```sh
grep -Po '^sub (\w+)' file.pm | cut -d' ' -f2
```
### Extract all urls from the last firefox sessionstore.js file used.
```sh
grep -oP '"url":"\K[^"]+' $(ls -t ~/.mozilla/firefox/*/sessionstore.js | sed q)
```
### find files ending in *.log that contain both 'foo' and 'error'
```sh
grep -l foo $(grep -l error *.log)
```
### Btrfs: Find file names with checksum errors
```sh
grep "btrfs: checksum error at logical" /var/log/messages |  egrep -o "[^ ]+$" | tr -d ')' | sort | uniq
```
### find files that contain foo, but not bar
```sh
grep -l foo *cl*.log | xargs grep -lL bar
```
### Get the date field from syslog for a certain set of events
```sh
grep xxxx messages | cut -d ' ' -f 1,2,3
```
### kworker issue. Phase one: find the culprit.
```sh
grep enabled /sys/firmware/acpi/interrupts/*
```
### tail from the last occurrence of a pattern to the end of the (log) file
```sh
grep -n PATTERN /logs/somelog.log | cut -f1 -d: | tail -1 | xargs -I num tail -n +num /logs/somelog.log
```
### Find highest context switches
```sh
grep -H voluntary_ctxt /proc/*/status |gawk '{ split($1,proc,"/"); if ( $2 > 10000000 ) { printf $2 " - Process : "; system("ps h -o cmd -p "proc[3]) } }' | sort -nk1,1 | sed 's/^/Context Switches: /g'
```
### Grep recursively your Python project with color highlighting the result and line numbers
```sh
grep color=always -nr 'setLevel' include=*py | less -SRqg
```
### grep tab (\t)
```sh
grep $'\t' sample.txt
```
### Recursively grep thorugh directory for string in file.
```sh
grep -r -i "phrase" directory/
```
### Exclude svn directories with grep
```sh
grep -r exclude-dir=.svn PATTERN PATH
```
### Grep Recursively Through Single File Extension
```sh
grep include=*.py -lir "delete" .
```
### Remove today's Debian installed packages
```sh
grep -e `date +%Y-%m-%d` /var/log/dpkg.log | awk '/install / {print $4}' | uniq | xargs apt-get -y remove
```
### List your installed Firefox extensions
```sh
grep -hIr :name ~/.mozilla/firefox/*.default/extensions | tr '<>=' '"""' | cut -f3 -d'"' | sort -u
```
### Find out how much data is waiting to be written to disk
```sh
grep ^Dirty /proc/meminfo
```
### grep binary (hexadecimal) patterns
```sh
grep -P "\x05\x00\xc0" mybinaryfile
```
### Remove newlines from output
```sh
grep . filename
```
### Grep syslog today last hour
```sh
grep -i "$(date +%b\ %d\ %H)" syslog
```
### Grep log between range of minutes
```sh
grep -i "$(date +%b" "%d )13:4[0-5]" syslog
```
### Colorized grep in less
```sh
grep color=always | less -R
```
### Remove blank lines from a file using grep and save output to new file
```sh
grep . filename > newfilename
```
### Get all possible problems from any log files
```sh
grep -2 -iIr "err\|warn\|fail\|crit" /var/log/*
```
### intersection between two files
```sh
grep -Fx -f file1 file2
```
### Count occurrences per minute in a log file
```sh
grep <something> logfile | cut -c2-18 | uniq -c
```
### Search and Replace across multiple files
```sh
grep -lr -e '<oldword>' * | xargs sed -i 's/<oldword>/<newword>/g'
```
### Quick key/value display within /proc or /sys
```sh
grep -r . /sys/class/net/eth0/statistics
```
### Remove today's installed packages
```sh
grep "install " /var/log/dpkg.log | awk '{print $4}' | xargs apt-get -y remove purge
```
### Print number of mb of free ram
```sh
grep '^MemFree:' /proc/meminfo | awk '{ mem=($2)/(1024) ; printf "%0.0f MB\n", mem }'
```
### Number of CPU's in a system
```sh
grep "processor" /proc/cpuinfo | wc -l
```
### recursive search and replace old with new string, inside files
```sh
grep -rl oldstring . | parallel sed -i -e 's/oldstring/newstring/'
```
### delete files containing matching text
```sh
grep -r -Z -l "<text>" . | xargs -0 echo rm
```
### grep apache access.log and list IP's by hits and date - sorted
```sh
grep Mar/2009 /var/log/apache2/access.log |  awk '{ print $1 }' | sort -n | uniq -c | sort -rn | head
```
### find files containing text
```sh
grep -lir "some text" *
```
### Recover a deleted file
```sh
grep -a -B 25 -A 100 'some string in the file' /dev/sda1 > results.txt
```
### embed referred images in HTML files
```sh
grep -ioE "(url\(|src=)['\"]?[^)'\"]*" a.html | grep -ioE "[^\"'(]*.(jpg|png|gif)" | while read l ; do sed -i "s>$l>data:image/${l/[^.]*./};base64,`openssl enc -base64 -in $l| tr -d '\n'`>" a.html ; done;
```
### Remove comments and empty lines from a conf file
```sh
grep ^[^#] /etc/file.conf
```
### Replace all tabs with spaces in an application
```sh
grep -PL "\t" -r . |  grep -v ".svn" | xargs sed -i 's/\t/    /g'
```
### Finding the number of cpu's
```sh
grep -c -e '^cpu[0-9]\+' /proc/stat
```
### extract email adresses from some file (or any other pattern)
```sh
grep -Eio '([[:alnum:]_.]+@[[:alnum:]_]+?\.[[:alpha:].]{2,6})' file.html
```
### grep for tabs without using Ctrl-V trick
```sh
grep -P '\t' filename
```
### List the CPU model name
```sh
grep "model name" /proc/cpuinfo
```
### cat a bunch of small files with file indication
```sh
grep . *
```
### Edit all files found having a specific string found by grep
```sh
grep -Hrli 'foo' * | xargs vim
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -r <pattern> * .[!.]*
```
### Search for a string in all files recursively
```sh
grep -ir string *
```
### Find common groups between two users
```sh
grep -xFf <(groups user1|cut -f3- -d\ |sed 's/ /\n/g') <(groups user2|cut -f3- -d\ |sed 's/ /\n/g')
```
### Regenerate the /etc/mtab file
```sh
grep -v rootfs /proc/mounts > /etc/mtab
```
### Search files with js declarations inside
```sh
grep -r "<script" | grep -v src | awk -F: '{print $1}' | uniq
```
### Extract IPv4 addressess from file
```sh
grep  -Eo  \([0-9]\{1,3\}[\.]\)\{3\}[0-9] file | sort | uniq
```
### grep -v with multiple patterns.
```sh
grep test somefile | grep -v -e error -e critical -e warning
```
### Search some text from all files inside a directory
```sh
grep -Hrn "text" .
```
### Recursively grep thorugh directory for string in file.
```sh
grep -rni string dir
```
### Output files without comments or empty lines
```sh
grep -v "^\($\|#\)" <filenames>
```
### Search through files, ignoring .svn
```sh
grep <pattern> -R . exclude-dir='.svn'
```
### grep lines containing two consecutive hyphens
```sh
grep   file
```
### Check if *hardware* is 32bit or 64bit
```sh
grep -q '\<lm\>' /proc/cpuinfo && echo 64 bits || echo 32 bits
```
### Lists unambigously names of all xml elements used in files in current directory
```sh
grep -h -o '<[^/!?][^ >]*' * | sort -u | cut -c2-
```
### Remove text from file1 which is in file2 and stores it in an other file
```sh
grep -Fvf file1 file2 > file-new
```
### Extract all 404 errors from your apache accesslog (prefix lines by occurrences number)
```sh
grep "HTTP/1.1\" 404" access_log | awk '{print $7 } ' | sort | uniq -c | sort -n
```
### Search trought pidgin's conversation logs for "searchterm", and output the result.
```sh
grep -Ri searchterm  ~/.purple/logs/*  | sed -e 's/<.*?>//g'
```
### Prints line numbers
```sh
grep -n "^" <filename>
```
### display a one-liner of current nagios exit statuses. great with netcat/irccat
```sh
grep current_state= /var/log/nagios/status.dat|sort|uniq -c|sed -e "s/[\t ]*\([0-9]*\).*current_state=\([0-9]*\)/\2:\1/"|tr "\n" " "
```
### Shows the torrent file name along with the trackers url
```sh
grep -ao -HP "http://[^/]*/" *
```
### grep -v with multiple patterns.
```sh
grep 'test' somefile | grep -vE '(error|critical|warning)'
```
### Read funny developer comments in the Linux source tree
```sh
grep -2riP '\b(fuck|shit|bitch|tits|ass\b)' /usr/src/linux/
```
### Dump a configuration file without comments or whitespace...
```sh
grep -v "\ *#\|^$" /etc/path/to.config
```
### Find all files containing a word
```sh
grep -rHi searchphrase *.php
```
### Returns the number of cores in a linux machine.
```sh
grep -c ^processor /proc/cpuinfo
```
### peak amount of memory occupied by any process with "FOO" in its name
```sh
grep VmHWM /proc/$(pgrep -d '/status /proc/' FOO)/status
```
### Determine configure options used for MySQL binary builds
```sh
grep CONFIG $(which mysqlbug)
```
### Remove blank lines from a file using grep and save output to new file
```sh
grep -v "^$" filename > newfilename
```
### Makes a Zenity select list based on entries in your wpa_supplicant.conf
```sh
grep -oE "ssid=\".*\"" /etc/wpa_supplicant.conf | cut -c6- | sed s/\"//g | zenity list title="Choose Access Point" column="SSID"
```
### strip config files of comments
```sh
grep -vE '^$|^[\s]*[;#]'
```
### Creates PodFeeds.txt, a file that lists the URLs of rhythmbox podcasts from the rhythmdb.xml file.
```sh
grep -A 5 -e podcast-feed rhythmdb.xml | grep -e "<location>" | sed 's: *</*[a-t]*>::g' > PodFeeds.txt
```
### Sort and count subjects of emails stuck in Exim queue
```sh
grep -R Subject /var/spool/exim/input/ | sed s/^.*Subject:\ // | sort | uniq -c | sort -n > ~/email_sort.$(date +%m.%d.%y).txt
```
### Get debian package names corresponding to latex packages used in a document
```sh
grep -R usepackage * | cut -d']' -f2 | cut -s -d'{' -f 2 | sed s/"}"/.sty"}"/g | cut -d'}' -f1 | sort | uniq | xargs dpkg -S | cut -d':' -f1 | sort | uniq
```
### recursive search and replace old with new string, inside files
```sh
grep -rlZ oldstring . | xargs -0 sed -i -e 's/oldstring/newstring/'
```
### Count lines in a file with grep
```sh
grep -c ".*" filename
```
### Search and replace in multiple files recursively
```sh
grep -lr "foo" . | xargs sed -i "s/foo/bar/g"
```
### List last opened tabs in firefox browser
```sh
grep -Eo '"entries":\[{"url":"[^"]*"' "$HOME/.mozilla/firefox/*.default/sessionstore.js" | sed 's/^.*:"//; s/"$//'
```
### view all lines without comments.
```sh
grep -v "^#" file.txt | more
```
### List the CPU model name
```sh
grep 'model\|MHz' /proc/cpuinfo  |tail -n 2
```
### Look up a unicode character by name
```sh
grep -i "$*" /usr/lib/perl5/Unicode/CharName.pm | while read a b; do /usr/bin/printf "\u$a\tU+%s\t%s\n"  "$b"; done
```
### count match string lines from file(s)
```sh
grep -in "search_string" /to/your/path
```
### extract email adresses from some file (or any other pattern)
```sh
grep -aEio '([[:alnum:]_.-\+\-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -nisI <pattern> * .[!.]*
```
### apache statistics
```sh
grep "10/Sep/2013" access.log| cut -d[ -f2 | cut -d] -f1 | awk -F: '{print $2":"$3}' | sort -nk1 -nk2 | uniq -c | awk '{ if ($1 > 10) print $0}'
```
### Grep by paragraph instead of by line.
```sh
grepp() { [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";}
```
### Sort netflow packet capture
```sh
grep -o -P '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}\s->\s{5}[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\:[0-9]{1,5}' <capture file> | tr -d ' ' | sed  's/:.....//g' | sort -n | uniq -c | sort -nr
```
### check spell in c source code
```sh
grep -o -h -rE '".*"' * | ispell -l -p ~/mydict | sort -u
```
### find files containing text
```sh
grep -lir "sometext" * > sometext_found_in.log
```
### find files beginning with filename* that do not include "string"
```sh
grep -L "string" filename*
```
### Number of CPU's in a system
```sh
grep -c ^processor /proc/cpuinfo
```
### This allows you to find a string on a set of files recursivly
```sh
grep -rF include='*.txt' stringYouLookFor *
```
### sorted list of dhcp allocations
```sh
grep ^lease /var/lib/dhcp/dhcpd.leases | cut -d ' ' -f 2 | sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n | uniq
```
### Extract all IPs from a file
```sh
grep -E '([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})' -o tmp
```
### Search for string through files
```sh
grep -Rl "pattern" files_or_dir
```
### Number of CPU's in a system
```sh
grep -cE "^processor" /proc/cpuinfo
```
### Grep colorized
```sh
grep -i color=auto
```
### Show lines that are not commented out
```sh
grep "^[^#;]" /etc/php.ini
```
### get with grep exact x strings matches from output
```sh
grep "^[A-Za-z0-9]\{6\}$" myfile.txt
```
### Check where mail was sent from
```sh
grep cwd /var/log/exim_mainlog | grep -v /var/spool | awk -F"cwd=" '{print $2}' | awk '{print $1}' | sort | uniq -c | sort -n
```
### Show a config file without comments
```sh
grep -v ^# /etc/somefile.conf | grep .
```
### Search in files
```sh
grep -i -h 'account.journal.cashbox.line' *.py
```
### cat a config file removing all comments and blank lines
```sh
grep -vh '^[[:space:]]*\(#\|$\)' <file>
```
### Remove comments and empty lines from a file
```sh
grep -v '^#\|^$' /etc/hdparm.conf
```
### Grep for word in directory (recursive)
```sh
grep color=auto -iRnH "$search_word" $directory
```
### Find all files matching 'name.xml' and search for 'text' within them
```sh
grep -nH "text" -r . include *name.xml
```
### shows whether your CPU supports 64bit mode
```sh
grep -q ' lm ' /proc/cpuinfo; [ $? -eq 0 ] && echo '64bit supported'
```
### Get the URL for the git-annex webapp
```sh
grep URL ~/annex/.git/annex/webapp.html | tr -d '">' | awk -F= '{print $4 "=" $5}'
```
### IP list of aborted mail logins
```sh
grep -i "aborted login" /var/log/maillog | awk 'BEGIN{FS="="}{print substr($4,8)}' | cut -d"," -f1
```
### Btrfs: Find file names with checksum errors
```sh
grep "checksum error at logical" /var/log/messages |  egrep -o "[^ ]+$" | tr -d ')' | sort | uniq
```
### Grep for non-empty lines that do not start with # (comments) or <some-char> and does not include <some-char>
```sh
grep -v -e '^$' -e '^[#\[]' -e '\/' some_file
```
### Find in all files in the current directory, just a find shorthand
```sh
grep -H -n "pattern" *
```
### grep lines containing two consecutive hyphens
```sh
grep "\-\-" file
```
### Get a quote from Pooh
```sh
grep -Pooh .*t..r,.* /etc/init.d/*
```
### Grep auth log and print ip of attackers
```sh
grep Failed auth.log | rev | cut -d\  -f4 | rev | sort -u
```
### calculate how many different lines between two files
```sh
grep -Fvxf $(file1) $(file2) | wc -l
```
### Lists unambigously names of all xml elements used in files in current directory
```sh
grep -Eho '<[a-ZA-Z_][a-zA-Z0-9_-:]*' * | sort -u | cut -c2-
```
### move linenumbers of grep output to end of line
```sh
grep -n log4j MainPm.java  | sed -e 's/^\([^:]*\):\(.*\)/\2 \1/'
```
### Search Objective-C source file for tag listing and sort
```sh
grep '.tag =' <file> | awk '{print $3}' | awk 'sub(/[;]/, x)' | sort -n
```
### Search for a <pattern> string inside all files in the current directory
```sh
grep -RnisI <pattern> *
```
### Check if a file is text
```sh
grep -qIm1 . $file
```
### See how many times you've typed 'ls' by itself
```sh
grep -c ^ls$ ~/.bash_history
```
### Matching Strings
```sh
grep -l <string-to-match> * | xargs grep -c <string-not-to-match> | grep '\:0'
```
### remove script from infected html files
```sh
grep -ZlRr -e BAD_SCRIPT_LINE * |xargs -0 sed -i 's/BAD_SCRIPT_LINE//g'
```
### Extract names and email addresses from LDIF files
```sh
grep -E '^(cn|mail):' file.ldif | sed -e 's/^[a-z]*: //'
```
### Display playing parameters of soundcards
```sh
grep -r "" /proc/asound/card*/pcm*/sub*/hw_params
```
### extract email adresses from some file (or any other pattern)
```sh
grep -aEio '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### find php command backdoor
```sh
grep -RPl include=*.{php,txt,asp} "(passthru|shell_exec|system|phpinfo|base64_decode|chmod|mkdir|fopen|fclose|readf?ile) *\(" /var/www/
```
### Show CPU idle and used time
```sh
grep "cpu " /proc/stat | awk -F ' ' '{total = $2 + $3 + $4 + $5} END {print "idle \t used\n" $5*100/total "% " $2*100/total "%"}'
```
### lines in file2 that are not in file1
```sh
grep -Fxv -f file1 file2
```
### Shows the line of the string you want to search for (like in normal grep) plus 'n' number of lines above and below it.
```sh
grep -C <no_of_lines> <string>
```
### grep for specific function invocations
```sh
grep -E -rn color=always exclude-dir=".svn" exclude-dir="packages" exclude="*.swp" "(emit|on)\([\'\"]leader" ~/project/ | less -R
```
### grep 2 words existing on the same line
```sh
grep -E/egrep 'word1.*word2|word2.*word1' "$@"
```
### Search ruby-files with non-ascii character, but without encoding directive
```sh
grep -l include '*.rb' include '*.rake' '^[^#]*[^a-zA-Z0-9[:punct:][:space:]]' -R . | xargs -L1 awk '!/encoding/ && NR < 2 { print FILENAME }'
```
### Fix SELinux problem with Postfix on Centos
```sh
grep postfix /var/log/messages | audit2allow -M mypolicy
```
### Find text in all files, except in files matching a pattern
```sh
grep -lir 'aMethodName' * | grep -v 'target'
```
### Get HTTP Codes for All Websites in Apache Configuration files.
```sh
grep -h  'Server\(Name\|Alias\)' /etc/httpd/conf.d/*.conf | sed 's#\s*Server\(Name\|Alias\)\s*##g' | tr ' ' "\n" | xargs -I{} sh -c 'echo {},`curl -s -o /dev/null -w "%{http_code}" {}`'
```
### grep certain file types recursively
```sh
grep -r include="*.[ch]" pattern .
```
### Finds javascript lodash/underscore methods in source code
```sh
grep -roh '_\.[^(]*' *.js
```
### recursive grep of text files
```sh
grep -Ir foo *
```
### Get the first non-empty line in a text file
```sh
grep . "$f" | head -n1
```
### checklist for 64-bit java on Linux
```sh
grep -l 'flags.*\<lm\>' /proc/cpuinfo && (getconf LONG_BIT | grep '64') && java -version
```
### Match non-empty lines
```sh
grep -v "^\W$" <filename>
```
### Check if *hardware* is 32bit or 64bit
```sh
grep " lm " /proc/cpuinfo > /dev/null && echo "64-bit" || echo "32-bit"
```
### extract email adresses from some file (or any other pattern)
```sh
grep -Eio '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
```
### list all available disks and disk partitions
```sh
grep -e "[sh]d[a-l][0-9]\?" /proc/partitions | awk '{print $4}'
```
### grep all class definitions from all files in current directory
```sh
grep -RE 'class\s+(\w+)' color *
```
### Count empty lines using grep
```sh
grep -c "^$" filename
```
### grep tab chars
```sh
grep "^V<TAB>" your_file
