# until-loop

### Retry the previous command until it exits successfully
```sh
until !!; do :; done
```

### Retry the previous command until it exits successfully
```sh
until !!; do :; done
```

### do something else while waiting for an event, such as reboot
```sh
until (ssh root@10.1.1.39 2> /dev/null); do date; sleep 15; done
```

### Set audible alarm when an IP address comes online
```sh
until ping -c1 ADDRESS;do true;done;zenity warning text "ADDRESS is back"
```

### do 'foo' until it exits successfully, pausing in between crashes
```sh
until foo some args; do echo "crashed: $?  respawning..." >&2; sleep 10; done
```

### Retry the previous command until it exits successfully
```sh
until !!; do done
```

### Retry the previous command until it exits successfully
```sh
until !!; do :; done
```

### do something else while waiting for an event, such as reboot
```sh
until (ssh root@10.1.1.39 2> /dev/null); do date; sleep 15; done
```

### Set audible alarm when an IP address comes online
```sh
until ping -c1 ADDRESS;do true;done;zenity warning text "ADDRESS is back"
```

### do 'foo' until it exits successfully, pausing in between crashes
```sh
until foo some args; do echo "crashed: $?  respawning..." >&2; sleep 10; done
```

### Retry the previous command until it exits successfully
```sh
until !!; do done
```
