# man 

### Quick access to the ascii table.
```sh
man ascii
```

### Quick access to the ascii table.
```sh
man ascii
```

### Quick access to the ascii table.
```sh
man ascii
```

### Quick access to the ascii table.
```sh
man ascii
```

### See The MAN page for the last command
```sh
man !!
```

### See The MAN page for the last command
```sh
man !!:0
```

### Backup a file before editing it.
```sh
man emacs
```

### Display a random man page
```sh
man $(ls /bin | sed -n $((RANDOM % $(ls /bin | wc -l) + 1))p)
```

### Display a random man page
```sh
man $(ls -1 /usr/share/man/man?/ | shuf -n1 | cut -d. -f1)
```

### Get some useful Information
```sh
man <COMMAND>
```

### open man page of last used command
```sh
man !!
```

### Display a random man page
```sh
man $(/bin/ls /bin | awk '{ cmd[i++] = $0 } END { srand(); print cmd[int(rand()*length(cmd))]; }')
```

### Learn searching and navigating in man like a boss
```sh
man <command> then type h
```

### A description of internet protocol
```sh
man inet
```

### ettercap manual
```sh
man ettercap
```

### bash man page
```sh
man bash | col -b
```

### Save man pages to pdf
```sh
man -t man | ps2pdf - > man.pdf
```

### Give to anyone a command to immediatly find a particular part of a man.
```sh
man <COMMAND> | less +'/pattern'
```

### Play musical notes from octave of middle C
```sh
man beep | sed -e '1,/Note/d; /BUGS/,$d' | awk '{print $2}' | xargs -IX sudo beep -f X -l 500
```

### Quick access to the ascii table.
```sh
man ascii
```

### Introduction to user commands
```sh
man intro
```

### read manpage of a unix command as pdf in preview (Os X)
```sh
man -t UNIX_COMMAND | open -f -a preview
```

### Print out a man page
```sh
man -t man | lp
```

### Show File System Hierarchy
```sh
man hier
```

### Show File System Hierarchy
```sh
man hier
```

### Show File System Hierarchy
```sh
man hier
```

### Show File System Hierarchy
```sh
man hier
```

### Search manpages for a keyword
```sh
man -k <keyword>
```

### Quick access to the ascii table.
```sh
man ascii
```

### save man-page as pdf
```sh
man -t awk | ps2pdf - awk.pdf
```

### Quick access to the ascii table.
```sh
man ascii
```

### Show sections of a man page.
```sh
man ls | egrep "^([A-Z]|   [A-Z])"
```

### What is the use of this switch ?
```sh
manswitch () { man $1 | less -p "^ +$2"; }
```

### Convert "man page" to text file
```sh
man ls | col -b > ~/Desktop/man_ls.txt
```

### Quick access to the ascii table.
```sh
man ascii
```

### open manpage and search for a string
```sh
man foobar | less +/searched_string
```

### What is the use of this switch ?
```sh
manswitch() { man $1 | grep -A5 "^ *\-$2"; }
```

### Quick access to the ascii table.
```sh
man ascii
```

### Access to specific man page section
```sh
man 5 crontab
```

### Display a random man page
```sh
man $(ls /bin | shuf | head -1)
```

### Print all available rxvt resources and their comments
```sh
man -Pcat urxvt | \ # see description for full command
```

### Convert man page to PDF
```sh
man -Tps ls >> ls_manpage.ps && ps2pdf ls_manpage.ps
```

### Quick access to the ascii table.
```sh
man ascii
```

### print pdf man file
```sh
man -t ls > ls.ps && pdf2ps ls.ps && rm ls.ps
```

### Create a pdf version of a manpage
```sh
man -t manpage | ps2pdf - filename.pdf
```

### Create a pdf version of a manpage
```sh
man -t manpage | ps2pdf - filename.pdf
```

### Display a random man page
```sh
man $(ls /bin | shuf -n1)
```

### open manpage in browser
```sh
man -HBrowser manpage
```

### Quick access to the ascii table.
```sh
man ascii
```

### Render man page in *temporary* PDF (works in Gnome)
```sh
man -t man | ps2pdf - temp.pdf; evince temp.pdf &> /dev/null &; sleep 3; rm temp.pdf
```

### Quick access to ASCII code of a key
```sh
man ascii
```

### Go to man section of bash builtins
```sh
man () { if [[ $(type ${1}) =~ "is a shell builtin" ]]; then; /usr/bin/man -P "/usr/bin/less -iRs pattern=\"^ *${1}\"" bash; else; /usr/bin/man ${1}; return; fi; }
```

### Quick access to the ascii table.
```sh
man ascii
```

### search manpages on the internets
```sh
manview() { lynx -dump -accept_all_cookies 'http://www.csuglab.cornell.edu/cgi-bin/adm/man.cgi?section=all&topic='"$1" | less; }
```

### Print multiline text starting and ending at specific regexps with perl
```sh
man fetchmail | perl -ne 'undef $/; print $1 if m/^.*?(-k \| keep.*)-K \| nokeep.*$/smg'
```

### save a manpage to plaintext file
```sh
man perlcheat | col -b > perlcheat.txt
```

### save a manpage to plaintext file
```sh
man -P cat ls > man_ls.txt
```

### Quick access to the ascii table.
```sh
man ascii
```

### Quick access to the ascii table.
```sh
man ascii
```

### Quick access to the ascii table.
```sh
man ascii
```

### See The MAN page for the last command
```sh
man !!:0
```

### Save man pages to pdf
```sh
man -t man | ps2pdf - > man.pdf
```

### Give to anyone a command to immediatly find a particular part of a man.
```sh
man <COMMAND> | less +'/pattern'
```

### Play musical notes from octave of middle C
```sh
man beep | sed -e '1,/Note/d; /BUGS/,$d' | awk '{print $2}' | xargs -IX sudo beep -f X -l 500
```

### Quick access to the ascii table.
```sh
man ascii
```

### Introduction to user commands
```sh
man intro
```

### read manpage of a unix command as pdf in preview (Os X)
```sh
man -t UNIX_COMMAND | open -f -a preview
```

### Print out a man page
```sh
man -t man | lp
```

### Show File System Hierarchy
```sh
man hier
```

### Show File System Hierarchy
```sh
man hier
```

### Show File System Hierarchy
```sh
man hier
```

### Search manpages for a keyword
```sh
man -k <keyword>
```

### Quick access to the ascii table.
```sh
man ascii
```

### save man-page as pdf
```sh
man -t awk | ps2pdf - awk.pdf
```

### Quick access to the ascii table.
```sh
man ascii
```

### Show sections of a man page.
```sh
man ls | egrep "^([A-Z]|   [A-Z])"
```

### What is the use of this switch ?
```sh
manswitch () { man $1 | less -p "^ +$2"; }
```

### Convert "man page" to text file
```sh
man ls | col -b > ~/Desktop/man_ls.txt
```

### Quick access to the ascii table.
```sh
man ascii
```

### open manpage and search for a string
```sh
man foobar | less +/searched_string
```

### What is the use of this switch ?
```sh
manswitch() { man $1 | grep -A5 "^ *\-$2"; }
```

### Quick access to the ascii table.
```sh
man ascii
```

### Access to specific man page section
```sh
man 5 crontab
```

### Display a random man page
```sh
man $(ls /bin | shuf | head -1)
```

### Print all available rxvt resources and their comments
```sh
man -Pcat urxvt | \ # see description for full command
```

### Convert man page to PDF
```sh
man -Tps ls >> ls_manpage.ps && ps2pdf ls_manpage.ps
```

### Quick access to the ascii table.
```sh
man ascii
```

### print pdf man file
```sh
man -t ls > ls.ps && pdf2ps ls.ps && rm ls.ps
```

### Create a pdf version of a manpage
```sh
man -t manpage | ps2pdf - filename.pdf
```

### Display a random man page
```sh
man $(ls /bin | shuf -n1)
```

### open manpage in browser
```sh
man -HBrowser manpage
```

### Quick access to the ascii table.
```sh
man ascii
```

### Render man page in *temporary* PDF (works in Gnome)
```sh
man -t man | ps2pdf - temp.pdf; evince temp.pdf &> /dev/null &; sleep 3; rm temp.pdf
```

### Quick access to ASCII code of a key
```sh
man ascii
```

### Go to man section of bash builtins
```sh
man () { if [[ $(type ${1}) =~ "is a shell builtin" ]]; then; /usr/bin/man -P "/usr/bin/less -iRs pattern=\"^ *${1}\"" bash; else; /usr/bin/man ${1}; return; fi; }
```

### Quick access to the ascii table.
```sh
man ascii
```
