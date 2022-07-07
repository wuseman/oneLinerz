# pkill

### Kill process by searching something from 'ps' command
```sh
pkill <process name>
```

### Kill process by searching something from 'ps' command
```sh
pkill -f <process name>
```

### kills all php5-fcgi processes for user per name
```sh
pkill -9 -u username php5-fcgi
```

### Make syslog reread its configuration file
```sh
pkill -HUP syslogd
```

### kill all processes with name or argument
```sh
pkill -f foo
```

### Kills MYWIFE.
```sh
pkill -U MYWIFE
```

### kill process by name
```sh
pkill
```

### Kill a process with its name
```sh
pkill $1
```

### kill all process that belongs to you
```sh
pkill -u `whoami`
```

### kill some pids without specific pid
```sh
pkill -9 search_criteria
```

### Kill any process with one command using program name
```sh
pkill <name>
```

### Kill most recently created process.
```sh
pkill -n firefox
```

### Watch the progress of 'dd'
```sh
pkill -USR1 ^dd$
```

### kill process by name
```sh
pkill -x firefox
```

### Kill XMMS for a cron job
```sh
pkill xmms
```

### Kill google chrome process
```sh
pkill -9 -x chrome
```

### Kill a process by its partial name
```sh
pkill name
```

### Wait the end of prog1 and launch prog2
```sh
pkill -0 prog1; while [ $? -eq 0 ]; do sleep 10; pkill -0 prog1; done; prog2
```

### Find a process by name and automatically kill it
```sh
pkill -f process_name
```

### kills all php5-fcgi processes for user per name
```sh
pkill -9 -u username php5-fcgi
```

### controls mpg321 play/pause/stop by signals
```sh
pkill -{signal} mpg321
```

### all out
```sh
pkill -KILL -u username
```

### all out
```sh
pkill -9 -u username
```

### Restart Plasma without logging off from KDE
```sh
pkill plasma-desktop && plasma-desktop
```

### Mouse wheel or thumb buttons borked? Try this.
```sh
pkill imwheel && imwheel &
```

### kill all process that belongs to you
```sh
pkill -u `whoami`
```

### kill some pids without specific pid
```sh
pkill -9 search_criteria
```

### Kill any process with one command using program name
```sh
pkill <name>
```

### Kill most recently created process.
```sh
pkill -n firefox
```

### Watch the progress of 'dd'
```sh
pkill -USR1 ^dd$
```

### kill process by name
```sh
pkill -x firefox
```

### Kill XMMS for a cron job
```sh
pkill xmms
```

### Kill google chrome process
```sh
pkill -9 -x chrome
```

### Kill a process by its partial name
```sh
pkill name
```

### Wait the end of prog1 and launch prog2
```sh
pkill -0 prog1; while [ $? -eq 0 ]; do sleep 10; pkill -0 prog1; done; prog2
```

### Find a process by name and automatically kill it
```sh
pkill -f process_name
```

### kills all php5-fcgi processes for user per name
```sh
pkill -9 -u username php5-fcgi
```

### controls mpg321 play/pause/stop by signals
```sh
pkill -{signal} mpg321
```

### all out
```sh
pkill -KILL -u username
```

### all out
```sh
pkill -9 -u username
```

### Restart Plasma without logging off from KDE
```sh
pkill plasma-desktop && plasma-desktop
```

### Mouse wheel or thumb buttons borked? Try this.
```sh
pkill imwheel && imwheel &
```
