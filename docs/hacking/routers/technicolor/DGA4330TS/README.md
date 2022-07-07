 
# Technicolor DGA4330TS

### Welcome DGA4330TS to my collections of Telia devices 

- I now have all the units they have delivered to customers :) 

### A small part of my collection

![welcome](https://user-images.githubusercontent.com/26827453/174461781-d22c00e8-c348-48c8-98e7-a5587b6ec417.jpg)

Well, let us keep topic @DGA4330TS

### Technicolor DGA4330TS

![12](https://user-images.githubusercontent.com/26827453/174461794-99295c73-a4a8-4863-bcac-b60405b98637.jpg)

### Board, overview

![VBNT-7](https://user-images.githubusercontent.com/26827453/174461802-128d9995-025a-43cc-b1b8-50a49734e60d.png)

### Board (Serial Console Pins)

Boot log will be uploaded later

- Black = GND
- Green = TRX

![serial_console](https://user-images.githubusercontent.com/26827453/174461804-6a0bbd77-4c19-411f-b878-52645964a203.jpg)

### `Intro`

Never let the fear of striking out keep you from playing the game. New Device, New Firmware I will spend exactly as many hours as it takes to access the source code you refuse to share, you are violating the GPL v1,2 and 3 and since you wont share I will spend as many days it is needed to get what what I asked for in 14 months now. TeliaCompany is partly owned by the Swedish state and they do this, it's bad but who cares, if they dont I dont.

I have recently received the router and have not had time to check so much so I will update this repot often in the near future.
I have not managed to get SSH access (** yet **) and there is basically no information about the router or its board anywhere so I share what I have found and we will help find a way to root, cool? :)

The router runs newer firmware than all previous Technicolor TG * models, these are upgraded up to today's date even and they have done very well when they tried to keep us without info but after another hacking race (70-75h just sitting here and trying to get some fucking root without sleep) I found some intresting things and maybe its sueful for anyone who is motivated to get root access asap, but remember - I do all this 100% for free without donations or money or anything that involves cash the only I asking for is for sharing knowledge, if you find anything useful or got root access, please let me (us) know or if you have any other questions just open an issue and we can discuss stuff togheter (please dont send email, we are a community, right?), k, thx? This is what I found so far, the repo will be updated and will be sorted with time so sorry if the readme is a bit messy but I share what may be of interest for you(others)

___

### Main Card (gateway.lp)

![Screenshot](https://i.imgur.com/aPPlaGO.png)

Since there is **NO** info online about this board I thought it would be impossible to find the rbi files especially when they are locked out /modals/logviewer-modal.lp and you wont get access to it anymore as before, and we have no tcpdump modal in this router.

The router has a setup like Sagemcom F@st 5370 (ya, that **sucks**, for us!) - An lxc enviroment, the default gateway ip for DGA4330TS is:

    192.168.1.1 
  
  Telia X2 (LXC) is available on:
  
    192.168.1.154
  
Surprised? How could you miss that? Nah, thats not so wierd since it is hidden - You wont find this connection in the webui, you wont find it in an arp scan neither tbh and neither an localnetwork scan. No bullshit, open a shell and ping '192.168.1.154' and you will see that something is running on on this ip and yeah, thats the chroot container that is up-n-running, when you 

___

## VBNT-7

![Screenshot](https://i.imgur.com/jKTsh9G.png)

  DGA4330TS board is VBNT-7 (no public firmware for this has been found as mentioned)
  
- Well, we jump to what info I have found and can share that I have not found elsewhere so hopefully it might help someone who helps me who helps everyone ;)

Two releases has been released for this firmware and board: 

     * 2019 - 18.3.0357-2981033-20190820161731
     * 2021 - 18.3.0710-2981008-20210218193114 (Current: 2021-12-19)
     
 And now to the good part, I found the firmware for latest version and it is available for everyone online and there is no requirements for download the firmware from their fucking slow vlan server so, go download the firmware if you feel for it until they remove them (if they reading this) 
 
     * From VLAN (default         ).............: http://131.116.22.230:80/1830710-7-2981008.rbi
     * From NET  (I found this one).............: https://rgw.teliacompany.com:7547/1830710-7-2981008.rbi
 
- I have no clue why they not using this URL, the default one is set in TSBoot.jar ^

Some random output were I found there is a /dev/mtd7 partition and there is only one bank installed, it is possible to failsafe boot this router but it wont boot another bank it will enter TFTP mode instead after 4 restarts:

```text
nscommon.c;nsReceiveResponseFromND();549--->Negative response: RCODE: 3
nscommon.c;nsReceiveResponseFromND();549--->Negative response: RCODE: 3
nssessio.c;nsRegisterName();555--->ND failed to register the name
ssessio.c;nsBindNetBios();681---> Name Registration Failed
nscommon.c;createCommonDatagramSocket();402--->Can't bind to port
nscommon.c;nsInit();252--->Unable to create the common datagram socket
nscommon.c;nsReceiveResponseFromND();549--->Negative response: RCODE: 3
nscommon.c;nsReceiveResponseFromND();549--->Negative response: RCODE: 3
nssessio.c;nsRegisterName();555--->ND failed to register the name
nssessio.c;nsBindNetBios();681---> Name Registration Failed
nscommon.c;createCommonDatagramSocket();402--->Can't bind to port
nscommon.c;nsInit();252--->Unable to create the common datagram socket
;nsReceiveResponseFromND();549--->Negative response: RCODE: 3
Snscommon.c;ending event FaultMgmt.Event
Connecting to server
external IP address is 192.168.1.211
Connected to server, starting transaction.
external IP address is 192.168.1.211
Sending event FaultMgmt.Event
Empty Post
Instance **lxc::lxc_ee** pid 9386 not stopped on **SIGTERM**, sending **SIGKILL** instead
port 7(veth1MB275) entered disabled state
device veth1MB275 left promiscuous mode
port 7(veth1MB275) entered disabled state
nscommon.c;nsInit();252--->Unable to create the common datagram socket
DHCPACK(br-lan) 192.168.1.153 22:b0:01:e2:45:6f TeliaLXC
W unlink("//var/run/lcm_ipc_lxc_ee/ubus.sock"): No such file or directory
Instance lxc::lxc_ee pid 9468 not stopped on SIGTERM, sending SIGKILL instead
unlink("**//var/run/lcm_ipc_lxc_ee/ubus.sock**"): No such file or directory
DHCPACK(br-lan) 192.168.1.153 **TeliaLXC**
exiting on signal 15
Instance lxc::lxc_ee pid 7585 not stopped on SIGTERM, sending SIGKILL instead
/etc/rc.d/K11lxc.mount: Unlocking **/dev/mtd7** ...
/etc/rc.d/K11lxc.mount: Erasing **/dev/mtd7** ...
lxc_ee_ubp[9730]: exiting on signal 15
lxc_ee_ubp[9730]: halt
```

And after this I never was able to get into this state again, ahwell, lets continue:

Of course, I have tried to export config since that is possible on the old routers (lol) without being admin or engineer or in telia role but they have covererd this also in the last upgrade so there is not even possible to export anything but since upgradfw is possible then we can upload files of course and I have tried that also of course but without any success and got a 401 error: 

**401 Authorization Required**
       
```sh
#!/bin/bash

SRC_URL="http://192.168.1.1/modals/"
SRC_MAIN="http://192.168.1.1/gateway.lp"
SRC_MODAL="gateway-modal.lp?action"
SRC_TOKEN=$(curl -sL --insecure 'https://192.168.10.1/login.lp?action=getcsrf)
SRC_SESSION=$(curl -sL --insecure 'https://192.168.10.1/login.lp?action=getcsrf -v 2>&1|grep -E 'sessionID'|cut -d'=' -f2|cut -d';' -f1)
FW_LENGTH=""24290177"

curl "http://${SRC_URL}/${SRC_MODAL}=upgradefw" \
    -X 'POST' \
    -H 'Connection: keep-alive' \
    -H "Content-Length: ${FW_LENGTH}" \
    -H 'Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryaXgsI290qEt5B0Xf' \
    -H 'User-Agent: KreaTVWebKit/600 (Motorola STB Arris Motorola v; Fuckign Bl3ckH4ts, st0p pl4nt b4kdoors,;  Linux; 5305; F0ck Ur-Sysl0g-ASsh0les / v1.0)' \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
    -H "Referer: ${SRC_MAIN}" \
    -H 'Cookie: sessionID=${SRC_SESSION}' --compressed
```

* Respons: 

```html
<html>
<head><title>401 Authorization Required</title></head>
<body bgcolor="white">
<center><h1>401 Authorization Required</h1></center>
<hr><center>nginx</center>
</body>
</html>**
```

If we change the action from upgradefw -> banksize we get a positive response: 

```json
{
  "success": "true",
  "banksize": "48627712"
}
```

But this is interesting and wierd imo -  I also tried file-upgradwfw in developer console and I got the response below and this is how I found the firmware name, I didnt include anything more then the val line - Please notise the last 2 digits (*12*) - I wasnt able to find this firmware and I think its just a fake name or something, whatever then I created then telia-firmware script that can be found [here](https://github.com/wuseman/telia-bruteforce) - 

**NOTICE** - *I never used this script personally I just created the script for a friend so dont blame me for anything idiots @telia! As mentioned at topic, if you followed the license things would be much easier for everyone)

```js
$ ("#file-upgradefw").val()
07:49:10.630 'C:\fakepath\1830710-7-2981012.rbi'
```

No idea what that fakepath is from, I run Linux and have no C: partition so yeh, dunno - Maybe there is a reason for this I'm just mentioning it

There is many new things, for example - The router is refresing and checking for current role all the time, ahwell. if anyone is interested of the bruteforce-script but think its to slow, I agree I created it for the normal user but if you dont give a fuck like my friend that using my scripts then try this:

```sh
for version in $(seq -w 000 99999); do 
    echo https://rgw.teliacompany.com:7547/1830710-7-29${version}.rbi; 
done > /tmp/mega-bruteforce.txt
```
....now execute: 

```sh
parallel -a /tmp/mega-bruteforce.txt -j0 -N252 wget --spider --show-progress --progress=bar:force {} \;
```

It will send 252 requests at once so after ~2.7 seconds you spidered 1000 firmware versions and if there is a match, it will download the firmware. Use vpn or tor for your own safety

Per default 252 is default, for raise limits you can do: 

```sh
ulimit -n <NR> 
```    

**OR**

Edit: /etc/security/limits.conf, example see below: 

```sh
admin_user_ID soft nofile 32768
admin_user_ID hard nofile 65536
```

Whatever, this is not the right place to go deeper in this topic, if you are curios about this read manual, see examples with below command: 

```sh
LESS=+/EXAMPLES man limits.conf
```

### The Bridge Card and ETH Linespeed card is new

### Stuff that is new and not included in older models that I have found and might be intresting for someone I hope:

```sh
[error] 6180#0: *4 open() "/www/api/reload" failed (2: No such file or directory), client: 127.0.0.1, server: 127.0.0.1, request: "GET /api/reload HTTP/1.1", host: "localhost:55555"
```
### Curl

- It is possible to inject hidden settings, ntp server is set in /etc/config/system so it might be possible to change other values as well. 

```sh
curl 'http://192.168.1.100/modals/gateway-modal.lp' \
  -H 'Connection: keep-alive' \
  -H 'Accept: text/html, */*; q=0.01' \
  -H 'DNT: 1' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'Origin: http://192.168.1.100' \
  -H 'Referer: http://192.168.1.100/gateway.lp' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Cookie: sessionID=4514d437a748c46c63964259cda91055ce4887853e8d1689a24c215e75e88354' \
  --data-raw 'system_network_timezone=_DUMMY_&system_timezone=GMT0_timezone_Africa%2FAbidjan&action=SAVE&fromModal=YES&CSRFtoken=c7c237f206d264f03bcd562801111d161a1357f7a7dfdad53c62447763d8ed90' \
  --compressed \
  --insecure
```

### Firmware

- When I use binwalk and extracting the firmware file it says the file is MySQL MISAM filetype, I am unsure if this is a binwalk bug or not, output:

```sh
binwalk -Me 2021/1830710-7-2981008.rbi 

Scan Time:     2021-12-28 15:00:28
Target File:   TECHNICOLOR_DGA4330TS/firmware/2021/1830710-7-2981008.rbi
MD5 Checksum:  e12622f04704425ea2c7cf52c80ec6db
Signatures:    411

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
8904736       0x87E020        MySQL MISAM compressed data file Version 11
14608824      0xDEE9B8        MySQL ISAM index file Version 8
```
### /etc/rc.d/S90fhcd

```json
fhcd.fhcd.enable=1 validates as bool with true
fhcd.fhcd.tls_cert=/tmp/certs/chain.pem validates as file with false
fhcd.fhcd.tls_key=/tmp/certs/key.pem validates as or(file,regex("engine\:.*")) with false
fhcd.fhcd.tls_castore=/tmp/certs/ca validates as directory with false
fhcd.fhcd.interface[0]=lan validates as list(string) with true
fhcd.fhcd.loglevel is unset and defaults to range(0, 7) (null)
```

### core-lcm

- I masked the URL here since I dont know what its about atm: 

```json
Dispatching start signal
Initial state start
LCM complete_update
LCM complete_update
GET: https://acs.file.abc.example.json/ipk/hw/
Unable to fetch the apps from the backend: Backend error: Curl error: [6] Error
Failed 'Dispatching start signal': Backend error: Curl error: [6] Error. 8 attempts left. Next attempt in 5 seconds.
LCM changed status core-lcm, installed, 3.2.18
LCM changed status core-watchdog, installed, 2.1.4
APP_TRACE: bad address 'acs.telia.com'
Event listening select returned error: Interrupted system call
Installing prebuilt ipks instead:
Done installing prebuild ipks
```

## Kernel Stuff:

```c++
sfpPhy_probe:Entering the functio,client->addr=0x50
i2c i2c-0: new_device: Instantiated device sff8472_i2c at 0x50
sfpPhy_probe:Entering the functio,client->addr=0x51
i2c i2c-0: new_device: Instantiated device sff8472_i2c at 0x51
 jffs2: notice: (4924) check_node_data: wrong data CRC in data node at 0x0488d978: read 0x958e2b1e, calculated 0xf0ebf64b.
parsing configuration
nfq_init done
nfq_thread entering main loop
```

### Random stuff 

- Things I have personally no clue what it is really, adding below for myself to read more about. Notice the listen port...

```conf
/etc/rc.d/S70iqos: iqctl: invalid command
mosquitto version 1.5 starting
mosquitto version 1.5 starting
/etc/rc.d/S79sscert: sscert: The certificate was correctly generated
The certificate was correctly generated
/etc/rc.d/S80mosquitto: Generating mosquitto config file in /tmp/mosquitto.generated.conf
Config loaded from /tmp/mosquitto.generated.conf.
```

- **Notice**: Check the listen port...?

```text
Opening ipv4 listen socket on port 8883.
Error: Unable to load server certificate "/tmp/certs/chain.pem". Check certfile.
Opening ipv6 listen socket on port 8883.
Error: Unable to load server certificate "/tmp/certs/chain.pem". Check certfile.
```

- **Notice:** -- Check, this is from lxc on 192.168.1.153:

```html
client: 127.0.0.1, server: 127.0.0.1, request: "GET /api/reload HTTP/1.1", host: "localhost:55555"
```


*- **Notice* -- TeliaLXC -- It is on this hidden net the router trying to get the firmware on 131.116.22.230:80 OR acs.telia.com but the address is bad? So, we jump to? - Why the heck are they using curl when its not working? lol - Devbice isretrying every 60 seonds fpr 50 attempts until its halt. Notice, this was how I got all the logs and when I tried to login via session hijack it changed the user back to Administrator and curent_role=admin :

```text
6180#0: *11 [lua] session.lua:103: changeUser(): changing user to Administrator, client: 192.168.1.10, server: localhost, request: "POST /authenticate
 Unable to fetch the apps from the backend: Backend error: Curl error: [6] Error
 Failed 'Dispatching start signal': Backend error: Curl error: [6] Error. 8 attempts left. Next attempt in 5 seconds.
 DHCPACK(br-lan) 192.168.1.153 22:b0:01:e2:45:6f TeliaLXC
Couldn't find systeminfo section: Device config error: Configurator error: Configurator error: No section named 'systeminfo'
```

## Authors: 

* **wuseman <wuseman@nr1.nu\>** 

### Contact

  If you have problems, questions, ideas or suggestions please contact me on *_wuseman@nr1.nu_  - For faster contact visit Libera irc network or the webchat and type '/msg wuseman hi!' in the input bar and I will reply to you ASAP.
  
  Enter Libera's network via your own client 'chat.libera.chat:+6697 or use their new web client [here](https://web.libera.chat/).

### To be continued, stay tuned!
