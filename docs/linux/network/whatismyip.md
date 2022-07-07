# whatismyip

Various ways to print your WAN IP -Address:

### curl

```sh
curl -s https://w.nr1.nu/i 
```

```sh
curl -s https://w.nr1.nu/i/
```

```sh
curl -s http://wtfismyip.com/text
```
  
```sh
curl -s https://ifconfig.co
```
  
```sh
curl -s checkip.dyndns.org|grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
```

### wget
   
```sh
wget -qO - https://w.nr1.nu/i/
```
  
```sh
wget -O - -q icanhazip.com
```
   
```sh
wget -qO- ifconfig.me/ip
```
   
```sh
wget http://icanhazip.com -qO-
```
