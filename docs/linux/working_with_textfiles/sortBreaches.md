# sortBreaches

### Sort leaked accounts by domain

```sh
while read line; do 
	DOMAIN="$(echo -e $line|cut -d '@' -f2|cut -d: -f1)"; 
	echo -e $line >> $DOMAIN; 
done < swedish_clean.txt
```