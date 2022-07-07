# ssh-config

### Use Gateway/Jumphost
```
Host unreachable_host
   ProxyCommand ssh -e none gateway_host exec nc %h %p
```
###	Automatic Port Knocking
```
Host myserver
   User myuser
   Host myserver.com
   ProxyCommand bash -c '/usr/bin/knock %h 1000 2000 3000 4000; sleep 1; exec /bin/nc %h %p'
```

### Automatic Jump Host Proxying
```
Host <your jump host>
  ForwardAgent yes
  Hostname <your jump host>
  User <your user name on jump host>
```
### Note the server list can have wild cards, e.g. webserver-* database
```
Host <server list>
  User <your user name on all these hosts>
  ProxyCommand ssh -q <your jump host> nc -q0 %h 22
```