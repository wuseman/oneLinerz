# Search with Regex

In the folder you will store all downloads from pastebin uploads you can search for almost anything, let me provide some examples.

##### Facebook Leaks
###### Facebook Passwords are many times uploaded with phone numbers instead of an mail address and there is alot of leaks from east, for find those passwords fast you can try something like below command for a good result:
 
    grep -r -e 'Facebook = [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' -A2

###### _Output From Above Command:_
   
    /emagnet/pastebin/ajfafilename:Email Facebook = 0895xxxxxxxx
    /emagnet/pastebin/ajfafilename-Pass = konxxxxxxxx
    /emagnet/pastebin/ajfafilename:Email Facebook = 0858xxxxxxxx
    /emagnet/pastebin/ajfafilename-Pass = mxxxxxxxx
    /emagnet/pastebin/ajfafilename:Email Facebook = 0895xxxxxxxx
    /emagnet/pastebin/ajfafilename-Pass = taxxxxxxxx
    /emagnet/pastebin/ajfafilename:Email Facebook = 0823xxxxxxxx
    /emagnet/pastebin/ajfafilename-Pass = oxxxxxxxx
    /emagnet/pastebin/ajfafilename:Email Facebook = 0818xxxxxxxx
    /emagnet/pastebin/ajfafilename-Pass = d1xxxxxxxx
 
##### IPV4 Addresses
 
      grep -roE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' . 
 
##### HTTP/HTTPS URLS

######  _Example 1:_
    grep -rEo '(ftp|ftps|http|https)://[^/"]+'

######  _Example 2:_
    grep -Eo "(ftp|ftps|http|https)://[a-zA-Z0-9./?=_-]*" | sort | uniq

###### _Example 3:_
    cat * | tr \" \\n | grep https\*://

###### _Example 4 - > For find urls on darknet, use below command:_

    grep -rEo '.*[.]onion$

######  _Output from the first example from command above_

    filename:https://www.beachcolony.com
    filename:http://java.sun.com
    filename:http://www.w3.org
    filename:https://br1.api.riotgames.com
    filename:https://github.com
    filename:http://openocd.org
    Ddfadfae:https://www.googletagservices.com
    filenamw:https://www.googletagservices.com
    filename:ftp://111.111.111:3200
    filename:http://www.pornbb.org
    filename:http://www.pornbb.org
    filename:http://www.pornbb.org
    .............

##### Find pictures:

    filename:http://imag-some-site-ekle.com/1/0/v6/hiddenimagevywusewman.jpg
    filename:http://images-some-site.com/1/w/4m/hiddenimagevywusewman.jpg
    filename:http://imagessome-sitele.com/1/5/8l/yhiddenimagevywusewman.png
    filename:http://imsome-sitees-brsome-siteacklesome-sitem/1/0/16/hiddenimagevywusewman.jpg

    grep -rioE '(http|https)://(.*).png' # PNG FILES
    grep -rioE '(http|https)://(.*).jpg' # JPG FILES
    egrep -rio 'http.*[.]jpe?g'


##### Find Leaked Passwords:
###### Mostly leaked passwords has been leaked with the following format 'mail@mail.com:passwd', use below command to grab them:

    grep -HiEhr -o -e "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b:...*" | grep '\S'

    hiddenemail_ani@uniroma1.it:hiddenPASS985
    hiddenemail_le@unito.it:hiddenPASSina
    hiddenemail_1969@libero.it:hiddenPASSro60 
    hiddenemail_o.barbarella@unibo.it:hiddenPASSRZ47
    hiddenemail_ritis@ingv.it:hiddenPASScde
    hiddenemail_ia@polito.it:hiddenPASSrmia
    hiddenemail_i@unifi.it:hiddenPASSudal
    hiddenemail_ti@uniba.it:hiddenPASSino
    hiddenemail_one@tin.it:hiddenPASSton
    hiddenemail_olombo11@virgilio.it:hiddenPASSiglio
    hiddenemail_ciwilliam@libero.it:hiddenPASS0780
    hiddenemail_dro.chelli@unipr.it:vhiddenPASSina

### Get a more user friendly output when searching for accounts:

##### 1) First of all, search for all files that contains the word you are looking for, in this example I will search for all _SPOTIFY_ accounts:
   
    find /opt/emagnet/archive/ -type f | parallel -k -j150% -n 1000 -m grep -H -in 'spotify' {}

##### 2) You have probably already figured out that it will be a big mess when I _searching_ for 'spotify' only... So, then I gonna grep all '_MAIL ADDRESSES_' + _'SPOTIFY'_ instead:
    
    grep -rEiEio "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b:...*"

##### 3) I want all details sorted line by line instead of having alot of spaces here and there so we gonna use \S for this:
    
    grep '\S' 

##### 4) I do not care about the filenames anymore since all we want right now is to gather the 'MAIL ADDRESSES' + 'PASSWORDS':
    
    cut -d: -f2,3

##### 5) The guys that leaks all data on pastebin has different forms to separate things, so let us skip all forms that includes 'mail|;/password'/ and instead aim on mail:passwords since that is sitll the most used form, this can easily be filtered later if we want too but to keep this as simple as possible let us start with this form only: 

    awk -F'|' '{print$1}'|cut -d/ -f1

##### 6) Now I want to keep the list sorted also since it will be easier to find the accounts we looking for without some advanced commands for all ppl that have no knowledge about CLI commands so it will be easy to go through the list from a to z:

    sort -r

##### 7) Of course I do not want duplicates since some ppl leaking same credenticals for some accounts twice in different lists:

    awk -F, '!seen[$1]++'

##### 8) If you want all accounts & password in a separate file you can use >> in bash to write data into files. If you want separate the details with , instead of : or whatever character you want to use if you want to import a list into your own sql/mysql database you can use sed for this purpose:

    commands here from above | _sed 's/:/,/g'_ > leaked-spotify-accounts-20190401_to_20190405.txt 

##### All above commands in a one-liner, try to copy paste it when you have fetched some uploads. Change 'spotify' to whatever you wanna find, gmail, paypal, facebook, twitter etc etc etc etc..

    find /opt/emagnet/archive/ -type f | parallel -k -j150% -n 1000 -m grep -H -in 'spotify' {} | grep -rEiEio "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b:...*"|grep '\S' | cut -d: -f2,3|awk -F'|' '{print$1}'|cut -d/ -f1|sort -r|less|awk -F, '!seen[$1]++' > leaked-spotify-accounts-20190401_to_20190405.txt 
    
