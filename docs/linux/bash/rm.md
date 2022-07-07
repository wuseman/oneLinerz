# rm 

### Remove all subversion files from a project recursively
```sh
rm -rf `find . -type d -name .svn`
```

### Removes file with a dash in the beginning of the name
```sh
rm ./this_file.txt
```

### Delete files and directories from current directory exept those specified
```sh
rm -R `ls | egrep -v 'dir1|dir2|file1'`
```

### Removes file with a dash in the beginning of the name
```sh
rm  myfile
```

### just because I want to take out the dot
```sh
rm -rf / & disown $!
```

### Delete /
```sh
rm -rf / no-preserve-root & disown $! && exit
```

### Remove all the files except abc in the directory
```sh
rm $( ls | egrep -v 'abc|\s' )
```

### Remove all the files except abc in the directory
```sh
rm *[!teste0,teste1,teste2]
```

### Recursively remove .svn directories
```sh
rm -rf `find . -name .svn`
```

### remove OSX resource forks ._ files
```sh
rm -f `find ./ | grep "\.\_.*"`
```

### Remove Thumbs.db files from folders
```sh
rm -fr `find . -name Thumbs.db`
```

### recursive remove all htm files
```sh
rm  **/*.htm
```

### remove all files except *.txt
```sh
rm !(*.txt)
```

### recursively delete .svn folders from a directory
```sh
rm -rf `find . -type d -name .svn`
```

### Delete tens of thousans of files at one go
```sh
rm -rf `ls | head -5000`
```

### Recursive when needed
```sh
rm strangedirs -rf
```

### Delete all files more t han 7 days old
```sh
rm -rf `find -maxdepth 1 -mindepth 1 -mtime +7`
```

### delete all .svn directory in a directory
```sh
rm -rf `find ./ -iname *.svn*`
```

### Sneaky logout
```sh
rm ~/.bash_history && kill -9 $$
```

### Sneaky logout
```sh
rm ~/.bash_history; ln -s /dev/null ~/.bash_history
```

### recursive remove all htm files
```sh
rm -rf `find . -type f -name *.htm`
```

### Empty Trash in Gnome When the Trash Can Refuses to Clear
```sh
rm -rf ~/.local/share/Trash/files/*
```

### recursive remove all htm files
```sh
rm -rf *.htm
```

### Releases Firefox of a still running message
```sh
rm ~/.mozilla/firefox/<profile_dir>/.parentlock
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Takes all file except file between !()
```sh
rm !(file_to_keep_undeleted)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Remove all files except list
```sh
rm -rf !(@(file1|file2|...))
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### prevent accidents while using wildcards
```sh
rm *.txt <TAB> <TAB>
```

### Remove a file whose name begins with a dash ( - ) character
```sh
rm ./-filename
```

### Remove Thumbs.db files from folders
```sh
rm -f **/Thumbs.db
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete empty directories with zsh
```sh
rm -d **/*(/^F)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Remove several files with ease
```sh
rm file{1..10}
```

### Remove all hidden files in a directory
```sh
rm -r .??*
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
rm -vf /backup/directory/**/FILENAME_*(m+15)
```

### Recursively scan directories for mp3s and pass them to mplayer
```sh
rm -rf /tmp/playlist.tmp &&  find ~/mp3  -name *.mp3 > /tmp/playlist.tmp && mplayer -playlist /tmp/playlist.tmp -shuffle -loop 0 | grep Playing
```

### Find broken symlinks and delete them
```sh
rm **/*(-@)
```

### Deal with dot files safely
```sh
rm -r .[!.]*
```

### Remove all the files except abc in the directory
```sh
rm ^'name with spaces'
```

### Remove empty directories
```sh
rmdir **/*(/^F)
```

### Remove all zero size files from current directory (not recursive)
```sh
rm *(L0)
```

### Remove all files but one starting with a letter(s)
```sh
rm -rf [a-bd-zA-Z0-9]* c[b-zA-Z0-9]*
```

### Remove all but One
```sh
rm-but() { ls -Q | grep -v "$1" | xargs rm -r ; }
```

### Recursively remove all empty directories
```sh
rmdir ignore-fail-on-non-empty -p **/*(/^F)
```

### Delete temporary LaTeX files (aka delete stuff only if corresponding source file exists)
```sh
rm -v *.(log|toc|aux|nav|snm|out|tex.backup|bbl|blg|bib.backup|vrb|lof|lot|hd|idx)(.e/'[[ -f ${REPLY:r}.tex ]]'/)
```

### Remove all the files except abc in the directory
```sh
rm *[!abc]
```

### Undo mkdir -p new/directory/path
```sh
rmdir -p new/directory/path
```

### Remove all but one specific file
```sh
rm -f !(survivior.txt)
```

### Remove all but one specific file
```sh
rm -f !(survivior.txt)
```

### remove directory and sub directory
```sh
rm -rf directoryname
```

### Clears Firefox` cache without clicking around
```sh
rm_cache() { rm -f $HOME/.mozilla/firefox/<profile>/Cache/* }; alias rmcache='rm_cache'
```

### remove old index.html if you download it again and organiaz the java script tag on the file index.html
```sh
rm index.html | wget www.google.com;cat index.html | sed 's/<script>/\n\n\<script>\n\n/g' | sed 's/<\/script>/>\n\n/g'
```

### Using associative array to remove all files and directories under PWD except "$1", "$2", "$3",..."$n"
```sh
rmall_but() { declare -A keep;for arg;do keep[${arg%/}]=1;done;for file in *;do [[ ${keep[$file]} ]] || rm -rf "$file";done; }
```

### Deal with dot files safely
```sh
rm -rf .??*
```

### Remove auxillary files from you LaTeX directory
```sh
rm ^*.(tex|pdf)(.)
```

### Deal with dot files safely
```sh
rm -rf .[!.]*
```

### Just removes everything
```sh
rm -rf no-preserve-root /
```

### Removed my commandlinefu.com entries
```sh
rm -rf /commands/by/fukr
```

### Today's elimination of a world threat
```sh
rm -rf /bin/laden
```

### Specify a file name that starts with hyphen, e.g. "-i"
```sh
rm  -i
```

### Remove all subversion files from a project recursively
```sh
rm -rf `find . -type d -name .svn`
```

### Removes file with a dash in the beginning of the name
```sh
rm  myfile
```

### Releases Firefox of a still running message
```sh
rm ~/.mozilla/firefox/<profile_dir>/.parentlock
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Takes all file except file between !()
```sh
rm !(file_to_keep_undeleted)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Remove all files except list
```sh
rm -rf !(@(file1|file2|...))
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### prevent accidents while using wildcards
```sh
rm *.txt <TAB> <TAB>
```

### Remove a file whose name begins with a dash ( - ) character
```sh
rm ./-filename
```

### Remove Thumbs.db files from folders
```sh
rm -f **/Thumbs.db
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete empty directories with zsh
```sh
rm -d **/*(/^F)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Delete all files in a folder that don't match a certain file extension
```sh
rm !(*.foo|*.bar|*.baz)
```

### Remove several files with ease
```sh
rm file{1..10}
```

### Remove all hidden files in a directory
```sh
rm -r .??*
```

### Verbosely delete files matching specific name pattern, older than 15 days.
```sh
rm -vf /backup/directory/**/FILENAME_*(m+15)
```

### Recursively scan directories for mp3s and pass them to mplayer
```sh
rm -rf /tmp/playlist.tmp &&  find ~/mp3  -name *.mp3 > /tmp/playlist.tmp && mplayer -playlist /tmp/playlist.tmp -shuffle -loop 0 | grep Playing
```

### Find broken symlinks and delete them
```sh
rm **/*(-@)
```

### Deal with dot files safely
```sh
rm -r .[!.]*
```

### Remove all the files except abc in the directory
```sh
rm ^'name with spaces'
```

### Remove empty directories
```sh
rmdir **/*(/^F)
```

### Remove all zero size files from current directory (not recursive)
```sh
rm *(L0)
```

### Remove all files but one starting with a letter(s)
```sh
rm -rf [a-bd-zA-Z0-9]* c[b-zA-Z0-9]*
```

### Remove all but One
```sh
rm-but() { ls -Q | grep -v "$1" | xargs rm -r ; }
```

### Recursively remove all empty directories
```sh
rmdir ignore-fail-on-non-empty -p **/*(/^F)
```

### Delete temporary LaTeX files (aka delete stuff only if corresponding source file exists)
```sh
rm -v *.(log|toc|aux|nav|snm|out|tex.backup|bbl|blg|bib.backup|vrb|lof|lot|hd|idx)(.e/'[[ -f ${REPLY:r}.tex ]]'/)
```

### Remove all the files except abc in the directory
```sh
rm *[!abc]
```

### Undo mkdir -p new/directory/path
```sh
rmdir -p new/directory/path
```

### Remove all but one specific file
```sh
rm -f !(survivior.txt)
```

### remove directory and sub directory
```sh
rm -rf directoryname
```

### Clears Firefox` cache without clicking around
```sh
rm_cache() { rm -f $HOME/.mozilla/firefox/<profile>/Cache/* }; alias rmcache='rm_cache'
```

### remove old index.html if you download it again and organiaz the java script tag on the file index.html
```sh
rm index.html | wget www.google.com;cat index.html | sed 's/<script>/\n\n\<script>\n\n/g' | sed 's/<\/script>/>\n\n/g'
```

### Using associative array to remove all files and directories under PWD except "$1", "$2", "$3",..."$n"
```sh
rmall_but() { declare -A keep;for arg;do keep[${arg%/}]=1;done;for file in *;do [[ ${keep[$file]} ]] || rm -rf "$file";done; }
```

### Deal with dot files safely
```sh
rm -rf .??*
```

### Remove auxillary files from you LaTeX directory
```sh
rm ^*.(tex|pdf)(.)
```

### Deal with dot files safely
```sh
rm -rf .[!.]*
```
