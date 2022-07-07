# rename

### Remove all Parentheses from file/folder names
```sh
rename '(' '' *```sh
rename ')' '' *
```

### Rename all spaces to underscore

```sh
for file in *' '*; do 
    mv -- "$file" "${file// /_}";  
done                   
```

### Rename all files with spaces to underscore

```sh
for file in *;  do 
    mv -- "$file" "${file// /_}"; 
done                      
```

### Rename uppercase to lowercase

```sh
for i in * ; do 
    mv $i `echo $i | tr 'A-Z' 'a-z'`; 
done    
```

```sh                     
for i in $( ls | grep [A-Z] ); do 
    mv -i $i `echo $i | tr 'A-Z' 'a-z'`; 
done  
```
###  Rename all uppercase to lowercase
```sh
rename 'y/A-Z/a-z/' *                                                          
```

### Remove .sh file extension for files in current directory
```sh
rename 's/\.sh//' ./*
```

### remove all spaces from all files in current folder
```sh
rename 's/ //g' *
```
### renamed multiple file from .php to .html
```sh
rename s/ .php/ .html/ *.html
```
### Replace spaces in filenames with underscores
```sh
rename 's/ /_/g' *
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename *.JPG *.jpg
```
### Renames all files in the current directory such that the new file contains no space characters.
```sh
rename 's/ /_/g' *
```
### Batch file suffix renaming
```sh
rename -n "s/-.*//" *
```
### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
rename foo bar directory/filename
```
### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
rename foo bar filename
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename .txt .md *.txt
```
### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
rename 's/foo/bar/g' ./*
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename 's/.txt/.md/i' *
```
### convert single digit to double digits
```sh
rename 's/\d+/sprintf("%02d",$&)/e'  $@
```
### Replace space in filename
```sh
rename "s/ *//g" *.jpg
```
### Command to rename multiple file in one go
```sh
rename 's/.xls/.ods/g' *.xls
```
### convert filenames in current directory to lowercase
```sh
rename 'y/A-Z/a-z/' *
```
### Title Case Files
```sh
rename 's/\b((?!(a|of|that|to)\b)[a-z]+)/\u$1/g' *
```
### convert uppercase files to lowercase files
```sh
rename 'y/A-Z/a-z/' *
```
### Change the extension of a filename by using rename to convert
```sh
rename .JPG .jpg *.JPG
```
### replace strings in file names
```sh
rename 's/foo/bar/g' foobar
```
### Clean up poorly named TV shows.
```sh
rename -v 's/.*[s,S](\d{2}).*[e,E](\d{2}).*\.avi/SHOWNAME\ S$1E$2.avi/' poorly.named.file.s01e01.avi
```
### Yet Another Rename (bash function)
```sh
rename(){ 
    txtToReplace=${1} ; 
    replacementTxt=${2} ; 
    shift 2 ; 
    files=${@} ; 
    for file in $files ; do 
        mv ${file} ${file/${txtToReplace}/${replacementTxt}} ; 
    done 
}
```
### Convert spaces in file names to underscores
```sh
rename 'y/ /_/' *
```
### Rename all .jpeg and .JPG files to have .jpg extension
```sh
rename 's/\.jpe?g$/.jpg/i' *
```
### Replace spaces in a filename with hyphens
```sh
rename 's/ /-/g' *
```
### replace spaces in filenames with underscores
```sh
rename 'y/ /_/' *
```
### replace spaces in filenames with underscores
```sh
rename 'y/ /_/' *
```
### Copy/move a bunch of files to dot files and back
```sh
rename s/^/./ *
```
### Replace spaces in filenames with underscores
```sh
rename -v 's/ /_/g' *
```
### Rename all .jpeg and .JPG files to .jpg
```sh
rename 's/\.jpeg/\.jpg/' *.jpeg; rename 's/\.JPG/\.jpg/' *.JPG
```
### Rename files in batch
```sh
rename 's/^hospital\.php\?loc=(\d{4})$/hospital_$1/' hospital.php*
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename 's/\.txt$/\.md$/i' *
```
### Title Case Files
```sh
rename 's/(^|[\s\(\)\[\]_-])([a-z])/$1\u$2/g' *
```
### Title Case Files
```sh
rename 's/\b([a-z])/\u$1/g' *
```
### Add prefix onto filenames
```sh
rename 's/^/prefix/' *
```
### Tracklist reaplace backspace to '-'
```sh
rename 's/ /-/g' *.mp3
```
### Files extension change
```sh
rename .oldextension .newextension *.oldextension
```
### Numeric zero padding file rename
```sh
rename 's/\d+/sprintf("%04d",$&)/e' *.jpg
```
### Adding Prefix to File name
```sh
rename 's/^/PREFIX/g' *
```
### Adding Prefix to File name
```sh
rename 's/^/CS749__/' *.pdf
```
### renames multiple files that match the pattern
```sh
rename 's/foo/bar/g' *
```
### space to underscore across single directory
```sh
rename ' ' '_' *
```
### Replace all the spaces in all the filenames of the current directory and including directories with underscores.
```sh
rename "s/ /_/g" * .*
```
### Adding leading zeros to a filename (1.jpg -> 001.jpg)
```sh
    rename.ul "" 00 ?.jpg; rename "" 0 ??.jpg;
```
### Replace Space In Filenames With Underscore
```sh
rename 's/ /_/g' *
```
### Rename with regular expression and leading zeros
```sh
rename 's/result_([0-9]+)_([0-9]+)_([0-9]+)\.json\.txt/sprintf("%d%02d%02d.txt",$3,$2,$1)/ge' result_*.txt
```
### Rename with regular expression and leading zeros
```sh
rename 's/result_([0-9]+)_([0-9]+)_([0-9]+)\.json\.txt/sprintf("%d%02d%02d.txt",$3,$2,$1)/ge' result_*.txt
```
### convert uppercase files to lowercase files
```sh
rename -fc *
```
### Adds characters at the beginning of the name of a file
```sh
rename 's/.*/[it]$&/' *.pdf
```
### remove all spaces from all files in current folder
```sh
rename 's/ //g' *
```
### Replace spaces in filenames with underscores
```sh
rename 's/ /_/g' *
```
### Rename all files which contain the sub-string 'foo', replacing it with 'bar'
```sh
rename 's/foo/bar/g' ./*
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename 's/.txt/.md/i' *
```
### convert single digit to double digits
```sh
rename 's/\d+/sprintf("%02d",$&)/e'  $@
```
### Replace space in filename
```sh
rename "s/ *//g" *.jpg
```
### Command to rename multiple file in one go
```sh
rename 's/.xls/.ods/g' *.xls
```
### convert filenames in current directory to lowercase
```sh
rename 'y/A-Z/a-z/' *
```
### Title Case Files
```sh
rename 's/\b((?!(a|of|that|to)\b)[a-z]+)/\u$1/g' *
```
### convert uppercase files to lowercase files
```sh
rename 'y/A-Z/a-z/' *
```
### Change the extension of a filename by using rename to convert
```sh
rename .JPG .jpg *.JPG
```
### replace strings in file names
```sh
rename 's/foo/bar/g' foobar
```
### Clean up poorly named TV shows.
```sh
rename -v 's/.*[s,S](\d{2}).*[e,E](\d{2}).*\.avi/SHOWNAME\ S$1E$2.avi/' poorly.named.file.s01e01.avi
```
### Yet Another Rename (bash function)
```sh
rename(){ 
    txtToReplace=${1} ; replacementTxt=${2} ; shift 2 ; 
    files=${@} ; 
    for file in $files ; do 
        mv ${file} ${file/${txtToReplace}/${replacementTxt}} ; 
    done ; 
}
```
### Convert spaces in file names to underscores
```sh
rename 'y/ /_/' *
```
### Rename all .jpeg and .JPG files to have .jpg extension
```sh
rename 's/\.jpe?g$/.jpg/i' *
```
### Replace spaces in a filename with hyphens
```sh
rename 's/ /-/g' *
```
### replace spaces in filenames with underscores
```sh
rename 'y/ /_/' *
```
### Copy/move a bunch of files to dot files and back
```sh
rename s/^/./ *
```
### Replace spaces in filenames with underscores
```sh
rename -v 's/ /_/g' *
```
### Rename all .jpeg and .JPG files to .jpg
```sh
rename 's/\.jpeg/\.jpg/' *.jpeg; rename 's/\.JPG/\.jpg/' *.JPG
```
### Rename files in batch
```sh
rename 's/^hospital\.php\?loc=(\d{4})$/hospital_$1/' hospital.php*
```
### Batch rename extension of all files in a folder, in the example from .txt to .md
```sh
rename 's/\.txt$/\.md$/i' *
```
### Title Case Files
```sh
rename 's/(^|[\s\(\)\[\]_-])([a-z])/$1\u$2/g' *
```
### Title Case Files
```sh
rename 's/\b([a-z])/\u$1/g' *
```
### Add prefix onto filenames
```sh
rename 's/^/prefix/' *
```
### Tracklist reaplace backspace to '-'
```sh
rename 's/ /-/g' *.mp3
```
### Files extension change
```sh
rename .oldextension .newextension *.oldextension
```
### Numeric zero padding file rename
```sh
 rename 's/\d+/sprintf("%04d",$&)/e' *.jpg
```
### Adding Prefix to File name
```sh
rename 's/^/PREFIX/g' *
```
### Adding Prefix to File name
```sh
rename 's/^/CS749__/' *.pdf
```
### renames multiple files that match the pattern
```sh
rename 's/foo/bar/g' *
```
### space to underscore across single directory
```sh
rename ' ' '_' *
```
### Replace all the spaces in all the filenames of the current directory and including directories with underscores.
```sh
rename "s/ /_/g" * .*
```
### Adding leading zeros to a filename (1.jpg -> 001.jpg)
```sh
rename.ul "" 00 ?.jpg; rename "" 0 ??.jpg;
```
### Replace Space In Filenames With Underscore
```sh
rename 's/ /_/g' *
```
### Rename with regular expression and leading zeros
```sh
rename 's/result_([0-9]+)_([0-9]+)_([0-9]+)\.json\.txt/sprintf("%d%02d%02d.txt",$3,$2,$1)/ge' result_*.txt
```