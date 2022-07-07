# mysql

### Dump a MySQL-Database to another Database
```sh
mysqldump force -uUSER -pPASS PRODUCTION_DB | mysql -uUSER -pPASS COPY_DB
```

### Convert mysql database from latin1 to utf8
```sh
mysqldump add-drop-table -uroot -p "DB_name"  | replace CHARSET=latin1 CHARSET=utf8 | iconv -f latin1 -t utf8 | mysql -uroot -p "DB_name"
```

### show mysql process ids
```sh
mysql -s -e "show processlist" |awk '{print $1}'
```

### raw MySQL output to use in pipes
```sh
mysql DATABASE -N -s -r -e 'SQL COMMAND'
```

### Get column names in MySQL
```sh
mysql -u <user> password=<password> -e "SHOW COLUMNS FROM <table>" <database> | awk '{print $1}' | tr "\n" "," | sed 's/,$//g'
```

### command line to drop all table from a databse
```sh
mysql -u uname dbname -e "show tables" | grep -v Tables_in | grep -v "+" | gawk '{print "drop table " $1 ";"}' | mysql -u uname dbname
```

### Count the number of queries to a MySQL server
```sh
mysql -uUser -pPassword -N -s -r -e 'SHOW PROCESSLIST' | grep -cv "SHOW PROCESSLIST"
```

### import database
```sh
mysql>use DBNAME;  mysql>source FILENAME
```

### Create a mysql database from the command line
```sh
mysqladmin -u username -p create dbname
```

### See where MySQL is looking for its config files
```sh
mysql -? | grep ".cnf"
```

### Copy a MySQL Database to a new Server via SSH with one command
```sh
mysqldump add-drop-table extended-insert force log-error=error.log -uUSER -pPASS OLD_DB_NAME | ssh -C user@newhost "mysql -uUSER -pPASS NEW_DB_NAME"
```

### Display the number of connections to a MySQL Database
```sh
mysql -u root -p -BNe "select host,count(host) from processlist group by host;" information_schema
```

### Backup all MySQL Databases to individual files
```sh
mysql -e 'show databases' | sed -n '2,$p' | xargs -I DB 'mysqldump DB > DB.sql'
```

### backup local MySQL database into a folder and removes older then 5 days backups
```sh
mysqldump -uUSERNAME -pPASSWORD database | gzip > /path/to/db/files/db-backup-`date +%Y-%m-%d`.sql.gz ;find /path/to/db/files/* -mtime +5 -exec rm {} \;
```

### Create MySQL-Dump, copy db to other Server and upload the db.
```sh
mysqldump -uUserName -pPassword tudb | ssh root@rootsvr.com "mysql -uUserName -pPassword -h mysql.rootsvr.com YourDBName"
```

### dump a single table of a database to file
```sh
mysqldump -u UNAME -p DBNAME TABLENAME> FILENAME
```

### Show all usernames and passwords for Plesk email addresses
```sh
mysql -uadmin -p` cat /etc/psa/.psa.shadow` -Dpsa -e"select mail_name,name,password from mail left join domains on mail.dom_id = domains.id inner join accounts where mail.account_id = accounts.id;"
```

### Pulls email password out of Plesk database for given email address.
```sh
mysql -uadmin -p`cat /etc/psa/.psa.shadow` -e "use psa; select accounts.password FROM accounts JOIN mail ON accounts.id=mail.account_id WHERE mail.mail_name='webmaster';"
```

### Mysql extended status
```sh
mysqladmin -u root -p extended-status
```

### Mysql uptime
```sh
mysql -e"SHOW STATUS LIKE '%uptime%'"|awk '/ptime/{ calc = $NF / 3600;print $(NF-1), calc"Hour" }'
```

### Drop all tables from a database, without deleting it
```sh
mysqldump -u $USER password=$PASSWORD  add-drop-table no-data "$DATABASE" | grep ^DROP | mysql -u $USER password=$PASSWORD "$DATABASE"
```

### Create a backup copy of a MySQL database on the same host
```sh
mysqldump OLD_DB | cat <(echo "CREATE DATABASE NEW_DB; USE NEW_DB;") - | mysql
```

### Analyze, check, auto-repair and optimize Mysql Database
```sh
mysqlcheck -a auto-repair -c -o -uroot -p [DB]
```

### Convert all MySQL tables and fields to UTF8
```sh
mysql database=dbname -B -N -e "SHOW TABLES"  | awk '{print "ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"}' | mysql database=dbname &
```

### Execute MySQL query send results from stdout to CSV
```sh
mysql -umysqlusername -pmysqlpass databsename -B -e "select * from \`tabalename\`;" | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > mysql_exported_table.csv
```

### command line to optimize all table from a mysql database
```sh
mysql -u uname dbname -e "show tables" | grep -v Tables_in | grep -v "+" | gawk '{print "optimize table " $1 ";"}' | mysql -u uname dbname
```

### Get a list of the top 10 heaviest tables in your mysql database - useful for performance diagnostics
```sh
mysql database=information_schema -u <user> -p -e "SELECT TABLE_NAME, TABLE_SCHEMA, SUM(DATA_LENGTH + INDEX_LENGTH)/1024/1024 mb FROM TABLES GROUP BY TABLE_NAME ORDER BY mb DESC LIMIT 10"
```

### mysql DB size
```sh
mysql -u root -pPasswort -e 'select table_schema,round(sum(data_length+index_length)/1024/1024,4) from information_schema.tables group by table_schema;'
```

### how to export a table in .csv file
```sh
mysql -u[username] -p[password] [nome_database] -B -e "SELECT * FROM [table] INTO OUTFILE '/tmp/ca.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
```

### Get table column names from an MySQL-database in comma-seperated form
```sh
mysql -u<user> -p<password> -s -e 'DESCRIBE <table>' <database>  | tail -n +1 | awk '{ printf($1",")}' |  head -c -1
```

### Dump and bz2compress a mysql db
```sh
mysqldump -u user -h host -ppwd -B dbname | bzip2 -zc9 > dbname.sql.bz2
```

### Change MySQL Pager For Nicer Output
```sh
mysql pager="less -niSFX"
```

### Calculating number of Connection to MySQL
```sh
mysql -NBe 'show global status like "Threads_connected";' | cut -f2
```

### Dump mySQL db from Remote Database to Local Database
```sh
mysqldump host=[remote host] user=[remote user] password=[remote password] -C db_name | mysql host=localhost user=[local user] password=[local password] db_name
```

### Show database sql schema from Remote or Local database
```sh
mysqldump -u<dbusername>  -p<dbpassword> <databasename>  no-data tables
```

### mysql bin log events per minute
```sh
mysqlbinlog <logfiles> | grep exec | grep end_log_pos | cut -d' ' -f2- | cut -d: -f-2 | uniq -c
```

### get a mysqldump with a timestamp in the filename and gzip it all in one go
```sh
mysqldump [options] |gzip ->mysqldump-$(date +%Y-%m-%d-%H.%M.%S).gz
```

### Export a subset of a database
```sh
mysqldump where="true LIMIT X" databasename > output.sql
```

### How to extract 5000 records from each table in MySQL
```sh
mysqldump opt where="true LIMIT 5000" dbinproduzione > miodbditest.sql
```

### Remote mysql dump all databases with ssh
```sh
mysqldump -u user -p all-databases | ssh user@host dd of=/opt/all-databases.dump
```

### dump the whole database
```sh
mysqldump -u UNAME -p DBNAME > FILENAME
```

### dump the whole database
```sh
mysqldump lock-tables opt DBNAME -u UNAME password=PASS | gzip > OUTFILE
```

### Backup all MySQL Databases to individual files
```sh
mysql -e 'show databases' -s skip-column-names | egrep -v "^(test|mysql|performance_schema|information_schema)$" | parallel gnu "mysqldump routines {} > {}_daily.sql"
```

### Export mysql database to another database without having to save the output first
```sh
mysqldump -u<username> -p<password> -h<source database host> databasename table1 table2 table_n | mysql -u<user> -p<password> -h<destination database host> databasename
```

### mysqlbinlog headers sorted by event time
```sh
mysqlbinlog <logfiles> | grep exec | grep end_log_pos | grep -v exec_time=0 | sed 's/^\(.*exec_time=\([0-9]\+\).*\)/\2 - \1 /' | sort -n
```

### do replication and sql backup
```sh
mysqldump -pyourpass single-transaction  master-data=2 -q  flush-logs databases db_for_doslave |tee /home/db_bak.sql |ssh mysqladmin@slave.db.com "mysql"
```

### Back up only databases matching PATTERN
```sh
mysqldump -eBv `echo "show databases like 'MYSQL_PATTERN'"|mysql -N`> OUTPUTFILE
```

### mysql: Convert MyISAM tables to InnoDB via mysqldump
```sh
mysqldump | sed -e 's/^) ENGINE=MyISAM/) ENGINE=InnoDB/'
```

### Repair MySQL db
```sh
mysqlcheck -r -u Admin -p all-databases
```

### command line to optimize all table from a mysql database
```sh
mysqlcheck -op -u<user> <db>
```

### MySQL: Slice out a specific table from a specific database (assumes existence of the USE statement) from output of mysqldump
```sh
mysqldump | sed -n "/^USE \`employees\`/,/^USE \`/p" | sed -n "/^ Table structure for table \`departments\`/,/^ Table structure for table/p"
```

### Dump MySql to File
```sh
mysqldump opt -uUSERNAME -pPASSWORD -h mysql.host.com database > ~/filename.sql
```

### get mysql full processlist from commadline
```sh
mysqladmin -u user -ppassword verbose  processlist sleep 1
```

### Run query on remote database and output results as csv
```sh
mysql -u[user] -p[password] -h [hostname] -D [database] -ss -e "select * from mysql_tbl " | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > dump.csv
```

### Exporting all MySQL user privileges
```sh
mysql -u{user} -p{password} -Ne "select distinct concat( \"SHOW GRANTS FOR '\",user,\"'@'\",host,\"';\" ) from user;" mysql | mysql -u {user} -p{password} | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
```

### Exclude dumping of specific tables with same prefix from  a single database
```sh
mysql -uuser -ppass -e 'use information_schema; SELECT table_name FROM tables where table_schema="DB-NAME" and table_name NOT LIKE "PREFIX";' | grep -v table_name | xargs mysqldump DB-NAME -uuser -ppass > dump.sql
```

### mysql login as privileged user on multiple machines with differend mysql root password
```sh
mysql defaults-file=/etc/mysql/debian.cnf
```

### Monitor MySQL threads per user
```sh
mysql -BNe "SELECT user,COUNT(user) AS count FROM processlist GROUP BY user ORDER BY count;" information_schema
```

### Monitor MySQL threads per user
```sh
mysql -BNe "SELECT user,COUNT(user) AS count FROM processlist GROUP BY user ORDER BY count;" information_schema
```

### Kill all threads from a MySQL user
```sh
mysql -BNe "SELECT id FROM processlist WHERE user = 'redmine';" information_schema | while read id; do mysqladmin kill $id; done
```

### backup with mysqldump a really big mysql database to a remote machine over ssh
```sh
mysqldump -q skip-opt force log-error=dbname_error.log -uroot -pmysqlpassword dbname | ssh -C user@sshserver 'cd /path/to/backup/dir; cat > dbname.sql'
```

### Backup a whole database to a file
```sh
mysqldump -p MYDB > MYDB.sql
```

### Pulls FTP password out of Plesk database.
```sh
mysql -uadmin -p`cat /etc/psa/.psa.shadow` -e "use psa; select accounts.password from accounts INNER JOIN sys_users ON   accounts.id=sys_users.account_id WHERE sys_users.login='xxxx';"
```

### Calculating number of Connection to MySQL
```sh
mysql -u root -p -e"show processlist;"|awk '{print $3}'|awk -F":" '{print $1}'|sort|uniq -c
```

### Calculating number of Connection to MySQL
```sh
mysql -u root -p -N -e"show processlist\G;" | egrep "Host\:" | awk -F: '{ print $2 }' | sort | uniq -c
```

### Convert mysql database from latin1 to utf8
```sh
mysqldump add-drop-table -uroot -p "DB_name"  | replace CHARSET=latin1 CHARSET=utf8 | iconv -f latin1 -t utf8 | mysql -uroot -p "DB_name"
```

### raw MySQL output to use in pipes
```sh
mysql DATABASE -N -s -r -e 'SQL COMMAND'
```

### Copy a MySQL Database to a new Server via SSH with one command
```sh
mysqldump add-drop-table extended-insert force log-error=error.log -uUSER -pPASS OLD_DB_NAME | ssh -C user@newhost "mysql -uUSER -pPASS NEW_DB_NAME"
```

### Display the number of connections to a MySQL Database
```sh
mysql -u root -p -BNe "select host,count(host) from processlist group by host;" information_schema
```

### Backup all MySQL Databases to individual files
```sh
mysql -e 'show databases' | sed -n '2,$p' | xargs -I DB 'mysqldump DB > DB.sql'
```

### backup local MySQL database into a folder and removes older then 5 days backups
```sh
mysqldump -uUSERNAME -pPASSWORD database | gzip > /path/to/db/files/db-backup-`date +%Y-%m-%d`.sql.gz ;find /path/to/db/files/* -mtime +5 -exec rm {} \;
```

### Create MySQL-Dump, copy db to other Server and upload the db.
```sh
mysqldump -uUserName -pPassword tudb | ssh root@rootsvr.com "mysql -uUserName -pPassword -h mysql.rootsvr.com YourDBName"
```

### dump a single table of a database to file
```sh
mysqldump -u UNAME -p DBNAME TABLENAME> FILENAME
```

### Show all usernames and passwords for Plesk email addresses
```sh
mysql -uadmin -p` cat /etc/psa/.psa.shadow` -Dpsa -e"select mail_name,name,password from mail left join domains on mail.dom_id = domains.id inner join accounts where mail.account_id = accounts.id;"
```

### Pulls email password out of Plesk database for given email address.
```sh
mysql -uadmin -p`cat /etc/psa/.psa.shadow` -e "use psa; select accounts.password FROM accounts JOIN mail ON accounts.id=mail.account_id WHERE mail.mail_name='webmaster';"
```

### Mysql extended status
```sh
mysqladmin -u root -p extended-status
```

### Mysql uptime
```sh
mysql -e"SHOW STATUS LIKE '%uptime%'"|awk '/ptime/{ calc = $NF / 3600;print $(NF-1), calc"Hour" }'
```

### Drop all tables from a database, without deleting it
```sh
mysqldump -u $USER password=$PASSWORD  add-drop-table no-data "$DATABASE" | grep ^DROP | mysql -u $USER password=$PASSWORD "$DATABASE"
```

### Create a backup copy of a MySQL database on the same host
```sh
mysqldump OLD_DB | cat <(echo "CREATE DATABASE NEW_DB; USE NEW_DB;") - | mysql
```

### Analyze, check, auto-repair and optimize Mysql Database
```sh
mysqlcheck -a auto-repair -c -o -uroot -p [DB]
```

### Convert all MySQL tables and fields to UTF8
```sh
mysql database=dbname -B -N -e "SHOW TABLES"  | awk '{print "ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"}' | mysql database=dbname &
```

### Execute MySQL query send results from stdout to CSV
```sh
mysql -umysqlusername -pmysqlpass databsename -B -e "select * from \`tabalename\`;" | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > mysql_exported_table.csv
```

### command line to optimize all table from a mysql database
```sh
mysql -u uname dbname -e "show tables" | grep -v Tables_in | grep -v "+" | gawk '{print "optimize table " $1 ";"}' | mysql -u uname dbname
```

### Get a list of the top 10 heaviest tables in your mysql database - useful for performance diagnostics
```sh
mysql database=information_schema -u <user> -p -e "SELECT TABLE_NAME, TABLE_SCHEMA, SUM(DATA_LENGTH + INDEX_LENGTH)/1024/1024 mb FROM TABLES GROUP BY TABLE_NAME ORDER BY mb DESC LIMIT 10"
```

### mysql DB size
```sh
mysql -u root -pPasswort -e 'select table_schema,round(sum(data_length+index_length)/1024/1024,4) from information_schema.tables group by table_schema;'
```

### how to export a table in .csv file
```sh
mysql -u[username] -p[password] [nome_database] -B -e "SELECT * FROM [table] INTO OUTFILE '/tmp/ca.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
```

### Get table column names from an MySQL-database in comma-seperated form
```sh
mysql -u<user> -p<password> -s -e 'DESCRIBE <table>' <database>  | tail -n +1 | awk '{ printf($1",")}' |  head -c -1
```

### Dump and bz2compress a mysql db
```sh
mysqldump -u user -h host -ppwd -B dbname | bzip2 -zc9 > dbname.sql.bz2
```

### Change MySQL Pager For Nicer Output
```sh
mysql pager="less -niSFX"
```

### Calculating number of Connection to MySQL
```sh
mysql -NBe 'show global status like "Threads_connected";' | cut -f2
```

### Dump mySQL db from Remote Database to Local Database
```sh
mysqldump host=[remote host] user=[remote user] password=[remote password] -C db_name | mysql host=localhost user=[local user] password=[local password] db_name
```

### Show database sql schema from Remote or Local database
```sh
mysqldump -u<dbusername>  -p<dbpassword> <databasename>  no-data tables
```

### mysql bin log events per minute
```sh
mysqlbinlog <logfiles> | grep exec | grep end_log_pos | cut -d' ' -f2- | cut -d: -f-2 | uniq -c
```

### get a mysqldump with a timestamp in the filename and gzip it all in one go
```sh
mysqldump [options] |gzip ->mysqldump-$(date +%Y-%m-%d-%H.%M.%S).gz
```

### Export a subset of a database
```sh
mysqldump where="true LIMIT X" databasename > output.sql
```

### How to extract 5000 records from each table in MySQL
```sh
mysqldump opt where="true LIMIT 5000" dbinproduzione > miodbditest.sql
```

### Remote mysql dump all databases with ssh
```sh
mysqldump -u user -p all-databases | ssh user@host dd of=/opt/all-databases.dump
```

### dump the whole database
```sh
mysqldump -u UNAME -p DBNAME > FILENAME
```

### dump the whole database
```sh
mysqldump lock-tables opt DBNAME -u UNAME password=PASS | gzip > OUTFILE
```

### Backup all MySQL Databases to individual files
```sh
mysql -e 'show databases' -s skip-column-names | egrep -v "^(test|mysql|performance_schema|information_schema)$" | parallel gnu "mysqldump routines {} > {}_daily.sql"
```

### Export mysql database to another database without having to save the output first
```sh
mysqldump -u<username> -p<password> -h<source database host> databasename table1 table2 table_n | mysql -u<user> -p<password> -h<destination database host> databasename
```

### mysqlbinlog headers sorted by event time
```sh
mysqlbinlog <logfiles> | grep exec | grep end_log_pos | grep -v exec_time=0 | sed 's/^\(.*exec_time=\([0-9]\+\).*\)/\2 - \1 /' | sort -n
```

### do replication and sql backup
```sh
mysqldump -pyourpass single-transaction  master-data=2 -q  flush-logs databases db_for_doslave |tee /home/db_bak.sql |ssh mysqladmin@slave.db.com "mysql"
```

### Back up only databases matching PATTERN
```sh
mysqldump -eBv `echo "show databases like 'MYSQL_PATTERN'"|mysql -N`> OUTPUTFILE
```

### mysql: Convert MyISAM tables to InnoDB via mysqldump
```sh
mysqldump | sed -e 's/^) ENGINE=MyISAM/) ENGINE=InnoDB/'
```

### Repair MySQL db
```sh
mysqlcheck -r -u Admin -p all-databases
```

### command line to optimize all table from a mysql database
```sh
mysqlcheck -op -u<user> <db>
```

### MySQL: Slice out a specific table from a specific database (assumes existence of the USE statement) from output of mysqldump
```sh
mysqldump | sed -n "/^USE \`employees\`/,/^USE \`/p" | sed -n "/^ Table structure for table \`departments\`/,/^ Table structure for table/p"
```

### Dump MySql to File
```sh
mysqldump opt -uUSERNAME -pPASSWORD -h mysql.host.com database > ~/filename.sql
```

### get mysql full processlist from commadline
```sh
mysqladmin -u user -ppassword verbose  processlist sleep 1
```

### Run query on remote database and output results as csv
```sh
mysql -u[user] -p[password] -h [hostname] -D [database] -ss -e "select * from mysql_tbl " | sed 's/\t/","/g;s/^/"/;s/$/"/;s/\n//g' > dump.csv
```

### Exporting all MySQL user privileges
```sh
mysql -u{user} -p{password} -Ne "select distinct concat( \"SHOW GRANTS FOR '\",user,\"'@'\",host,\"';\" ) from user;" mysql | mysql -u {user} -p{password} | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
```

### Exclude dumping of specific tables with same prefix from  a single database
```sh
mysql -uuser -ppass -e 'use information_schema; SELECT table_name FROM tables where table_schema="DB-NAME" and table_name NOT LIKE "PREFIX";' | grep -v table_name | xargs mysqldump DB-NAME -uuser -ppass > dump.sql
```

### mysql login as privileged user on multiple machines with differend mysql root password
```sh
mysql defaults-file=/etc/mysql/debian.cnf
```

### Monitor MySQL threads per user
```sh
mysql -BNe "SELECT user,COUNT(user) AS count FROM processlist GROUP BY user ORDER BY count;" information_schema
```

### backup with mysqldump a really big mysql database to a remote machine over ssh
```sh
mysqldump -q skip-opt force log-error=dbname_error.log -uroot -pmysqlpassword dbname | ssh -C user@sshserver 'cd /path/to/backup/dir; cat > dbname.sql'
```
