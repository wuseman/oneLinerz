# sshfs

### Mount folder/filesystem through SSH
```sh
sshfs name@server:/path/to/folder /path/to/mount/point
```

### Mount sshfs with sshpass
```sh 
echo $mypassword | \ 
	sshfs -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
	<user>@<host> mountpoint -o workaround=rename -o password_stdin 
```
### You can use the sshpass command to login via password authentication, but non-interactively:
```sh 
echo "MyPassword" > passwordfile
chmod 600 passwordfile
sshpass -f passwordfile [ssh parameters]
```


