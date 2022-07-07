# TG799vacXTREAM-18.1-Champagne

On my new blog you might find other things for my projects as well in future: 

	https://nr1.nu

This wiki wont be as big as the one from Telia but I just got one of those (actually i wanted a telia one) but yeah, there is not much info 
about this router online I figured out and after few hours of playing around there is some stuff that I want to share.
The router seems to be more secured then telias but I doubt, they store passwords in plaintext aswell. 

There is horrible stuff about Telenors as well and this repo will be updated now and then.


### First out, Telenors password is also stored in plaintext, 

[telenors-password.txt](https://github.com/wuseman/TG799vacXTREAM-18.1-Champagne/files/8969644/telenors-password.txt)

	Default Login: Kundservice 
	Default Password: F0rth4stargran3n

__How come nobody else have found this earlier or leaked this? The Router has been used since 2015, noobish ISP.__

### Logviewer

How to get logviewer showing up

![telenor_logviewer](https://user-images.githubusercontent.com/26827453/175364615-fd54ff41-8ae3-4580-b4e9-55a2f78252ab.gif)

### Screenshot 

![telenor_plasmo-password](https://user-images.githubusercontent.com/26827453/175364633-fbf89440-7285-4beb-940e-37f7c3c326ec.png)

First thing that might help anyone that does know how to get logviewer shown up, passwords are stored here also for variuos features :) 

# Tcpdump 

![telenor_tcpdump](https://user-images.githubusercontent.com/26827453/175364796-41b095da-6554-4f8d-bd90-aeeecb0d1a92.gif)

Login and rightclick on any other modal in upper right corner and just change the data-modal below:

	modals/diagnostics-tcpdump-modal.lp

### Export config

Via developer console on prefered browser

![Screenshot](telenor_export_config_console.gif)

```js
    $.post('modals/gateway-modal.lp',{ action: "export_config",CSRFtoken: $("meta[name=CSRFtoken]").attr("content") },wait_for_webserver_down,"json");
```

```js
$.post(
	'modals/gateway-modal.lp',{ 
	 action: "export_config",
	 CSRFtoken: $("meta[name=CSRFtoken]").attr("content") },
	 'wait_for_webserver_down',"json"
);
```

### Via curl command for Linux

```shell
#!/bin/bash

### Below can be added if you wanna get csfr_token and session_id 
CSFRTOKEN=$(curl -sL --insecure 'https://192.168.10.1/login.lp?action=getcsrf)
SESSIONID=$(curl -sL --insecure 'https://192.168.10.1/login.lp?action=getcsrf -v 2>&1|grep -E 'sessionID'|cut -d'=' -f2|cut -d';' -f1)

#### Notice
#### Copy and paste below will work fine, change sessionID and csfrtoken by above urls:

curl 'https://192.168.10.1/modals/gateway-modal.lp' \
  -H 'Connection: keep-alive' \
  -H 'sec-ch-ua: "Google Chrome";v="93", " Not;A Brand";v="99", "Chromium";v="93"' \
  -H 'Accept: application/json, text/javascript, */*; q=0.01' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'X-Requested-With: XMLHttpRequest' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36' \
  -H 'sec-ch-ua-platform: "Linux"' \
  -H 'Origin: https://192.168.10.1' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Referer: https://192.168.10.1/' \
  -H 'Accept-Language: en-GB,en-US;q=0.9,en;q=0.8' \
  -H "Cookie: sessionID=${SESSIONID}" \
  --data-raw "action=export_config&CSRFtoken=${CSFRTOKEN}" \
  --compressed \
  --insecure


