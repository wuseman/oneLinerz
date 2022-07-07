# stat

### Get currently logged in console user's shortname
```sh
stat -f '%Su' /dev/console
```

### Nicely display permissions in octal format with filename
```sh
stat -c '%A %a %n' *
```

### View Owner, Group & Permissions.
```sh
stat -c '%n %U:%G-%a' *
```

### STAT Function showing ALL info, stat options, and descriptions
```sh
statt(){ C=c;stat h|sed '/Th/,/NO/!d;/%/!d'|while read l;do p=${l/% */};[ $p == %Z ]&&C=fc&&echo ^FS:^;echo "`stat -$C $p \"$1\"` ^$p^${l#%* }";done|column -ts^; }
```

### Nicely display permissions in octal format with filename
```sh
stat -f '%Sp %p %N' * | rev | sed -E 's/^([^[:space:]]+)[[:space:]]([[:digit:]]{4})[^[:space:]]*[[:space:]]([^[:space:]]+)/\1 \2 \3/' | rev
```

### Get current logged in users shortname
```sh
stat -f%Su /dev/console
```

### list files recursively by size
```sh
stat -c'%s %n' **/* | sort -n
```

### Display the format of a directory or file
```sh
stat -f -L -c %T YOUR_FILE_OR_DIRECTORY
```

### Status of a file/directory
```sh
stat /etc/my.cnf
```

### Execute md5sum and sha in the same files in a single command.
```sh
stat -c %n * |tee >(xargs md5sum >estedir.md5) >(xargs sha512sum  >estedir.sha)
```

### File size
```sh
stat format "%s" <file>
```

### File size
```sh
stat -c "%s" <file>
```

### Nicely display permissions in octal format with filename
```sh
stat -c '%A %a %n' *
```

### View Owner, Group & Permissions.
```sh
stat -c '%n %U:%G-%a' *
```

### STAT Function showing ALL info, stat options, and descriptions
```sh
statt(){ C=c;stat h|sed '/Th/,/NO/!d;/%/!d'|while read l;do p=${l/% */};[ $p == %Z ]&&C=fc&&echo ^FS:^;echo "`stat -$C $p \"$1\"` ^$p^${l#%* }";done|column -ts^; }
```

### Nicely display permissions in octal format with filename
```sh
stat -f '%Sp %p %N' * | rev | sed -E 's/^([^[:space:]]+)[[:space:]]([[:digit:]]{4})[^[:space:]]*[[:space:]]([^[:space:]]+)/\1 \2 \3/' | rev
```

### Get current logged in users shortname
```sh
stat -f%Su /dev/console
```

### list files recursively by size
```sh
stat -c'%s %n' **/* | sort -n
```

### Display the format of a directory or file
```sh
stat -f -L -c %T YOUR_FILE_OR_DIRECTORY
```
