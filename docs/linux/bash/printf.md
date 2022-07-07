# printf

### Full width higlighted line

printf "\e[7m%-`tput cols`s\e[0m\n" "Full width highlighted line"


### Generate a sequence of numbers
```sh
printf '%s\n' {1..10}
```

### Print in columns

```sh
x="ABCD"
n=10
n=$((n + ${#x}))
printf "%${n}s" $x
```

### Emulate perl 'print "#" x 20, "\n"'
```sh
printf '%*s\n' 20 | tr ' ' '#'
```

### List files that DO NOT match a pattern
```sh
printf "%s\n" !(pattern) ## ksh, or bash with shopt -s extglob
```

### Print a row of 50 hyphens
```sh
printf "%.50d" 0 | tr 0 -
```

### Print a row of 50 hyphens
```sh
printf "%50s\n"|tr ' ' -
```

### hexadecimal2decimal
```sh
printf "%d\n" \0x64
```

### Get the rough (german) time from Twitter by @zurvollenstunde
```sh
printf "%02d:%02d\n" $(curl -s "http://search.twitter.com/search?from=zurvollenstunde&rpp=1" | grep -E '(Es ist jetzt|ago)'  | sed 's/<[^>]*>//g;s/[^[:digit:]]//g'  | xargs )
```

### List all available commands (bash, ksh93)
```sh
printf "%s\n" ${PATH//:/\/* }
```

### Generate MD5 hash for a string
```sh
printf "$string" | md5sum
```

### Show the PATH, one directory per line
```sh
printf ${PATH//:/\\n}
```

### Create AUTH PLAIN string to test SMTP AUTH session
```sh
printf '\!:1\0\!:1\0\!:2' | mmencode | tr -d '\n' | sed 's/^/AUTH PLAIN /'
```

### Print a row of characters the width of terminal
```sh
printf -vl "%${COLUMNS:-`tput cols 2>&-||echo 80`}s\n" && echo ${l// /-};
```

### Resize a Terminal Window
```sh
printf "\e[8;70;180;t"
```

### Print a row of characters across the terminal
```sh
printf -v row "%${COLUMNS}s"; echo ${row// /#}
```

### generate a telephone keypad
```sh
printf "%s\t%s\t%s\n" {1..9} '*' 0 '#'
```

### list with full path
```sh
printf "$PWD/%s\n" *
```

### formatting number with comma
```sh
printf "%'d\n" 1234567
```

### Print random emoji in terminal
```sh
printf "\U$(printf '%x' $((RANDOM%79+128512)) )"
```

### urldecoding
```sh
printf $(echo -n $1 | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')
```

### Print a row of characters across the terminal
```sh
printf "%`tput cols`s"|tr ' ' '#'
```

### Find all dot files and directories
```sh
printf "%s\n" .*
```

### Show highlighted text with full terminal width
```sh
printf "\e[7m%-`tput cols`s\e[0m\n" "Full width highlighted line"
```

### Join the content of a bash array with commas
```sh
printf  " -e %s" ${ARRAY[*]}
```

### Big (four-byte) $RANDOM
```sh
printf %d 0x`dd if=/dev/urandom bs=1 count=4 2>/dev/null | od -x | awk 'NR==1 {print $2$3}'`
```

### get the ascii number with bash builtin printf
```sh
printf "%d\n" "'A" "'B"
```

### Password generator
```sh
printf '%s-%s-%s-%s\n' $(grep -v "[A-Z]\|'" /usr/share/dict/british | shuf -n 4)
```

### Generate binary sequence data
```sh
printf "%x\n" $(seq 0 255) | xargs -n1 -IH echo -ne \\xH > test.dat
```

### Get a count of how many file types a project has
```sh
printf "\n%25s%10sTOTAL\n" 'FILE TYPE' ' '; for ext in $(find . -iname \*.* | egrep -o '\.[^[:space:].]+$' | egrep -v '\.svn*' | sort -f | uniq -i); do count=$(find . -iname \*$ext | wc -l); printf "%25s%10s%d\n" $ext ' '  $count; done
```

### Estimate an economic bitcoin-cli fee and display as sat/B with date time stamp
```sh
printf %g "$(bitcoin-cli estimatesmartfee 6 "ECONOMICAL" | jq .feerate*100000)";printf " sat/B estimated feerate for 6 confirmations as of $(date +%c)\nDivide by 100,000 to get btc/KB\n"
```

### Find all dot files and directories
```sh
printf "%s\n" .*
```

### repeat any string or char n times without spaces between
```sh
printf  'xyz%.0s' {1..20}
```

### Join the content of a bash array with commas
```sh
printf "%s," "${LIST[@]}" | cut -d "," -f 1-${#LIST[@]}
```

### Clear terminal screen as well as terminal buffer
```sh
printf "\ec"
```

### reverse order of file
```sh
printf "g/^/m0\nw\nq"|ed $FILE
```

### Generate an over-the-top UUID
```sh
printf $(( echo "obase=16;$(echo $$$(date +%s%N))"|bc; ip link show|sed -n '/eth/ {N; p}'|grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'|head -c 17 )|tr -d [:space:][:punct:]  |sed 's/[[:xdigit:]]\{2\}/\\x&/g')|sha1sum|head -c 32; echo
```

### A line across the entire width of the terminal
```sh
printf "%$(tput cols)s\n"|tr ' ' '='
```

### for loop with leading zero in bash 3
```sh
printf "%02u " {3..20}; echo
```

### List all available commands (bash, ksh93)
```sh
printf "%s\n" ${PATH//:/\/* }
```

### Show the PATH, one directory per line
```sh
printf ${PATH//:/\\n}
```

### Create AUTH PLAIN string to test SMTP AUTH session
```sh
printf '\!:1\0\!:1\0\!:2' | mmencode | tr -d '\n' | sed 's/^/AUTH PLAIN /'
```

### Print a row of characters the width of terminal
```sh
printf -vl "%${COLUMNS:-`tput cols 2>&-||echo 80`}s\n" && echo ${l// /-};
```

### Resize a Terminal Window
```sh
printf "\e[8;70;180;t"
```

### Print a row of characters across the terminal
```sh
printf -v row "%${COLUMNS}s"; echo ${row// /#}
```

### Generate a telephone keypad
```sh
printf "%s\t%s\t%s\n" {1..9} '*' 0 '#'
```

### list with full path
```sh
printf "$PWD/%s\n" *
```

### formatting number with comma
```sh
printf "%'d\n" 1234567
```

### Print random emoji in terminal
```sh
printf "\U$(printf '%x' $((RANDOM%79+128512)) )"
```

### urldecoding
```sh
printf $(echo -n $1 | sed 's/\\/\\\\/g;s/\(%\)\([0-9a-fA-F][0-9a-fA-F]\)/\\x\2/g')
```

### Print a row of characters across the terminal
```sh
printf "%`tput cols`s"|tr ' ' '#'
```

### Find all dot files and directories
```sh
printf "%s\n" .*
```

### Show highlighted text with full terminal width
```sh
printf "\e[7m%-`tput cols`s\e[0m\n" "Full width highlighted line"
```

### Join the content of a bash array with commas
```sh
printf  " -e %s" ${ARRAY[*]}
```

### Big (four-byte) $RANDOM
```sh
printf %d 0x`dd if=/dev/urandom bs=1 count=4 2>/dev/null | od -x | awk 'NR==1 {print $2$3}'`
```

### get the ascii number with bash builtin printf
```sh
printf "%d\n" "'A" "'B"
```

### Password generator
```sh
printf '%s-%s-%s-%s\n' $(grep -v "[A-Z]\|'" /usr/share/dict/british | shuf -n 4)
```

### Generate binary sequence data
```sh
printf "%x\n" $(seq 0 255) | xargs -n1 -IH echo -ne \\xH > test.dat
```

### Get a count of how many file types a project has
```sh
printf "\n%25s%10sTOTAL\n" 'FILE TYPE' ' '; for ext in $(find . -iname \*.* | egrep -o '\.[^[:space:].]+$' | egrep -v '\.svn*' | sort -f | uniq -i); do count=$(find . -iname \*$ext | wc -l); printf "%25s%10s%d\n" $ext ' '  $count; done
```

### Estimate an economic bitcoin-cli fee and display as sat/B with date time stamp
```sh
printf %g "$(bitcoin-cli estimatesmartfee 6 "ECONOMICAL" | jq .feerate*100000)";printf " sat/B estimated feerate for 6 confirmations as of $(date +%c)\nDivide by 100,000 to get btc/KB\n"
```

### Find all dot files and directories
```sh
printf "%s\n" .*
```

### repeat any string or char n times without spaces between
```sh
printf  'xyz%.0s' {1..20}
```

### Join the content of a bash array with commas
```sh
printf "%s," "${LIST[@]}" | cut -d "," -f 1-${#LIST[@]}
```

### Clear terminal screen as well as terminal buffer
```sh
printf "\ec"
```

### reverse order of file
```sh
printf "g/^/m0\nw\nq"|ed $FILE
```

### A line across the entire width of the terminal
```sh
printf "%$(tput cols)s\n"|tr ' ' '='
```
