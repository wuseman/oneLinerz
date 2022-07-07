# mailx

### Change the From: address on the fly for email sent from the command-line
```sh
mail -s "subject" user@todomain.com <emailbody.txt   -f customfrom@fromdomain.com -F 'From Display Name'
```

### New Maintainer for CommandLineFu
```sh
mail tech@commandlinefu.com
```

### Backup (archive) your Gmail IMAP folders.
```sh
mailutil transfer {imap.gmail.com/ssl/user=john@gmail.com} Gmail/
```

### Mail text file (/tmp/scream-dump) contents from linux box with subject(scream-dump)
```sh
mail -s scream-dump user@example.com < /tmp/scream-dump
```

### Delete Mailer-Daemon messages
```sh
mailq |awk '/MAILER-DAEMON/{gsub("*","");printf("postsuper -d %s\n",$1)}'|bash
```

### move messages directly from one IMAP inbox to another
```sh
mailutil appenddelete '{src.mailsrv1.com:993/imap/norsh/notls/ssl/novalidate-cert/user="username"}INBOX' '{dest.mailsrv2.com:143/imap/norsh/notls/user="username"}INBOX'
```

### Email HTML content
```sh
mailx bar@foo.com -s "HTML Hello" -a "Content-Type: text/html" < body.htm
```

### Email yourself a quick message
```sh
mailme(){ mailx -s "$@" $USER <<< "$@"; }
```

### delete all DrWeb status, failure and other messages on a postfix server
```sh
mailq | grep DrWEB | awk {'print $1'} | sed s/*//g | postsuper -d -
```

### send an email through linux command line van be achieved by
```sh
mail -s "myip" youremail@domain.com
```

### Count new mail
```sh
mail -H | grep '^.U' | wc -l
```

### send mail over shell as Sender From and utf-8 encoded
```sh
mailx -a "From:myemail@yourmail.com" -a "Content-Type: text/plain; charset=UTF-8" -s "Test mail subject" joy@selekt-berlin.de <<< "Test msg body"
```

### Change the From: address on the fly for email sent from the command-line
```sh
mail -s "subject" user@todomain.com <emailbody.txt   -f customfrom@fromdomain.com -F 'From Display Name'
```

### New Maintainer for CommandLineFu
```sh
mail tech@commandlinefu.com
```

### Backup (archive) your Gmail IMAP folders.
```sh
mailutil transfer {imap.gmail.com/ssl/user=john@gmail.com} Gmail/
```

### move messages directly from one IMAP inbox to another
```sh
mailutil appenddelete '{src.mailsrv1.com:993/imap/norsh/notls/ssl/novalidate-cert/user="username"}INBOX' '{dest.mailsrv2.com:143/imap/norsh/notls/user="username"}INBOX'
```

### Email HTML content
```sh
mailx bar@foo.com -s "HTML Hello" -a "Content-Type: text/html" < body.htm
```

### Email yourself a quick message
```sh
mailme(){ mailx -s "$@" $USER <<< "$@"; }
```

### delete all DrWeb status, failure and other messages on a postfix server
```sh
mailq | grep DrWEB | awk {'print $1'} | sed s/*//g | postsuper -d -
```

### send an email through linux command line van be achieved by
```sh
mail -s "myip" youremail@domain.com
```

### Count new mail
```sh
mail -H | grep '^.U' | wc -l
```
