# pgrep 

### Get process id based on name and parameters
```sh
pgrep -f 'process.*argument.*'
```

### count how many cat processes are running
```sh
pgrep -c cat
```

### Count httpd processes
```sh
pgrep -c 'httpd|apache2'
```

### psgrepp
```sh
pgrep -lf
```

### psgrep
```sh
pgrep <name>
```

### Find the correct PID
```sh
pgrep -fl
```

### Reload gnome-panel
```sh
pgrep -lf gnome-panel | awk '{if ($2=="gnome-panel") print $1}' | xargs kill -9
```

### count how many cat processes are running
```sh
pgrep -c cat
```

### kills all php5-fcgi processes for user per name
```sh
pgrep -u username php5-fcgi | xargs kill -9
```

### Kill multiple instances of a running process
```sh
pgrep rouge-process | xargs sudo kill -9
```

### Show the number of current httpd processes
```sh
pgrep -c httpd
```

### processes per user counter
```sh
pgrep -cu ioggstream
```

### Display the tree of all instance of a particular  process
```sh
pgrep 'sleep' | while read pid; do pstree -sa -H$pid $pid ; done
```

### Show sum of active sockets by process name or mask
```sh
pgrep -lf processname | cut -d' ' -f1 | awk '{print "cat /proc/" $1 "/net/sockstat | head -n1"}' | sh | cut -d' ' -f3 | paste -sd+ | bc
```

### Exclude grep from your grepped output of ps (alias included in description)
```sh
pgrep -fl [h]ttpd
```

### Exclude grep from your grepped output of ps (alias included in description)
```sh
pgrep -fl [h]ttpd
```

### Cleanup firefox's database.
```sh
pgrep -u `id -u` firefox-bin || find ~/.mozilla/firefox -name '*.sqlite'|(while read -e f; do echo 'vacuum;'|sqlite3 "$f" ; done)
```

### Find the process you are looking for minus the grepped one
```sh
pgrep command_name
```

### Find the process ID of such program:
```sh
pgrep xterm
```

### Find the process you are looking for minus the grepped one
```sh
pgrep -fl myprog
```

### Find process tree in friendly format
```sh
pgrep <name> | xargs -i pstree -ps {}
```

### Show the number of current httpd processes
```sh
pgrep -c httpd
```

### processes per user counter
```sh
pgrep -cu ioggstream
```

### Display the tree of all instance of a particular  process
```sh
pgrep 'sleep' | while read pid; do pstree -sa -H$pid $pid ; done
```

### Show sum of active sockets by process name or mask
```sh
pgrep -lf processname | cut -d' ' -f1 | awk '{print "cat /proc/" $1 "/net/sockstat | head -n1"}' | sh | cut -d' ' -f3 | paste -sd+ | bc
```

### Exclude grep from your grepped output of ps (alias included in description)
```sh
pgrep -fl [h]ttpd
```

### Exclude grep from your grepped output of ps (alias included in description)
```sh
pgrep -fl [h]ttpd
```

### Cleanup firefox's database.
```sh
pgrep -u `id -u` firefox-bin || find ~/.mozilla/firefox -name '*.sqlite'|(while read -e f; do echo 'vacuum;'|sqlite3 "$f" ; done)
```

### Find the process you are looking for minus the grepped one
```sh
pgrep command_name
```

### Find the process ID of such program:
```sh
pgrep xterm
```

### Find the process you are looking for minus the grepped one
```sh
pgrep -fl myprog
```
