
 ![Screenshot](https://androidcommunity.com/wp-content/uploads/2015/10/Hackdroid.png)

# HUAWEI-MEDIATAB-T5-FRP-BYPASS-V.8.0.0.

### If you want follow the tutorial picture by picture then scroll down to the screenshots.

This is a unique tutorial for how to bypass frp protection on huawei version 8.0.0, all other tutorials on internet is for 7* and its not psosible to use speaker settings and then press on help
since they have removed this button on version 8 so we must do it on a completely different way, enjoy this tutorial that will unlock your device 100% to be your own.

 ### Why we must unlock it twice?

   If you wont "unlock" the device with the workaround i provide below you will get "unlock device before you can move further" for every setting you trying press on so without the above step being done you cant bypass the device.


# You must follow this guide from begin to end else it wont succeed!!

# You must follow this guide from begin to end else it wont work!!! Don't jump over a single step.

# NOTICE: DO NOT KEEP SIMCARD IN DEVICE

### Howto

     Turn off your media tab, let it be offline for 5 seconds.
     To be sure we are on latest firmware, press powerbutton to turn device of at same time you hold volume up and you will join erecovery
     Now press at the top option "Download latest version and recovery" (this will take from 2minutes upt o 20 minutes until its done )
     Now press Download And recovery
     Once done, press wipe cache and then press yes
     Now press wipe data and factory reset, press yes
     Device will now do a full format and it will take ~3-5 minutes until it's done and you are at welcome screen.

### Once first step is done.
 
     Choose language and press next button
     Press on skip when you see insert sim card
     Press next on terms and conditions
     Hit agree when you see the popup window
     Just press next on service declaration
     Press on later for user experience improvements project
     Press on update manualy on keep your software up to date
     Press agree to all on about service permissions

#### IMPORTANT

     Now you are at WIFI page, choose your wifi
     Enter password, then hit on show advanved options an press on proxy and choose manually
     Proxyhostname: wusemanistheboss
     Proxy Port: 1337
     Now press on connect
     If you typed correct passhprase for wifi you will se you are connected
     Press next button
     Checking for updates, this will tke a while
     Now you gonna end up in verfying your account (FRP LOCK)

#### Now to the hack:

     WHen you are at verifying your account page, press arrow back button
     Now when you have pressed the back button you have moved further to "next" level
     You will now see Google Services, just hit more followed by accept
     You will now be on "Welcome to your AGS2-L09" :)
     CHoose "Setup s as new"
     Now you can either login on your huawei id, I choose to just press "later
     Now you wil see "data transfer", now press skip and press OK on setup a new device
     Now you will see cloud, press on skip on this page and press skip on the popup
     Now set your pin codeor face unlock if you feel for it, i choose to press skip
     You will now see EMUI logo and get redericted to welcome screen again


#### Now we have unlocked all features so we are able to join the settings that required device to be unlocekd earlier.

     At login screen, choose your language again and press next
     Press skip on insert sim card page
     Press next on terms and conditions
     Hit agree when you see the popup window
     Just press next on service declaration
     Press on later for user experience improvements project
     Press on update manualy on keep your software up to date
     Press agree to all on about service permissions
     Ýou should already be connected to your wifi so press next on wifi page (be quick now, when you have pressed next
     Nwo you will see checking info, this iwll tkae a while and after ~10 seconds you will see there ws a problem communbication with google servers, try again later (you must wait until you see this message)
     Press arrow back now
     You will see Google Service again since we bypassed the lock, but since we already "unlocked all features" we dont want move further, so press ok when you you get the notice that you have no intrnet and u will be redericted back to wifi page, now wait for ~10-60 seconds and you willl see a red notification box that saying. 
     When you see ths red warning, press on "i" to the left of this page (you must be connected to wifi otherwise you will get a error message that u must use the old account)
     Now you will see 3 options - Choose the first one.
     Now press on "No internet access. Please check the router or consult your network service provider"
     Now you see 3 options, press on "Unable to find a hotspot?" and then press on learn more url
     You will now see HiCare Privacyt Notice, press next button
     Now select your conutry and then hit next and show yes when it asking for switching to your language (will load for 20 seconds)
     Now you will see a piture, swipe right twice and press on start in HiCare page
     Now you will join service application, press deny on if they are allowed to access your local content
     Now in upper right corner press on search, type "aaaaaa"
     Now you should see a phone device + a mail application
     Press on the mail application, TAP and hold on GMAIL application for 3 seconds (DONST JUST CLICK ON IT)
     Now help window gets popped up, press in upper right corner and  press on notifications and then on more settings, when u see generl settings and add account you see 3 dots in upper right corner press there and choose manage accounts a popup will now popup and u will see accounts & User & Accounts, choose the left one and press just once!

     VOILA! You are now in settings! ;) 

     Go to system and press on reset, then reset all settings followed by network reset settings, then do a factory reset and you have hacked your mediatab!

# General Fastboot Commands On Mediatab When Its Locked

     useman@thinkpad ~ $ fastboot oem device info
     (bootloader)  FB LockState: LOCKED
     OKAY [  0.006s]
     Finished. Total time: 0.036s

     wuseman@thinkpad ~ $ fastboot oem check-image
     (bootloader) secure image verify fail
     OKAY [  0.010s]
     Finished. Total time: 0.040s

     wuseman@thinkpad ~ $ fastboot oem lock-state info 
     (bootloader)  FB LockState: LOCKED
     (bootloader)  USER LockState: LOCKED
     OKAY [  0.007s]
     Finished. Total time: 0.037s

     wuseman@thinkpad ~ $ astboot oem hwdog certify begin
     bash: astboot: command not found

     wuseman@thinkpad ~ $ fastboot oem get-bootinfo 
     (bootloader)  locked
     OKAY [  0.006s]
     inished. Total time: 0.036s

     wuseman@thinkpad ~ $ fastboot oem check-rootinfo
     bootloader) status        : SAFE
     (bootloader) version       : v1.1
     (bootloader) current status: SAFE
     (bootloader) old status    : SAFE
     (bootloader) change_time   : 0
     (bootloader) item: root-prop, status: SAFE, credible: Y
     (bootloader) item: setids, status: SAFE, credible: Y
     (bootloader) item: verifyboot, status: SAFE, credible: N
     (bootloader) item: verity-enable, status: SAFE, credible: Y
     (bootloader) item: fblock, status: locked, credible: Y
     (bootloader) item: userlock, status: locked, credible: Y
     OKAY [  0.009s]
     Finished. Total time: 0.039s

     wuseman@thinkpad ~ $ fastboot oem relock
     FAILED (remote: stat not match)
     Finished. Total time: 0.036s

     wuseman@thinkpad ~ $ fastboot oem hwdog certify set
     FAILED (remote: data parse fail)
     Finished. Total time: 0.037s

     wuseman@thinkpad ~ $ fastboot oem frp-erase
     FAILED (remote: Command not allowed!)
     Finished. Total time: 0.036s

     wuseman@thinkpad ~ $ fastboot oem frp-unlock
     FAILED (remote: oem_frp_check_password failed! Error = -1)
     Finished. Total time: 0.038s
 
     wuseman@thinkpad ~ $ fastboot oem emmc_diag
     FAILED (remote: invalid command)
     Finished. Total time: 0.036s
 
     wuseman@thinkpad ~ $ fastboot oem emmc-dump 
     FAILED (remote: invalid command)
     Finished. Total time: 0.036s
 
     wuseman@thinkpad ~ $ fastboot oem get_key_version  
     (bootloader) huawei_key_v1
     OKAY [  0.007s]
     Finished. Total time: 0.037s
 
     wuseman@thinkpad ~ $ fastboot oem battery_present_check 
     (bootloader) 6247mv
     OKAY [  0.013s]
     Finished. Total time: 0.043s
 
     wuseman@thinkpad ~ $ fastboot oem get_hwnff_ver 
     (bootloader) Ver2.3
     OKAY [  0.007s]
     Finished. Total time: 0.037s
 
     wuseman@thinkpad ~ $ fastboot oem get-psid  
     (bootloader) SN:YDFBB19B2010XXXX
     (bootloader) IMEI:860556046XXXX7
     (bootloader) IMEI1:000000000000000
     (bootloader) MEID:00000000000000
     OKAY [  0.016s]
     Finished. Total time: 0.046s
 
     wuseman@thinkpad ~ $ fastboot oem get-product-model
     (bootloader) AGS2-L09
     OKAY [  0.009s]
     Finished. Total time: 0.039s

     wuseman@thinkpad ~ $ fastboot oem get-build-number
     (bootloader) :AGS2-L09 8.0.0.258(OCEC431)
     OKAY [  0.008s]
     Finished. Total time: 0.038s

     wuseman@thinkpad ~ $ fastboot oem reboot_boot_dump 
     OKAY [  0.007s]
     Finished. Total time: 0.037s

     wuseman@thinkpad ~ $ fastboot oem device info       
     (bootloader)  FB LockState: LOCKED
     OKAY [  0.006s]
     Finished. Total time: 0.036s

     wuseman@thinkpad ~ $ fastboot oem get_bootFail_info 
     FAILED (unknown status code)
     Finished. Total time: 1.202s

     wuseman@thinkpad ~ $ fastboot oem oeminforead 
     FAILED (command write failed (Success))
     Finished. Total time: 5.001s

     wuseman@thinkpad ~ $ fastboot oem getencryptsn
     FAILED (command write failed (Success))
     Finished. Total time: 5.001s

     wuseman@thinkpad ~ $ fastboot oem getencryptudid 
     FAILED (command write failed (Success))
     Finished. Total time: 5.001s

     wuseman@thinkpad ~ $ fastboot erase system
     Erasing 'system'...
     FAILED (remote: Command not allowed)
     Finished. Total time: 0.066s

#### General tips & tricks

     When you have rebooted your device and are at language page you can see emergency button for type UUSD codes, here you can type "*#*#2846579*#*# to enter project menu
     and in project menu press on "Background Settings" at top, now press USB Port Settings and choose Manufacturaes Mode and now go back and press AP LOG SETTINGS and choose "open" - 
     Now you are able to see the device in adb from PC, it will says unauthorized, then just type "adb reconnect offline"

#### Pictures - Howto:

![Screenshot](https://nr1.nu/archive/mediatab/pictures/1.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/2.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/3.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/4.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/5.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/6.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/7.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/8.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/9.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/10.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/11.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/12.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/13.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/14.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/15.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/16.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/17.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/18.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/19.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/20.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/21.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/21.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/22.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/23.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/24.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/25.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/26.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/27.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/28.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/29.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/30.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/31.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/32.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/33.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/34.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/35.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/36.jpg)
![Screenshot](https://nr1.nu/archive/mediatab/pictures/37.jpg)
=======
![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/1.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/2.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/3.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/4.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/5.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/6.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/7.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/8.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/9.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/10.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/11.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/12.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/13.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/14.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/15.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/16.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/17.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/18.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/19.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/20.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/21.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/21.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/22.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/23.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/24.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/25.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/26.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/27.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/28.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/29.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/30.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/31.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/32.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/33.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/34.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/35.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/36.jpg)

![Screenshot](https://nr1.nu/archive/mediatab/pictures/s/37.jpg)
>>>>>>> b805cb61a29793a241031f8e25f6e93bcf7e89c2



#### Notice

Tutorial for Huawei Y6 comming soon aswell, it wont work with above tutorial for phone devices.

### Haters Gonna Hate

Don't blame me, blame Google & Huawei that have a such bad security on the device

# Greetings: 

To all fans that sending their devices to me so I am able to hack the devices, sharing is caring!

### Feel free to send donations if you want to support my projects here at Github!

      BTC Address: 1Cf3Xuc5sCu9H4VL2jeruELDDNkmk1u7Sx

### Enjoy your fully unlocked Mediatab T5 V8.0 

