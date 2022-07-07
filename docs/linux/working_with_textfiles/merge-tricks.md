# merge tricks

Various tricks for merge two lines to one-side-by-side

### Xargs

```sh
xargs -n2 -d'\n'
```

### paste

```sh
paste -s -d ',\n' infile
```

```sh
paste -d " "  - - < filename
```

### awk 

```sh
awk 'NR%2{printf "%s ",$0;next;}1' yourFile
```

```sh
awk '{key=$0; getline; print key ", " $0;}'
```

```sh
awk 'ORS=NR%2?FS:RS' file
```

```sh
awk 'ORS=NR%2?FS:RS' file

```sh
awk '{ ORS = (NR%2 ? FS : RS) } 1' file
```

```sh
awk '{ ORS = (NR%2 ? "," : RS) } 1' file
```

```sh
awk '{ if (NR%2 != 0) line=$0; else {printf("%s %s\n", line, $0); line="";} } END {if (length(line)) print line;}'
```

### sed

```sh
sed 'N;s/\n/ /' yourFile
```

### while 

```sh
while read line1; do read line2; echo "$line1, $line2"; done < data.txt
```
### ex

```sh
ex -c "%g/KEY/j" -c "wq" data.txt
```

### perl

```sh
perl -0pe 's/(.*)\n(.*)\n/$1 $2\n/g' 
```
