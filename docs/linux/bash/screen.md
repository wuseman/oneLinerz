# screen

### List detached screen sessions
```sh
screen -ls | grep D
```

### creates or attachs to screen
```sh
screen -r irc || screen -S irc irssi
```

### Automatically find and re-attach to a detached screen session
```sh
screen -x `screen -ls | grep Detached | cut -c -10`
```

### Start a file browser in the current directory
```sh
screen -d -m nautilus no-desktop `pwd`
```

### connects to a serial console
```sh
screen /dev/ttyS0 9600
```

### Runs a command without hangups.
```sh
screen -d -m command &
```

### Share your terminal session (remotely or whatever)
```sh
screen -x
```

### Share a screen session
```sh
screen -x <screen_id>
```

### Reconnect to screen without disconnecting other sessions
```sh
screen -xR
```

### Start screen with name and run command
```sh
screen -dmS "name_me" echo "hi"
```

### connect to all screen instances running
```sh
screen -ls | grep pts | gawk '{ split($1, x, "."); print x[1] }' | while read i; do gnome-terminal -e screen\ -dx\ $i; done
```

### create screencast (record text and audio simultaneously) using 'script' and 'arecord'
```sh
screencast() { arecord -R 1000 -f cd -t wav $1.wav & RECPID=$!; echo "Starting screencast in new shell. Exit subshell to quit."; script -t 2> $1.timing -a $1.session; kill $RECPID; }
```

### Automatically find and re-attach to a detached screen session
```sh
screen -RR
```

### Start screen in detached mode
```sh
screen -d -m [<command>]
```

### Open screen on the previous command
```sh
screen !!
```

### Share a 'screen'-session
```sh
screen -x
```

### Automatically find and re-attach to a detached screen session
```sh
screen -D -R
```

### Resume a detached screen session, resizing to fit the current terminal
```sh
screen -raAd
```

### Start urxvt and do whatever is needed to open the screen session named "main"
```sh
screen -ls | grep main && urxvt -name screen -e screen -x main || urxvt -name screen -e screen -R -S main
```

### Start screen, attach here an now to sessionname , be quiet
```sh
screen -R -D -S sessionname -q
```

### Opens up a background session within an existing fron-end session
```sh
screen
```

### use screen as a terminal emulator to connect to serial consoles
```sh
screen /dev/tty<device> 9600
```

### starts a detached screen with name
```sh
screen -S [name] -d -m [<command>]
```

### share a path when starting a new screen window
```sh
screen -X eval "chdir $PWD"
```

### Connected to first screen session created
```sh
screen -x $(screen -ls | awk 'NR == 2 { print $1 }')
```

### connects to a serial console
```sh
screen /dev/ttyS0 9600
```

### Runs a command without hangups.
```sh
screen -d -m command &
```

### Share your terminal session (remotely or whatever)
```sh
screen -x
```

### Share a screen session
```sh
screen -x <screen_id>
```

### Reconnect to screen without disconnecting other sessions
```sh
screen -xR
```

### Start screen with name and run command
```sh
screen -dmS "name_me" echo "hi"
```

### connect to all screen instances running
```sh
screen -ls | grep pts | gawk '{ split($1, x, "."); print x[1] }' | while read i; do gnome-terminal -e screen\ -dx\ $i; done
```

### create screencast (record text and audio simultaneously) using 'script' and 'arecord'
```sh
screencast() { arecord -R 1000 -f cd -t wav $1.wav & RECPID=$!; echo "Starting screencast in new shell. Exit subshell to quit."; script -t 2> $1.timing -a $1.session; kill $RECPID; }
```

### Automatically find and re-attach to a detached screen session
```sh
screen -RR
```

### Start screen in detached mode
```sh
screen -d -m [<command>]
```

### Open screen on the previous command
```sh
screen !!
```

### Share a 'screen'-session
```sh
screen -x
```

### Automatically find and re-attach to a detached screen session
```sh
screen -D -R
```

### Resume a detached screen session, resizing to fit the current terminal
```sh
screen -raAd
```

### Start urxvt and do whatever is needed to open the screen session named "main"
```sh
screen -ls | grep main && urxvt -name screen -e screen -x main || urxvt -name screen -e screen -R -S main
```

### Start screen, attach here an now to sessionname , be quiet
```sh
screen -R -D -S sessionname -q
```

### Opens up a background session within an existing fron-end session
```sh
screen
```

### use screen as a terminal emulator to connect to serial consoles
```sh
screen /dev/tty<device> 9600
```

### starts a detached screen with name
```sh
screen -S [name] -d -m [<command>]
```

### share a path when starting a new screen window
```sh
screen -X eval "chdir $PWD"
```

### Connected to first screen session created
```sh
screen -x $(screen -ls | awk 'NR == 2 { print $1 }')
```
