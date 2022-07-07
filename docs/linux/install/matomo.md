# matomo

### Download Matomo

```sh
wget https://builds.matomo.org/matomo-latest.zip
```

### Once downloaded, extract the archive with unzip.

```sh
mkdir -p /var/www/html/site/
wget https://builds.matomo.org/matomo-latest.zip
unzip matomo-latest.zip -d /var/www/html/site
```

The `-d` option specifies the target directory. 
Matomo web files will be extracted to /var/www/matomo/. 
Then we need to change the owner of this directory to www-data so that the web server can write to this directory.


```sh
chown www-data:www-data /var/www/html/site -R
```

### Create a Database and User in MariaDB

Log into MariaDB database server with the following command.

```sh
mysql
```
### Alternatively, you can also use this command to login.

```sh
mysql
```
### Then create a database for Matomo. This tutorial name the database matomo. You can use whatever name you like.
```sh
create database matomo;
```
### Create the database user. Again, you can use your preferred name for this user. 
### Replace your-password with your preferred password.
```sh
create user wuseman@localhost identified by 'password';
```
### Grant this user all privileges on the matomo database.
```sh
grant all privileges on matomo.* to wuseman@localhost;
```
### Flush privileges and exit.
```sh
flush privileges;
exit;
```
# Step 3: Create Apache or Nginx Configuration File

### If you prefer to use Apache web server, then create a virtual host configuration file in /etc/apache2/sites-available/ directory.
```sh
vim /etc/apache2/sites-available/matomo.conf
```

### Put the following text into the file. 
### Replace w.nr1.nu with your own domain name. Don’t forget to set A record for the domain name in your DNS manager.
```sh
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        ServerName w.nr1.nu
        DocumentRoot /var/www/matomo/

        <Directory /var/www/matomo>
           DirectoryIndex index.php
           Options FollowSymLinks
           AllowOverride All
           Require all granted
        </Directory>

        <Files "console">
           Options None
           Require all denied
        </Files>

        <Directory /var/www/matomo/misc/user>
           Options None
           Require all granted
        </Directory>

        <Directory /var/www/matomo/misc>
           Options None
           Require all denied
        </Directory>

        <Directory /var/www/matomo/vendor>
           Options None
           Require all denied
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/matomo_error.log
        CustomLog ${APACHE_LOG_DIR}/matomo_access.log combined

</VirtualHost>
```

### Save and close the file. Then enable this virtual host.
```sh
a2ensite matomo.conf
```

### Reload Apache web server for the change to take effect.


* OpenRC

```sh
/etc/init.d/apache2 
```

* Systemd


```sh
systemctl reload apache2
```

# Nginx

### If you prefer to use Nginx web server, then create a matomo.conf file in /etc/nginx/conf.d/ directory.
```sh
vim /etc/nginx/conf.d/matomo.conf
```

### Put the following text into the file. Replace w.nr1.nu with your own domain name. 
###    Don’t forget to set A record for the domain name in your DNS manager.

```sh
server {
    listen [::]:80;
    listen 80;
    server_name w.nr1.nu;

    access_log /var/log/nginx/matomo.access.log;
    error_log /var/log/nginx/matomo.error.log;

    root /var/www/matomo/; 
    
    index index.php;
        
    ## only allow accessing the following php files
    location ~ ^/(index|matomo|piwik|js/index).php {
        include snippets/fastcgi-php.conf;
        fastcgi_param HTTP_PROXY ""; # prohibit httpoxy: https://httpoxy.org/
        fastcgi_pass unix:/run/php/php7.4-fpm.sock; 
    }
    
    ## needed for HeatmapSessionRecording plugin
    location = /plugins/HeatmapSessionRecording/configs.php { 
        include snippets/fastcgi-php.conf;
        fastcgi_param HTTP_PROXY "";
        fastcgi_pass unix:/run/php/php7.4-fpm.sock; 
    }
    
    ## deny access to all other .php files
    location ~* ^.+\.php$ {
        deny all;
        return 403;
    }

    ## serve all other files normally 
    location / {
        try_files $uri $uri/ =404;
    }
    
    ## disable all access to the following directories 
    location ~ /(config|tmp|core|lang) {
        deny all;
        return 403; # replace with 404 to not show these directories exist
    }
    location ~ /\.ht {
        deny  all;
        return 403;
    }

    location ~ \.(gif|ico|jpg|png|svg|js|css|htm|html|mp3|mp4|wav|ogg|avi|ttf|eot|woff|woff2|json)$ {
        allow all;
        ## Cache images,CSS,JS and webfonts for an hour
        ## Increasing the duration may improve the load-time, but may cause old files to show after an Matomo upgrade
        expires 1h;
        add_header Pragma public;
        add_header Cache-Control "public";
    }

    location ~ /(libs|vendor|plugins|misc/user) {
        deny all;
        return 403;
    }

    ## properly display textfiles in root directory
    location ~/(.*\.md|LEGALNOTICE|LICENSE) {
        default_type text/plain;
    }
}
```


### Save and close the file. Test Nginx configuration, then reload Nginx for the changes to take effect.

```sh
nginx -t
```

### Install PHP modules required or recommended by Matomo.

```sh
apt install php-imagick php7.4-mysql php7.4-fpm php7.4-common php7.4-gd php7.4-json php7.4-curl  php7.4-zip php7.4-xml php7.4-mbstring php7.4-bz2 php7.4-intl
```

### If you are using Apache web server, you need to reload it to make it run with these PHP modules.
```sh
systemctl reload apache2
```

Nginx users don’t need to reload.
Now you should be able to visit the Matomo web-based install wizard at 
`http://w.nr1.nu`, but before entering any information, let’s enable HTTPS.

## Enable HTTPS

To encrypt the HTTP traffic when you visit the Matomo web interface, 
we can enable HTTPS by installing a free TLS certificate issued from Let’s Encrypt. 
Run the following commands to install Let’s Encrypt client (certbot) on Ubuntu 20.04.

```sh
apt update
apt install certbot
```
### If you use Nginx, you also need to install the Certbot Nginx plugin.

```sh
apt install python3-certbot-nginx
```

### Then run the following command to obtain and install TLS certificate.

```sh
certbot --nginx --agree-tos --redirect --hsts --staple-ocsp --email wuseman@nr1.nu -d w.nr1.nu
```

### If you use Apache, you also need to install the Certbot Apache plugin.

```sh
emerge app-crypt/certbot-apache
apt install python3-certbot-apache
```

### Then run this command to obtain and install TLS certificate.

```sh
certbot --apache --agree-tos --redirect --hsts --staple-ocsp --email you@example.com -d w.nr1.nu
```

### Step 6: Finish the Installation in your Web Browser
```sh
[visit http://localhost/matomo/](https://w.nr1.nu)
```

### Permissions problem

```sh
chown -R wuseman:wuseman /var/www/html/
find /var/www/html/ -type f -exec chmod 644 {} \;
find /var/www/html/ -type d -exec chmod 755 {} \;
find /var/www/html/assets/ -type f -exec chmod 644 {} \;
find /var/www/html/assets/ -type d -exec chmod 755 {} \;
find /var/www/html/cache/ -type f -exec chmod 644 {} \;
find /var/www/html/cache/ -type d -exec chmod 755 {} \;
find /var/www/html/logs/ -type f -exec chmod 644 {} \;
find /var/www/html/logs/ -type d -exec chmod 755 {} \;
find /var/www/html/tcpdf/ -type f -exec chmod 644 {} \;
find /var/www/html/tcpdf/ -type d -exec chmod 755 {} \;
find /var/www/html/templates_c -type f -exec chmod 644 {} \;
find /var/www/html/templates_c -type d -exec chmod 755 {} \;
```

### Install By Copy And Paste

```sh 
mysql -e "drop datababse matomo"
mysql -e "create database matomo;"
mysql -e "create user wuseman@localhost identified by 'odemnn';"
mysql -e "grant all privileges on matomo.* to wuseman@localhost;"
mysql -e "flush privileges;"
wget https://builds.matomo.org/matomo-latest.zip
unzip matomo-latest.zip -d /var/www/html/site
chown wuseman:wuseman /var/www/html/site -R
google-chrome-stable http://localhost/matomo
```

### Add below JS script inside header on your website, edit the setSiteId if needed


```js
<!-- Matomo -->
<script>
  var _paq = window._paq = window._paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//w.nr1.nu/";
    _paq.push(['setTrackerUrl', u+'matomo.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->
```

### End!