# find

### Recursively remove all empty directories
```sh
find . -type d -empty -delete
```

### Copy all documents PDF in disk for your home directory
```sh
find / -name "*.pdf" -exec cp -t ~/Documents/PDF {} +
```

### find broken symbolic links
```sh
find -L . -type l
```

### md5sum for files with bad characters
```sh
find ./ -type f | sed "s:[\ \',\"]:\\\&:g" | xargs md5sum
```

### Convert all files media to mp3
```sh
find -type f -exec ffmpeg -i "{}" "{}".mp3 \;
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc -delete
```

### chmod only files
```sh
find . -type f -print0 | xargs -0 chmod -v gu=rw
```

### md5sum for files with bad characters
```sh
find ./ -type f -print0 | xargs -0 md5sum
```

### Show me all of my Mac App Store apps
```sh
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
```

### Get Total Line Count Of All Files In Subdirectory (Recursive)
```sh
find . -type f -name "*.*" -exec cat {} > totalLines 2> /dev/null \; && wc -l totalLines && rm totalLines
```

### Show all symlinks
```sh
find ./ -type l -print0 | xargs -0 ls -plah
```

### Delete huge numbers of files without intensive cpu load
```sh
find <path> -type f -exec ionice -c3 rm {} +
```

### print your iTunes App for iPhone/iTouch/iPad to show your friends which ones you have
```sh
find ~/Music/iTunes/iTunes\ Media/. -name \*.ipa -exec basename {} \; | cut -d \. -f 1 > ~/Desktop/MyAppList`date +%s.txt`
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc -type f -delete
```

### find rcs locked file in a given folder
```sh
find /path/to/folder/ -mindepth 1 -maxdepth 2 -name "*,v" -exec sudo rlog -L -R {} \;
```

### Find files and play them as a playing list in mpv
```sh
find . -type f \( -name "*.mp3" -o -name "*.ogg" \) | mpv shuffle audio-display=no playlist -
```

### Grep all your PDFs in a row
```sh
find -iname \*.pdf -print0 | xargs -0 pdfgrep -i "my search text"
```

### Recursively remove .svn directories
```sh
find . -iname ".svn" | xargs rm -r $1
```

### Find Largest files of mount point
```sh
find /logs -ls -xdev | sort -nrk 7 | head -10
```

### Display a numbered list of files bigger than 500K, sorted by size (human readable)
```sh
find ./ -type f -size +500k -exec ls -1Ash {} \; | sort -hr | cat -n
```

### Find Largest files of mount point
```sh
find /logs -ls -xdev | sort -nrk 7 | head -10
```

### Append html-extension to all files in a directory structure that contains html-code.
```sh
find . |xargs grep '<html\|<body\|<table' |sed '/~/d;s/:.*//' |sed 's/.*/mv & &.html/' |uniq >run.sh; sh run.sh
```

### search and replace in multiple files
```sh
find . -name "*.php" -print | xargs sed -i 's/foo/bar/g'
```

### Show all occurences of STRING with filename and line number for given FILE pattern under the DIR.
```sh
find DIR -name "FILE" -exec grep -IHn STRING {} \;
```

### File count into directories
```sh
find . -type f | xargs wc -l
```

### Find all files over a set size and displays accordingly
```sh
find / -type f -size +512000 | xargs ls -lh | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Change owner ship of files from 1003 to android under current directory recursively. 1003/android could be customized.
```sh
find . | while read line; do test `stat -c %u $line` -eq 1003 && chown android:android $line && echo $line; done
```

### Re-encode all flac files below
```sh
find . -type f -iname '*.flac' | while read i; do mv  "$i" "$i.tmp"; gst-launch filesrc location="$i.tmp" ! flacdec ! flacenc quality=8 ! filesink location="${i%.tmp}"; rm  "$i.tmp"; done
```

### List all text files (exclude binary files)
```sh
find . | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Check all bash scripts in current dir for syntax errors
```sh
find . -name '*.sh' -exec bash -n {} \;
```

### List only the directories
```sh
find . -maxdepth 1 -type d | sort
```

### Search through files, ignoring .svn
```sh
find . -not \( -name .svn -prune \) -type f -print0 | xargs null grep <searchTerm>
```

### Archive tar.gz archives all files (with extension filter) individually from an location
```sh
find ./ -iname "*.dmp" -maxdepth 0 -type f -exec tar czvf {}.tar.gz  remove-files {} \; \;
```

### Search for a string inside all files below current directory
```sh
find . -type f -exec grep -Hn <pattern> {} \;
```

### Print out the contents of a Git repository (useful for broken repositories)
```sh
find .git/objects -type f -printf "%P\n" | sed s,/,, | while read object; do echo "=== $obj $(git cat-file -t $object) ==="; git cat-file -p $object; done
```

### Update obsolete CVS Root files
```sh
find cvsdir -name Root -exec sed -i 's/oldserver/newserver/' {} \;
```

### Create a symbolic link tree that shadows a directory structure
```sh
find /home/user/doc/ -type d -printf "mkdir -vp '/home/user/Dropbox%p'\n" -o -type f -printf "ln -vs '%p' '/home/user/Dropbox%p'\n" | sh
```

### recursive command to find out all directories
```sh
find $DIR -exec bash method {} ";"
```

### run all
```sh
find /var/scripts -name 'backup*' -exec {} ';'
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \; | grep found
```

### find all files containing a pattern, open them using vi and place cursor to the first match, use 'n' and ':n' to navigate
```sh
find . -type f -exec grep -l pattern {} \; | xargs vi +/pattern
```

### find and reduce 8x parallel the size of PNG images without loosing quality via optipng
```sh
find  /var/www/ -type f -name '*.[pP][nN][gG]' -print0 | xargs -L 1 -n 1 -P 8 -0 optipng -preserve -quiet -o7 -f4 -strip all
```

### remove OSX resource forks ._ files
```sh
find . -name ._\* -exec rm -f {} \;
```

### List down source files which include another source file
```sh
find . -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.cxx' \) | xargs grep "#include.*\.c.*" 2>&1 | tee source_inside_source_list.txt
```

### List all files in current dir and subdirs sorted by size
```sh
find . -ls | sort -k 7 -n
```

### add POD stubs recursively to all Perl modules
```sh
find . -type file -name '*.pm' | xargs perl -p -i -e 'BEGIN{undef $/;} s/([;}])\s*\nsub (\w+)/$1\n\n=head2 $2\n\n=cut\n\nsub $2/g'
```

### list uniq extensions of files from the current directory
```sh
find . -type f |egrep '^./.*\.' |sed -e "s/\(^.*\.\)\(.*$\)/\2/" |sort |uniq
```

### Locate Hacked Files and Dump.
```sh
find . -type f -name '*.html' -exec grep -H HACKED {} \; > hacklog.txt
```

### Find all videos under current directory
```sh
find ./ -type f -print0 | xargs -0 file -iNf - | grep video | cut -d: -f1
```

### concatenate compressed and uncompressed logs
```sh
find /var/log/apache2 -name 'access.log*gz' -exec zcat {} \; -or -name 'access.log*' -exec cat {} \;
```

### change file format at one time
```sh
find $(YourPATH) -type f -exec dos2unix '{}' \;
```

### Find and replace recursivly a ignoring .svn
```sh
find . -type f -not -regex ".*\/.svn\/.*" -exec sed -i 's/oldstring/newstring/g' {} +
```

### find broken symbolic links
```sh
find . -type l | (while read FN ; do test -e "$FN" || ls -ld "$FN"; done)
```

### List all symlinks and see where they link to
```sh
find -type l | xargs ls -l
```

### Remove all .DS_Store files from the current directory (recursive)
```sh
find . -name "*.DS_Store" -type f -delete
```

### Find PHP files
```sh
find . -name "*.php" -exec grep -i -H "search pharse" {} \;
```

### Make a statistic about the lines of code
```sh
find . -type f -name '*.c' -exec wc -l {} \; | awk '{sum+=$1} END {print sum}'
```

### Find all python modules that use the math module
```sh
find . -name "*.py" -exec grep -n -H -E "^(import|from) math" {} \;
```

### Find files and list them sorted by modification time
```sh
find -type f | xargs ls -1tr
```

### Recursively remove all '.java.orig' files (scalable)
```sh
find . -type f -iname '*.java.orig' -delete
```

### Hunt for the newest file.
```sh
find . -printf "%T@ %p\n" | sed -e 1d | while read ts fn; do ts=${ts%.*}; if [ $ts -ge ${gts:-0} ]; then gts=$ts; echo `date -d @$gts` $fn; fi; done
```

### To compact all SQLite databases in your home directory
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### rm filenames with spaces
```sh
find garbage/ -type f -delete
```

### Extract all 7zip files in current directory taking filename spaces into account
```sh
find -maxdepth 1 -type f -name "*.7z" -exec 7zr e '{}' ';'
```

### Count the lines of source code in directory, ignoring files in generated by svn
```sh
find . -name '*.java' -o -name '*.xml' | grep -v '\.svn' | xargs wc -l
```

### recursively detecting files with a BOM
```sh
find . -type f -print0 | xargs -0r awk '/^\xEF\xBB\xBF/ {print FILENAME} {nextfile}'
```

### Rename all the files in the current directory into their sha1sum
```sh
find . -maxdepth 1 -type f| xargs sha1sum | sed 's/^\(\w*\)\s*\(.*\)/\2 \1/' | while read LINE; do mv $LINE; done
```

### strip id3 v1 and v2 tags from all mp3s in current dir and below
```sh
find . -type f -iname "*.mp3" -exec id3v2 delete-all {} \;
```

### Renaming jpg extension files at bunch
```sh
find . -name "*.jpg" | perl -ne'chomp; $name = $_; $quote = chr(39); s/[$quote\\!]/_/ ; print "mv \"$name\" \"$_\"\n"'
```

### Find the files that include a TODO statement within a project
```sh
find . -iname '*TODO*'
```

### Renames all files in the current directory such that the new file contains no space characters.
```sh
find ./ $1 -name "* *" | while read a ; do mv "${a}" "${a//\ /_}" ; done
```

### Move all files in subdirectories to current dir
```sh
find ./ -type f -exec mv {} . \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b -exec lvextend -m 1 {} /dev/disk/<disk> \;
```

### Find files and list them sorted by modification time
```sh
find . -type f | xargs ls -ltrhg
```

### List OSX applications and versions.
```sh
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;
```

### Recursively remove .svn directories
```sh
find -type d -name ".svn" -print0 | xargs -0 rm -rf
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\///'|grep -o '\.[^.]*$'|sort -f|uniq -i
```

### Erase empty files
```sh
find . -size 0 -print0 | xargs -0 rm
```

### Remove VIM temp files
```sh
find ./ -name '*.sw[op]' -delete
```

### search for a pattern (regex) in all text files (ignoring binary files) in a directory tree
```sh
find . -type f | perl -lne 'print if -T;' | xargs egrep "somepattern"
```

### Find and print pattern location from all files on command line from directory and its sub directories.
```sh
find . -exec grep $foo {} \; -print
```

### Delete empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -delete
```

### Convert one's Java source file encoding
```sh
find . -name "*.java" -type f -perm +600 -print | xargs -I _ sh -c 'grep -q hexianmao _ && iconv -f gb2312 -t utf8 -o _ -c _ '
```

### find forms in a symfony 1.2 project
```sh
find apps/ -name "*.svn-base" -prune -o -print -name "*.php" | xargs grep -E 'new .+Form\('
```

### Clean-up release directories keeping the only the latest two
```sh
find . -maxdepth 1 -type d | grep -Pv "^.$" | sort -rn field-separator="-" | sed -n '3,$p' | xargs rm -rf
```

### find all file larger than 500M in home dir
```sh
find ~ -type f -size +500M -exec ls -ls {} \; | sort -n
```

### bkup the old files
```sh
find <dir> -type f -mtime +<days> -exec scp -r {} user@backuphost:/data/bkup \;
```

### search for a file (with regex), choose one then open it
```sh
findopen() { local PS3="select file: "; select file in $(find "$1" -iname "$2"); do ${3:-xdg-open} $file; break; done }
```

### find and output files content with filtering by filename and specific string
```sh
find . -name *.properties -exec /bin/echo {} \; -exec cat {} \; | grep -E 'listen|properties'
```

### Remove all .svn folders inside a folder
```sh
find . -name "\.svn" -exec rm -rf {} ";"
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -s "{}" | sort -rn | head | cut -f2 | xargs -I{} du -sh "{}"
```

### Find the biggest files
```sh
find -type f -exec du -sh {} +  | sort -rh | head
```

### Find and replace
```sh
find . -name '*.txt' -exec mv {} {}.sh \ ;
```

### Find redirection and grep
```sh
find . -name "*.png" | tee images.txt | grep book
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec rename "s/.JPG/.jpg/g" \{\} \;
```

### recurisvely md5 all files in a tree
```sh
find ./backup -type f -print0 | xargs -0 md5sum > /checksums_backup.md5
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf | sed 's/ /\\ /g' | xargs rm {} \;
```

### perl find and replace
```sh
find -name ".php" -exec perl -pi -e 's/search/replace/g/' {} \;
```

### copy selected folder found recursively under src retaining the structure
```sh
find . -type d -exec mkdir /new/path/{} \;
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -execdir rm -f {} +
```

### Find files older than 60 days
```sh
find . -maxdepth 1 -type f -mtime +60 -ls
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -print0 | xargs no-run-if-empty -0 rm;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf {} \;
```

### quick find executable from locate db
```sh
find $(locate hello) -type f -executable -print|grep -E "hello\$"
```

### Show all video files in the current directory (and sub-dirs)
```sh
find -type f -printf '%P\000' | egrep -iz '\.(avi|mpg|mov|flv|wmv|asf|mpeg|m4v|divx|mp4|mkv)$' | sort -z | xargs -0 ls -1
```

### Indent all the files in a project using indent
```sh
find . -iname \*.[ch] -exec indent "{}" \;
```

### find all c and cpp files except the ones in the unit-test and android subdirectories
```sh
find . -name unit-test -o -name '*.c'  -o -name '*.cpp' | egrep -v "unit-test|android"
```

### copy all Photos from Canon A520 to one place
```sh
find / -type f -name IMG_????.JPG -print0 |xargs -0 exiv2 -g Exif.Canon.ModelID '{}' |grep A520 |rev |cut complement -d " " -f1-40 |rev |xargs -I {} cp parents {} /where
```

### Pick the first program found from a list of alternatives
```sh
find_alternatives(){ for i;do which "$i" >/dev/null && { echo "$i"; return 0;};done;return 1;}
```

### simulates the DOS tree command that you might be missing on your Mac or Linux box
```sh
find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

### Find multiple filename expressions and sort by date
```sh
find . \( -iname "*.doc" -o -iname "*.docx" \) -type f -exec ls -l full-time {} +|sort -k 6,7
```

### clear not-used-again files from Linux page cache
```sh
find /path/to/dir -type f -exec cachedel '{}' \;
```

### Compress Images using convert (ImageMagick) in a bulk
```sh
find . -maxdepth 1 -iname '*jpg' -exec convert -quality 60 {} lowQ/{} \;
```

### Rename *.MP3 *.Mp3 *.mP3 etc.. to *.mp3.
```sh
find ./ -iname "*.mp3" -type f -printf "mv '%p' '%p'\n" | sed -e "s/mp3'$/mp3'/I" | sh
```

### Recursively search a directory tree for all .php .inc .html .htm .css .js files for a certain string
```sh
find . -type f \( -name "*.js" -o -name "*.php" -o -name "*.inc" -o -name "*.html" -o -name "*.htm" -o -name "*.css" \) -exec grep -il 'searchString' {} \;
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -empty -delete
```

### purge half of files in backup directory
```sh
find . | sort | awk 'NR%2==0' | xargs rm $1
```

### Shuffle mp3 files in current folder (and subfolders) and play them.
```sh
find . -iname "*.mp3" | mpg123 -Z list -
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -exec rm -rf '{}' +
```

### [Gentoo] Input modules, commented, in your module.autoload file
```sh
find /lib/modules/`uname -r`/ -type f -iname '*.o' -or -iname '*.ko' |grep -i -o '[a-z0-9]*[-|_]*[0-9a-z]*\.ko$' |xargs -I {} echo '# {}' >>/etc/modules.autoload.d/kernel-2.6
```

### Sum up total size and count of all certain filename pattern/regex
```sh
find -regextype posix-egrep -regex ".*/[A-Z]{3}_201009[0-9]{2}.*" -printf "%f %s\n" | awk '{ SUM += $2;COUNT++ } END { print SUM/1024 " kb in " COUNT " files" }'
```

### free some harddrive space by garbage collecting in all your git repos
```sh
find . -maxdepth 2 -type d -name '.git' -print0 | while read -d ''; do (cd "$REPLY"; git gc); done
```

### gmail safe folder
```sh
find | egrep "\.(ade|adp|bat|chm|cmd|com|cpl|dll|exe|hta|ins|isp|jse|lib|mde|msc|msp|mst|pif|scr|sct|shb|sys|vb|vbe|vbs|vxd|wsc|wsf|wsh)$"
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc | xargs rm
```

### recursivly open all recently crashed vim buffers in restore mode
```sh
find ./ -type f -mtime -1 -name .*.sw[po] -print | sed -r 's/^(.+)\/\.(\S+)\.sw[op]$/\1\/\2/' | xargs vim -r
```

### Edit all files found having a specific string found by grep
```sh
find . -exec grep foobar /dev/null {} \; | awk -F: '{print $1}' | xargs vi
```

### Find all files containing a word
```sh
find . -name "*.php" -exec grep -il searchphrase {} \;
```

### Edit all files found having a specific string found by grep
```sh
find . -type f -exec grep -qi 'foo' {} \; -print0 | xargs -0 vim
```

### Delete Text Editor's Backup
```sh
find . -name "*~" -exec rm {} \;
```

### Search through files, ignoring .svn
```sh
find . | grep -v svn
```

### make GNU find follow symbolic links
```sh
find -L /home/sonic/archive -name '*gz' -type f
```

### search for the content in a directory
```sh
find . -exec grep "test" '{}' /dev/null \; -print
```

### remove files and directories with acces time older than a given date
```sh
find <dir> -printf '%p : %A@\n' | awk '{FS=" : " ; if($2 < <time in epoc> ) print $1 ;}' | xargs rm verbose -fr ;
```

### Recursively remove all empty directories
```sh
find . -type d | tac | xargs rmdir 2> /dev/null
```

### finds all files that contain "some string"
```sh
find . -type f -exec grep -l "some string" {} \;
```

### remove files and directories with acces time older than a given time
```sh
find -amin +[n] -delete
```

### Find errors in your php website
```sh
find -name "*.php" -exec php -l {} \; | grep -v "No syntax errors"
```

### Find all files with setuid bit
```sh
find / -xdev \( -perm -4000 \) -type f -print0 | xargs -0 ls -l
```

### Find dead symbolic links
```sh
find -type l -xtype l
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | numsum
```

### Get a quick list of all user and group owners of files and dirs under the cwd.
```sh
find -printf '%u %g\n' | sort | uniq
```

### Find PHP files
```sh
find . -name "*.php" -print0 | xargs -0 grep -i "search phrase"
```

### Recursively remove all '.java.orig' directories (scalable)
```sh
find . -depth \( -path '*/*.java.orig' -o -path '*/*.java.orig/*' \) -delete
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -name "*.pyc" -exec rm {} \;
```

### Count total number of subdirectories in current directory starting with specific name.
```sh
find . -type d -name "*TestDir*" | wc -l
```

### find the biggest files recursively, no matter how many
```sh
find . -type f|perl -lne '@x=sort {$b->[0]<=>$a->[0]}[(stat($_))[7],$_],@x;splice(@x,11);print "@{$x[0]}";END{for(@x){print "@$_"}'
```

### Find in all files in the current directory, just a find shorthand
```sh
find ./ -name $1 -exec grep -H -n $2 '{}' ';'
```

### Find today created files
```sh
find -maxdepth 1 -type f -newermt "00:00" -printf "%f\n" | sort
```

### Calculates fake folder checksum based on folder's files' md5sums
```sh
find path/to/folder/ -type f -print0 | xargs -0 -n 1 md5sum | awk '{print $1}' | sort | md5sum | awk '{print $1}'
```

### Rezip a bunch of files
```sh
find . -name "*.gz" | xargs -n 1 -I {} bash -c "gunzip -c {} | sort | gzip -c best > {}.new ; rm {} ; mv {}.new {}"
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec ls -tr {} +
```

### Replace spaces with tabs & format file source recursuvely within a directory
```sh
find $DIR -name *.php -exec vim -u NONE -c 'set ft=php'	-c 'set shiftwidth=4' -c 'set tabstop=4' -c 'set noexpandtab!' -c 'set noet' -c 'retab!' -c 'bufdo! "execute normal gg=G"' -c wq {} \;
```

### Recursively deletes DIR directories
```sh
find . -type d -name DIR -print0 | xargs -r0 rm -r
```

### Buscar archivos con la extension mp3 y mostrar el conteo de resultados
```sh
find -D rates . -name "*.mp3" -type f
```

### List your FLAC albums
```sh
find -iname '*.flac' | sed 's:/[^/]*$::' | uniq
```

### a find and replace within text-based files
```sh
find /path/ -type f -exec grep -l '<string of text>' {} \; | xargs sed -i -e 's%<string of text>%<new text string>%g'
```

### Move files older than 30 days in current folder to
```sh
find . -mtime +30 -exec mv {} old/ \;
```

### do mvn clean in subdirs to free disk space
```sh
find -name pom.xml | while read f; do cd $(dirname "$f"); mvn clean; cd -; done;
```

### exec chmod to subfiles
```sh
find . -type f -print0 | xargs -0 chmod a-x
```

### Find size of the files in this directory tree. (sorted)
```sh
find . -type f -exec ls -s \{\} \; | sort -n
```

### Recursively calculate and dump md5 sums of all files within a directory
```sh
find . -type f -name '*' -exec md5sum '{}' + > hashes.txt
```

### finds all files in dir and replaces
```sh
find . -type f -exec sed -i 's/gw10./gw17./g' {} \;
```

### Look for jQuery version script include in files *asp*$, *htm*$ ie. not *.aspx.cs
```sh
find . \( -name "*.as[pc]x" -o -name "*.htm*" \) -exec grep -Hi "jquery-1" {} +
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name '*.gz'|awk '{print "zcat", $1, "| bzip2 -c >", $0.".tmp", "&& rename", "s/.gz.tmp/.bz2/", "*.gz.tmp", "&& rm", $0}'|bash
```

### Convert all .flac from a folder subtree in 192Kb mp3
```sh
find . -type f -iname '*.flac' | while read FILE; do FILENAME="${FILE%.*}"; flac -cd "$FILE" | lame -b 192 - "${FILENAME}.mp3"; done
```

### Recursively search for large files. Show size and location.
```sh
find . -size +100000k -exec du -h {} \;
```

### recursive reset file/dir perms
```sh
find public_html/stuff -type d -exec chmod 755 {} + -or -type f -exec chmod 644 {} +
```

### Remove everything except that file
```sh
find . ! -name <FILENAME> -delete
```

### Find all files and append to file
```sh
find . type f -exec echo http://exg.com/{} \; > file
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG'  | xargs -I{} mogrify -resize 1024">" -quality 40 {}
```

### Remove .svn dirs
```sh
find . -name ".svn" -type d -exec rm -rf {} \;
```

### Command for getting the list of files with perms, owners, groups info. Useful to find the checksum of 2 machines/images.
```sh
find / | xargs ls -l | tr -s ' ' | cut -d ' ' -f 1,3,4,9
```

### Find files modified in the last 5 days, no more than 2 levels deep in the current directory.
```sh
find . -type f -depth -3 -mtime -5
```

### Find Files over 20Meg
```sh
find / -type f -size +20000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### build cscope.out from all *.{h,cpp}, but ignore hidden files
```sh
find `pwd` -name '.*' -prune -o \( -name *.h -o -name *.cpp \) -print | cscope -bi-
```

### find files owned by root and make them your own again
```sh
find . -user root | xargs sudo chown me:me
```

### Normalize volume in your mp3 library
```sh
find . -type d -exec sh -c "normalize-audio -b \"{}\"/*.mp3" \;
```

### shrink firefox database
```sh
find ~/.mozilla -name '*.sqlite' -exec sqlite3 {} VACUUM \;
```

### Simple Find
```sh
find / -name FILENAME
```

### To reduce the size of saved webpages
```sh
find /path/to/webpages -type f -name '*.js' -exec 'rm' '{}' \;
```

### Chmod all files (excluding directories)
```sh
find public_html/ -type f -exec chmod 664 {} \;
```

### create backup for all files from current dir
```sh
find . -maxdepth 1 -type f -print0 | xargs -0 -i cp ./{}{,.bak}
```

### List files in tarballs
```sh
find <path> -name "*.tgz" -or -name "*.tar.gz" | while read file; do echo "$file: "; tar -tzf $file; done
```

### find files containing specifc pattern on filename and specific patternts in its content, open all in textmate
```sh
find . -name "*noticia*" -name "*jhtm*" -name "*.tpl" -exec grep -li "id=\"col-direita\"" '{}' \; | xargs -n1 mate
```

### Process each item with multiple commands (in while loop)
```sh
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done
```

### Remove executable bit from all files in the current directory recursively, excluding other directories, firm permissions
```sh
find . -type f -exec chmod 640 {} ';'
```

### Find/Replace in a bunch of files and keep a log of the changes
```sh
find . -type f | xargs grep -n "Old Text" | tee filesChanged.txt | sed 's/:.*$//' | xargs sed -i 's/Old Text/New Text/g
```

### Remove the Apple quarantine
```sh
find . | xargs xattr -d com.apple.quarantine
```

### Recursively delete .svn folders
```sh
find . -name .svn | xargs rm -rf
```

### best command for searching files
```sh
find / -name \*string\*
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' | grep -v '\.lzma$' | xargs -n 1 lzma -f -v -3
```

### Write a shell script that removes files that contain a string
```sh
find . | xargs grep -l "FOOBAR" | awk '{print "rm -f "$1}' > doit.sh
```

### Recursively remove all empty directories
```sh
find . -depth -type d -empty -exec rmdir -v {} \;
```

### Look for a string in one of your codes, excluding the files with svn and ~ (temp/back up files)
```sh
find . -type f -exec grep StringToFind   \{\} with-filename \;|sed -e '/svn/d'|sed -e '/~/d'
```

### Find top 5 big files
```sh
find . -type f -exec ls -s {} \; | sort -n -r | head -5
```

### rm filenames with spaces
```sh
find /Users/jpn/.ievms/ -type f -print0| xargs -0 du -sh
```

### Counts the number of TODOs in files with extension EXT found from the current dir.
```sh
find . -name "*.EXT" | xargs grep -n "TODO" | wc -l
```

### Recursive file content search
```sh
find . -name *.php | xargs grep -i -n 'TERM'
```

### Copy all JAR files to folder /tmp
```sh
find . -iname "*.jar" -exec cp '{}' /tmp/ \;
```

### Search through files, ignoring .svn
```sh
find . -type f -print0 | grep -vzZ '.svn' | xargs -0 grep color -nEHi "SEARCHTERM"
```

### Recursively remove all .svn directories
```sh
find . -name .svn -type d | parallel rm -rf
```

### Find files and list them with a readable informative output
```sh
find . -type f | sed 's,.*,stat "&" | egrep "File|Modify" | tr "\\n" " " ; echo ,'  | sh | sed 's,[^/]*/\(.*\). Modify: \(....-..-.. ..:..:..\).*,\2 \1,' | sort
```

### rm all files you grep
```sh
find . | grep deleteme | while read line; do rm $line; done
```

### Copy All mp3 files in iTunes into one folder (Example: Music on Desktop) (Os X)
```sh
find ~/Music/iTunes/ -name *.mp3 -exec cp {} ~/Desktop/Music/  \;
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -print | xargs grep -i -H "search phrase"
```

### find the 10 largest directories
```sh
find . -type d -print0 | xargs -0 du -s | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {} | sort -rn
```

### Removes Apple "garbage"
```sh
find . -name *DS_Store -exec echo rm {} \;
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec env d="$dest_root" sh -c ' exec mkdir -p  "$d/$1"' '{}' '{}' \;
```

### Finding files with different extensions
```sh
find . -regex '.*\(h\|cpp\)'
```

### How many lines in your c project?
```sh
find -name *.\[c\|h\] | xargs wc -l
```

### Look for timthumb.php or thumb.php and get its version.
```sh
find `pwd` -type f \( -iname thumb.php -or -iname timthumb.php \) -exec grep -HP 'define ?\(.VERSION' {} \;
```

### sorts /dev/random
```sh
find /dev/ -name random -exec bash -c '[ -r $0 -a -w $0 ] && dd if=$0 | sort | dd of=$0' {} \;
```

### Remove executable bit from all files in the current directory recursively, excluding other directories, firm permissions
```sh
find . -type f -exec chmod a-x {} \;
```

### List dot-files and dirs, but not . or ..
```sh
find directory -maxdepth 1 -iname "*" | awk 'NR >= 2'
```

### md5sum for files with bad characters
```sh
find . -type f -exec md5sum {} \;
```

### /bin/rm: Argument list too long.
```sh
find . -name 'spam-*' |xargs rm;find . -name 'spam-*' -print0 | xargs -0 rm
```

### Remove all pyc files
```sh
find . -name \*.pyc -delete
```

### Replace spaces with tabs & format file source recursively within a directory
```sh
find . -type f -name \*.php | while IFS="" read i; do expand -t4 "$i" > "$i-"; mv "$i-" "$i"; done
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -exec cat {} \;|wc -l
```

### Removes the .svn entries from a project
```sh
find -name ".svn" -exec rm -rf {} \;
```

### Shortcut to find files with ease.
```sh
findfile() { find . -type f -iname "*${*}*" ; }
```

### Search all files of type *.php for string 'specialFunction' and output the result in searchResult.txt
```sh
find . -name "*.php" | xargs egrep -i -s 'specialFunction' > searchresult.txt
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . -type f | while read f; do chmod -x "$f"; done
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i -H "search pharse" {} \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} \;
```

### find files in a date range
```sh
find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
```

### Find all IP's in /etc directory
```sh
find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;
```

### show directory three
```sh
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
```

### delete files except some file
```sh
find . |more |grep -v filename |xargs rm
```

### bat add copyright info
```sh
find . -name "*.c" -exec sed -i "/\/sh/a\####################################\n#Date:2010-05-18\n#Company:XXXXX tech Co.\n#Author:Wangjunling\n#Copyright:gpl\n####################################" {} \;
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' | xargs rm -r
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ |xargs grep -i "phrase"
```

### Delete all files in current directory that have been modified less than 5 days ago.
```sh
find ./ -mtime -5 | xargs rm -f
```

### Remove VIM temp files
```sh
find . -name "*~" -exec rm {} \;
```

### exec option in find
```sh
find ~ -mtime +365 -exec mv {} /tmp/mybackup \;
```

### Searching files
```sh
find /dir/ -name *name*
```

### Recursive chmod all files and directories within the current directory
```sh
find . -exec chmod 777 {} \;
```

### "Reset" directories permissions
```sh
find . -type d -exec chmod 0755 {} \;
```

### Move files matching a certain pattern to another folder
```sh
find . | grep ".*\[[Church|CPYAF].*" | while read f; do mv "$f" ../emails;done
```

### egrep -r replacement for UNIX systems
```sh
find . -type f | xargs grep -l "string"
```

### Search for all files that begin with . and delete them.
```sh
find ~/Desktop/ \( -regex '.*/\..*' \) -print -exec rm -Rf {} \;
```

### Find only *.doc and *xls files on Windows partition
```sh
find Documents\ and\ Settings -iregex .+\.doc -or -iregex .+\.xls > office.lst
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type d -name '*[A-Z]*' -execdir bash -c '! test -f "$(echo "$0" | tr "[:upper:]" "[:lower:]")"' {} \; -execdir bash -c 'mv "$0" "$(echo "$0" | tr "[:upper:]" "[:lower:]")"' {} \;
```

### Open a list of files in VIM using separate terminal windows
```sh
find . -name "*.java" -exec gnome-terminal \-x vim {} \;
```

### Find different filetypes in current directory
```sh
find . -maxdepth 1 -type f -name '*.sh' -o -name '*.txt'
```

### sirve para ver la salida de un comando en pantalla y al mismo tiempo guardar la salida en un fichero
```sh
find / -name *.conf | tee salida
```

### cleaning after python
```sh
find ~ -name "*.pyc" -exec rm {} \;
```

### List the size (in human readable form) of all sub folders from the current location
```sh
find . -maxdepth 1 -type d -not -name . -exec du -sh {} +
```

### Count a number of files (only files, not dirs) in a directory recursevely
```sh
find . -type f | wc -l
```

### renombrar un archivo que inicia con guion
```sh
find . -name "-help" -exec mv {} help.txt \;
```

### Recursive chmod all files and directories within the current directory
```sh
find . -name "*" -print0 | xargs -0 -I {} chmod 777 {}
```

### "Reset" file permissions
```sh
find . -type f -exec chmod 0644 {} \;
```

### Altera texto dentro dos arquivos retornados pelo comando 'find'  (find and replacing strings on all files in directory)
```sh
find ./wp-content/themes/rotce2009/ -name '*.php' -type f | xargs sed -i 's/<? /<?php /g'
```

### Execute commands on files found by the find command
```sh
find -iname "MyCProgram.c" -exec md5sum {} \;
```

### Read directory contents recursively
```sh
find . |while read f;do echo "$f";done
```

### Find all files containing a word
```sh
find . -exec grep -l "sample" {} \;
```

### Thumbs.db&#12434;&#25506;&#12375;&#20986;&#12375;&#12390;&#20840;&#37096;&#28040;&#12377;
```sh
find /tank -iname thumbs.db -print0 | xargs -0 rm
```

### Find broken symlinks
```sh
find . -type l | xargs file  | grep broken
```

### Replace spaces with '_' in filenames
```sh
find -depth . | (while read FULLPATH; do BASENAME=`basename "${FULLPATH}"`; DIRNAME=`dirname "${FULLPATH}"`; mv "${DIRNAME}/${BASENAME}" "${DIRNAME}/${BASENAME// /_}"; done)
```

### Recursive chmod all files and directories within the current directory
```sh
find . -print -exec chmod 777 {} \;
```

### Recursive chmod all files and directories within the current directory
```sh
find | xargs chmod 777
```

### Grep only files matching certain pattern (Advanced)
```sh
find <path> |xargs grep <pattern>
```

### find .txt files inside a directory and replace every occurrance of a word inside them via sed
```sh
find . -name '*.txt' -exec sed -ir 's/this/that/g' {} \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec bash -c 'mv "$1" "${1/%.JPG/.jpg}"'  {} \;
```

### Advanced LS Output using Find for Formatted/Sortable File Stat info
```sh
find $PWD -maxdepth 1 -printf '%.5m %10M %#9u:%-9g %#5U:%-5G  [%AD | %TD | %CD]  [%Y] %p\n'
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 755 {} +
```

### Find all files of a type and copy them elsewhere while keeping intact their full directory structure using find and cpio
```sh
find . -iname "*.flac" | cpio -pdm /Volumes/Music/FLAC
```

### How many files in the current directory ?
```sh
find . -maxdepth 1 -type f | wc -l
```

### Skip over .svn directories when using the
```sh
find . -name .svn -prune -o -print
```

### Find dead symbolic links
```sh
find -L -type l
```

### Calculate md5 sums for every file in a directory tree
```sh
find . -type f -exec md5sum {} \; > sum.md5
```

### Monitor logs in Linux using Tail
```sh
find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
```

### List latest 5 modified files recursively
```sh
find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' | sort -nr | head -n 5 | cut -f2- -d" "
```

### find and delete empty directories recursively
```sh
find . -depth -type d -empty -exec rmdir -v {} +
```

### Remove empty directories
```sh
find . -type d -empty -delete
```

### Find today created files
```sh
find directory/ -mtime 0 -type f
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 | xargs rm -vf
```

### Find 'foo' string inside files
```sh
find . -type f -print | xargs grep foo
```

### Count the total number of files in each immediate subdirectory
```sh
find . -type f -printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn
```

### Search $PATH for a command or something similar
```sh
find ${PATH//:/ } -name \*bash\*
```

### Change string in many files at once and more.
```sh
find . -type f -exec grep -l XXX {} \;|tee /tmp/fileschanged|xargs perl -pi.bak -e 's/XXX/YYY/g'
```

### a find and replace within text-based files, to locate and rewrite text en mass.
```sh
find . -name "*.txt" | xargs perl -pi -e 's/old/new/g'
```

### Fix "broken" ID3 tags in the current directory and subdirectories
```sh
find -iname '*mp3' -exec mid3iconv {} \;
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \;
```

### find all file larger than 500M
```sh
find / -type f -size +500M
```

### Find last modified files in a directory and its subdirectories
```sh
find . -type f -print0 | xargs -0 stat -c'%Y :%y %12s %n' | sort -nr | cut -d: -f2- | head
```

### List files above a given threshold
```sh
find . -type f -size +25000k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
```

### Compress files found with find
```sh
find ~/bin/ -name "*sh" -print0 | xargs -0t tar -zcvf foofile.tar.gz
```

### Find files that are older than x days
```sh
find . -type f -mtime +7 -exec ls -l {} \;
```

### get the top 10 longest filenames
```sh
find | sed -e "s/^.*\///" | awk ' BEGIN { FS=""} { print NF "  " $0  } ' | sort -nrf | head -10
```

### Delete files older than..
```sh
find /dir_name -mtime +5 -exec rm {} \
```

### Find all the files more than 10MB, sort in descending order of size and record the output of filenames and size in a text file.
```sh
find . -size +10240k -exec ls -l {} \; | awk '{ print $5,"",$9 }'|sort -rn > message.out
```

### Change the ownership of all files owned by one user.
```sh
find /home -uid 1056 -exec chown 2056 {} \;
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f | parallel -j+0 grep -i foobar
```

### Find files and list them sorted by modification time
```sh
find -printf "%C@ %p\n"|sort
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} + | sort -n
```

### Find directories under home directory with 777 permissions, change to 755, and list them on console
```sh
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
```

### Remove all .svn folders
```sh
find . -depth -name .svn -type d -exec rm -fr {} \;
```

### Show drive names next to their full serial number (and disk info)
```sh
find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
```

### Find and copy scattered mp3 files into one directory
```sh
find . -iname '*.mp3' -type f -print0 | xargs -I{} -0 cp {} </path>
```

### Trick find -exec option to execute alias
```sh
find . -exec `alias foo | cut -d"'" -f2` {} \;
```

### Skip over .svn directories when using the "find" command.
```sh
find . -not \( -name .svn -prune \)
```

### copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
```sh
find . -printf "touch -m -d \"%t\" '%p'\n" | tee /tmp/retime.sh
```

### Finding all files on local file system with SUID and SGID set
```sh
find / \( -local -o -prune \) \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \;
```

### cleanup /tmp directory
```sh
find /tmp -type f -atime +1 -delete
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -executable -type f -printf "%f\n"
```

### Remove all the files except abc in the directory
```sh
find * -maxdepth 1 -type f ! -name abc -delete
```

### ShellCheck all the bash/sh script under a specific directory excluding version control
```sh
find .  -type f ! -path "./.git/*" -exec sh -c "head -n 1 {} | egrep -a 'bin/bash|bin/sh' >/dev/null" \; -print -exec shellcheck {} \;
```

### find files larger than 1 GB, everywhere
```sh
find / -type f -size +1000000000c
```

### Batch Convert SVG to PNG (in parallel)
```sh
find . -name \*.svg -print0 | xargs -0 -n1 -P4 -I{} bash -c 'X={}; convert "$X" "${X%.svg}.png"'
```

### Gzip files older than 10 days matching *
```sh
find . -type f -name "*" -mtime +10 -print -exec gzip {} \;
```

### Faster find and move using the find and xargs commands. Almost as fast as locate.
```sh
find . -maxdepth 2 -name "*somepattern" -print0 | xargs -0 -I "{}" echo mv "{}" /destination/path
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find . -type f | grep -rl $'\xEF\xBB\xBF'
```

### View all new log messages in real time with color
```sh
find /var/log -type f -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Count number of files in a directory
```sh
find . -maxdepth 1 -type f | wc -l
```

### tar and remove files which are older that 100 days
```sh
find . -type f -mtime +100 -exec tar rvf my.tar remove-files {} \;
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
find ./ -type f -name "*.txt" -exec tar uvf myarchives.tar {} +
```

### Speed up launch of firefox
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### Remove Backup Files
```sh
find / -name *~ -delete
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f -print0 | xargs -0 -P 4 -n 40 grep -i foobar
```

### fix broken permissions
```sh
find /path -type d -perm 777 -exec chmod 755 {} \;
```

### Recursively remove all subversion folders
```sh
find . -name .svn  -exec rm \-rf {} \;
```

### find external links in all html files in a directory list
```sh
find . -name '*.html' -print0| xargs -0 -L1 cat |sed "s/[\"\<\>' \t\(\);]/\n/g" |grep "http://" |sort -u
```

### Create md5sum of files under the current dir excluding some directories
```sh
find . -type d \( -name DIR1 -o -name DIR2 \) -prune -o -type f -print0 | xargs -r0 md5sum
```

### find all non-html files
```sh
find . -type f ! -name "*html"
```

### Remove all backup files in my home directory
```sh
find ~user/ -name "*~" -exec rm {} \;
```

### List files with full path
```sh
find $(pwd) -maxdepth 1
```

### Skip filenames with control characters, a.k.a tab,newline etc
```sh
find . ! -name "$(printf '*[\001-\037\177]*')"
```

### Find writable files
```sh
find -writable
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} +
```

### take a look to command before action
```sh
find /tmp -type f -printf 'rm "%p";\n'
```

### Grep only files matching certain pattern (Advanced)
```sh
find . -path "*/any_depth/*" -exec grep "needle" {} +
```

### Recursively remove .svn directories
```sh
find . -type d -name .svn -delete
```

### Recursively remove .svn directories from a local repository
```sh
find . -type d -name .svn -execdir rm -rf {} +
```

### Remove annoying OS X DS_Store folders
```sh
find . -name .DS_Store -exec rm {} \;
```

### Recursive cat - concatenate files (filtered by extension) across multiple subdirectories into one file
```sh
find . -type f -name *.ext -exec cat {} > file.txt \;
```

### Eliminate dead symlinks interactively in /usr/ recursevely
```sh
find /usr/ -type l ! -xtype f ! -xtype d -ok rm -f {} \;
```

### find largest file in /var
```sh
find /var -mount -ls -xdev | /usr/bin/sort -nr +6 | more
```

### Recursively Find Images, Convert to JPEGS and Delete
```sh
find . -name '*'.tiff -exec bash -c "mogrify -format jpg -quality 85 -resize 75% {} && rm {}" \;
```

### Print the 10 deepest directory paths
```sh
find . -type d | perl -nle 'print s,/,/,g," $_"' | sort -n | tail
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -delete
```

### check for write/read permissions
```sh
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null
```

### Size(k) of directories(Biggest first)
```sh
find . -depth -type d -exec du -s {} \; | sort -k1nr
```

### Find broken symlinks in the current directory and its subdirectories.
```sh
find -L -type l
```

### Find jpeg images and copy them to a central location
```sh
find . -iname "*.jpg" -print0 | tr '[A-Z]' '[a-z]' | xargs -0 cp backup=numbered -dp -u target-directory {location} &
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '($1 < 2048) {print $2}'
```

### Lists all directories under the current dir excluding the .svn directory and its contents
```sh
find . \( -type d -name .svn -prune \) -o -type d -print
```

### Add SVN keywords property to all PHP and Javascript files
```sh
find . \( -name "*.php" -o -name "*.js" \) -exec svn propset svn:keywords Id {} \;
```

### Write a shell script that removes files that contain a string
```sh
find -type f -exec grep -q "regexp" {} \; -delete
```

### bash find function
```sh
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }
```

### List only executables installed by a debian package
```sh
find $(dpkg -L iptables) -maxdepth 0 -executable -type f
```

### Coping files, excluding certain files
```sh
find ./ ! -name 'excludepattern' | xargs -i cp parents {} destdir
```

### Sum size of files returned from FIND
```sh
find [path] [expression] -exec du -ab {} \; | awk '{total+=$0}END{print total}'
```

### find . -name
```sh
find . -name "*.txt" -exec sed -i "s/old/new/" {} \;
```

### Convert encoding from cp1252 (MS Windows) to UTF-8 on source code files
```sh
find . -iname *.java -type f -exec bash -c "iconv -f WINDOWS-1252 -t UTF-8 {}  > {}.tmp " \; -exec mv {}.tmp {} \;
```

### files and directories in the last 1 hour
```sh
find ./* -ctime -1 | xargs ls -ltr color
```

### Find files modified since a specific date
```sh
find /path/to/somewhere -newermt "Jan 1"
```

### Generate a playlist of all the files in the directory, newer first
```sh
find . -type f -print0 | xargs -r0 stat -c %Y\ %n | sort -rn | gawk '{sub(/.\//,"",$2); print $2}' > /tmp/playlist.m3u
```

### Another way to calculate sum size of all files matching a pattern
```sh
find . -iname '*.jar' | xargs du -ks | cut -f1 | xargs echo | sed "s/ /+/g" | bc
```

### Show the disk usage for files pointed by symbolic link in a directory
```sh
find /usr/lib -maxdepth 1 -type l -print0  | xargs -r0 du -Lh
```

### Delete recursively only empty folders on present dir
```sh
find ./ -empty -type d -delete
```

### Convert all WMF images to SVG recursively ignoring file extension case
```sh
find . -type f -iname '*.wmf' | while read FILE; do FILENAME="${FILE%.*}"; wmf2svg -o ${FILENAME}.svg $FILE; done
```

### List commands with a short summary
```sh
find `echo "${PATH}" | tr ':' ' '` -type f | while read COMMAND; do man -f "${COMMAND##*/}"; done
```

### Counts number of lines
```sh
find . \( -name '*.h' -o -name '*.cc' \) | xargs grep . | wc -l
```

### Parallel mysql dump restore
```sh
find -print0 | xargs -0 -n 1 -P 4 -I {} sh -c "zcat '{}' | mysql nix"
```

### DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
```sh
find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00" if ($h eq $ph)'|xargs -0 rm -v 
```

### Find broken symlinks and delete them
```sh
find -L /path/to/check -type l -delete
```

### Give any files that don't already have it group read permission under the current folder (recursive)
```sh
find . -type f ! -perm /g=r -exec chmod g+r {} +
```

### Recursively lists all files in the current directory, except the ones in '.snapshot' directory
```sh
find . -wholename './.snapshot' -prune -o -print
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name \*.pdf -exec pdfinfo {} \; | grep Pages | sed -e "s/Pages:\s*//g" | awk '{ sum += $1;} END { print sum; }'
```

### Convert all files for iPhone with HandbrakeCLI
```sh
find . -name \*.avi -exec HandBrakeCLI -i "{}" -o "{}".iphone.mp4 preset="iPhone & iPod Touch" \;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf '{}' +
```

### Move all but the newest 100 emails to a gzipped archive
```sh
find $MAILDIR/ -type f -printf '%T@ %p\n' | sort reverse | sed -e '{ 1,100d; s/[0-9]*\.[0-9]* \(.*\)/\1/g }' | xargs -i sh -c "cat {}&&rm -f {}" | gzip -c >>ARCHIVE.gz
```

### Indent all the files in a project using emacs
```sh
find -iname \*.[ch] -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -delete
```

### Cleanup Python bytecode files
```sh
find . -name "*.py[co]" -exec rm -f {} \;
```

### Create incremental snapshots of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -g "$destdir"/"$tarfile".snar -czf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" | xargs grep "TODO"
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" -exec grep "TODO" {} +
```

### Replace + Find
```sh
find <mydir> -type f -exec sed -i 's/<string1>/<string2>/g' {} \;
```

### Find which jars contain a class
```sh
find . -name "*.jar" | while read file; do echo "Processing ${file}"; jar -tvf $file | grep "Foo.class"; done
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir/ -type f -exec rm {} +
```

### find and grep Word docs
```sh
find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;
```

### Show all symlinks
```sh
find ./ -type l -ls
```

### Cleanup firefox's database.
```sh
find ~/.mozilla/firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Find Duplicate Files (based on MD5 hash)
```sh
find -type f -exec md5sum '{}' ';' | sort | uniq all-repeated=separate -w 33 | cut -c 35-
```

### Find and display most recent files using find and perl
```sh
find $HOME -type f -print0 | perl -0 -wn -e '@f=<>; foreach $file (@f){ (@el)=(stat($file)); push @el, $file; push @files,[ @el ];} @o=sort{$a->[9]<=>$b->[9]} @files; for $i (0..$#o){print scalar localtime($o[$i][9]), "\t$o[$i][-1]\n";}'|tail
```

### Find all files with colons and replace with underscores; current directory and below (recursive).
```sh
find ./ -name '*:*' -exec rename 's/:/_/g' {} +
```

### Clone current directory into /destination verbosely
```sh
find . | cpio -pumdv /destination
```

### Find broken symlinks
```sh
find . -type l -xtype l
```

### recursive remove all htm files
```sh
find . -type f -name '*.htm' -delete
```

### Recursivly search current directory for files larger than 100MB
```sh
find -size +100M
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -printf "%s\n" | awk '{total += $1} END {print total}'
```

### rsync directory tree including only files that match a certain find result.
```sh
find /src/dir/ -mtime -10 -printf %P\\0|rsync files-from=- from0 /src/dir/ /dst/dir/
```

### Find and remove core files
```sh
find . -type f -regex '.*/core\.?[0-9]*$' -delete
```

### Quick HTML image gallery
```sh
find . -iname "*.jpg" -printf '<img src="%f" title="%f">\n' > gallery.html
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn
```

### find duplicate messages in a Maildir
```sh
find $folder -name "[1-9]*" -type f -print|while read file; do echo $file $(sed -e '/^$/Q;:a;$!N;s/\n //;ta;s/ /_/g;P;D' $file|awk '/^Received:/&&!r{r=$0}/^From:/&&!f{f=$0}r&&f{printf "%s%s",r,f;exit(0)}');done|sort -k 2|uniq -d -f 1
```

### List only directories, one per line
```sh
find . -type d -maxdepth 1
```

### Count number of files in subdirectories
```sh
find . -maxdepth 1 -type d -exec sh -c "printf '{} ' ; find '{}' -type f -ls | wc -l" \;
```

### Selecting a random file/folder of a folder
```sh
find . | shuf -n1
```

### Grab a list of MP3s out of Firefox's cache
```sh
find ~/.mozilla/firefox/*/Cache -exec file {} \; | awk -F ': ' 'tolower($2)~/mpeg/{print $1}'
```

### Make backups recurse through directories
```sh
find -type -f -exec cp {} {}.bak \;
```

### Delete empty directories recursively
```sh
find <top_level_dir> -depth -type d -empty -exec rmdir -v {} \;
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' -print0 | parallel -0 -j+0 lzma
```

### Search inside a folder of jar/zip files
```sh
find . -name "*.jar" | xargs -tn1 jar tvf | grep color "SearchTerm"
```

### Copy a file structure without files
```sh
find * -type d -exec mkdir /where/you/wantem/\{\} \;
```

### Find all the links to a file
```sh
find -L / -samefile /path/to/file -exec ls -ld {} +
```

### Slightly better compressed archives
```sh
find . \! -type d | rev | sort | rev | tar c files-from=- format=ustar | bzip2 best > a.tar.bz2
```

### Find files with at least one exec bit set
```sh
find . -type f -perm +0111 -print
```

### Find commets in jpg files.
```sh
find / -name "*.jpg" -print -exec rdjpgcom '{}' ';'
```

### LIST FILENAMES OF FILES CREATED TODAY IN CURRENT DIRECTORY
```sh
find -maxdepth 1 -mtime 0 -type f
```

### Find all files that have nasty names
```sh
find -name "*[^a-zA-Z0-9._-]*"
```

### rename all files with "?" char in name
```sh
find . -type f -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find Duplicate Files (based on MD5 hash)  For Mac OS X
```sh
find . -type f -exec md5 '{}' ';' | sort | uniq -f 3 -d | sed -e "s/.*(\(.*\)).*/\1/"
```

### Delete all flash cookies.
```sh
find $HOME -name '*.sol' -exec rm {} \;
```

### List of services sorted by boot order in Redhat-based systems
```sh
find /etc/rc3.d/ | sort -g
```

### Replace underscores with spaces in filenames and dirnames, recursively into subdirs.
```sh
find . -exec rename 's/_/\ /g' {} +
```

### finding more large files
```sh
find / -xdev -size +1024 -exec ls -al {} \; | sort -r -k 5
```

### List mp3 files with less than 320 kbps bitrate.
```sh
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'
```

### List folders containing only PNGs
```sh
find . -name '*png' -printf '%h\0' | xargs -0 ls -l hide=*.png | grep -ZB1 ' 0$'
```

### Replace php short open tags
```sh
find . -name '*.phtml' | xargs perl -pi -e 's/(?!(<\?(php|xml|=)))<\?/<\?php/g;'
```

### Sort files in multiple directories by date
```sh
find .  -type f -exec ls -l full-time {} + | sort -k 6,7
```

### Find where a kind of file is stored
```sh
find . -name '*.desktop' | sed s/[^/]*\.desktop$// | uniq -c | sort -g
```

### Search for files  older than 30 days in a directory and list only their names not the full path
```sh
find /var/www/html/ -type f -mtime +30 -exec basename {} \;
```

### Counts number of lines (in source code excluding comments)
```sh
find . -name '*.java' | xargs -L 1 cpp -fpreprocessed | grep . | wc -l
```

### View all images
```sh
find -iname '*.jpg' -print0 | xargs -0 feh -d
```

### find text in a file
```sh
find /directory/to/search/ -type f -print0 | xargs -0 grep "findtext"
```

### Stat each file in a directory
```sh
find . -maxdepth 1 -type f | xargs stat
```

### Find files and list them sorted by modification time
```sh
find -type f -print0 | xargs -r0 stat -c %y\ %n | sort
```

### Remove last line from files recursively
```sh
find . -name "*.php" -type f -exec sed -i "\$d" '{}' \;
```

### Rename many files in directories and subdirectories
```sh
find . -type d -print0 | while read -d $'\0' dir; do cd "$dir"; echo " process $dir"; find . -maxdepth 1 -name "*.ogg.mp3" -exec rename 's/.ogg.mp3/.mp3/' {} \; ; cd -; done
```

### git pull all repos
```sh
find ~ -maxdepth 2 -name .git -print | while read repo; do cd $(dirname $repo); git pull; done
```

### find out how much space are occuipied by files smaller than 1024K (sic) - improved
```sh
find dir -size -1024k -type f -print0 | du files0-from - -bc
```

### Find Duplicate Files, excluding .svn-directories (based on size first, then MD5 hash)
```sh
find -type d -name ".svn" -prune -o -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type d -name ".svn" -prune -o -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Batch convert files to utf-8
```sh
find . -name "*.php" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o ../newdir_utf8/{} \;
```

### Recursively execute command on directories (.svn, permissions, etc)
```sh
find . -type d -name .svn -exec chmod g+s "{}" \;
```

### Quick HTML image gallery
```sh
find . -iname '*.jpg' | sed 's/.*/<img src="&">/' > gallery.html
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} \; | sort
```

### List top 10 files in filesystem or mount point bigger than 200MB
```sh
find /myfs -size +209715200c -exec du -m {} \; |sort -nr |head -10
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/apt -not -mtime -7 | sudo xargs rm
```

### Recursively touch all files and subdirectories
```sh
find . -exec touch {} \;
```

### Unaccent an entire directory tree with files.
```sh
find /dir | awk '{print length, $0}' | sort -nr | sed 's/^[[:digit:]]* //' | while read dirfile; do outfile="$(echo "$(basename "$dirfile")" | unaccent UTF-8)"; mv "$dirfile" "$(dirname "$dirfile")/$outfile"; done
```

### Compress logs older than 7 days
```sh
find /path/to/files -type f -mtime +7 | grep -v \.gz | xargs gzip
```

### defragment files
```sh
find ~ -maxdepth 20 -type f -size -16M -print > t; for ((i=$(wc -l < t); i>0; i)) do a=$(sed -n ${i}p < t); mv "$a" /dev/shm/d; mv /dev/shm/d "$a"; echo $i; done; echo DONE; rm t
```

### View all new log messages in real time with color
```sh
find /var/log -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Generate SHA1 hash for each file in a list
```sh
find . -type f -exec sha1sum {} >> SHA1SUMS \;
```

### Summarise the size of all files matching a simple regex
```sh
find /path/to/my/files/ -type f -name "*txt*" | xargs du -k | awk 'BEGIN{x=0}{x=x+$1}END{print x}'
```

### Find all files under a certain directory /home that have a certain suffix at the end of the file name. Show the file and rename them to remove the suffix.
```sh
find /home -print -exec rename -v 's/_2009-09-04.suffix$//' {} \;
```

### Print a list of the 30 last modified mp3s sorted by last first
```sh
find ~/Music -daystart -mtime -60 -name *mp3 -printf "%T@\t%p\n" | sort -f -r | head -n 30 | cut -f 2
```

### Find Files That Exceed a Specified Size Limit
```sh
find directory -size +nnn
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -exec rm -f {} \;
```

### copies 20 most recently downloaded mp3 files (such as from Miro) into a directory
```sh
find . -name \*.mp3 -printf "%C+ %h/%f\n" | sort -r | head -n20 | awk '{print "\""$2"\""}' | xargs -I {} cp {} ~/tmp
```

### sort through source to find most common authors
```sh
find . -type f -name "*.java" -print0 | xargs -0 -n 1 svn blame | sed -n 's/^[^a-z]*\([a-z]*\).*$/\1/p' | sort | uniq -c | sort -n
```

### Find the most recently changed files (recursively)
```sh
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -delete
```

### Find directory depth
```sh
find . -printf '%d\n' | sort -n  | tail -1
```

### Move mp3 files to another path with existing subtree structure
```sh
find . -iname "*.mp3" -type f -print0 | xargs -0 -I '{}' mv {} /new/path/to/mp3/{}
```

### 1:1 copy of a volume
```sh
find / -xdev -print | cpio -pdmuv /mnt/mydisk
```

### Command template, executing a command over multiple files, outputing progress and fails only
```sh
find <dir> -name "<pattern>" | while read file; do echo -n .; output=$(<command>) || (echo ; echo $file:; echo "$output"; ); done
```

### Get line count for any file ending with extension recursively rooted at the current directory.
```sh
find . -name "*.py" | xargs wc -l
```

### Find broken symlinks and delete them
```sh
find . -type l -exec test ! -e {} \; -delete
```

### Recover cvs ": no such repository" error
```sh
find ./* -name 'CVS' | awk '{print "dos2unix " $1 "/*"}' | awk '{system($0)}'
```

### Archive all SVN repositories in platform indepenent form
```sh
find repMainPath -maxdepth 1 -mindepth 1 -type d | while read dir; do echo processing $dir; sudo svnadmin dump deltas $dir >dumpPath/`basename $dir`; done
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Get lines count of a list of files
```sh
find . -name "*.sql" -print0 | wc -l files0-from=-
```

### Recursively remove Mac . (dot) files
```sh
find . -name '._*' -type f -delete
```

### Add .gitignore files to all empty directories recursively from your current directory
```sh
find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
```

### Show demo of toilet fonts
```sh
find /usr/share/figlet -name *.?lf -exec basename {}  \; | sed -e "s/\..lf$//" | xargs -I{} toilet -f {} {}
```

### convert filenames in current directory to lowercase
```sh
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
```

### Sort movies by length, longest first
```sh
find -name '*.avi' | while read i ; do echo $(mplayer -identify -frames 0 -vo null -nosound "$i" 2>&1 | grep ID_LENGTH | cut -d= -f2)" ""$i" ;done | sort -k1 -r -n | sed 's/^\([^\ ]*\)\ \(.*\)$/\2:\1/g'
```

### Find C/C++ source files
```sh
find . -name '*.[c|h]pp' -o -name '*.[ch]' -type f
```

### A function to find the newest file in a directory
```sh
find /path/to/dir  -type f -printf "%T@|%p\n" 2>/dev/null | sort -n | tail -n 1| awk -F\| '{print $2}'
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' | xargs grep -H "string"
```

### Determine space taken by files of certain type
```sh
find . -name <pattern> -ls | awk 'BEGIN {i=0}; {i=i+$7}; END {print i}'
```

### Find files recursively that were updated in the last hour ignoring SVN files and folders.
```sh
find . -mmin -60 -not -path "*svn*" -print|more
```

### find string into one pdf file
```sh
find / -iname '*.pdf' -print -exec pdftotext '{}' - \; | grep color -i "unix"
```

### remove execute bit only from files. recursively
```sh
find . -type f -exec chmod -x {} \;
```

### Change files case, without modify directories, recursively
```sh
find ./ -name '*.JPG' -type f -execdir rename -f 'y/A-Z/a-z/' {} \+
```

### finds the c files with lines containing 'mcs', in the folders under the current folder
```sh
find */*.c | xargs grep 'mcs'
```

### Recursively remove .svn directories from the current location
```sh
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf
```

### Count files beneath current directory (including subfolders)
```sh
find . -type f | wc -l
```

### Grep for regular expression globally, list files and positions.
```sh
find . -name "*.pbt" -exec grep -Hirn "declareObject.*Common_Down" {} \;
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '{ if ($1 <2000) print $0 }' | sed 's/^[0-9]*.//'
```

### Delete all files older than X in given path
```sh
find . -mtime +10 -delete
```

### Replicate a directory structure dropping the files
```sh
find . -type d -exec mkdir -p $DESTDIR/{} \;
```

### create a backup for all directories from current dir
```sh
find -maxdepth 1 -type d -print0 | xargs -0 -I {} tar -cvzf {}.tar.gz {}
```

### Find all files containing a word
```sh
find . -name "*.php" | xargs grep -il searchphrase
```

### MP3 player
```sh
find . -name '*.mp3' | sort | while read -r mp3; do echo -e "<h3>$mp3</h3>\n<audio controls src=\"$mp3\"></audio>"; done > index.html; python -m http.server
```

### Invert selection with find.
```sh
find . ! -name "*.tar.gz"
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -print0 | xargs -0 grep -i <pattern>
```

### make a list of movies(.m3u).
```sh
find $HOME -type f -print | perl -wnlaF'/' -e 'BEGIN{ print "#EXTM3U"; } /.+\.wmv$|.+\.mpg$|.+\.vob$/i and print "#EXTINF:$F[-1]\nfile://$&";' > movies.m3u
```

### Normalize volume in your mp3 library
```sh
find . -type f -name '*.mp3' -execdir mp3gain -a '{}' +
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec mkdir /copy_location/{} \;
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 -type d|xargs du -a max-depth=0|sort -rn|cut -d/ -f2|sed '1d'|while read i;do echo "$(du -h max-depth=0 "$i")/";done;find . -maxdepth 1 -type f|xargs du -a|sort -rn|cut -d/ -f2|sed '$d'|while read i;do du -h "$i";done
```

### Find all plain text files that do not contain STRING
```sh
find . -type f ! -exec grep -q 'STRING' {} \; -print
```

### change ownership en masse of files owned by a specific user, including files and directories with spaces
```sh
find . -uid 0 -print0 | xargs -0 chown foo:foo
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -mount -type f -printf "%k %p\n" | sort -rg | cut -d \  -f 2- | xargs -I {} du -sh {} | less
```

### Finds all files from / on down over specified size.
```sh
find / -type f -size +25M -exec ls -lh {} \; | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Find all SUID binaries
```sh
find / -perm +6000 -type f -exec ls -ld {} \;
```

### count the number of specific characters in a file or text stream
```sh
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c
```

### execute command on all files of certain types excluding folders that match pattern
```sh
find . -regextype posix-egrep -regex '.+\.(c|cpp|h)$' -not -path '*/generated/*' -not -path '*/deploy/*' -print0 | xargs -0 ls -L1d
```

### List only directories, one per line
```sh
find * -type d -maxdepth 0
```

### Recurse through directories easily
```sh
find . -type f | while read file; do cp $file ${file}.bak; done
```

### find filenames and directory names that doesn't conform ISO 9660 level 2
```sh
find . -regextype posix-extended -not -regex '.*/[A-Za-z_]*([.][A-Za-z_]*)?'
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do unzip -l $line; done | grep your-string
```

### list files by testing the ownership
```sh
find . -user root
```

### Recursive Line Count
```sh
find * -type f -not -name ".*" | xargs wc -l
```

### Recursive Line Count
```sh
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'
```

### calculate md5 sums for every file in a directory tree
```sh
find . -type f -print0 | xargs -0 md5sum
```

### List out classes in of all htmls in directory
```sh
find . -name '*.html' -exec  'sed' 's/.*class="\([^"]*\?\)".*/\1/ip;d' '{}' ';' |sort -su
```

### Find how much of your life you've wasted coding in the current directory
```sh
find * \( -name "*.[hc]pp" -or -name "*.py" -or -name "*.i" \) -print0 | xargs -0 wc -l | tail -n 1
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/pacman/pkg -not -mtime -7 | sudo xargs rm
```

### Find only *.doc and *xls files on Windows partition
```sh
find /mountpoint -type f -iregex '.*\.\(doc\|xls\)'
```

### recursive search and replace old with new string, inside files
```sh
find . -type f -exec sed -i s/oldstring/newstring/g {} +
```

### Validate all XML files in the current directory and below
```sh
find -type f -name "*.xml" -exec xmllint noout {} \;
```

### recursively remove BOM
```sh
find . -type f -exec sed -i -e '1s/^\xEF\xBB\xBF//' {} \;
```

### Converts all windows .URL shortcuts in a directory to linux (gnome) .desktop shortcuts
```sh
find . -name "*.URL" | while read file ; do cat "$file" | sed 's/InternetShortcut/Desktop Entry/' | sed '/^\(URL\|\[\)/!d' > "$file".desktop && echo "Type=Link" >> "$file".desktop ; done
```

### Find all dotfiles and dirs
```sh
find -mindepth 1 -maxdepth 1 -name .\*
```

### Recursively remove .svn directories
```sh
find . -name .svn -exec rm -r {} +;
```

### find sparse files
```sh
find -type f -printf "%S\t%p\n" 2>/dev/null | gawk '{if ($1 < 1.0) print $1 $2}'
```

### Convert all old SVN repositories in one directory to new format
```sh
find . -maxdepth 1 -type d -exec 'mv "{}" "{}-old" && svnadmin create "{}" && svnadmin recover "{}-old" && svnadmin dump "{}-old" | svnadmin load "{}" && rm -rf "{}-old"' \;
```

### follow the content of all files in a directory
```sh
find dir/ -type f | xargs tail -fqn0
```

### Find inside files two different patterns in the same line and for matched files show number of matched lines
```sh
find . -name '*' -type f -print0 | xargs -0 grep -n pattern1 | grep pattern2
```

### Create md5sum of a directory
```sh
find -type f | grep -v "^./.git" | xargs md5sum | md5sum
```

### Create md5sum of a directory
```sh
find -name .git -prune -o -type f -exec md5sum {} \; | sort -k2 | md5sum
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -regextype posix-egrep -iregex '.*?\.(ogg|mp3)' | sort > ~/mylist.m3u
```

### List all symbolic links in a directory matching a string
```sh
find directory -type l -lname string
```

### Show all mergeinfo for a svn subtree
```sh
find . \( -type d -name .svn -prune \) -o -print | while read file ; do mergeinfo=`svn propget svn:mergeinfo $file` ; [ "$mergeinfo" != "" ] && echo -e "$file\n    $mergeinfo\n" ; done
```

### Create and play an instant keyword based playlist
```sh
find -E ~/Music -type f -iname "*search terms*" -iregex '.*\.(3g[2|p]|aac|ac3|adts|aif[c|f]?|amr|and|au|caf|m4[a|r|v]|mp[1-4|a]|mpeg[0,9]?|sd2|wav)' -exec afplay "{}" \; &
```

### Recursively search and replace old with new string, inside every instance of filename.ext
```sh
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;
```

### finding cr-lf files aka dos files with ^M characters
```sh
find $(pwd) -type f -exec grep -l "$(echo "\r")" {} \;
```

### Change permissions of every directory in current directory
```sh
find . -type d -exec chmod 755 {} \;
```

### Find broken symlinks
```sh
find /path/to/search -xtype l
```

### remove recursively all txt files with number of lines less than 10
```sh
find . -type f -name "*.txt" | while read; do (($(cat $THISFILE | wc -l) < 10)) && rm -vf "$THISFILE";  done
```

### a find and replace within text-based files
```sh
find . -iname "FILENAME" -exec sed -i 's/SEARCH_STRING/REPLACE_STRING/g' {} \;
```

### Simple Gumblar check command
```sh
find filepath -type f -iname "*.html" -o -iname "*.htm" -o -iname "*.php" | xargs grep "Exception\|LGPL\|CODE1"
```

### Iterate through current directory + all subs for C++ header files and rank by # of comments
```sh
find ./ -name *.h -exec egrep -cH "// | /\*" {} \; | awk -F':' '{print $2 ":" $1}' | sort -gr
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f 2>/dev/null | xargs du 2>/dev/null | sort -n | tail -n 10 | cut -f 2 | xargs -n 1 du -h
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Check syntax for all PHP files in the current directory and all subdirectories
```sh
find . -name \*.php -exec php -l "{}" \;
```

### BIGGEST Files in a Directory
```sh
find . -printf '%.5m %10M %#9u %-9g %TY-%Tm-%Td+%Tr [%Y] %s %p\n'|sort -nrk8|head
```

### find all file larger than 500M
```sh
find . -type f -size +500M -exec du {} \; | sort -n
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -iname "*admin*" -executable -type f
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f -size +100M -exec du {} \; | sort -n | tail -10 | cut -f 2
```

### Remove spaces from filenames - through a whole directory tree.
```sh
find . -depth -name '* *' -execdir bash \-c 'a="{}";mv -f "$a" ${a// /_}' \;
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\.//' |sort -f |uniq -i
```

### Find files of two different extensions and copy them to a directory
```sh
find * -regextype posix-extended -regex '.*\.(ext_1|ext_2)' -exec cp {} copy_target_directory \;
```

### FInd the 10 biggest files taking up disk space
```sh
find /home/ -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null
```

### find out how much space are occuipied by files smaller than 1024K
```sh
find dir -size -1024k -type f | xargs -d $'\n' -n1 ls -l | cut -d ' ' -f 5  | sed -e '2,$s/$/+/' -e '$ap' | dc
```

### Find files with size over 100MB and output with better lay-out
```sh
find . -type f -size +100M
```

### RELINK a lot of broken symlinks - FIX broken symlinks after rsync site to new server
```sh
find /PATHNAME -type l | while read nullsymlink ; do wrongpath=$(readlink "$nullsymlink") ; right=$(echo "$wrongpath" | sed s'|OLD_STRING|NEW_STRING|') ; ln -fs "$right" "$nullsymlink" ; done
```

### Stat each file in a directory
```sh
find -name `egrep -s '.' * | awk -F":" '{print $1}' | sort -u` -exec stat {} \;
```

### Clear cassandra snapshots that are older than 30 days
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -mtime +30 -print0 | xargs -0 rm -rf
```

### Delete empty,  24-hours-old directories recursively, without consider hidden directories
```sh
find .  -regex "[^.]*" -depth -empty -type d -mtime +1 -exec rmdir -v {} \;
```

### Erase empty files
```sh
find . -type f -size 0 -delete
```

### Find and delete oldest file of specific types in directory tree
```sh
find / \( -name "*.log" -o -name "*.mylogs" \) -exec ls -lrt {} \; | sort -k6,8 | head -n1 | cut -d" " -f8- | tr -d '\n' | xargs -0 rm
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {};
```

### Quick HTML image gallery from folder contents with Perl
```sh
find . | perl -wne 'chomp; print qq|<img src="$_" title="$_" /><br />| if /\.(jpg|gif|png)$/;'> gallery.html
```

### Find dead symbolic links
```sh
find . -type l | perl -lne 'print if ! -e'
```

### gain all mp3s in subfolders w/o encoding
```sh
find . -type f -iname '*.mp3' -print0 | xargs -0 mp3gain -r -k
```

### find all writable (by user) files in a directory tree (use 4 for readable, 1 for executable)
```sh
find . -type f -perm +200 -print
```

### delete file name space
```sh
find . -type f -print0 | xargs -0 rename 's/\ //g'
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
find /proc/*/fd -xtype f -printf "%l\n" | grep -P '^/(?!dev|proc|sys)' | sort | uniq -c | sort -n
```

### Count the number of deleted files
```sh
find /path/folder -type f -name "*.*" -print -exec rm -v {} + | wc -l;
```

### find and delete empty dirs, start in current working dir
```sh
find . -empty -type d -exec rmdir {} +
```

### Find the biggest files on your hard drive
```sh
find / -type f -size +500000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### search office documents for credit card numbers and social security number SSN docx xlsx
```sh
find  . -iname "*.???x" -type f -exec  unzip -p '{}' '*'
```

### List files in directory tree with newest last
```sh
find <directory> -type f -printf "%T@\t%p\n"|sort -n|cut -f2|xargs ls -lrt
```

### Count all files in directories recursively with find
```sh
find -maxdepth 3 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" | wc -l; done
```

### Recursive search inside the content of files under current directory - then view the result paginated with 'less'
```sh
find . -exec grep -Hn what \{\} \; | less
```

### pngcrush all .png files in the directory
```sh
find . -iname '*png' -exec pngcrush -ow -brute  {} {}.crush \;
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -sk "{}" | sort -rn | head
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 ! -name '.'  -execdir du -0 -s {} + | sort -znr | gawk 'BEGIN{ORS=RS="\0";} {sub($1 "\t", ""); print $0;}' | xargs -0 du -hs
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
find directory -maxdepth 1 -type f  | xargs ls -l | awk 'BEGIN { SUM=0} { SUM+=$5 } END { print SUM/2^20 }'
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0 cat | grep -v "^ *$" | grep -v "^ *//" | grep -v "^ */\*.*\*/" | wc -l
```

### Find files changed between dates defined by ctime of two files specified by name
```sh
find . -cnewer <file a> -and ! -cnewer <file b>
```

### find only current directory (universal)
```sh
find . \( ! -name . -prune \) \( -type f -o -type l \)
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name "*.gz" | while read line ; do gunzip to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done
```

### find xargs mv
```sh
find . -iname "*.mp4" -print0 | xargs -0 mv verbose -t /media/backup/
```

### which procs have $PATH_REGEX open?
```sh
find /proc -regex '/proc/[0-9]+/smaps' -exec grep -l "$PATH_REGEX" {} \; | cut -d'/' -f2
```

### Build an exhaustive list of maildir folders for mutt
```sh
find ~/Maildir/ -mindepth 1 -type d | egrep -v '/cur$|/tmp$|/new$' | xargs
```

### Checks the syntax of all PHP files in and below the current working directory
```sh
find . -name "*.php" -exec php -l {} \; | sed -e "/^No syntax/d"
```

### find large files
```sh
find . -type f -size +1100000k |xargs -I% du -sh %
```

### List all duplicate directories
```sh
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'
```

### Recursively replace a string in files with lines matching string
```sh
find . -type f |xargs -I% sed -i '/group name/s/>/ deleteMissing="true">/' %
```

### move contents of the current directory to the parent directory, then remove current directory.
```sh
find . ! -name "." -print0 | xargs -0 -I '{}' mv -n '{}' ..; rmdir "$PWD"
```

### How to estimate the storage size of all files not named *.[extension] on the current directory
```sh
find . -maxdepth 1 -type f -not -iname '*.jpg' -ls |awk '{TOTAL+=$7} END {print int(TOTAL/(1024^2))"MB"}'
```

### Remove all .svn folders
```sh
find . -name .svn -type d |xargs rm -rf
```

### search for text in files. recursive.
```sh
find /name/of/dir/ -name '*.txt' | xargs grep 'text I am searching for'
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f | grep -o '\.[^./]*$' | sort | uniq
```

### Delete Empty Directories
```sh
find . -type d -exec rmdir {} \;
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort | uniq
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . ! -type d -exec chmod -x {}\;
```

### Create full backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -czf $destdir/"$tarfile"_full.tgz -P $d; done
```

### Create incremental backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir"; tar -czvf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### Directory Tree
```sh
find . -type d -print | sed -e 's;[^/]*/;..........;g'|awk '{print $0"-("NR-1")"}'
```

### Use find to get around Argument list too long problem
```sh
find . -name 'junkfiles-*' -print0 | xargs -0 rm
```

### Find corrupted jpeg image files
```sh
find . -name "*jpg" -exec jpeginfo -c {} \; | grep -E "WARNING|ERROR"
```

### Replicate a directory structure dropping the files
```sh
find . -type d -print0 | (cd $DESTDIR; xargs -0 mkdir)
```

### Find files in multiple TAR files
```sh
find . -type f -name "*.tar" -printf [%f]\\n -exec tar -tf {} \; | grep -iE "[\[]|<filename>"
```

### find matching wholename example
```sh
find -wholename "*/query/*.json"
```

### Summarize size of all files of given type in all subdirectories (in bytes)
```sh
find . -iname '*.jpg' -type f -print0 |perl -0 -ne '$a+=-s $_;END{print "$a\n"}'
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $* | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Print names of all video files encoded with h264
```sh
find -type f -exec bash -c 'if ffmpeg -i "{}" 2>&1 | grep -qi h264 ; then echo "{}"; fi' \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -name '*.mp3' -type f -exec sh -c 'exec cp -f "$@" /home/user/dir' find-copy {} +
```

### increase recurively the modification time for a list of files
```sh
find . -type f | while read line; do NEW_TS=`date -d@$((\`stat -c '%Y' $line\` + <seconds> )) '+%Y%m%d%H%M.%S'`; touch -t $NEW_TS ${line}; done
```

### Periodic Log Deletion
```sh
find /path/to/dir -type f -mtime +[#] -exec rm -f {} \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -type f -iname '*.mp3' -exec cp {} ~/mp3/ \;
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b |while read L; do lvextend -m 1 $L /dev/disk/<disk> ; done
```

### Search specified $TEXT1 and Replace that by specified arg ($TEXT2)
```sh
find "$DIR" -regex "$FILENAME" -type f -print0 | xargs -0 sed -i _`date "+%y%m%d%H%M%S"` -E "s/$TEXT1/$TEXT2/g"
```

### List files older than one year, exluding those in the .snapshot directory
```sh
find /path/to/directory -not \( -name .snapshot -prune \) -type f -mtime +365
```

### Archive all files that have not been modified in the last days
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' -exec grep -H "string" {} \;
```

### Use -t when using find and cp
```sh
find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%-30s'\t\"%h/%f\"\n" | sort -rn -t$'\t' | uniq -w30 -D | cut -f 2 -d $'\t' | xargs md5sum | sort | uniq -w32 all-repeated=separate
```

### Link a deep tree of files all into on directory
```sh
find /deep/tree/ -type f -print0|xargs -0 -n1 -I{} ln -s '{}' .
```

### Arguments too long
```sh
find . -name "*.txt" -exec WHATEVER_COMMAND {} \;
```

### Recursive replace of directory and file names in the current directory.
```sh
find . *oldname* | grep oldname | perl -p -e 's/^(.*)(oldname)(.*$)/mv $1$2$3 $1newname$3/' | sh
```

### Find broken symlinks
```sh
find . -type l ! -exec test -e {} \; -print
```

### find files ignoring .svn and its decendents
```sh
find . -type f ! -iwholename \*.svn\* -print0 [ | xargs -0 ]
```

### Find class in jar
```sh
find . -name '*.jar' | xargs -l jar vtf | grep XXX.java
```

### find files ignoring .svn and its decendents
```sh
find . -type d -name .svn -prune -o -type f -print0 | xargs -r0 ...
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'
```

### Cleanup firefox's database.
```sh
find ~/Library/Application\ Support/Firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Use md5sum to check your music and movie files. Also use diff.
```sh
find . -type f -exec md5sum {}\; > <filename>
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -depth -print -execdir rename -f 'y/A-Z/a-z/' '{}' \;
```

### Bulk renames with find, sed and a little escaping
```sh
find . -exec bash -c "mv '{}' '\`echo {} |sed -e 's/foo/bar/g'\`"' \;
```

### find which of the zip files contains the file you're searching for
```sh
find . -iname '*.zip' | while read file; do unzip -l "$file" | grep -q [internal file name] && echo $file; done
```

### find with high precission (nanoseconds 1/1,000,000,000s) the last changed file.
```sh
find . -type f -print0 | xargs -0 stat -c '%y %n' | sort -n -k 1,1 -k 2,1 | awk 'END{print $NF}'
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -type f -name "*.pyc" -delete;
```

### move all files older than 60 days to a folder
```sh
find ./* -mtime +60 -exec mv {} storeFolder \;
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -exec grep -i <pattern> \;
```

### Quick HTML image gallery from folder contents
```sh
find . -iname '*.jpg' -exec echo '<img src="{}">' \; > gallery.html
```

### Print a list of all hardlinks in the working directory, recursively
```sh
find . -type f -a \! -links 1
```

### find and reduce 8x parallel the size of JPG images without loosing quality via jpegoptim
```sh
find  /var/www/ -type f -name '*.[jJ][pP][gG]' -print0 | xargs -n 1 -P 8 -0 jpegoptim strip-all preserve preserve-perms quiet
```

### Prints the latest modified files in a directory tree recursively
```sh
find . -name '*pdf*' -print0 | xargs -0 ls -lt | head -20
```

### Clone /
```sh
find . -path ./mnt -prune -o -path ./lost+found -prune -o -path ./sys -prune -o -path ./proc -prune -o -print | cpio -pumd /destination && mkdir /destination/mnt/ && mkdir /destination/proc && mkdir /destination/sys
```

### Delete more than one month old thumbnails from home directory
```sh
find  ~/.thumbnails/ -type f -atime +30 -print0 | xargs -0 rm
```

### recursive transform all contents of files to lowercase
```sh
find . -type f -print0 | xargs -0 perl -pi.save -e 'tr/A-Z/a-z/'
```

### Copy files from multiple directories into one directory
```sh
find <start directory> -iname "<all my files type>" -exec cp {} <target_dir> \;
```

### find file/dir by excluding some unwanted dirs and filesystems
```sh
find . -xdev -path ./junk_dir -prune -o -type d -name "dir_name" -a -print
```

### Make a statistic about the lines of code
```sh
find . -type f -name "*.c" -exec cat {} \; | wc -l
```

### Find and copy files from subdirectories to the current directory
```sh
find ./ -iname '*avi' -exec cp  {} ./ \;
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -exec stat -c%s {} \; | awk '{total += $1} END {print total}'
```

### finding cr-lf files aka dos files with ^M characters
```sh
find . -type f -exec fgrep -l $'\r' "{}" \;
```

### Create a tar of directory structure only
```sh
find . -type d|xargs tar rf ~/dirstructure.tar no-recursion
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List movie size in current directory
```sh
find . -regex '\(.*mp4\|.*mpg\|.*mpeg\|.*mov\|.*wmv\|.*mkv\|.*avi\)' -exec exiftool -directory -fileName -imageSize {} \;
```

### Move lots files with AWK
```sh
find . -maxdepth 1 -type f | awk 'BEGIN { c=0 } { if( c == <quantity_at_a_time> ) { print l; l=$0; c=1 } else { if( l != "") { l=l" "$0 } else { l=$0 }; c++}} END { print l }' | xargs mv -t <dir_dest>
```

### remove files that were modified 30 days ago
```sh
find . -mtime +30 -type f -exec rm -rf {} \;
```

### List all files in current dir and subdirs sorted by size
```sh
find . -printf "%s %p\n" | sort -n
```

### To remove all *.swp files underneath the current directory
```sh
find . -name \*.swp -type f -delete
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -exec du -ch {} + | tail -n1
```

### Install an entire folder of .apk files to your android device thru adb
```sh
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;
```

### play all mp4 files on home directory
```sh
find ~ -name '*.mp4' | xargs mplayer
```

### Search recursive all docx files for SearchTerm and print its name
```sh
find . -name '*docx'  -exec sh -c "unzip -p {} word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g' | grep -i SearchTerm -q && echo {} " \;
```

### Find files of particular size in a directory
```sh
find . -size +10240k -exec stat -c%s" "%n {} \; | sort -rn
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn
```

### Kill processes that have been running for more than a week
```sh
find /proc -user myuser -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
```

### Find removed files still in use via /proc
```sh
find -L /proc/*/fd -links 0 2>/dev/null
```

### Find core files
```sh
find . -type f -regex ".*/core.[0-9][0-9][0-9][0-9]$"
```

### Copy files (.pdfs in this case) from a directory hierarchy to a different directory, ignoring the original structure
```sh
find <source_directory> -name *.pdf -exec mv {} <destination_dir> \;
```

### Copying part of the files from one directory to another
```sh
find dir1 -maxdepth 1 -type f | head -100000 | xargs mv -t dir2/subdir
```

### Run git gc in all git repositories bellow .
```sh
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc aggressive; cd -; done
```

### Count number of javascript files in subdirectories
```sh
find  . -mindepth 2 -name "*.js" -type f |wc -l
```

### Remove all .svn directories recursively from a directory
```sh
find . -name '.svn' -type d | xargs rm -rf
```

### If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output
```sh
find /path/to/search/directory -exec grep -Hn "pattern" {} \;
```

### Compile all gettext source files
```sh
find ./i18n -name "*.po" | while read f; do msgfmt $f -o ${f%.po}.mo; done
```

### Summarize total storage used by files obtained by a find command
```sh
find /path/to/archive/?/??/??? -mtime -7 -name "*.pdf" | xargs stat -c "%s"| awk '{sum +=$1}END{printf("%0.0f\n",sum)}'|sed -r ':Label;s=\b([0-9]+)([0-9]{3})\b=\1,\2=g;t Label'
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
```

### Display PHP files that directly instantiate a given class
```sh
find . -name "*.php" -exec grep \-H "new filter_" {} \;
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
find . -maxdepth 1 -type f -size +1M -printf "%f:%s\n" | sort -t":" -k2
```

### Count and show duplicate file names
```sh
find . -type f  |sed "s#.*/##g" |sort |uniq -c -d
```

### Find logs modified in the last 15 minutes
```sh
find /var/log -wholename "*.log" -mmin -15
```

### touch every file in current folder and subfolder
```sh
find . -type f -exec touch "{}" \;
```

### Search for a string in all files recursively
```sh
find . -type f | xargs grep <keyword>
```

### List only directories, one per line
```sh
find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n"
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do echo "### $line "; unzip -l $line; done | grep "^###\|you-string" |less
```

### Find the files that contain a certain term
```sh
find /path/to/dir -type f -exec grep \-H "search term" {} \;
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate; }
```

### find file(s) on disk
```sh
find / -name 'tofind.sh' 2>/dev/null
```

### find . -name "*.txt" | xargs sed -i "s/old/new/"
```sh
find . -name "*.txt" | xargs sed -i "s/old/new/"
```

### list with full path
```sh
find $(pwd) -maxdepth 1 -name "*" -printf "%p\n"
```

### Identify Movies and TV Series using find and regex
```sh
find . -type f -regextype posix-extended -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$'
```

### Find Movies but NOT TV Series using find and regex
```sh
find . -type f -regextype posix-extended ! -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$' \( -iname "*.mkv" -or -iname "*.avi"-or -iname "*.srt" \)
```

### Extract every parted-files which had the same password
```sh
find . -name '*.part1.rar' -exec unrar e \{\} -pPASSWORD \;
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -and -printf "%f\n" | egrep -io '\.[^.]*$' | sort | uniq -c | sort -rn
```

### in current directory delete all files with ending
```sh
find . -name "*.bak" -type f -delete
```

### change current directory permissions and only sub-directories recursively (not files)
```sh
find . -type d -exec chmod XXXX {} \;
```

### add a particular track to a playlist by looking for a part of its file name
```sh
find `pwd` -iname *SEARCH_STRING* >> ~/PLAYLIST_NAME.m3u
```

### Print duplicate files
```sh
find . -type f -print0 | xargs -0 -n1 md5sum | sort -k 1,32 | uniq -w 32 -d all-repeated=separate | sed -e 's/^[0-9a-f]*\ *//;'
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {} {}.bak \;
```

### Parallel recursive convert files to other format and move them in another directory
```sh
find $(pwd) -type f -not -path '*/\.*' -iname '*.tif' -print0| xargs -0 -n1 -P4 -I{} bash -c 'X="{}"; Y=${X##*/}; convert "$X" -resize 1920x1080 -density 72" newpath/${Y%.*}.jpg"'
```

### File count into directories
```sh
find / -type d | while read i; do ls $i | wc -l | tr -d \\n; echo " -> $i"; done | sort -n
```

### list all files modified in the last 24 hours descending from current directory
```sh
find . -type f -mtime -1 \! -type d -exec ls -l {} \;
```

### Pretty print all of the Linux vm sysctls for your viewing pleasure
```sh
find /proc/sys/vm -maxdepth 1 -type f | while read i ; do printf "%-35s\t%s\n" "$i" "$(<$i)" ; done | sort -t/ -k4
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -print0|xargs -0 rm
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {}{,.bak} \;
```

### Count the number of lines of code, returns total
```sh
find . \( -iname '*.cpp' -o -iname '*.h' \) -exec wc -l {} \; | sort -n | cut delimiter=.  -f 1 | awk '{s+=$1} END {print s}'
```

### Archive every file in /var/logs
```sh
find /var/logs -name * | xargs tar -jcpf logs_`date +%Y-%m-%e`.tar.bz2
```

### Count files created by date/modification
```sh
find . -type f -exec stat \{\} \; | grep Modify: | awk '{a[$2]++}END{for(i in a){print i " : " a[i] }}' | sort
```

### Find corrupted jpeg image files
```sh
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c
```

### list all file extensions in a directory
```sh
find . -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' -exec rm -r {} \;
```

### Recursive find and replace in h an cpp files
```sh
find . -name "*.h" -o -name "*.cpp" | xargs sed -i 's/addVertexes/addVertices/g'
```

### Compile all .less files to .css
```sh
find *.less | xargs -I {} lessc {} {}.css && ls *.less.css | sed -e 'p;s/less.css/css/' | xargs -n2 mv
```

### gzip only that files that are not gzipped and are not open by any process
```sh
find -type f ! -name "*.gz" ! -exec fuser -s {} ';' -exec gzip {} \;
```

### Find all files in path2 that do not have a symbolic link in path1 or any of its subdirectories
```sh
find /path1 -type l -exec readlink -f {} \;  > links.txt && find /path2 -type f > files.txt && grep -Fxv -f links.txt files.txt
```

### Sum file sizes of found files
```sh
find . -mtime +30 -exec ls -all "{}" \; | awk '{COUNTER+=$5} END {SIZE=COUNTER/1024/1024; print "size sum of found files is: " SIZE "MB"}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -not -empty -printf "%-25s%p\n"|sort -n|uniq -D -w25|cut -b26-|xargs -d"\n" -n1 md5sum|sed "s/  /\x0/"|uniq -D -w32|awk -F"\0" 'BEGIN{l="";}{if(l!=$1||l==""){printf "\n%s\0",$1}printf "\0%s",$2;l=$1}END{printf "\n"}'|sed "/^$/d"
```

### Find the source file which contains most number of lines in your workspace
```sh
find -name "*.<suffix>" -exec wc -l "{}" \; | sort -n | tail
```

### Simple find
```sh
find / -name '*android*' 2>errors.txt
```

### Find and rename
```sh
find . -name "booyah" -exec rename booyah booyah.disabled {} \;
```

### find and copy any format of file
```sh
find /directory/of/search -name "*.png" type -f -exec cp '{}' /path/to/copy/ ';'
```

### How to delete all the archive files with extension *.tar.gz and greater than 10MB?
```sh
find / -type f -name *.tar.gz -size +10M -exec ls -l {} \;
```

### deleter
```sh
find . ! -size 0c -mtime +1 -type f -delete
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec ls -shS {} + | head -10
```

### How to archive all the files that are not modified in the last x number of days?
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Permissions change on all files in current directory
```sh
find . -type f -exec chmod 644 {} \;
```

### Rekursive Grep on Solaris or AIX Systems without GNU egrep -r funcionality
```sh
find . -type f -exec awk '/linux/ { printf "%s %s: %s\n",FILENAME,NR,$0; }' {} \;
```

### rename all dirs with "?" char in name
```sh
find . -type d -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find supported dependency manager manifests
```sh
find /srv/code -maxdepth 4 -type f -regex ".*\(\(package\|composer|npm\\|bower\)\.json\|Gemfile\|requirements\.txt\\|\.gitmodules\)"
```

### Move items from subdirectories to current directory
```sh
find -type f -exec mv {} . \;
```

### rsync + find
```sh
find . -name "whatever.*" -print0 | rsync -av files-from=- from0 ./ ./destination/
```

### Change permissions for all files in the current directory
```sh
find ./ -type f | xargs sudo chmod 644
```

### deleter
```sh
find -type f -size +0 -mtime +1 -print0|xargs -0r rm -f
```

### Change permission for all directories inside the current one
```sh
find site/ -type d | xargs sudo chmod 755
```

### Remove UTF-8 Byte Order Mark BOM
```sh
find . -type f -regex '.*html$' -exec sed -i 's/\xEF\xBB\xBF//' '{}' \;
```

### Recursively remove "node_modules" directories
```sh
find . -name "node_modules" -exec rm -rf '{}' \;
```

### Create a tar archive with cpio containing a set of files
```sh
find path -name '*' -type f | cpio -ov -H ustar -F txtarchive.tar
```

### Size for all directories inside the current one
```sh
find . -type d -maxdepth 1 | xargs du -sh
```

### find only current directory (universal)
```sh
find /some/directory/* -prune -type f -name *.log
```

### find files that have been modified recently
```sh
find /target_directory -type f -mmin -60 mindepth 2
```

### can look for large files taking up disk spaces using the cmd
```sh
find / -type f -size +500M 2>/dev/null | xargs du -h | sort -nr
```

### replace old htaccess php AddHandler values with new one
```sh
find /var/www/ -type f -name ".htaccess" -exec perl -pi -e 's/AddHandler[\s]*php(4|5)-cgi/AddHandler x-httpd-php\1/' {} \;
```

### Make a statistic about the lines of code
```sh
find . -name \*.c | xargs wc -l | tail -1 | awk '{print $1}'
```

### Create a tar archive with pax containing a set of files
```sh
find path -name '*' -type f  | pax -wd > txtarchive.tar
```

### find command usage
```sh
find /pentest/ -type f -iname "*trace*"
```

### Create a zip file ignoring .svn files
```sh
find . -not \( -name .svn -prune \) -type f | xargs zip XXXXX.zip
```

### find usage
```sh
find /etc/ /pentest/ -type f -iname "*sql*" | grep map
```

### Find files modified in the last N days; list sorted by time
```sh
find . -type f -mtime -14 -exec ls -ltd \{\} \; | less
```

### copying data with cpio
```sh
find  ./source  -depth -print | cpio -cvo> /destination/source_data.cpio; cd /destination; cpio -icvmdI ./source_data.cpio; rm -rf ./source_data.cpio
```

### Search entire web server for preg_replace /e based php malware.
```sh
find / -name \*.php -exec grep -Hn preg_replace {} \;|grep /e|grep POST
```

### Lower jpg quality
```sh
find -type f -name '*.jpg' -exec mogrify -quality 70% '{}' \;
```

### find all file larger than 500M
```sh
find / -type f -size +548576 -printf "%s:%h%f\n"
```

### Generate SHA1 hash for each file in a list
```sh
find . -regex ".*\(avi\|mp4\|wmv\)$" -print0 | xargs -0 sha1sum
```

### Search entire server for Q4 2015 obfuscated PHP malware of unknown origin.
```sh
find / -name \*.php -exec grep -Hn .1.=.......0.=.......3.=.......2.=.......5.= {} \;
```

### Recursively change permissions on directories, leave files alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {} +
```

### List and delete files older than one year
```sh
find <directory path> -mtime +365 -and -not -type d -delete
```

### Convert .wma files to .ogg with ffmpeg
```sh
find -name '*wma' -exec ffmpeg -i {} -acodec vorbis -ab 128k {}.ogg \;
```

### Find recursively, from current directory down, files and directories whose names contain single or multiple whitespaces and replace each such occurrence with a single underscore.
```sh
find  ./  -name '*'  -exec  rename  's/\s+/_/g'  {}  \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec du -sh {} + | sort -hr | head
```

### find . -name "*" -print | xargs grep -s pattern
```sh
find . -name "*" -print | xargs grep -s pattern
```

### Recursively unzip archives to their respective folder
```sh
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
```

### Remove all directories less than 1 MB in size in or below current directory
```sh
find . -type d -execdir du -sh '{}' ';' | grep -E "[0-9]+K" | sed 's/^[0-9\.]\+K[\t ]\+//' | tr "\n" "\0" | xargs -0 rm -rf
```

### show how much diskspace all images in a given directory need
```sh
find /home/bubo/ -type f \( -iname \*.jpg  -print0 , -iname \*.png  -print0 , -iname \*gif -print0 \)  |  du -cm  files0-from - | tail -1
```

### find specified directory and delete it recursively including directories with spaces
```sh
find . -name "directory_name" -type d -print0 | xargs -0 -i rm -rf {}
```

### find . -type f -exec grep -ils stringtofind {} +
```sh
find . -type f -exec grep -ils stringtofind {} +
```

### Recursively delete all files of a specific extension
```sh
find . -name "*.bak" -type f -delete
```

### find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```sh
find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```

### Uses ffmpeg to convert all that annoying .FLAC files to MP3 files keeping all the Artist's information in them.
```sh
find . -name "*.flac" -exec ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;
```

### grep selectively
```sh
find /path -name \*.php -user nobody -exec grep -nH whatever {} \;
```

### List files and sizes
```sh
find / -type f -exec wc -c {} \; | sort -nr | head -100
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} +
```

### find pictures and renames them appending the containing folder name
```sh
find <folder> -type f -name '*.jpg' -exec bash -c 'ext="${0##*.}";path="$(dirname "$0")";name="$(basename "$0"|sed "s/.jpg//")";folder="$(dirname "$0"|tr / \\n |tail -1)";new="${path}/${name}_${folder}.${ext}"; mv "$0" "${new}"' {} \;
```

### Delete Empty Files
```sh
find . -size 0c -print -exec rm -f {} \;
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0  wc -l | tail -1
```

### Print bitrate of each audio file
```sh
find . -print0 | xargs -0 -I{} ffmpeg -i "{}" 2>&1 | grep "kb\/s\|Input"
```

### Search and install true type fonts under user home directory
```sh
find ~ -name "*.ttf" -exec cp {} /usr/share/fonts/truetype \; & fc-cache -f
```

### Find every directory with too many files and subdirectory.
```sh
find / -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n
```

### Converts Character Set of Files in a Folder
```sh
find . -iregex ".+\.\(c\|cpp\|h\)" | xargs -I{} perl -e "system(\"iconv -f SHIFT_JIS -t UTF-8 {} > temp; mv temp {} \");"  ;
```

### Check for orphaned python files
```sh
find /usr/lib/python* -regextype posix-extended ! \( -type f -regex '.*.(pyc|pyo)' -prune -o -print \) | qfile -o -f -
```

### Find and replace text within all files within a directory
```sh
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'
```

### Batch rename and number files
```sh
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash
```

### Listing all your bundles Entities files to issue a doctrine:generate:entities
```sh
find ./src -type d -name "Entity" | xargs ls -A | cut -d . -f1 | sed 's_^_app/console doctrine:generate:entities YourOwnBundleName:_'
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -print0 | xargs -0 rm
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -size 0c -delete
```

### Find all files larger than 500M and less than 1GB
```sh
find / -type f -size +500M -size -1G
```

### list files not owned by any user or group
```sh
find / -nouser -o -nogroup -print
```

### Count occurrences of a word/token in a file
```sh
find . -name file.txt | xargs -e grep "token" -o | wc -l
```

### Erase empty files
```sh
find . -size 0 -exec rm '{}' \;
```

### Check if zip files from current directory are good
```sh
find . -maxdepth 1  -name "*.zip" -exec unzip -tqq {} \;
```

### How to exclude all "permission denied" messages from "find"
```sh
find <paths> ! -readable -prune -o <other conditions like -name> -print
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort | uniq -d | parallel find -type f -size {}c | parallel md5sum | sort | uniq -w32 all-repeated=separate
```

### List cassandra snapshots by date
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -printf "%Ty-%Tm-%Td  %p\n" | sort
```

### Use a variable in a find command.  Useful in scripting.
```sh
find . -iname \*${MYVAR}\* -print
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;
```

### Use a variable in a find command.  Useful in scripting.
```sh
find "$1" -iname "*$2*"
```

### remove files of a specific size
```sh
find . -size 1400c -exec rm {} \;
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -name *.mp3 | grep "andy" > ~/mylist
```

### get newest file in current directory
```sh
find . -maxdepth 1 -printf '%A@\t%p\n' | sort -r | cut -f 2,2 | head -1
```

### List used Perl libraries in Perl project
```sh
find . -type f \( -name '*.pm' -o -name '*.pl' \) | xargs grep "^use " | cut -d : -f2 | sort | uniq
```

### recursively change file name extensions
```sh
find . -type f -name \*.c | while read f; do mv $f "`basename $f .c`".C; done
```

### Graphical tree of sub-directories
```sh
find . -type d |sed 's:[^-][^/]*/::g; s:^-: |:'
```

### show 20 last modified files in current directory including subdirectories
```sh
find . -type f -printf "%T@ %Tc %p\n" |sort -n |cut -d' ' -f2- |tail -n20
```

### get md5sum for all files, skipping svn directories
```sh
find $1 -not -iwholename "*.svn*" -type f | xargs md5sum | awk '{print $2 "\t" $1}'
```

### Count files by extension
```sh
find . -type f | sed -n 's/..*\.//p' | sort -f | uniq -ic
```

### Recreate md5 checksum files for files in folder and subfolders
```sh
find . -type f \! -name "*.md5" -exec sh -c 'md5sum "$1" > $1.md5'  {} \;
```

### bzip2 all files in a directory older than 1 week (nicely)
```sh
find /logdir -type f -mtime +7 -print0 | xargs -0 -n 1 nice -n 20 bzip2 -9
```

### Parallel copy - Faster copy
```sh
find Files/ -type d  | parallel  'mkdir -p /BKP/{}' && find Files/ -type f  | parallel 'rsync -a {} MKD/$(dirname {})'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ -exec grep -ni phrase {} +
```

### Find directory by name
```sh
find . -type d -name '.svn' -ls
```

### Find files with size over 100MB and output with better lay-out
```sh
find ./ -type f -size +100000k -exec ls -lh {} \; 2>/dev/null| awk '{ print $8 " : " $5}'
```

### List empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -print
```

### Show sizes and calculate sum of all files found by find
```sh
find -name *.bak -print0 | du -hc files0-from=-
```

### I use this find command example to find out all the executable files
```sh
find . -perm 777 ?print
```

### Find pictures excepting a path
```sh
find . \( -not -path "./boost*" \) -type f \( -name "*.jpg" -or -name "*.png" -or -name "*.jpeg" \)  2>/dev/null
```

### Count total running time for all media files in your directory
```sh
find -type f -exec ffprobe -i "{}" -show_entries format=duration -v quiet -of csv="p=0" \; | paste -sd+ | bc
```

### Calculate the size in MB of all files of a certain extension
```sh
find . -type f -iname '*.msh' -exec ls -lG {} \; | awk '{total = total + $4}END{print "scale=2;" total "/2^20"}' | bc
```

### Find all FAT-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>|\+|\[|\])"
```

### List recursively only empty folders on present dir
```sh
find ./ -empty -type d -print
```

### Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
```sh
find . -name *js -type f | xargs yardstick | sort -k6 -n
```

### Find all NTFS-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>)"
```

### Find lines of code (LOC) of a filetype in a project.
```sh
find . -type f -name "*.py" -exec wc -l {} \; | awk '{ SUM += $1} END {print SUM }'
```

### Find all e-mails older than 7 days in the queue and delete them
```sh
find /var/spool/mqueue -type f -mtime +7 | perl -lne unlink
```

### Delete all files in a folder that don't match a certain file extension
```sh
find . -type f ! -name "*.foo" -name "*.bar" -delete
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -name "*.sh" -exec chmod u+x {} \;
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -exec file '{}' + | grep shell | awk -F':' '{print $1}' | xargs chmod u+x
```

### count all the lines of code in a directory recursively
```sh
find . -name '*.php' | xargs wc -l
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} \;
```

### mv argument list too long
```sh
find $_SOURCE -type f -name '*' -exec mv {}  $_DESTINATION \;
```

### displays comments from random jpeg files.
```sh
find ~/random_jpegs/folder -name "*.jpg" -exec rdjpgcom {} \;
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find ./ -type f -exec sh -c 'echo "{}" "$(dirname "{}")/$(basename "{}" | tr "[A-Z]" "[a-z]")"' \;
```

### find and delete empty dirs, start in current working dir
```sh
find . -type d -empty -delete
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -delete
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find -type f -name "*.avi" -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### find the biggest files recursively, no matter how many
```sh
find . -type f -printf '%20s %p\n' | sort -n | cut -b22- | tr '\n' '\000' | xargs -0 ls -laSr
```

### Busca archivos por el tipo de extension y los elimina.
```sh
find / -iname *.jpg exec rm -rf {} \;
```

### command for converting wav files to mp3
```sh
find . -iname "*wav" > step1 ; sed -e 's/\(^.*\)wav/\"\1wav\" \"\1mp3\"/' step1 > step2 ; sed -e 's/^/lame  /' step2 > step3 ; chmod +x step3 ; ./step3
```

### Find broken symlinks and delete them
```sh
find . -xtype l -delete
```

### Finds javascript lodash/underscore methods in source code
```sh
find . -name "*.js" | xargs grep -oh '_\.[^(]*' | sort | uniq
```

### Find and remove files
```sh
find / -name core | xargs /bin/rm -f
```

### remove a directory filled with too many files
```sh
find /SOME/PATH -type f -execdir rm -f {} \+
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) | xargs wc -l | sort -n
```

### search in all cpp / hpp files using egrep
```sh
find . \( -name "*cpp" -o -name "*hpp" \) -exec grep -Hn -E "043[eE]|70[Dd]7" \{\} \;
```

### Make a folder and everything in it world-viewable
```sh
find . -exec chmod o+rx {}\;
```

### Create etags file of .c, .cpp, and .h files in all subdirectories
```sh
find . -regex ".*\.[cChH]\(pp\)?" -print | etags -
```

### find all symlinks to a file
```sh
find -L / -samefile path/to/foo.txt
```

### Converts all jpg files to 75 quality.
```sh
find . -type f -name '*.jpg' -exec convert -quality 75 {} {} \;
```

### A command to find and replace text within conf files in a single directory.
```sh
find -type f -name '*.conf' -exec sed -Ei 's/foo/bar/' '{}' \;
```

### Returns top ten (sub)directories with the highest number of files
```sh
find . -type d | while read dir ; do num=`ls -l $dir | grep '^-' | wc -l` ; echo "$num $dir" ; done | sort -rnk1 | head
```

### For files owned by root only, change ownership to a non-privileged user.
```sh
find /path/to/dir -user root -exec chown [nonprivuser] {} \;
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find $PWD -type d | while read "D"; do cd "$D"; for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize;done ;done
```

### find all symlinks to a file
```sh
find / -lname path/to/foo.txt
```

### List files containing given search string recursively
```sh
find /path/to/dir -type f -print0 | xargs -0 grep -l "foo"
```

### Delete all ".svn" directories from current path (recursive)
```sh
find . -name ".svn" -exec rm -rf {} \;
```

### Delete/Archive easily old mails using find.
```sh
find . -path ".*/cur/*" -type f ! -newermt "1 week ago" -delete
```

### find and replace tabs for spaces within files recursively
```sh
find ./ -type f -exec sed -i 's/\t/  /g' {} \;
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec stat -f '%m %N' {} \; | sort -n
```

### print the first line of every file which is newer than a certain date and in the current directory
```sh
find . -type f -newer 201011151300.txt -exec head -1 {} \;
```

### rename files (in this case pdfs) numerically in date order
```sh
find . -name "*.pdf" -print0 | xargs -r0 stat -c %y\ %n | sort|awk '{print $4}'|gawk 'BEGIN{ a=1 }{ printf "mv %s %04d.pdf\n", $0, a++ }' | bash
```

### find something
```sh
find $SDIR -name '${f}.*' -mtime +$n -maxdepth 1 | xargs -n 10 rm -vf
```

### Get last changed revision to all eclipse projects in a SVN working copy
```sh
find . -iname ".project"| xargs -I {} dirname {} | LC_ALL=C xargs -I {} svn info {} | grep "Last Changed Rev\|Path" | sed "s/Last Changed Rev: /;/" | sed "s/Path: //" | sed '$!N;s/\n//'
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find . -name '*.epub' -exec sh -c 'a={}; ebook-convert $a ${a%.epub}.mobi still more options' \;
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG' -print0 | xargs -0 mogrify -resize 1024">" -quality 40
```

### catch all the txt files into a start_dir tree and copy them into a single end_dir
```sh
find start_dir -name *.txt | xargs -J % cp % end_dir/
```

### set create time using file name for files pulled from android camera
```sh
find . -type f -exec echo -n "touch -t \`echo " \; -exec echo -n {} \; -exec echo -n " | sed -E 's/.*([[:digit:]]{8})_([[:digit:]]{4})([[:digit:]]{2}).*/\1\2.\3/g'\` " \; -exec echo {} \; | sh
```

### covert m4a audio files to wav
```sh
find . -name '*.m4a' | xargs -I audiofile mplayer -ao pcm "audiofile" -ao pcm:file="audiofile.wav"
```

### Remove all .svn folders
```sh
find . -name .svn -print0 | xargs -0 rm -rf
```

### Get the total size (in human readable form) of all certain file types from the current directory
```sh
find . -name 'pattern'| xargs du -hc
```

### Find directories in pwd, get disk usage, sort results
```sh
find . -type d -d 1 -print0 | xargs -0 du -sm | sort -nr
```

### find *.lock files and delete
```sh
find -name *.lock |xargs rm -f
```

### List 50 largest source files in a project
```sh
find . -type f -name '*.pm' -printf '%6s %p\n' | sort -nr | head -n 50
```

### Get the total length of all videos in the current dir in H:m:s
```sh
find -type f -iregex '.*\.\(mkv\|mp4\|wmv\|flv\|webm\|mov\|dat\|flv\)' -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.[Jj][Pp][Gg]' -exec mogrify -resize 1024">" -quality 40 {} \;
```

### Command to rename multiple file in one go
```sh
find / -name "*.xls" -print0 | xargs -0  rename .xls .ods {}
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find -iname "*.pdf" -exec pdfinfo -meta {} \;|awk '{if($1=="Pages:"){s+=$2}}END{print s}'
```

### Remove hidden CVS merge helper files
```sh
find . -name ".#*" -exec rm {} \;
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -20
```

### dos2unix recursively
```sh
find . -type f -exec dos2unix {} +
```

### Find Files over 20Meg
```sh
find . -type f -size +20000k -print0 | xargs -0 du -h | awk -F"\t" '{printf "%s : %s\n", $2, $1}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -size +0 -printf "%-25s%p\n" | sort -n | uniq -D -w 25 | sed 's/^\w* *\(.*\)/md5sum "\1"/' | sh | sort | uniq -w32 all-repeated=separate
```

### Remove CVS root files under current directory
```sh
find . -name Root -print | xargs rm -f
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find -type f |while read a;do [ "`head -c3  "${a}"`" == $'\xef\xbb\xbf' ] && echo "Match: ${a}";done
```

### Recursively sort files by modification time through multiple directories.
```sh
find /test -type f -printf "%AY%Aj%AH%AM%AS-%h/%f\n" | sort -n
```

### Remove all node_module folders recursively
```sh
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
```

### Indent all the files in a project using emacs
```sh
find . -iname \*.c -or -iname \*.h -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### Convert all the png files in a directory to gif in parallel. Requires imagemagick.
```sh
find . -name "*.png" | xargs -I '{}' -P 4 mogrify -format gif '{}'
```

### Display directory hierarchy listing as a tree
```sh
find . -printf '%p\n' | perl -ne 'if( m/(.*)\/(.*)/ ) { $p = $1; $f = $2; $p =~ s/[^\/]/ /g; $p =~ s/\//|/g; print "$p/$f\n"; } elsif( m/(.*)/ ) { print "$1\n"; } else { print "error interpreting: \"$_\"\n"; }'
```

### Search and replace multiple files with substitution
```sh
find . -name "*.txt" | xargs -n 1 perl -pi -w -e "s/text([0-9])/other\$1/g;"
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | paste -sd+ | bc
```

### List all text files (exclude binary files)
```sh
find -type f | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Recursive chmod all *.sh files within the current directory
```sh
find ./ -name "*.sh" -exec chmod +x {} \;
```

### use the find command and have it not print trailing slashes
```sh
find * -maxdepth 0 -type d
```

### Find Duplicate Files (based on size, name, and md5sum)
```sh
find -type f -printf '%20s\t%100f\t%p\n' | sort -n | uniq -Dw121 | awk -F'\t' '{print $3}' | xargs -d '\n' md5sum | uniq -Dw32 | cut -b 35- | xargs -d '\n' ls -lU
```

### Search recursively to find a word in certain file types
```sh
find . -iname '*.conf' | xargs grep "searh string" -sl
```

### Add a newline to the end of a cpp file
```sh
find . -iname "*.cpp" -exec perl -ni -e 'chomp; print "$_\n"' {} \;
```

### Recursively remove all files in a CVS directory
```sh
find . -type f ! -path \*CVS\* -exec rm {} \; -exec cvs remove {} \;
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -delete
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively unrar into dir containing archive
```sh
find . -name '*.rar' -execdir unrar e {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### Modify all files newer than another file and touch them to a specific date.
```sh
find . -newer /tmp/foo -exec touch date "2011-12-12" {} \;
```

### find all c and cpp files except the ones in the unit-test and android subdirectories
```sh
find . ! -regex '.*/\(unit-test\|android\)/.*' \( -name '*.c' -o -name '*.cpp' \)
```

### Find .java files with high complexity (counting curly braces)
```sh
find src/ -name "*.java" | while read f; do echo -n "$f "; cat "$f" | tr -dc '{}'; echo; done | awk '{ print length($2), $1 }' | sort -n
```

### list with full path
```sh
find `pwd` -maxdepth 1 -exec ls color -d {} \;
```

### Find the top most 5 duplicate files in a folder
```sh
find -maxdepth 1 -type f -exec md5sum '{}' ';' | sort | uniq -c -w 33 | sort -gr | head -n 5 | cut -c1-7,41-
```

### Grep through the text of djvu files and format results
```sh
find ./ -iname "*.djvu" -execdir perl -e '@s=`djvutxt \"$ARGV[0]\"\|grep -c Berlekamp`; chomp @s; print $s[0]; print " $ARGV[0]\n"' '{}' \;|sort -n
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find /path/to/dir -iname "*.ext" -print0 | xargs -0 mplayer -really-quiet -cache 64 -vo dummy -ao dummy -identify 2>/dev/null | awk '/ID_LENGTH/{gsub(/ID_LENGTH=/,"")}{SUM += $1}END{ printf "%02d:%02d:%02d\n",SUM/3600,SUM%3600/60,SUM%60}'
```

### Find text in contents with multiple filename
```sh
find ./$(PATH) -name '*.h' -o -name '*.c' -type f | xargs grep color -E '*Data*'
```

### Remove files and show space freed
```sh
find . -link 1 -exec du {} -shc + -exec rm -v {} +
```

### find co-ordinates of a location
```sh
findlocation() {place=`echo $@`; lynx -dump "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | egrep "address|coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Find the main file :D
```sh
find . -name "*.cpp" -exec grep -Hn color=tty -d skip "main" {} \;
```

### collect fullcalib data
```sh
find . -name "fullcalib4.csv" -exec tail -n1 \{\} \; >>all.csv
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type f|while read f; do mv $f `echo $f |tr '[:upper:]' '[ :lower:]'`; done
```

### Sort file greater than a specified size  in human readeable format including their path and typed by color, running from current directory
```sh
find ./ -size +10M -type f -print0 | xargs -0 ls -Ssh1 color
```

### Find all files over 20MB and print their names and size in human readable format
```sh
find / -type f -size +20000k -exec ls -lh {} \; | awk  '{printf $9} {for (i=10;i<=NF;i++) {printf " "$i}} {print ": "$5}'
```

### Delete all files in folder without affecting load
```sh
find . -type f -exec echo echo rm {} '|' batch ';'|bash
```

### find and replace all directory sub directory
```sh
find ./ -type f -exec sed -i -e 's/k.a@tuta.io/aysadx@gmail.com/g' {} \;
```

### List all symbolic links in current directory
```sh
find . -maxdepth 1 -type l
```

### Recursively remove all empty directories
```sh
find . -type d | tac | xargs -I{} rmdir {} 2> /dev/null
```

### List files recursively sorted by modified time
```sh
find /home/fizz -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 775 {} \;
```

### Find Files Which Should Be Executable But Are Not
```sh
find . -type f ! -perm /u+x -printf "\"%p\"\n" | xargs file | grep -i executable
```

### Convert uppercase to lowercase extensions
```sh
find . -type f -name *.MP3 -print0 | xargs -0 -i rename .MP3 .mp3 {}
```

### Rename duplicate files created by GDrive
```sh
find . -name "*\(2\)*" -exec rename -s \ \(2\) '' -n {} +
```

### Tar (stripped paths) found files by regexp from <PATH>, then remove
```sh
find <PATH> -maxdepth 1 -type f -name "server.log*" -exec tar czPf '{}'.tar.gz transform='s|.*/||' '{}' remove-files \;
```

### List RPM packages installed in current tree
```sh
find $PWD -exec rpm query -f {} \; | sort -u | grep -v "not owned"
```

### Reorder file with max 100 file per folder
```sh
find files/ -type f | while read line; do if [ $((i++%100)) -eq 0 ]; then mkdir $((++folder)); fi; cp  $line $folder/; done
```

### Find files in current directory which are larger in size (500000k)
```sh
find . -type f -size +50000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### Ignore subdirectories in subversion
```sh
find . -type d -not \( -name .svn -prune \) -exec svn propset svn:ignore '*' {} \;
```

### get a random command
```sh
find $(echo "$PATH" | tr ':' ' ') -name "*program*"
```

### Keep from having to adjust your volume constantly
```sh
find . -iname \*.mp3 -print0 | xargs -0 mp3gain -krd 6 && vorbisgain -rfs .
```

### Convert the contents of a directory listing into a colon-separated environment variable
```sh
find . -name '*.jar' -printf '%f:'
```

### Backup files older than 1 day on /home/dir, gzip them, moving old file to a dated file.
```sh
find /home/dir -mtime +1 -print -exec gzip -9 {} \; -exec mv {}.gz {}_`date +%F`.gz \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -10
```

### Delete all Vagrant boxes
```sh
find $HOME -type d -name .vagrant | xargs -i% bash -c "pushd %; cd ..;vagrant destroy -f; popd"
```

### Find latest modified log
```sh
find . -name '*.log' | xargs ls -hlt > /tmp/logs.txt && vi /tmp/logs.txt
```

### Find and archive old, large files. Great for manually cleaning up logs when logrotate can't be used.
```sh
find . -type f -size +100M -mtime +30 -exec gzip {} \;
```

### Find inside specific file type function
```sh
findin() { find . -type f -name "*.$1" | xargs ack $2 }
```

### Play flash videos in  VLC
```sh
find -L /proc/`ps aux | grep [f]lash | awk '{print $2}'`/fd/ | xargs file -L | grep Video |  awk '{sub(/:/, ""); print $1}' | xargs vlc
```

### List all the unique extensions in a folder and print their count
```sh
find . -type f -print | awk -F'.' '{print $NF}' | sort | uniq -c
```

### Find last 50 modified files
```sh
find / -path /proc -prune -o -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort -r | head -50
```

### Recursive remove files by mask
```sh
find . -name ".DS_Store" -print0 | xargs -0 rm -rf
```

### Convert all your mp3 to ogg
```sh
find . -iname '*.mp3' | while read song; do mpg321 ${song} -w - | oggenc -q 9 -o ${song%.mp3}.ogg -; done
```

### Fixing maven POM messed up by a broken release.
```sh
find . -iname pom.xml -type f -exec bash -c "cat {} | sed s/1\.0\.46\-SNAPSHOT/1\.0\.48\-SNAPSHOT/g > {}.tmp " \; -exec mv {}.tmp {} \;
```

### Change permissions on a large number of directories quickly
```sh
find . -type d -print0 | xargs -0 chmod 0770
```

### Get MD5 checksum for directory
```sh
find -s web -type f -exec md5 -q {} \; | md5
```

### Replace + Find
```sh
find <mydir> -type f -exec rename 's/<string1>/<string2>/g' {} \;
```

### Preview All Files in Directory
```sh
find . -type f | xargs -I% bash -c 'echo -e "\033[31m%\033[0m" && [[ ! `file %` =~ .*binary.* ]] && head "%"'
```

### XZIP many catalogs
```sh
find . -type d |awk '$1 ~ /[0-9]/ {print $0}' |xargs -P 4 -I NAME tar remove-files -vcJf NAME.tar.xz NAME
```

### package most recent files in project
```sh
find ~/project -mtime -1 -type f -print | tar jcvf myfiles.tar.bz2 -T -
```

### find css or js files, minifiy with in-path-yuicompressor, gzip output, and save into <static-file>.gz
```sh
find -regextype posix-egrep -regex '.*\.(css|js)$' | xargs -I{} sh -c "echo '{}' && yuicompressor '{}' | gzip -c > '{}.gz'"
```

### CPIO better than TAR
```sh
find . -type f -name '*.sh' -print | cpio -o | gzip >sh.cpio.gz
```

### Delete all files matching a pattern
```sh
find . -name vmware-*.log -exec rm -i {} \;
```

### Recursively search a directory tree for all .php .inc .html .htm .css .js files for a certain string
```sh
find -type f -regex ".*\.\(js\|php\|inc\|htm[l]?\|css\)$" -exec grep -il 'searchstring' '{}' +
```

### find str in  in a directory which file extension is .php
```sh
find ./ -type f -name "*.php" | xargs grep -n "name" -r {}
```

### How many lines in your c project?
```sh
find . -type f -name *.[ch] -exec wc -l {} \;
```

### Find all symlinks that link to directories
```sh
find -type l -xtype d
```

### Find top 10 largest files in /var directory (including subdirectories)
```sh
find /var -type f -exec du -h {} \; | sort -rh | head -10
```

### find all files in the current directory matching name * and searching for a string "mystring". outputs all the filenames that contain the search string.
```sh
find . -name "*" | xargs grep "mystring"
```

### get disk usage sum for files of type
```sh
find . -name '*.xml' -type f -print | xargs du -ch
```

### Recursive replace of directory and file names in the current directory.
```sh
find -name '*oldname*' -print0 | xargs -0 rename 's/oldname/newname/'
```

### Loop over files found using 'find' (works with filenames that contain spaces)
```sh
find -name 'foo*' | while read i; do echo "$i"; done
```

### copy selected folder found recursively under src retaining the structure
```sh
find <src-path-to-search> -name "<folder-name>" | xargs -i cp -avfr parent {} /<dest-path-to-copy>
```

### pngcrush all .png files in the directory structure
```sh
find -f . png | while read line; do pngcrush -ow -brute $line; done
```

### sed replace in all files of directory
```sh
find ./ -type f -exec sed -i -e 's/apple/orange/g' {} \;
```

### Count music files in each directory
```sh
find . -type d -maxdepth 1 -print0 | xargs -0 -I{} sh -c 'find "{}" -type f | grep "ogg\|mp3\|wav\|flac$" | wc -l | tr -d "\n"; echo " {}"'
```

### How many lines in your PHP project without comments
```sh
find . -type f -name '*.php' | xargs cat | sed -re ':top /\/\*.*\*\// { s/\/\*.*\*\///g ; t top }; /\/\*/ { N ; b top }' | awk '$0 !~ /^[\t[:space:]]*($|(\/\/)|(#))/' | wc -l
```

### Find used fileextensions in a project
```sh
find . -type f | perl -ne 'chop(); $ext = substr($_, rindex($_, ".") + 1); print "$ext\n";' | sort | uniq count | sort -n
```

### optimize all png images
```sh
find . -name *.png | xargs optipng -nc -nb -o7 -full
```

### Find files older than X, using find.
```sh
find . -mtime +10
```

### Count total amount of code lines in a PHP Project (short version)
```sh
find . -type f -name "*.php" -exec wc -l {} +;
```

### find ip address in all files in /etc directory
```sh
find /etc -type f -print0 | xargs -r0 grep color '192.168.0.1'
```

### My random music player
```sh
find /home/user/M?sica/ -type f -name "*.mp3" | shuf head-count=20 output=/home/user/playlist.m3u ; sort -R /home/user/playlist.m3u | mplayer -playlist -
```

### Find given string in all files with given name or extension
```sh
find . -name "*.html" -exec grep -l 'string' {} \;
```

### Recursively remove all empty directories
```sh
find . -type d -empty -delete
```

### Copy all documents PDF in disk for your home directory
```sh
find / -name "*.pdf" -exec cp -t ~/Documents/PDF {} +
```

### find broken symbolic links
```sh
find -L . -type l
```

### Check all bash scripts in current dir for syntax errors
```sh
find . -name '*.sh' -exec bash -n {} \;
```

### List only the directories
```sh
find . -maxdepth 1 -type d | sort
```

### Search through files, ignoring .svn
```sh
find . -not \( -name .svn -prune \) -type f -print0 | xargs null grep <searchTerm>
```

### Move all files in subdirectories to current dir
```sh
find ./ -type f -exec mv {} . \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec rename "s/.JPG/.jpg/g" \{\} \;
```

### recurisvely md5 all files in a tree
```sh
find ./backup -type f -print0 | xargs -0 md5sum > /checksums_backup.md5
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -empty -delete
```

### Get a quick list of all user and group owners of files and dirs under the cwd.
```sh
find -printf '%u %g\n' | sort | uniq
```

### Convert all .flac from a folder subtree in 192Kb mp3
```sh
find . -type f -iname '*.flac' | while read FILE; do FILENAME="${FILE%.*}"; flac -cd "$FILE" | lame -b 192 - "${FILENAME}.mp3"; done
```

### Recursively search for large files. Show size and location.
```sh
find . -size +100000k -exec du -h {} \;
```

### recursive reset file/dir perms
```sh
find public_html/stuff -type d -exec chmod 755 {} + -or -type f -exec chmod 644 {} +
```

### Remove everything except that file
```sh
find . ! -name <FILENAME> -delete
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec env d="$dest_root" sh -c ' exec mkdir -p  "$d/$1"' '{}' '{}' \;
```

### Finding files with different extensions
```sh
find . -regex '.*\(h\|cpp\)'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i -H "search pharse" {} \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} \;
```

### find files in a date range
```sh
find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
```

### find .txt files inside a directory and replace every occurrance of a word inside them via sed
```sh
find . -name '*.txt' -exec sed -ir 's/this/that/g' {} \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec bash -c 'mv "$1" "${1/%.JPG/.jpg}"'  {} \;
```

### Advanced LS Output using Find for Formatted/Sortable File Stat info
```sh
find $PWD -maxdepth 1 -printf '%.5m %10M %#9u:%-9g %#5U:%-5G  [%AD | %TD | %CD]  [%Y] %p\n'
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 755 {} +
```

### Find all files of a type and copy them elsewhere while keeping intact their full directory structure using find and cpio
```sh
find . -iname "*.flac" | cpio -pdm /Volumes/Music/FLAC
```

### How many files in the current directory ?
```sh
find . -maxdepth 1 -type f | wc -l
```

### Skip over .svn directories when using the
```sh
find . -name .svn -prune -o -print
```

### Find dead symbolic links
```sh
find -L -type l
```

### Calculate md5 sums for every file in a directory tree
```sh
find . -type f -exec md5sum {} \; > sum.md5
```

### Monitor logs in Linux using Tail
```sh
find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
```

### List latest 5 modified files recursively
```sh
find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' | sort -nr | head -n 5 | cut -f2- -d" "
```

### find and delete empty directories recursively
```sh
find . -depth -type d -empty -exec rmdir -v {} +
```

### Remove empty directories
```sh
find . -type d -empty -delete
```

### Find today created files
```sh
find directory/ -mtime 0 -type f
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 | xargs rm -vf
```

### Find 'foo' string inside files
```sh
find . -type f -print | xargs grep foo
```

### Count the total number of files in each immediate subdirectory
```sh
find . -type f -printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn
```

### Search $PATH for a command or something similar
```sh
find ${PATH//:/ } -name \*bash\*
```

### Change string in many files at once and more.
```sh
find . -type f -exec grep -l XXX {} \;|tee /tmp/fileschanged|xargs perl -pi.bak -e 's/XXX/YYY/g'
```

### a find and replace within text-based files, to locate and rewrite text en mass.
```sh
find . -name "*.txt" | xargs perl -pi -e 's/old/new/g'
```

### Fix "broken" ID3 tags in the current directory and subdirectories
```sh
find -iname '*mp3' -exec mid3iconv {} \;
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \;
```

### find all file larger than 500M
```sh
find / -type f -size +500M
```

### Find last modified files in a directory and its subdirectories
```sh
find . -type f -print0 | xargs -0 stat -c'%Y :%y %12s %n' | sort -nr | cut -d: -f2- | head
```

### List files above a given threshold
```sh
find . -type f -size +25000k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
```

### Compress files found with find
```sh
find ~/bin/ -name "*sh" -print0 | xargs -0t tar -zcvf foofile.tar.gz
```

### Find files that are older than x days
```sh
find . -type f -mtime +7 -exec ls -l {} \;
```

### get the top 10 longest filenames
```sh
find | sed -e "s/^.*\///" | awk ' BEGIN { FS=""} { print NF "  " $0  } ' | sort -nrf | head -10
```

### Delete files older than..
```sh
find /dir_name -mtime +5 -exec rm {} \
```

### Find all the files more than 10MB, sort in descending order of size and record the output of filenames and size in a text file.
```sh
find . -size +10240k -exec ls -l {} \; | awk '{ print $5,"",$9 }'|sort -rn > message.out
```

### Change the ownership of all files owned by one user.
```sh
find /home -uid 1056 -exec chown 2056 {} \;
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f | parallel -j+0 grep -i foobar
```

### Find files and list them sorted by modification time
```sh
find -printf "%C@ %p\n"|sort
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} + | sort -n
```

### Find directories under home directory with 777 permissions, change to 755, and list them on console
```sh
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
```

### Remove all .svn folders
```sh
find . -depth -name .svn -type d -exec rm -fr {} \;
```

### Show drive names next to their full serial number (and disk info)
```sh
find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
```

### Find and copy scattered mp3 files into one directory
```sh
find . -iname '*.mp3' -type f -print0 | xargs -I{} -0 cp {} </path>
```

### Trick find -exec option to execute alias
```sh
find . -exec `alias foo | cut -d"'" -f2` {} \;
```

### Skip over .svn directories when using the "find" command.
```sh
find . -not \( -name .svn -prune \)
```

### copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
```sh
find . -printf "touch -m -d \"%t\" '%p'\n" | tee /tmp/retime.sh
```

### Finding all files on local file system with SUID and SGID set
```sh
find / \( -local -o -prune \) \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \;
```

### cleanup /tmp directory
```sh
find /tmp -type f -atime +1 -delete
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -executable -type f -printf "%f\n"
```

### Remove all the files except abc in the directory
```sh
find * -maxdepth 1 -type f ! -name abc -delete
```

### ShellCheck all the bash/sh script under a specific directory excluding version control
```sh
find .  -type f ! -path "./.git/*" -exec sh -c "head -n 1 {} | egrep -a 'bin/bash|bin/sh' >/dev/null" \; -print -exec shellcheck {} \;
```

### find files larger than 1 GB, everywhere
```sh
find / -type f -size +1000000000c
```

### Batch Convert SVG to PNG (in parallel)
```sh
find . -name \*.svg -print0 | xargs -0 -n1 -P4 -I{} bash -c 'X={}; convert "$X" "${X%.svg}.png"'
```

### Gzip files older than 10 days matching *
```sh
find . -type f -name "*" -mtime +10 -print -exec gzip {} \;
```

### Faster find and move using the find and xargs commands. Almost as fast as locate.
```sh
find . -maxdepth 2 -name "*somepattern" -print0 | xargs -0 -I "{}" echo mv "{}" /destination/path
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find . -type f | grep -rl $'\xEF\xBB\xBF'
```

### View all new log messages in real time with color
```sh
find /var/log -type f -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Count number of files in a directory
```sh
find . -maxdepth 1 -type f | wc -l
```

### tar and remove files which are older that 100 days
```sh
find . -type f -mtime +100 -exec tar rvf my.tar remove-files {} \;
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
find ./ -type f -name "*.txt" -exec tar uvf myarchives.tar {} +
```

### Speed up launch of firefox
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### Remove Backup Files
```sh
find / -name *~ -delete
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f -print0 | xargs -0 -P 4 -n 40 grep -i foobar
```

### fix broken permissions
```sh
find /path -type d -perm 777 -exec chmod 755 {} \;
```

### Recursively remove all subversion folders
```sh
find . -name .svn  -exec rm \-rf {} \;
```

### find external links in all html files in a directory list
```sh
find . -name '*.html' -print0| xargs -0 -L1 cat |sed "s/[\"\<\>' \t\(\);]/\n/g" |grep "http://" |sort -u
```

### Create md5sum of files under the current dir excluding some directories
```sh
find . -type d \( -name DIR1 -o -name DIR2 \) -prune -o -type f -print0 | xargs -r0 md5sum
```

### find all non-html files
```sh
find . -type f ! -name "*html"
```

### Remove all backup files in my home directory
```sh
find ~user/ -name "*~" -exec rm {} \;
```

### List files with full path
```sh
find $(pwd) -maxdepth 1
```

### Skip filenames with control characters, a.k.a tab,newline etc
```sh
find . ! -name "$(printf '*[\001-\037\177]*')"
```

### Find writable files
```sh
find -writable
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} +
```

### take a look to command before action
```sh
find /tmp -type f -printf 'rm "%p";\n'
```

### Grep only files matching certain pattern (Advanced)
```sh
find . -path "*/any_depth/*" -exec grep "needle" {} +
```

### Recursively remove .svn directories
```sh
find . -type d -name .svn -delete
```

### Recursively remove .svn directories from a local repository
```sh
find . -type d -name .svn -execdir rm -rf {} +
```

### Remove annoying OS X DS_Store folders
```sh
find . -name .DS_Store -exec rm {} \;
```

### Recursive cat - concatenate files (filtered by extension) across multiple subdirectories into one file
```sh
find . -type f -name *.ext -exec cat {} > file.txt \;
```

### Eliminate dead symlinks interactively in /usr/ recursevely
```sh
find /usr/ -type l ! -xtype f ! -xtype d -ok rm -f {} \;
```

### find largest file in /var
```sh
find /var -mount -ls -xdev | /usr/bin/sort -nr +6 | more
```

### Recursively Find Images, Convert to JPEGS and Delete
```sh
find . -name '*'.tiff -exec bash -c "mogrify -format jpg -quality 85 -resize 75% {} && rm {}" \;
```

### Print the 10 deepest directory paths
```sh
find . -type d | perl -nle 'print s,/,/,g," $_"' | sort -n | tail
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -delete
```

### check for write/read permissions
```sh
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null
```

### Size(k) of directories(Biggest first)
```sh
find . -depth -type d -exec du -s {} \; | sort -k1nr
```

### Find broken symlinks in the current directory and its subdirectories.
```sh
find -L -type l
```

### Find jpeg images and copy them to a central location
```sh
find . -iname "*.jpg" -print0 | tr '[A-Z]' '[a-z]' | xargs -0 cp backup=numbered -dp -u target-directory {location} &
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '($1 < 2048) {print $2}'
```

### Lists all directories under the current dir excluding the .svn directory and its contents
```sh
find . \( -type d -name .svn -prune \) -o -type d -print
```

### Add SVN keywords property to all PHP and Javascript files
```sh
find . \( -name "*.php" -o -name "*.js" \) -exec svn propset svn:keywords Id {} \;
```

### Write a shell script that removes files that contain a string
```sh
find -type f -exec grep -q "regexp" {} \; -delete
```

### bash find function
```sh
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }
```

### List only executables installed by a debian package
```sh
find $(dpkg -L iptables) -maxdepth 0 -executable -type f
```

### Coping files, excluding certain files
```sh
find ./ ! -name 'excludepattern' | xargs -i cp parents {} destdir
```

### Sum size of files returned from FIND
```sh
find [path] [expression] -exec du -ab {} \; | awk '{total+=$0}END{print total}'
```

### find . -name
```sh
find . -name "*.txt" -exec sed -i "s/old/new/" {} \;
```

### Convert encoding from cp1252 (MS Windows) to UTF-8 on source code files
```sh
find . -iname *.java -type f -exec bash -c "iconv -f WINDOWS-1252 -t UTF-8 {}  > {}.tmp " \; -exec mv {}.tmp {} \;
```

### files and directories in the last 1 hour
```sh
find ./* -ctime -1 | xargs ls -ltr color
```

### Find files modified since a specific date
```sh
find /path/to/somewhere -newermt "Jan 1"
```

### Generate a playlist of all the files in the directory, newer first
```sh
find . -type f -print0 | xargs -r0 stat -c %Y\ %n | sort -rn | gawk '{sub(/.\//,"",$2); print $2}' > /tmp/playlist.m3u
```

### Another way to calculate sum size of all files matching a pattern
```sh
find . -iname '*.jar' | xargs du -ks | cut -f1 | xargs echo | sed "s/ /+/g" | bc
```

### Show the disk usage for files pointed by symbolic link in a directory
```sh
find /usr/lib -maxdepth 1 -type l -print0  | xargs -r0 du -Lh
```

### Delete recursively only empty folders on present dir
```sh
find ./ -empty -type d -delete
```

### Convert all WMF images to SVG recursively ignoring file extension case
```sh
find . -type f -iname '*.wmf' | while read FILE; do FILENAME="${FILE%.*}"; wmf2svg -o ${FILENAME}.svg $FILE; done
```

### List commands with a short summary
```sh
find `echo "${PATH}" | tr ':' ' '` -type f | while read COMMAND; do man -f "${COMMAND##*/}"; done
```

### Counts number of lines
```sh
find . \( -name '*.h' -o -name '*.cc' \) | xargs grep . | wc -l
```

### Parallel mysql dump restore
```sh
find -print0 | xargs -0 -n 1 -P 4 -I {} sh -c "zcat '{}' | mysql nix"
```

### DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
```sh
find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00" if ($h eq $ph)'|xargs -0 rm -v 
```

### Find broken symlinks and delete them
```sh
find -L /path/to/check -type l -delete
```

### Give any files that don't already have it group read permission under the current folder (recursive)
```sh
find . -type f ! -perm /g=r -exec chmod g+r {} +
```

### Recursively lists all files in the current directory, except the ones in '.snapshot' directory
```sh
find . -wholename './.snapshot' -prune -o -print
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name \*.pdf -exec pdfinfo {} \; | grep Pages | sed -e "s/Pages:\s*//g" | awk '{ sum += $1;} END { print sum; }'
```

### Convert all files for iPhone with HandbrakeCLI
```sh
find . -name \*.avi -exec HandBrakeCLI -i "{}" -o "{}".iphone.mp4 preset="iPhone & iPod Touch" \;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf '{}' +
```

### Move all but the newest 100 emails to a gzipped archive
```sh
find $MAILDIR/ -type f -printf '%T@ %p\n' | sort reverse | sed -e '{ 1,100d; s/[0-9]*\.[0-9]* \(.*\)/\1/g }' | xargs -i sh -c "cat {}&&rm -f {}" | gzip -c >>ARCHIVE.gz
```

### Indent all the files in a project using emacs
```sh
find -iname \*.[ch] -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -delete
```

### Cleanup Python bytecode files
```sh
find . -name "*.py[co]" -exec rm -f {} \;
```

### Create incremental snapshots of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -g "$destdir"/"$tarfile".snar -czf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" | xargs grep "TODO"
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" -exec grep "TODO" {} +
```

### Replace + Find
```sh
find <mydir> -type f -exec sed -i 's/<string1>/<string2>/g' {} \;
```

### Find which jars contain a class
```sh
find . -name "*.jar" | while read file; do echo "Processing ${file}"; jar -tvf $file | grep "Foo.class"; done
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir/ -type f -exec rm {} +
```

### find and grep Word docs
```sh
find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;
```

### Show all symlinks
```sh
find ./ -type l -ls
```

### Cleanup firefox's database.
```sh
find ~/.mozilla/firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Find Duplicate Files (based on MD5 hash)
```sh
find -type f -exec md5sum '{}' ';' | sort | uniq all-repeated=separate -w 33 | cut -c 35-
```

### Find and display most recent files using find and perl
```sh
find $HOME -type f -print0 | perl -0 -wn -e '@f=<>; foreach $file (@f){ (@el)=(stat($file)); push @el, $file; push @files,[ @el ];} @o=sort{$a->[9]<=>$b->[9]} @files; for $i (0..$#o){print scalar localtime($o[$i][9]), "\t$o[$i][-1]\n";}'|tail
```

### Find all files with colons and replace with underscores; current directory and below (recursive).
```sh
find ./ -name '*:*' -exec rename 's/:/_/g' {} +
```

### Clone current directory into /destination verbosely
```sh
find . | cpio -pumdv /destination
```

### Find broken symlinks
```sh
find . -type l -xtype l
```

### recursive remove all htm files
```sh
find . -type f -name '*.htm' -delete
```

### Recursivly search current directory for files larger than 100MB
```sh
find -size +100M
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -printf "%s\n" | awk '{total += $1} END {print total}'
```

### rsync directory tree including only files that match a certain find result.
```sh
find /src/dir/ -mtime -10 -printf %P\\0|rsync files-from=- from0 /src/dir/ /dst/dir/
```

### Find and remove core files
```sh
find . -type f -regex '.*/core\.?[0-9]*$' -delete
```

### Quick HTML image gallery
```sh
find . -iname "*.jpg" -printf '<img src="%f" title="%f">\n' > gallery.html
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn
```

### find duplicate messages in a Maildir
```sh
find $folder -name "[1-9]*" -type f -print|while read file; do echo $file $(sed -e '/^$/Q;:a;$!N;s/\n //;ta;s/ /_/g;P;D' $file|awk '/^Received:/&&!r{r=$0}/^From:/&&!f{f=$0}r&&f{printf "%s%s",r,f;exit(0)}');done|sort -k 2|uniq -d -f 1
```

### List only directories, one per line
```sh
find . -type d -maxdepth 1
```

### Count number of files in subdirectories
```sh
find . -maxdepth 1 -type d -exec sh -c "printf '{} ' ; find '{}' -type f -ls | wc -l" \;
```

### Selecting a random file/folder of a folder
```sh
find . | shuf -n1
```

### Grab a list of MP3s out of Firefox's cache
```sh
find ~/.mozilla/firefox/*/Cache -exec file {} \; | awk -F ': ' 'tolower($2)~/mpeg/{print $1}'
```

### Make backups recurse through directories
```sh
find -type -f -exec cp {} {}.bak \;
```

### Delete empty directories recursively
```sh
find <top_level_dir> -depth -type d -empty -exec rmdir -v {} \;
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' -print0 | parallel -0 -j+0 lzma
```

### Search inside a folder of jar/zip files
```sh
find . -name "*.jar" | xargs -tn1 jar tvf | grep color "SearchTerm"
```

### Copy a file structure without files
```sh
find * -type d -exec mkdir /where/you/wantem/\{\} \;
```

### Find all the links to a file
```sh
find -L / -samefile /path/to/file -exec ls -ld {} +
```

### Slightly better compressed archives
```sh
find . \! -type d | rev | sort | rev | tar c files-from=- format=ustar | bzip2 best > a.tar.bz2
```

### Find files with at least one exec bit set
```sh
find . -type f -perm +0111 -print
```

### Find commets in jpg files.
```sh
find / -name "*.jpg" -print -exec rdjpgcom '{}' ';'
```

### LIST FILENAMES OF FILES CREATED TODAY IN CURRENT DIRECTORY
```sh
find -maxdepth 1 -mtime 0 -type f
```

### Find all files that have nasty names
```sh
find -name "*[^a-zA-Z0-9._-]*"
```

### rename all files with "?" char in name
```sh
find . -type f -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find Duplicate Files (based on MD5 hash)  For Mac OS X
```sh
find . -type f -exec md5 '{}' ';' | sort | uniq -f 3 -d | sed -e "s/.*(\(.*\)).*/\1/"
```

### Delete all flash cookies.
```sh
find $HOME -name '*.sol' -exec rm {} \;
```

### List of services sorted by boot order in Redhat-based systems
```sh
find /etc/rc3.d/ | sort -g
```

### Replace underscores with spaces in filenames and dirnames, recursively into subdirs.
```sh
find . -exec rename 's/_/\ /g' {} +
```

### finding more large files
```sh
find / -xdev -size +1024 -exec ls -al {} \; | sort -r -k 5
```

### List mp3 files with less than 320 kbps bitrate.
```sh
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'
```

### List folders containing only PNGs
```sh
find . -name '*png' -printf '%h\0' | xargs -0 ls -l hide=*.png | grep -ZB1 ' 0$'
```

### Replace php short open tags
```sh
find . -name '*.phtml' | xargs perl -pi -e 's/(?!(<\?(php|xml|=)))<\?/<\?php/g;'
```

### Sort files in multiple directories by date
```sh
find .  -type f -exec ls -l full-time {} + | sort -k 6,7
```

### Find where a kind of file is stored
```sh
find . -name '*.desktop' | sed s/[^/]*\.desktop$// | uniq -c | sort -g
```

### Search for files  older than 30 days in a directory and list only their names not the full path
```sh
find /var/www/html/ -type f -mtime +30 -exec basename {} \;
```

### Counts number of lines (in source code excluding comments)
```sh
find . -name '*.java' | xargs -L 1 cpp -fpreprocessed | grep . | wc -l
```

### View all images
```sh
find -iname '*.jpg' -print0 | xargs -0 feh -d
```

### find text in a file
```sh
find /directory/to/search/ -type f -print0 | xargs -0 grep "findtext"
```

### Stat each file in a directory
```sh
find . -maxdepth 1 -type f | xargs stat
```

### Find files and list them sorted by modification time
```sh
find -type f -print0 | xargs -r0 stat -c %y\ %n | sort
```

### Remove last line from files recursively
```sh
find . -name "*.php" -type f -exec sed -i "\$d" '{}' \;
```

### Rename many files in directories and subdirectories
```sh
find . -type d -print0 | while read -d $'\0' dir; do cd "$dir"; echo " process $dir"; find . -maxdepth 1 -name "*.ogg.mp3" -exec rename 's/.ogg.mp3/.mp3/' {} \; ; cd -; done
```

### git pull all repos
```sh
find ~ -maxdepth 2 -name .git -print | while read repo; do cd $(dirname $repo); git pull; done
```

### find out how much space are occuipied by files smaller than 1024K (sic) - improved
```sh
find dir -size -1024k -type f -print0 | du files0-from - -bc
```

### Find Duplicate Files, excluding .svn-directories (based on size first, then MD5 hash)
```sh
find -type d -name ".svn" -prune -o -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type d -name ".svn" -prune -o -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Batch convert files to utf-8
```sh
find . -name "*.php" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o ../newdir_utf8/{} \;
```

### Recursively execute command on directories (.svn, permissions, etc)
```sh
find . -type d -name .svn -exec chmod g+s "{}" \;
```

### Quick HTML image gallery
```sh
find . -iname '*.jpg' | sed 's/.*/<img src="&">/' > gallery.html
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} \; | sort
```

### List top 10 files in filesystem or mount point bigger than 200MB
```sh
find /myfs -size +209715200c -exec du -m {} \; |sort -nr |head -10
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/apt -not -mtime -7 | sudo xargs rm
```

### Recursively touch all files and subdirectories
```sh
find . -exec touch {} \;
```

### Unaccent an entire directory tree with files.
```sh
find /dir | awk '{print length, $0}' | sort -nr | sed 's/^[[:digit:]]* //' | while read dirfile; do outfile="$(echo "$(basename "$dirfile")" | unaccent UTF-8)"; mv "$dirfile" "$(dirname "$dirfile")/$outfile"; done
```

### Compress logs older than 7 days
```sh
find /path/to/files -type f -mtime +7 | grep -v \.gz | xargs gzip
```

### defragment files
```sh
find ~ -maxdepth 20 -type f -size -16M -print > t; for ((i=$(wc -l < t); i>0; i)) do a=$(sed -n ${i}p < t); mv "$a" /dev/shm/d; mv /dev/shm/d "$a"; echo $i; done; echo DONE; rm t
```

### View all new log messages in real time with color
```sh
find /var/log -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Generate SHA1 hash for each file in a list
```sh
find . -type f -exec sha1sum {} >> SHA1SUMS \;
```

### Summarise the size of all files matching a simple regex
```sh
find /path/to/my/files/ -type f -name "*txt*" | xargs du -k | awk 'BEGIN{x=0}{x=x+$1}END{print x}'
```

### Find all files under a certain directory /home that have a certain suffix at the end of the file name. Show the file and rename them to remove the suffix.
```sh
find /home -print -exec rename -v 's/_2009-09-04.suffix$//' {} \;
```

### Print a list of the 30 last modified mp3s sorted by last first
```sh
find ~/Music -daystart -mtime -60 -name *mp3 -printf "%T@\t%p\n" | sort -f -r | head -n 30 | cut -f 2
```

### Find Files That Exceed a Specified Size Limit
```sh
find directory -size +nnn
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -exec rm -f {} \;
```

### copies 20 most recently downloaded mp3 files (such as from Miro) into a directory
```sh
find . -name \*.mp3 -printf "%C+ %h/%f\n" | sort -r | head -n20 | awk '{print "\""$2"\""}' | xargs -I {} cp {} ~/tmp
```

### sort through source to find most common authors
```sh
find . -type f -name "*.java" -print0 | xargs -0 -n 1 svn blame | sed -n 's/^[^a-z]*\([a-z]*\).*$/\1/p' | sort | uniq -c | sort -n
```

### Find the most recently changed files (recursively)
```sh
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -delete
```

### Find directory depth
```sh
find . -printf '%d\n' | sort -n  | tail -1
```

### Move mp3 files to another path with existing subtree structure
```sh
find . -iname "*.mp3" -type f -print0 | xargs -0 -I '{}' mv {} /new/path/to/mp3/{}
```

### 1:1 copy of a volume
```sh
find / -xdev -print | cpio -pdmuv /mnt/mydisk
```

### Command template, executing a command over multiple files, outputing progress and fails only
```sh
find <dir> -name "<pattern>" | while read file; do echo -n .; output=$(<command>) || (echo ; echo $file:; echo "$output"; ); done
```

### Get line count for any file ending with extension recursively rooted at the current directory.
```sh
find . -name "*.py" | xargs wc -l
```

### Find broken symlinks and delete them
```sh
find . -type l -exec test ! -e {} \; -delete
```

### Recover cvs ": no such repository" error
```sh
find ./* -name 'CVS' | awk '{print "dos2unix " $1 "/*"}' | awk '{system($0)}'
```

### Archive all SVN repositories in platform indepenent form
```sh
find repMainPath -maxdepth 1 -mindepth 1 -type d | while read dir; do echo processing $dir; sudo svnadmin dump deltas $dir >dumpPath/`basename $dir`; done
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Get lines count of a list of files
```sh
find . -name "*.sql" -print0 | wc -l files0-from=-
```

### Recursively remove Mac . (dot) files
```sh
find . -name '._*' -type f -delete
```

### Add .gitignore files to all empty directories recursively from your current directory
```sh
find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
```

### Show demo of toilet fonts
```sh
find /usr/share/figlet -name *.?lf -exec basename {}  \; | sed -e "s/\..lf$//" | xargs -I{} toilet -f {} {}
```

### convert filenames in current directory to lowercase
```sh
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
```

### Sort movies by length, longest first
```sh
find -name '*.avi' | while read i ; do echo $(mplayer -identify -frames 0 -vo null -nosound "$i" 2>&1 | grep ID_LENGTH | cut -d= -f2)" ""$i" ;done | sort -k1 -r -n | sed 's/^\([^\ ]*\)\ \(.*\)$/\2:\1/g'
```

### Find C/C++ source files
```sh
find . -name '*.[c|h]pp' -o -name '*.[ch]' -type f
```

### A function to find the newest file in a directory
```sh
find /path/to/dir  -type f -printf "%T@|%p\n" 2>/dev/null | sort -n | tail -n 1| awk -F\| '{print $2}'
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' | xargs grep -H "string"
```

### Determine space taken by files of certain type
```sh
find . -name <pattern> -ls | awk 'BEGIN {i=0}; {i=i+$7}; END {print i}'
```

### Find files recursively that were updated in the last hour ignoring SVN files and folders.
```sh
find . -mmin -60 -not -path "*svn*" -print|more
```

### find string into one pdf file
```sh
find / -iname '*.pdf' -print -exec pdftotext '{}' - \; | grep color -i "unix"
```

### remove execute bit only from files. recursively
```sh
find . -type f -exec chmod -x {} \;
```

### Change files case, without modify directories, recursively
```sh
find ./ -name '*.JPG' -type f -execdir rename -f 'y/A-Z/a-z/' {} \+
```

### finds the c files with lines containing 'mcs', in the folders under the current folder
```sh
find */*.c | xargs grep 'mcs'
```

### Recursively remove .svn directories from the current location
```sh
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf
```

### Count files beneath current directory (including subfolders)
```sh
find . -type f | wc -l
```

### Grep for regular expression globally, list files and positions.
```sh
find . -name "*.pbt" -exec grep -Hirn "declareObject.*Common_Down" {} \;
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '{ if ($1 <2000) print $0 }' | sed 's/^[0-9]*.//'
```

### Delete all files older than X in given path
```sh
find . -mtime +10 -delete
```

### Replicate a directory structure dropping the files
```sh
find . -type d -exec mkdir -p $DESTDIR/{} \;
```

### create a backup for all directories from current dir
```sh
find -maxdepth 1 -type d -print0 | xargs -0 -I {} tar -cvzf {}.tar.gz {}
```

### Find all files containing a word
```sh
find . -name "*.php" | xargs grep -il searchphrase
```

### MP3 player
```sh
find . -name '*.mp3' | sort | while read -r mp3; do echo -e "<h3>$mp3</h3>\n<audio controls src=\"$mp3\"></audio>"; done > index.html; python -m http.server
```

### Invert selection with find.
```sh
find . ! -name "*.tar.gz"
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -print0 | xargs -0 grep -i <pattern>
```

### make a list of movies(.m3u).
```sh
find $HOME -type f -print | perl -wnlaF'/' -e 'BEGIN{ print "#EXTM3U"; } /.+\.wmv$|.+\.mpg$|.+\.vob$/i and print "#EXTINF:$F[-1]\nfile://$&";' > movies.m3u
```

### Normalize volume in your mp3 library
```sh
find . -type f -name '*.mp3' -execdir mp3gain -a '{}' +
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec mkdir /copy_location/{} \;
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 -type d|xargs du -a max-depth=0|sort -rn|cut -d/ -f2|sed '1d'|while read i;do echo "$(du -h max-depth=0 "$i")/";done;find . -maxdepth 1 -type f|xargs du -a|sort -rn|cut -d/ -f2|sed '$d'|while read i;do du -h "$i";done
```

### Find all plain text files that do not contain STRING
```sh
find . -type f ! -exec grep -q 'STRING' {} \; -print
```

### change ownership en masse of files owned by a specific user, including files and directories with spaces
```sh
find . -uid 0 -print0 | xargs -0 chown foo:foo
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -mount -type f -printf "%k %p\n" | sort -rg | cut -d \  -f 2- | xargs -I {} du -sh {} | less
```

### Finds all files from / on down over specified size.
```sh
find / -type f -size +25M -exec ls -lh {} \; | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Find all SUID binaries
```sh
find / -perm +6000 -type f -exec ls -ld {} \;
```

### count the number of specific characters in a file or text stream
```sh
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c
```

### execute command on all files of certain types excluding folders that match pattern
```sh
find . -regextype posix-egrep -regex '.+\.(c|cpp|h)$' -not -path '*/generated/*' -not -path '*/deploy/*' -print0 | xargs -0 ls -L1d
```

### List only directories, one per line
```sh
find * -type d -maxdepth 0
```

### Recurse through directories easily
```sh
find . -type f | while read file; do cp $file ${file}.bak; done
```

### find filenames and directory names that doesn't conform ISO 9660 level 2
```sh
find . -regextype posix-extended -not -regex '.*/[A-Za-z_]*([.][A-Za-z_]*)?'
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do unzip -l $line; done | grep your-string
```

### list files by testing the ownership
```sh
find . -user root
```

### Recursive Line Count
```sh
find * -type f -not -name ".*" | xargs wc -l
```

### Recursive Line Count
```sh
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'
```

### calculate md5 sums for every file in a directory tree
```sh
find . -type f -print0 | xargs -0 md5sum
```

### List out classes in of all htmls in directory
```sh
find . -name '*.html' -exec  'sed' 's/.*class="\([^"]*\?\)".*/\1/ip;d' '{}' ';' |sort -su
```

### Find how much of your life you've wasted coding in the current directory
```sh
find * \( -name "*.[hc]pp" -or -name "*.py" -or -name "*.i" \) -print0 | xargs -0 wc -l | tail -n 1
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/pacman/pkg -not -mtime -7 | sudo xargs rm
```

### Find only *.doc and *xls files on Windows partition
```sh
find /mountpoint -type f -iregex '.*\.\(doc\|xls\)'
```

### recursive search and replace old with new string, inside files
```sh
find . -type f -exec sed -i s/oldstring/newstring/g {} +
```

### Validate all XML files in the current directory and below
```sh
find -type f -name "*.xml" -exec xmllint noout {} \;
```

### recursively remove BOM
```sh
find . -type f -exec sed -i -e '1s/^\xEF\xBB\xBF//' {} \;
```

### Converts all windows .URL shortcuts in a directory to linux (gnome) .desktop shortcuts
```sh
find . -name "*.URL" | while read file ; do cat "$file" | sed 's/InternetShortcut/Desktop Entry/' | sed '/^\(URL\|\[\)/!d' > "$file".desktop && echo "Type=Link" >> "$file".desktop ; done
```

### Find all dotfiles and dirs
```sh
find -mindepth 1 -maxdepth 1 -name .\*
```

### Recursively remove .svn directories
```sh
find . -name .svn -exec rm -r {} +;
```

### find sparse files
```sh
find -type f -printf "%S\t%p\n" 2>/dev/null | gawk '{if ($1 < 1.0) print $1 $2}'
```

### Convert all old SVN repositories in one directory to new format
```sh
find . -maxdepth 1 -type d -exec 'mv "{}" "{}-old" && svnadmin create "{}" && svnadmin recover "{}-old" && svnadmin dump "{}-old" | svnadmin load "{}" && rm -rf "{}-old"' \;
```

### follow the content of all files in a directory
```sh
find dir/ -type f | xargs tail -fqn0
```

### Find inside files two different patterns in the same line and for matched files show number of matched lines
```sh
find . -name '*' -type f -print0 | xargs -0 grep -n pattern1 | grep pattern2
```

### Create md5sum of a directory
```sh
find -type f | grep -v "^./.git" | xargs md5sum | md5sum
```

### Create md5sum of a directory
```sh
find -name .git -prune -o -type f -exec md5sum {} \; | sort -k2 | md5sum
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -regextype posix-egrep -iregex '.*?\.(ogg|mp3)' | sort > ~/mylist.m3u
```

### List all symbolic links in a directory matching a string
```sh
find directory -type l -lname string
```

### Show all mergeinfo for a svn subtree
```sh
find . \( -type d -name .svn -prune \) -o -print | while read file ; do mergeinfo=`svn propget svn:mergeinfo $file` ; [ "$mergeinfo" != "" ] && echo -e "$file\n    $mergeinfo\n" ; done
```

### Create and play an instant keyword based playlist
```sh
find -E ~/Music -type f -iname "*search terms*" -iregex '.*\.(3g[2|p]|aac|ac3|adts|aif[c|f]?|amr|and|au|caf|m4[a|r|v]|mp[1-4|a]|mpeg[0,9]?|sd2|wav)' -exec afplay "{}" \; &
```

### Recursively search and replace old with new string, inside every instance of filename.ext
```sh
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;
```

### finding cr-lf files aka dos files with ^M characters
```sh
find $(pwd) -type f -exec grep -l "$(echo "\r")" {} \;
```

### Change permissions of every directory in current directory
```sh
find . -type d -exec chmod 755 {} \;
```

### Find broken symlinks
```sh
find /path/to/search -xtype l
```

### remove recursively all txt files with number of lines less than 10
```sh
find . -type f -name "*.txt" | while read; do (($(cat $THISFILE | wc -l) < 10)) && rm -vf "$THISFILE";  done
```

### a find and replace within text-based files
```sh
find . -iname "FILENAME" -exec sed -i 's/SEARCH_STRING/REPLACE_STRING/g' {} \;
```

### Simple Gumblar check command
```sh
find filepath -type f -iname "*.html" -o -iname "*.htm" -o -iname "*.php" | xargs grep "Exception\|LGPL\|CODE1"
```

### Iterate through current directory + all subs for C++ header files and rank by # of comments
```sh
find ./ -name *.h -exec egrep -cH "// | /\*" {} \; | awk -F':' '{print $2 ":" $1}' | sort -gr
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f 2>/dev/null | xargs du 2>/dev/null | sort -n | tail -n 10 | cut -f 2 | xargs -n 1 du -h
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Check syntax for all PHP files in the current directory and all subdirectories
```sh
find . -name \*.php -exec php -l "{}" \;
```

### BIGGEST Files in a Directory
```sh
find . -printf '%.5m %10M %#9u %-9g %TY-%Tm-%Td+%Tr [%Y] %s %p\n'|sort -nrk8|head
```

### find all file larger than 500M
```sh
find . -type f -size +500M -exec du {} \; | sort -n
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -iname "*admin*" -executable -type f
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f -size +100M -exec du {} \; | sort -n | tail -10 | cut -f 2
```

### Remove spaces from filenames - through a whole directory tree.
```sh
find . -depth -name '* *' -execdir bash \-c 'a="{}";mv -f "$a" ${a// /_}' \;
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\.//' |sort -f |uniq -i
```

### Find files of two different extensions and copy them to a directory
```sh
find * -regextype posix-extended -regex '.*\.(ext_1|ext_2)' -exec cp {} copy_target_directory \;
```

### FInd the 10 biggest files taking up disk space
```sh
find /home/ -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null
```

### find out how much space are occuipied by files smaller than 1024K
```sh
find dir -size -1024k -type f | xargs -d $'\n' -n1 ls -l | cut -d ' ' -f 5  | sed -e '2,$s/$/+/' -e '$ap' | dc
```

### Find files with size over 100MB and output with better lay-out
```sh
find . -type f -size +100M
```

### RELINK a lot of broken symlinks - FIX broken symlinks after rsync site to new server
```sh
find /PATHNAME -type l | while read nullsymlink ; do wrongpath=$(readlink "$nullsymlink") ; right=$(echo "$wrongpath" | sed s'|OLD_STRING|NEW_STRING|') ; ln -fs "$right" "$nullsymlink" ; done
```

### Stat each file in a directory
```sh
find -name `egrep -s '.' * | awk -F":" '{print $1}' | sort -u` -exec stat {} \;
```

### Clear cassandra snapshots that are older than 30 days
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -mtime +30 -print0 | xargs -0 rm -rf
```

### Delete empty,  24-hours-old directories recursively, without consider hidden directories
```sh
find .  -regex "[^.]*" -depth -empty -type d -mtime +1 -exec rmdir -v {} \;
```

### Erase empty files
```sh
find . -type f -size 0 -delete
```

### Find and delete oldest file of specific types in directory tree
```sh
find / \( -name "*.log" -o -name "*.mylogs" \) -exec ls -lrt {} \; | sort -k6,8 | head -n1 | cut -d" " -f8- | tr -d '\n' | xargs -0 rm
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {};
```

### Quick HTML image gallery from folder contents with Perl
```sh
find . | perl -wne 'chomp; print qq|<img src="$_" title="$_" /><br />| if /\.(jpg|gif|png)$/;'> gallery.html
```

### Find dead symbolic links
```sh
find . -type l | perl -lne 'print if ! -e'
```

### gain all mp3s in subfolders w/o encoding
```sh
find . -type f -iname '*.mp3' -print0 | xargs -0 mp3gain -r -k
```

### find all writable (by user) files in a directory tree (use 4 for readable, 1 for executable)
```sh
find . -type f -perm +200 -print
```

### delete file name space
```sh
find . -type f -print0 | xargs -0 rename 's/\ //g'
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
find /proc/*/fd -xtype f -printf "%l\n" | grep -P '^/(?!dev|proc|sys)' | sort | uniq -c | sort -n
```

### Count the number of deleted files
```sh
find /path/folder -type f -name "*.*" -print -exec rm -v {} + | wc -l;
```

### find and delete empty dirs, start in current working dir
```sh
find . -empty -type d -exec rmdir {} +
```

### Find the biggest files on your hard drive
```sh
find / -type f -size +500000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### search office documents for credit card numbers and social security number SSN docx xlsx
```sh
find  . -iname "*.???x" -type f -exec  unzip -p '{}' '*'
```

### List files in directory tree with newest last
```sh
find <directory> -type f -printf "%T@\t%p\n"|sort -n|cut -f2|xargs ls -lrt
```

### Count all files in directories recursively with find
```sh
find -maxdepth 3 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" | wc -l; done
```

### Recursive search inside the content of files under current directory - then view the result paginated with 'less'
```sh
find . -exec grep -Hn what \{\} \; | less
```

### pngcrush all .png files in the directory
```sh
find . -iname '*png' -exec pngcrush -ow -brute  {} {}.crush \;
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -sk "{}" | sort -rn | head
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 ! -name '.'  -execdir du -0 -s {} + | sort -znr | gawk 'BEGIN{ORS=RS="\0";} {sub($1 "\t", ""); print $0;}' | xargs -0 du -hs
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
find directory -maxdepth 1 -type f  | xargs ls -l | awk 'BEGIN { SUM=0} { SUM+=$5 } END { print SUM/2^20 }'
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0 cat | grep -v "^ *$" | grep -v "^ *//" | grep -v "^ */\*.*\*/" | wc -l
```

### Find files changed between dates defined by ctime of two files specified by name
```sh
find . -cnewer <file a> -and ! -cnewer <file b>
```

### find only current directory (universal)
```sh
find . \( ! -name . -prune \) \( -type f -o -type l \)
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name "*.gz" | while read line ; do gunzip to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done
```

### find xargs mv
```sh
find . -iname "*.mp4" -print0 | xargs -0 mv verbose -t /media/backup/
```

### which procs have $PATH_REGEX open?
```sh
find /proc -regex '/proc/[0-9]+/smaps' -exec grep -l "$PATH_REGEX" {} \; | cut -d'/' -f2
```

### Build an exhaustive list of maildir folders for mutt
```sh
find ~/Maildir/ -mindepth 1 -type d | egrep -v '/cur$|/tmp$|/new$' | xargs
```

### Checks the syntax of all PHP files in and below the current working directory
```sh
find . -name "*.php" -exec php -l {} \; | sed -e "/^No syntax/d"
```

### find large files
```sh
find . -type f -size +1100000k |xargs -I% du -sh %
```

### List all duplicate directories
```sh
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'
```

### Recursively replace a string in files with lines matching string
```sh
find . -type f |xargs -I% sed -i '/group name/s/>/ deleteMissing="true">/' %
```

### move contents of the current directory to the parent directory, then remove current directory.
```sh
find . ! -name "." -print0 | xargs -0 -I '{}' mv -n '{}' ..; rmdir "$PWD"
```

### How to estimate the storage size of all files not named *.[extension] on the current directory
```sh
find . -maxdepth 1 -type f -not -iname '*.jpg' -ls |awk '{TOTAL+=$7} END {print int(TOTAL/(1024^2))"MB"}'
```

### Remove all .svn folders
```sh
find . -name .svn -type d |xargs rm -rf
```

### search for text in files. recursive.
```sh
find /name/of/dir/ -name '*.txt' | xargs grep 'text I am searching for'
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f | grep -o '\.[^./]*$' | sort | uniq
```

### Delete Empty Directories
```sh
find . -type d -exec rmdir {} \;
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort | uniq
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . ! -type d -exec chmod -x {}\;
```

### Create full backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -czf $destdir/"$tarfile"_full.tgz -P $d; done
```

### Create incremental backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir"; tar -czvf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### Directory Tree
```sh
find . -type d -print | sed -e 's;[^/]*/;..........;g'|awk '{print $0"-("NR-1")"}'
```

### Use find to get around Argument list too long problem
```sh
find . -name 'junkfiles-*' -print0 | xargs -0 rm
```

### Find corrupted jpeg image files
```sh
find . -name "*jpg" -exec jpeginfo -c {} \; | grep -E "WARNING|ERROR"
```

### Replicate a directory structure dropping the files
```sh
find . -type d -print0 | (cd $DESTDIR; xargs -0 mkdir)
```

### Find files in multiple TAR files
```sh
find . -type f -name "*.tar" -printf [%f]\\n -exec tar -tf {} \; | grep -iE "[\[]|<filename>"
```

### find matching wholename example
```sh
find -wholename "*/query/*.json"
```

### Summarize size of all files of given type in all subdirectories (in bytes)
```sh
find . -iname '*.jpg' -type f -print0 |perl -0 -ne '$a+=-s $_;END{print "$a\n"}'
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $* | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Print names of all video files encoded with h264
```sh
find -type f -exec bash -c 'if ffmpeg -i "{}" 2>&1 | grep -qi h264 ; then echo "{}"; fi' \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -name '*.mp3' -type f -exec sh -c 'exec cp -f "$@" /home/user/dir' find-copy {} +
```

### increase recurively the modification time for a list of files
```sh
find . -type f | while read line; do NEW_TS=`date -d@$((\`stat -c '%Y' $line\` + <seconds> )) '+%Y%m%d%H%M.%S'`; touch -t $NEW_TS ${line}; done
```

### Periodic Log Deletion
```sh
find /path/to/dir -type f -mtime +[#] -exec rm -f {} \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -type f -iname '*.mp3' -exec cp {} ~/mp3/ \;
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b |while read L; do lvextend -m 1 $L /dev/disk/<disk> ; done
```

### Search specified $TEXT1 and Replace that by specified arg ($TEXT2)
```sh
find "$DIR" -regex "$FILENAME" -type f -print0 | xargs -0 sed -i _`date "+%y%m%d%H%M%S"` -E "s/$TEXT1/$TEXT2/g"
```

### List files older than one year, exluding those in the .snapshot directory
```sh
find /path/to/directory -not \( -name .snapshot -prune \) -type f -mtime +365
```

### Archive all files that have not been modified in the last days
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' -exec grep -H "string" {} \;
```

### Use -t when using find and cp
```sh
find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%-30s'\t\"%h/%f\"\n" | sort -rn -t$'\t' | uniq -w30 -D | cut -f 2 -d $'\t' | xargs md5sum | sort | uniq -w32 all-repeated=separate
```

### Link a deep tree of files all into on directory
```sh
find /deep/tree/ -type f -print0|xargs -0 -n1 -I{} ln -s '{}' .
```

### Arguments too long
```sh
find . -name "*.txt" -exec WHATEVER_COMMAND {} \;
```

### Recursive replace of directory and file names in the current directory.
```sh
find . *oldname* | grep oldname | perl -p -e 's/^(.*)(oldname)(.*$)/mv $1$2$3 $1newname$3/' | sh
```

### Find broken symlinks
```sh
find . -type l ! -exec test -e {} \; -print
```

### find files ignoring .svn and its decendents
```sh
find . -type f ! -iwholename \*.svn\* -print0 [ | xargs -0 ]
```

### Find class in jar
```sh
find . -name '*.jar' | xargs -l jar vtf | grep XXX.java
```

### find files ignoring .svn and its decendents
```sh
find . -type d -name .svn -prune -o -type f -print0 | xargs -r0 ...
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'
```

### Cleanup firefox's database.
```sh
find ~/Library/Application\ Support/Firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Use md5sum to check your music and movie files. Also use diff.
```sh
find . -type f -exec md5sum {}\; > <filename>
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -depth -print -execdir rename -f 'y/A-Z/a-z/' '{}' \;
```

### Bulk renames with find, sed and a little escaping
```sh
find . -exec bash -c "mv '{}' '\`echo {} |sed -e 's/foo/bar/g'\`"' \;
```

### find which of the zip files contains the file you're searching for
```sh
find . -iname '*.zip' | while read file; do unzip -l "$file" | grep -q [internal file name] && echo $file; done
```

### find with high precission (nanoseconds 1/1,000,000,000s) the last changed file.
```sh
find . -type f -print0 | xargs -0 stat -c '%y %n' | sort -n -k 1,1 -k 2,1 | awk 'END{print $NF}'
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -type f -name "*.pyc" -delete;
```

### move all files older than 60 days to a folder
```sh
find ./* -mtime +60 -exec mv {} storeFolder \;
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -exec grep -i <pattern> \;
```

### Quick HTML image gallery from folder contents
```sh
find . -iname '*.jpg' -exec echo '<img src="{}">' \; > gallery.html
```

### Print a list of all hardlinks in the working directory, recursively
```sh
find . -type f -a \! -links 1
```

### find and reduce 8x parallel the size of JPG images without loosing quality via jpegoptim
```sh
find  /var/www/ -type f -name '*.[jJ][pP][gG]' -print0 | xargs -n 1 -P 8 -0 jpegoptim strip-all preserve preserve-perms quiet
```

### Prints the latest modified files in a directory tree recursively
```sh
find . -name '*pdf*' -print0 | xargs -0 ls -lt | head -20
```

### Clone /
```sh
find . -path ./mnt -prune -o -path ./lost+found -prune -o -path ./sys -prune -o -path ./proc -prune -o -print | cpio -pumd /destination && mkdir /destination/mnt/ && mkdir /destination/proc && mkdir /destination/sys
```

### Delete more than one month old thumbnails from home directory
```sh
find  ~/.thumbnails/ -type f -atime +30 -print0 | xargs -0 rm
```

### recursive transform all contents of files to lowercase
```sh
find . -type f -print0 | xargs -0 perl -pi.save -e 'tr/A-Z/a-z/'
```

### Copy files from multiple directories into one directory
```sh
find <start directory> -iname "<all my files type>" -exec cp {} <target_dir> \;
```

### find file/dir by excluding some unwanted dirs and filesystems
```sh
find . -xdev -path ./junk_dir -prune -o -type d -name "dir_name" -a -print
```

### Make a statistic about the lines of code
```sh
find . -type f -name "*.c" -exec cat {} \; | wc -l
```

### Find and copy files from subdirectories to the current directory
```sh
find ./ -iname '*avi' -exec cp  {} ./ \;
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -exec stat -c%s {} \; | awk '{total += $1} END {print total}'
```

### finding cr-lf files aka dos files with ^M characters
```sh
find . -type f -exec fgrep -l $'\r' "{}" \;
```

### Create a tar of directory structure only
```sh
find . -type d|xargs tar rf ~/dirstructure.tar no-recursion
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List movie size in current directory
```sh
find . -regex '\(.*mp4\|.*mpg\|.*mpeg\|.*mov\|.*wmv\|.*mkv\|.*avi\)' -exec exiftool -directory -fileName -imageSize {} \;
```

### Move lots files with AWK
```sh
find . -maxdepth 1 -type f | awk 'BEGIN { c=0 } { if( c == <quantity_at_a_time> ) { print l; l=$0; c=1 } else { if( l != "") { l=l" "$0 } else { l=$0 }; c++}} END { print l }' | xargs mv -t <dir_dest>
```

### remove files that were modified 30 days ago
```sh
find . -mtime +30 -type f -exec rm -rf {} \;
```

### List all files in current dir and subdirs sorted by size
```sh
find . -printf "%s %p\n" | sort -n
```

### To remove all *.swp files underneath the current directory
```sh
find . -name \*.swp -type f -delete
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -exec du -ch {} + | tail -n1
```

### Install an entire folder of .apk files to your android device thru adb
```sh
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;
```

### play all mp4 files on home directory
```sh
find ~ -name '*.mp4' | xargs mplayer
```

### Search recursive all docx files for SearchTerm and print its name
```sh
find . -name '*docx'  -exec sh -c "unzip -p {} word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g' | grep -i SearchTerm -q && echo {} " \;
```

### Find files of particular size in a directory
```sh
find . -size +10240k -exec stat -c%s" "%n {} \; | sort -rn
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn
```

### Kill processes that have been running for more than a week
```sh
find /proc -user myuser -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
```

### Find removed files still in use via /proc
```sh
find -L /proc/*/fd -links 0 2>/dev/null
```

### Find core files
```sh
find . -type f -regex ".*/core.[0-9][0-9][0-9][0-9]$"
```

### Copy files (.pdfs in this case) from a directory hierarchy to a different directory, ignoring the original structure
```sh
find <source_directory> -name *.pdf -exec mv {} <destination_dir> \;
```

### Copying part of the files from one directory to another
```sh
find dir1 -maxdepth 1 -type f | head -100000 | xargs mv -t dir2/subdir
```

### Run git gc in all git repositories bellow .
```sh
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc aggressive; cd -; done
```

### Count number of javascript files in subdirectories
```sh
find  . -mindepth 2 -name "*.js" -type f |wc -l
```

### Remove all .svn directories recursively from a directory
```sh
find . -name '.svn' -type d | xargs rm -rf
```

### If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output
```sh
find /path/to/search/directory -exec grep -Hn "pattern" {} \;
```

### Compile all gettext source files
```sh
find ./i18n -name "*.po" | while read f; do msgfmt $f -o ${f%.po}.mo; done
```

### Summarize total storage used by files obtained by a find command
```sh
find /path/to/archive/?/??/??? -mtime -7 -name "*.pdf" | xargs stat -c "%s"| awk '{sum +=$1}END{printf("%0.0f\n",sum)}'|sed -r ':Label;s=\b([0-9]+)([0-9]{3})\b=\1,\2=g;t Label'
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
```

### Display PHP files that directly instantiate a given class
```sh
find . -name "*.php" -exec grep \-H "new filter_" {} \;
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
find . -maxdepth 1 -type f -size +1M -printf "%f:%s\n" | sort -t":" -k2
```

### Count and show duplicate file names
```sh
find . -type f  |sed "s#.*/##g" |sort |uniq -c -d
```

### Find logs modified in the last 15 minutes
```sh
find /var/log -wholename "*.log" -mmin -15
```

### touch every file in current folder and subfolder
```sh
find . -type f -exec touch "{}" \;
```

### Search for a string in all files recursively
```sh
find . -type f | xargs grep <keyword>
```

### List only directories, one per line
```sh
find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n"
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do echo "### $line "; unzip -l $line; done | grep "^###\|you-string" |less
```

### Find the files that contain a certain term
```sh
find /path/to/dir -type f -exec grep \-H "search term" {} \;
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate; }
```

### find file(s) on disk
```sh
find / -name 'tofind.sh' 2>/dev/null
```

### find . -name "*.txt" | xargs sed -i "s/old/new/"
```sh
find . -name "*.txt" | xargs sed -i "s/old/new/"
```

### list with full path
```sh
find $(pwd) -maxdepth 1 -name "*" -printf "%p\n"
```

### Identify Movies and TV Series using find and regex
```sh
find . -type f -regextype posix-extended -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$'
```

### Find Movies but NOT TV Series using find and regex
```sh
find . -type f -regextype posix-extended ! -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$' \( -iname "*.mkv" -or -iname "*.avi"-or -iname "*.srt" \)
```

### Extract every parted-files which had the same password
```sh
find . -name '*.part1.rar' -exec unrar e \{\} -pPASSWORD \;
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -and -printf "%f\n" | egrep -io '\.[^.]*$' | sort | uniq -c | sort -rn
```

### in current directory delete all files with ending
```sh
find . -name "*.bak" -type f -delete
```

### change current directory permissions and only sub-directories recursively (not files)
```sh
find . -type d -exec chmod XXXX {} \;
```

### add a particular track to a playlist by looking for a part of its file name
```sh
find `pwd` -iname *SEARCH_STRING* >> ~/PLAYLIST_NAME.m3u
```

### Print duplicate files
```sh
find . -type f -print0 | xargs -0 -n1 md5sum | sort -k 1,32 | uniq -w 32 -d all-repeated=separate | sed -e 's/^[0-9a-f]*\ *//;'
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {} {}.bak \;
```

### Parallel recursive convert files to other format and move them in another directory
```sh
find $(pwd) -type f -not -path '*/\.*' -iname '*.tif' -print0| xargs -0 -n1 -P4 -I{} bash -c 'X="{}"; Y=${X##*/}; convert "$X" -resize 1920x1080 -density 72" newpath/${Y%.*}.jpg"'
```

### File count into directories
```sh
find / -type d | while read i; do ls $i | wc -l | tr -d \\n; echo " -> $i"; done | sort -n
```

### list all files modified in the last 24 hours descending from current directory
```sh
find . -type f -mtime -1 \! -type d -exec ls -l {} \;
```

### Pretty print all of the Linux vm sysctls for your viewing pleasure
```sh
find /proc/sys/vm -maxdepth 1 -type f | while read i ; do printf "%-35s\t%s\n" "$i" "$(<$i)" ; done | sort -t/ -k4
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -print0|xargs -0 rm
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {}{,.bak} \;
```

### Count the number of lines of code, returns total
```sh
find . \( -iname '*.cpp' -o -iname '*.h' \) -exec wc -l {} \; | sort -n | cut delimiter=.  -f 1 | awk '{s+=$1} END {print s}'
```

### Archive every file in /var/logs
```sh
find /var/logs -name * | xargs tar -jcpf logs_`date +%Y-%m-%e`.tar.bz2
```

### Count files created by date/modification
```sh
find . -type f -exec stat \{\} \; | grep Modify: | awk '{a[$2]++}END{for(i in a){print i " : " a[i] }}' | sort
```

### Find corrupted jpeg image files
```sh
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c
```

### list all file extensions in a directory
```sh
find . -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' -exec rm -r {} \;
```

### Recursive find and replace in h an cpp files
```sh
find . -name "*.h" -o -name "*.cpp" | xargs sed -i 's/addVertexes/addVertices/g'
```

### Compile all .less files to .css
```sh
find *.less | xargs -I {} lessc {} {}.css && ls *.less.css | sed -e 'p;s/less.css/css/' | xargs -n2 mv
```

### gzip only that files that are not gzipped and are not open by any process
```sh
find -type f ! -name "*.gz" ! -exec fuser -s {} ';' -exec gzip {} \;
```

### Find all files in path2 that do not have a symbolic link in path1 or any of its subdirectories
```sh
find /path1 -type l -exec readlink -f {} \;  > links.txt && find /path2 -type f > files.txt && grep -Fxv -f links.txt files.txt
```

### Sum file sizes of found files
```sh
find . -mtime +30 -exec ls -all "{}" \; | awk '{COUNTER+=$5} END {SIZE=COUNTER/1024/1024; print "size sum of found files is: " SIZE "MB"}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -not -empty -printf "%-25s%p\n"|sort -n|uniq -D -w25|cut -b26-|xargs -d"\n" -n1 md5sum|sed "s/  /\x0/"|uniq -D -w32|awk -F"\0" 'BEGIN{l="";}{if(l!=$1||l==""){printf "\n%s\0",$1}printf "\0%s",$2;l=$1}END{printf "\n"}'|sed "/^$/d"
```

### Find the source file which contains most number of lines in your workspace
```sh
find -name "*.<suffix>" -exec wc -l "{}" \; | sort -n | tail
```

### Simple find
```sh
find / -name '*android*' 2>errors.txt
```

### Find and rename
```sh
find . -name "booyah" -exec rename booyah booyah.disabled {} \;
```

### find and copy any format of file
```sh
find /directory/of/search -name "*.png" type -f -exec cp '{}' /path/to/copy/ ';'
```

### How to delete all the archive files with extension *.tar.gz and greater than 10MB?
```sh
find / -type f -name *.tar.gz -size +10M -exec ls -l {} \;
```

### deleter
```sh
find . ! -size 0c -mtime +1 -type f -delete
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec ls -shS {} + | head -10
```

### How to archive all the files that are not modified in the last x number of days?
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Permissions change on all files in current directory
```sh
find . -type f -exec chmod 644 {} \;
```

### Rekursive Grep on Solaris or AIX Systems without GNU egrep -r funcionality
```sh
find . -type f -exec awk '/linux/ { printf "%s %s: %s\n",FILENAME,NR,$0; }' {} \;
```

### rename all dirs with "?" char in name
```sh
find . -type d -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find supported dependency manager manifests
```sh
find /srv/code -maxdepth 4 -type f -regex ".*\(\(package\|composer|npm\\|bower\)\.json\|Gemfile\|requirements\.txt\\|\.gitmodules\)"
```

### Move items from subdirectories to current directory
```sh
find -type f -exec mv {} . \;
```

### rsync + find
```sh
find . -name "whatever.*" -print0 | rsync -av files-from=- from0 ./ ./destination/
```

### Change permissions for all files in the current directory
```sh
find ./ -type f | xargs sudo chmod 644
```

### deleter
```sh
find -type f -size +0 -mtime +1 -print0|xargs -0r rm -f
```

### Change permission for all directories inside the current one
```sh
find site/ -type d | xargs sudo chmod 755
```

### Remove UTF-8 Byte Order Mark BOM
```sh
find . -type f -regex '.*html$' -exec sed -i 's/\xEF\xBB\xBF//' '{}' \;
```

### Recursively remove "node_modules" directories
```sh
find . -name "node_modules" -exec rm -rf '{}' \;
```

### Create a tar archive with cpio containing a set of files
```sh
find path -name '*' -type f | cpio -ov -H ustar -F txtarchive.tar
```

### Size for all directories inside the current one
```sh
find . -type d -maxdepth 1 | xargs du -sh
```

### find only current directory (universal)
```sh
find /some/directory/* -prune -type f -name *.log
```

### find files that have been modified recently
```sh
find /target_directory -type f -mmin -60 mindepth 2
```

### can look for large files taking up disk spaces using the cmd
```sh
find / -type f -size +500M 2>/dev/null | xargs du -h | sort -nr
```

### replace old htaccess php AddHandler values with new one
```sh
find /var/www/ -type f -name ".htaccess" -exec perl -pi -e 's/AddHandler[\s]*php(4|5)-cgi/AddHandler x-httpd-php\1/' {} \;
```

### Make a statistic about the lines of code
```sh
find . -name \*.c | xargs wc -l | tail -1 | awk '{print $1}'
```

### Create a tar archive with pax containing a set of files
```sh
find path -name '*' -type f  | pax -wd > txtarchive.tar
```

### find command usage
```sh
find /pentest/ -type f -iname "*trace*"
```

### Create a zip file ignoring .svn files
```sh
find . -not \( -name .svn -prune \) -type f | xargs zip XXXXX.zip
```

### find usage
```sh
find /etc/ /pentest/ -type f -iname "*sql*" | grep map
```

### Find files modified in the last N days; list sorted by time
```sh
find . -type f -mtime -14 -exec ls -ltd \{\} \; | less
```

### copying data with cpio
```sh
find  ./source  -depth -print | cpio -cvo> /destination/source_data.cpio; cd /destination; cpio -icvmdI ./source_data.cpio; rm -rf ./source_data.cpio
```

### Search entire web server for preg_replace /e based php malware.
```sh
find / -name \*.php -exec grep -Hn preg_replace {} \;|grep /e|grep POST
```

### Lower jpg quality
```sh
find -type f -name '*.jpg' -exec mogrify -quality 70% '{}' \;
```

### find all file larger than 500M
```sh
find / -type f -size +548576 -printf "%s:%h%f\n"
```

### Generate SHA1 hash for each file in a list
```sh
find . -regex ".*\(avi\|mp4\|wmv\)$" -print0 | xargs -0 sha1sum
```

### Search entire server for Q4 2015 obfuscated PHP malware of unknown origin.
```sh
find / -name \*.php -exec grep -Hn .1.=.......0.=.......3.=.......2.=.......5.= {} \;
```

### Recursively change permissions on directories, leave files alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {} +
```

### List and delete files older than one year
```sh
find <directory path> -mtime +365 -and -not -type d -delete
```

### Convert .wma files to .ogg with ffmpeg
```sh
find -name '*wma' -exec ffmpeg -i {} -acodec vorbis -ab 128k {}.ogg \;
```

### Find recursively, from current directory down, files and directories whose names contain single or multiple whitespaces and replace each such occurrence with a single underscore.
```sh
find  ./  -name '*'  -exec  rename  's/\s+/_/g'  {}  \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec du -sh {} + | sort -hr | head
```

### find . -name "*" -print | xargs grep -s pattern
```sh
find . -name "*" -print | xargs grep -s pattern
```

### Recursively unzip archives to their respective folder
```sh
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
```

### Remove all directories less than 1 MB in size in or below current directory
```sh
find . -type d -execdir du -sh '{}' ';' | grep -E "[0-9]+K" | sed 's/^[0-9\.]\+K[\t ]\+//' | tr "\n" "\0" | xargs -0 rm -rf
```

### show how much diskspace all images in a given directory need
```sh
find /home/bubo/ -type f \( -iname \*.jpg  -print0 , -iname \*.png  -print0 , -iname \*gif -print0 \)  |  du -cm  files0-from - | tail -1
```

### find specified directory and delete it recursively including directories with spaces
```sh
find . -name "directory_name" -type d -print0 | xargs -0 -i rm -rf {}
```

### find . -type f -exec grep -ils stringtofind {} +
```sh
find . -type f -exec grep -ils stringtofind {} +
```

### Recursively delete all files of a specific extension
```sh
find . -name "*.bak" -type f -delete
```

### find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```sh
find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```

### Uses ffmpeg to convert all that annoying .FLAC files to MP3 files keeping all the Artist's information in them.
```sh
find . -name "*.flac" -exec ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;
```

### grep selectively
```sh
find /path -name \*.php -user nobody -exec grep -nH whatever {} \;
```

### List files and sizes
```sh
find / -type f -exec wc -c {} \; | sort -nr | head -100
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} +
```

### find pictures and renames them appending the containing folder name
```sh
find <folder> -type f -name '*.jpg' -exec bash -c 'ext="${0##*.}";path="$(dirname "$0")";name="$(basename "$0"|sed "s/.jpg//")";folder="$(dirname "$0"|tr / \\n |tail -1)";new="${path}/${name}_${folder}.${ext}"; mv "$0" "${new}"' {} \;
```

### Delete Empty Files
```sh
find . -size 0c -print -exec rm -f {} \;
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0  wc -l | tail -1
```

### Print bitrate of each audio file
```sh
find . -print0 | xargs -0 -I{} ffmpeg -i "{}" 2>&1 | grep "kb\/s\|Input"
```

### Search and install true type fonts under user home directory
```sh
find ~ -name "*.ttf" -exec cp {} /usr/share/fonts/truetype \; & fc-cache -f
```

### Find every directory with too many files and subdirectory.
```sh
find / -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n
```

### Converts Character Set of Files in a Folder
```sh
find . -iregex ".+\.\(c\|cpp\|h\)" | xargs -I{} perl -e "system(\"iconv -f SHIFT_JIS -t UTF-8 {} > temp; mv temp {} \");"  ;
```

### Check for orphaned python files
```sh
find /usr/lib/python* -regextype posix-extended ! \( -type f -regex '.*.(pyc|pyo)' -prune -o -print \) | qfile -o -f -
```

### Find and replace text within all files within a directory
```sh
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'
```

### Batch rename and number files
```sh
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash
```

### Listing all your bundles Entities files to issue a doctrine:generate:entities
```sh
find ./src -type d -name "Entity" | xargs ls -A | cut -d . -f1 | sed 's_^_app/console doctrine:generate:entities YourOwnBundleName:_'
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -print0 | xargs -0 rm
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -size 0c -delete
```

### Find all files larger than 500M and less than 1GB
```sh
find / -type f -size +500M -size -1G
```

### list files not owned by any user or group
```sh
find / -nouser -o -nogroup -print
```

### Count occurrences of a word/token in a file
```sh
find . -name file.txt | xargs -e grep "token" -o | wc -l
```

### Erase empty files
```sh
find . -size 0 -exec rm '{}' \;
```

### Check if zip files from current directory are good
```sh
find . -maxdepth 1  -name "*.zip" -exec unzip -tqq {} \;
```

### How to exclude all "permission denied" messages from "find"
```sh
find <paths> ! -readable -prune -o <other conditions like -name> -print
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort | uniq -d | parallel find -type f -size {}c | parallel md5sum | sort | uniq -w32 all-repeated=separate
```

### List cassandra snapshots by date
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -printf "%Ty-%Tm-%Td  %p\n" | sort
```

### Use a variable in a find command.  Useful in scripting.
```sh
find . -iname \*${MYVAR}\* -print
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;
```

### Use a variable in a find command.  Useful in scripting.
```sh
find "$1" -iname "*$2*"
```

### remove files of a specific size
```sh
find . -size 1400c -exec rm {} \;
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -name *.mp3 | grep "andy" > ~/mylist
```

### get newest file in current directory
```sh
find . -maxdepth 1 -printf '%A@\t%p\n' | sort -r | cut -f 2,2 | head -1
```

### List used Perl libraries in Perl project
```sh
find . -type f \( -name '*.pm' -o -name '*.pl' \) | xargs grep "^use " | cut -d : -f2 | sort | uniq
```

### recursively change file name extensions
```sh
find . -type f -name \*.c | while read f; do mv $f "`basename $f .c`".C; done
```

### Graphical tree of sub-directories
```sh
find . -type d |sed 's:[^-][^/]*/::g; s:^-: |:'
```

### show 20 last modified files in current directory including subdirectories
```sh
find . -type f -printf "%T@ %Tc %p\n" |sort -n |cut -d' ' -f2- |tail -n20
```

### get md5sum for all files, skipping svn directories
```sh
find $1 -not -iwholename "*.svn*" -type f | xargs md5sum | awk '{print $2 "\t" $1}'
```

### Count files by extension
```sh
find . -type f | sed -n 's/..*\.//p' | sort -f | uniq -ic
```

### Recreate md5 checksum files for files in folder and subfolders
```sh
find . -type f \! -name "*.md5" -exec sh -c 'md5sum "$1" > $1.md5'  {} \;
```

### bzip2 all files in a directory older than 1 week (nicely)
```sh
find /logdir -type f -mtime +7 -print0 | xargs -0 -n 1 nice -n 20 bzip2 -9
```

### Parallel copy - Faster copy
```sh
find Files/ -type d  | parallel  'mkdir -p /BKP/{}' && find Files/ -type f  | parallel 'rsync -a {} MKD/$(dirname {})'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ -exec grep -ni phrase {} +
```

### Find directory by name
```sh
find . -type d -name '.svn' -ls
```

### Find files with size over 100MB and output with better lay-out
```sh
find ./ -type f -size +100000k -exec ls -lh {} \; 2>/dev/null| awk '{ print $8 " : " $5}'
```

### List empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -print
```

### Show sizes and calculate sum of all files found by find
```sh
find -name *.bak -print0 | du -hc files0-from=-
```

### I use this find command example to find out all the executable files
```sh
find . -perm 777 ?print
```

### Find pictures excepting a path
```sh
find . \( -not -path "./boost*" \) -type f \( -name "*.jpg" -or -name "*.png" -or -name "*.jpeg" \)  2>/dev/null
```

### Count total running time for all media files in your directory
```sh
find -type f -exec ffprobe -i "{}" -show_entries format=duration -v quiet -of csv="p=0" \; | paste -sd+ | bc
```

### Calculate the size in MB of all files of a certain extension
```sh
find . -type f -iname '*.msh' -exec ls -lG {} \; | awk '{total = total + $4}END{print "scale=2;" total "/2^20"}' | bc
```

### Find all FAT-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>|\+|\[|\])"
```

### List recursively only empty folders on present dir
```sh
find ./ -empty -type d -print
```

### Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
```sh
find . -name *js -type f | xargs yardstick | sort -k6 -n
```

### Find all NTFS-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>)"
```

### Find lines of code (LOC) of a filetype in a project.
```sh
find . -type f -name "*.py" -exec wc -l {} \; | awk '{ SUM += $1} END {print SUM }'
```

### Find all e-mails older than 7 days in the queue and delete them
```sh
find /var/spool/mqueue -type f -mtime +7 | perl -lne unlink
```

### Delete all files in a folder that don't match a certain file extension
```sh
find . -type f ! -name "*.foo" -name "*.bar" -delete
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -name "*.sh" -exec chmod u+x {} \;
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -exec file '{}' + | grep shell | awk -F':' '{print $1}' | xargs chmod u+x
```

### count all the lines of code in a directory recursively
```sh
find . -name '*.php' | xargs wc -l
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} \;
```

### mv argument list too long
```sh
find $_SOURCE -type f -name '*' -exec mv {}  $_DESTINATION \;
```

### displays comments from random jpeg files.
```sh
find ~/random_jpegs/folder -name "*.jpg" -exec rdjpgcom {} \;
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find ./ -type f -exec sh -c 'echo "{}" "$(dirname "{}")/$(basename "{}" | tr "[A-Z]" "[a-z]")"' \;
```

### find and delete empty dirs, start in current working dir
```sh
find . -type d -empty -delete
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -delete
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find -type f -name "*.avi" -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### find the biggest files recursively, no matter how many
```sh
find . -type f -printf '%20s %p\n' | sort -n | cut -b22- | tr '\n' '\000' | xargs -0 ls -laSr
```

### Busca archivos por el tipo de extension y los elimina.
```sh
find / -iname *.jpg exec rm -rf {} \;
```

### command for converting wav files to mp3
```sh
find . -iname "*wav" > step1 ; sed -e 's/\(^.*\)wav/\"\1wav\" \"\1mp3\"/' step1 > step2 ; sed -e 's/^/lame  /' step2 > step3 ; chmod +x step3 ; ./step3
```

### Find broken symlinks and delete them
```sh
find . -xtype l -delete
```

### Finds javascript lodash/underscore methods in source code
```sh
find . -name "*.js" | xargs grep -oh '_\.[^(]*' | sort | uniq
```

### Find and remove files
```sh
find / -name core | xargs /bin/rm -f
```

### remove a directory filled with too many files
```sh
find /SOME/PATH -type f -execdir rm -f {} \+
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) | xargs wc -l | sort -n
```

### search in all cpp / hpp files using egrep
```sh
find . \( -name "*cpp" -o -name "*hpp" \) -exec grep -Hn -E "043[eE]|70[Dd]7" \{\} \;
```

### Make a folder and everything in it world-viewable
```sh
find . -exec chmod o+rx {}\;
```

### Create etags file of .c, .cpp, and .h files in all subdirectories
```sh
find . -regex ".*\.[cChH]\(pp\)?" -print | etags -
```

### find all symlinks to a file
```sh
find -L / -samefile path/to/foo.txt
```

### Converts all jpg files to 75 quality.
```sh
find . -type f -name '*.jpg' -exec convert -quality 75 {} {} \;
```

### A command to find and replace text within conf files in a single directory.
```sh
find -type f -name '*.conf' -exec sed -Ei 's/foo/bar/' '{}' \;
```

### Returns top ten (sub)directories with the highest number of files
```sh
find . -type d | while read dir ; do num=`ls -l $dir | grep '^-' | wc -l` ; echo "$num $dir" ; done | sort -rnk1 | head
```

### For files owned by root only, change ownership to a non-privileged user.
```sh
find /path/to/dir -user root -exec chown [nonprivuser] {} \;
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find $PWD -type d | while read "D"; do cd "$D"; for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize;done ;done
```

### find all symlinks to a file
```sh
find / -lname path/to/foo.txt
```

### List files containing given search string recursively
```sh
find /path/to/dir -type f -print0 | xargs -0 grep -l "foo"
```

### Delete all ".svn" directories from current path (recursive)
```sh
find . -name ".svn" -exec rm -rf {} \;
```

### Delete/Archive easily old mails using find.
```sh
find . -path ".*/cur/*" -type f ! -newermt "1 week ago" -delete
```

### find and replace tabs for spaces within files recursively
```sh
find ./ -type f -exec sed -i 's/\t/  /g' {} \;
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec stat -f '%m %N' {} \; | sort -n
```

### print the first line of every file which is newer than a certain date and in the current directory
```sh
find . -type f -newer 201011151300.txt -exec head -1 {} \;
```

### rename files (in this case pdfs) numerically in date order
```sh
find . -name "*.pdf" -print0 | xargs -r0 stat -c %y\ %n | sort|awk '{print $4}'|gawk 'BEGIN{ a=1 }{ printf "mv %s %04d.pdf\n", $0, a++ }' | bash
```

### find something
```sh
find $SDIR -name '${f}.*' -mtime +$n -maxdepth 1 | xargs -n 10 rm -vf
```

### Get last changed revision to all eclipse projects in a SVN working copy
```sh
find . -iname ".project"| xargs -I {} dirname {} | LC_ALL=C xargs -I {} svn info {} | grep "Last Changed Rev\|Path" | sed "s/Last Changed Rev: /;/" | sed "s/Path: //" | sed '$!N;s/\n//'
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find . -name '*.epub' -exec sh -c 'a={}; ebook-convert $a ${a%.epub}.mobi still more options' \;
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG' -print0 | xargs -0 mogrify -resize 1024">" -quality 40
```

### catch all the txt files into a start_dir tree and copy them into a single end_dir
```sh
find start_dir -name *.txt | xargs -J % cp % end_dir/
```

### set create time using file name for files pulled from android camera
```sh
find . -type f -exec echo -n "touch -t \`echo " \; -exec echo -n {} \; -exec echo -n " | sed -E 's/.*([[:digit:]]{8})_([[:digit:]]{4})([[:digit:]]{2}).*/\1\2.\3/g'\` " \; -exec echo {} \; | sh
```

### covert m4a audio files to wav
```sh
find . -name '*.m4a' | xargs -I audiofile mplayer -ao pcm "audiofile" -ao pcm:file="audiofile.wav"
```

### Remove all .svn folders
```sh
find . -name .svn -print0 | xargs -0 rm -rf
```

### Get the total size (in human readable form) of all certain file types from the current directory
```sh
find . -name 'pattern'| xargs du -hc
```

### Find directories in pwd, get disk usage, sort results
```sh
find . -type d -d 1 -print0 | xargs -0 du -sm | sort -nr
```

### find *.lock files and delete
```sh
find -name *.lock |xargs rm -f
```

### List 50 largest source files in a project
```sh
find . -type f -name '*.pm' -printf '%6s %p\n' | sort -nr | head -n 50
```

### Get the total length of all videos in the current dir in H:m:s
```sh
find -type f -iregex '.*\.\(mkv\|mp4\|wmv\|flv\|webm\|mov\|dat\|flv\)' -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.[Jj][Pp][Gg]' -exec mogrify -resize 1024">" -quality 40 {} \;
```

### Command to rename multiple file in one go
```sh
find / -name "*.xls" -print0 | xargs -0  rename .xls .ods {}
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find -iname "*.pdf" -exec pdfinfo -meta {} \;|awk '{if($1=="Pages:"){s+=$2}}END{print s}'
```

### Remove hidden CVS merge helper files
```sh
find . -name ".#*" -exec rm {} \;
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -20
```

### dos2unix recursively
```sh
find . -type f -exec dos2unix {} +
```

### Find Files over 20Meg
```sh
find . -type f -size +20000k -print0 | xargs -0 du -h | awk -F"\t" '{printf "%s : %s\n", $2, $1}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -size +0 -printf "%-25s%p\n" | sort -n | uniq -D -w 25 | sed 's/^\w* *\(.*\)/md5sum "\1"/' | sh | sort | uniq -w32 all-repeated=separate
```

### Remove CVS root files under current directory
```sh
find . -name Root -print | xargs rm -f
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find -type f |while read a;do [ "`head -c3  "${a}"`" == $'\xef\xbb\xbf' ] && echo "Match: ${a}";done
```

### Recursively sort files by modification time through multiple directories.
```sh
find /test -type f -printf "%AY%Aj%AH%AM%AS-%h/%f\n" | sort -n
```

### Remove all node_module folders recursively
```sh
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
```

### Indent all the files in a project using emacs
```sh
find . -iname \*.c -or -iname \*.h -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### Convert all the png files in a directory to gif in parallel. Requires imagemagick.
```sh
find . -name "*.png" | xargs -I '{}' -P 4 mogrify -format gif '{}'
```

### Display directory hierarchy listing as a tree
```sh
find . -printf '%p\n' | perl -ne 'if( m/(.*)\/(.*)/ ) { $p = $1; $f = $2; $p =~ s/[^\/]/ /g; $p =~ s/\//|/g; print "$p/$f\n"; } elsif( m/(.*)/ ) { print "$1\n"; } else { print "error interpreting: \"$_\"\n"; }'
```

### Search and replace multiple files with substitution
```sh
find . -name "*.txt" | xargs -n 1 perl -pi -w -e "s/text([0-9])/other\$1/g;"
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | paste -sd+ | bc
```

### List all text files (exclude binary files)
```sh
find -type f | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Recursive chmod all *.sh files within the current directory
```sh
find ./ -name "*.sh" -exec chmod +x {} \;
```

### use the find command and have it not print trailing slashes
```sh
find * -maxdepth 0 -type d
```

### Find Duplicate Files (based on size, name, and md5sum)
```sh
find -type f -printf '%20s\t%100f\t%p\n' | sort -n | uniq -Dw121 | awk -F'\t' '{print $3}' | xargs -d '\n' md5sum | uniq -Dw32 | cut -b 35- | xargs -d '\n' ls -lU
```

### Search recursively to find a word in certain file types
```sh
find . -iname '*.conf' | xargs grep "searh string" -sl
```

### Add a newline to the end of a cpp file
```sh
find . -iname "*.cpp" -exec perl -ni -e 'chomp; print "$_\n"' {} \;
```

### Recursively remove all files in a CVS directory
```sh
find . -type f ! -path \*CVS\* -exec rm {} \; -exec cvs remove {} \;
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -delete
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively unrar into dir containing archive
```sh
find . -name '*.rar' -execdir unrar e {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type f|while read f; do mv $f `echo $f |tr '[:upper:]' '[ :lower:]'`; done
```

### Sort file greater than a specified size  in human readeable format including their path and typed by color, running from current directory
```sh
find ./ -size +10M -type f -print0 | xargs -0 ls -Ssh1 color
```

### Keep from having to adjust your volume constantly
```sh
find . -iname \*.mp3 -print0 | xargs -0 mp3gain -krd 6 && vorbisgain -rfs .
```

### Convert the contents of a directory listing into a colon-separated environment variable
```sh
find . -name '*.jar' -printf '%f:'
```

### Backup files older than 1 day on /home/dir, gzip them, moving old file to a dated file.
```sh
find /home/dir -mtime +1 -print -exec gzip -9 {} \; -exec mv {}.gz {}_`date +%F`.gz \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -10
```

### Find all symlinks that link to directories
```sh
find -type l -xtype d
```


### Recursively remove all empty directories
```sh
find . -type d -empty -delete
```

### Recursively remove all empty directories
```sh
find . -type d -empty -delete
```

### Copy all documents PDF in disk for your home directory
```sh
find / -name "*.pdf" -exec cp -t ~/Documents/PDF {} +
```

### find broken symbolic links
```sh
find -L . -type l
```

### md5sum for files with bad characters
```sh
find ./ -type f | sed "s:[\ \',\"]:\\\&:g" | xargs md5sum
```

### Convert all files media to mp3
```sh
find -type f -exec ffmpeg -i "{}" "{}".mp3 \;
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc -delete
```

### chmod only files
```sh
find . -type f -print0 | xargs -0 chmod -v gu=rw
```

### md5sum for files with bad characters
```sh
find ./ -type f -print0 | xargs -0 md5sum
```

### Show me all of my Mac App Store apps
```sh
find /Applications -path '*Contents/_MASReceipt/receipt' -maxdepth 4 -print |sed 's#.app/Contents/_MASReceipt/receipt#.app#g; s#/Applications/##'
```

### Get Total Line Count Of All Files In Subdirectory (Recursive)
```sh
find . -type f -name "*.*" -exec cat {} > totalLines 2> /dev/null \; && wc -l totalLines && rm totalLines
```

### Show all symlinks
```sh
find ./ -type l -print0 | xargs -0 ls -plah
```

### Delete huge numbers of files without intensive cpu load
```sh
find <path> -type f -exec ionice -c3 rm {} +
```

### print your iTunes App for iPhone/iTouch/iPad to show your friends which ones you have
```sh
find ~/Music/iTunes/iTunes\ Media/. -name \*.ipa -exec basename {} \; | cut -d \. -f 1 > ~/Desktop/MyAppList`date +%s.txt`
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc -type f -delete
```

### find rcs locked file in a given folder
```sh
find /path/to/folder/ -mindepth 1 -maxdepth 2 -name "*,v" -exec sudo rlog -L -R {} \;
```

### Find files and play them as a playing list in mpv
```sh
find . -type f \( -name "*.mp3" -o -name "*.ogg" \) | mpv shuffle audio-display=no playlist -
```

### Grep all your PDFs in a row
```sh
find -iname \*.pdf -print0 | xargs -0 pdfgrep -i "my search text"
```

### Recursively remove .svn directories
```sh
find . -iname ".svn" | xargs rm -r $1
```

### Find Largest files of mount point
```sh
find /logs -ls -xdev | sort -nrk 7 | head -10
```

### Display a numbered list of files bigger than 500K, sorted by size (human readable)
```sh
find ./ -type f -size +500k -exec ls -1Ash {} \; | sort -hr | cat -n
```

### Find Largest files of mount point
```sh
find /logs -ls -xdev | sort -nrk 7 | head -10
```

### Append html-extension to all files in a directory structure that contains html-code.
```sh
find . |xargs grep '<html\|<body\|<table' |sed '/~/d;s/:.*//' |sed 's/.*/mv & &.html/' |uniq >run.sh; sh run.sh
```

### search and replace in multiple files
```sh
find . -name "*.php" -print | xargs sed -i 's/foo/bar/g'
```

### Show all occurences of STRING with filename and line number for given FILE pattern under the DIR.
```sh
find DIR -name "FILE" -exec grep -IHn STRING {} \;
```

### File count into directories
```sh
find . -type f | xargs wc -l
```

### Find all files over a set size and displays accordingly
```sh
find / -type f -size +512000 | xargs ls -lh | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Change owner ship of files from 1003 to android under current directory recursively. 1003/android could be customized.
```sh
find . | while read line; do test `stat -c %u $line` -eq 1003 && chown android:android $line && echo $line; done
```

### Re-encode all flac files below
```sh
find . -type f -iname '*.flac' | while read i; do mv  "$i" "$i.tmp"; gst-launch filesrc location="$i.tmp" ! flacdec ! flacenc quality=8 ! filesink location="${i%.tmp}"; rm  "$i.tmp"; done
```

### List all text files (exclude binary files)
```sh
find . | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Check all bash scripts in current dir for syntax errors
```sh
find . -name '*.sh' -exec bash -n {} \;
```

### List only the directories
```sh
find . -maxdepth 1 -type d | sort
```

### Search through files, ignoring .svn
```sh
find . -not \( -name .svn -prune \) -type f -print0 | xargs null grep <searchTerm>
```

### Archive tar.gz archives all files (with extension filter) individually from an location
```sh
find ./ -iname "*.dmp" -maxdepth 0 -type f -exec tar czvf {}.tar.gz  remove-files {} \; \;
```

### Search for a string inside all files below current directory
```sh
find . -type f -exec grep -Hn <pattern> {} \;
```

### Print out the contents of a Git repository (useful for broken repositories)
```sh
find .git/objects -type f -printf "%P\n" | sed s,/,, | while read object; do echo "=== $obj $(git cat-file -t $object) ==="; git cat-file -p $object; done
```

### Update obsolete CVS Root files
```sh
find cvsdir -name Root -exec sed -i 's/oldserver/newserver/' {} \;
```

### Create a symbolic link tree that shadows a directory structure
```sh
find /home/user/doc/ -type d -printf "mkdir -vp '/home/user/Dropbox%p'\n" -o -type f -printf "ln -vs '%p' '/home/user/Dropbox%p'\n" | sh
```

### recursive command to find out all directories
```sh
find $DIR -exec bash method {} ";"
```

### run all
```sh
find /var/scripts -name 'backup*' -exec {} ';'
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \; | grep found
```

### find all files containing a pattern, open them using vi and place cursor to the first match, use 'n' and ':n' to navigate
```sh
find . -type f -exec grep -l pattern {} \; | xargs vi +/pattern
```

### find and reduce 8x parallel the size of PNG images without loosing quality via optipng
```sh
find  /var/www/ -type f -name '*.[pP][nN][gG]' -print0 | xargs -L 1 -n 1 -P 8 -0 optipng -preserve -quiet -o7 -f4 -strip all
```

### remove OSX resource forks ._ files
```sh
find . -name ._\* -exec rm -f {} \;
```

### List down source files which include another source file
```sh
find . -type f \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.cxx' \) | xargs grep "#include.*\.c.*" 2>&1 | tee source_inside_source_list.txt
```

### List all files in current dir and subdirs sorted by size
```sh
find . -ls | sort -k 7 -n
```

### add POD stubs recursively to all Perl modules
```sh
find . -type file -name '*.pm' | xargs perl -p -i -e 'BEGIN{undef $/;} s/([;}])\s*\nsub (\w+)/$1\n\n=head2 $2\n\n=cut\n\nsub $2/g'
```

### list uniq extensions of files from the current directory
```sh
find . -type f |egrep '^./.*\.' |sed -e "s/\(^.*\.\)\(.*$\)/\2/" |sort |uniq
```

### Locate Hacked Files and Dump.
```sh
find . -type f -name '*.html' -exec grep -H HACKED {} \; > hacklog.txt
```

### Find all videos under current directory
```sh
find ./ -type f -print0 | xargs -0 file -iNf - | grep video | cut -d: -f1
```

### concatenate compressed and uncompressed logs
```sh
find /var/log/apache2 -name 'access.log*gz' -exec zcat {} \; -or -name 'access.log*' -exec cat {} \;
```

### change file format at one time
```sh
find $(YourPATH) -type f -exec dos2unix '{}' \;
```

### Find and replace recursivly a ignoring .svn
```sh
find . -type f -not -regex ".*\/.svn\/.*" -exec sed -i 's/oldstring/newstring/g' {} +
```

### find broken symbolic links
```sh
find . -type l | (while read FN ; do test -e "$FN" || ls -ld "$FN"; done)
```

### List all symlinks and see where they link to
```sh
find -type l | xargs ls -l
```

### Remove all .DS_Store files from the current directory (recursive)
```sh
find . -name "*.DS_Store" -type f -delete
```

### Find PHP files
```sh
find . -name "*.php" -exec grep -i -H "search pharse" {} \;
```

### Make a statistic about the lines of code
```sh
find . -type f -name '*.c' -exec wc -l {} \; | awk '{sum+=$1} END {print sum}'
```

### Find all python modules that use the math module
```sh
find . -name "*.py" -exec grep -n -H -E "^(import|from) math" {} \;
```

### Find files and list them sorted by modification time
```sh
find -type f | xargs ls -1tr
```

### Recursively remove all '.java.orig' files (scalable)
```sh
find . -type f -iname '*.java.orig' -delete
```

### Hunt for the newest file.
```sh
find . -printf "%T@ %p\n" | sed -e 1d | while read ts fn; do ts=${ts%.*}; if [ $ts -ge ${gts:-0} ]; then gts=$ts; echo `date -d @$gts` $fn; fi; done
```

### To compact all SQLite databases in your home directory
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### rm filenames with spaces
```sh
find garbage/ -type f -delete
```

### Extract all 7zip files in current directory taking filename spaces into account
```sh
find -maxdepth 1 -type f -name "*.7z" -exec 7zr e '{}' ';'
```

### Count the lines of source code in directory, ignoring files in generated by svn
```sh
find . -name '*.java' -o -name '*.xml' | grep -v '\.svn' | xargs wc -l
```

### recursively detecting files with a BOM
```sh
find . -type f -print0 | xargs -0r awk '/^\xEF\xBB\xBF/ {print FILENAME} {nextfile}'
```

### Rename all the files in the current directory into their sha1sum
```sh
find . -maxdepth 1 -type f| xargs sha1sum | sed 's/^\(\w*\)\s*\(.*\)/\2 \1/' | while read LINE; do mv $LINE; done
```

### strip id3 v1 and v2 tags from all mp3s in current dir and below
```sh
find . -type f -iname "*.mp3" -exec id3v2 delete-all {} \;
```

### Renaming jpg extension files at bunch
```sh
find . -name "*.jpg" | perl -ne'chomp; $name = $_; $quote = chr(39); s/[$quote\\!]/_/ ; print "mv \"$name\" \"$_\"\n"'
```

### Find the files that include a TODO statement within a project
```sh
find . -iname '*TODO*'
```

### Renames all files in the current directory such that the new file contains no space characters.
```sh
find ./ $1 -name "* *" | while read a ; do mv "${a}" "${a//\ /_}" ; done
```

### Move all files in subdirectories to current dir
```sh
find ./ -type f -exec mv {} . \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b -exec lvextend -m 1 {} /dev/disk/<disk> \;
```

### Find files and list them sorted by modification time
```sh
find . -type f | xargs ls -ltrhg
```

### List OSX applications and versions.
```sh
find /Applications -type d -maxdepth 1 -exec sh -c 'echo "{}"; (plutil -convert xml1 -o - "{}/Contents/Info.plist" | xpath /dev/stdin "concat(\"v\", /plist/dict/string[preceding-sibling::key[1]=\"CFBundleShortVersionString\"]/node())" 2>/dev/null)' \;
```

### Recursively remove .svn directories
```sh
find -type d -name ".svn" -print0 | xargs -0 rm -rf
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\///'|grep -o '\.[^.]*$'|sort -f|uniq -i
```

### Erase empty files
```sh
find . -size 0 -print0 | xargs -0 rm
```

### Remove VIM temp files
```sh
find ./ -name '*.sw[op]' -delete
```

### search for a pattern (regex) in all text files (ignoring binary files) in a directory tree
```sh
find . -type f | perl -lne 'print if -T;' | xargs egrep "somepattern"
```

### Find and print pattern location from all files on command line from directory and its sub directories.
```sh
find . -exec grep $foo {} \; -print
```

### Delete empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -delete
```

### Convert one's Java source file encoding
```sh
find . -name "*.java" -type f -perm +600 -print | xargs -I _ sh -c 'grep -q hexianmao _ && iconv -f gb2312 -t utf8 -o _ -c _ '
```

### find forms in a symfony 1.2 project
```sh
find apps/ -name "*.svn-base" -prune -o -print -name "*.php" | xargs grep -E 'new .+Form\('
```

### Clean-up release directories keeping the only the latest two
```sh
find . -maxdepth 1 -type d | grep -Pv "^.$" | sort -rn field-separator="-" | sed -n '3,$p' | xargs rm -rf
```

### find all file larger than 500M in home dir
```sh
find ~ -type f -size +500M -exec ls -ls {} \; | sort -n
```

### bkup the old files
```sh
find <dir> -type f -mtime +<days> -exec scp -r {} user@backuphost:/data/bkup \;
```

### search for a file (with regex), choose one then open it
```sh
findopen() { local PS3="select file: "; select file in $(find "$1" -iname "$2"); do ${3:-xdg-open} $file; break; done }
```

### find and output files content with filtering by filename and specific string
```sh
find . -name *.properties -exec /bin/echo {} \; -exec cat {} \; | grep -E 'listen|properties'
```

### Remove all .svn folders inside a folder
```sh
find . -name "\.svn" -exec rm -rf {} ";"
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -s "{}" | sort -rn | head | cut -f2 | xargs -I{} du -sh "{}"
```

### Find the biggest files
```sh
find -type f -exec du -sh {} +  | sort -rh | head
```

### Find and replace
```sh
find . -name '*.txt' -exec mv {} {}.sh \ ;
```

### Find redirection and grep
```sh
find . -name "*.png" | tee images.txt | grep book
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec rename "s/.JPG/.jpg/g" \{\} \;
```

### recurisvely md5 all files in a tree
```sh
find ./backup -type f -print0 | xargs -0 md5sum > /checksums_backup.md5
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf | sed 's/ /\\ /g' | xargs rm {} \;
```

### perl find and replace
```sh
find -name ".php" -exec perl -pi -e 's/search/replace/g/' {} \;
```

### copy selected folder found recursively under src retaining the structure
```sh
find . -type d -exec mkdir /new/path/{} \;
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -execdir rm -f {} +
```

### Find files older than 60 days
```sh
find . -maxdepth 1 -type f -mtime +60 -ls
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -print0 | xargs no-run-if-empty -0 rm;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf {} \;
```

### quick find executable from locate db
```sh
find $(locate hello) -type f -executable -print|grep -E "hello\$"
```

### Show all video files in the current directory (and sub-dirs)
```sh
find -type f -printf '%P\000' | egrep -iz '\.(avi|mpg|mov|flv|wmv|asf|mpeg|m4v|divx|mp4|mkv)$' | sort -z | xargs -0 ls -1
```

### Indent all the files in a project using indent
```sh
find . -iname \*.[ch] -exec indent "{}" \;
```

### find all c and cpp files except the ones in the unit-test and android subdirectories
```sh
find . -name unit-test -o -name '*.c'  -o -name '*.cpp' | egrep -v "unit-test|android"
```

### copy all Photos from Canon A520 to one place
```sh
find / -type f -name IMG_????.JPG -print0 |xargs -0 exiv2 -g Exif.Canon.ModelID '{}' |grep A520 |rev |cut complement -d " " -f1-40 |rev |xargs -I {} cp parents {} /where
```

### Pick the first program found from a list of alternatives
```sh
find_alternatives(){ for i;do which "$i" >/dev/null && { echo "$i"; return 0;};done;return 1;}
```

### simulates the DOS tree command that you might be missing on your Mac or Linux box
```sh
find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
```

### Find multiple filename expressions and sort by date
```sh
find . \( -iname "*.doc" -o -iname "*.docx" \) -type f -exec ls -l full-time {} +|sort -k 6,7
```

### clear not-used-again files from Linux page cache
```sh
find /path/to/dir -type f -exec cachedel '{}' \;
```

### Compress Images using convert (ImageMagick) in a bulk
```sh
find . -maxdepth 1 -iname '*jpg' -exec convert -quality 60 {} lowQ/{} \;
```

### Rename *.MP3 *.Mp3 *.mP3 etc.. to *.mp3.
```sh
find ./ -iname "*.mp3" -type f -printf "mv '%p' '%p'\n" | sed -e "s/mp3'$/mp3'/I" | sh
```

### Recursively search a directory tree for all .php .inc .html .htm .css .js files for a certain string
```sh
find . -type f \( -name "*.js" -o -name "*.php" -o -name "*.inc" -o -name "*.html" -o -name "*.htm" -o -name "*.css" \) -exec grep -il 'searchString' {} \;
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -empty -delete
```

### purge half of files in backup directory
```sh
find . | sort | awk 'NR%2==0' | xargs rm $1
```

### Shuffle mp3 files in current folder (and subfolders) and play them.
```sh
find . -iname "*.mp3" | mpg123 -Z list -
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -exec rm -rf '{}' +
```

### [Gentoo] Input modules, commented, in your module.autoload file
```sh
find /lib/modules/`uname -r`/ -type f -iname '*.o' -or -iname '*.ko' |grep -i -o '[a-z0-9]*[-|_]*[0-9a-z]*\.ko$' |xargs -I {} echo '# {}' >>/etc/modules.autoload.d/kernel-2.6
```

### Sum up total size and count of all certain filename pattern/regex
```sh
find -regextype posix-egrep -regex ".*/[A-Z]{3}_201009[0-9]{2}.*" -printf "%f %s\n" | awk '{ SUM += $2;COUNT++ } END { print SUM/1024 " kb in " COUNT " files" }'
```

### free some harddrive space by garbage collecting in all your git repos
```sh
find . -maxdepth 2 -type d -name '.git' -print0 | while read -d ''; do (cd "$REPLY"; git gc); done
```

### gmail safe folder
```sh
find | egrep "\.(ade|adp|bat|chm|cmd|com|cpl|dll|exe|hta|ins|isp|jse|lib|mde|msc|msp|mst|pif|scr|sct|shb|sys|vb|vbe|vbs|vxd|wsc|wsf|wsh)$"
```

### Remove all the files except abc in the directory
```sh
find * ! -name abc | xargs rm
```

### recursivly open all recently crashed vim buffers in restore mode
```sh
find ./ -type f -mtime -1 -name .*.sw[po] -print | sed -r 's/^(.+)\/\.(\S+)\.sw[op]$/\1\/\2/' | xargs vim -r
```

### Edit all files found having a specific string found by grep
```sh
find . -exec grep foobar /dev/null {} \; | awk -F: '{print $1}' | xargs vi
```

### Find all files containing a word
```sh
find . -name "*.php" -exec grep -il searchphrase {} \;
```

### Edit all files found having a specific string found by grep
```sh
find . -type f -exec grep -qi 'foo' {} \; -print0 | xargs -0 vim
```

### Delete Text Editor's Backup
```sh
find . -name "*~" -exec rm {} \;
```

### Search through files, ignoring .svn
```sh
find . | grep -v svn
```

### make GNU find follow symbolic links
```sh
find -L /home/sonic/archive -name '*gz' -type f
```

### search for the content in a directory
```sh
find . -exec grep "test" '{}' /dev/null \; -print
```

### remove files and directories with acces time older than a given date
```sh
find <dir> -printf '%p : %A@\n' | awk '{FS=" : " ; if($2 < <time in epoc> ) print $1 ;}' | xargs rm verbose -fr ;
```

### Recursively remove all empty directories
```sh
find . -type d | tac | xargs rmdir 2> /dev/null
```

### finds all files that contain "some string"
```sh
find . -type f -exec grep -l "some string" {} \;
```

### remove files and directories with acces time older than a given time
```sh
find -amin +[n] -delete
```

### Find errors in your php website
```sh
find -name "*.php" -exec php -l {} \; | grep -v "No syntax errors"
```

### Find all files with setuid bit
```sh
find / -xdev \( -perm -4000 \) -type f -print0 | xargs -0 ls -l
```

### Find dead symbolic links
```sh
find -type l -xtype l
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | numsum
```

### Get a quick list of all user and group owners of files and dirs under the cwd.
```sh
find -printf '%u %g\n' | sort | uniq
```

### Find PHP files
```sh
find . -name "*.php" -print0 | xargs -0 grep -i "search phrase"
```

### Recursively remove all '.java.orig' directories (scalable)
```sh
find . -depth \( -path '*/*.java.orig' -o -path '*/*.java.orig/*' \) -delete
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -name "*.pyc" -exec rm {} \;
```

### Count total number of subdirectories in current directory starting with specific name.
```sh
find . -type d -name "*TestDir*" | wc -l
```

### find the biggest files recursively, no matter how many
```sh
find . -type f|perl -lne '@x=sort {$b->[0]<=>$a->[0]}[(stat($_))[7],$_],@x;splice(@x,11);print "@{$x[0]}";END{for(@x){print "@$_"}'
```

### Find in all files in the current directory, just a find shorthand
```sh
find ./ -name $1 -exec grep -H -n $2 '{}' ';'
```

### Find today created files
```sh
find -maxdepth 1 -type f -newermt "00:00" -printf "%f\n" | sort
```

### Calculates fake folder checksum based on folder's files' md5sums
```sh
find path/to/folder/ -type f -print0 | xargs -0 -n 1 md5sum | awk '{print $1}' | sort | md5sum | awk '{print $1}'
```

### Rezip a bunch of files
```sh
find . -name "*.gz" | xargs -n 1 -I {} bash -c "gunzip -c {} | sort | gzip -c best > {}.new ; rm {} ; mv {}.new {}"
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec ls -tr {} +
```

### Replace spaces with tabs & format file source recursuvely within a directory
```sh
find $DIR -name *.php -exec vim -u NONE -c 'set ft=php'	-c 'set shiftwidth=4' -c 'set tabstop=4' -c 'set noexpandtab!' -c 'set noet' -c 'retab!' -c 'bufdo! "execute normal gg=G"' -c wq {} \;
```

### Recursively deletes DIR directories
```sh
find . -type d -name DIR -print0 | xargs -r0 rm -r
```

### Buscar archivos con la extension mp3 y mostrar el conteo de resultados
```sh
find -D rates . -name "*.mp3" -type f
```

### List your FLAC albums
```sh
find -iname '*.flac' | sed 's:/[^/]*$::' | uniq
```

### a find and replace within text-based files
```sh
find /path/ -type f -exec grep -l '<string of text>' {} \; | xargs sed -i -e 's%<string of text>%<new text string>%g'
```

### Move files older than 30 days in current folder to
```sh
find . -mtime +30 -exec mv {} old/ \;
```

### do mvn clean in subdirs to free disk space
```sh
find -name pom.xml | while read f; do cd $(dirname "$f"); mvn clean; cd -; done;
```

### exec chmod to subfiles
```sh
find . -type f -print0 | xargs -0 chmod a-x
```

### Find size of the files in this directory tree. (sorted)
```sh
find . -type f -exec ls -s \{\} \; | sort -n
```

### Recursively calculate and dump md5 sums of all files within a directory
```sh
find . -type f -name '*' -exec md5sum '{}' + > hashes.txt
```

### finds all files in dir and replaces
```sh
find . -type f -exec sed -i 's/gw10./gw17./g' {} \;
```

### Look for jQuery version script include in files *asp*$, *htm*$ ie. not *.aspx.cs
```sh
find . \( -name "*.as[pc]x" -o -name "*.htm*" \) -exec grep -Hi "jquery-1" {} +
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name '*.gz'|awk '{print "zcat", $1, "| bzip2 -c >", $0.".tmp", "&& rename", "s/.gz.tmp/.bz2/", "*.gz.tmp", "&& rm", $0}'|bash
```

### Convert all .flac from a folder subtree in 192Kb mp3
```sh
find . -type f -iname '*.flac' | while read FILE; do FILENAME="${FILE%.*}"; flac -cd "$FILE" | lame -b 192 - "${FILENAME}.mp3"; done
```

### Recursively search for large files. Show size and location.
```sh
find . -size +100000k -exec du -h {} \;
```

### recursive reset file/dir perms
```sh
find public_html/stuff -type d -exec chmod 755 {} + -or -type f -exec chmod 644 {} +
```

### Remove everything except that file
```sh
find . ! -name <FILENAME> -delete
```

### Find all files and append to file
```sh
find . type f -exec echo http://exg.com/{} \; > file
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG'  | xargs -I{} mogrify -resize 1024">" -quality 40 {}
```

### Remove .svn dirs
```sh
find . -name ".svn" -type d -exec rm -rf {} \;
```

### Command for getting the list of files with perms, owners, groups info. Useful to find the checksum of 2 machines/images.
```sh
find / | xargs ls -l | tr -s ' ' | cut -d ' ' -f 1,3,4,9
```

### Find files modified in the last 5 days, no more than 2 levels deep in the current directory.
```sh
find . -type f -depth -3 -mtime -5
```

### Find Files over 20Meg
```sh
find / -type f -size +20000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### build cscope.out from all *.{h,cpp}, but ignore hidden files
```sh
find `pwd` -name '.*' -prune -o \( -name *.h -o -name *.cpp \) -print | cscope -bi-
```

### find files owned by root and make them your own again
```sh
find . -user root | xargs sudo chown me:me
```

### Normalize volume in your mp3 library
```sh
find . -type d -exec sh -c "normalize-audio -b \"{}\"/*.mp3" \;
```

### shrink firefox database
```sh
find ~/.mozilla -name '*.sqlite' -exec sqlite3 {} VACUUM \;
```

### Simple Find
```sh
find / -name FILENAME
```

### To reduce the size of saved webpages
```sh
find /path/to/webpages -type f -name '*.js' -exec 'rm' '{}' \;
```

### Chmod all files (excluding directories)
```sh
find public_html/ -type f -exec chmod 664 {} \;
```

### create backup for all files from current dir
```sh
find . -maxdepth 1 -type f -print0 | xargs -0 -i cp ./{}{,.bak}
```

### List files in tarballs
```sh
find <path> -name "*.tgz" -or -name "*.tar.gz" | while read file; do echo "$file: "; tar -tzf $file; done
```

### find files containing specifc pattern on filename and specific patternts in its content, open all in textmate
```sh
find . -name "*noticia*" -name "*jhtm*" -name "*.tpl" -exec grep -li "id=\"col-direita\"" '{}' \; | xargs -n1 mate
```

### Process each item with multiple commands (in while loop)
```sh
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done
```

### Remove executable bit from all files in the current directory recursively, excluding other directories, firm permissions
```sh
find . -type f -exec chmod 640 {} ';'
```

### Find/Replace in a bunch of files and keep a log of the changes
```sh
find . -type f | xargs grep -n "Old Text" | tee filesChanged.txt | sed 's/:.*$//' | xargs sed -i 's/Old Text/New Text/g
```

### Remove the Apple quarantine
```sh
find . | xargs xattr -d com.apple.quarantine
```

### Recursively delete .svn folders
```sh
find . -name .svn | xargs rm -rf
```

### best command for searching files
```sh
find / -name \*string\*
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' | grep -v '\.lzma$' | xargs -n 1 lzma -f -v -3
```

### Write a shell script that removes files that contain a string
```sh
find . | xargs grep -l "FOOBAR" | awk '{print "rm -f "$1}' > doit.sh
```

### Recursively remove all empty directories
```sh
find . -depth -type d -empty -exec rmdir -v {} \;
```

### Look for a string in one of your codes, excluding the files with svn and ~ (temp/back up files)
```sh
find . -type f -exec grep StringToFind   \{\} with-filename \;|sed -e '/svn/d'|sed -e '/~/d'
```

### Find top 5 big files
```sh
find . -type f -exec ls -s {} \; | sort -n -r | head -5
```

### rm filenames with spaces
```sh
find /Users/jpn/.ievms/ -type f -print0| xargs -0 du -sh
```

### Counts the number of TODOs in files with extension EXT found from the current dir.
```sh
find . -name "*.EXT" | xargs grep -n "TODO" | wc -l
```

### Recursive file content search
```sh
find . -name *.php | xargs grep -i -n 'TERM'
```

### Copy all JAR files to folder /tmp
```sh
find . -iname "*.jar" -exec cp '{}' /tmp/ \;
```

### Search through files, ignoring .svn
```sh
find . -type f -print0 | grep -vzZ '.svn' | xargs -0 grep color -nEHi "SEARCHTERM"
```

### Recursively remove all .svn directories
```sh
find . -name .svn -type d | parallel rm -rf
```

### Find files and list them with a readable informative output
```sh
find . -type f | sed 's,.*,stat "&" | egrep "File|Modify" | tr "\\n" " " ; echo ,'  | sh | sed 's,[^/]*/\(.*\). Modify: \(....-..-.. ..:..:..\).*,\2 \1,' | sort
```

### rm all files you grep
```sh
find . | grep deleteme | while read line; do rm $line; done
```

### Copy All mp3 files in iTunes into one folder (Example: Music on Desktop) (Os X)
```sh
find ~/Music/iTunes/ -name *.mp3 -exec cp {} ~/Desktop/Music/  \;
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -print | xargs grep -i -H "search phrase"
```

### find the 10 largest directories
```sh
find . -type d -print0 | xargs -0 du -s | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {} | sort -rn
```

### Removes Apple "garbage"
```sh
find . -name *DS_Store -exec echo rm {} \;
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec env d="$dest_root" sh -c ' exec mkdir -p  "$d/$1"' '{}' '{}' \;
```

### Finding files with different extensions
```sh
find . -regex '.*\(h\|cpp\)'
```

### How many lines in your c project?
```sh
find -name *.\[c\|h\] | xargs wc -l
```

### Look for timthumb.php or thumb.php and get its version.
```sh
find `pwd` -type f \( -iname thumb.php -or -iname timthumb.php \) -exec grep -HP 'define ?\(.VERSION' {} \;
```

### sorts /dev/random
```sh
find /dev/ -name random -exec bash -c '[ -r $0 -a -w $0 ] && dd if=$0 | sort | dd of=$0' {} \;
```

### Remove executable bit from all files in the current directory recursively, excluding other directories, firm permissions
```sh
find . -type f -exec chmod a-x {} \;
```

### List dot-files and dirs, but not . or ..
```sh
find directory -maxdepth 1 -iname "*" | awk 'NR >= 2'
```

### md5sum for files with bad characters
```sh
find . -type f -exec md5sum {} \;
```

### /bin/rm: Argument list too long.
```sh
find . -name 'spam-*' |xargs rm;find . -name 'spam-*' -print0 | xargs -0 rm
```

### Remove all pyc files
```sh
find . -name \*.pyc -delete
```

### Replace spaces with tabs & format file source recursively within a directory
```sh
find . -type f -name \*.php | while IFS="" read i; do expand -t4 "$i" > "$i-"; mv "$i-" "$i"; done
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -exec cat {} \;|wc -l
```

### Removes the .svn entries from a project
```sh
find -name ".svn" -exec rm -rf {} \;
```

### Shortcut to find files with ease.
```sh
findfile() { find . -type f -iname "*${*}*" ; }
```

### Search all files of type *.php for string 'specialFunction' and output the result in searchResult.txt
```sh
find . -name "*.php" | xargs egrep -i -s 'specialFunction' > searchresult.txt
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . -type f | while read f; do chmod -x "$f"; done
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i -H "search pharse" {} \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} \;
```

### find files in a date range
```sh
find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
```

### Find all IP's in /etc directory
```sh
find /etc -exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*' {} \;
```

### show directory three
```sh
find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"
```

### delete files except some file
```sh
find . |more |grep -v filename |xargs rm
```

### bat add copyright info
```sh
find . -name "*.c" -exec sed -i "/\/sh/a\####################################\n#Date:2010-05-18\n#Company:XXXXX tech Co.\n#Author:Wangjunling\n#Copyright:gpl\n####################################" {} \;
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' | xargs rm -r
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ |xargs grep -i "phrase"
```

### Delete all files in current directory that have been modified less than 5 days ago.
```sh
find ./ -mtime -5 | xargs rm -f
```

### Remove VIM temp files
```sh
find . -name "*~" -exec rm {} \;
```

### exec option in find
```sh
find ~ -mtime +365 -exec mv {} /tmp/mybackup \;
```

### Searching files
```sh
find /dir/ -name *name*
```

### Recursive chmod all files and directories within the current directory
```sh
find . -exec chmod 777 {} \;
```

### "Reset" directories permissions
```sh
find . -type d -exec chmod 0755 {} \;
```

### Move files matching a certain pattern to another folder
```sh
find . | grep ".*\[[Church|CPYAF].*" | while read f; do mv "$f" ../emails;done
```

### egrep -r replacement for UNIX systems
```sh
find . -type f | xargs grep -l "string"
```

### Search for all files that begin with . and delete them.
```sh
find ~/Desktop/ \( -regex '.*/\..*' \) -print -exec rm -Rf {} \;
```

### Find only *.doc and *xls files on Windows partition
```sh
find Documents\ and\ Settings -iregex .+\.doc -or -iregex .+\.xls > office.lst
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type d -name '*[A-Z]*' -execdir bash -c '! test -f "$(echo "$0" | tr "[:upper:]" "[:lower:]")"' {} \; -execdir bash -c 'mv "$0" "$(echo "$0" | tr "[:upper:]" "[:lower:]")"' {} \;
```

### Open a list of files in VIM using separate terminal windows
```sh
find . -name "*.java" -exec gnome-terminal \-x vim {} \;
```

### Find different filetypes in current directory
```sh
find . -maxdepth 1 -type f -name '*.sh' -o -name '*.txt'
```

### sirve para ver la salida de un comando en pantalla y al mismo tiempo guardar la salida en un fichero
```sh
find / -name *.conf | tee salida
```

### cleaning after python
```sh
find ~ -name "*.pyc" -exec rm {} \;
```

### List the size (in human readable form) of all sub folders from the current location
```sh
find . -maxdepth 1 -type d -not -name . -exec du -sh {} +
```

### Count a number of files (only files, not dirs) in a directory recursevely
```sh
find . -type f | wc -l
```

### renombrar un archivo que inicia con guion
```sh
find . -name "-help" -exec mv {} help.txt \;
```

### Recursive chmod all files and directories within the current directory
```sh
find . -name "*" -print0 | xargs -0 -I {} chmod 777 {}
```

### "Reset" file permissions
```sh
find . -type f -exec chmod 0644 {} \;
```

### Altera texto dentro dos arquivos retornados pelo comando 'find'  (find and replacing strings on all files in directory)
```sh
find ./wp-content/themes/rotce2009/ -name '*.php' -type f | xargs sed -i 's/<? /<?php /g'
```

### Execute commands on files found by the find command
```sh
find -iname "MyCProgram.c" -exec md5sum {} \;
```

### Read directory contents recursively
```sh
find . |while read f;do echo "$f";done
```

### Find all files containing a word
```sh
find . -exec grep -l "sample" {} \;
```

### Thumbs.db&#12434;&#25506;&#12375;&#20986;&#12375;&#12390;&#20840;&#37096;&#28040;&#12377;
```sh
find /tank -iname thumbs.db -print0 | xargs -0 rm
```

### Find broken symlinks
```sh
find . -type l | xargs file  | grep broken
```

### Replace spaces with '_' in filenames
```sh
find -depth . | (while read FULLPATH; do BASENAME=`basename "${FULLPATH}"`; DIRNAME=`dirname "${FULLPATH}"`; mv "${DIRNAME}/${BASENAME}" "${DIRNAME}/${BASENAME// /_}"; done)
```

### Recursive chmod all files and directories within the current directory
```sh
find . -print -exec chmod 777 {} \;
```

### Recursive chmod all files and directories within the current directory
```sh
find | xargs chmod 777
```

### Grep only files matching certain pattern (Advanced)
```sh
find <path> |xargs grep <pattern>
```

### find .txt files inside a directory and replace every occurrance of a word inside them via sed
```sh
find . -name '*.txt' -exec sed -ir 's/this/that/g' {} \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec bash -c 'mv "$1" "${1/%.JPG/.jpg}"'  {} \;
```

### Advanced LS Output using Find for Formatted/Sortable File Stat info
```sh
find $PWD -maxdepth 1 -printf '%.5m %10M %#9u:%-9g %#5U:%-5G  [%AD | %TD | %CD]  [%Y] %p\n'
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 755 {} +
```

### Find all files of a type and copy them elsewhere while keeping intact their full directory structure using find and cpio
```sh
find . -iname "*.flac" | cpio -pdm /Volumes/Music/FLAC
```

### How many files in the current directory ?
```sh
find . -maxdepth 1 -type f | wc -l
```

### Skip over .svn directories when using the
```sh
find . -name .svn -prune -o -print
```

### Find dead symbolic links
```sh
find -L -type l
```

### Calculate md5 sums for every file in a directory tree
```sh
find . -type f -exec md5sum {} \; > sum.md5
```

### Monitor logs in Linux using Tail
```sh
find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
```

### List latest 5 modified files recursively
```sh
find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' | sort -nr | head -n 5 | cut -f2- -d" "
```

### find and delete empty directories recursively
```sh
find . -depth -type d -empty -exec rmdir -v {} +
```

### Remove empty directories
```sh
find . -type d -empty -delete
```

### Find today created files
```sh
find directory/ -mtime 0 -type f
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 | xargs rm -vf
```

### Find 'foo' string inside files
```sh
find . -type f -print | xargs grep foo
```

### Count the total number of files in each immediate subdirectory
```sh
find . -type f -printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn
```

### Search $PATH for a command or something similar
```sh
find ${PATH//:/ } -name \*bash\*
```

### Change string in many files at once and more.
```sh
find . -type f -exec grep -l XXX {} \;|tee /tmp/fileschanged|xargs perl -pi.bak -e 's/XXX/YYY/g'
```

### a find and replace within text-based files, to locate and rewrite text en mass.
```sh
find . -name "*.txt" | xargs perl -pi -e 's/old/new/g'
```

### Fix "broken" ID3 tags in the current directory and subdirectories
```sh
find -iname '*mp3' -exec mid3iconv {} \;
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \;
```

### find all file larger than 500M
```sh
find / -type f -size +500M
```

### Find last modified files in a directory and its subdirectories
```sh
find . -type f -print0 | xargs -0 stat -c'%Y :%y %12s %n' | sort -nr | cut -d: -f2- | head
```

### List files above a given threshold
```sh
find . -type f -size +25000k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
```

### Compress files found with find
```sh
find ~/bin/ -name "*sh" -print0 | xargs -0t tar -zcvf foofile.tar.gz
```

### Find files that are older than x days
```sh
find . -type f -mtime +7 -exec ls -l {} \;
```

### get the top 10 longest filenames
```sh
find | sed -e "s/^.*\///" | awk ' BEGIN { FS=""} { print NF "  " $0  } ' | sort -nrf | head -10
```

### Delete files older than..
```sh
find /dir_name -mtime +5 -exec rm {} \
```

### Find all the files more than 10MB, sort in descending order of size and record the output of filenames and size in a text file.
```sh
find . -size +10240k -exec ls -l {} \; | awk '{ print $5,"",$9 }'|sort -rn > message.out
```

### Change the ownership of all files owned by one user.
```sh
find /home -uid 1056 -exec chown 2056 {} \;
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f | parallel -j+0 grep -i foobar
```

### Find files and list them sorted by modification time
```sh
find -printf "%C@ %p\n"|sort
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} + | sort -n
```

### Find directories under home directory with 777 permissions, change to 755, and list them on console
```sh
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
```

### Remove all .svn folders
```sh
find . -depth -name .svn -type d -exec rm -fr {} \;
```

### Show drive names next to their full serial number (and disk info)
```sh
find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
```

### Find and copy scattered mp3 files into one directory
```sh
find . -iname '*.mp3' -type f -print0 | xargs -I{} -0 cp {} </path>
```

### Trick find -exec option to execute alias
```sh
find . -exec `alias foo | cut -d"'" -f2` {} \;
```

### Skip over .svn directories when using the "find" command.
```sh
find . -not \( -name .svn -prune \)
```

### copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
```sh
find . -printf "touch -m -d \"%t\" '%p'\n" | tee /tmp/retime.sh
```

### Finding all files on local file system with SUID and SGID set
```sh
find / \( -local -o -prune \) \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \;
```

### cleanup /tmp directory
```sh
find /tmp -type f -atime +1 -delete
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -executable -type f -printf "%f\n"
```

### Remove all the files except abc in the directory
```sh
find * -maxdepth 1 -type f ! -name abc -delete
```

### ShellCheck all the bash/sh script under a specific directory excluding version control
```sh
find .  -type f ! -path "./.git/*" -exec sh -c "head -n 1 {} | egrep -a 'bin/bash|bin/sh' >/dev/null" \; -print -exec shellcheck {} \;
```

### find files larger than 1 GB, everywhere
```sh
find / -type f -size +1000000000c
```

### Batch Convert SVG to PNG (in parallel)
```sh
find . -name \*.svg -print0 | xargs -0 -n1 -P4 -I{} bash -c 'X={}; convert "$X" "${X%.svg}.png"'
```

### Gzip files older than 10 days matching *
```sh
find . -type f -name "*" -mtime +10 -print -exec gzip {} \;
```

### Faster find and move using the find and xargs commands. Almost as fast as locate.
```sh
find . -maxdepth 2 -name "*somepattern" -print0 | xargs -0 -I "{}" echo mv "{}" /destination/path
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find . -type f | grep -rl $'\xEF\xBB\xBF'
```

### View all new log messages in real time with color
```sh
find /var/log -type f -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Count number of files in a directory
```sh
find . -maxdepth 1 -type f | wc -l
```

### tar and remove files which are older that 100 days
```sh
find . -type f -mtime +100 -exec tar rvf my.tar remove-files {} \;
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
find ./ -type f -name "*.txt" -exec tar uvf myarchives.tar {} +
```

### Speed up launch of firefox
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### Remove Backup Files
```sh
find / -name *~ -delete
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f -print0 | xargs -0 -P 4 -n 40 grep -i foobar
```

### fix broken permissions
```sh
find /path -type d -perm 777 -exec chmod 755 {} \;
```

### Recursively remove all subversion folders
```sh
find . -name .svn  -exec rm \-rf {} \;
```

### find external links in all html files in a directory list
```sh
find . -name '*.html' -print0| xargs -0 -L1 cat |sed "s/[\"\<\>' \t\(\);]/\n/g" |grep "http://" |sort -u
```

### Create md5sum of files under the current dir excluding some directories
```sh
find . -type d \( -name DIR1 -o -name DIR2 \) -prune -o -type f -print0 | xargs -r0 md5sum
```

### find all non-html files
```sh
find . -type f ! -name "*html"
```

### Remove all backup files in my home directory
```sh
find ~user/ -name "*~" -exec rm {} \;
```

### List files with full path
```sh
find $(pwd) -maxdepth 1
```

### Skip filenames with control characters, a.k.a tab,newline etc
```sh
find . ! -name "$(printf '*[\001-\037\177]*')"
```

### Find writable files
```sh
find -writable
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} +
```

### take a look to command before action
```sh
find /tmp -type f -printf 'rm "%p";\n'
```

### Grep only files matching certain pattern (Advanced)
```sh
find . -path "*/any_depth/*" -exec grep "needle" {} +
```

### Recursively remove .svn directories
```sh
find . -type d -name .svn -delete
```

### Recursively remove .svn directories from a local repository
```sh
find . -type d -name .svn -execdir rm -rf {} +
```

### Remove annoying OS X DS_Store folders
```sh
find . -name .DS_Store -exec rm {} \;
```

### Recursive cat - concatenate files (filtered by extension) across multiple subdirectories into one file
```sh
find . -type f -name *.ext -exec cat {} > file.txt \;
```

### Eliminate dead symlinks interactively in /usr/ recursevely
```sh
find /usr/ -type l ! -xtype f ! -xtype d -ok rm -f {} \;
```

### find largest file in /var
```sh
find /var -mount -ls -xdev | /usr/bin/sort -nr +6 | more
```

### Recursively Find Images, Convert to JPEGS and Delete
```sh
find . -name '*'.tiff -exec bash -c "mogrify -format jpg -quality 85 -resize 75% {} && rm {}" \;
```

### Print the 10 deepest directory paths
```sh
find . -type d | perl -nle 'print s,/,/,g," $_"' | sort -n | tail
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -delete
```

### check for write/read permissions
```sh
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null
```

### Size(k) of directories(Biggest first)
```sh
find . -depth -type d -exec du -s {} \; | sort -k1nr
```

### Find broken symlinks in the current directory and its subdirectories.
```sh
find -L -type l
```

### Find jpeg images and copy them to a central location
```sh
find . -iname "*.jpg" -print0 | tr '[A-Z]' '[a-z]' | xargs -0 cp backup=numbered -dp -u target-directory {location} &
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '($1 < 2048) {print $2}'
```

### Lists all directories under the current dir excluding the .svn directory and its contents
```sh
find . \( -type d -name .svn -prune \) -o -type d -print
```

### Add SVN keywords property to all PHP and Javascript files
```sh
find . \( -name "*.php" -o -name "*.js" \) -exec svn propset svn:keywords Id {} \;
```

### Write a shell script that removes files that contain a string
```sh
find -type f -exec grep -q "regexp" {} \; -delete
```

### bash find function
```sh
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }
```

### List only executables installed by a debian package
```sh
find $(dpkg -L iptables) -maxdepth 0 -executable -type f
```

### Coping files, excluding certain files
```sh
find ./ ! -name 'excludepattern' | xargs -i cp parents {} destdir
```

### Sum size of files returned from FIND
```sh
find [path] [expression] -exec du -ab {} \; | awk '{total+=$0}END{print total}'
```

### find . -name
```sh
find . -name "*.txt" -exec sed -i "s/old/new/" {} \;
```

### Convert encoding from cp1252 (MS Windows) to UTF-8 on source code files
```sh
find . -iname *.java -type f -exec bash -c "iconv -f WINDOWS-1252 -t UTF-8 {}  > {}.tmp " \; -exec mv {}.tmp {} \;
```

### files and directories in the last 1 hour
```sh
find ./* -ctime -1 | xargs ls -ltr color
```

### Find files modified since a specific date
```sh
find /path/to/somewhere -newermt "Jan 1"
```

### Generate a playlist of all the files in the directory, newer first
```sh
find . -type f -print0 | xargs -r0 stat -c %Y\ %n | sort -rn | gawk '{sub(/.\//,"",$2); print $2}' > /tmp/playlist.m3u
```

### Another way to calculate sum size of all files matching a pattern
```sh
find . -iname '*.jar' | xargs du -ks | cut -f1 | xargs echo | sed "s/ /+/g" | bc
```

### Show the disk usage for files pointed by symbolic link in a directory
```sh
find /usr/lib -maxdepth 1 -type l -print0  | xargs -r0 du -Lh
```

### Delete recursively only empty folders on present dir
```sh
find ./ -empty -type d -delete
```

### Convert all WMF images to SVG recursively ignoring file extension case
```sh
find . -type f -iname '*.wmf' | while read FILE; do FILENAME="${FILE%.*}"; wmf2svg -o ${FILENAME}.svg $FILE; done
```

### List commands with a short summary
```sh
find `echo "${PATH}" | tr ':' ' '` -type f | while read COMMAND; do man -f "${COMMAND##*/}"; done
```

### Counts number of lines
```sh
find . \( -name '*.h' -o -name '*.cc' \) | xargs grep . | wc -l
```

### Parallel mysql dump restore
```sh
find -print0 | xargs -0 -n 1 -P 4 -I {} sh -c "zcat '{}' | mysql nix"
```

### DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
```sh
find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00" if ($h eq $ph)'|xargs -0 rm -v 
```

### Find broken symlinks and delete them
```sh
find -L /path/to/check -type l -delete
```

### Give any files that don't already have it group read permission under the current folder (recursive)
```sh
find . -type f ! -perm /g=r -exec chmod g+r {} +
```

### Recursively lists all files in the current directory, except the ones in '.snapshot' directory
```sh
find . -wholename './.snapshot' -prune -o -print
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name \*.pdf -exec pdfinfo {} \; | grep Pages | sed -e "s/Pages:\s*//g" | awk '{ sum += $1;} END { print sum; }'
```

### Convert all files for iPhone with HandbrakeCLI
```sh
find . -name \*.avi -exec HandBrakeCLI -i "{}" -o "{}".iphone.mp4 preset="iPhone & iPod Touch" \;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf '{}' +
```

### Move all but the newest 100 emails to a gzipped archive
```sh
find $MAILDIR/ -type f -printf '%T@ %p\n' | sort reverse | sed -e '{ 1,100d; s/[0-9]*\.[0-9]* \(.*\)/\1/g }' | xargs -i sh -c "cat {}&&rm -f {}" | gzip -c >>ARCHIVE.gz
```

### Indent all the files in a project using emacs
```sh
find -iname \*.[ch] -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -delete
```

### Cleanup Python bytecode files
```sh
find . -name "*.py[co]" -exec rm -f {} \;
```

### Create incremental snapshots of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -g "$destdir"/"$tarfile".snar -czf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" | xargs grep "TODO"
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" -exec grep "TODO" {} +
```

### Replace + Find
```sh
find <mydir> -type f -exec sed -i 's/<string1>/<string2>/g' {} \;
```

### Find which jars contain a class
```sh
find . -name "*.jar" | while read file; do echo "Processing ${file}"; jar -tvf $file | grep "Foo.class"; done
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir/ -type f -exec rm {} +
```

### find and grep Word docs
```sh
find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;
```

### Show all symlinks
```sh
find ./ -type l -ls
```

### Cleanup firefox's database.
```sh
find ~/.mozilla/firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Find Duplicate Files (based on MD5 hash)
```sh
find -type f -exec md5sum '{}' ';' | sort | uniq all-repeated=separate -w 33 | cut -c 35-
```

### Find and display most recent files using find and perl
```sh
find $HOME -type f -print0 | perl -0 -wn -e '@f=<>; foreach $file (@f){ (@el)=(stat($file)); push @el, $file; push @files,[ @el ];} @o=sort{$a->[9]<=>$b->[9]} @files; for $i (0..$#o){print scalar localtime($o[$i][9]), "\t$o[$i][-1]\n";}'|tail
```

### Find all files with colons and replace with underscores; current directory and below (recursive).
```sh
find ./ -name '*:*' -exec rename 's/:/_/g' {} +
```

### Clone current directory into /destination verbosely
```sh
find . | cpio -pumdv /destination
```

### Find broken symlinks
```sh
find . -type l -xtype l
```

### recursive remove all htm files
```sh
find . -type f -name '*.htm' -delete
```

### Recursivly search current directory for files larger than 100MB
```sh
find -size +100M
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -printf "%s\n" | awk '{total += $1} END {print total}'
```

### rsync directory tree including only files that match a certain find result.
```sh
find /src/dir/ -mtime -10 -printf %P\\0|rsync files-from=- from0 /src/dir/ /dst/dir/
```

### Find and remove core files
```sh
find . -type f -regex '.*/core\.?[0-9]*$' -delete
```

### Quick HTML image gallery
```sh
find . -iname "*.jpg" -printf '<img src="%f" title="%f">\n' > gallery.html
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn
```

### find duplicate messages in a Maildir
```sh
find $folder -name "[1-9]*" -type f -print|while read file; do echo $file $(sed -e '/^$/Q;:a;$!N;s/\n //;ta;s/ /_/g;P;D' $file|awk '/^Received:/&&!r{r=$0}/^From:/&&!f{f=$0}r&&f{printf "%s%s",r,f;exit(0)}');done|sort -k 2|uniq -d -f 1
```

### List only directories, one per line
```sh
find . -type d -maxdepth 1
```

### Count number of files in subdirectories
```sh
find . -maxdepth 1 -type d -exec sh -c "printf '{} ' ; find '{}' -type f -ls | wc -l" \;
```

### Selecting a random file/folder of a folder
```sh
find . | shuf -n1
```

### Grab a list of MP3s out of Firefox's cache
```sh
find ~/.mozilla/firefox/*/Cache -exec file {} \; | awk -F ': ' 'tolower($2)~/mpeg/{print $1}'
```

### Make backups recurse through directories
```sh
find -type -f -exec cp {} {}.bak \;
```

### Delete empty directories recursively
```sh
find <top_level_dir> -depth -type d -empty -exec rmdir -v {} \;
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' -print0 | parallel -0 -j+0 lzma
```

### Search inside a folder of jar/zip files
```sh
find . -name "*.jar" | xargs -tn1 jar tvf | grep color "SearchTerm"
```

### Copy a file structure without files
```sh
find * -type d -exec mkdir /where/you/wantem/\{\} \;
```

### Find all the links to a file
```sh
find -L / -samefile /path/to/file -exec ls -ld {} +
```

### Slightly better compressed archives
```sh
find . \! -type d | rev | sort | rev | tar c files-from=- format=ustar | bzip2 best > a.tar.bz2
```

### Find files with at least one exec bit set
```sh
find . -type f -perm +0111 -print
```

### Find commets in jpg files.
```sh
find / -name "*.jpg" -print -exec rdjpgcom '{}' ';'
```

### LIST FILENAMES OF FILES CREATED TODAY IN CURRENT DIRECTORY
```sh
find -maxdepth 1 -mtime 0 -type f
```

### Find all files that have nasty names
```sh
find -name "*[^a-zA-Z0-9._-]*"
```

### rename all files with "?" char in name
```sh
find . -type f -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find Duplicate Files (based on MD5 hash)  For Mac OS X
```sh
find . -type f -exec md5 '{}' ';' | sort | uniq -f 3 -d | sed -e "s/.*(\(.*\)).*/\1/"
```

### Delete all flash cookies.
```sh
find $HOME -name '*.sol' -exec rm {} \;
```

### List of services sorted by boot order in Redhat-based systems
```sh
find /etc/rc3.d/ | sort -g
```

### Replace underscores with spaces in filenames and dirnames, recursively into subdirs.
```sh
find . -exec rename 's/_/\ /g' {} +
```

### finding more large files
```sh
find / -xdev -size +1024 -exec ls -al {} \; | sort -r -k 5
```

### List mp3 files with less than 320 kbps bitrate.
```sh
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'
```

### List folders containing only PNGs
```sh
find . -name '*png' -printf '%h\0' | xargs -0 ls -l hide=*.png | grep -ZB1 ' 0$'
```

### Replace php short open tags
```sh
find . -name '*.phtml' | xargs perl -pi -e 's/(?!(<\?(php|xml|=)))<\?/<\?php/g;'
```

### Sort files in multiple directories by date
```sh
find .  -type f -exec ls -l full-time {} + | sort -k 6,7
```

### Find where a kind of file is stored
```sh
find . -name '*.desktop' | sed s/[^/]*\.desktop$// | uniq -c | sort -g
```

### Search for files  older than 30 days in a directory and list only their names not the full path
```sh
find /var/www/html/ -type f -mtime +30 -exec basename {} \;
```

### Counts number of lines (in source code excluding comments)
```sh
find . -name '*.java' | xargs -L 1 cpp -fpreprocessed | grep . | wc -l
```

### View all images
```sh
find -iname '*.jpg' -print0 | xargs -0 feh -d
```

### find text in a file
```sh
find /directory/to/search/ -type f -print0 | xargs -0 grep "findtext"
```

### Stat each file in a directory
```sh
find . -maxdepth 1 -type f | xargs stat
```

### Find files and list them sorted by modification time
```sh
find -type f -print0 | xargs -r0 stat -c %y\ %n | sort
```

### Remove last line from files recursively
```sh
find . -name "*.php" -type f -exec sed -i "\$d" '{}' \;
```

### Rename many files in directories and subdirectories
```sh
find . -type d -print0 | while read -d $'\0' dir; do cd "$dir"; echo " process $dir"; find . -maxdepth 1 -name "*.ogg.mp3" -exec rename 's/.ogg.mp3/.mp3/' {} \; ; cd -; done
```

### git pull all repos
```sh
find ~ -maxdepth 2 -name .git -print | while read repo; do cd $(dirname $repo); git pull; done
```

### find out how much space are occuipied by files smaller than 1024K (sic) - improved
```sh
find dir -size -1024k -type f -print0 | du files0-from - -bc
```

### Find Duplicate Files, excluding .svn-directories (based on size first, then MD5 hash)
```sh
find -type d -name ".svn" -prune -o -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type d -name ".svn" -prune -o -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Batch convert files to utf-8
```sh
find . -name "*.php" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o ../newdir_utf8/{} \;
```

### Recursively execute command on directories (.svn, permissions, etc)
```sh
find . -type d -name .svn -exec chmod g+s "{}" \;
```

### Quick HTML image gallery
```sh
find . -iname '*.jpg' | sed 's/.*/<img src="&">/' > gallery.html
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} \; | sort
```

### List top 10 files in filesystem or mount point bigger than 200MB
```sh
find /myfs -size +209715200c -exec du -m {} \; |sort -nr |head -10
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/apt -not -mtime -7 | sudo xargs rm
```

### Recursively touch all files and subdirectories
```sh
find . -exec touch {} \;
```

### Unaccent an entire directory tree with files.
```sh
find /dir | awk '{print length, $0}' | sort -nr | sed 's/^[[:digit:]]* //' | while read dirfile; do outfile="$(echo "$(basename "$dirfile")" | unaccent UTF-8)"; mv "$dirfile" "$(dirname "$dirfile")/$outfile"; done
```

### Compress logs older than 7 days
```sh
find /path/to/files -type f -mtime +7 | grep -v \.gz | xargs gzip
```

### defragment files
```sh
find ~ -maxdepth 20 -type f -size -16M -print > t; for ((i=$(wc -l < t); i>0; i)) do a=$(sed -n ${i}p < t); mv "$a" /dev/shm/d; mv /dev/shm/d "$a"; echo $i; done; echo DONE; rm t
```

### View all new log messages in real time with color
```sh
find /var/log -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Generate SHA1 hash for each file in a list
```sh
find . -type f -exec sha1sum {} >> SHA1SUMS \;
```

### Summarise the size of all files matching a simple regex
```sh
find /path/to/my/files/ -type f -name "*txt*" | xargs du -k | awk 'BEGIN{x=0}{x=x+$1}END{print x}'
```

### Find all files under a certain directory /home that have a certain suffix at the end of the file name. Show the file and rename them to remove the suffix.
```sh
find /home -print -exec rename -v 's/_2009-09-04.suffix$//' {} \;
```

### Print a list of the 30 last modified mp3s sorted by last first
```sh
find ~/Music -daystart -mtime -60 -name *mp3 -printf "%T@\t%p\n" | sort -f -r | head -n 30 | cut -f 2
```

### Find Files That Exceed a Specified Size Limit
```sh
find directory -size +nnn
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -exec rm -f {} \;
```

### copies 20 most recently downloaded mp3 files (such as from Miro) into a directory
```sh
find . -name \*.mp3 -printf "%C+ %h/%f\n" | sort -r | head -n20 | awk '{print "\""$2"\""}' | xargs -I {} cp {} ~/tmp
```

### sort through source to find most common authors
```sh
find . -type f -name "*.java" -print0 | xargs -0 -n 1 svn blame | sed -n 's/^[^a-z]*\([a-z]*\).*$/\1/p' | sort | uniq -c | sort -n
```

### Find the most recently changed files (recursively)
```sh
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -delete
```

### Find directory depth
```sh
find . -printf '%d\n' | sort -n  | tail -1
```

### Move mp3 files to another path with existing subtree structure
```sh
find . -iname "*.mp3" -type f -print0 | xargs -0 -I '{}' mv {} /new/path/to/mp3/{}
```

### 1:1 copy of a volume
```sh
find / -xdev -print | cpio -pdmuv /mnt/mydisk
```

### Command template, executing a command over multiple files, outputing progress and fails only
```sh
find <dir> -name "<pattern>" | while read file; do echo -n .; output=$(<command>) || (echo ; echo $file:; echo "$output"; ); done
```

### Get line count for any file ending with extension recursively rooted at the current directory.
```sh
find . -name "*.py" | xargs wc -l
```

### Find broken symlinks and delete them
```sh
find . -type l -exec test ! -e {} \; -delete
```

### Recover cvs ": no such repository" error
```sh
find ./* -name 'CVS' | awk '{print "dos2unix " $1 "/*"}' | awk '{system($0)}'
```

### Archive all SVN repositories in platform indepenent form
```sh
find repMainPath -maxdepth 1 -mindepth 1 -type d | while read dir; do echo processing $dir; sudo svnadmin dump deltas $dir >dumpPath/`basename $dir`; done
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Get lines count of a list of files
```sh
find . -name "*.sql" -print0 | wc -l files0-from=-
```

### Recursively remove Mac . (dot) files
```sh
find . -name '._*' -type f -delete
```

### Add .gitignore files to all empty directories recursively from your current directory
```sh
find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
```

### Show demo of toilet fonts
```sh
find /usr/share/figlet -name *.?lf -exec basename {}  \; | sed -e "s/\..lf$//" | xargs -I{} toilet -f {} {}
```

### convert filenames in current directory to lowercase
```sh
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
```

### Sort movies by length, longest first
```sh
find -name '*.avi' | while read i ; do echo $(mplayer -identify -frames 0 -vo null -nosound "$i" 2>&1 | grep ID_LENGTH | cut -d= -f2)" ""$i" ;done | sort -k1 -r -n | sed 's/^\([^\ ]*\)\ \(.*\)$/\2:\1/g'
```

### Find C/C++ source files
```sh
find . -name '*.[c|h]pp' -o -name '*.[ch]' -type f
```

### A function to find the newest file in a directory
```sh
find /path/to/dir  -type f -printf "%T@|%p\n" 2>/dev/null | sort -n | tail -n 1| awk -F\| '{print $2}'
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' | xargs grep -H "string"
```

### Determine space taken by files of certain type
```sh
find . -name <pattern> -ls | awk 'BEGIN {i=0}; {i=i+$7}; END {print i}'
```

### Find files recursively that were updated in the last hour ignoring SVN files and folders.
```sh
find . -mmin -60 -not -path "*svn*" -print|more
```

### find string into one pdf file
```sh
find / -iname '*.pdf' -print -exec pdftotext '{}' - \; | grep color -i "unix"
```

### remove execute bit only from files. recursively
```sh
find . -type f -exec chmod -x {} \;
```

### Change files case, without modify directories, recursively
```sh
find ./ -name '*.JPG' -type f -execdir rename -f 'y/A-Z/a-z/' {} \+
```

### finds the c files with lines containing 'mcs', in the folders under the current folder
```sh
find */*.c | xargs grep 'mcs'
```

### Recursively remove .svn directories from the current location
```sh
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf
```

### Count files beneath current directory (including subfolders)
```sh
find . -type f | wc -l
```

### Grep for regular expression globally, list files and positions.
```sh
find . -name "*.pbt" -exec grep -Hirn "declareObject.*Common_Down" {} \;
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '{ if ($1 <2000) print $0 }' | sed 's/^[0-9]*.//'
```

### Delete all files older than X in given path
```sh
find . -mtime +10 -delete
```

### Replicate a directory structure dropping the files
```sh
find . -type d -exec mkdir -p $DESTDIR/{} \;
```

### create a backup for all directories from current dir
```sh
find -maxdepth 1 -type d -print0 | xargs -0 -I {} tar -cvzf {}.tar.gz {}
```

### Find all files containing a word
```sh
find . -name "*.php" | xargs grep -il searchphrase
```

### MP3 player
```sh
find . -name '*.mp3' | sort | while read -r mp3; do echo -e "<h3>$mp3</h3>\n<audio controls src=\"$mp3\"></audio>"; done > index.html; python -m http.server
```

### Invert selection with find.
```sh
find . ! -name "*.tar.gz"
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -print0 | xargs -0 grep -i <pattern>
```

### make a list of movies(.m3u).
```sh
find $HOME -type f -print | perl -wnlaF'/' -e 'BEGIN{ print "#EXTM3U"; } /.+\.wmv$|.+\.mpg$|.+\.vob$/i and print "#EXTINF:$F[-1]\nfile://$&";' > movies.m3u
```

### Normalize volume in your mp3 library
```sh
find . -type f -name '*.mp3' -execdir mp3gain -a '{}' +
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec mkdir /copy_location/{} \;
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 -type d|xargs du -a max-depth=0|sort -rn|cut -d/ -f2|sed '1d'|while read i;do echo "$(du -h max-depth=0 "$i")/";done;find . -maxdepth 1 -type f|xargs du -a|sort -rn|cut -d/ -f2|sed '$d'|while read i;do du -h "$i";done
```

### Find all plain text files that do not contain STRING
```sh
find . -type f ! -exec grep -q 'STRING' {} \; -print
```

### change ownership en masse of files owned by a specific user, including files and directories with spaces
```sh
find . -uid 0 -print0 | xargs -0 chown foo:foo
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -mount -type f -printf "%k %p\n" | sort -rg | cut -d \  -f 2- | xargs -I {} du -sh {} | less
```

### Finds all files from / on down over specified size.
```sh
find / -type f -size +25M -exec ls -lh {} \; | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Find all SUID binaries
```sh
find / -perm +6000 -type f -exec ls -ld {} \;
```

### count the number of specific characters in a file or text stream
```sh
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c
```

### execute command on all files of certain types excluding folders that match pattern
```sh
find . -regextype posix-egrep -regex '.+\.(c|cpp|h)$' -not -path '*/generated/*' -not -path '*/deploy/*' -print0 | xargs -0 ls -L1d
```

### List only directories, one per line
```sh
find * -type d -maxdepth 0
```

### Recurse through directories easily
```sh
find . -type f | while read file; do cp $file ${file}.bak; done
```

### find filenames and directory names that doesn't conform ISO 9660 level 2
```sh
find . -regextype posix-extended -not -regex '.*/[A-Za-z_]*([.][A-Za-z_]*)?'
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do unzip -l $line; done | grep your-string
```

### list files by testing the ownership
```sh
find . -user root
```

### Recursive Line Count
```sh
find * -type f -not -name ".*" | xargs wc -l
```

### Recursive Line Count
```sh
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'
```

### calculate md5 sums for every file in a directory tree
```sh
find . -type f -print0 | xargs -0 md5sum
```

### List out classes in of all htmls in directory
```sh
find . -name '*.html' -exec  'sed' 's/.*class="\([^"]*\?\)".*/\1/ip;d' '{}' ';' |sort -su
```

### Find how much of your life you've wasted coding in the current directory
```sh
find * \( -name "*.[hc]pp" -or -name "*.py" -or -name "*.i" \) -print0 | xargs -0 wc -l | tail -n 1
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/pacman/pkg -not -mtime -7 | sudo xargs rm
```

### Find only *.doc and *xls files on Windows partition
```sh
find /mountpoint -type f -iregex '.*\.\(doc\|xls\)'
```

### recursive search and replace old with new string, inside files
```sh
find . -type f -exec sed -i s/oldstring/newstring/g {} +
```

### Validate all XML files in the current directory and below
```sh
find -type f -name "*.xml" -exec xmllint noout {} \;
```

### recursively remove BOM
```sh
find . -type f -exec sed -i -e '1s/^\xEF\xBB\xBF//' {} \;
```

### Converts all windows .URL shortcuts in a directory to linux (gnome) .desktop shortcuts
```sh
find . -name "*.URL" | while read file ; do cat "$file" | sed 's/InternetShortcut/Desktop Entry/' | sed '/^\(URL\|\[\)/!d' > "$file".desktop && echo "Type=Link" >> "$file".desktop ; done
```

### Find all dotfiles and dirs
```sh
find -mindepth 1 -maxdepth 1 -name .\*
```

### Recursively remove .svn directories
```sh
find . -name .svn -exec rm -r {} +;
```

### find sparse files
```sh
find -type f -printf "%S\t%p\n" 2>/dev/null | gawk '{if ($1 < 1.0) print $1 $2}'
```

### Convert all old SVN repositories in one directory to new format
```sh
find . -maxdepth 1 -type d -exec 'mv "{}" "{}-old" && svnadmin create "{}" && svnadmin recover "{}-old" && svnadmin dump "{}-old" | svnadmin load "{}" && rm -rf "{}-old"' \;
```

### follow the content of all files in a directory
```sh
find dir/ -type f | xargs tail -fqn0
```

### Find inside files two different patterns in the same line and for matched files show number of matched lines
```sh
find . -name '*' -type f -print0 | xargs -0 grep -n pattern1 | grep pattern2
```

### Create md5sum of a directory
```sh
find -type f | grep -v "^./.git" | xargs md5sum | md5sum
```

### Create md5sum of a directory
```sh
find -name .git -prune -o -type f -exec md5sum {} \; | sort -k2 | md5sum
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -regextype posix-egrep -iregex '.*?\.(ogg|mp3)' | sort > ~/mylist.m3u
```

### List all symbolic links in a directory matching a string
```sh
find directory -type l -lname string
```

### Show all mergeinfo for a svn subtree
```sh
find . \( -type d -name .svn -prune \) -o -print | while read file ; do mergeinfo=`svn propget svn:mergeinfo $file` ; [ "$mergeinfo" != "" ] && echo -e "$file\n    $mergeinfo\n" ; done
```

### Create and play an instant keyword based playlist
```sh
find -E ~/Music -type f -iname "*search terms*" -iregex '.*\.(3g[2|p]|aac|ac3|adts|aif[c|f]?|amr|and|au|caf|m4[a|r|v]|mp[1-4|a]|mpeg[0,9]?|sd2|wav)' -exec afplay "{}" \; &
```

### Recursively search and replace old with new string, inside every instance of filename.ext
```sh
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;
```

### finding cr-lf files aka dos files with ^M characters
```sh
find $(pwd) -type f -exec grep -l "$(echo "\r")" {} \;
```

### Change permissions of every directory in current directory
```sh
find . -type d -exec chmod 755 {} \;
```

### Find broken symlinks
```sh
find /path/to/search -xtype l
```

### remove recursively all txt files with number of lines less than 10
```sh
find . -type f -name "*.txt" | while read; do (($(cat $THISFILE | wc -l) < 10)) && rm -vf "$THISFILE";  done
```

### a find and replace within text-based files
```sh
find . -iname "FILENAME" -exec sed -i 's/SEARCH_STRING/REPLACE_STRING/g' {} \;
```

### Simple Gumblar check command
```sh
find filepath -type f -iname "*.html" -o -iname "*.htm" -o -iname "*.php" | xargs grep "Exception\|LGPL\|CODE1"
```

### Iterate through current directory + all subs for C++ header files and rank by # of comments
```sh
find ./ -name *.h -exec egrep -cH "// | /\*" {} \; | awk -F':' '{print $2 ":" $1}' | sort -gr
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f 2>/dev/null | xargs du 2>/dev/null | sort -n | tail -n 10 | cut -f 2 | xargs -n 1 du -h
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Check syntax for all PHP files in the current directory and all subdirectories
```sh
find . -name \*.php -exec php -l "{}" \;
```

### BIGGEST Files in a Directory
```sh
find . -printf '%.5m %10M %#9u %-9g %TY-%Tm-%Td+%Tr [%Y] %s %p\n'|sort -nrk8|head
```

### find all file larger than 500M
```sh
find . -type f -size +500M -exec du {} \; | sort -n
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -iname "*admin*" -executable -type f
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f -size +100M -exec du {} \; | sort -n | tail -10 | cut -f 2
```

### Remove spaces from filenames - through a whole directory tree.
```sh
find . -depth -name '* *' -execdir bash \-c 'a="{}";mv -f "$a" ${a// /_}' \;
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\.//' |sort -f |uniq -i
```

### Find files of two different extensions and copy them to a directory
```sh
find * -regextype posix-extended -regex '.*\.(ext_1|ext_2)' -exec cp {} copy_target_directory \;
```

### FInd the 10 biggest files taking up disk space
```sh
find /home/ -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null
```

### find out how much space are occuipied by files smaller than 1024K
```sh
find dir -size -1024k -type f | xargs -d $'\n' -n1 ls -l | cut -d ' ' -f 5  | sed -e '2,$s/$/+/' -e '$ap' | dc
```

### Find files with size over 100MB and output with better lay-out
```sh
find . -type f -size +100M
```

### RELINK a lot of broken symlinks - FIX broken symlinks after rsync site to new server
```sh
find /PATHNAME -type l | while read nullsymlink ; do wrongpath=$(readlink "$nullsymlink") ; right=$(echo "$wrongpath" | sed s'|OLD_STRING|NEW_STRING|') ; ln -fs "$right" "$nullsymlink" ; done
```

### Stat each file in a directory
```sh
find -name `egrep -s '.' * | awk -F":" '{print $1}' | sort -u` -exec stat {} \;
```

### Clear cassandra snapshots that are older than 30 days
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -mtime +30 -print0 | xargs -0 rm -rf
```

### Delete empty,  24-hours-old directories recursively, without consider hidden directories
```sh
find .  -regex "[^.]*" -depth -empty -type d -mtime +1 -exec rmdir -v {} \;
```

### Erase empty files
```sh
find . -type f -size 0 -delete
```

### Find and delete oldest file of specific types in directory tree
```sh
find / \( -name "*.log" -o -name "*.mylogs" \) -exec ls -lrt {} \; | sort -k6,8 | head -n1 | cut -d" " -f8- | tr -d '\n' | xargs -0 rm
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {};
```

### Quick HTML image gallery from folder contents with Perl
```sh
find . | perl -wne 'chomp; print qq|<img src="$_" title="$_" /><br />| if /\.(jpg|gif|png)$/;'> gallery.html
```

### Find dead symbolic links
```sh
find . -type l | perl -lne 'print if ! -e'
```

### gain all mp3s in subfolders w/o encoding
```sh
find . -type f -iname '*.mp3' -print0 | xargs -0 mp3gain -r -k
```

### find all writable (by user) files in a directory tree (use 4 for readable, 1 for executable)
```sh
find . -type f -perm +200 -print
```

### delete file name space
```sh
find . -type f -print0 | xargs -0 rename 's/\ //g'
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
find /proc/*/fd -xtype f -printf "%l\n" | grep -P '^/(?!dev|proc|sys)' | sort | uniq -c | sort -n
```

### Count the number of deleted files
```sh
find /path/folder -type f -name "*.*" -print -exec rm -v {} + | wc -l;
```

### find and delete empty dirs, start in current working dir
```sh
find . -empty -type d -exec rmdir {} +
```

### Find the biggest files on your hard drive
```sh
find / -type f -size +500000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### search office documents for credit card numbers and social security number SSN docx xlsx
```sh
find  . -iname "*.???x" -type f -exec  unzip -p '{}' '*'
```

### List files in directory tree with newest last
```sh
find <directory> -type f -printf "%T@\t%p\n"|sort -n|cut -f2|xargs ls -lrt
```

### Count all files in directories recursively with find
```sh
find -maxdepth 3 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" | wc -l; done
```

### Recursive search inside the content of files under current directory - then view the result paginated with 'less'
```sh
find . -exec grep -Hn what \{\} \; | less
```

### pngcrush all .png files in the directory
```sh
find . -iname '*png' -exec pngcrush -ow -brute  {} {}.crush \;
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -sk "{}" | sort -rn | head
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 ! -name '.'  -execdir du -0 -s {} + | sort -znr | gawk 'BEGIN{ORS=RS="\0";} {sub($1 "\t", ""); print $0;}' | xargs -0 du -hs
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
find directory -maxdepth 1 -type f  | xargs ls -l | awk 'BEGIN { SUM=0} { SUM+=$5 } END { print SUM/2^20 }'
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0 cat | grep -v "^ *$" | grep -v "^ *//" | grep -v "^ */\*.*\*/" | wc -l
```

### Find files changed between dates defined by ctime of two files specified by name
```sh
find . -cnewer <file a> -and ! -cnewer <file b>
```

### find only current directory (universal)
```sh
find . \( ! -name . -prune \) \( -type f -o -type l \)
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name "*.gz" | while read line ; do gunzip to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done
```

### find xargs mv
```sh
find . -iname "*.mp4" -print0 | xargs -0 mv verbose -t /media/backup/
```

### which procs have $PATH_REGEX open?
```sh
find /proc -regex '/proc/[0-9]+/smaps' -exec grep -l "$PATH_REGEX" {} \; | cut -d'/' -f2
```

### Build an exhaustive list of maildir folders for mutt
```sh
find ~/Maildir/ -mindepth 1 -type d | egrep -v '/cur$|/tmp$|/new$' | xargs
```

### Checks the syntax of all PHP files in and below the current working directory
```sh
find . -name "*.php" -exec php -l {} \; | sed -e "/^No syntax/d"
```

### find large files
```sh
find . -type f -size +1100000k |xargs -I% du -sh %
```

### List all duplicate directories
```sh
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'
```

### Recursively replace a string in files with lines matching string
```sh
find . -type f |xargs -I% sed -i '/group name/s/>/ deleteMissing="true">/' %
```

### move contents of the current directory to the parent directory, then remove current directory.
```sh
find . ! -name "." -print0 | xargs -0 -I '{}' mv -n '{}' ..; rmdir "$PWD"
```

### How to estimate the storage size of all files not named *.[extension] on the current directory
```sh
find . -maxdepth 1 -type f -not -iname '*.jpg' -ls |awk '{TOTAL+=$7} END {print int(TOTAL/(1024^2))"MB"}'
```

### Remove all .svn folders
```sh
find . -name .svn -type d |xargs rm -rf
```

### search for text in files. recursive.
```sh
find /name/of/dir/ -name '*.txt' | xargs grep 'text I am searching for'
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f | grep -o '\.[^./]*$' | sort | uniq
```

### Delete Empty Directories
```sh
find . -type d -exec rmdir {} \;
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort | uniq
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . ! -type d -exec chmod -x {}\;
```

### Create full backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -czf $destdir/"$tarfile"_full.tgz -P $d; done
```

### Create incremental backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir"; tar -czvf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### Directory Tree
```sh
find . -type d -print | sed -e 's;[^/]*/;..........;g'|awk '{print $0"-("NR-1")"}'
```

### Use find to get around Argument list too long problem
```sh
find . -name 'junkfiles-*' -print0 | xargs -0 rm
```

### Find corrupted jpeg image files
```sh
find . -name "*jpg" -exec jpeginfo -c {} \; | grep -E "WARNING|ERROR"
```

### Replicate a directory structure dropping the files
```sh
find . -type d -print0 | (cd $DESTDIR; xargs -0 mkdir)
```

### Find files in multiple TAR files
```sh
find . -type f -name "*.tar" -printf [%f]\\n -exec tar -tf {} \; | grep -iE "[\[]|<filename>"
```

### find matching wholename example
```sh
find -wholename "*/query/*.json"
```

### Summarize size of all files of given type in all subdirectories (in bytes)
```sh
find . -iname '*.jpg' -type f -print0 |perl -0 -ne '$a+=-s $_;END{print "$a\n"}'
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $* | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Print names of all video files encoded with h264
```sh
find -type f -exec bash -c 'if ffmpeg -i "{}" 2>&1 | grep -qi h264 ; then echo "{}"; fi' \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -name '*.mp3' -type f -exec sh -c 'exec cp -f "$@" /home/user/dir' find-copy {} +
```

### increase recurively the modification time for a list of files
```sh
find . -type f | while read line; do NEW_TS=`date -d@$((\`stat -c '%Y' $line\` + <seconds> )) '+%Y%m%d%H%M.%S'`; touch -t $NEW_TS ${line}; done
```

### Periodic Log Deletion
```sh
find /path/to/dir -type f -mtime +[#] -exec rm -f {} \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -type f -iname '*.mp3' -exec cp {} ~/mp3/ \;
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b |while read L; do lvextend -m 1 $L /dev/disk/<disk> ; done
```

### Search specified $TEXT1 and Replace that by specified arg ($TEXT2)
```sh
find "$DIR" -regex "$FILENAME" -type f -print0 | xargs -0 sed -i _`date "+%y%m%d%H%M%S"` -E "s/$TEXT1/$TEXT2/g"
```

### List files older than one year, exluding those in the .snapshot directory
```sh
find /path/to/directory -not \( -name .snapshot -prune \) -type f -mtime +365
```

### Archive all files that have not been modified in the last days
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' -exec grep -H "string" {} \;
```

### Use -t when using find and cp
```sh
find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%-30s'\t\"%h/%f\"\n" | sort -rn -t$'\t' | uniq -w30 -D | cut -f 2 -d $'\t' | xargs md5sum | sort | uniq -w32 all-repeated=separate
```

### Link a deep tree of files all into on directory
```sh
find /deep/tree/ -type f -print0|xargs -0 -n1 -I{} ln -s '{}' .
```

### Arguments too long
```sh
find . -name "*.txt" -exec WHATEVER_COMMAND {} \;
```

### Recursive replace of directory and file names in the current directory.
```sh
find . *oldname* | grep oldname | perl -p -e 's/^(.*)(oldname)(.*$)/mv $1$2$3 $1newname$3/' | sh
```

### Find broken symlinks
```sh
find . -type l ! -exec test -e {} \; -print
```

### find files ignoring .svn and its decendents
```sh
find . -type f ! -iwholename \*.svn\* -print0 [ | xargs -0 ]
```

### Find class in jar
```sh
find . -name '*.jar' | xargs -l jar vtf | grep XXX.java
```

### find files ignoring .svn and its decendents
```sh
find . -type d -name .svn -prune -o -type f -print0 | xargs -r0 ...
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'
```

### Cleanup firefox's database.
```sh
find ~/Library/Application\ Support/Firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Use md5sum to check your music and movie files. Also use diff.
```sh
find . -type f -exec md5sum {}\; > <filename>
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -depth -print -execdir rename -f 'y/A-Z/a-z/' '{}' \;
```

### Bulk renames with find, sed and a little escaping
```sh
find . -exec bash -c "mv '{}' '\`echo {} |sed -e 's/foo/bar/g'\`"' \;
```

### find which of the zip files contains the file you're searching for
```sh
find . -iname '*.zip' | while read file; do unzip -l "$file" | grep -q [internal file name] && echo $file; done
```

### find with high precission (nanoseconds 1/1,000,000,000s) the last changed file.
```sh
find . -type f -print0 | xargs -0 stat -c '%y %n' | sort -n -k 1,1 -k 2,1 | awk 'END{print $NF}'
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -type f -name "*.pyc" -delete;
```

### move all files older than 60 days to a folder
```sh
find ./* -mtime +60 -exec mv {} storeFolder \;
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -exec grep -i <pattern> \;
```

### Quick HTML image gallery from folder contents
```sh
find . -iname '*.jpg' -exec echo '<img src="{}">' \; > gallery.html
```

### Print a list of all hardlinks in the working directory, recursively
```sh
find . -type f -a \! -links 1
```

### find and reduce 8x parallel the size of JPG images without loosing quality via jpegoptim
```sh
find  /var/www/ -type f -name '*.[jJ][pP][gG]' -print0 | xargs -n 1 -P 8 -0 jpegoptim strip-all preserve preserve-perms quiet
```

### Prints the latest modified files in a directory tree recursively
```sh
find . -name '*pdf*' -print0 | xargs -0 ls -lt | head -20
```

### Clone /
```sh
find . -path ./mnt -prune -o -path ./lost+found -prune -o -path ./sys -prune -o -path ./proc -prune -o -print | cpio -pumd /destination && mkdir /destination/mnt/ && mkdir /destination/proc && mkdir /destination/sys
```

### Delete more than one month old thumbnails from home directory
```sh
find  ~/.thumbnails/ -type f -atime +30 -print0 | xargs -0 rm
```

### recursive transform all contents of files to lowercase
```sh
find . -type f -print0 | xargs -0 perl -pi.save -e 'tr/A-Z/a-z/'
```

### Copy files from multiple directories into one directory
```sh
find <start directory> -iname "<all my files type>" -exec cp {} <target_dir> \;
```

### find file/dir by excluding some unwanted dirs and filesystems
```sh
find . -xdev -path ./junk_dir -prune -o -type d -name "dir_name" -a -print
```

### Make a statistic about the lines of code
```sh
find . -type f -name "*.c" -exec cat {} \; | wc -l
```

### Find and copy files from subdirectories to the current directory
```sh
find ./ -iname '*avi' -exec cp  {} ./ \;
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -exec stat -c%s {} \; | awk '{total += $1} END {print total}'
```

### finding cr-lf files aka dos files with ^M characters
```sh
find . -type f -exec fgrep -l $'\r' "{}" \;
```

### Create a tar of directory structure only
```sh
find . -type d|xargs tar rf ~/dirstructure.tar no-recursion
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List movie size in current directory
```sh
find . -regex '\(.*mp4\|.*mpg\|.*mpeg\|.*mov\|.*wmv\|.*mkv\|.*avi\)' -exec exiftool -directory -fileName -imageSize {} \;
```

### Move lots files with AWK
```sh
find . -maxdepth 1 -type f | awk 'BEGIN { c=0 } { if( c == <quantity_at_a_time> ) { print l; l=$0; c=1 } else { if( l != "") { l=l" "$0 } else { l=$0 }; c++}} END { print l }' | xargs mv -t <dir_dest>
```

### remove files that were modified 30 days ago
```sh
find . -mtime +30 -type f -exec rm -rf {} \;
```

### List all files in current dir and subdirs sorted by size
```sh
find . -printf "%s %p\n" | sort -n
```

### To remove all *.swp files underneath the current directory
```sh
find . -name \*.swp -type f -delete
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -exec du -ch {} + | tail -n1
```

### Install an entire folder of .apk files to your android device thru adb
```sh
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;
```

### play all mp4 files on home directory
```sh
find ~ -name '*.mp4' | xargs mplayer
```

### Search recursive all docx files for SearchTerm and print its name
```sh
find . -name '*docx'  -exec sh -c "unzip -p {} word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g' | grep -i SearchTerm -q && echo {} " \;
```

### Find files of particular size in a directory
```sh
find . -size +10240k -exec stat -c%s" "%n {} \; | sort -rn
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn
```

### Kill processes that have been running for more than a week
```sh
find /proc -user myuser -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
```

### Find removed files still in use via /proc
```sh
find -L /proc/*/fd -links 0 2>/dev/null
```

### Find core files
```sh
find . -type f -regex ".*/core.[0-9][0-9][0-9][0-9]$"
```

### Copy files (.pdfs in this case) from a directory hierarchy to a different directory, ignoring the original structure
```sh
find <source_directory> -name *.pdf -exec mv {} <destination_dir> \;
```

### Copying part of the files from one directory to another
```sh
find dir1 -maxdepth 1 -type f | head -100000 | xargs mv -t dir2/subdir
```

### Run git gc in all git repositories bellow .
```sh
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc aggressive; cd -; done
```

### Count number of javascript files in subdirectories
```sh
find  . -mindepth 2 -name "*.js" -type f |wc -l
```

### Remove all .svn directories recursively from a directory
```sh
find . -name '.svn' -type d | xargs rm -rf
```

### If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output
```sh
find /path/to/search/directory -exec grep -Hn "pattern" {} \;
```

### Compile all gettext source files
```sh
find ./i18n -name "*.po" | while read f; do msgfmt $f -o ${f%.po}.mo; done
```

### Summarize total storage used by files obtained by a find command
```sh
find /path/to/archive/?/??/??? -mtime -7 -name "*.pdf" | xargs stat -c "%s"| awk '{sum +=$1}END{printf("%0.0f\n",sum)}'|sed -r ':Label;s=\b([0-9]+)([0-9]{3})\b=\1,\2=g;t Label'
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
```

### Display PHP files that directly instantiate a given class
```sh
find . -name "*.php" -exec grep \-H "new filter_" {} \;
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
find . -maxdepth 1 -type f -size +1M -printf "%f:%s\n" | sort -t":" -k2
```

### Count and show duplicate file names
```sh
find . -type f  |sed "s#.*/##g" |sort |uniq -c -d
```

### Find logs modified in the last 15 minutes
```sh
find /var/log -wholename "*.log" -mmin -15
```

### touch every file in current folder and subfolder
```sh
find . -type f -exec touch "{}" \;
```

### Search for a string in all files recursively
```sh
find . -type f | xargs grep <keyword>
```

### List only directories, one per line
```sh
find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n"
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do echo "### $line "; unzip -l $line; done | grep "^###\|you-string" |less
```

### Find the files that contain a certain term
```sh
find /path/to/dir -type f -exec grep \-H "search term" {} \;
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate; }
```

### find file(s) on disk
```sh
find / -name 'tofind.sh' 2>/dev/null
```

### find . -name "*.txt" | xargs sed -i "s/old/new/"
```sh
find . -name "*.txt" | xargs sed -i "s/old/new/"
```

### list with full path
```sh
find $(pwd) -maxdepth 1 -name "*" -printf "%p\n"
```

### Identify Movies and TV Series using find and regex
```sh
find . -type f -regextype posix-extended -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$'
```

### Find Movies but NOT TV Series using find and regex
```sh
find . -type f -regextype posix-extended ! -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$' \( -iname "*.mkv" -or -iname "*.avi"-or -iname "*.srt" \)
```

### Extract every parted-files which had the same password
```sh
find . -name '*.part1.rar' -exec unrar e \{\} -pPASSWORD \;
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -and -printf "%f\n" | egrep -io '\.[^.]*$' | sort | uniq -c | sort -rn
```

### in current directory delete all files with ending
```sh
find . -name "*.bak" -type f -delete
```

### change current directory permissions and only sub-directories recursively (not files)
```sh
find . -type d -exec chmod XXXX {} \;
```

### add a particular track to a playlist by looking for a part of its file name
```sh
find `pwd` -iname *SEARCH_STRING* >> ~/PLAYLIST_NAME.m3u
```

### Print duplicate files
```sh
find . -type f -print0 | xargs -0 -n1 md5sum | sort -k 1,32 | uniq -w 32 -d all-repeated=separate | sed -e 's/^[0-9a-f]*\ *//;'
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {} {}.bak \;
```

### Parallel recursive convert files to other format and move them in another directory
```sh
find $(pwd) -type f -not -path '*/\.*' -iname '*.tif' -print0| xargs -0 -n1 -P4 -I{} bash -c 'X="{}"; Y=${X##*/}; convert "$X" -resize 1920x1080 -density 72" newpath/${Y%.*}.jpg"'
```

### File count into directories
```sh
find / -type d | while read i; do ls $i | wc -l | tr -d \\n; echo " -> $i"; done | sort -n
```

### list all files modified in the last 24 hours descending from current directory
```sh
find . -type f -mtime -1 \! -type d -exec ls -l {} \;
```

### Pretty print all of the Linux vm sysctls for your viewing pleasure
```sh
find /proc/sys/vm -maxdepth 1 -type f | while read i ; do printf "%-35s\t%s\n" "$i" "$(<$i)" ; done | sort -t/ -k4
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -print0|xargs -0 rm
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {}{,.bak} \;
```

### Count the number of lines of code, returns total
```sh
find . \( -iname '*.cpp' -o -iname '*.h' \) -exec wc -l {} \; | sort -n | cut delimiter=.  -f 1 | awk '{s+=$1} END {print s}'
```

### Archive every file in /var/logs
```sh
find /var/logs -name * | xargs tar -jcpf logs_`date +%Y-%m-%e`.tar.bz2
```

### Count files created by date/modification
```sh
find . -type f -exec stat \{\} \; | grep Modify: | awk '{a[$2]++}END{for(i in a){print i " : " a[i] }}' | sort
```

### Find corrupted jpeg image files
```sh
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c
```

### list all file extensions in a directory
```sh
find . -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' -exec rm -r {} \;
```

### Recursive find and replace in h an cpp files
```sh
find . -name "*.h" -o -name "*.cpp" | xargs sed -i 's/addVertexes/addVertices/g'
```

### Compile all .less files to .css
```sh
find *.less | xargs -I {} lessc {} {}.css && ls *.less.css | sed -e 'p;s/less.css/css/' | xargs -n2 mv
```

### gzip only that files that are not gzipped and are not open by any process
```sh
find -type f ! -name "*.gz" ! -exec fuser -s {} ';' -exec gzip {} \;
```

### Find all files in path2 that do not have a symbolic link in path1 or any of its subdirectories
```sh
find /path1 -type l -exec readlink -f {} \;  > links.txt && find /path2 -type f > files.txt && grep -Fxv -f links.txt files.txt
```

### Sum file sizes of found files
```sh
find . -mtime +30 -exec ls -all "{}" \; | awk '{COUNTER+=$5} END {SIZE=COUNTER/1024/1024; print "size sum of found files is: " SIZE "MB"}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -not -empty -printf "%-25s%p\n"|sort -n|uniq -D -w25|cut -b26-|xargs -d"\n" -n1 md5sum|sed "s/  /\x0/"|uniq -D -w32|awk -F"\0" 'BEGIN{l="";}{if(l!=$1||l==""){printf "\n%s\0",$1}printf "\0%s",$2;l=$1}END{printf "\n"}'|sed "/^$/d"
```

### Find the source file which contains most number of lines in your workspace
```sh
find -name "*.<suffix>" -exec wc -l "{}" \; | sort -n | tail
```

### Simple find
```sh
find / -name '*android*' 2>errors.txt
```

### Find and rename
```sh
find . -name "booyah" -exec rename booyah booyah.disabled {} \;
```

### find and copy any format of file
```sh
find /directory/of/search -name "*.png" type -f -exec cp '{}' /path/to/copy/ ';'
```

### How to delete all the archive files with extension *.tar.gz and greater than 10MB?
```sh
find / -type f -name *.tar.gz -size +10M -exec ls -l {} \;
```

### deleter
```sh
find . ! -size 0c -mtime +1 -type f -delete
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec ls -shS {} + | head -10
```

### How to archive all the files that are not modified in the last x number of days?
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Permissions change on all files in current directory
```sh
find . -type f -exec chmod 644 {} \;
```

### Rekursive Grep on Solaris or AIX Systems without GNU egrep -r funcionality
```sh
find . -type f -exec awk '/linux/ { printf "%s %s: %s\n",FILENAME,NR,$0; }' {} \;
```

### rename all dirs with "?" char in name
```sh
find . -type d -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find supported dependency manager manifests
```sh
find /srv/code -maxdepth 4 -type f -regex ".*\(\(package\|composer|npm\\|bower\)\.json\|Gemfile\|requirements\.txt\\|\.gitmodules\)"
```

### Move items from subdirectories to current directory
```sh
find -type f -exec mv {} . \;
```

### rsync + find
```sh
find . -name "whatever.*" -print0 | rsync -av files-from=- from0 ./ ./destination/
```

### Change permissions for all files in the current directory
```sh
find ./ -type f | xargs sudo chmod 644
```

### deleter
```sh
find -type f -size +0 -mtime +1 -print0|xargs -0r rm -f
```

### Change permission for all directories inside the current one
```sh
find site/ -type d | xargs sudo chmod 755
```

### Remove UTF-8 Byte Order Mark BOM
```sh
find . -type f -regex '.*html$' -exec sed -i 's/\xEF\xBB\xBF//' '{}' \;
```

### Recursively remove "node_modules" directories
```sh
find . -name "node_modules" -exec rm -rf '{}' \;
```

### Create a tar archive with cpio containing a set of files
```sh
find path -name '*' -type f | cpio -ov -H ustar -F txtarchive.tar
```

### Size for all directories inside the current one
```sh
find . -type d -maxdepth 1 | xargs du -sh
```

### find only current directory (universal)
```sh
find /some/directory/* -prune -type f -name *.log
```

### find files that have been modified recently
```sh
find /target_directory -type f -mmin -60 mindepth 2
```

### can look for large files taking up disk spaces using the cmd
```sh
find / -type f -size +500M 2>/dev/null | xargs du -h | sort -nr
```

### replace old htaccess php AddHandler values with new one
```sh
find /var/www/ -type f -name ".htaccess" -exec perl -pi -e 's/AddHandler[\s]*php(4|5)-cgi/AddHandler x-httpd-php\1/' {} \;
```

### Make a statistic about the lines of code
```sh
find . -name \*.c | xargs wc -l | tail -1 | awk '{print $1}'
```

### Create a tar archive with pax containing a set of files
```sh
find path -name '*' -type f  | pax -wd > txtarchive.tar
```

### find command usage
```sh
find /pentest/ -type f -iname "*trace*"
```

### Create a zip file ignoring .svn files
```sh
find . -not \( -name .svn -prune \) -type f | xargs zip XXXXX.zip
```

### find usage
```sh
find /etc/ /pentest/ -type f -iname "*sql*" | grep map
```

### Find files modified in the last N days; list sorted by time
```sh
find . -type f -mtime -14 -exec ls -ltd \{\} \; | less
```

### copying data with cpio
```sh
find  ./source  -depth -print | cpio -cvo> /destination/source_data.cpio; cd /destination; cpio -icvmdI ./source_data.cpio; rm -rf ./source_data.cpio
```

### Search entire web server for preg_replace /e based php malware.
```sh
find / -name \*.php -exec grep -Hn preg_replace {} \;|grep /e|grep POST
```

### Lower jpg quality
```sh
find -type f -name '*.jpg' -exec mogrify -quality 70% '{}' \;
```

### find all file larger than 500M
```sh
find / -type f -size +548576 -printf "%s:%h%f\n"
```

### Generate SHA1 hash for each file in a list
```sh
find . -regex ".*\(avi\|mp4\|wmv\)$" -print0 | xargs -0 sha1sum
```

### Search entire server for Q4 2015 obfuscated PHP malware of unknown origin.
```sh
find / -name \*.php -exec grep -Hn .1.=.......0.=.......3.=.......2.=.......5.= {} \;
```

### Recursively change permissions on directories, leave files alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {} +
```

### List and delete files older than one year
```sh
find <directory path> -mtime +365 -and -not -type d -delete
```

### Convert .wma files to .ogg with ffmpeg
```sh
find -name '*wma' -exec ffmpeg -i {} -acodec vorbis -ab 128k {}.ogg \;
```

### Find recursively, from current directory down, files and directories whose names contain single or multiple whitespaces and replace each such occurrence with a single underscore.
```sh
find  ./  -name '*'  -exec  rename  's/\s+/_/g'  {}  \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec du -sh {} + | sort -hr | head
```

### find . -name "*" -print | xargs grep -s pattern
```sh
find . -name "*" -print | xargs grep -s pattern
```

### Recursively unzip archives to their respective folder
```sh
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
```

### Remove all directories less than 1 MB in size in or below current directory
```sh
find . -type d -execdir du -sh '{}' ';' | grep -E "[0-9]+K" | sed 's/^[0-9\.]\+K[\t ]\+//' | tr "\n" "\0" | xargs -0 rm -rf
```

### show how much diskspace all images in a given directory need
```sh
find /home/bubo/ -type f \( -iname \*.jpg  -print0 , -iname \*.png  -print0 , -iname \*gif -print0 \)  |  du -cm  files0-from - | tail -1
```

### find specified directory and delete it recursively including directories with spaces
```sh
find . -name "directory_name" -type d -print0 | xargs -0 -i rm -rf {}
```

### find . -type f -exec grep -ils stringtofind {} +
```sh
find . -type f -exec grep -ils stringtofind {} +
```

### Recursively delete all files of a specific extension
```sh
find . -name "*.bak" -type f -delete
```

### find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```sh
find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```

### Uses ffmpeg to convert all that annoying .FLAC files to MP3 files keeping all the Artist's information in them.
```sh
find . -name "*.flac" -exec ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;
```

### grep selectively
```sh
find /path -name \*.php -user nobody -exec grep -nH whatever {} \;
```

### List files and sizes
```sh
find / -type f -exec wc -c {} \; | sort -nr | head -100
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} +
```

### find pictures and renames them appending the containing folder name
```sh
find <folder> -type f -name '*.jpg' -exec bash -c 'ext="${0##*.}";path="$(dirname "$0")";name="$(basename "$0"|sed "s/.jpg//")";folder="$(dirname "$0"|tr / \\n |tail -1)";new="${path}/${name}_${folder}.${ext}"; mv "$0" "${new}"' {} \;
```

### Delete Empty Files
```sh
find . -size 0c -print -exec rm -f {} \;
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0  wc -l | tail -1
```

### Print bitrate of each audio file
```sh
find . -print0 | xargs -0 -I{} ffmpeg -i "{}" 2>&1 | grep "kb\/s\|Input"
```

### Search and install true type fonts under user home directory
```sh
find ~ -name "*.ttf" -exec cp {} /usr/share/fonts/truetype \; & fc-cache -f
```

### Find every directory with too many files and subdirectory.
```sh
find / -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n
```

### Converts Character Set of Files in a Folder
```sh
find . -iregex ".+\.\(c\|cpp\|h\)" | xargs -I{} perl -e "system(\"iconv -f SHIFT_JIS -t UTF-8 {} > temp; mv temp {} \");"  ;
```

### Check for orphaned python files
```sh
find /usr/lib/python* -regextype posix-extended ! \( -type f -regex '.*.(pyc|pyo)' -prune -o -print \) | qfile -o -f -
```

### Find and replace text within all files within a directory
```sh
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'
```

### Batch rename and number files
```sh
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash
```

### Listing all your bundles Entities files to issue a doctrine:generate:entities
```sh
find ./src -type d -name "Entity" | xargs ls -A | cut -d . -f1 | sed 's_^_app/console doctrine:generate:entities YourOwnBundleName:_'
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -print0 | xargs -0 rm
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -size 0c -delete
```

### Find all files larger than 500M and less than 1GB
```sh
find / -type f -size +500M -size -1G
```

### list files not owned by any user or group
```sh
find / -nouser -o -nogroup -print
```

### Count occurrences of a word/token in a file
```sh
find . -name file.txt | xargs -e grep "token" -o | wc -l
```

### Erase empty files
```sh
find . -size 0 -exec rm '{}' \;
```

### Check if zip files from current directory are good
```sh
find . -maxdepth 1  -name "*.zip" -exec unzip -tqq {} \;
```

### How to exclude all "permission denied" messages from "find"
```sh
find <paths> ! -readable -prune -o <other conditions like -name> -print
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort | uniq -d | parallel find -type f -size {}c | parallel md5sum | sort | uniq -w32 all-repeated=separate
```

### List cassandra snapshots by date
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -printf "%Ty-%Tm-%Td  %p\n" | sort
```

### Use a variable in a find command.  Useful in scripting.
```sh
find . -iname \*${MYVAR}\* -print
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;
```

### Use a variable in a find command.  Useful in scripting.
```sh
find "$1" -iname "*$2*"
```

### remove files of a specific size
```sh
find . -size 1400c -exec rm {} \;
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -name *.mp3 | grep "andy" > ~/mylist
```

### get newest file in current directory
```sh
find . -maxdepth 1 -printf '%A@\t%p\n' | sort -r | cut -f 2,2 | head -1
```

### List used Perl libraries in Perl project
```sh
find . -type f \( -name '*.pm' -o -name '*.pl' \) | xargs grep "^use " | cut -d : -f2 | sort | uniq
```

### recursively change file name extensions
```sh
find . -type f -name \*.c | while read f; do mv $f "`basename $f .c`".C; done
```

### Graphical tree of sub-directories
```sh
find . -type d |sed 's:[^-][^/]*/::g; s:^-: |:'
```

### show 20 last modified files in current directory including subdirectories
```sh
find . -type f -printf "%T@ %Tc %p\n" |sort -n |cut -d' ' -f2- |tail -n20
```

### get md5sum for all files, skipping svn directories
```sh
find $1 -not -iwholename "*.svn*" -type f | xargs md5sum | awk '{print $2 "\t" $1}'
```

### Count files by extension
```sh
find . -type f | sed -n 's/..*\.//p' | sort -f | uniq -ic
```

### Recreate md5 checksum files for files in folder and subfolders
```sh
find . -type f \! -name "*.md5" -exec sh -c 'md5sum "$1" > $1.md5'  {} \;
```

### bzip2 all files in a directory older than 1 week (nicely)
```sh
find /logdir -type f -mtime +7 -print0 | xargs -0 -n 1 nice -n 20 bzip2 -9
```

### Parallel copy - Faster copy
```sh
find Files/ -type d  | parallel  'mkdir -p /BKP/{}' && find Files/ -type f  | parallel 'rsync -a {} MKD/$(dirname {})'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ -exec grep -ni phrase {} +
```

### Find directory by name
```sh
find . -type d -name '.svn' -ls
```

### Find files with size over 100MB and output with better lay-out
```sh
find ./ -type f -size +100000k -exec ls -lh {} \; 2>/dev/null| awk '{ print $8 " : " $5}'
```

### List empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -print
```

### Show sizes and calculate sum of all files found by find
```sh
find -name *.bak -print0 | du -hc files0-from=-
```

### I use this find command example to find out all the executable files
```sh
find . -perm 777 ?print
```

### Find pictures excepting a path
```sh
find . \( -not -path "./boost*" \) -type f \( -name "*.jpg" -or -name "*.png" -or -name "*.jpeg" \)  2>/dev/null
```

### Count total running time for all media files in your directory
```sh
find -type f -exec ffprobe -i "{}" -show_entries format=duration -v quiet -of csv="p=0" \; | paste -sd+ | bc
```

### Calculate the size in MB of all files of a certain extension
```sh
find . -type f -iname '*.msh' -exec ls -lG {} \; | awk '{total = total + $4}END{print "scale=2;" total "/2^20"}' | bc
```

### Find all FAT-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>|\+|\[|\])"
```

### List recursively only empty folders on present dir
```sh
find ./ -empty -type d -print
```

### Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
```sh
find . -name *js -type f | xargs yardstick | sort -k6 -n
```

### Find all NTFS-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>)"
```

### Find lines of code (LOC) of a filetype in a project.
```sh
find . -type f -name "*.py" -exec wc -l {} \; | awk '{ SUM += $1} END {print SUM }'
```

### Find all e-mails older than 7 days in the queue and delete them
```sh
find /var/spool/mqueue -type f -mtime +7 | perl -lne unlink
```

### Delete all files in a folder that don't match a certain file extension
```sh
find . -type f ! -name "*.foo" -name "*.bar" -delete
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -name "*.sh" -exec chmod u+x {} \;
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -exec file '{}' + | grep shell | awk -F':' '{print $1}' | xargs chmod u+x
```

### count all the lines of code in a directory recursively
```sh
find . -name '*.php' | xargs wc -l
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} \;
```

### mv argument list too long
```sh
find $_SOURCE -type f -name '*' -exec mv {}  $_DESTINATION \;
```

### displays comments from random jpeg files.
```sh
find ~/random_jpegs/folder -name "*.jpg" -exec rdjpgcom {} \;
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find ./ -type f -exec sh -c 'echo "{}" "$(dirname "{}")/$(basename "{}" | tr "[A-Z]" "[a-z]")"' \;
```

### find and delete empty dirs, start in current working dir
```sh
find . -type d -empty -delete
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -delete
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find -type f -name "*.avi" -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### find the biggest files recursively, no matter how many
```sh
find . -type f -printf '%20s %p\n' | sort -n | cut -b22- | tr '\n' '\000' | xargs -0 ls -laSr
```

### Busca archivos por el tipo de extension y los elimina.
```sh
find / -iname *.jpg exec rm -rf {} \;
```

### command for converting wav files to mp3
```sh
find . -iname "*wav" > step1 ; sed -e 's/\(^.*\)wav/\"\1wav\" \"\1mp3\"/' step1 > step2 ; sed -e 's/^/lame  /' step2 > step3 ; chmod +x step3 ; ./step3
```

### Find broken symlinks and delete them
```sh
find . -xtype l -delete
```

### Finds javascript lodash/underscore methods in source code
```sh
find . -name "*.js" | xargs grep -oh '_\.[^(]*' | sort | uniq
```

### Find and remove files
```sh
find / -name core | xargs /bin/rm -f
```

### remove a directory filled with too many files
```sh
find /SOME/PATH -type f -execdir rm -f {} \+
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) | xargs wc -l | sort -n
```

### search in all cpp / hpp files using egrep
```sh
find . \( -name "*cpp" -o -name "*hpp" \) -exec grep -Hn -E "043[eE]|70[Dd]7" \{\} \;
```

### Make a folder and everything in it world-viewable
```sh
find . -exec chmod o+rx {}\;
```

### Create etags file of .c, .cpp, and .h files in all subdirectories
```sh
find . -regex ".*\.[cChH]\(pp\)?" -print | etags -
```

### find all symlinks to a file
```sh
find -L / -samefile path/to/foo.txt
```

### Converts all jpg files to 75 quality.
```sh
find . -type f -name '*.jpg' -exec convert -quality 75 {} {} \;
```

### A command to find and replace text within conf files in a single directory.
```sh
find -type f -name '*.conf' -exec sed -Ei 's/foo/bar/' '{}' \;
```

### Returns top ten (sub)directories with the highest number of files
```sh
find . -type d | while read dir ; do num=`ls -l $dir | grep '^-' | wc -l` ; echo "$num $dir" ; done | sort -rnk1 | head
```

### For files owned by root only, change ownership to a non-privileged user.
```sh
find /path/to/dir -user root -exec chown [nonprivuser] {} \;
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find $PWD -type d | while read "D"; do cd "$D"; for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize;done ;done
```

### find all symlinks to a file
```sh
find / -lname path/to/foo.txt
```

### List files containing given search string recursively
```sh
find /path/to/dir -type f -print0 | xargs -0 grep -l "foo"
```

### Delete all ".svn" directories from current path (recursive)
```sh
find . -name ".svn" -exec rm -rf {} \;
```

### Delete/Archive easily old mails using find.
```sh
find . -path ".*/cur/*" -type f ! -newermt "1 week ago" -delete
```

### find and replace tabs for spaces within files recursively
```sh
find ./ -type f -exec sed -i 's/\t/  /g' {} \;
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec stat -f '%m %N' {} \; | sort -n
```

### print the first line of every file which is newer than a certain date and in the current directory
```sh
find . -type f -newer 201011151300.txt -exec head -1 {} \;
```

### rename files (in this case pdfs) numerically in date order
```sh
find . -name "*.pdf" -print0 | xargs -r0 stat -c %y\ %n | sort|awk '{print $4}'|gawk 'BEGIN{ a=1 }{ printf "mv %s %04d.pdf\n", $0, a++ }' | bash
```

### find something
```sh
find $SDIR -name '${f}.*' -mtime +$n -maxdepth 1 | xargs -n 10 rm -vf
```

### Get last changed revision to all eclipse projects in a SVN working copy
```sh
find . -iname ".project"| xargs -I {} dirname {} | LC_ALL=C xargs -I {} svn info {} | grep "Last Changed Rev\|Path" | sed "s/Last Changed Rev: /;/" | sed "s/Path: //" | sed '$!N;s/\n//'
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find . -name '*.epub' -exec sh -c 'a={}; ebook-convert $a ${a%.epub}.mobi still more options' \;
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG' -print0 | xargs -0 mogrify -resize 1024">" -quality 40
```

### catch all the txt files into a start_dir tree and copy them into a single end_dir
```sh
find start_dir -name *.txt | xargs -J % cp % end_dir/
```

### set create time using file name for files pulled from android camera
```sh
find . -type f -exec echo -n "touch -t \`echo " \; -exec echo -n {} \; -exec echo -n " | sed -E 's/.*([[:digit:]]{8})_([[:digit:]]{4})([[:digit:]]{2}).*/\1\2.\3/g'\` " \; -exec echo {} \; | sh
```

### covert m4a audio files to wav
```sh
find . -name '*.m4a' | xargs -I audiofile mplayer -ao pcm "audiofile" -ao pcm:file="audiofile.wav"
```

### Remove all .svn folders
```sh
find . -name .svn -print0 | xargs -0 rm -rf
```

### Get the total size (in human readable form) of all certain file types from the current directory
```sh
find . -name 'pattern'| xargs du -hc
```

### Find directories in pwd, get disk usage, sort results
```sh
find . -type d -d 1 -print0 | xargs -0 du -sm | sort -nr
```

### find *.lock files and delete
```sh
find -name *.lock |xargs rm -f
```

### List 50 largest source files in a project
```sh
find . -type f -name '*.pm' -printf '%6s %p\n' | sort -nr | head -n 50
```

### Get the total length of all videos in the current dir in H:m:s
```sh
find -type f -iregex '.*\.\(mkv\|mp4\|wmv\|flv\|webm\|mov\|dat\|flv\)' -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.[Jj][Pp][Gg]' -exec mogrify -resize 1024">" -quality 40 {} \;
```

### Command to rename multiple file in one go
```sh
find / -name "*.xls" -print0 | xargs -0  rename .xls .ods {}
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find -iname "*.pdf" -exec pdfinfo -meta {} \;|awk '{if($1=="Pages:"){s+=$2}}END{print s}'
```

### Remove hidden CVS merge helper files
```sh
find . -name ".#*" -exec rm {} \;
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -20
```

### dos2unix recursively
```sh
find . -type f -exec dos2unix {} +
```

### Find Files over 20Meg
```sh
find . -type f -size +20000k -print0 | xargs -0 du -h | awk -F"\t" '{printf "%s : %s\n", $2, $1}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -size +0 -printf "%-25s%p\n" | sort -n | uniq -D -w 25 | sed 's/^\w* *\(.*\)/md5sum "\1"/' | sh | sort | uniq -w32 all-repeated=separate
```

### Remove CVS root files under current directory
```sh
find . -name Root -print | xargs rm -f
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find -type f |while read a;do [ "`head -c3  "${a}"`" == $'\xef\xbb\xbf' ] && echo "Match: ${a}";done
```

### Recursively sort files by modification time through multiple directories.
```sh
find /test -type f -printf "%AY%Aj%AH%AM%AS-%h/%f\n" | sort -n
```

### Remove all node_module folders recursively
```sh
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
```

### Indent all the files in a project using emacs
```sh
find . -iname \*.c -or -iname \*.h -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### Convert all the png files in a directory to gif in parallel. Requires imagemagick.
```sh
find . -name "*.png" | xargs -I '{}' -P 4 mogrify -format gif '{}'
```

### Display directory hierarchy listing as a tree
```sh
find . -printf '%p\n' | perl -ne 'if( m/(.*)\/(.*)/ ) { $p = $1; $f = $2; $p =~ s/[^\/]/ /g; $p =~ s/\//|/g; print "$p/$f\n"; } elsif( m/(.*)/ ) { print "$1\n"; } else { print "error interpreting: \"$_\"\n"; }'
```

### Search and replace multiple files with substitution
```sh
find . -name "*.txt" | xargs -n 1 perl -pi -w -e "s/text([0-9])/other\$1/g;"
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | paste -sd+ | bc
```

### List all text files (exclude binary files)
```sh
find -type f | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Recursive chmod all *.sh files within the current directory
```sh
find ./ -name "*.sh" -exec chmod +x {} \;
```

### use the find command and have it not print trailing slashes
```sh
find * -maxdepth 0 -type d
```

### Find Duplicate Files (based on size, name, and md5sum)
```sh
find -type f -printf '%20s\t%100f\t%p\n' | sort -n | uniq -Dw121 | awk -F'\t' '{print $3}' | xargs -d '\n' md5sum | uniq -Dw32 | cut -b 35- | xargs -d '\n' ls -lU
```

### Search recursively to find a word in certain file types
```sh
find . -iname '*.conf' | xargs grep "searh string" -sl
```

### Add a newline to the end of a cpp file
```sh
find . -iname "*.cpp" -exec perl -ni -e 'chomp; print "$_\n"' {} \;
```

### Recursively remove all files in a CVS directory
```sh
find . -type f ! -path \*CVS\* -exec rm {} \; -exec cvs remove {} \;
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -delete
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively unrar into dir containing archive
```sh
find . -name '*.rar' -execdir unrar e {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### Modify all files newer than another file and touch them to a specific date.
```sh
find . -newer /tmp/foo -exec touch date "2011-12-12" {} \;
```

### find all c and cpp files except the ones in the unit-test and android subdirectories
```sh
find . ! -regex '.*/\(unit-test\|android\)/.*' \( -name '*.c' -o -name '*.cpp' \)
```

### Find .java files with high complexity (counting curly braces)
```sh
find src/ -name "*.java" | while read f; do echo -n "$f "; cat "$f" | tr -dc '{}'; echo; done | awk '{ print length($2), $1 }' | sort -n
```

### list with full path
```sh
find `pwd` -maxdepth 1 -exec ls color -d {} \;
```

### Find the top most 5 duplicate files in a folder
```sh
find -maxdepth 1 -type f -exec md5sum '{}' ';' | sort | uniq -c -w 33 | sort -gr | head -n 5 | cut -c1-7,41-
```

### Grep through the text of djvu files and format results
```sh
find ./ -iname "*.djvu" -execdir perl -e '@s=`djvutxt \"$ARGV[0]\"\|grep -c Berlekamp`; chomp @s; print $s[0]; print " $ARGV[0]\n"' '{}' \;|sort -n
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find /path/to/dir -iname "*.ext" -print0 | xargs -0 mplayer -really-quiet -cache 64 -vo dummy -ao dummy -identify 2>/dev/null | awk '/ID_LENGTH/{gsub(/ID_LENGTH=/,"")}{SUM += $1}END{ printf "%02d:%02d:%02d\n",SUM/3600,SUM%3600/60,SUM%60}'
```

### Find text in contents with multiple filename
```sh
find ./$(PATH) -name '*.h' -o -name '*.c' -type f | xargs grep color -E '*Data*'
```

### Remove files and show space freed
```sh
find . -link 1 -exec du {} -shc + -exec rm -v {} +
```

### find co-ordinates of a location
```sh
findlocation() {place=`echo $@`; lynx -dump "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | egrep "address|coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Find the main file :D
```sh
find . -name "*.cpp" -exec grep -Hn color=tty -d skip "main" {} \;
```

### collect fullcalib data
```sh
find . -name "fullcalib4.csv" -exec tail -n1 \{\} \; >>all.csv
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type f|while read f; do mv $f `echo $f |tr '[:upper:]' '[ :lower:]'`; done
```

### Sort file greater than a specified size  in human readeable format including their path and typed by color, running from current directory
```sh
find ./ -size +10M -type f -print0 | xargs -0 ls -Ssh1 color
```

### Find all files over 20MB and print their names and size in human readable format
```sh
find / -type f -size +20000k -exec ls -lh {} \; | awk  '{printf $9} {for (i=10;i<=NF;i++) {printf " "$i}} {print ": "$5}'
```

### Delete all files in folder without affecting load
```sh
find . -type f -exec echo echo rm {} '|' batch ';'|bash
```

### find and replace all directory sub directory
```sh
find ./ -type f -exec sed -i -e 's/k.a@tuta.io/aysadx@gmail.com/g' {} \;
```

### List all symbolic links in current directory
```sh
find . -maxdepth 1 -type l
```

### Recursively remove all empty directories
```sh
find . -type d | tac | xargs -I{} rmdir {} 2> /dev/null
```

### List files recursively sorted by modified time
```sh
find /home/fizz -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 775 {} \;
```

### Find Files Which Should Be Executable But Are Not
```sh
find . -type f ! -perm /u+x -printf "\"%p\"\n" | xargs file | grep -i executable
```

### Convert uppercase to lowercase extensions
```sh
find . -type f -name *.MP3 -print0 | xargs -0 -i rename .MP3 .mp3 {}
```

### Rename duplicate files created by GDrive
```sh
find . -name "*\(2\)*" -exec rename -s \ \(2\) '' -n {} +
```

### Tar (stripped paths) found files by regexp from <PATH>, then remove
```sh
find <PATH> -maxdepth 1 -type f -name "server.log*" -exec tar czPf '{}'.tar.gz transform='s|.*/||' '{}' remove-files \;
```

### List RPM packages installed in current tree
```sh
find $PWD -exec rpm query -f {} \; | sort -u | grep -v "not owned"
```

### Reorder file with max 100 file per folder
```sh
find files/ -type f | while read line; do if [ $((i++%100)) -eq 0 ]; then mkdir $((++folder)); fi; cp  $line $folder/; done
```

### Find files in current directory which are larger in size (500000k)
```sh
find . -type f -size +50000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### Ignore subdirectories in subversion
```sh
find . -type d -not \( -name .svn -prune \) -exec svn propset svn:ignore '*' {} \;
```

### get a random command
```sh
find $(echo "$PATH" | tr ':' ' ') -name "*program*"
```

### Keep from having to adjust your volume constantly
```sh
find . -iname \*.mp3 -print0 | xargs -0 mp3gain -krd 6 && vorbisgain -rfs .
```

### Convert the contents of a directory listing into a colon-separated environment variable
```sh
find . -name '*.jar' -printf '%f:'
```

### Backup files older than 1 day on /home/dir, gzip them, moving old file to a dated file.
```sh
find /home/dir -mtime +1 -print -exec gzip -9 {} \; -exec mv {}.gz {}_`date +%F`.gz \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -10
```

### Delete all Vagrant boxes
```sh
find $HOME -type d -name .vagrant | xargs -i% bash -c "pushd %; cd ..;vagrant destroy -f; popd"
```

### Find latest modified log
```sh
find . -name '*.log' | xargs ls -hlt > /tmp/logs.txt && vi /tmp/logs.txt
```

### Find and archive old, large files. Great for manually cleaning up logs when logrotate can't be used.
```sh
find . -type f -size +100M -mtime +30 -exec gzip {} \;
```

### Find inside specific file type function
```sh
findin() { find . -type f -name "*.$1" | xargs ack $2 }
```

### Play flash videos in  VLC
```sh
find -L /proc/`ps aux | grep [f]lash | awk '{print $2}'`/fd/ | xargs file -L | grep Video |  awk '{sub(/:/, ""); print $1}' | xargs vlc
```

### List all the unique extensions in a folder and print their count
```sh
find . -type f -print | awk -F'.' '{print $NF}' | sort | uniq -c
```

### Find last 50 modified files
```sh
find / -path /proc -prune -o -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort -r | head -50
```

### Recursive remove files by mask
```sh
find . -name ".DS_Store" -print0 | xargs -0 rm -rf
```

### Convert all your mp3 to ogg
```sh
find . -iname '*.mp3' | while read song; do mpg321 ${song} -w - | oggenc -q 9 -o ${song%.mp3}.ogg -; done
```

### Fixing maven POM messed up by a broken release.
```sh
find . -iname pom.xml -type f -exec bash -c "cat {} | sed s/1\.0\.46\-SNAPSHOT/1\.0\.48\-SNAPSHOT/g > {}.tmp " \; -exec mv {}.tmp {} \;
```

### Change permissions on a large number of directories quickly
```sh
find . -type d -print0 | xargs -0 chmod 0770
```

### Get MD5 checksum for directory
```sh
find -s web -type f -exec md5 -q {} \; | md5
```

### Replace + Find
```sh
find <mydir> -type f -exec rename 's/<string1>/<string2>/g' {} \;
```

### Preview All Files in Directory
```sh
find . -type f | xargs -I% bash -c 'echo -e "\033[31m%\033[0m" && [[ ! `file %` =~ .*binary.* ]] && head "%"'
```

### XZIP many catalogs
```sh
find . -type d |awk '$1 ~ /[0-9]/ {print $0}' |xargs -P 4 -I NAME tar remove-files -vcJf NAME.tar.xz NAME
```

### package most recent files in project
```sh
find ~/project -mtime -1 -type f -print | tar jcvf myfiles.tar.bz2 -T -
```

### find css or js files, minifiy with in-path-yuicompressor, gzip output, and save into <static-file>.gz
```sh
find -regextype posix-egrep -regex '.*\.(css|js)$' | xargs -I{} sh -c "echo '{}' && yuicompressor '{}' | gzip -c > '{}.gz'"
```

### CPIO better than TAR
```sh
find . -type f -name '*.sh' -print | cpio -o | gzip >sh.cpio.gz
```

### Delete all files matching a pattern
```sh
find . -name vmware-*.log -exec rm -i {} \;
```

### Recursively search a directory tree for all .php .inc .html .htm .css .js files for a certain string
```sh
find -type f -regex ".*\.\(js\|php\|inc\|htm[l]?\|css\)$" -exec grep -il 'searchstring' '{}' +
```

### find str in  in a directory which file extension is .php
```sh
find ./ -type f -name "*.php" | xargs grep -n "name" -r {}
```

### How many lines in your c project?
```sh
find . -type f -name *.[ch] -exec wc -l {} \;
```

### Find all symlinks that link to directories
```sh
find -type l -xtype d
```

### Find top 10 largest files in /var directory (including subdirectories)
```sh
find /var -type f -exec du -h {} \; | sort -rh | head -10
```

### find all files in the current directory matching name * and searching for a string "mystring". outputs all the filenames that contain the search string.
```sh
find . -name "*" | xargs grep "mystring"
```

### get disk usage sum for files of type
```sh
find . -name '*.xml' -type f -print | xargs du -ch
```

### Recursive replace of directory and file names in the current directory.
```sh
find -name '*oldname*' -print0 | xargs -0 rename 's/oldname/newname/'
```

### Loop over files found using 'find' (works with filenames that contain spaces)
```sh
find -name 'foo*' | while read i; do echo "$i"; done
```

### copy selected folder found recursively under src retaining the structure
```sh
find <src-path-to-search> -name "<folder-name>" | xargs -i cp -avfr parent {} /<dest-path-to-copy>
```

### pngcrush all .png files in the directory structure
```sh
find -f . png | while read line; do pngcrush -ow -brute $line; done
```

### sed replace in all files of directory
```sh
find ./ -type f -exec sed -i -e 's/apple/orange/g' {} \;
```

### Count music files in each directory
```sh
find . -type d -maxdepth 1 -print0 | xargs -0 -I{} sh -c 'find "{}" -type f | grep "ogg\|mp3\|wav\|flac$" | wc -l | tr -d "\n"; echo " {}"'
```

### How many lines in your PHP project without comments
```sh
find . -type f -name '*.php' | xargs cat | sed -re ':top /\/\*.*\*\// { s/\/\*.*\*\///g ; t top }; /\/\*/ { N ; b top }' | awk '$0 !~ /^[\t[:space:]]*($|(\/\/)|(#))/' | wc -l
```

### Find used fileextensions in a project
```sh
find . -type f | perl -ne 'chop(); $ext = substr($_, rindex($_, ".") + 1); print "$ext\n";' | sort | uniq count | sort -n
```

### optimize all png images
```sh
find . -name *.png | xargs optipng -nc -nb -o7 -full
```

### Find files older than X, using find.
```sh
find . -mtime +10
```

### Count total amount of code lines in a PHP Project (short version)
```sh
find . -type f -name "*.php" -exec wc -l {} +;
```

### find ip address in all files in /etc directory
```sh
find /etc -type f -print0 | xargs -r0 grep color '192.168.0.1'
```

### My random music player
```sh
find /home/user/M?sica/ -type f -name "*.mp3" | shuf head-count=20 output=/home/user/playlist.m3u ; sort -R /home/user/playlist.m3u | mplayer -playlist -
```

### Find given string in all files with given name or extension
```sh
find . -name "*.html" -exec grep -l 'string' {} \;
```

### Recursively remove all empty directories
```sh
find . -type d -empty -delete
```

### Copy all documents PDF in disk for your home directory
```sh
find / -name "*.pdf" -exec cp -t ~/Documents/PDF {} +
```

### find broken symbolic links
```sh
find -L . -type l
```

### Check all bash scripts in current dir for syntax errors
```sh
find . -name '*.sh' -exec bash -n {} \;
```

### List only the directories
```sh
find . -maxdepth 1 -type d | sort
```

### Search through files, ignoring .svn
```sh
find . -not \( -name .svn -prune \) -type f -print0 | xargs null grep <searchTerm>
```

### Move all files in subdirectories to current dir
```sh
find ./ -type f -exec mv {} . \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec rename "s/.JPG/.jpg/g" \{\} \;
```

### recurisvely md5 all files in a tree
```sh
find ./backup -type f -print0 | xargs -0 md5sum > /checksums_backup.md5
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -empty -delete
```

### Get a quick list of all user and group owners of files and dirs under the cwd.
```sh
find -printf '%u %g\n' | sort | uniq
```

### Convert all .flac from a folder subtree in 192Kb mp3
```sh
find . -type f -iname '*.flac' | while read FILE; do FILENAME="${FILE%.*}"; flac -cd "$FILE" | lame -b 192 - "${FILENAME}.mp3"; done
```

### Recursively search for large files. Show size and location.
```sh
find . -size +100000k -exec du -h {} \;
```

### recursive reset file/dir perms
```sh
find public_html/stuff -type d -exec chmod 755 {} + -or -type f -exec chmod 644 {} +
```

### Remove everything except that file
```sh
find . ! -name <FILENAME> -delete
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec env d="$dest_root" sh -c ' exec mkdir -p  "$d/$1"' '{}' '{}' \;
```

### Finding files with different extensions
```sh
find . -regex '.*\(h\|cpp\)'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i -H "search pharse" {} \;
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} \;
```

### find files in a date range
```sh
find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
```

### find .txt files inside a directory and replace every occurrance of a word inside them via sed
```sh
find . -name '*.txt' -exec sed -ir 's/this/that/g' {} \;
```

### Rename .JPG to .jpg recursively
```sh
find /path/to/images -name '*.JPG' -exec bash -c 'mv "$1" "${1/%.JPG/.jpg}"'  {} \;
```

### Advanced LS Output using Find for Formatted/Sortable File Stat info
```sh
find $PWD -maxdepth 1 -printf '%.5m %10M %#9u:%-9g %#5U:%-5G  [%AD | %TD | %CD]  [%Y] %p\n'
```

### Chmod all directories (excluding files)
```sh
find public_html/ -type d -exec chmod 755 {} +
```

### Find all files of a type and copy them elsewhere while keeping intact their full directory structure using find and cpio
```sh
find . -iname "*.flac" | cpio -pdm /Volumes/Music/FLAC
```

### How many files in the current directory ?
```sh
find . -maxdepth 1 -type f | wc -l
```

### Skip over .svn directories when using the
```sh
find . -name .svn -prune -o -print
```

### Find dead symbolic links
```sh
find -L -type l
```

### Calculate md5 sums for every file in a directory tree
```sh
find . -type f -exec md5sum {} \; > sum.md5
```

### Monitor logs in Linux using Tail
```sh
find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f
```

### List latest 5 modified files recursively
```sh
find . -type f -printf '%T@ %TY-%Tm-%Td %TH:%TM:%.2TS %p\n' | sort -nr | head -n 5 | cut -f2- -d" "
```

### find and delete empty directories recursively
```sh
find . -depth -type d -empty -exec rmdir -v {} +
```

### Remove empty directories
```sh
find . -type d -empty -delete
```

### Find today created files
```sh
find directory/ -mtime 0 -type f
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 | xargs rm -vf
```

### Find 'foo' string inside files
```sh
find . -type f -print | xargs grep foo
```

### Count the total number of files in each immediate subdirectory
```sh
find . -type f -printf "%h\n" | cut -d/ -f-2 | sort | uniq -c | sort -rn
```

### Search $PATH for a command or something similar
```sh
find ${PATH//:/ } -name \*bash\*
```

### Change string in many files at once and more.
```sh
find . -type f -exec grep -l XXX {} \;|tee /tmp/fileschanged|xargs perl -pi.bak -e 's/XXX/YYY/g'
```

### a find and replace within text-based files, to locate and rewrite text en mass.
```sh
find . -name "*.txt" | xargs perl -pi -e 's/old/new/g'
```

### Fix "broken" ID3 tags in the current directory and subdirectories
```sh
find -iname '*mp3' -exec mid3iconv {} \;
```

### scan folder to check syntax error in php files
```sh
find . -name "*.php" -exec php -l {} \;
```

### find all file larger than 500M
```sh
find / -type f -size +500M
```

### Find last modified files in a directory and its subdirectories
```sh
find . -type f -print0 | xargs -0 stat -c'%Y :%y %12s %n' | sort -nr | cut -d: -f2- | head
```

### List files above a given threshold
```sh
find . -type f -size +25000k -exec ls -lh {} \; | awk '{ print $8 ": " $5 }'
```

### Compress files found with find
```sh
find ~/bin/ -name "*sh" -print0 | xargs -0t tar -zcvf foofile.tar.gz
```

### Find files that are older than x days
```sh
find . -type f -mtime +7 -exec ls -l {} \;
```

### get the top 10 longest filenames
```sh
find | sed -e "s/^.*\///" | awk ' BEGIN { FS=""} { print NF "  " $0  } ' | sort -nrf | head -10
```

### Delete files older than..
```sh
find /dir_name -mtime +5 -exec rm {} \
```

### Find all the files more than 10MB, sort in descending order of size and record the output of filenames and size in a text file.
```sh
find . -size +10240k -exec ls -l {} \; | awk '{ print $5,"",$9 }'|sort -rn > message.out
```

### Change the ownership of all files owned by one user.
```sh
find /home -uid 1056 -exec chown 2056 {} \;
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f | parallel -j+0 grep -i foobar
```

### Find files and list them sorted by modification time
```sh
find -printf "%C@ %p\n"|sort
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} + | sort -n
```

### Find directories under home directory with 777 permissions, change to 755, and list them on console
```sh
find $HOME -type d -perm 777 -exec chmod 755 {} \; -print
```

### Remove all .svn folders
```sh
find . -depth -name .svn -type d -exec rm -fr {} \;
```

### Show drive names next to their full serial number (and disk info)
```sh
find /dev/disk/by-id -type l -printf "%l\t%f\n" | cut -b7- | sort
```

### Find and copy scattered mp3 files into one directory
```sh
find . -iname '*.mp3' -type f -print0 | xargs -I{} -0 cp {} </path>
```

### Trick find -exec option to execute alias
```sh
find . -exec `alias foo | cut -d"'" -f2` {} \;
```

### Skip over .svn directories when using the "find" command.
```sh
find . -not \( -name .svn -prune \)
```

### copy timestamps of files from one location to another - useful when file contents are already synced but timestamps are wrong.
```sh
find . -printf "touch -m -d \"%t\" '%p'\n" | tee /tmp/retime.sh
```

### Finding all files on local file system with SUID and SGID set
```sh
find / \( -local -o -prune \) \( -perm -4000 -o -perm -2000 \) -type f -exec ls -l {} \;
```

### cleanup /tmp directory
```sh
find /tmp -type f -atime +1 -delete
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -executable -type f -printf "%f\n"
```

### Remove all the files except abc in the directory
```sh
find * -maxdepth 1 -type f ! -name abc -delete
```

### ShellCheck all the bash/sh script under a specific directory excluding version control
```sh
find .  -type f ! -path "./.git/*" -exec sh -c "head -n 1 {} | egrep -a 'bin/bash|bin/sh' >/dev/null" \; -print -exec shellcheck {} \;
```

### find files larger than 1 GB, everywhere
```sh
find / -type f -size +1000000000c
```

### Batch Convert SVG to PNG (in parallel)
```sh
find . -name \*.svg -print0 | xargs -0 -n1 -P4 -I{} bash -c 'X={}; convert "$X" "${X%.svg}.png"'
```

### Gzip files older than 10 days matching *
```sh
find . -type f -name "*" -mtime +10 -print -exec gzip {} \;
```

### Faster find and move using the find and xargs commands. Almost as fast as locate.
```sh
find . -maxdepth 2 -name "*somepattern" -print0 | xargs -0 -I "{}" echo mv "{}" /destination/path
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find . -type f | grep -rl $'\xEF\xBB\xBF'
```

### View all new log messages in real time with color
```sh
find /var/log -type f -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Count number of files in a directory
```sh
find . -maxdepth 1 -type f | wc -l
```

### tar and remove files which are older that 100 days
```sh
find . -type f -mtime +100 -exec tar rvf my.tar remove-files {} \;
```

### Create a tar archive with all files of a certain type found in present dir and subdirs
```sh
find ./ -type f -name "*.txt" -exec tar uvf myarchives.tar {} +
```

### Speed up launch of firefox
```sh
find ~ -name '*.sqlite' -exec sqlite3 '{}' 'VACUUM;' \;
```

### Remove Backup Files
```sh
find / -name *~ -delete
```

### grep (or anything else) many files with multiprocessor power
```sh
find . -type f -print0 | xargs -0 -P 4 -n 40 grep -i foobar
```

### fix broken permissions
```sh
find /path -type d -perm 777 -exec chmod 755 {} \;
```

### Recursively remove all subversion folders
```sh
find . -name .svn  -exec rm \-rf {} \;
```

### find external links in all html files in a directory list
```sh
find . -name '*.html' -print0| xargs -0 -L1 cat |sed "s/[\"\<\>' \t\(\);]/\n/g" |grep "http://" |sort -u
```

### Create md5sum of files under the current dir excluding some directories
```sh
find . -type d \( -name DIR1 -o -name DIR2 \) -prune -o -type f -print0 | xargs -r0 md5sum
```

### find all non-html files
```sh
find . -type f ! -name "*html"
```

### Remove all backup files in my home directory
```sh
find ~user/ -name "*~" -exec rm {} \;
```

### List files with full path
```sh
find $(pwd) -maxdepth 1
```

### Skip filenames with control characters, a.k.a tab,newline etc
```sh
find . ! -name "$(printf '*[\001-\037\177]*')"
```

### Find writable files
```sh
find -writable
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} +
```

### take a look to command before action
```sh
find /tmp -type f -printf 'rm "%p";\n'
```

### Grep only files matching certain pattern (Advanced)
```sh
find . -path "*/any_depth/*" -exec grep "needle" {} +
```

### Recursively remove .svn directories
```sh
find . -type d -name .svn -delete
```

### Recursively remove .svn directories from a local repository
```sh
find . -type d -name .svn -execdir rm -rf {} +
```

### Remove annoying OS X DS_Store folders
```sh
find . -name .DS_Store -exec rm {} \;
```

### Recursive cat - concatenate files (filtered by extension) across multiple subdirectories into one file
```sh
find . -type f -name *.ext -exec cat {} > file.txt \;
```

### Eliminate dead symlinks interactively in /usr/ recursevely
```sh
find /usr/ -type l ! -xtype f ! -xtype d -ok rm -f {} \;
```

### find largest file in /var
```sh
find /var -mount -ls -xdev | /usr/bin/sort -nr +6 | more
```

### Recursively Find Images, Convert to JPEGS and Delete
```sh
find . -name '*'.tiff -exec bash -c "mogrify -format jpg -quality 85 -resize 75% {} && rm {}" \;
```

### Print the 10 deepest directory paths
```sh
find . -type d | perl -nle 'print s,/,/,g," $_"' | sort -n | tail
```

### Recursively remove 0kb files from a directory
```sh
find . -empty -type f -delete
```

### check for write/read permissions
```sh
find ~/ -type d \( -wholename '/dev/*' -o -wholename '/sys/*' -o -wholename '/proc/*' \) -prune -o -exec test -w {} \; -exec echo {} writable \; 2>/dev/null
```

### Size(k) of directories(Biggest first)
```sh
find . -depth -type d -exec du -s {} \; | sort -k1nr
```

### Find broken symlinks in the current directory and its subdirectories.
```sh
find -L -type l
```

### Find jpeg images and copy them to a central location
```sh
find . -iname "*.jpg" -print0 | tr '[A-Z]' '[a-z]' | xargs -0 cp backup=numbered -dp -u target-directory {location} &
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '($1 < 2048) {print $2}'
```

### Lists all directories under the current dir excluding the .svn directory and its contents
```sh
find . \( -type d -name .svn -prune \) -o -type d -print
```

### Add SVN keywords property to all PHP and Javascript files
```sh
find . \( -name "*.php" -o -name "*.js" \) -exec svn propset svn:keywords Id {} \;
```

### Write a shell script that removes files that contain a string
```sh
find -type f -exec grep -q "regexp" {} \; -delete
```

### bash find function
```sh
find (); { ls $1 | while read line; do [[ -d $1/$line ]] && find $1/$line $2 || echo $1/$line | grep $2; done; }
```

### List only executables installed by a debian package
```sh
find $(dpkg -L iptables) -maxdepth 0 -executable -type f
```

### Coping files, excluding certain files
```sh
find ./ ! -name 'excludepattern' | xargs -i cp parents {} destdir
```

### Sum size of files returned from FIND
```sh
find [path] [expression] -exec du -ab {} \; | awk '{total+=$0}END{print total}'
```

### find . -name
```sh
find . -name "*.txt" -exec sed -i "s/old/new/" {} \;
```

### Convert encoding from cp1252 (MS Windows) to UTF-8 on source code files
```sh
find . -iname *.java -type f -exec bash -c "iconv -f WINDOWS-1252 -t UTF-8 {}  > {}.tmp " \; -exec mv {}.tmp {} \;
```

### files and directories in the last 1 hour
```sh
find ./* -ctime -1 | xargs ls -ltr color
```

### Find files modified since a specific date
```sh
find /path/to/somewhere -newermt "Jan 1"
```

### Generate a playlist of all the files in the directory, newer first
```sh
find . -type f -print0 | xargs -r0 stat -c %Y\ %n | sort -rn | gawk '{sub(/.\//,"",$2); print $2}' > /tmp/playlist.m3u
```

### Another way to calculate sum size of all files matching a pattern
```sh
find . -iname '*.jar' | xargs du -ks | cut -f1 | xargs echo | sed "s/ /+/g" | bc
```

### Show the disk usage for files pointed by symbolic link in a directory
```sh
find /usr/lib -maxdepth 1 -type l -print0  | xargs -r0 du -Lh
```

### Delete recursively only empty folders on present dir
```sh
find ./ -empty -type d -delete
```

### Convert all WMF images to SVG recursively ignoring file extension case
```sh
find . -type f -iname '*.wmf' | while read FILE; do FILENAME="${FILE%.*}"; wmf2svg -o ${FILENAME}.svg $FILE; done
```

### List commands with a short summary
```sh
find `echo "${PATH}" | tr ':' ' '` -type f | while read COMMAND; do man -f "${COMMAND##*/}"; done
```

### Counts number of lines
```sh
find . \( -name '*.h' -o -name '*.cc' \) | xargs grep . | wc -l
```

### Parallel mysql dump restore
```sh
find -print0 | xargs -0 -n 1 -P 4 -I {} sh -c "zcat '{}' | mysql nix"
```

### DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
```sh
find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00" if ($h eq $ph)'|xargs -0 rm -v 
```

### Find broken symlinks and delete them
```sh
find -L /path/to/check -type l -delete
```

### Give any files that don't already have it group read permission under the current folder (recursive)
```sh
find . -type f ! -perm /g=r -exec chmod g+r {} +
```

### Recursively lists all files in the current directory, except the ones in '.snapshot' directory
```sh
find . -wholename './.snapshot' -prune -o -print
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name \*.pdf -exec pdfinfo {} \; | grep Pages | sed -e "s/Pages:\s*//g" | awk '{ sum += $1;} END { print sum; }'
```

### Convert all files for iPhone with HandbrakeCLI
```sh
find . -name \*.avi -exec HandBrakeCLI -i "{}" -o "{}".iphone.mp4 preset="iPhone & iPod Touch" \;
```

### Remove all .svn folders
```sh
find . -name .svn -type d -exec rm -rf '{}' +
```

### Move all but the newest 100 emails to a gzipped archive
```sh
find $MAILDIR/ -type f -printf '%T@ %p\n' | sort reverse | sed -e '{ 1,100d; s/[0-9]*\.[0-9]* \(.*\)/\1/g }' | xargs -i sh -c "cat {}&&rm -f {}" | gzip -c >>ARCHIVE.gz
```

### Indent all the files in a project using emacs
```sh
find -iname \*.[ch] -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -delete
```

### Cleanup Python bytecode files
```sh
find . -name "*.py[co]" -exec rm -f {} \;
```

### Create incremental snapshots of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -g "$destdir"/"$tarfile".snar -czf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" | xargs grep "TODO"
```

### grep certain file types recursively
```sh
find . -name "*.[ch]" -exec grep "TODO" {} +
```

### Replace + Find
```sh
find <mydir> -type f -exec sed -i 's/<string1>/<string2>/g' {} \;
```

### Find which jars contain a class
```sh
find . -name "*.jar" | while read file; do echo "Processing ${file}"; jar -tvf $file | grep "Foo.class"; done
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir/ -type f -exec rm {} +
```

### find and grep Word docs
```sh
find . -iname '*filename*.doc' | { while read line; do antiword "$line"; done; } | grep -C4 search_term;
```

### Show all symlinks
```sh
find ./ -type l -ls
```

### Cleanup firefox's database.
```sh
find ~/.mozilla/firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Find Duplicate Files (based on MD5 hash)
```sh
find -type f -exec md5sum '{}' ';' | sort | uniq all-repeated=separate -w 33 | cut -c 35-
```

### Find and display most recent files using find and perl
```sh
find $HOME -type f -print0 | perl -0 -wn -e '@f=<>; foreach $file (@f){ (@el)=(stat($file)); push @el, $file; push @files,[ @el ];} @o=sort{$a->[9]<=>$b->[9]} @files; for $i (0..$#o){print scalar localtime($o[$i][9]), "\t$o[$i][-1]\n";}'|tail
```

### Find all files with colons and replace with underscores; current directory and below (recursive).
```sh
find ./ -name '*:*' -exec rename 's/:/_/g' {} +
```

### Clone current directory into /destination verbosely
```sh
find . | cpio -pumdv /destination
```

### Find broken symlinks
```sh
find . -type l -xtype l
```

### recursive remove all htm files
```sh
find . -type f -name '*.htm' -delete
```

### Recursivly search current directory for files larger than 100MB
```sh
find -size +100M
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -printf "%s\n" | awk '{total += $1} END {print total}'
```

### rsync directory tree including only files that match a certain find result.
```sh
find /src/dir/ -mtime -10 -printf %P\\0|rsync files-from=- from0 /src/dir/ /dst/dir/
```

### Find and remove core files
```sh
find . -type f -regex '.*/core\.?[0-9]*$' -delete
```

### Quick HTML image gallery
```sh
find . -iname "*.jpg" -printf '<img src="%f" title="%f">\n' > gallery.html
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn
```

### find duplicate messages in a Maildir
```sh
find $folder -name "[1-9]*" -type f -print|while read file; do echo $file $(sed -e '/^$/Q;:a;$!N;s/\n //;ta;s/ /_/g;P;D' $file|awk '/^Received:/&&!r{r=$0}/^From:/&&!f{f=$0}r&&f{printf "%s%s",r,f;exit(0)}');done|sort -k 2|uniq -d -f 1
```

### List only directories, one per line
```sh
find . -type d -maxdepth 1
```

### Count number of files in subdirectories
```sh
find . -maxdepth 1 -type d -exec sh -c "printf '{} ' ; find '{}' -type f -ls | wc -l" \;
```

### Selecting a random file/folder of a folder
```sh
find . | shuf -n1
```

### Grab a list of MP3s out of Firefox's cache
```sh
find ~/.mozilla/firefox/*/Cache -exec file {} \; | awk -F ': ' 'tolower($2)~/mpeg/{print $1}'
```

### Make backups recurse through directories
```sh
find -type -f -exec cp {} {}.bak \;
```

### Delete empty directories recursively
```sh
find <top_level_dir> -depth -type d -empty -exec rmdir -v {} \;
```

### Recompress all text files in a subdirectory with lzma
```sh
find . -name '*.txt' -print0 | parallel -0 -j+0 lzma
```

### Search inside a folder of jar/zip files
```sh
find . -name "*.jar" | xargs -tn1 jar tvf | grep color "SearchTerm"
```

### Copy a file structure without files
```sh
find * -type d -exec mkdir /where/you/wantem/\{\} \;
```

### Find all the links to a file
```sh
find -L / -samefile /path/to/file -exec ls -ld {} +
```

### Slightly better compressed archives
```sh
find . \! -type d | rev | sort | rev | tar c files-from=- format=ustar | bzip2 best > a.tar.bz2
```

### Find files with at least one exec bit set
```sh
find . -type f -perm +0111 -print
```

### Find commets in jpg files.
```sh
find / -name "*.jpg" -print -exec rdjpgcom '{}' ';'
```

### LIST FILENAMES OF FILES CREATED TODAY IN CURRENT DIRECTORY
```sh
find -maxdepth 1 -mtime 0 -type f
```

### Find all files that have nasty names
```sh
find -name "*[^a-zA-Z0-9._-]*"
```

### rename all files with "?" char in name
```sh
find . -type f -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find Duplicate Files (based on MD5 hash)  For Mac OS X
```sh
find . -type f -exec md5 '{}' ';' | sort | uniq -f 3 -d | sed -e "s/.*(\(.*\)).*/\1/"
```

### Delete all flash cookies.
```sh
find $HOME -name '*.sol' -exec rm {} \;
```

### List of services sorted by boot order in Redhat-based systems
```sh
find /etc/rc3.d/ | sort -g
```

### Replace underscores with spaces in filenames and dirnames, recursively into subdirs.
```sh
find . -exec rename 's/_/\ /g' {} +
```

### finding more large files
```sh
find / -xdev -size +1024 -exec ls -al {} \; | sort -r -k 5
```

### List mp3 files with less than 320 kbps bitrate.
```sh
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'
```

### List folders containing only PNGs
```sh
find . -name '*png' -printf '%h\0' | xargs -0 ls -l hide=*.png | grep -ZB1 ' 0$'
```

### Replace php short open tags
```sh
find . -name '*.phtml' | xargs perl -pi -e 's/(?!(<\?(php|xml|=)))<\?/<\?php/g;'
```

### Sort files in multiple directories by date
```sh
find .  -type f -exec ls -l full-time {} + | sort -k 6,7
```

### Find where a kind of file is stored
```sh
find . -name '*.desktop' | sed s/[^/]*\.desktop$// | uniq -c | sort -g
```

### Search for files  older than 30 days in a directory and list only their names not the full path
```sh
find /var/www/html/ -type f -mtime +30 -exec basename {} \;
```

### Counts number of lines (in source code excluding comments)
```sh
find . -name '*.java' | xargs -L 1 cpp -fpreprocessed | grep . | wc -l
```

### View all images
```sh
find -iname '*.jpg' -print0 | xargs -0 feh -d
```

### find text in a file
```sh
find /directory/to/search/ -type f -print0 | xargs -0 grep "findtext"
```

### Stat each file in a directory
```sh
find . -maxdepth 1 -type f | xargs stat
```

### Find files and list them sorted by modification time
```sh
find -type f -print0 | xargs -r0 stat -c %y\ %n | sort
```

### Remove last line from files recursively
```sh
find . -name "*.php" -type f -exec sed -i "\$d" '{}' \;
```

### Rename many files in directories and subdirectories
```sh
find . -type d -print0 | while read -d $'\0' dir; do cd "$dir"; echo " process $dir"; find . -maxdepth 1 -name "*.ogg.mp3" -exec rename 's/.ogg.mp3/.mp3/' {} \; ; cd -; done
```

### git pull all repos
```sh
find ~ -maxdepth 2 -name .git -print | while read repo; do cd $(dirname $repo); git pull; done
```

### find out how much space are occuipied by files smaller than 1024K (sic) - improved
```sh
find dir -size -1024k -type f -print0 | du files0-from - -bc
```

### Find Duplicate Files, excluding .svn-directories (based on size first, then MD5 hash)
```sh
find -type d -name ".svn" -prune -o -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type d -name ".svn" -prune -o -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Batch convert files to utf-8
```sh
find . -name "*.php" -exec iconv -f ISO-8859-1 -t UTF-8 {} -o ../newdir_utf8/{} \;
```

### Recursively execute command on directories (.svn, permissions, etc)
```sh
find . -type d -name .svn -exec chmod g+s "{}" \;
```

### Quick HTML image gallery
```sh
find . -iname '*.jpg' | sed 's/.*/<img src="&">/' > gallery.html
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) -exec wc -l {} \; | sort
```

### List top 10 files in filesystem or mount point bigger than 200MB
```sh
find /myfs -size +209715200c -exec du -m {} \; |sort -nr |head -10
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/apt -not -mtime -7 | sudo xargs rm
```

### Recursively touch all files and subdirectories
```sh
find . -exec touch {} \;
```

### Unaccent an entire directory tree with files.
```sh
find /dir | awk '{print length, $0}' | sort -nr | sed 's/^[[:digit:]]* //' | while read dirfile; do outfile="$(echo "$(basename "$dirfile")" | unaccent UTF-8)"; mv "$dirfile" "$(dirname "$dirfile")/$outfile"; done
```

### Compress logs older than 7 days
```sh
find /path/to/files -type f -mtime +7 | grep -v \.gz | xargs gzip
```

### defragment files
```sh
find ~ -maxdepth 20 -type f -size -16M -print > t; for ((i=$(wc -l < t); i>0; i)) do a=$(sed -n ${i}p < t); mv "$a" /dev/shm/d; mv /dev/shm/d "$a"; echo $i; done; echo DONE; rm t
```

### View all new log messages in real time with color
```sh
find /var/log -iregex '.*[^\.][^0-9]+$' -not -iregex '.*gz$' 2> /dev/null | xargs tail -n0 -f | ccze -A
```

### Generate SHA1 hash for each file in a list
```sh
find . -type f -exec sha1sum {} >> SHA1SUMS \;
```

### Summarise the size of all files matching a simple regex
```sh
find /path/to/my/files/ -type f -name "*txt*" | xargs du -k | awk 'BEGIN{x=0}{x=x+$1}END{print x}'
```

### Find all files under a certain directory /home that have a certain suffix at the end of the file name. Show the file and rename them to remove the suffix.
```sh
find /home -print -exec rename -v 's/_2009-09-04.suffix$//' {} \;
```

### Print a list of the 30 last modified mp3s sorted by last first
```sh
find ~/Music -daystart -mtime -60 -name *mp3 -printf "%T@\t%p\n" | sort -f -r | head -n 30 | cut -f 2
```

### Find Files That Exceed a Specified Size Limit
```sh
find directory -size +nnn
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -exec rm -f {} \;
```

### copies 20 most recently downloaded mp3 files (such as from Miro) into a directory
```sh
find . -name \*.mp3 -printf "%C+ %h/%f\n" | sort -r | head -n20 | awk '{print "\""$2"\""}' | xargs -I {} cp {} ~/tmp
```

### sort through source to find most common authors
```sh
find . -type f -name "*.java" -print0 | xargs -0 -n 1 svn blame | sed -n 's/^[^a-z]*\([a-z]*\).*$/\1/p' | sort | uniq -c | sort -n
```

### Find the most recently changed files (recursively)
```sh
find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort
```

### Remove Thumbs.db files from folders
```sh
find ./ -name Thumbs.db -delete
```

### Find directory depth
```sh
find . -printf '%d\n' | sort -n  | tail -1
```

### Move mp3 files to another path with existing subtree structure
```sh
find . -iname "*.mp3" -type f -print0 | xargs -0 -I '{}' mv {} /new/path/to/mp3/{}
```

### 1:1 copy of a volume
```sh
find / -xdev -print | cpio -pdmuv /mnt/mydisk
```

### Command template, executing a command over multiple files, outputing progress and fails only
```sh
find <dir> -name "<pattern>" | while read file; do echo -n .; output=$(<command>) || (echo ; echo $file:; echo "$output"; ); done
```

### Get line count for any file ending with extension recursively rooted at the current directory.
```sh
find . -name "*.py" | xargs wc -l
```

### Find broken symlinks and delete them
```sh
find . -type l -exec test ! -e {} \; -delete
```

### Recover cvs ": no such repository" error
```sh
find ./* -name 'CVS' | awk '{print "dos2unix " $1 "/*"}' | awk '{system($0)}'
```

### Archive all SVN repositories in platform indepenent form
```sh
find repMainPath -maxdepth 1 -mindepth 1 -type d | while read dir; do echo processing $dir; sudo svnadmin dump deltas $dir >dumpPath/`basename $dir`; done
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Get lines count of a list of files
```sh
find . -name "*.sql" -print0 | wc -l files0-from=-
```

### Recursively remove Mac . (dot) files
```sh
find . -name '._*' -type f -delete
```

### Add .gitignore files to all empty directories recursively from your current directory
```sh
find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;
```

### Show demo of toilet fonts
```sh
find /usr/share/figlet -name *.?lf -exec basename {}  \; | sed -e "s/\..lf$//" | xargs -I{} toilet -f {} {}
```

### convert filenames in current directory to lowercase
```sh
find my_root_dir -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;
```

### Sort movies by length, longest first
```sh
find -name '*.avi' | while read i ; do echo $(mplayer -identify -frames 0 -vo null -nosound "$i" 2>&1 | grep ID_LENGTH | cut -d= -f2)" ""$i" ;done | sort -k1 -r -n | sed 's/^\([^\ ]*\)\ \(.*\)$/\2:\1/g'
```

### Find C/C++ source files
```sh
find . -name '*.[c|h]pp' -o -name '*.[ch]' -type f
```

### A function to find the newest file in a directory
```sh
find /path/to/dir  -type f -printf "%T@|%p\n" 2>/dev/null | sort -n | tail -n 1| awk -F\| '{print $2}'
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' | xargs grep -H "string"
```

### Determine space taken by files of certain type
```sh
find . -name <pattern> -ls | awk 'BEGIN {i=0}; {i=i+$7}; END {print i}'
```

### Find files recursively that were updated in the last hour ignoring SVN files and folders.
```sh
find . -mmin -60 -not -path "*svn*" -print|more
```

### find string into one pdf file
```sh
find / -iname '*.pdf' -print -exec pdftotext '{}' - \; | grep color -i "unix"
```

### remove execute bit only from files. recursively
```sh
find . -type f -exec chmod -x {} \;
```

### Change files case, without modify directories, recursively
```sh
find ./ -name '*.JPG' -type f -execdir rename -f 'y/A-Z/a-z/' {} \+
```

### finds the c files with lines containing 'mcs', in the folders under the current folder
```sh
find */*.c | xargs grep 'mcs'
```

### Recursively remove .svn directories from the current location
```sh
find . -type d -name '.svn' -print0 | xargs -0 rm -rdf
```

### Count files beneath current directory (including subfolders)
```sh
find . -type f | wc -l
```

### Grep for regular expression globally, list files and positions.
```sh
find . -name "*.pbt" -exec grep -Hirn "declareObject.*Common_Down" {} \;
```

### list folders containing less than 2 MB of data
```sh
find . -type d -exec du -sk '{}' \; | awk '{ if ($1 <2000) print $0 }' | sed 's/^[0-9]*.//'
```

### Delete all files older than X in given path
```sh
find . -mtime +10 -delete
```

### Replicate a directory structure dropping the files
```sh
find . -type d -exec mkdir -p $DESTDIR/{} \;
```

### create a backup for all directories from current dir
```sh
find -maxdepth 1 -type d -print0 | xargs -0 -I {} tar -cvzf {}.tar.gz {}
```

### Find all files containing a word
```sh
find . -name "*.php" | xargs grep -il searchphrase
```

### MP3 player
```sh
find . -name '*.mp3' | sort | while read -r mp3; do echo -e "<h3>$mp3</h3>\n<audio controls src=\"$mp3\"></audio>"; done > index.html; python -m http.server
```

### Invert selection with find.
```sh
find . ! -name "*.tar.gz"
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -print0 | xargs -0 grep -i <pattern>
```

### make a list of movies(.m3u).
```sh
find $HOME -type f -print | perl -wnlaF'/' -e 'BEGIN{ print "#EXTM3U"; } /.+\.wmv$|.+\.mpg$|.+\.vob$/i and print "#EXTINF:$F[-1]\nfile://$&";' > movies.m3u
```

### Normalize volume in your mp3 library
```sh
find . -type f -name '*.mp3' -execdir mp3gain -a '{}' +
```

### Copy a directory recursively without data/files
```sh
find . -type d -exec mkdir /copy_location/{} \;
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 -type d|xargs du -a max-depth=0|sort -rn|cut -d/ -f2|sed '1d'|while read i;do echo "$(du -h max-depth=0 "$i")/";done;find . -maxdepth 1 -type f|xargs du -a|sort -rn|cut -d/ -f2|sed '$d'|while read i;do du -h "$i";done
```

### Find all plain text files that do not contain STRING
```sh
find . -type f ! -exec grep -q 'STRING' {} \; -print
```

### change ownership en masse of files owned by a specific user, including files and directories with spaces
```sh
find . -uid 0 -print0 | xargs -0 chown foo:foo
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -mount -type f -printf "%k %p\n" | sort -rg | cut -d \  -f 2- | xargs -I {} du -sh {} | less
```

### Finds all files from / on down over specified size.
```sh
find / -type f -size +25M -exec ls -lh {} \; | awk '{ print $5 " " $6$7 ": " $9 }'
```

### Find all SUID binaries
```sh
find / -perm +6000 -type f -exec ls -ld {} \;
```

### count the number of specific characters in a file or text stream
```sh
find /some/path -type f -and -iregex '.*\.mp3$' -and -print0 | tr -d -c '\000' |wc -c
```

### execute command on all files of certain types excluding folders that match pattern
```sh
find . -regextype posix-egrep -regex '.+\.(c|cpp|h)$' -not -path '*/generated/*' -not -path '*/deploy/*' -print0 | xargs -0 ls -L1d
```

### List only directories, one per line
```sh
find * -type d -maxdepth 0
```

### Recurse through directories easily
```sh
find . -type f | while read file; do cp $file ${file}.bak; done
```

### find filenames and directory names that doesn't conform ISO 9660 level 2
```sh
find . -regextype posix-extended -not -regex '.*/[A-Za-z_]*([.][A-Za-z_]*)?'
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do unzip -l $line; done | grep your-string
```

### list files by testing the ownership
```sh
find . -user root
```

### Recursive Line Count
```sh
find * -type f -not -name ".*" | xargs wc -l
```

### Recursive Line Count
```sh
find ./ -not -type d | xargs wc -l | cut -c 1-8 | awk '{total += $1} END {print total}'
```

### calculate md5 sums for every file in a directory tree
```sh
find . -type f -print0 | xargs -0 md5sum
```

### List out classes in of all htmls in directory
```sh
find . -name '*.html' -exec  'sed' 's/.*class="\([^"]*\?\)".*/\1/ip;d' '{}' ';' |sort -su
```

### Find how much of your life you've wasted coding in the current directory
```sh
find * \( -name "*.[hc]pp" -or -name "*.py" -or -name "*.i" \) -print0 | xargs -0 wc -l | tail -n 1
```

### archlinux:Delete packages from pacman cache that are older than 7 days
```sh
find /var/cache/pacman/pkg -not -mtime -7 | sudo xargs rm
```

### Find only *.doc and *xls files on Windows partition
```sh
find /mountpoint -type f -iregex '.*\.\(doc\|xls\)'
```

### recursive search and replace old with new string, inside files
```sh
find . -type f -exec sed -i s/oldstring/newstring/g {} +
```

### Validate all XML files in the current directory and below
```sh
find -type f -name "*.xml" -exec xmllint noout {} \;
```

### recursively remove BOM
```sh
find . -type f -exec sed -i -e '1s/^\xEF\xBB\xBF//' {} \;
```

### Converts all windows .URL shortcuts in a directory to linux (gnome) .desktop shortcuts
```sh
find . -name "*.URL" | while read file ; do cat "$file" | sed 's/InternetShortcut/Desktop Entry/' | sed '/^\(URL\|\[\)/!d' > "$file".desktop && echo "Type=Link" >> "$file".desktop ; done
```

### Find all dotfiles and dirs
```sh
find -mindepth 1 -maxdepth 1 -name .\*
```

### Recursively remove .svn directories
```sh
find . -name .svn -exec rm -r {} +;
```

### find sparse files
```sh
find -type f -printf "%S\t%p\n" 2>/dev/null | gawk '{if ($1 < 1.0) print $1 $2}'
```

### Convert all old SVN repositories in one directory to new format
```sh
find . -maxdepth 1 -type d -exec 'mv "{}" "{}-old" && svnadmin create "{}" && svnadmin recover "{}-old" && svnadmin dump "{}-old" | svnadmin load "{}" && rm -rf "{}-old"' \;
```

### follow the content of all files in a directory
```sh
find dir/ -type f | xargs tail -fqn0
```

### Find inside files two different patterns in the same line and for matched files show number of matched lines
```sh
find . -name '*' -type f -print0 | xargs -0 grep -n pattern1 | grep pattern2
```

### Create md5sum of a directory
```sh
find -type f | grep -v "^./.git" | xargs md5sum | md5sum
```

### Create md5sum of a directory
```sh
find -name .git -prune -o -type f -exec md5sum {} \; | sort -k2 | md5sum
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -regextype posix-egrep -iregex '.*?\.(ogg|mp3)' | sort > ~/mylist.m3u
```

### List all symbolic links in a directory matching a string
```sh
find directory -type l -lname string
```

### Show all mergeinfo for a svn subtree
```sh
find . \( -type d -name .svn -prune \) -o -print | while read file ; do mergeinfo=`svn propget svn:mergeinfo $file` ; [ "$mergeinfo" != "" ] && echo -e "$file\n    $mergeinfo\n" ; done
```

### Create and play an instant keyword based playlist
```sh
find -E ~/Music -type f -iname "*search terms*" -iregex '.*\.(3g[2|p]|aac|ac3|adts|aif[c|f]?|amr|and|au|caf|m4[a|r|v]|mp[1-4|a]|mpeg[0,9]?|sd2|wav)' -exec afplay "{}" \; &
```

### Recursively search and replace old with new string, inside every instance of filename.ext
```sh
find . -type f -name filename.exe -exec sed -i "s/oldstring/oldstring/g" {} +;
```

### finding cr-lf files aka dos files with ^M characters
```sh
find $(pwd) -type f -exec grep -l "$(echo "\r")" {} \;
```

### Change permissions of every directory in current directory
```sh
find . -type d -exec chmod 755 {} \;
```

### Find broken symlinks
```sh
find /path/to/search -xtype l
```

### remove recursively all txt files with number of lines less than 10
```sh
find . -type f -name "*.txt" | while read; do (($(cat $THISFILE | wc -l) < 10)) && rm -vf "$THISFILE";  done
```

### a find and replace within text-based files
```sh
find . -iname "FILENAME" -exec sed -i 's/SEARCH_STRING/REPLACE_STRING/g' {} \;
```

### Simple Gumblar check command
```sh
find filepath -type f -iname "*.html" -o -iname "*.htm" -o -iname "*.php" | xargs grep "Exception\|LGPL\|CODE1"
```

### Iterate through current directory + all subs for C++ header files and rank by # of comments
```sh
find ./ -name *.h -exec egrep -cH "// | /\*" {} \; | awk -F':' '{print $2 ":" $1}' | sort -gr
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f 2>/dev/null | xargs du 2>/dev/null | sort -n | tail -n 10 | cut -f 2 | xargs -n 1 du -h
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate
```

### Check syntax for all PHP files in the current directory and all subdirectories
```sh
find . -name \*.php -exec php -l "{}" \;
```

### BIGGEST Files in a Directory
```sh
find . -printf '%.5m %10M %#9u %-9g %TY-%Tm-%Td+%Tr [%Y] %s %p\n'|sort -nrk8|head
```

### find all file larger than 500M
```sh
find . -type f -size +500M -exec du {} \; | sort -n
```

### List all execs in $PATH, usefull for grepping the resulting list
```sh
find ${PATH//:/ } -iname "*admin*" -executable -type f
```

### FInd the 10 biggest files taking up disk space
```sh
find / -type f -size +100M -exec du {} \; | sort -n | tail -10 | cut -f 2
```

### Remove spaces from filenames - through a whole directory tree.
```sh
find . -depth -name '* *' -execdir bash \-c 'a="{}";mv -f "$a" ${a// /_}' \;
```

### list all file-types (case-insensitive extensions) including subdirectories
```sh
find /path/to/dir -type f |sed 's/^.*\.//' |sort -f |uniq -i
```

### Find files of two different extensions and copy them to a directory
```sh
find * -regextype posix-extended -regex '.*\.(ext_1|ext_2)' -exec cp {} copy_target_directory \;
```

### FInd the 10 biggest files taking up disk space
```sh
find /home/ -type f -exec du {} \; 2>/dev/null | sort -n | tail -n 10 | xargs -n 1 du -h 2>/dev/null
```

### find out how much space are occuipied by files smaller than 1024K
```sh
find dir -size -1024k -type f | xargs -d $'\n' -n1 ls -l | cut -d ' ' -f 5  | sed -e '2,$s/$/+/' -e '$ap' | dc
```

### Find files with size over 100MB and output with better lay-out
```sh
find . -type f -size +100M
```

### RELINK a lot of broken symlinks - FIX broken symlinks after rsync site to new server
```sh
find /PATHNAME -type l | while read nullsymlink ; do wrongpath=$(readlink "$nullsymlink") ; right=$(echo "$wrongpath" | sed s'|OLD_STRING|NEW_STRING|') ; ln -fs "$right" "$nullsymlink" ; done
```

### Stat each file in a directory
```sh
find -name `egrep -s '.' * | awk -F":" '{print $1}' | sort -u` -exec stat {} \;
```

### Clear cassandra snapshots that are older than 30 days
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -mtime +30 -print0 | xargs -0 rm -rf
```

### Delete empty,  24-hours-old directories recursively, without consider hidden directories
```sh
find .  -regex "[^.]*" -depth -empty -type d -mtime +1 -exec rmdir -v {} \;
```

### Erase empty files
```sh
find . -type f -size 0 -delete
```

### Find and delete oldest file of specific types in directory tree
```sh
find / \( -name "*.log" -o -name "*.mylogs" \) -exec ls -lrt {} \; | sort -k6,8 | head -n1 | cut -d" " -f8- | tr -d '\n' | xargs -0 rm
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {};
```

### Quick HTML image gallery from folder contents with Perl
```sh
find . | perl -wne 'chomp; print qq|<img src="$_" title="$_" /><br />| if /\.(jpg|gif|png)$/;'> gallery.html
```

### Find dead symbolic links
```sh
find . -type l | perl -lne 'print if ! -e'
```

### gain all mp3s in subfolders w/o encoding
```sh
find . -type f -iname '*.mp3' -print0 | xargs -0 mp3gain -r -k
```

### find all writable (by user) files in a directory tree (use 4 for readable, 1 for executable)
```sh
find . -type f -perm +200 -print
```

### delete file name space
```sh
find . -type f -print0 | xargs -0 rename 's/\ //g'
```

### Print all open regular files sorted by the number of file handles open to each.
```sh
find /proc/*/fd -xtype f -printf "%l\n" | grep -P '^/(?!dev|proc|sys)' | sort | uniq -c | sort -n
```

### Count the number of deleted files
```sh
find /path/folder -type f -name "*.*" -print -exec rm -v {} + | wc -l;
```

### find and delete empty dirs, start in current working dir
```sh
find . -empty -type d -exec rmdir {} +
```

### Find the biggest files on your hard drive
```sh
find / -type f -size +500000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'
```

### search office documents for credit card numbers and social security number SSN docx xlsx
```sh
find  . -iname "*.???x" -type f -exec  unzip -p '{}' '*'
```

### List files in directory tree with newest last
```sh
find <directory> -type f -printf "%T@\t%p\n"|sort -n|cut -f2|xargs ls -lrt
```

### Count all files in directories recursively with find
```sh
find -maxdepth 3 -type d | while read -r dir; do printf "%s:\t" "$dir"; find "$dir" | wc -l; done
```

### Recursive search inside the content of files under current directory - then view the result paginated with 'less'
```sh
find . -exec grep -Hn what \{\} \; | less
```

### pngcrush all .png files in the directory
```sh
find . -iname '*png' -exec pngcrush -ow -brute  {} {}.crush \;
```

### Find the biggest files
```sh
find -type f | xargs -I{} du -sk "{}" | sort -rn | head
```

### Ultimate current directory usage command
```sh
find . -maxdepth 1 ! -name '.'  -execdir du -0 -s {} + | sort -znr | gawk 'BEGIN{ORS=RS="\0";} {sub($1 "\t", ""); print $0;}' | xargs -0 du -hs
```

### calculate the total size of files in specified directory (in Megabytes)
```sh
find directory -maxdepth 1 -type f  | xargs ls -l | awk 'BEGIN { SUM=0} { SUM+=$5 } END { print SUM/2^20 }'
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0 cat | grep -v "^ *$" | grep -v "^ *//" | grep -v "^ */\*.*\*/" | wc -l
```

### Find files changed between dates defined by ctime of two files specified by name
```sh
find . -cnewer <file a> -and ! -cnewer <file b>
```

### find only current directory (universal)
```sh
find . \( ! -name . -prune \) \( -type f -o -type l \)
```

### Recompress all files in current directory from gzip to bzip2
```sh
find . -type f -name "*.gz" | while read line ; do gunzip to-stdout "$line" | bzip2 > "$(echo $line | sed 's/gz$/bz2/g')" ; done
```

### find xargs mv
```sh
find . -iname "*.mp4" -print0 | xargs -0 mv verbose -t /media/backup/
```

### which procs have $PATH_REGEX open?
```sh
find /proc -regex '/proc/[0-9]+/smaps' -exec grep -l "$PATH_REGEX" {} \; | cut -d'/' -f2
```

### Build an exhaustive list of maildir folders for mutt
```sh
find ~/Maildir/ -mindepth 1 -type d | egrep -v '/cur$|/tmp$|/new$' | xargs
```

### Checks the syntax of all PHP files in and below the current working directory
```sh
find . -name "*.php" -exec php -l {} \; | sed -e "/^No syntax/d"
```

### find large files
```sh
find . -type f -size +1100000k |xargs -I% du -sh %
```

### List all duplicate directories
```sh
find .  -type d| while read i; do echo $(ls -1 "$i"|wc -m) $(du -s "$i"); done|sort -s -n -k1,1 -k2,2 |awk -F'[ \t]+' '{ idx=$1$2; if (array[idx] == 1) {print} else if (array[idx]) {print array[idx]; print; array[idx]=1} else {array[idx]=$0}}'
```

### Recursively replace a string in files with lines matching string
```sh
find . -type f |xargs -I% sed -i '/group name/s/>/ deleteMissing="true">/' %
```

### move contents of the current directory to the parent directory, then remove current directory.
```sh
find . ! -name "." -print0 | xargs -0 -I '{}' mv -n '{}' ..; rmdir "$PWD"
```

### How to estimate the storage size of all files not named *.[extension] on the current directory
```sh
find . -maxdepth 1 -type f -not -iname '*.jpg' -ls |awk '{TOTAL+=$7} END {print int(TOTAL/(1024^2))"MB"}'
```

### Remove all .svn folders
```sh
find . -name .svn -type d |xargs rm -rf
```

### search for text in files. recursive.
```sh
find /name/of/dir/ -name '*.txt' | xargs grep 'text I am searching for'
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f | grep -o '\.[^./]*$' | sort | uniq
```

### Delete Empty Directories
```sh
find . -type d -exec rmdir {} \;
```

### list all file extensions in a directory
```sh
find /path/to/dir -type f -name '*.*' | sed 's@.*/.*\.@.@' | sort | uniq
```

### Remove executable bit from all files in the current directory recursively, excluding other directories
```sh
find . ! -type d -exec chmod -x {}\;
```

### Create full backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir/"; tar -czf $destdir/"$tarfile"_full.tgz -P $d; done
```

### Create incremental backups of individual folders using find and tar-gzip
```sh
find /mnt/storage/profiles/ -maxdepth 1 -mindepth 1 -type d | while read d; do tarfile=`echo "$d" | cut -d "/" -f5`; destdir="/local/backupdir"; tar -czvf "$destdir"/"$tarfile"_`date +%F`.tgz -P $d; done
```

### Directory Tree
```sh
find . -type d -print | sed -e 's;[^/]*/;..........;g'|awk '{print $0"-("NR-1")"}'
```

### Use find to get around Argument list too long problem
```sh
find . -name 'junkfiles-*' -print0 | xargs -0 rm
```

### Find corrupted jpeg image files
```sh
find . -name "*jpg" -exec jpeginfo -c {} \; | grep -E "WARNING|ERROR"
```

### Replicate a directory structure dropping the files
```sh
find . -type d -print0 | (cd $DESTDIR; xargs -0 mkdir)
```

### Find files in multiple TAR files
```sh
find . -type f -name "*.tar" -printf [%f]\\n -exec tar -tf {} \; | grep -iE "[\[]|<filename>"
```

### find matching wholename example
```sh
find -wholename "*/query/*.json"
```

### Summarize size of all files of given type in all subdirectories (in bytes)
```sh
find . -iname '*.jpg' -type f -print0 |perl -0 -ne '$a+=-s $_;END{print "$a\n"}'
```

### find co-ordinates of a location
```sh
findlocation() { place=`echo $* | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}
```

### Print names of all video files encoded with h264
```sh
find -type f -exec bash -c 'if ffmpeg -i "{}" 2>&1 | grep -qi h264 ; then echo "{}"; fi' \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -name '*.mp3' -type f -exec sh -c 'exec cp -f "$@" /home/user/dir' find-copy {} +
```

### increase recurively the modification time for a list of files
```sh
find . -type f | while read line; do NEW_TS=`date -d@$((\`stat -c '%Y' $line\` + <seconds> )) '+%Y%m%d%H%M.%S'`; touch -t $NEW_TS ${line}; done
```

### Periodic Log Deletion
```sh
find /path/to/dir -type f -mtime +[#] -exec rm -f {} \;
```

### Find and copy scattered mp3 files into one directory
```sh
find . -type f -iname '*.mp3' -exec cp {} ~/mp3/ \;
```

### Mirror every lvol in vg00 in hp-ux 11.31
```sh
find /dev/vg00 -type b |while read L; do lvextend -m 1 $L /dev/disk/<disk> ; done
```

### Search specified $TEXT1 and Replace that by specified arg ($TEXT2)
```sh
find "$DIR" -regex "$FILENAME" -type f -print0 | xargs -0 sed -i _`date "+%y%m%d%H%M%S"` -E "s/$TEXT1/$TEXT2/g"
```

### List files older than one year, exluding those in the .snapshot directory
```sh
find /path/to/directory -not \( -name .snapshot -prune \) -type f -mtime +365
```

### Archive all files that have not been modified in the last days
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Recursive grep of all c++ source under the current directory
```sh
find . -name '*.?pp' -exec grep -H "string" {} \;
```

### Use -t when using find and cp
```sh
find . -name "*.pdf" -print0 | xargs -0 cp -t downloads/
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%-30s'\t\"%h/%f\"\n" | sort -rn -t$'\t' | uniq -w30 -D | cut -f 2 -d $'\t' | xargs md5sum | sort | uniq -w32 all-repeated=separate
```

### Link a deep tree of files all into on directory
```sh
find /deep/tree/ -type f -print0|xargs -0 -n1 -I{} ln -s '{}' .
```

### Arguments too long
```sh
find . -name "*.txt" -exec WHATEVER_COMMAND {} \;
```

### Recursive replace of directory and file names in the current directory.
```sh
find . *oldname* | grep oldname | perl -p -e 's/^(.*)(oldname)(.*$)/mv $1$2$3 $1newname$3/' | sh
```

### Find broken symlinks
```sh
find . -type l ! -exec test -e {} \; -print
```

### find files ignoring .svn and its decendents
```sh
find . -type f ! -iwholename \*.svn\* -print0 [ | xargs -0 ]
```

### Find class in jar
```sh
find . -name '*.jar' | xargs -l jar vtf | grep XXX.java
```

### find files ignoring .svn and its decendents
```sh
find . -type d -name .svn -prune -o -type f -print0 | xargs -r0 ...
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{s+=$2} END {print s}'
```

### Cleanup firefox's database.
```sh
find ~/Library/Application\ Support/Firefox/ -type f -name "*.sqlite" -exec sqlite3 {} VACUUM \;
```

### Use md5sum to check your music and movie files. Also use diff.
```sh
find . -type f -exec md5sum {}\; > <filename>
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -depth -print -execdir rename -f 'y/A-Z/a-z/' '{}' \;
```

### Bulk renames with find, sed and a little escaping
```sh
find . -exec bash -c "mv '{}' '\`echo {} |sed -e 's/foo/bar/g'\`"' \;
```

### find which of the zip files contains the file you're searching for
```sh
find . -iname '*.zip' | while read file; do unzip -l "$file" | grep -q [internal file name] && echo $file; done
```

### find with high precission (nanoseconds 1/1,000,000,000s) the last changed file.
```sh
find . -type f -print0 | xargs -0 stat -c '%y %n' | sort -n -k 1,1 -k 2,1 | awk 'END{print $NF}'
```

### Clean all .pyc files from current project. It cleans all the files recursively.
```sh
find . -type f -name "*.pyc" -delete;
```

### move all files older than 60 days to a folder
```sh
find ./* -mtime +60 -exec mv {} storeFolder \;
```

### Search for a <pattern> string inside all files in the current directory
```sh
find . -type f -exec grep -i <pattern> \;
```

### Quick HTML image gallery from folder contents
```sh
find . -iname '*.jpg' -exec echo '<img src="{}">' \; > gallery.html
```

### Print a list of all hardlinks in the working directory, recursively
```sh
find . -type f -a \! -links 1
```

### find and reduce 8x parallel the size of JPG images without loosing quality via jpegoptim
```sh
find  /var/www/ -type f -name '*.[jJ][pP][gG]' -print0 | xargs -n 1 -P 8 -0 jpegoptim strip-all preserve preserve-perms quiet
```

### Prints the latest modified files in a directory tree recursively
```sh
find . -name '*pdf*' -print0 | xargs -0 ls -lt | head -20
```

### Clone /
```sh
find . -path ./mnt -prune -o -path ./lost+found -prune -o -path ./sys -prune -o -path ./proc -prune -o -print | cpio -pumd /destination && mkdir /destination/mnt/ && mkdir /destination/proc && mkdir /destination/sys
```

### Delete more than one month old thumbnails from home directory
```sh
find  ~/.thumbnails/ -type f -atime +30 -print0 | xargs -0 rm
```

### recursive transform all contents of files to lowercase
```sh
find . -type f -print0 | xargs -0 perl -pi.save -e 'tr/A-Z/a-z/'
```

### Copy files from multiple directories into one directory
```sh
find <start directory> -iname "<all my files type>" -exec cp {} <target_dir> \;
```

### find file/dir by excluding some unwanted dirs and filesystems
```sh
find . -xdev -path ./junk_dir -prune -o -type d -name "dir_name" -a -print
```

### Make a statistic about the lines of code
```sh
find . -type f -name "*.c" -exec cat {} \; | wc -l
```

### Find and copy files from subdirectories to the current directory
```sh
find ./ -iname '*avi' -exec cp  {} ./ \;
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -exec stat -c%s {} \; | awk '{total += $1} END {print total}'
```

### finding cr-lf files aka dos files with ^M characters
```sh
find . -type f -exec fgrep -l $'\r' "{}" \;
```

### Create a tar of directory structure only
```sh
find . -type d|xargs tar rf ~/dirstructure.tar no-recursion
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List all symbolic links in current directory
```sh
find /was61 -type l
```

### List movie size in current directory
```sh
find . -regex '\(.*mp4\|.*mpg\|.*mpeg\|.*mov\|.*wmv\|.*mkv\|.*avi\)' -exec exiftool -directory -fileName -imageSize {} \;
```

### Move lots files with AWK
```sh
find . -maxdepth 1 -type f | awk 'BEGIN { c=0 } { if( c == <quantity_at_a_time> ) { print l; l=$0; c=1 } else { if( l != "") { l=l" "$0 } else { l=$0 }; c++}} END { print l }' | xargs mv -t <dir_dest>
```

### remove files that were modified 30 days ago
```sh
find . -mtime +30 -type f -exec rm -rf {} \;
```

### List all files in current dir and subdirs sorted by size
```sh
find . -printf "%s %p\n" | sort -n
```

### To remove all *.swp files underneath the current directory
```sh
find . -name \*.swp -type f -delete
```

### Find files and calculate size of result in shell
```sh
find . -name "pattern" -type f -exec du -ch {} + | tail -n1
```

### Install an entire folder of .apk files to your android device thru adb
```sh
find ~/path/to/apk/files -name '*.apk' -exec adb install {} \;
```

### play all mp4 files on home directory
```sh
find ~ -name '*.mp4' | xargs mplayer
```

### Search recursive all docx files for SearchTerm and print its name
```sh
find . -name '*docx'  -exec sh -c "unzip -p {} word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g' | grep -i SearchTerm -q && echo {} " \;
```

### Find files of particular size in a directory
```sh
find . -size +10240k -exec stat -c%s" "%n {} \; | sort -rn
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn
```

### Kill processes that have been running for more than a week
```sh
find /proc -user myuser -maxdepth 1 -type d -mtime +7 -exec basename {} \; | xargs kill -9
```

### Find removed files still in use via /proc
```sh
find -L /proc/*/fd -links 0 2>/dev/null
```

### Find core files
```sh
find . -type f -regex ".*/core.[0-9][0-9][0-9][0-9]$"
```

### Copy files (.pdfs in this case) from a directory hierarchy to a different directory, ignoring the original structure
```sh
find <source_directory> -name *.pdf -exec mv {} <destination_dir> \;
```

### Copying part of the files from one directory to another
```sh
find dir1 -maxdepth 1 -type f | head -100000 | xargs mv -t dir2/subdir
```

### Run git gc in all git repositories bellow .
```sh
find . -name .git -print0 | while read -d $'\0' g; do echo "$g"; cd "$g"; git gc aggressive; cd -; done
```

### Count number of javascript files in subdirectories
```sh
find  . -mindepth 2 -name "*.js" -type f |wc -l
```

### Remove all .svn directories recursively from a directory
```sh
find . -name '.svn' -type d | xargs rm -rf
```

### If a directory contains softlinks, grep will give lot of warnings. So better use it along with find command so that softlinks are excluded. "Hn" operator will take care that both line number and filename is shown in grep output
```sh
find /path/to/search/directory -exec grep -Hn "pattern" {} \;
```

### Compile all gettext source files
```sh
find ./i18n -name "*.po" | while read f; do msgfmt $f -o ${f%.po}.mo; done
```

### Summarize total storage used by files obtained by a find command
```sh
find /path/to/archive/?/??/??? -mtime -7 -name "*.pdf" | xargs stat -c "%s"| awk '{sum +=$1}END{printf("%0.0f\n",sum)}'|sed -r ':Label;s=\b([0-9]+)([0-9]{3})\b=\1,\2=g;t Label'
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find . -name "*.pdf" -exec pdftk {} dump_data output \; | grep NumberOfPages | awk '{print $1,$2}'
```

### Display PHP files that directly instantiate a given class
```sh
find . -name "*.php" -exec grep \-H "new filter_" {} \;
```

### Show sorted list of files with sizes more than 1MB in the current dir
```sh
find . -maxdepth 1 -type f -size +1M -printf "%f:%s\n" | sort -t":" -k2
```

### Count and show duplicate file names
```sh
find . -type f  |sed "s#.*/##g" |sort |uniq -c -d
```

### Find logs modified in the last 15 minutes
```sh
find /var/log -wholename "*.log" -mmin -15
```

### touch every file in current folder and subfolder
```sh
find . -type f -exec touch "{}" \;
```

### Search for a string in all files recursively
```sh
find . -type f | xargs grep <keyword>
```

### List only directories, one per line
```sh
find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n"
```

### Search for classes in Java JAR files.
```sh
find . -name "*.jar" | while read line; do echo "### $line "; unzip -l $line; done | grep "^###\|you-string" |less
```

### Find the files that contain a certain term
```sh
find /path/to/dir -type f -exec grep \-H "search term" {} \;
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find-duplicates () { find "$@" -not -empty -type f -printf "%s\0" | sort -rnz | uniq -dz | xargs -0 -I{} -n1 find "$@" -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 all-repeated=separate; }
```

### find file(s) on disk
```sh
find / -name 'tofind.sh' 2>/dev/null
```

### find . -name "*.txt" | xargs sed -i "s/old/new/"
```sh
find . -name "*.txt" | xargs sed -i "s/old/new/"
```

### list with full path
```sh
find $(pwd) -maxdepth 1 -name "*" -printf "%p\n"
```

### Identify Movies and TV Series using find and regex
```sh
find . -type f -regextype posix-extended -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$'
```

### Find Movies but NOT TV Series using find and regex
```sh
find . -type f -regextype posix-extended ! -regex '^.*[S|s|\.| ]{0,1}[0-9]{1,2}[e|x][0-9][0-9].*\.(avi|mkv|srt)$' \( -iname "*.mkv" -or -iname "*.avi"-or -iname "*.srt" \)
```

### Extract every parted-files which had the same password
```sh
find . -name '*.part1.rar' -exec unrar e \{\} -pPASSWORD \;
```

### list unique file extensions recursively for a path, include extension frequency stats
```sh
find /some/path -type f -and -printf "%f\n" | egrep -io '\.[^.]*$' | sort | uniq -c | sort -rn
```

### in current directory delete all files with ending
```sh
find . -name "*.bak" -type f -delete
```

### change current directory permissions and only sub-directories recursively (not files)
```sh
find . -type d -exec chmod XXXX {} \;
```

### add a particular track to a playlist by looking for a part of its file name
```sh
find `pwd` -iname *SEARCH_STRING* >> ~/PLAYLIST_NAME.m3u
```

### Print duplicate files
```sh
find . -type f -print0 | xargs -0 -n1 md5sum | sort -k 1,32 | uniq -w 32 -d all-repeated=separate | sed -e 's/^[0-9a-f]*\ *//;'
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {} {}.bak \;
```

### Parallel recursive convert files to other format and move them in another directory
```sh
find $(pwd) -type f -not -path '*/\.*' -iname '*.tif' -print0| xargs -0 -n1 -P4 -I{} bash -c 'X="{}"; Y=${X##*/}; convert "$X" -resize 1920x1080 -density 72" newpath/${Y%.*}.jpg"'
```

### File count into directories
```sh
find / -type d | while read i; do ls $i | wc -l | tr -d \\n; echo " -> $i"; done | sort -n
```

### list all files modified in the last 24 hours descending from current directory
```sh
find . -type f -mtime -1 \! -type d -exec ls -l {} \;
```

### Pretty print all of the Linux vm sysctls for your viewing pleasure
```sh
find /proc/sys/vm -maxdepth 1 -type f | while read i ; do printf "%-35s\t%s\n" "$i" "$(<$i)" ; done | sort -t/ -k4
```

### find and delete files smaller than specific size
```sh
find . -type f -size -80k -print0|xargs -0 rm
```

### Recursively backup files
```sh
find /var/www/ -name file -exec cp {}{,.bak} \;
```

### Count the number of lines of code, returns total
```sh
find . \( -iname '*.cpp' -o -iname '*.h' \) -exec wc -l {} \; | sort -n | cut delimiter=.  -f 1 | awk '{s+=$1} END {print s}'
```

### Archive every file in /var/logs
```sh
find /var/logs -name * | xargs tar -jcpf logs_`date +%Y-%m-%e`.tar.bz2
```

### Count files created by date/modification
```sh
find . -type f -exec stat \{\} \; | grep Modify: | awk '{a[$2]++}END{for(i in a){print i " : " a[i] }}' | sort
```

### Find corrupted jpeg image files
```sh
find . -iname '*jpg' -print0  | xargs -0 exiftool -warning; find . -iname '*jpg' -print0  | xargs -0 jpeginfo -c
```

### list all file extensions in a directory
```sh
find . -type f | awk -F'.' '{print $NF}' | sort| uniq -c | sort -g
```

### remove all CVS directories
```sh
find . -type d -name 'CVS' -exec rm -r {} \;
```

### Recursive find and replace in h an cpp files
```sh
find . -name "*.h" -o -name "*.cpp" | xargs sed -i 's/addVertexes/addVertices/g'
```

### Compile all .less files to .css
```sh
find *.less | xargs -I {} lessc {} {}.css && ls *.less.css | sed -e 'p;s/less.css/css/' | xargs -n2 mv
```

### gzip only that files that are not gzipped and are not open by any process
```sh
find -type f ! -name "*.gz" ! -exec fuser -s {} ';' -exec gzip {} \;
```

### Find all files in path2 that do not have a symbolic link in path1 or any of its subdirectories
```sh
find /path1 -type l -exec readlink -f {} \;  > links.txt && find /path2 -type f > files.txt && grep -Fxv -f links.txt files.txt
```

### Sum file sizes of found files
```sh
find . -mtime +30 -exec ls -all "{}" \; | awk '{COUNTER+=$5} END {SIZE=COUNTER/1024/1024; print "size sum of found files is: " SIZE "MB"}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -not -empty -printf "%-25s%p\n"|sort -n|uniq -D -w25|cut -b26-|xargs -d"\n" -n1 md5sum|sed "s/  /\x0/"|uniq -D -w32|awk -F"\0" 'BEGIN{l="";}{if(l!=$1||l==""){printf "\n%s\0",$1}printf "\0%s",$2;l=$1}END{printf "\n"}'|sed "/^$/d"
```

### Find the source file which contains most number of lines in your workspace
```sh
find -name "*.<suffix>" -exec wc -l "{}" \; | sort -n | tail
```

### Simple find
```sh
find / -name '*android*' 2>errors.txt
```

### Find and rename
```sh
find . -name "booyah" -exec rename booyah booyah.disabled {} \;
```

### find and copy any format of file
```sh
find /directory/of/search -name "*.png" type -f -exec cp '{}' /path/to/copy/ ';'
```

### How to delete all the archive files with extension *.tar.gz and greater than 10MB?
```sh
find / -type f -name *.tar.gz -size +10M -exec ls -l {} \;
```

### deleter
```sh
find . ! -size 0c -mtime +1 -type f -delete
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec ls -shS {} + | head -10
```

### How to archive all the files that are not modified in the last x number of days?
```sh
find /protocollo/paflow -type f -mtime +5 | xargs tar -cvf /var/dump-protocollo/`date '+%d%m%Y'_archive.tar`
```

### Permissions change on all files in current directory
```sh
find . -type f -exec chmod 644 {} \;
```

### Rekursive Grep on Solaris or AIX Systems without GNU egrep -r funcionality
```sh
find . -type f -exec awk '/linux/ { printf "%s %s: %s\n",FILENAME,NR,$0; }' {} \;
```

### rename all dirs with "?" char in name
```sh
find . -type d -name "*\?*" | while read f;do mv "$f" "${f//[^0-9A-Za-z.\/\(\)\ ]/_}";done
```

### Find supported dependency manager manifests
```sh
find /srv/code -maxdepth 4 -type f -regex ".*\(\(package\|composer|npm\\|bower\)\.json\|Gemfile\|requirements\.txt\\|\.gitmodules\)"
```

### Move items from subdirectories to current directory
```sh
find -type f -exec mv {} . \;
```

### rsync + find
```sh
find . -name "whatever.*" -print0 | rsync -av files-from=- from0 ./ ./destination/
```

### Change permissions for all files in the current directory
```sh
find ./ -type f | xargs sudo chmod 644
```

### deleter
```sh
find -type f -size +0 -mtime +1 -print0|xargs -0r rm -f
```

### Change permission for all directories inside the current one
```sh
find site/ -type d | xargs sudo chmod 755
```

### Remove UTF-8 Byte Order Mark BOM
```sh
find . -type f -regex '.*html$' -exec sed -i 's/\xEF\xBB\xBF//' '{}' \;
```

### Recursively remove "node_modules" directories
```sh
find . -name "node_modules" -exec rm -rf '{}' \;
```

### Create a tar archive with cpio containing a set of files
```sh
find path -name '*' -type f | cpio -ov -H ustar -F txtarchive.tar
```

### Size for all directories inside the current one
```sh
find . -type d -maxdepth 1 | xargs du -sh
```

### find only current directory (universal)
```sh
find /some/directory/* -prune -type f -name *.log
```

### find files that have been modified recently
```sh
find /target_directory -type f -mmin -60 mindepth 2
```

### can look for large files taking up disk spaces using the cmd
```sh
find / -type f -size +500M 2>/dev/null | xargs du -h | sort -nr
```

### replace old htaccess php AddHandler values with new one
```sh
find /var/www/ -type f -name ".htaccess" -exec perl -pi -e 's/AddHandler[\s]*php(4|5)-cgi/AddHandler x-httpd-php\1/' {} \;
```

### Make a statistic about the lines of code
```sh
find . -name \*.c | xargs wc -l | tail -1 | awk '{print $1}'
```

### Create a tar archive with pax containing a set of files
```sh
find path -name '*' -type f  | pax -wd > txtarchive.tar
```

### find command usage
```sh
find /pentest/ -type f -iname "*trace*"
```

### Create a zip file ignoring .svn files
```sh
find . -not \( -name .svn -prune \) -type f | xargs zip XXXXX.zip
```

### find usage
```sh
find /etc/ /pentest/ -type f -iname "*sql*" | grep map
```

### Find files modified in the last N days; list sorted by time
```sh
find . -type f -mtime -14 -exec ls -ltd \{\} \; | less
```

### copying data with cpio
```sh
find  ./source  -depth -print | cpio -cvo> /destination/source_data.cpio; cd /destination; cpio -icvmdI ./source_data.cpio; rm -rf ./source_data.cpio
```

### Search entire web server for preg_replace /e based php malware.
```sh
find / -name \*.php -exec grep -Hn preg_replace {} \;|grep /e|grep POST
```

### Lower jpg quality
```sh
find -type f -name '*.jpg' -exec mogrify -quality 70% '{}' \;
```

### find all file larger than 500M
```sh
find / -type f -size +548576 -printf "%s:%h%f\n"
```

### Generate SHA1 hash for each file in a list
```sh
find . -regex ".*\(avi\|mp4\|wmv\)$" -print0 | xargs -0 sha1sum
```

### Search entire server for Q4 2015 obfuscated PHP malware of unknown origin.
```sh
find / -name \*.php -exec grep -Hn .1.=.......0.=.......3.=.......2.=.......5.= {} \;
```

### Recursively change permissions on directories, leave files alone.
```sh
find /var/www/ -type f -print0 | xargs -0 chmod 644
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
find /backup/directory -name "FILENAME_*" -mtime +15 -exec rm -vf {} +
```

### List and delete files older than one year
```sh
find <directory path> -mtime +365 -and -not -type d -delete
```

### Convert .wma files to .ogg with ffmpeg
```sh
find -name '*wma' -exec ffmpeg -i {} -acodec vorbis -ab 128k {}.ogg \;
```

### Find recursively, from current directory down, files and directories whose names contain single or multiple whitespaces and replace each such occurrence with a single underscore.
```sh
find  ./  -name '*'  -exec  rename  's/\s+/_/g'  {}  \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -exec du -sh {} + | sort -hr | head
```

### find . -name "*" -print | xargs grep -s pattern
```sh
find . -name "*" -print | xargs grep -s pattern
```

### Recursively unzip archives to their respective folder
```sh
find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
```

### Remove all directories less than 1 MB in size in or below current directory
```sh
find . -type d -execdir du -sh '{}' ';' | grep -E "[0-9]+K" | sed 's/^[0-9\.]\+K[\t ]\+//' | tr "\n" "\0" | xargs -0 rm -rf
```

### show how much diskspace all images in a given directory need
```sh
find /home/bubo/ -type f \( -iname \*.jpg  -print0 , -iname \*.png  -print0 , -iname \*gif -print0 \)  |  du -cm  files0-from - | tail -1
```

### find specified directory and delete it recursively including directories with spaces
```sh
find . -name "directory_name" -type d -print0 | xargs -0 -i rm -rf {}
```

### find . -type f -exec grep -ils stringtofind {} +
```sh
find . -type f -exec grep -ils stringtofind {} +
```

### Recursively delete all files of a specific extension
```sh
find . -name "*.bak" -type f -delete
```

### find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```sh
find . \( -name \*.cgi -o -name \*.txt -o -name \*.htm -o -name \*.html -o -name \*.shtml \) -print | xargs grep -s pattern
```

### Uses ffmpeg to convert all that annoying .FLAC files to MP3 files keeping all the Artist's information in them.
```sh
find . -name "*.flac" -exec ffmpeg -i {} -ab 160k -map_metadata 0 -id3v2_version 3 {}.mp3 \;
```

### grep selectively
```sh
find /path -name \*.php -user nobody -exec grep -nH whatever {} \;
```

### List files and sizes
```sh
find / -type f -exec wc -c {} \; | sort -nr | head -100
```

### Recursively change permissions on files, leave directories alone.
```sh
find ./ -type f -exec chmod 644 {} +
```

### find pictures and renames them appending the containing folder name
```sh
find <folder> -type f -name '*.jpg' -exec bash -c 'ext="${0##*.}";path="$(dirname "$0")";name="$(basename "$0"|sed "s/.jpg//")";folder="$(dirname "$0"|tr / \\n |tail -1)";new="${path}/${name}_${folder}.${ext}"; mv "$0" "${new}"' {} \;
```

### Delete Empty Files
```sh
find . -size 0c -print -exec rm -f {} \;
```

### Counting the source code's line numbers C/C++ Java
```sh
find /usr/include/ -name '*.[c|h]pp' -o -name '*.[ch]' -print0 | xargs -0  wc -l | tail -1
```

### Print bitrate of each audio file
```sh
find . -print0 | xargs -0 -I{} ffmpeg -i "{}" 2>&1 | grep "kb\/s\|Input"
```

### Search and install true type fonts under user home directory
```sh
find ~ -name "*.ttf" -exec cp {} /usr/share/fonts/truetype \; & fc-cache -f
```

### Find every directory with too many files and subdirectory.
```sh
find / -xdev -printf '%h\n' | sort | uniq -c | sort -k 1 -n
```

### Converts Character Set of Files in a Folder
```sh
find . -iregex ".+\.\(c\|cpp\|h\)" | xargs -I{} perl -e "system(\"iconv -f SHIFT_JIS -t UTF-8 {} > temp; mv temp {} \");"  ;
```

### Check for orphaned python files
```sh
find /usr/lib/python* -regextype posix-extended ! \( -type f -regex '.*.(pyc|pyo)' -prune -o -print \) | qfile -o -f -
```

### Find and replace text within all files within a directory
```sh
find . | xargs perl -p -i.bak -e 's/oldString/newString/;'
```

### Batch rename and number files
```sh
find . -name '*.jpg' | awk 'BEGIN{ a=0 }{ printf "mv %s name%01d.jpg\n", $0, a++ }' | bash
```

### Listing all your bundles Entities files to issue a doctrine:generate:entities
```sh
find ./src -type d -name "Entity" | xargs ls -A | cut -d . -f1 | sed 's_^_app/console doctrine:generate:entities YourOwnBundleName:_'
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -print0 | xargs -0 rm
```

### Remove all zero size files from current directory (not recursive)
```sh
find . -maxdepth 1 -size 0c -delete
```

### Find all files larger than 500M and less than 1GB
```sh
find / -type f -size +500M -size -1G
```

### list files not owned by any user or group
```sh
find / -nouser -o -nogroup -print
```

### Count occurrences of a word/token in a file
```sh
find . -name file.txt | xargs -e grep "token" -o | wc -l
```

### Erase empty files
```sh
find . -size 0 -exec rm '{}' \;
```

### Check if zip files from current directory are good
```sh
find . -maxdepth 1  -name "*.zip" -exec unzip -tqq {} \;
```

### How to exclude all "permission denied" messages from "find"
```sh
find <paths> ! -readable -prune -o <other conditions like -name> -print
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find -not -empty -type f -printf "%s\n" | sort | uniq -d | parallel find -type f -size {}c | parallel md5sum | sort | uniq -w32 all-repeated=separate
```

### List cassandra snapshots by date
```sh
find /var/lib/cassandra/data -depth -type d -iwholename "*/snapshots/*" -printf "%Ty-%Tm-%Td  %p\n" | sort
```

### Use a variable in a find command.  Useful in scripting.
```sh
find . -iname \*${MYVAR}\* -print
```

### find potentially malicious PHP commands used in backdoors and aliked scripts
```sh
find ./public_html/ -name \*.php -exec grep -HRnDskip "\(passthru\|shell_exec\|system\|phpinfo\|base64_decode\|chmod\|mkdir\|fopen\|fclose\|readfile\) *(" {} \;
```

### Use a variable in a find command.  Useful in scripting.
```sh
find "$1" -iname "*$2*"
```

### remove files of a specific size
```sh
find . -size 1400c -exec rm {} \;
```

### Make a playlistfile for mpg321 or other CLI player
```sh
find /DirectoryWhereMyMp3sAre/ -name *.mp3 | grep "andy" > ~/mylist
```

### get newest file in current directory
```sh
find . -maxdepth 1 -printf '%A@\t%p\n' | sort -r | cut -f 2,2 | head -1
```

### List used Perl libraries in Perl project
```sh
find . -type f \( -name '*.pm' -o -name '*.pl' \) | xargs grep "^use " | cut -d : -f2 | sort | uniq
```

### recursively change file name extensions
```sh
find . -type f -name \*.c | while read f; do mv $f "`basename $f .c`".C; done
```

### Graphical tree of sub-directories
```sh
find . -type d |sed 's:[^-][^/]*/::g; s:^-: |:'
```

### show 20 last modified files in current directory including subdirectories
```sh
find . -type f -printf "%T@ %Tc %p\n" |sort -n |cut -d' ' -f2- |tail -n20
```

### get md5sum for all files, skipping svn directories
```sh
find $1 -not -iwholename "*.svn*" -type f | xargs md5sum | awk '{print $2 "\t" $1}'
```

### Count files by extension
```sh
find . -type f | sed -n 's/..*\.//p' | sort -f | uniq -ic
```

### Recreate md5 checksum files for files in folder and subfolders
```sh
find . -type f \! -name "*.md5" -exec sh -c 'md5sum "$1" > $1.md5'  {} \;
```

### bzip2 all files in a directory older than 1 week (nicely)
```sh
find /logdir -type f -mtime +7 -print0 | xargs -0 -n 1 nice -n 20 bzip2 -9
```

### Parallel copy - Faster copy
```sh
find Files/ -type d  | parallel  'mkdir -p /BKP/{}' && find Files/ -type f  | parallel 'rsync -a {} MKD/$(dirname {})'
```

### Search recursively to find a word or phrase in certain file types, such as C code
```sh
find . -name "*.[ch]" -exec grep -i /dev/null "search pharse" {} \;
```

### Recursively grep thorugh directory for string in file.
```sh
find directory/ -exec grep -ni phrase {} +
```

### Find directory by name
```sh
find . -type d -name '.svn' -ls
```

### Find files with size over 100MB and output with better lay-out
```sh
find ./ -type f -size +100000k -exec ls -lh {} \; 2>/dev/null| awk '{ print $8 " : " $5}'
```

### List empty directories only in present level
```sh
find ./ -maxdepth 1 -empty -type d -print
```

### Show sizes and calculate sum of all files found by find
```sh
find -name *.bak -print0 | du -hc files0-from=-
```

### I use this find command example to find out all the executable files
```sh
find . -perm 777 ?print
```

### Find pictures excepting a path
```sh
find . \( -not -path "./boost*" \) -type f \( -name "*.jpg" -or -name "*.png" -or -name "*.jpeg" \)  2>/dev/null
```

### Count total running time for all media files in your directory
```sh
find -type f -exec ffprobe -i "{}" -show_entries format=duration -v quiet -of csv="p=0" \; | paste -sd+ | bc
```

### Calculate the size in MB of all files of a certain extension
```sh
find . -type f -iname '*.msh' -exec ls -lG {} \; | awk '{total = total + $4}END{print "scale=2;" total "/2^20"}' | bc
```

### Find all FAT-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>|\+|\[|\])"
```

### List recursively only empty folders on present dir
```sh
find ./ -empty -type d -print
```

### Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
```sh
find . -name *js -type f | xargs yardstick | sort -k6 -n
```

### Find all NTFS-invalid filenames in "."
```sh
find . | grep -E "(\||\\|\?|\*|<|\"|:|>)"
```

### Find lines of code (LOC) of a filetype in a project.
```sh
find . -type f -name "*.py" -exec wc -l {} \; | awk '{ SUM += $1} END {print SUM }'
```

### Find all e-mails older than 7 days in the queue and delete them
```sh
find /var/spool/mqueue -type f -mtime +7 | perl -lne unlink
```

### Delete all files in a folder that don't match a certain file extension
```sh
find . -type f ! -name "*.foo" -name "*.bar" -delete
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -name "*.sh" -exec chmod u+x {} \;
```

### Add executable bit to all shell scripts under current directory recursively.
```sh
find . -type f -exec file '{}' + | grep shell | awk -F':' '{print $1}' | xargs chmod u+x
```

### count all the lines of code in a directory recursively
```sh
find . -name '*.php' | xargs wc -l
```

### exec chmod to subfiles
```sh
find . -type f -exec chmod a-x {} \;
```

### mv argument list too long
```sh
find $_SOURCE -type f -name '*' -exec mv {}  $_DESTINATION \;
```

### displays comments from random jpeg files.
```sh
find ~/random_jpegs/folder -name "*.jpg" -exec rdjpgcom {} \;
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find ./ -type f -exec sh -c 'echo "{}" "$(dirname "{}")/$(basename "{}" | tr "[A-Z]" "[a-z]")"' \;
```

### find and delete empty dirs, start in current working dir
```sh
find . -type d -empty -delete
```

### Optimal way of deleting huge numbers of files
```sh
find /path/to/dir -type f -delete
```

### Get the total length of all video / audio in the current dir (and below) in H:m:s
```sh
find -type f -name "*.avi" -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### find the biggest files recursively, no matter how many
```sh
find . -type f -printf '%20s %p\n' | sort -n | cut -b22- | tr '\n' '\000' | xargs -0 ls -laSr
```

### Busca archivos por el tipo de extension y los elimina.
```sh
find / -iname *.jpg exec rm -rf {} \;
```

### command for converting wav files to mp3
```sh
find . -iname "*wav" > step1 ; sed -e 's/\(^.*\)wav/\"\1wav\" \"\1mp3\"/' step1 > step2 ; sed -e 's/^/lame  /' step2 > step3 ; chmod +x step3 ; ./step3
```

### Find broken symlinks and delete them
```sh
find . -xtype l -delete
```

### Finds javascript lodash/underscore methods in source code
```sh
find . -name "*.js" | xargs grep -oh '_\.[^(]*' | sort | uniq
```

### Find and remove files
```sh
find / -name core | xargs /bin/rm -f
```

### remove a directory filled with too many files
```sh
find /SOME/PATH -type f -execdir rm -f {} \+
```

### Count lines of code across multiple file types, sorted by least amount of code to greatest
```sh
find . \( -iname '*.[ch]' -o -iname '*.php' -o -iname '*.pl' \) | xargs wc -l | sort -n
```

### search in all cpp / hpp files using egrep
```sh
find . \( -name "*cpp" -o -name "*hpp" \) -exec grep -Hn -E "043[eE]|70[Dd]7" \{\} \;
```

### Make a folder and everything in it world-viewable
```sh
find . -exec chmod o+rx {}\;
```

### Create etags file of .c, .cpp, and .h files in all subdirectories
```sh
find . -regex ".*\.[cChH]\(pp\)?" -print | etags -
```

### find all symlinks to a file
```sh
find -L / -samefile path/to/foo.txt
```

### Converts all jpg files to 75 quality.
```sh
find . -type f -name '*.jpg' -exec convert -quality 75 {} {} \;
```

### A command to find and replace text within conf files in a single directory.
```sh
find -type f -name '*.conf' -exec sed -Ei 's/foo/bar/' '{}' \;
```

### Returns top ten (sub)directories with the highest number of files
```sh
find . -type d | while read dir ; do num=`ls -l $dir | grep '^-' | wc -l` ; echo "$num $dir" ; done | sort -rnk1 | head
```

### For files owned by root only, change ownership to a non-privileged user.
```sh
find /path/to/dir -user root -exec chown [nonprivuser] {} \;
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find $PWD -type d | while read "D"; do cd "$D"; for filename in *.epub;do ebook-convert "$filename" "${filename%.epub}.mobi" prefer-author-sort output-profile=kindle linearize-tables smarten-punctuation asciiize;done ;done
```

### find all symlinks to a file
```sh
find / -lname path/to/foo.txt
```

### List files containing given search string recursively
```sh
find /path/to/dir -type f -print0 | xargs -0 grep -l "foo"
```

### Delete all ".svn" directories from current path (recursive)
```sh
find . -name ".svn" -exec rm -rf {} \;
```

### Delete/Archive easily old mails using find.
```sh
find . -path ".*/cur/*" -type f ! -newermt "1 week ago" -delete
```

### find and replace tabs for spaces within files recursively
```sh
find ./ -type f -exec sed -i 's/\t/  /g' {} \;
```

### Find files and list them sorted by modification time
```sh
find . -type f -exec stat -f '%m %N' {} \; | sort -n
```

### print the first line of every file which is newer than a certain date and in the current directory
```sh
find . -type f -newer 201011151300.txt -exec head -1 {} \;
```

### rename files (in this case pdfs) numerically in date order
```sh
find . -name "*.pdf" -print0 | xargs -r0 stat -c %y\ %n | sort|awk '{print $4}'|gawk 'BEGIN{ a=1 }{ printf "mv %s %04d.pdf\n", $0, a++ }' | bash
```

### find something
```sh
find $SDIR -name '${f}.*' -mtime +$n -maxdepth 1 | xargs -n 10 rm -vf
```

### Get last changed revision to all eclipse projects in a SVN working copy
```sh
find . -iname ".project"| xargs -I {} dirname {} | LC_ALL=C xargs -I {} svn info {} | grep "Last Changed Rev\|Path" | sed "s/Last Changed Rev: /;/" | sed "s/Path: //" | sed '$!N;s/\n//'
```

### Recursive script to find all epubs in the current dir and subs, then convert to mobi using calibre's ebook-convert utility
```sh
find . -name '*.epub' -exec sh -c 'a={}; ebook-convert $a ${a%.epub}.mobi still more options' \;
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.jpg' -o -name '*.JPG' -print0 | xargs -0 mogrify -resize 1024">" -quality 40
```

### catch all the txt files into a start_dir tree and copy them into a single end_dir
```sh
find start_dir -name *.txt | xargs -J % cp % end_dir/
```

### set create time using file name for files pulled from android camera
```sh
find . -type f -exec echo -n "touch -t \`echo " \; -exec echo -n {} \; -exec echo -n " | sed -E 's/.*([[:digit:]]{8})_([[:digit:]]{4})([[:digit:]]{2}).*/\1\2.\3/g'\` " \; -exec echo {} \; | sh
```

### covert m4a audio files to wav
```sh
find . -name '*.m4a' | xargs -I audiofile mplayer -ao pcm "audiofile" -ao pcm:file="audiofile.wav"
```

### Remove all .svn folders
```sh
find . -name .svn -print0 | xargs -0 rm -rf
```

### Get the total size (in human readable form) of all certain file types from the current directory
```sh
find . -name 'pattern'| xargs du -hc
```

### Find directories in pwd, get disk usage, sort results
```sh
find . -type d -d 1 -print0 | xargs -0 du -sm | sort -nr
```

### find *.lock files and delete
```sh
find -name *.lock |xargs rm -f
```

### List 50 largest source files in a project
```sh
find . -type f -name '*.pm' -printf '%6s %p\n' | sort -nr | head -n 50
```

### Get the total length of all videos in the current dir in H:m:s
```sh
find -type f -iregex '.*\.\(mkv\|mp4\|wmv\|flv\|webm\|mov\|dat\|flv\)' -print0 | xargs -0  mplayer -vo dummy -ao dummy -identify 2>/dev/null | perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) && printf "%02d:%02d:%02d\n",$t/3600,$t/60%60,$t%60' | tail -n 1
```

### Resize images with mogrify with lots of options
```sh
find . -name '*.[Jj][Pp][Gg]' -exec mogrify -resize 1024">" -quality 40 {} \;
```

### Command to rename multiple file in one go
```sh
find / -name "*.xls" -print0 | xargs -0  rename .xls .ods {}
```

### Count the number of pages of all PDFs in current directory and all subdirs, recursively
```sh
find -iname "*.pdf" -exec pdfinfo -meta {} \;|awk '{if($1=="Pages:"){s+=$2}}END{print s}'
```

### Remove hidden CVS merge helper files
```sh
find . -name ".#*" -exec rm {} \;
```

### Recursively find top 20 largest files (> 1MB) sort human readable format
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -20
```

### dos2unix recursively
```sh
find . -type f -exec dos2unix {} +
```

### Find Files over 20Meg
```sh
find . -type f -size +20000k -print0 | xargs -0 du -h | awk -F"\t" '{printf "%s : %s\n", $2, $1}'
```

### Find Duplicate Files (based on size first, then MD5 hash)
```sh
find . -type f -size +0 -printf "%-25s%p\n" | sort -n | uniq -D -w 25 | sed 's/^\w* *\(.*\)/md5sum "\1"/' | sh | sort | uniq -w32 all-repeated=separate
```

### Remove CVS root files under current directory
```sh
find . -name Root -print | xargs rm -f
```

### Find UTF-8 text files misinterpreted as ISO 8859-1 due to Byte Order Mark (BOM) of the Unicode Standard.
```sh
find -type f |while read a;do [ "`head -c3  "${a}"`" == $'\xef\xbb\xbf' ] && echo "Match: ${a}";done
```

### Recursively sort files by modification time through multiple directories.
```sh
find /test -type f -printf "%AY%Aj%AH%AM%AS-%h/%f\n" | sort -n
```

### Remove all node_module folders recursively
```sh
find . -name "node_modules" -type d -prune -exec rm -rf '{}' +
```

### Indent all the files in a project using emacs
```sh
find . -iname \*.c -or -iname \*.h -exec emacs -nw -q {} eval "(progn (mark-whole-buffer) (indent-region (point-min) (point-max) nil) (save-buffer))" kill \;
```

### Convert all the png files in a directory to gif in parallel. Requires imagemagick.
```sh
find . -name "*.png" | xargs -I '{}' -P 4 mogrify -format gif '{}'
```

### Display directory hierarchy listing as a tree
```sh
find . -printf '%p\n' | perl -ne 'if( m/(.*)\/(.*)/ ) { $p = $1; $f = $2; $p =~ s/[^\/]/ /g; $p =~ s/\//|/g; print "$p/$f\n"; } elsif( m/(.*)/ ) { print "$1\n"; } else { print "error interpreting: \"$_\"\n"; }'
```

### Search and replace multiple files with substitution
```sh
find . -name "*.txt" | xargs -n 1 perl -pi -w -e "s/text([0-9])/other\$1/g;"
```

### Sum file sizes
```sh
find . -type f -printf %s\\n | paste -sd+ | bc
```

### List all text files (exclude binary files)
```sh
find -type f | xargs file | grep ".*: .* text" | sed "s;\(.*\): .* text.*;\1;"
```

### Recursive chmod all *.sh files within the current directory
```sh
find ./ -name "*.sh" -exec chmod +x {} \;
```

### use the find command and have it not print trailing slashes
```sh
find * -maxdepth 0 -type d
```

### Find Duplicate Files (based on size, name, and md5sum)
```sh
find -type f -printf '%20s\t%100f\t%p\n' | sort -n | uniq -Dw121 | awk -F'\t' '{print $3}' | xargs -d '\n' md5sum | uniq -Dw32 | cut -b 35- | xargs -d '\n' ls -lU
```

### Search recursively to find a word in certain file types
```sh
find . -iname '*.conf' | xargs grep "searh string" -sl
```

### Add a newline to the end of a cpp file
```sh
find . -iname "*.cpp" -exec perl -ni -e 'chomp; print "$_\n"' {} \;
```

### Recursively remove all files in a CVS directory
```sh
find . -type f ! -path \*CVS\* -exec rm {} \; -exec cvs remove {} \;
```

### Find and delete thunderbird's msf files to make your profile work quickly again.
```sh
find ~/.thunderbird/*.default/ -name *.msf -delete
```

### Fix MP3 tags encoding (to UTF-8). Batch fixes all MP3s in one directory.
```sh
find . -iname "*.mp3" -execdir mid3iconv -e <encoding> {} \;
```

### Find and remove files older than 365 days
```sh
find ./ -type f -mtime +365 -exec rm -f {} \;
```

### Recursively unrar into dir containing archive
```sh
find . -name '*.rar' -execdir unrar e {} \;
```

### Recursively remove all empty directories
```sh
find . -empty -type d -print0 | xargs -0 rmdir -p
```

### Recursive convert all print statements in py files from python2 to python3 form
```sh
find . -iname "*.py" -type f -print0 | xargs -0 sed -i 's/^\([ \t]*\)print \(.*\)$/\1print(\2)/g'
```

### recursively change file name from uppercase to lowercase (or viceversa)
```sh
find . -type f|while read f; do mv $f `echo $f |tr '[:upper:]' '[ :lower:]'`; done
```

### Sort file greater than a specified size  in human readeable format including their path and typed by color, running from current directory
```sh
find ./ -size +10M -type f -print0 | xargs -0 ls -Ssh1 color
```

### Keep from having to adjust your volume constantly
```sh
find . -iname \*.mp3 -print0 | xargs -0 mp3gain -krd 6 && vorbisgain -rfs .
```

### Convert the contents of a directory listing into a colon-separated environment variable
```sh
find . -name '*.jar' -printf '%f:'
```

### Backup files older than 1 day on /home/dir, gzip them, moving old file to a dated file.
```sh
find /home/dir -mtime +1 -print -exec gzip -9 {} \; -exec mv {}.gz {}_`date +%F`.gz \;
```

### Find biggest 10 files in current and subdirectories and sort by file size
```sh
find . -type f -print0 | xargs -0 du -h | sort -hr | head -10
```

### Find all symlinks that link to directories
```sh
find -type l -xtype d
```
