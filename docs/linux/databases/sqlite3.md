# sqlite 3

##### Display sqlite results one column per line
```sh
sqlite3 -line database.db
```

##### Return Dropbox folder location.
```sh
sqlite3 $HOME/.dropbox/config.db "select value from config where key like '%dropbox_path%'"
```

##### Get your Firefox history
```sh
sqlite3 ~/.mozilla/firefox/*.[dD]efault/places.sqlite "SELECT strftime('%d.%m.%Y %H:%M:%S', visit_date/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_historyvisits WHERE moz_places.id = moz_historyvisits.place_id ORDER BY visit_date;"
```

##### sqlite3 cmd to extract Firefox bookmarks from places.sqlite
```
```sh
sqlite3 ~/.mozilla/firefox/*default/places.sqlite "select a.url, a.title from moz_places a, moz_bookmarks b where a.id=b.fk and b.parent=2;"
```

##### Get your Firefox bookmarks
```sh
sqlite3 ~/.mozilla/firefox/*.[dD]efault/places.sqlite "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"
```

##### change dinosaur poop into gold
```sh
sqlite3  -list /home/$USER/.mozilla/firefox/*.default/places.sqlite 'select url from moz_places ;' | grep http
```

##### Create sqlite db and store image
```sh
sqlite3 img.db "create table imgs (id INTEGER PRIMARY KEY, img BLOB); insert into imgs (img) values (\"$(base64 -w0 /tmp/Q.jpg)\"); select img from imgs where id=1;" | base64 -d -w0 > /tmp/W.jpg
```

##### Extract your list of blocked images hosts from Firefox database
```sh
sqlite3 -noheader -list ~/.mozilla/firefox/<your_profile>/permissions.sqlite "select host from moz_hosts where type='image' and permission=2"
```

##### Speed up launch of liferea
```sh
sqlite3 ~/.liferea_1.4/liferea.db 'VACUUM;'
```

##### Dump your Thunderbird Lightning todo list in CSV format
```sh
sqlite3 -csv ~/.thunderbird/*.default/calendar-data/local.sqlite "SELECT CASE WHEN priority IS NULL THEN 5 ELSE priority END AS priority, title FROM cal_todos WHERE ical_status IS NULL ORDER BY priority ASC, last_modified DESC;"
```

##### clear stale favicons in firefox
```sh
sqlite3 .mozilla/firefox/private/places.sqlite "update moz_places set favicon_id=null where favicon_id = (select p.favicon_id from moz_bookmarks b join moz_places p on b.fk = p.id where b.title = 'Broken');"
```

##### Transfer sqlite3 data to mysql
```
```sh
sqlite3 mydb.sqlite3 '.dump' | grep -vE '^(BEGIN|COMMIT|CREATE|DELETE)|"sqlite_sequence"' | sed -r 's/"([^"]+)"/`\1`/' | tee mydb.sql | mysql -p mydb
```

##### Get your Firefox history
```sh
sqlite3 ~/.mozilla/firefox/*.[dD]efault/places.sqlite "SELECT strftime('%d.%m.%Y %H:%M:%S', visit_date/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_historyvisits WHERE moz_places.id = moz_historyvisits.place_id ORDER BY visit_date;"
```

##### sqlite3 cmd to extract Firefox bookmarks from places.sqlite
```
```sh
sqlite3 ~/.mozilla/firefox/*default/places.sqlite "select a.url, a.title from moz_places a, moz_bookmarks b where a.id=b.fk and b.parent=2;"
```

##### Get your Firefox bookmarks
```sh
sqlite3 ~/.mozilla/firefox/*.[dD]efault/places.sqlite "SELECT strftime('%d.%m.%Y %H:%M:%S', dateAdded/1000000, 'unixepoch', 'localtime'),url FROM moz_places, moz_bookmarks WHERE moz_places.id = moz_bookmarks.fk ORDER BY dateAdded;"
```

##### change dinosaur poop into gold
```sh
sqlite3  -list /home/$USER/.mozilla/firefox/*.default/places.sqlite 'select url from moz_places ;' | grep http
```

##### Create sqlite db and store image
```sh
sqlite3 img.db "create table imgs (id INTEGER PRIMARY KEY, img BLOB); insert into imgs (img) values (\"$(base64 -w0 /tmp/Q.jpg)\"); select img from imgs where id=1;" | base64 -d -w0 > /tmp/W.jpg
```

##### Extract your list of blocked images hosts from Firefox database
```sh
sqlite3 -noheader -list ~/.mozilla/firefox/<your_profile>/permissions.sqlite "select host from moz_hosts where type='image' and permission=2"
```

##### Speed up launch of liferea
```sh
sqlite3 ~/.liferea_1.4/liferea.db 'VACUUM;'
```

##### Dump your Thunderbird Lightning todo list in CSV format
```sh
sqlite3 -csv ~/.thunderbird/*.default/calendar-data/local.sqlite "SELECT CASE WHEN priority IS NULL THEN 5 ELSE priority END AS priority, title FROM cal_todos WHERE ical_status IS NULL ORDER BY priority ASC, last_modified DESC;"
```

##### clear stale favicons in firefox
```sh
sqlite3 .mozilla/firefox/private/places.sqlite "update moz_places set favicon_id=null where favicon_id = (select p.favicon_id from moz_bookmarks b join moz_places p on b.fk = p.id where b.title = 'Broken');"
```

##### Transfer sqlite3 data to mysql
```
```sh
sqlite3 mydb.sqlite3 '.dump' | grep -vE '^(BEGIN|COMMIT|CREATE|DELETE)|"sqlite_sequence"' | sed -r 's/"([^"]+)"/`\1`/' | tee mydb.sql | mysql -p mydb
```
