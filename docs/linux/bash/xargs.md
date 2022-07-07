# xargs

### rename files according to file with colums of corresponding names
```sh
xargs -n 2 mv < file_with_colums_of_names
```

### Show the command line for a PID, converting nulls to spaces and a newline
```sh
xargs -0a /proc/27288/cmdline echo
```

### xargs for builtin bash commands
```sh
xargsb() { while read -r cmd; do ${@//'{}'/$cmd}; done; }
```

### run command on a group of nodes in parallel redirecting outputs
```sh
xargs -n1 -P100 -I{} sh -c 'ssh {} uptime >output/{} 2>error/{}' <hostlist
```

### Multi-thread any command
```sh
xargs -P 3 -n 1 <COMMAND> < <FILE_LIST>
```

### Remove new lines
```sh
xargs < [inputfile]
```

### rename files according to file with colums of corresponding names
```sh
xargs -n 2 mv < file_with_colums_of_names
```

### Show the command line for a PID, converting nulls to spaces and a newline
```sh
xargs -0a /proc/27288/cmdline echo
```

### xargs for builtin bash commands
```sh
xargsb() { while read -r cmd; do ${@//'{}'/$cmd}; done; }
```

### run command on a group of nodes in parallel redirecting outputs
```sh
xargs -n1 -P100 -I{} sh -c 'ssh {} uptime >output/{} 2>error/{}' <hostlist
```

### Multi-thread any command
```sh
xargs -P 3 -n 1 <COMMAND> < <FILE_LIST>
```

### Remove new lines
```sh
xargs < [inputfile]
```
