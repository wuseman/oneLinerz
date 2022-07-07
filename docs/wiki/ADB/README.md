# adb

<p align="center">
  <img width="120px" src="https://i.imgur.com/o2WZgcl.png" />
  <h2 align="center"># Android™ Debug Bridge (adb)</h2>
  <h3 align="center">Your journey to master <i>Android™ Shell</i> begins here</h3>
</p>

Time flies, it's about time to get up new commands for our Android devices since there is really much stuff that is being added,updated and removed for our devices, I havent seen all those new commands anywere so hopefully this will be useful for you guys aswell.

Feel free to contribute to this repo if there is something that i forgot and is worth to know, however, let me show you what's new.

I decided to not add 'adb shell <coommands>' wich means all commands is executed when we are connected to device but of course if you want to, just add 'adb shell' infront of all commands and it will work aswell without being connected to the device shell

All commands that require root will have (Root_Required) in descriptionn. 

## For FRP Bypass and hack any Samsung device with Android 12 installed, see my wiki:
    
<li><a href="https://github.com/wuseman/Android_12_FRPBypass">Samsung Android 12 FRPBypass - All models</a></li>

## Websites linked to this Repository

* [Android™ Debug Bridge - Main](https://android.nr1.nu)
* [Android™ Debug Bridge - Wiki](https://github.com/wuseman/adb-cheatsheet/wiki/Android%E2%84%A2-Debug-Bridge-(adb))

## Download Android™ <small>Google Account Manager</small>

<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v4.0.3.apk">Google Account Manager Android 4.0.3</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v4.4.4.apk">Google Account Manager Android 4.4.4</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v5.0.1.apk">Google Account Manager Android 5.0.1</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v6.0.apk">Google Account Manager Android 6.0</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v7.0.apk">Google Account Manager Android 7.0</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v7.1.2.apk">Google Account Manager Android 7.1.2</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v7.1.25.apk">Google Account Manager Android 7.1.25</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v8.0.apk">Google Account Manager Android 8.0</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v8.1.apk">Google Account Manager Android 8.1</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v9.apk">Google Account Manager Android 9</a></li>
<li><a href="https://www.nr1.nu/archive/android/google_account_manager/google_account_manager.v10.apk">Google Account Manager Android 10</a></li>

### Custom Apks ™ <small>Blocked</small>

:bangbang: - Notice! On rooted devices samsung health crashing and wont launch anymore and it wont help to change tima from 1 to 0 in build.prop anymore, download the below apk instead to get samsung health working on your rooted device

    
<li><a href="https://w.nr1.nu/archive/android/apks/samsung_health__android.v12.working.apk">Samsung Health - Android 12</a></li>
    
    
## Open Android™ <small>Applications</small>
  
Links works when you clicking the links with your mobile device, please visit [android.nr1.nu](https://www.android.nr1.nu) to get clickable links.
 
* [Click to Erase Lock Settings (dont press unless you frp unlocking)](intent://com.google.android.gms/#Intent;scheme=promote_smartlock_scheme;en)
* [Click to Open My Files](intent://com.sec.android.app.myfiles/#Intent;scheme=android-app;end)
* [Google Search App](intent://com.google.android.googlequicksearchbox/#Intent;scheme=android-app;end)
* [Samsung Apps](intent://com.sec.android.app.samsungapps/#Intent;scheme=android-app;end)
* [Alliance Shield X (Galaxy Store)](https://galaxy.store/alliance)
  
#### Android™ <small>Source Code</small>

* [Android™ Source Code](https://cs.android.com/android/platform/superproject/)

#### Android™ Issue <small>Tracker</small>

* [Android™ Issue Tracker](https://code.google.com/p/android/issues/entry)

## ADB <strong>install</strong>

## Android Firmware <strong>Downloading</strong>

* [Download Samsung firmware faster with Frija](https://github.com/SlackingVeteran/frija/releases/download/v1.4.4/Frija-v1.4.4.zip) 

#### Source Files

* [Download SDK Platform-Tools for Linux](https://dl.google.com/android/repository/platform-tools_r32.0.0-linux.zip)
* [Download SDK Platform-Tools for MacOSX](https://dl.google.com/android/repository/platform-tools_r32.0.0-darwin.zip)     
* [Download SDK Platform-Tools for Windows](https://dl.google.com/android/repository/platform-tools-latest-windows.zip)
  
#### MacOSX

    1. Download the Android SDK Platform Tools ZIP file for macOS.
    2. Extract the ZIP to an easily-accessible location (like the Desktop for example).
    3. Open Terminal.
    4. To browse to the folder you extracted ADB into, enter the following command: cd /path/to/extracted/folder/
    5. For example, on my Mac it was this: cd /Users/Doug/Desktop/platform-tools/
    6. Connect your device to your Mac with a compatible USB cable. 
        Change the USB connection mode to “file transfer (MTP)” mode. 
        This is not always required for every device, but it’s best to just leave it in this mode so you don’t run into any issues.
    7. Once the Terminal is in the same folder your ADB tools are in, you can execute the following command to launch the ADB daemon: ./adb devices
    8. On your device, you’ll see an “Allow USB debugging” prompt. Allow the connection.
    9. Finally, re-enter the command from step #7. If everything was successful, 
       you should now see your device’s serial number in macOS’s Terminal window.

#### Linux

    1. Download the Android SDK Platform Tools ZIP file for Linux.
    2. Extract the ZIP to an easily-accessible location (like the Desktop for example).
    3. Open a Terminal window.
    4. Enter the following command: cd /path/to/extracted/folder/
    5. This will change the directory to where you extracted the ADB files.
    6. So for example: cd /Users/Doug/Desktop/platform-tools/
    7.Connect your device to your Linux machine with your USB cable. 
      Change the connection mode to “file transfer (MTP)” mode. 
      This is not always necessary for every device, but it’s recommended so you don’t run into any issues.
    8. Once the Terminal is in the same folder your ADB tools are in, you can execute the following command to launch the ADB daemon: ./adb devices
    9. Back on your smartphone or tablet device, you’ll see a prompt asking you to allow USB debugging. Go ahead and grant it.

#### Windows 10

    1: Download: https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    2: Extract the contents of this ZIP file into an easily accessible folder (such as C:\platform-tools)
    3: Open Windows explorer and browse to where you extracted the contents of this ZIP file
    4: Then open up a Command Prompt from the same directory as this ADB binary. This can be done by holding 
       Shift and Right-clicking within the folder then click the “Open command window here” option. 
    5: Connect your smartphone or tablet to your computer with a USB cable. 
       Change the USB mode to “file transfer (MTP)” mode. Some OEMs may or may not require this, 
       but it’s best to just leave it in this mode for general compatibility.
    6: In the Command Prompt window, enter the following command to launch the ADB daemon: adb devices
    7: On your phone’s screen, you should see a prompt to allow or deny USB Debugging access. Naturally, 
       you will want to grant USB Debugging access when prompted (and tap the always allow check box if you never want to see that prompt again).
    8: Finally, re-enter the command from step #6. If everything was successful,
       you should now see your device’s serial number in the command prompt (or the PowerShell window).

#### Arch Linux
  
    pacman -S android-tools

#### Gentoo  

     emerge --ask dev-util/android-sdk-update-manager

#### Fedora

    dnf install adb

#### Ubuntu

    apt install adb fastboot -y
    
## Android™ <small>files</small>

#### SMS and Phone Phone logs is stored in below files
 
    /data/user_de/0/com.android.providers.telephony/databases/mmssms.db
    /data/user_de/0/com.android.providers.telephony/databases/telephony.db

#### Audio files is stored in

    /system/media/audio/ui/                       
    /system/media/audio/ringtones
    /system/media/audio/notifications

## ADB <small>commands</small>
 
#### Start ADB server:

    adb start-server 

#### Stop ADB server:

    adb stop-server

#### Kill ADB server: 

    adb kill-server

#### Setup ADB server via Wi-Fi

    adb tcpip <port>
    
#### Connect to ADB server: 

    adb connect <device_ip>

#### Restarts the adbd daemon listening on USB

    adb usb

#### List Connected Devices: 

    adb devices

#### Get Status:

    adb get-state  
  
#### Print Serial Number:

    adb get-serialno 
    
#### Backup Device:

    adb backup -all
    
#### Restore Device:

    adb restore /path/to/backupflile.adb

#### Enter ADB shell:

    adb shell

#### Enter ADB shell if there is multiple devices connected:

    adb -s <id_from_adb_devices> shell 

#### To print device serial no: 

    adb get-serialno

#### Create a bugreport: 

    adb bugreport

#### Install an app:

    adb install <apk_file>

#### Install an app and keep all it's data from a previous setup: 

    adb install -r <apk_file>

#### Uninstall an app: 

    adb uninstall <apk_file>
   
#### Push a file 

adb push = tansfer a file: pc > device

    adb push mypicture.png /storage/on/device

#### Push a folder (Transfer a folder FROM pc > device)

    adb push myfolder /storage/on/device

#### Pull a file

adb pull = tansfer a file: device > pc

    adb pull /storage/on/device/mypicture.png /path/on/pc

#### Pull a folder (Transfer a folder FROM device > pc)

    adb pull /storage/on/device /path/on/pc

#### Pull installed apk files 

![Screenshot](previews/android-wpull-system-apks.gif)

* [Script for pull all installed Apks](https://raw.githubusercontent.com/wuseman/adb-cheatsheet/main/scripts/wpull-all-apks.sh)
* [Script for pull all installed system Apks](https://raw.githubusercontent.com/wuseman/adb-cheatsheet/main/scripts/wpull-system-apks.sh)
* [Script for pull all Apks installed by you](https://raw.githubusercontent.com/wuseman/adb-cheatsheet/main/scripts/wpull-third-party-apks.sh)

#### Pull all files inside a folder to a path (Transfer all files in a folder FROM device > pc)

    adb pull /storage/on/device/ /path/on/pc # Notice the trial slash

## ADB <small>exec-out</small>

Stream Device Screen on your PC

### TIPS WANTED!

Does anyone know how to to view AND record the stream at same time? Let me know!

Exec Out Syntax 

    adb exec-out screenrecord --Example Output-format=h264 - | prefered tool - <stdin>

### Stream via Mplayer (Recommended)

Recommended since it is starts immediately, very little delay, and doesn't freak out like vlc.

    adb exec-out screenrecord --output-format=h264 - | ffplay -framerate 60 -probesize 32 -sync video  -

ffplay works, but it seems to take a few seconds to decide to start, and ends up lagging well behind the entire time.

### Stream via FFPLay 

FFPlay Default - No Settings

    adb shell screenrecord --Example Output-format=h264 - | ffplay -

FFplay Customized

```sh
adb exec-out screenrecord --Example Output-format=h264 - | ffplay -framerate 60 -probesize 32 -sync video  -
```

```sh
adb shell screenrecord --bit-rate=16m --Example Output-format=h264 --size 800x600 - | ffplay -framerate 60 -framedrop -bufsize 16M -
```

![Screenshot](https://nr1.nu/u/adb_record.gif)

FFplay Customized - Stream vin 1080p

```sh
adb exec-out screenrecord --bit-rate=16m --Example Output-format=h264 --size 1920x1080 -
```

### Stream via VLC

Adding --clock-jitter=0 seems to make the errors less traumatic, but it's still pretty messed up vlc is not recommended for this, use FFplay or Mplayer if possible

Stream via VLC on Windows

```sh
adb exec-out screenrecord --bit-rate=4m --Example Output-format=h264 --size 800x600 --show-frame-time - \
    |"c:\Program Files\VideoLAN\VLC\vlc" --demux h264 - vlc://quit
```

Record your device screen via VLC on Windows

```sh
adb exec-out screenrecord --bit-rate=4m --Example Output-format=h264 --size 800x600 --show-frame-time - \
    |"c:\Program Files\VideoLAN\VLC\vlc" --demux h264 --sout file/ts:c:\temp\screenrec.mpg -  vlc://quit
```

### Network Analyze 

Sniff your device network and SMS traffic via Wireshark on your PC
```sh
adb exec-out "tcpdump -i any -U -w - 2>/dev/null" | wireshark -k -S -i -
```

## ADB <small>reboot</small>

#### System
```sh
adb reboot
```
#### Recovery

    adb reboot recovery

#### Bootloader

    adb reboot bootloader


#### Fastboot (some brands)

    adb reboot fastboot

## ADB <small>date</small>

#### Set date

    date MMDDYYYY.XX;am broadcast -a android.intent.action.TIME_SET


## ADB <small>cmd</small>

NOTE: when lock screen is set, all commands require the --old <CREDENTIAL> argument.

#### cmd lock_settings

### Sets the package name for server based resume on reboot service provider.
```sh
adb shell cmd lock_settings set-resume-on-reboot-provider-package <package_name>
```
#### Removes cached unified challenge for the managed profile.
```sh
adb shell cmd lock_settings remove-cache --user 0 
```
#### Verifies the lock credentials.
```sh
adb shell cmd lock_settings verify --old 1234--user 0 
```
#### Clears the lock credentials.
```sh
adb shell cmd lock_settings clear --old 1234--user 0 
```
#### Enables / disables synthetic password.
```sh
adb shell cmd lock_settings sp --old 1234--user 0  <1|0>
```
#### Gets whether synthetic password is enabled.
```sh
adb shell cmd lock_settings sp --old 1234--user 0 
```
#### Sets the lock screen as password, using the given PASSOWRD to unlock.
```sh
adb shell cmd lock_settings set-password --old 1234--user 0  <PASSWORD>
```
#### Sets the lock screen as PIN, using the given PIN to unlock.
```sh
adb shell cmd lock_settings set-pin --old 1234--user 0  <PIN>
```
#### Sets the lock screen as pattern, using the given PATTERN to unlock.
```sh
adb shell cmd lock_settings set-pattern --old 1234--user 0  <PATTERN>
```
#### When true, disables lock screen.
```sh
adb shell cmd lock_settings set-disabled --old 1234--user 0  <true|false>
```
#### Checks whether lock screen is disabled.
```sh
adb shell cmd lock_settings get-disabled --old 1234--user 0 
```


#### cmd testharness                                                                                                                                                                                                                    
About:
  Test Harness Mode is a mode that the device can be placed in to prepare
  the device for running UI tests. The device is placed into this mode by
  first wiping all data from the device, preserving ADB keys.

  By default, the following settings are configured:
    * Package Verifier is disabled
    * Stay Awake While Charging is enabled
    * OTA Updates are disabled
    * Auto-Sync for accounts is disabled

  Other apps may configure themselves differently in Test Harness Mode by
  checking ActivityManager.isRunningInUserTestHarness()

Test Harness Mode commands:
  help
    Print this help text.

  enable|restore
    Erase all data from this device and enable Test Harness Mode,
    preserving the stored ADB keys currently on the device and toggling
    settings in a way that are conducive to Instrumentation testing.

#### cmd stats meminfo

* *Prints the malloc debug information. You need to run the following first: 
   
     adb shell stop
     adb shell setprop libc.debug.malloc.program statsd 
     adb shell setprop libc.debug.malloc.options backtrace 
     adb shell start
     cmd stats print-stats


####  Send a broadcast that triggers the subscriber to fetch metrics.

     cmd stats send-broadcast [UID] NAME

     UID           The uid of the configuration. It is only possible to pass
                the UID parameter on eng builds. If UID is omitted the
                calling uid is used.
      NAME          The name of the configuration




####  Flushes all data on memory to disk.

     cmd stats write-to-disk 


#### Prints the UID, app name, version mapping.

     cmd stats print-uid-map 

#### Log a binary push state changed event.

    cmd stats log-binary-push NAME VERSION STAGING ROLLBACK_ENABLED LOW_LATENCY STATE EXPERIMENT_IDS

    NAME                The train name.
    VERSION             The train version code.
    STAGING             If this train requires a restart.
    ROLLBACK_ENABLED    If rollback should be enabled for this install.
    LOW_LATENCY         If the train requires low latency monitoring.
    STATE               The status of the train push.
                        Integer value of the enum in atoms.proto.
    EXPERIMENT_IDS      Comma separated list of experiment ids.
                        Leave blank for none.




#### Hide all notifications icons on Status Bar

    cmd statusbar send-disable-flag notification-icons 

### Reset all flags to default

    cmd statusbar send-disable-flag none

#### Print Status Bar Icons

    cmd statusbar get-status-icons

#### Print Preferences for Status Bar

    cmd statusbar prefs list-prefs

#### Expand Status Bar

    cmd statusbar expand-notifications

#### Collapse Status Bar

    cmd statusbar collapse

#### Expand Full Settings

    cmd statusbar expand-settings

#### Status Bar Help

    cmd statusbar help

#### Print auth user
  
    cmd user list   

#### Enable night mode (Dark Mode) 
  
    cmd uimode night yes 

#### Disable night mode
  
    cmd uimode night no

#### Enable car Mode
  
    cmd uimode car yes
  
#### Disable car (car Mode) 
  
    cmd uimode car no
  
#### Scan for nearby ssid:s, give it 7 seconds for scan and fetch some wifi data

![Screenshot](https://raw.githubusercontent.com/wuseman/adb-cheatsheet/main/previews/wifi_result.png)

    cmd -w wifi start-scan
    sleep 7
    cmd -w wifi list-scan-results  
  
#### Sets whether we are in the middle of an emergency call.
    
Equivalent to receiving the `TelephonyManager.ACTION_EMERGENCY_CALL_STATE_CHANGED` broadcast.

    cmd -w wifi set-emergency-call-state enabled|disabled

#### Sets whether Emergency Callback Mode (ECBM) is enabled.

    cmd -w wifi set-emergency-callback-mode enabled|disabled

#### Lists the suggested networks from the app

    cmd -w wifi list-suggestions-from-app <package name>

#### Lists all suggested networks on this device
 
    cmd -w wifi list-all-suggestions

#### Note: This only returns whether the app was set via the 'network-requests-set-user-approved' shell command

Queries whether network requests from the app is approved or not.

    cmd -w wifi network-requests-has-user-approved <package name>

#### Note: Only 1 such app can be approved from the shell at a time

Sets whether network requests from the app is approved or not.

    cmd -w wifi network-requests-set-user-approved <package name> yes|no

####  Lists the requested networks added via shell

    cmd -w wifi list-requests

#### Removes all active requests added via shell

    cmd -w wifi remove-all-requests

#### Remove a network request with provided SSID of the network
    
    cmd -w wifi remove-request <ssid>

#### Add a network request with provided params

    cmd -w wifi add-request <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-b <bssid>]

#### Initiates wifi settings reset
    
    cmd -w wifi settings-reset

#### Gets softap supported features. Will print 'wifi_softap_acs_supported'
    
    cmd -w wifi get-softap-supported-features

#### Gets setting of wifi watchdog trigger recovery.
    
    cmd -w wifi get-wifi-watchdog

#### Sets whether wifi watchdog should trigger recovery

    cmd -w wifi set-wifi-watchdog enabled|disabled

#### Sets country code to <two-letter code> or left for normal value
    
    cmd -w wifi force-country-code enabled <two-letter code> | disabled 

#### Manually triggers a link probe.
    
    cmd -w wifi send-link-probe

#### Clears the user disabled networks list.
    
    cmd -w wifi clear-user-disabled-networks

#### Removes all user approved network requests for the app.

    cmd -w wifi network-requests-remove-user-approved-access-points <package name>

#### Clear the user choice on Imsi protection exemption for carrier

    cmd -w wifi imsi-protection-exemption-clear-user-approved-for-carrier <carrier id>

#### Queries whether Imsi protection exemption for carrier is approved or not

    cmd -w wifi imsi-protection-exemption-has-user-approved-for-carrier <carrier id>

#### Sets whether Imsi protection exemption for carrier is approved or not

    cmd -w wifi imsi-protection-exemption-set-user-approved-for-carrier <carrier id> yes|no

#### Queries whether network suggestions from the app is approved or not.

    cmd -w wifi network-suggestions-has-user-approved <package name>

#### Sets whether network suggestions from the app is approved or not.

    cmd -w wifi network-suggestions-set-user-approved <package name> yes|no

#### Sets whether low latency mode is forced or left for normal operation.

    cmd -w wifi force-low-latency-mode enabled|disabled

#### Sets whether hi-perf mode is forced or left for normal operation.

    cmd -w wifi force-hi-perf-mode enabled|disabled

#### Gets current interval between RSSI polls, in milliseconds.

    cmd -w wifi get-poll-rssi-interval-msecs

#### Sets the interval between RSSI polls to <int> milliseconds.

    cmd -w wifi set-poll-rssi-interval-msecs <int>

#### Gets setting of CMD_IP_REACHABILITY_LOST events triggering disconnects.

Equivalent to receiving the `TelephonyManager.ACTION_EMERGENCY_CALL_STATE_CHANGED` broadcast,
sets whether we are in the middle of an emergency call.

    cmd -w wifi set-emergency-call-state enabled|disabled

#### Equivalent to receiving the TelephonyManager.ACTION_EMERGENCY_CALLBACK_MODE_CHANGED broadcast.

    cmd -w wifi set-emergency-callback-mode enabled|disabled

#### Lists the suggested networks from the app

    cmd -w wifi list-suggestions-from-app <package name>

#### Lists all suggested networks on this device

    cmd -w wifi list-all-suggestions

#### Notice: This only returns whether the app was set via the 'network-requests-set-user-approved' shell command

Queries whether network requests from the app is approved or not

    cmd -w wifi network-requests-has-user-approved <package name>

#### Note: Only 1 such app can be approved from the shell at a time

Sets whether network requests from the app is approved or not.

    cmd -w wifi network-requests-set-user-approved <package name> yes|no

#### Lists the requested networks added via shell

    cmd -w wifi list-requests

#### Removes all active requests added via shell

    cmd -w wifi remove-all-requests

#### Remove a network request with provided SSID of the network

    cmd -w wifi remove-request <ssid>

#### Add a network request with provided params

    cmd -w wifi add-request <ssid> open|owe|wpa2|wpa3 [<passphrase>] [-b <bssid>]

#### Initiates wifi settings reset

    cmd -w wifi settings-reset

#### and/or 'wifi_softap_wpa3_sae_supported', each on a separate line.

    cmd -w wifi get-softap-supported-features

#### Gets setting of wifi watchdog trigger recovery.

    cmd -w wifi get-wifi-watchdog

#### Sets whether wifi watchdog should trigger recovery

    cmd -w wifi set-wifi-watchdog enabled|disabled

#### Sets country code to <two-letter code> or left for normal value

     cmd -w wifi force-country-code enabled <two-letter code> | disabled 

#### Sets whether soft AP channel is forced to <int> MHz

    cmd -w wifi force-softap-channel enabled <int> | disabled

#### Manually triggers a link probe.
 
    cmd -w wifi send-link-probe

#### Clears the user disabled networks list.
 
    cmd -w wifi clear-user-disabled-networks

#### Removes all user approved network requests for the app.
 
    cmd -w wifi network-requests-remove-user-approved-access-points <package name>

#### Clear the user choice on Imsi protection exemption for carrier
 
    cmd -w wifi imsi-protection-exemption-clear-user-approved-for-carrier <carrier id>

#### Queries whether Imsi protection exemption for carrier is approved or not
 
    cmd -w wifi imsi-protection-exemption-has-user-approved-for-carrier <carrier id>

#### Sets whether Imsi protection exemption for carrier is approved or not
 
    cmd -w wifi imsi-protection-exemption-set-user-approved-for-carrier <carrier id> yes|no

#### List uid owner of a app

    cmd package list packages -U####                            

#### List packages a.k.a: pm list packages

    cmd package list packages -l                                          

#### List disabled packages
     
    cmd package list packages -d
    
#### Filter to only show enabled packages     
     
    cmd package list packages -e                                       

#### Filter to only show third party packages    

    cmd package list packages -3                                                 

#### Set the default home activity (aka launcher)

    cmd package set-home-activity [--user USER_ID] TARGET-COMPONENT        
    
#### Prints all features of the system

    cmd package list features 
    
#### Print briefs

    cmd package resolve-activity --brief  com.facebook.katana        
    priority=0 preferredOrder=0 match=0x108000 specificIndex=-1 isDefault=false
    com.facebook.katana/.LoginActivity

## ADB <small>pm</small>

#### Print all applications in use

```sh
pm list packages|sed -e "s/package://" 

|while read x; do 
    cmd package resolve-activity --brief $x \
    |tail -n 1 \
    |grep -v "No activity found" 
done 
```

#### List all packages installed on device 

    pm list packages

#### List enabled packages

    pm list packages -e
    
#### List disabled packages

    pm list packages -d

#### List third party packages installed by user

    pm list packages -3

#### List users

    pm list users

#### List permission groups

    pm list permission-groups

#### List features
 
    pm list features

#### Uninstall any installed package:

    pm uninstall --user 0 com.package.name

#### Uninstall multiple apps:

```sh
for packages in com.package1 com.package2; do 
    adb shell pm uninstall --user 0 "${packages}"
done 
```

#### Clear application data:

    pm clear PACKAGE_NAME

#### List permission groups: 

    pm list permission-groups 

#### List instrumentation:

    pm list instrumentation

#### Grant permission to an app (Example Only For Grant): 

    pm grant com.application android.permission.READ_LOGS
    
#### Revoke permission to an app (Example Only For Revoke): 

    pm revoke com.application android.permission.READ_LOGS

#### Reset all permissions for an app:

    pm reset-permissions -p your.app.package
    
## ADB <small>logcat</small>

#### Default options: 

Example Output
```ini
* V — Verbose (lowest priority)
* D — Debug
* I — Info (default priority)
* W — Warning
* E — Error
* F — Fatal
* S — Silent (highest priority, on which nothing is ever printed)
```

#### Use -v time for print timestamps, and threadtime for dates:

    adb logcat -v time ...
    adb logcat -v threadtime ....

#### For get Example Output colorized with logcat:

    adb logcat ... -v color

#### Displays current log buffer sizes:

    adb logcat -g   

#### Sets the buffer size (K or M):

    adb logcat -G 16M   

#### Clear the log buffer:

    adb logcat -c

#### Enables ALL log messages (verbose mode)

    adb logcat *:V  

#### Dump everything to a file:

    adb logcat -f <filename>    Dumps to specified file

#### Display PID with the log info 

    adb logcat -v process

#### Display the raw log message, with no other metadata fields

    adb logcat -v raw

#### Display the date, invocation time, priority/tag, and PID of the process issuing the message

    adb logcat -v time

#### Display the priority, tag, and the PID and TID of the thread issuing the message

    adb logcat -v thread

#### Display the date, invocation time, priority, tag, and the PID and TID of the thread issuing the message

    adb logcat -v threadtime

#### Display all metadata fields and separate messages with blank lines

    adb logcat -v long
    
#### Log multiple options (-b ... -b ....): 

    adb logcat -b main -b radio -b events

### Run all at once, no reason for use it like this really

    adb logcat -v brief -v long -v process -v raw -v tag -v thread -v threadtime -v time -v color       
     
## ADB <small>dumpsys</small>

#### List all active services:

    dumpsys -l 
    
List services on older devices via command below 

```sh
dumpsys -l |sed 's/^  /      /g'
```

Example Output
```ini
Currently running services:
  AAS
  AODManagerService
  CCM
  CocktailBarService
  CodecSolution
  CustomFrequencyManagerService
  DeviceRootKeyService
  DirEncryptService
  DisplaySolution
  DockObserver
  EngineeringModeService
  HqmManagerService
  ImsBase
  OcfKeyService
  ReactiveService
  SEAMService
  SamsungKeyProvisioningManagerService
  SatsService
  SecExternalDisplayService
```

#### Dumpsys lock_settings 

```sh
dumpsys lock_settings
```

Example Output
```ini
Current lock settings service state:

User State:
 User 0
 SP Handle: 5f0ef3437a85f55
Last changed: 2021-07-28 20:22:36 (b8212446331f2358)
  SID: 3fffcda35ee6c180
  Quality: 0
 CredentialType: Pin
 SeparateChallenge: true
 Metrics: known
  
Storage:
User 0 [/data/system_de/0/spblob]:
5 2021-07-28 20:22:36 05f0ef3437a85f55.weaver
   31 2021-07-28 20:22:36 05f0ef3437a85f55.pwd
   72 2021-07-28 20:22:36 05f0ef3437a85f55.metrics
  186 2021-07-28 20:22:36 05f0ef3437a85f55.spblob
   58 2021-07-28 20:22:36 0000000000000000.handle
  
StrongAuth:
PrimaryAuthFlags state:
 userId=0, primaryAuthFlags=0

 NonStrongBiometricAllowed state:

  
RebootEscrow:
mRebootEscrowWanted=false
mRebootEscrowReady=false
mRebootEscrowListener=com.android.server.recoverysystem.RecoverySystemService@bc1c4d8
mPendingRebootEscrowKey is not set
```

#### Print codecs for bluetooth headphones

    dumpsys media.audio_flinger | grep -A3 Input 

#### Show bluetooth macaddr, bluetooth name and such things

    dumpsys bluetooth_manager

#### Dump phone registry

    dumpsys telephony.registry

#### Dump GPS Data:

    dumpsys location

#### Dump Settings

```sh
adb shell dumpsys settings
```

Example Output
```ini
_id:225 name:lock_screen_show_notifications pkg:com.android.settings value:1 
_id:6 name:volume_bluetooth_sco pkg:android value:7 default:7
_id:192 name:ringtone_set pkg:com.google.android.gsf value:1
_id:159 name:lock_screen_allow_rotation pkg:android value:0
_id:2997 name:Flashlight_brightness_level pkg:com.android.systemui value:1001
_id:67 name:SEM_VIBRATION_NOTIFICATION_INTENSITY pkg:android value:5
_id:175 name:call_popup pkg:android value:0 default:0
_id:59 name:install_non_market_apps pkg:android value:1 default:1
```
#### Display Contacts On Sim Card

    adb shell dumpsys simphonebook

#### Show hardware info as thermal stuff for cpu, gpu and battery

```sh
adb shell dumpsys hardware_properties
```
Example Output
```ini
****** Dump of HardwarePropertiesManagerService ******
CPU temperatures: [38.0, 38.0]
CPU throttling temperatures: [55.0, 76.0]
CPU shutdown temperatures: [115.0, 115.0]
```

#### Show all application you have an account on:

```sh
dumpsys account|grep -i com.*$ -o|cut -d' ' -f1|cut -d} -f1|grep -v com$
```
Example Output
```ini
com.microsoft.workaccount
com.skype.raider
com.samsung.android.mobileservice
com.facebook.messenger
com.google.android.gm.exchange
```

#### Show all notifications listener and so on:

    dumpsys notification
    
#### List email addresses registerd on different stuff on device:

    dumpsys | grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
    
#### Print version of a specifik package

    dumpsys package com.lge.signboard | grep versionName
    versionName=6.00.170603-0
    
#### Check state for screen and figoure how device was unlcked last time:

```sh
adb shell dumpsys  user
```
Example Output
```ini
State: RUNNING_UNLOCKED
Last logged in fingerprint
agree Knox Privacy Policy: false
```

#### And for example, you can dump data for all of the running services, dump all data for battery: 

    adb shell dumpsys battery

#### Dump stats for your battery:

    adb shell dumpsys batterystats 

#### Erase old stats for battery:
 
    dumpsys batterystats --reset 

#### Sort Applications By Ram Usage:

```sh
dumpsys meminfo
```
Example Output
```ini
Applications Memory Usage (in Kilobytes):
Uptime: 29602806 Realtime: 57806941

Total PSS by process:
265,435K: com.android.systemui (pid 4190)
264,671K: system (pid 3838)
171,192K: surfaceflinger (pid 3360)
152,523K: android.hardware.graphics.composer@2.1-service (pid 3338)
128,781K: com.sec.android.app.launcher (pid 5597 / activities)
92,656K: se.kronansapotek.kronan (pid 26729 / activities)
84,563K: logd (pid 3203)
80,944K: com.google.android.talk (pid 32314 / activities)
79,754K: com.google.android.googlequicksearchbox:search 
```

#### Unplug AC:

    dumpsys battery unplug

#### See current used app:

    dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'|grep '/'|awk -F'u0' '{print $2}'|awk '{print $1}'

#### Print how many notifications you have: 

    dumpsys notification | grep NotificationRecord | wc -l 

## ADB <small>dumpstate</small>

#### Dump info about your sim provider and kernel bootloader ID etc.

```sh
dumpstate -v
```

Example Output
```ini
========================================================
== dumpstate: 2019-08-30 19:31:05
========================================================

Build: PPR1.180610.011.G950FXXS5DSF1
Build fingerprint: 'samsung/dreamltexx/dreamlte:9/PPR1.180610.011/G950FXXS5DSF1:user/release-keys'
Bootloader: G950FXXS5DSF1
Radio: G950FXXS5DSF1
Network: Comviq
Linux version 4.4.111-16019454 (dpi@21DHA724) (gcc version 4.9.x 20150123 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Jun 3 20:16:50 KST 2019
Kernel: Command line: (unknown)
up 0 weeks, 0 days, 16 hours, 21 minutes
Uptime: Bugreport format version: 2.0
Dumpstate info: id=0 pid=26940 dry_run=0 args=dumpstate -v extra_options=
```
     
## ADB <small>am</small>

#### How to use Demo Mode
#### First you enable the Demo Mode:

     settings put global sysui_demo_allowed 1 

#### Display time 12:00

     am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200

#### Display full mobile data without type

     am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype false

#### Hide notifications

     am broadcast -a com.android.systemui.demo -e command notifications -e visible false

#### Show full battery but not in charging state
 
     am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100

#### Exit Demo Mode

     am broadcast -a com.android.systemui.demo -e command exit

***

#### Add a value to default shared preferences.

    adb shell 'am broadcast -a org.example.app.sp.PUT --es key key_name --es value "hello world!"'

#### Remove a value to default shared preferences.

    adb shell 'am broadcast -a org.example.app.sp.REMOVE --es key key_name'

#### Clear all default shared preferences.

    adb shell 'am broadcast -a org.example.app.sp.CLEAR --es key key_name'

#### It's also possible to specify shared preferences file.

    adb shell 'am broadcast -a org.example.app.sp.PUT --es name Game --es key level --ei value 10'

#### Play a mp3 track on device

    am start -a android.intent.action.VIEW -d file:////storage/9A8A-1069/wuseman/ringtones/<mp3_track>.mp3 -t audio/mp3    

#### Data types

    adb shell 'am broadcast -a org.example.app.sp.PUT --es key string --es value "hello world!"'
    adb shell 'am broadcast -a org.example.app.sp.PUT --es key boolean --ez value true'
    adb shell 'am broadcast -a org.example.app.sp.PUT --es key float --ef value 3.14159'
    adb shell 'am broadcast -a org.example.app.sp.PUT --es key int --ei value 2015'
    adb shell 'am broadcast -a org.example.app.sp.PUT --es key long --el value 9223372036854775807'

#### Restart application process after making changes

    adb shell 'am broadcast -a org.example.app.sp.CLEAR --ez restart true'

#### Open Google Camera (Pixel 4)

    am start com.google.android.GoogleCamera 

#### Set default preferences for an app:

    am broadcast -a org.example.app.sp.CLEAR --es key key_name

#### WARNING!! Factory Reset

    am broadcast -a android.intent.action.MASTER_CLEAR

#### Open Special Menu

    am start -a android.intent.action.VIEW \

#### Open settings:

     am start -n com.android.settings/com.android.settings.Settings

#### Open activity to new APN

     am start -a android.intent.action.INSERT  content://telephony/carriers  --ei simId 

#### Open hiden menu (require root)

    su -c "am broadcast -a android.provider.Telephony.SECRET_CODE -d android_secret_code://IOTHIDDENMENU"

#### Start prefered webbrowser:

    am start -a android.intent.action.VIEW -d <url> (com.android.browser | com.android.chrome | com.sec.android.sbrowser) 

#### Print Activities:
    
    am start -a com.android.settings/.wifi.CaptivePortalWebViewActivity

#### Open Camera in Photo mode

    am start -a android.media.action.IMAGE_CAPTURE

#### Open Camera in Photo mode and take a picture

    am start -a android.media.action.IMAGE_CAPTURE
    input keyevent 66
    
#### Open Camera in Video mode

    am start -a android.media.action.VIDEO_CAMERA

#### Open Camera in Video mode and start recording

    am start -a android.media.action.VIDEO_CAMERA
    input keyevent 66

#### Go to gallary and choose a picture and then set wallpaper:

    am start -a android.intent.action.SET_WALLPAPER

#### Open any URL in default browser

    am start -a android.intent.action.VIEW -d https://github.com/wuseman

#### Open Google Maps with fixed coordinates

    am start -a android.intent.action.VIEW -d "geo:46.457398,-119.407305"

#### Simulate waking your app using the following commands

    am set-inactive <packageName> 
    am set-inactive <packageName> false
    
#### Enabling Night Mode (If Supported)
    
    am start --ez show_night_mode true com.android.systemui/.tuner.TunerActivity

#### Start facebook application inbox by using URI

    am start -a android.intent.action.VIEW -d facebook://facebook.com/inbox

#### Open a vcard file from sdcard (will open contacts app)

    am start -a android.intent.action.VIEW -d file:///sdcard/me.vcard -t text/x-vcard

#### Open an application to get content (in this case to get a jpeg picture)

    am start -a android.intent.action.GET_CONTENT -t image/jpeg

#### There is several ways to send a SMS via AM, here is just one of several ways:

    am broadcast -a com.whereismywifeserver.intent.TEST --es sms_body "test from adb"

  #### Simulate waking your app using the following commands:

    am set-inactive <packageName> 
    am set-inactive <packageName> false
    
#### Start facebook application inbox by using URI

    am start -a android.intent.action.VIEW -d facebook://facebook.com/inbox
  
#### Open a vcard file from sdcard (will open contacts app)

    am start -a android.intent.action.VIEW -d file:///sdcard/me.vcard -t text/x-vcard  

#### Open an application to get content (in this case to get a jpeg picture)

    am start -a android.intent.action.GET_CONTENT -t image/jpeg

#### There is several ways to send a SMS via AM, here is one example:

    am broadcast -a com.whereismywifeserver.intent.TEST --es sms_body "test from adb"

#### Open settings for a specifik app

    am start -a android.settings.APPLICATION_DETAILS_SETTINGS package:<com.package.example>

#### Add Contacts

Add a Contact - Example 1

    am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name "$(dialog --stdout --inputbox 'wuseman' 0 0)" -e postal "$(dialog --stdout --inputbox 'Postal Address' 0 0)" -e phone "$(dialog --stdout --inputbox 'Phone Number' 0 0)" -e email "$(dialog --stdout --inputbox 'Email' 0 0)"
    
Add a Contact - Example 2

    am start -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact -e name 'wuseman' -e phone <phone_number>

#### Open Projectmenu (Huawei only)

    am start com.huawei.android.projectmenu/com.huawei.android.projectmenu.ProjectMenuActivity

#### Make Demo Call   

Establishes a fake Bluetooth connection to Dialer and must be called first to enable access to all call-related commands.

#### To connect a device

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "connect" 

#### Place an outgoing call

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "addCall" --es "id" "4085524874"  

#### Receive an incoming call      

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "rcvCall" --es "id" "4085524874"        

#### End a call

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "endCall" --es "id" "4085524874"        

#### Hold the current call 

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "holdCall"                     

#### Unhold the current call

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "unholdCall"                            

#### Merge calls

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "unholdCall"                            

#### Clear all calls, To remove all calls in the call list:

    adb shell am broadcast -a com.android.car.dialer.intent.action.adb --es "action" "clearAll"                              

## ADB <small>acpi</small>

#### Get Battery Percentage

    acpi

#### Show batteries

    acpi -b 

#### Show Cooling Device State

    acpi -c    

#### Show Temperatures

    acpi -t 

#### Just print everything from acpi

    acpi -V

## ADB <small>dpm</small>

#### Enable Device Admin

    dpm set-device-owner com.package.name/.DeviceAdminReceiver

## ADB <small>service</small>

### StatusBar

#### Expand Status Bar

    service call statusbar 1

#### Expand Status Bar <full>

    service call statusbar 2

#### Collapse Status Bar

    service call statusbar 2

### IMEI Related

### Slot 1

#### Print IMEI - Example 1

    service call iphonesubinfo 1| cut -d "'" -f2| grep -Eo '[0-9]'| xargs| sed 's/\ //g'  

#### Print IMEI - Example 2
   
    service call iphonesubinfo 3 i32 1 | grep -oE '[0-9a-f]{8} ' | while read hex; do echo -ne "\u${hex:4:4}\u${hex:0:4}"; done; echo          

#### Print IMEI - Example 3

     echo "[device.imei]: [$(adb shell service call iphonesubinfo 1 | awk -F "'" '{print $2}' | sed '1 d'| tr -d '\n' | tr -d '.' | tr -d ' ')]"

#### Print IMEI - Example 4

     adb shell service call iphonesubinfo 1 | awk -F"'" 'NR>1 { gsub(/\./,"",$2); imei=imei $2 } END {print imei}' 

#### Print IMEI - Example 5 

     adb shell "service call iphonesubinfo 1 | cut -c 52-66 | tr -d '.[:space:]'"

#### Print IMEI - Example 6
     
     adb shell service call iphonesubinfo 1 | awk -F "'" '{print }' | sed '1 d' | tr -d '.' | awk '{print}' ORS=

### Slot 2

Some devices has 2 sim card slot, for print the second simcards imei use below:

Print IMEI - Slot 2
  
    service call iphonesubinfo 3 i32 2 | grep -oE '[0-9a-f]{8} ' | while read hex; do echo -ne "\u${hex:4:4}\u${hex:0:4}"; done; echo       
    
## ADB <small>settings</small>

#### List how many times we booted device:

    settings list global|grep "boot_count="|cut -d= -f2|head -n 1|xargs echo "Booted:"|sed 's/$/ times/g'

#### Hide Status bar

    settings put global policy_control immersive.status=*

#### Hide Navigation bar

    settings put global policy_control immersive.navigation=*

#### Hide both status and navigation bars

    settings put global policy_control immersive.full=*

#### Revert bars to stock configuration

    settings put global policy_control null*

##### It is also possible to specify this behavior for a specific application. 
##### Examples to modify the behavior when Enterprise Browser is in the foreground: 

    settings put global policy_control immersive.full=com.honeywell.enterprisebrowser
    settings put global policy_control immersive.navigation=com.honeywell.enterprisebrowser
    settings put global policy_control immersive.status=com.honeywell.enterprisebrowser

## ADB <small>content</small>

#### Trick device that setup already has been done (FRP Bypassing)

    content insert --uri content://settings/secure --bind name:s:user_setup_complete --bind value:s:1
    am start -n com.google.android.gsf.login/
    am start -n com.google.android.gsf.login.LoginActivity

#### Global/Settings/Secure

    content query --uri content://settings/global
    content query --uri content://settings/settings
    content query --uri content://settings/seure

#### Print files for all applications

    content query --uri content://media/external/file --projection _data

#### Select "name" and "value" columns from secure settings where "name" is equal to "new_setting" and sort the result by name in ascending order

    content query --uri content://settings/secure --projection name:value

#### Remove "new_setting" secure setting.

    content delete --uri content://settings/secure --where "name='new_setting'"

#### Download current ringtone and play on PC via ffplay: 

     adb shell 'content read --uri content://settings/system/ringtone_cache' > a.ogg|xargs ffplay a.ogg
 
#### Various ways to print contacts

     content query --uri content://contacts/phones/  --projection display_name:number:notes 
     content query --uri content://com.android.contacts/data --projection display_name:data1:data4:contact_id
     content query --uri content://contacts/people/

#### Print Contacts Phone Numbers:

     content query --uri content://contacts/phones/

#### Print Contacts Added In Groups:

     content query --uri content://contacts/groups/

#### Print Group Mmembership:

     content query --uri content://contacts/groupmembership/

#### Print organiztations: 

    content query --uri content://contacts/organizations/

#### Print Call Logs

    content query --uri content://call_log/calls

#### Print text from SMS sections

    content query --uri content://sms/conversations
    content query --uri content://sms/conversations
    content query --uri content://sms/draft
    content query --uri content://sms/inbox
    content query --uri content://sms/outbox
    content query --uri content://sms/sent

#### Print text from MMS sections

    content query --uri content://mms
    content query --uri content://mms/inbox
    content query --uri content://mms/outbox
    content query --uri content://mms/part
    content query --uri content://mms/sent
    content query --uri content://mms-sms/conversations
    content query --uri content://mms-sms/draft
    content query --uri content://mms-sms/locked
    content query --uri content://mms-sms/search

#### Auto rotation on

    content insert –uri content://settings/system –bind name:s:accelerometer_rotation –bind value:i:1

#### Auto rotation off
    
    content insert –uri content://settings/system –bind name:s:accelerometer_rotation –bind value:i:0

#### Rotate to landscape

     content insert —uri content://settings/system –bind name:s:user_rotation –bind value:i:1

#### Rotate portrait

     content insert –uri content://settings/system –bind name:s:user_rotation –bind value:i:0

## ADB <small>input</small>
     
#### Simulate a swipe down for notification bar:

    input swipe 0 0 0 300 
    
#### Swipe and unlock screen:

    input swipe 300 1000 300 500 

## ADB <small>wm</small>
     
#### Print Screen Resolution

    wm size

#### Set Screen Size

    wm size WxH 
    
#### Set Overscan:

    wm overscan 0,0,0,200
     
## ADB <small>getprop</small>

It is not so much to describe here, get info via getprop command. 

Example Usage

```sh
getprop | grep "model\|version.sdk\|manufacturer\|hardware\|platform\|revision\|serialno\|product.name\|brand"
```

#### Print CPU abi

    getprop ro.product.cpu.abi


#### Get info if OEM Unlock is Allowed

```ini
1 = Enabled
0 = Disabled
```

```sh
getprop sys.oem_unlock_allowed 
```

#### Is System boot completed
 
   getprop sys.boot_completed

## ADB <small>setprop</small>
     
#### Auto answer any call after 2 seconds:

    setprop persist.sys.tel.autoanswer.ms 2000

#### Turn off auto answer:
 
    setprop persist.sys.tel.autoanswer.ms 0

## ADB <small>/sys</small>

#### Set Screen Brightness 

#### Set Brightness Off

- 0 is the same as 1

    echo 1 > /sys/class/backlight/panel/brightness        

#### Set to maximum

    echo 48600 > /sys/class/backlight/panel/brightness 

#### Set to max normal

    echo 255 > /sys/class/backlight/panel/brightness 

#### Try vibrator
 
    echo 200 > /sys/class/timed_Example Output/vibrator/enable

#### Print USB Mode (Charging only, MTP)

    cat /sys/devices/soc0/hw_platform'

## ADB <small>sm</small>

#### Adopting USB-Drive
 
    sm set-force-adoptable true

## ADB <small>keytool</small>

#### Genereate hash from keystore  -Typically used in Facebook

    keytool -exportcert -alias your_alias -keystore debug.keystore | openssl sha1 -binary | openssl base64 

#### Typically used in Google Maps

    keytool -list -v -keystore ~/.android/debug.keystore -alias your_alias           
    
## ADB <small>monkey</small>

#### Test any app by pressing 10000 times at once, this will start your application and perform 10000 random events.# 

```sh
monkey -p com.example.myapp -v 10000 
```

Example Output
```ini
com.google.android.youtube/.app.honeycomb.Shell$HomeActivity
com.google.android.googlequicksearchbox/.SearchActivity
com.google.android.apps.docs.editors.docs/com.google.android.apps.docs.app.NewMainProxyActivity
com.android.documentsui/.LauncherActivity
com.google.android.apps.docs.editors.sheets/com.google.android.apps.docs.app.NewMainProxyActivity
com.google.android.apps.docs.editors.slides/com.google.android.apps.docs.app.NewMainProxyActivity
com.android.vending/.AssetBrowserActivity
```

## ADB <small>sqlite3</small>

#### Read Lock Settings: 

sqlite3 -line /data/user_de/0/com.android.providers.telephony/databases/telephony.db 'select * from locksettings;'

#### Read SIM Card info

```sh
sqlite3 -line /data/user_de/0/com.android.providers.telephony/databases/telephony.db 'select icc_id,card_id,carrier_name,display_name,mcc,mnc from siminfo'
```

Example Output
```ini
icc_id = 8946209802SSSSSSSSS
card_id = 8946209802SSSSSSSSS
display_name = CARD
mcc = 0
mnc = 0

icc_id = 8946209802SSSSSSSSS
card_id = 8946209802SSSSSSSSS
carrier_name = Telia
display_name = Telia
mcc = 240
mnc = 7
```

#### Print ICCID

```sh
sqlite3 /data/vendor/radio/qcril.db 'select ICCID from qcril_manual_prov_table'
```

#### Print data in .db files, clean:

    grep -vx -f <(sqlite3 Main.db .dump) <(sqlite3 ${DB} .schema) 
     
#### Use below command fr update dg.db file:
          
    sqlite3 /data/data/com.google.android.gms/databases/dg.db "update main set c='0' where a like '%attest%';" 

#### Grab all file extensions of a kind and download to PC

```sh
for i in `adb shell "su -c find /data /system -name '*.key'"`; do 
   mkdir -p ".`dirname $i`";adb shell "su -c cat $i" > ".$i";
done
```

#### Print uptime for your device by days + time

```sh
TZ=UTC date -d@$(cut -d\  -f1 /proc/uptime) +'%j %T' | awk '{print $1-1"d",$2}'
```

## Android <small>paths</small>

```ini
/data/ssh
/data/adb/magisk
/data/data/<package>/databases (app databases)
/data/data/<package>/shared_prefs/ (shared preferences)
/data/app (apk installed by user)
/system/app (pre-installed APK files)
/mmt/asec (encrypted apps) (App2SD)
/mmt/emmc (internal SD Card)
/mmt/adcard (external/Internal SD Card)
/mmt/adcard/external_sd (external SD Card)
```     

## Android <small>root</small>

Commands for rooted devices

#### Find out if the device is rooted and if su exist

    which su &> /dev/null;[[ $? = "0" ]] && echo "Rooted" || echo "Not rooted"

### Bypass Google Pay Block

#### Stop wallnetfcrel

     am force-stop /data/data/com.google.android.apps.walletnfcrel

     Hide root for Google apps:

```sh     
for google_apps in $(cmd package list packages|grep -i com.google |cut -d: -f2); do 
    magiskhide add ${google_apps}; 
done    
```

#### Change permissions on dg.db to read-and-write:
     
     su sh -c chmod 0777 /data/data/com.google.android.gms/databases/dg.db

#### Now change permissions on dg.db to 0444
     
     chmod 0444 /data/data/com.google.android.gms/databases/dg.db

Clear cache for your Google Pay application and have fun! :)

#### Grab all file extensions of a kind and download to PC

```sh
for i in `adb shell "su -c find /data /system -name '*.key'"`; do 
   mkdir -p ".`dirname $i`";adb shell "su -c cat $i" > ".$i";
done
```

## Android <small>wuseman's notices</small>

Find out happens when we remove below file

```sh
rm /data/misc/bootstat/boot_complete?
```


## Android <small>magisk</small> (updated version - zygisk - comming soon)

..... will be added very soon.

## Android <small>magisk</small> (older versions)

#### Enable magiskhide

     /sbin/magisk magiskhide enable
     
#### List hided apps by magisk 

    /sbin/magisk magiskhide list

#### Add package to magiskhide

     /sbin/magisk magiskhide add com.package
    
## ADB <small>commands sorted by brand</small>

#### Samsung

#### Bypass Samsung Health block on rooted samsung devices

     mount -o rw,remount /system/etc/mkshrc
     sed -i 's/ro.config.tima=1/ro.config.tima=0/g' build.prop

## ADB <small>screencap</small>
  
     screencap /storage/emulated/0/Pictures/screenshot.png
  
## ADB <small>screenrecord</small>

    screenrecord --time-limit 10 /storage/emulated/0/Video/record.mp4
 
## Android <small>FRP Bypass</small>

* [wuseman - Samsung Galaxy A10](https://github.com/wuseman/Samsung_Galaxy.A10_FRP.Bypass)
* [wuseman - Samsung Galaxy A10](https://github.com/wuseman/Samsung_Galaxy.A10_Rooting)
* [wuseman - Samsung Galaxy A5](https://github.com/wuseman/Samsung_Galaxy.A5_FRP.Bypass)
* [wuseman - Samsung Galaxy S10](https://github.com/wuseman/Samsung_Galaxy.s10_FRP.Bypass)
* [wuseman - Samsung Galaxy S8](https://github.com/wuseman/Samsung_Galaxy.S8-FRP.Bypass)
* [wuseman - Samsung Galaxy Xcover 4](https://github.com/wuseman/Samsung.Xcover.4-FrpBypass)
* [wuseman - Motorola Moto E4 Plus](https://github.com/wuseman/Motorola_Moto_E4.Plus.v7.1-FRP_BYPASS)
* [wuseman - Huawei MediaTab T5](https://github.com/wuseman/Huawei_Mediatab-T5-FRP-Bypass_V8.0) 
* [wuseman - LG G6](https://github.com/wuseman/LG_G6-FRP-Bypass)


## Similiar <small>websites</small>

#### Gentoo Wiki 

* [Gentoo Wiki - ADB](https://wiki.gentoo.org/wiki/Android/adb) (__Maintained by wuseman__)

#### Nr1 / wuseman 

* [Nr1 - Your journey to master Android™ Shell begins here](https://android.nr1.nu) 
* [wuseman - ADB Cheatsheet](https://github.com/wuseman/adb-cheatsheet)
* [Stackoverflow - Bluetooth](https://stackoverflow.com/a/55064471) 

#### ADB Shell

*[ADB Shell - Just Another ADB Cheatsheet wiki](https://adbshell.com/commands/adb-install)

#### Android
    
* [Android™ Developer - Emulator Console](https://developer.android.com/studio/run/emulator-console)
* [Android™ Developer - Write your app](https://developer.android.com/studio/write)
* [Android™ Google Source - Source Code](https://android.googlesource.com/)
* [Android™ Google Source - CMD Command](https://android.googlesource.com/platform/frameworks/native/+/master/cmds/cmd/)
* [Android™ Generic Project](https://android-generic.github.io/#documentation)
* [Android™ GDB](https://source.android.com/devices/tech/debug/gdb)
* [Android™ Source - Understand Logging](https://source.android.com/devices/tech/debug/understanding-logging)
* [Android™ Source - Network Connectivity Tests](https://source.android.com/devices/tech/connect/connect_tests)
* [Android™ Platform Tools](https://android.googlesource.com/platform/prebuilts/cmdline-tools/+/34a182b3646de1051ea2c9b23132d073bcaa5087/tools/bin/) 

#### Github 

* [Github Randorise - Mobile Hacking CheatSheet](https://github.com/randorisec/MobileHackingCheatSheet)

#### Mazhuang

* [Mazhuang - Awesome ADB - Another Cheatsheet Wiki](https://mazhuang.org/awesome-adb/README.en.html)

#### Jfsso

* [Jfsso - Preferences Editor](https://github.com/jfsso/PreferencesEditor)

#### Nahamsec

* [Nahamsec - Resources For Beginner - Bug Bounty Hunters](https://github.com/nahamsec/Resources-for-Beginner-Bug-Bounty-Hunters/blob/master/assets/mobile.md)

#### Raywenderlich

* [Raywenderlich -Forensic Artifacts](https://www.raywenderlich.com/3419415-hack-an-android-app-finding-forensic-artifacts#toc-anchor-002)

#### Noobsec

* [Noobsec - Bypass Fingerprint Lock In Just 1 Second](https://noobsec.org/project/2019-12-22-bypass-fingerprint-lock-in-just-1-second/)
* [Noobsec - Cara Reverse Engineering](https://noobsec.org/project/2018-11-04-cara-reverse-engineering-apk/)

#### Oracle 

* [Oracle- JVMS](https://docs.oracle.com/javase/specs/jvms/se9/html/jvms-4.html)

#### Tjtech

* [Tjtech - Analyze OEM Unlocking Under Android](http://tjtech.me/analyze-oem-unlocking-under-android.html)

#### U'Smile 

* [U'Smile - How to change the IMEI on Android devices](https://usmile.at/blog/how-to-change-imei-on-android-devices)

#### XDA Developers 

* [Android™ Q Navigation - Gesture Controls](https://www.xda-developers.com/android-q-navigation-gesture-controls/#fitvid892986)

## Get in <small>Touch</small>

Want your website listed here and you think you have something to contribute? 

Send me an email or contact me on ÍRC: 

- **iRC**: wuseman@**Libera**

Enter Libera's network via your own client 'chat.libera.chat:+6697 or use their new web client [here](https://web.libera.chat/).

- **Mail**: wuseman@**nr1.nu**

## Wiki <small>author</small>

- *wuseman <wuseman@nr1.nu\>**

## Wiki <small>License</small>

Android Nr1 nu wiki is licensed under the GNU General Public License v3.0 - See the [LICENSE.md](LICENSE.md) file for details

- Happy Hacking!

