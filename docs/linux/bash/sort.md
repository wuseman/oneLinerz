# sort 

### Generate an XKCD #936 style 4 word password
```sh
sort -R /usr/share/dict/british | grep -v -m4 ^\{1,10\}$ | tr [:upper:] [:lower:] | tr "\n" " " | tr -d "'s" | xargs -0 echo
```

### intersection between two files
```sh
sort file1 file2 | uniq -d
```

### Poor man's unsort (randomize lines)
```sh
sort random-sort file
```

### Read, sort and confirm uniqueness of entries in files and directories
```sh
sort -u filename > newfilename
```

### Pass TAB as field separator to sort, join, cut, etc.
```sh
sort -t $'\t' -k 2 input.txt
```

### Sort IPV4 ip addresses
```sh
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n
```

### Randomize lines in a file
```sh
sort -R SOMEFILE
```

### List of directories sorted by number of files they contain.
```sh
sort -n <( for i in $(find . -maxdepth 1 -mindepth 1 -type d); do echo $(find $i | wc -l) ": $i"; done;)
```

### Sort lines using the Xth characted as the start of the sort string
```sh
sort -k1.x
```

### To have only unique lines in a file
```sh
sort file1.txt | uniq > file2.txt
```

### Sort output by length of line
```sh
sortwc () { local L;while read -r L;do builtin printf "${#L}@%s\n" "$L";done|sort -n|sed -u 's/^[^@]*@//'; }
```

### List your MACs address
```sh
sort -u < /sys/class/net/*/address
```

### Sort IP addresses
```sh
sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 /file/of/ip/addresses
```

### sort monthwise
```sh
sort -M filename
```

### Randomize lines (opposite of | sort)
```sh
sort -R
```

### Pick a random line from a file
```sh
sort -R file.txt | head -1
```

### sort ugly text
```sh
sort -bdf
```

### Sort dotted quads
```sh
sort -nt . -k 1,1 -k 2,2 -k 3,3 -k 4,4
```

### Sort Apache access.log by date and time
```sh
sort -s -b -t' ' -k 4.9,4.12n -k 4.5,4.7M -k 4.2,4.3n -k 4.14,4.15n -k 4.17,4.18n -k 4.20,4.21n access.log*
```

### Count unique lines in file sorted by instance count (descending) and alphabetically (ascending)
```sh
sort file.txt | uniq -c | sort -k1nr -k2d
```

### sort a list of comma separated numbers: sort_csn
```sh
sort_csn () { echo "${1}" | sed -e "s/,/\n/g"| sort -nu | awk '{printf("%s,",$0)} END {printf("\n")}' | sed -e "s/,$//"; }
```

### Sort IPv4 address in order
```sh
sort -V ~/ip.txt
```

### sort the contents of a text file in place.
```sh
sort -g -o list.txt{,}
```

### Remove duplicate line in a text file.
```sh
sort in-file.txt | uniq -u > out-file.txt
```

### sort a csv file according to a particular n th  field numerically (quicker than excel)
```sh
sort -t"," -n -k5 file.csv  # according to the 5th field NUMERICALLY!!
```

### Sort using kth column using : delimiter
```sh
sort -t: -k 2 names.txt
```

### Unique sort
```sh
sort namesd.txt | uniq
```

### Unique sort
```sh
sort namesd.txt | uniq
```

### Show duplicate lines in a file
```sh
sort namesd.txt | uniq ?cd
```

### Pass TAB as field separator to sort, join, cut, etc.
```sh
sort -t $'\t' -k 2 input.txt
```

### Sort IPV4 ip addresses
```sh
sort -t. -k1,1n -k2,2n -k3,3n -k4,4n
```

### Randomize lines in a file
```sh
sort -R SOMEFILE
```

### List of directories sorted by number of files they contain.
```sh
sort -n <( for i in $(find . -maxdepth 1 -mindepth 1 -type d); do echo $(find $i | wc -l) ": $i"; done;)
```

### Sort lines using the Xth characted as the start of the sort string
```sh
sort -k1.x
```

### To have only unique lines in a file
```sh
sort file1.txt | uniq > file2.txt
```

### Sort output by length of line
```sh
sortwc () { local L;while read -r L;do builtin printf "${#L}@%s\n" "$L";done|sort -n|sed -u 's/^[^@]*@//'; }
```

### List your MACs address
```sh
sort -u < /sys/class/net/*/address
```

### Sort IP addresses
```sh
sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 /file/of/ip/addresses
```

### sort monthwise
```sh
sort -M filename
```

### Randomize lines (opposite of | sort)
```sh
sort -R
```

### Pick a random line from a file
```sh
sort -R file.txt | head -1
```

### sort ugly text
```sh
sort -bdf
```

### Sort dotted quads
```sh
sort -nt . -k 1,1 -k 2,2 -k 3,3 -k 4,4
```

### Sort Apache access.log by date and time
```sh
sort -s -b -t' ' -k 4.9,4.12n -k 4.5,4.7M -k 4.2,4.3n -k 4.14,4.15n -k 4.17,4.18n -k 4.20,4.21n access.log*
```

### Count unique lines in file sorted by instance count (descending) and alphabetically (ascending)
```sh
sort file.txt | uniq -c | sort -k1nr -k2d
```

### sort a list of comma separated numbers: sort_csn
```sh
sort_csn () { echo "${1}" | sed -e "s/,/\n/g"| sort -nu | awk '{printf("%s,",$0)} END {printf("\n")}' | sed -e "s/,$//"; }
```

### Sort IPv4 address in order
```sh
sort -V ~/ip.txt
```

### sort the contents of a text file in place.
```sh
sort -g -o list.txt{,}
```

### Remove duplicate line in a text file.
```sh
sort in-file.txt | uniq -u > out-file.txt
```

### sort a csv file according to a particular n th  field numerically (quicker than excel)
```sh
sort -t"," -n -k5 file.csv  # according to the 5th field NUMERICALLY!!
```

### Sort using kth column using : delimiter
```sh
sort -t: -k 2 names.txt
```

### Unique sort
```sh
sort namesd.txt | uniq
```
