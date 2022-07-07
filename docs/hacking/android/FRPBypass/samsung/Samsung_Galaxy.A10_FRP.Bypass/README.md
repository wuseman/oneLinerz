# ROOT-SAMSUNG-A10

1. Download Samsung Galaxy A10 Firmware and save it on your PC. Your Current OS version and Downloaded Version AP and CSC should be Same.
2. Download forced_encryption_disabler, RMM State Bypass. 
- We Need to flash RMM State to avoid OEM Lock automatically in future after the Root process, and no-verity-opt-encrypt. We Need to flash encryption disabler to avoid Boot Warnings in the future after the Root process. Copy all these files to the external SD Card.

* https://www.dropbox.com/s/4vadsem1x5608mn/J4%2BJ6%2B_oreo_forced_encryption_disabler.zip?dl=1
* https://www.dropbox.com/s/gxxlnmjzqd5uk1k/RMM_Bypass_v3_corsicanu.zip?dl=1
* https://www.androidinfotech.com/no-verity-opt-encrypt-versions/
* https://www.dropbox.com/s/hkhpom931byup68/twrp-a10-3.3.1-0_afaneh92.tar?dl=1

3. Download 7Zip-ZS Install on your PC. Extract the files in downloaded firmware using 7Zip-ZS. You will get four data. Copy “AP.tar.md5” file to your mobile.
4. Download Magisk Manager (Download Latest version) or Magisk canary and Install it on your mobile. Open Installed Magisk and Select Install in Magisk, It will ask For zip file and Patch Boot Image File. Select the Boot Image file.
5. Wait for the process to complete, In the end, you will get magisk patched .tar file. The .tar file will be in the same folder where you have the Stock firmware file. ( will take some minutes )
6. Now you see you have magisk_patched.rar, copy it to your PC by adb pull /path/to/new.tar.file

# Flash Progress

1     Switch off your Mobile. Enter into Download mode->Volume Down+ Volume Up Buttons and Connect Your Mobile To PC via USB Cable, After Samsung Logo Appear, Release all keys.

2. Flash your device with odin and insted of default AP use our magisk patched tar file

3. After the process complete, Press Volume Down+ Power button to exit Download mode. When the screen goes off, Immediately Press Volume Up + Power buttons to boot into Recovery mode.

4. After entering into Stock recovery mode, Go to Wipe Data/Factory Reset and Select Yes to wipe data. It will erase your saved data in your device. Don’t Boot into OS, Read below Boot stages before booting

# Boot into Rooted OS

Press and Hold Volume Up + Power buttons, release all the keys once the Bootloader warning appears. You have to set up your device like a new device. You can select the root status using Root Checker.
Stock Recovery Boot – Press and Hold Volume Up + Power buttons, release keys while you hold the Volume Up key.
 You will see Magisk Manager in your App drawer. If you can’t find the app, you can install Magisk Manager in your mobile.

#### CONTACT 

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

#### WEB SITE

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman

#### END!
