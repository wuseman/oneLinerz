# bash

# Make changes in .bashrc immediately available
```sh
bashrc-reload() { 
	builtin unalias -a; builtin unset -f $(builtin declare -F | \
	 sed 's/^.*declare[[:blank:]]\+-f[[:blank:]]\+//'); 
	source ~/.bashrc; 
}
```

### Delete static and dynamic arp for /24 subnet
```sh
for i in {1..254}; do 
	arp -d 192.168.0.$i; 
done
```
### Preserve your fingers from cd ..; cd ..; cd..; cd..;
```sh
up() { 
	DEEP=$1; 'for i in $(seq 1 ${DEEP:-"1"}); do cd ../; 
done
}
```
### Get executed script's current working directory
```sh
CWD=$(cd "$(dirname "$0")" && pwd)
```
### Scan all open ports without any required program
```sh
for i in {1..65535}; do 
	(echo < /dev/tcp/127.0.0.1/$i) &>/dev/null && \
	printf "\n[+] Open Port at\n: \t%d\n" "$i" \
	|| printf "."; 
done
```

### Create a txt files with 10000 rows
```sh
for FILE in *.full ; do 
	split -l 100000 $FILE; mv -f xaa `echo "$FILE" \
	| cut -d'.' -f1`.txt; rm -f x*; 
done
```
