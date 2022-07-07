> ⚠ IMPORTANT: This repo is updated daily, things can be removed / changed anytime - This text will be gone when I got things sorted and misspellings and other small things will be corrected during time, At bottom you will find the "proper" way how things should be done. I do not recommend **anyone to use my methods wich is tagged (DANGEROUS METHOD) if you do not know exactly what you are doing**! I really mean what I say, your computer will probably die and never be able to start again. No harm has been done on HP's property! 

<p align="center">
  <img src="https://i.imgur.com/haDz3G6.png" />
  <h2 align="center"># HP Wolf Security: The World’s Most Secure PC’s | Security</h2>
  <h3 align="center">---=== <i>Elitebook</i> - ThinClient - <i>EliteDesk</i> - PowerBook - Printers - BIOS  ===---</i></h3>
</p>

***

> ⚠ WARNING: YOUR COMPUTER WILL BE BRICKED - THERE IS NO GUARANTEES !!
> The author/developer in this repo can never be held responsible for the actions of other users and I have warned you! 
> If the computer is dead, you cant fix it without replacing the the motherboard. The chip alone is not enough. Call HP for assistance if you don't know how to solve it yourself, you may brick your warranty by follow this repo!

> ⚠ DANGER: This repo can contain illegal acts depending on the country you live in. It is strictly forbidden and it can end with high penalties such as imprisonment for fraudulent behavior. You are responsible for your own actions and you can never ever blame wuseman for your acts. **Manipulating** data of various things to deceive a third party by selling a computer where hardware figures are manipulated and false  warranty can be presented  is a very serious crime, in almost all countries.. I urge no one to commit crimes, I dedicate this repo to everyone as a non-profit hacker/cracker of software and hardware devices to show how you are deceived by advertising. 

***

<blockquote>

### [Video Introduction for Wolf Security: A New Breed of Endpoint Security | Security | HP ](https://www.youtube.com/watch?v=KOq4LutcLr0)

Please watch the video above to follow the story I will do overtime in this repo 
  
  "Hackers are also working from home, isn't it time you had a security that does too? "

</blockquote>

## HP's story:

* "[What It Really Takes to Catch a Hacker | HP](https://www.youtube.com/watch?v=OiUPrio9eVY)"
* "HP WOLF Security: The hacker is always on THE HUNT"
* "THE WORLD'S MOST SECURE AND MANAGEABLE WORKTATIONS"
* "PROTECT SENSITIVE DATA AND IP, WITH HARDWARE-ENFORCED SECURITY"
* "Sure Start Protects the Bios"
* While in the case of WIPER of ransomware attacks or hadware attacks. Sure Recovery provices fast, effective recovery"

....... it never ends, it's crazy they talk so much and provide 0 proofs, 0!!!...... 

## wuseman story:

> My banner is from by HP and the hoodie guy is what HP refers to the "bad guys" and they are the wolves ..

![Screenshot](https://i.imgur.com/eDALA4S.png)

### If the bolded text is true ..... We are more vulnerable then ever? 

.. Then we should be we able to hack the Bios within seconds ....... is my first thought?

"They laught at me because i'm different. I laught at them becuase they all are the same with economic interests." / Edited quote, from Joker!

HP: My first bios I managed to hack was from Compaq and since that day when I was 6 years old I have followed your developers for over 30 years now. We do not have to guess, we know how good your employees are from asia with extremely small salaries while you pull in billions on misleading and false advertising. Who are the "bad guys" in your ads? We'll see. This repo will be updated frequently and recurring as you develop your security. 

***

My first thought that appeared immediately was, if I short circuit the chip it will (please notice healing) heal itself not `recover/restore` itself, `healing` is an unusual word in these terms. I decide to belive my thoughts and the results can be found below .

Sounds crazy? Maybe.. Not for me.. I love to try crazy things which should be "impossible". I have strangely enough succeeded with many crazy and wierd "hacks" of all kind that should not be possible BUT I will not lie for anyone, I have also failed a lot before I got older and wiser. These are things I will talk about that when I retire, until then I will continue to do everything in my power to try to hack time to count backwards. =) 

## Bypassing/Hacking Secure Boot as a pro (to be updated)

Visit Rod Smiths wiki for get a deeper knowledge, its an awesome wiki imo and cover everything that is worth to know imo even for none refind users:

https://www.rodsbooks.com/refind/installing.html

![securebootauthrequired](https://user-images.githubusercontent.com/26827453/174450636-801f3c80-20d6-4809-8478-4375c436be39.jpg)

## This part is for Gentoo Users - Scroll down to skip this 

Before you will try anything I wanna tell you that you are able to bypass the secure boot protection if you have some linux skills. Windows setups can be installed always since the certs are from microsoft, ubuntu and kubuntu I know have preinstalled shim installed.

This will fix this so we can boot Gentoo Minimal CD because with secureboot enable you gonna be stopped by the picture as above that says "image did not authenticate".

* BACKUP THE KEYS FROM OLDER INSTALL BEFORE YOU DOING ANYTHING STUPID AS ERASE OR RESE THE KEYS

```sh
* sys-boot/mokutil
     Available versions:  (~)0.3.0_p20170405 (~)0.5.0-r1
     Homepage:            https://github.com/lcp/mokutil
     Description:         The utility to manipulate machines owner keys which managed in shim
```

```sh
* sys-boot/shim
     Available versions:  15.5-r1
     Homepage:            https://apps.fedoraproject.org/packages/shim/
     Description:         Fedora's signed UEFI shim
```

### Install shim and mokutil, no useflags are available so we just installing them as usual, you also gonna need openssl since we need this for create keys and also ca-certificates for the certs but they are probably already installed but if not:

```sh
emerge -av sys-boot/mokutil sys-boot/shim app-misc/ca-certificates dev-lib/openssl
```

### First, list all enrolled or new keys

```sh
mokutil --list-enrolled
[key 1]
SHA1 Fingerprint:....
...
[key 2]
SHA1 Fingerprint:....
```

### List new keys

```sh
mokutil --list-new
```

### You can check the current secureboot state with:

```sh
mokutil --sb-state
```
### You want to export the current keys if there is any, of course ;)

```sh
mokutil --export
```

The above command will give you .der keys in the folder you execute the command, files is named: MOK-00**.der, save all those files in some encrypted container or at least secure place (security is always nr1, encrypt everything) before you deleting them and adding new ones!

### You now want to delete the old keys, you can use wildcard for this part as below: 

```sh
mokutil --delete MOK*.der
```

### If you want, set root password: 
```sh
sudo mokutil --root-pw
```

* ....or a custom password
```sh
sudo mokutil --password
input password: 
input password again: 
```

* Rebooted and answer the questions (comming soon more detailed) and see if the keys has been deleted ;) 

**Enjoy the removal of the old keys! You are l33t!**

### Create your own keys/setup enrollment

Verify that MOK is enabled. Use the following commands on the target to enable or disable MOK:
```sh
mokutil --enable-validation
mokutil --disable-validation
```

You use this password to manage keys using mokutil and to confirm their enrollment and other operations when the MOK manager is running. In addition to console input, mokutil supports other methods to input the password.

### Enroll a key certificate.

Convert a standard PEM key to a DER-formatted X509 certificate for shim_cert.cer and vendor_cert.cer.
```sh
openssl x509 -in shim_cert.crt -inform PEM -out shim_cert.cer -outform DER
openssl x509 -in vendor_cert.crt  -inform PEM -out vendor_cert.cer  -outform DER
```

### Enroll the shim_cert.cer certificate.
```sh
mokutil --import shim_cert.cer

```
### You must set up the password for this MoK manipulation request, as this password is required by the shim loader in the next reboot.

### Review the key enrollments.

Use the following command to verify whether a key is active already or not:

```sh
mokutil --test-key shim_cert.cer
```

```sh
mokutil --test-key vendor_cert.cer
```
Since the vendor_cert.cer key is the built-in certificate in the boot loader, is is enrolled during the first boot. Use the following command to list the current key enrollment requests:

```sh
mokutil --list-new
[key 1]
SHA1 Fingerprint: .........
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
```
### Now Reboot the target.

***

### Once the target reboots, the Shim UEFI Key Management screen is displayed where you are given below options

***

* Press: Continue boot


* Press: Enroll MOK, choose yes!
* 
![enroll_our_new_keys](https://user-images.githubusercontent.com/26827453/174450638-f1f15251-a47f-4cf1-8a04-ee5714dd6358.jpg)


* Enroll key from disk
* Enroll hash from disk

![mokmanagment](https://user-images.githubusercontent.com/26827453/174450642-3b4397de-f6de-4074-9945-04bcc63c0029.jpg)

* Enroll your keys and enter password. Enjoy

### Some pictures of things that failed / appeared when I played with this. There is no explanation but just sharing them for fun.

![security_viaolation](https://user-images.githubusercontent.com/26827453/174450646-9758006c-8ccf-444f-8266-fa970fa45bc0.jpg)
![sha256hash](https://user-images.githubusercontent.com/26827453/174450649-577c386e-08f6-40e5-90c5-12dbb5f8d83b.jpg)
![createderfiles](https://user-images.githubusercontent.com/26827453/174450650-4708dcd0-7757-4bbe-8f8b-dce63ae75df8.jpg)

***

## Lets Try Short Circuit the Chip

There is alot of people trying this already since the protection has been very good (Started with Probooks), but no public releases for the latest HP devices has been found. Good question below and good answer was provided on the url below, it simply depends! Again, be careful

"Long story short when testing some IC chips in circuit and powered on I must have touched a couple legs at once causing a chip to short. My quick question, is this damage usually contained just to the chip itself or does it spread to surrounding resistors and capacitors etc.? No smoke or burnt components or anything like that."

```sh
Q: Is this damage usually contained just to the chip itself or does it spread to surrounding resistors and capacitors etc? 
A: It Depends....
```

It's a very hard question to answer, really. Hack to learn not learn to hack and you will figure out ;)

[IC Chip short circuit repercussions](https://gearspace.com/board/geekzone/1291898-ic-chip-short-circuit-repercussions.html)

## HP EliteDesk 800 GX + G5 (DANGEROUS METHOD)

```sh
Born On Date................: `2022-03-01`
Secured by latest features..: `yes`
Bios Chip...................: `25B127DSIG`
BiosProgrammer..............: `CH341a`
Require Bios Programmer.....: `no`
Level of difficulty.........: `simple`

* Tools Recommended:

   Microscope so you can watch the legs so you are not shortcuits the wrong one by mistake

* Tools Required..............: 

  1x Phillips screwdriver 
  1x Tiny wire (I used 2 mini grabbers for safety)  
  
```

G5 has extra features then older elitebooks for bios password. It is possible to set security settings to "Ignore" the cmos jumper and reset reset button if pressed on motherboard. If the setting is set to IGNORE you are fucked, you will NOT not succeed in getting around without programmers. so if you try on this unit and do not understand why it does not work, it is precisely because it can ignore this that many other Elitedesk can NOT.

### The clip is easy to find, its under the below nvme disk (if you have two) and you can read the chip via a Soic Clip 8

![nvme slot2](https://user-images.githubusercontent.com/26827453/174450658-fae959b2-ee8a-4011-ab28-9bbbf011bab9.jpg)
![clip_chip](https://user-images.githubusercontent.com/26827453/174450661-536f8994-e3ee-4292-9761-0ea87b4d4e45.jpg)

> THIS WILL BRICK YOUR PC - DO IT ON YOUR OWN RISK!! 
> PLEASE NOTICE THE LEGS 1, 7, 8 are from my PICTURE, NOT FROM THE DATASHEET!!!

* A wire on pin  1 and 7 for ~1.2s erased Intel Firmware 
 
* A wire on pin  1 and 8 for ~1.0s bios noticed something happend and restore itself

*  A wire on leg  1 and 8 for ~3.0s erased Bios Password 

### Pins

![pins](https://user-images.githubusercontent.com/26827453/174450667-b98250c9-1d28-4d43-bf94-b55cb2ed9a00.jpg)

### Impressive, I was wrong about all this, well well. After 1 touch on pin 1 and 8 (notice just a touch like in 0.1ms) we gonna see below

![1s_is_not_enough](https://user-images.githubusercontent.com/26827453/174450675-fc4798b0-045f-4e48-9d82-0cf66b9225ff.png)


* I still don't trust their shit so before I saying I was wrong and they won, I try 2. seconds!
* Since ages back in the days for some reason I know 4.2 seconds will brick the device if we touch the pins. And this is something I just has figured out on many devices, I can't confirm or promise it will work the same for you so dont listen on this if you didnt try and then cry in pm to me

* I tried to hold a wire on leg 1 and leg 8, now things happens! Bios missmatch! Now its dangerous, and I'm not as impressed anymore. One more wrong and things will be bricked, Now it's 50/50 .. HP or wuseman, who's right? It will not be a fourth time I know from past experience.
![bios_missmatch](https://user-images.githubusercontent.com/26827453/174450685-4fce9deb-9fc1-4514-bc9d-7690aff7921e.jpg)

### Fuck it, i´m to curios and since ages i know 4.2 seconds is the limit for break things as I said so I decided to try: 3.0 seconds while PC was ON running as normal....
### after 3.0s I pull the AC and keep it off for 25 seconds.. The PC wont die itself so you must pull the AC

* REMOVE THE BATTERY BEFORE DOING THIS!

### Holy maria! it does not even start!

![it_does_not_start](https://user-images.githubusercontent.com/26827453/174450693-e79397e7-7952-47a6-b82f-736473fba07d.gif)

### Leaving AC out and pressing power button for 25 seconds, gave life to the computer, damn now it flashes red and beeps every time the led flashes! According to the HP dev manual for what 3 x beeps + 3 red flashing indicates its the CPU or GPU. What the hell? It should be 4.2 seconds before it breaks on cpu, mem, motherboard, bios or gpu!

### Fuck, now things was bricked! I thought

![Screenshot](leds_blinking_red.gif)

### ...After device is blinking red and fan had run at 10k rpm few times we finally have device booting, THUMBS UP! HP's manuals sucks! ;-)

![fan_run_at_max](https://user-images.githubusercontent.com/26827453/174450701-855e2c0f-2bc1-4362-935e-863d5bfcd7f2.gif)

### First screen we gonna see is that date is wrong, i didnt fix a picture on this. just press continue

### Second screen we gonna see is that intel firmware is fucked, press ok

![intelfirmfucked](https://user-images.githubusercontent.com/26827453/174450704-c505bca0-6704-47f5-a2c0-16e62e36097b.jpg)

### Intel firmware install is in progress

![intel_firmware_running](https://user-images.githubusercontent.com/26827453/174450708-3f8f6179-eb9c-4d4f-96e4-79602b297b38.jpg)

### Device reboots after a while and reading bios up to 16M will start and finally you will see the below screen.

![bios_part2](https://user-images.githubusercontent.com/26827453/174450712-dd169030-e04c-4ee7-9c65-1c630454abf2.jpg)

### Next screen takes us to to gbe recovery (will it never ends?)

![network_gbe_upgrade_getting_started](https://user-images.githubusercontent.com/26827453/174450728-50e67d51-9852-4b03-b80e-b936863c593d.jpg)

### Now it want us to upgrade once again, i choose yes

![import_update](https://user-images.githubusercontent.com/26827453/174450732-f3f8f163-7ee0-42c1-b74c-583d07178665.jpg)

### After the shortcuit and few reboot, it was time to enter bios and see if its password protects!! IT IS GONE!

![bios_removed_lol](https://user-images.githubusercontent.com/26827453/174450736-f56a7435-5a3d-4c52-a35b-7a85324d93fa.jpg)

### Now, feel free to set your own bios password and then press F11 and choose network recovery

* Worlds most secured BIOS that has hardware protection was "hacked" in ~3.0 second! We are now able to take over windows also! (will be added later) 
* The only question I have to HP is, did you never try this? 
* Do you now understand why I want to have a technical analysis for your tests? You talk about losses, re-start by showing your winnings based on false advertising instead.
* You are a scam and fooling your customers with fabricated statistics! **Fuck you!**

***
* If HP's bios is the most secure bios in the world that will protect the companies from hackers incl. tpm protections and keys and keep the real black hats away from private data then  it's just as true that I'm sitting on the planet "Jupiter" and writing this, there are no laws and rules here so therefore I do not break any laws and rules here, ezi! .. Idiots ... 

***

* *In hps advertising, they are the bad guys, and I the wolf hence the banner! Fuck you HP ... This is just the first part, I will update this repo with MORE proofs of your lies, next up is laptops followed by printers. Stay tuned!

***

## General info about Elitedesks!

### There is another switch on the motherboard, its not easy to find and the switch is not available wiht chassi closed

![hidden_button](https://user-images.githubusercontent.com/26827453/174450744-cd83a0c3-7b20-4b02-9851-a57581b041d4.jpg)
![switch2](https://user-images.githubusercontent.com/26827453/174450748-bc6452ab-8071-4d4b-9de9-c5d07e93df15.jpg)

### I Really recommends to use a ´better clip then the cheap ones, spend some money for a 3M clip ~20-30€, the chip black ones from china sucks as hell! After 2-3 grabs it's not possible to grab the clip anymore. (probably thats why they sell those clips in 4-6xPackets on amazon - DONT BUY THOSE!!! >See yourself below after FEW grabs, it destroys the chip after few times)

![soic8_did_this](https://user-images.githubusercontent.com/26827453/174450763-af915af7-784e-4780-8668-32f91649aa3f.jpg)

### HP Sure Adminm / HP Sure Run and Secure PLatform Management is not provisioned anymore

![spm_not_prov](https://user-images.githubusercontent.com/26827453/174450757-c56fb05e-048c-42f8-bdc4-178f76b8c1fd.jpg)

### You are now the full admin of the system and you can erase old TPM and take over this part

![tpm_cleared](https://user-images.githubusercontent.com/26827453/174450766-8b4ec8f6-962c-49e2-8f4b-cf5de14a0be5.jpg)

### Followed by reset all security featrures, not eve theft protection will help the owner, we can permanent disable this (permanent is not permanent as forever, we can rewrite the chip ofc)

![reset_all_security_features](https://user-images.githubusercontent.com/26827453/174450772-15d71a79-4eb7-44ef-ba5f-e053e11d0347.png)

## Invalid Manifest

If you got problems with system recovery via F11 and bios gonna say there is a problem with manifest as: "error finding valid manifest" do as below (this problem was a mess with my Elitebook 870 G3 to figure out and solve, hp now have a help part for this for several models on their site, not all devices are affected - Visit hp for more info if needed)

![c06425212](https://user-images.githubusercontent.com/26827453/174450775-95cdda85-2478-4666-b0c2-9a2691b3f3a1.png)

### To avoid the issue:**

* Do not initiate a Preboot network enabled feature when the computer is on low battery power.
* Avoid pressing the power button.
* Do not use the CTRL+ALT+DEL key combination to restart the computer while a download or upload is in progress.
* To work around this issue, perform the following steps to reset the IPv4 configuration:

```sh
1. Power on the computer.
```

```sh
2. Press F3 to enter the 3rd Party Option ROM Management menu.
```

```sh
3. Navigate to Network Device List -> MAC:xx:xx:xx:xx:xx:xx -> IPv4 Network Configuration.
```

```sh
4. Uncheck Configured.
```

```sh
5. Select Save Changes and Exit.
```

***

## Help with password removal 

I don't know if I will add this part here yet but upload your bios dump to any of the forums and I will help you or someone else will do, 

I am active there too for this stuff. Please dump the right file and not the firmware file from EFI file. 

If you really don't know what im talking about, find me on irc and I will remove the password for you, for free, dont pay for things you don't need ;)

Cheers!

## Bios Upgrade via Linux

DOwnload the bios for your device @hp.com
extract the .exe file:

```sh
7x x spXXXXX.exe
```

```sh
mkdir -p /boot/EFI/HP/BIOS/{New,Previous,Old,Current,Temp}
mount /dev/bootPartiton /boot
```

```sh
cp spXXXXX.exe/*.{bin,ini} /boot/EFI/HP/BIOS/New
unmount /boot/
reboot
```

Now, enter F9 and choose to boot from ifle, choose the correct file.

Bios will now upgrade

## Method 2 

After you moved the correct file to New path on boot partition

Turn off PC, while you holding win+b press power button for 2 seconds, release the power button but keep press win+b

Bios upgrade should now start. 

![manually_update_via_linux](https://user-images.githubusercontent.com/26827453/174450780-b50cf107-189a-4dc3-aaec-4b404a3f7e55.jpg)

Happy Upgrading!

## HP Elitebook 870 G3 (DANGEROUS METHOD)

Belive it or not. You maybe thought it was just luck what I was trying, as I did. So i decided to ask a friend to try in his PC as well. See the result below, brand new laptop:

I wont add all pictures again, i will show you the really needed pictures otherwise you can follow the same step as above its the same story for elitebooks with the latest bioses that is self-healing (really latest models only)

So .. Short circuit trick is dangerous but I wanted to confirm this for Elitebooks also.. It's no coincidence, it's wuseman power.. nah is not, its because HP fucking sucks! I guess they spent billions of dollars in their ads and their bios is hacking by short cuiiting their bios chip and then we dont even need to fix it, it healing itself! This has to be the dumbest thing I've ever been through. As I said, it also works on elitebook! Same legs from my view, same seconds (3.0seconds) on a different chip, i toke some picture on it with my microscope. See below, no descriptions will be added unless its something I really wanna share since its the same story as above dangerous method. there is fucking expensive clips for WSON chips for ~100-300$, these. If you are careful enough, you can do the same as me, otherwise you have to take the heat gun and solder and stuff.


### Same as above but on the elitebook i was able to take a picture, this is how it looks after we boots first time when device has been acting as the elitedesk

* Didnt start
* Caps lock led + numlock led was flashing 7 times ( i will add a video later i cant find it now )
* fan runs at 10k rpm or something, rebooting and doing this for few times and we now got into this screen:

![timeisinvalid](https://user-images.githubusercontent.com/26827453/174450787-aac12da8-0407-45ed-945e-3b09c1cb58d2.jpg)

### This never happened on elitedesks only on elitebook, I guess thats cause the software and efi can't communicate anymore since the bios was erased and now healed 

![nosystem](https://user-images.githubusercontent.com/26827453/174450799-16efc4ad-1040-428a-ab43-32b037da372c.jpg)

### Sure Recovery, every screen that will popup

### Downloading Boot.wmi

![boot wim](https://user-images.githubusercontent.com/26827453/174450804-1942af37-3c8c-4e3d-8584-a2d7be755999.jpg)

### Downloading Boot.sdi

![boot sdi](https://user-images.githubusercontent.com/26827453/174450807-d37723bb-50f0-4f41-9433-1ee3253dc812.jpg)

### Downloadintg BCD 

![bcd](https://user-images.githubusercontent.com/26827453/174450816-944f3180-40ee-4876-acd5-7b2b11ec3a05.jpg)


### Device that was hacked in 3.0 seconds and I confirmed the same shit works on this healing bios. But i don't recommending anyone to try, use the safe method otherwise you may get a broken cpu,gpu,mem,motherboard or anything:

![system_info](https://user-images.githubusercontent.com/26827453/174450821-aa87c196-263f-4d60-bbe5-e4bd9107941d.jpg)

### Connect to wifi via CIRCA (F3 in bios menu)

* WIFI REQUIRED SINCE THERE IS NO ETHERNE INPUT ON THIS ONE 

![1111](https://user-images.githubusercontent.com/26827453/174450831-3cae7c9a-df65-4fd4-9993-295ca4ed5861.jpg)
![wifi](https://user-images.githubusercontent.com/26827453/174450834-76b5b38b-c9f6-4528-b226-227711533ab6.jpg)

### Preparing HP Setup + Windows

![IMG_20220131_141511](https://user-images.githubusercontent.com/26827453/174450839-3ad789f8-fd35-4a37-b23c-471ac2f8d4b5.jpg)

### WSON Bios Chip 

* 870 G3 chip is a Winbond 25Q256JVEN 2111 6048 CZ900 
* Tested my new microscope usb, not perfect photos but it was the first time I used it :P
* 
![20220131133624067](https://user-images.githubusercontent.com/26827453/174450849-a0e28f40-2994-41a5-880c-79c808769d17.jpg)
![20220131133352413](https://user-images.githubusercontent.com/26827453/174450851-a360ed93-813d-47f6-86e4-c48bfd9478ff.jpg)
![chip4](https://user-images.githubusercontent.com/26827453/174450855-fc8eca37-374d-489e-a3c4-7bf40bb7935a.jpg)
![chip5](https://user-images.githubusercontent.com/26827453/174450856-4ae2f3c4-2957-4314-8ec1-0fd1ff9f80ec.jpg)

* Other chips for test the microscrope, they pretty good.

![20220131133237569](https://user-images.githubusercontent.com/26827453/174450865-cb7c4e32-c46b-4453-a558-9592b24e5f95.jpg)


### Now we have a valid license and activated Windows 10 from stock, now go reinstall firmware and get the hell out of Windows (nah, we must run some stuff here before we do that, i will add how we gonna take over TPM later)

![legally_installed_home_edition](https://user-images.githubusercontent.com/26827453/174450872-850741e7-e3d4-42fc-8f23-8f18921a9c7b.jpg)

# Recommended, safe way. Follow the same steps as on elitedesk but you need either a modded clip or a wson programmer, here is my modded one.

### My special clip in progress

![my_custom_clip](https://user-images.githubusercontent.com/26827453/174450876-f2abeabf-4297-49b8-8b4a-f4ea635177d7.jpg)
![myclipconnectedtowsonchip](https://user-images.githubusercontent.com/26827453/174450878-4bb39a64-d224-4ac0-b576-c2bc91b462fd.jpg)

- Enjoy!

## Elitebook 820 - Programmer required!

The Short CIRCUIT will NOT work on this device!!! Use your programmer to dump bios and remove the password with prefered hexedit tool
and write it back to device without the  the bios password, its now fully unlocked! =D

My modded custom clip grabbed this one aswell, you must have the pins outside the clip as on my picture the above for being able to touch the solder from the pins on the board since there is no legs, if you using a default clip it will just grab the black area and it will probably end like the picture below. See the zoomed version what happens with a non-modded / wson clipper (this is for avaoid soldering, that´s  boring rly)

![custom_clip_on_wson](https://user-images.githubusercontent.com/26827453/174451038-1c57051d-5d97-4b5d-92c2-230da18e258a.jpg)

![impoissble](https://user-images.githubusercontent.com/26827453/174451040-3883df6c-467d-4587-80cf-416dddeefb7b.png)

.. If you get your clip working, there is better and more serious custom made SOP WSON SOIC VSOP SPI FLASH 8P 1.27mm on stores online, below is the modded ones from stores. Normal price on amazon is ~100-300$ but some stores in asia sell them for ~40$ - I would recommend a such one instead, its rly cool works on ALL 4x2 chips and you wont need solder anymore, connect it to your programmer or ardunio and start hack the bios dump.. 
 
![1](https://user-images.githubusercontent.com/26827453/174450891-e42c676c-12f4-4191-9076-23d9c95cd352.jpg)
![2](https://user-images.githubusercontent.com/26827453/174450893-4d25c8d3-59a8-445b-9c4c-afe4b858a1e7.jpg)
![3](https://user-images.githubusercontent.com/26827453/174450894-ab167bec-3cf6-40b5-89e8-01dd56593256.jpg)

I have nothing more to add here, programmer required here and if you short circuit this and think you will succeed, I can promise you, you wont! Already failed on ~2 few years ago and no new bios has been released so just buy a programmer and do it the proper way, but if you really wanna try - Go for it, i don't care and don't ask me for help about this model. Its old and and sucks! 

Cheers

## Repair SPM:

> This is only needed if you short circuited the bios, otherwise you can fix this in bios settings under security.

### For fix the SPM if its not possible to fix this from bios security settings, see below:

If you short cuited the chip, the output from below command will be alot of wierd text and looks like a mess.

```sh
Get-HPSecurePlatformState
```

It should be like: 

```
State             : NotConfigured
Version           : 1.0
Nonce             : 0
FeaturesInUse     : None
EndorsementKeyMod : {0, 0, 0, 0...}
SigningKeyMod     : {0, 0, 0, 0...}
```

For fix this, please see below (it will works if your output is messed up as well, i never saved the output but you will understand what I mean if you get there and typing the command above) - You also needs HP Sure Admin and HP Recovery from HP's download page (will add urls later, search on hp and you will find for now)

```sh
openssl req -x509 -nodes -newkey rsa:2048 -keyout key.pem -out cert.pem -days 3650 -subj "/C=US/ST=State/L=City/O=Company/OU=Org/CN=www.example.com"

openssl pkcs12  -inkey key.pem -in cert.pem -export -keypbe PBE-SHA1-3DES -certpbe PBE-SHA1-3DES -out kek.pfx -name "HP Secure Platform Key Endorsement Certificate"  -passout pass:test

openssl req -x509 -nodes -newkey rsa:2048 -keyout key.pem -out cert.pem -days 3650 -subj "/C=US/ST=State/L=City/O=Company/OU=Org/CN=www.example.com"

openssl pkcs12 -inkey key.pem -in cert.pem -export -keypbe PBE-SHA1-3DES -certpbe PBE-SHA1-3DES -out sk.pfx -name "HP Secure Platform Signing Key Certificate" -passout pass:test
```

```sh
New-HPSecurePlatformEndorsementKeyProvisioningPayload -EndorsementKeyFile .\kek.pfx -EndorsementKeyPassword test `
             | Set-HPSecurePlatformPayload
 New-HPSecurePlatformSigningKeyProvisioningPayload -EndorsementKeyFile .\kek.pfx -EndorsementKeyPassword test  `
            -SigningKeyFile .\sk.pfx -SigningKeyPassword test  | Set-HPSecurePlatformPayload
```

Now please check again :

```sh
State             : ProvisioningInProgress
Version           : 1.0
Nonce             : 1581536418
FeaturesInUse     : None
EndorsementKeyMod : {236, 247, 128, 76...}
SigningKeyMod     : {194, 160, 105, 233...}
```

So this is about it, when working with Secure Platform Management. To view any associated logs, you can use the Get-HPFirmwareAuditLog function. The last thing you may want to do is deprovision. For this, you will need the endorsement key:

```sh
New-HPSecurePlatformDeprovisioningPayload -EndorsementKeyFile .\tests\testdata\nopw\kek.pfx `
-EndorsementKeyPassword test   | Set-HPSecurePlatformPayload
```

SPM with HPCMSL in the Enterprise

So how would you plug HPCMSL in your enterprise to manage SPM? The solution is meant to be management console agnostic, so whether you use SCCM, Intune, Ivanti, or whatever else, these are the basic steps:

* Install HPCMSL  in a secure location, and place your certificates here.
* Also Install HPCMSL on your managed clients
* In the secure location, use  HPCMSL to generate a secure payload, as described above, using one of the New-* functions.
* Copy this secure payload to your clients via your process of choice. Do not copy your certificates.
* On your clients, apply the payload generated in 3. above, via the Set-HPSecurePlatformPayload function.

All commands can be found here: 

* [Developers Portal](https://developers.hp.com/hp-client-management/doc/firmware?language=es-un)

## Hacking Bios Password


## Via Linux:

Please visit flashrom for more info if you are a newbie, dont guess anything before you trying. If possible, try on something else that may not brick your PC before you trying on your real pc if you are new in this world:

Wel well, download flashrom (i prefer install things from the source and not via package manager with this kind of tools)

### Download flashrom and Signature
wget https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2
wget https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2.asc

You should next verify that the key's full fingerprint matches that listed on the flashroms website:
```sh
gpg --verify ... you should know this
awk '/SHA512 HASH/{getline;print}' flashrom-v1.2.tar.bz2.asc | sha512sum --check
flashrom-v1.2.tar.bz2: OK
flashrom-v1.2.tar.bz2.asc: OK
```

### Extract flashrom

```sh
tar -xvf flashrom-v1.2.tar.bz2

or if wanna skip the signature part, downaload and extract via stdin

wget -c https://download.flashrom.org/releases/flashrom-v1.2.tar.bz2 -O - | sudo tar -xj
```

### Install flashrom

```sh
cd flashrom-v1.2
make -j$(nproc)
```

### If there is no errors, move on with `make install` and now, use your programmer, see available programmers via typing flashrom only and you will get all available `programmers`

Now lets continue

This is the The Secure/Recommended/Best way to erase the bios password by dump the current bios file, remove the password via prefered hexeditor, write the hacked dump without any password back to chip, voila - Done! Well, its not that easy maybe but follow below steps and everything will be fine :) 

### Flashrom will detect your chip and know its model by itself:

* Read Chip

```sh
flashrom -p ch341a_spi -r
```

* Read and Backup*

```sh
flashrom -p ch341a_spi -r -o bios_elitebook_backup.bin
```

or

```sh
flashrom -p ch341a_spi -r > bios_elitebook_backup.bin
```
### Now erase the bios with password protected bios

```sh
flashrom -p ch341a_spi -E
```

You don't need to remove the password from the bin file from a hexeditor, bios will "heal" itself.. Please try. If im wrong, just remove the password via hexedit (this will not be covered in this repo at the moment, will add a tutorial how you can do this without uploading your file for help later) and re-write the chip:

### Not needed if you are on latest models, but in case you wanna do it:

```sh
flashrom -p ch341a_spi -w hacked_bios_file_with_no_pw.bin
```

### On older bios versions, you must crack the password OR remove the password from bios file with a hexeditor

> ⚠  READ + SAVE YOUR BIOS BEFORE YOU ERASING IT IN CASE SOMETHING GOES WRONG!

## Windows

Download NeoProgrammer v2.2.0.10 and put the clip on the chip, read bios for backup and then erase it, done!

![reading_chip](https://user-images.githubusercontent.com/26827453/174450930-bdd0cdaa-30ff-4869-a074-63c8ab12f98a.png)
![neoprogrammer](https://user-images.githubusercontent.com/26827453/174450937-9bebef2e-d336-4eba-8b94-fd1076a4899c.png)


### On older bios versions, you must crack the password OR remove the password from bios file with a hexeditor and write the new bios file to the chip - You should know how to do this if you reading this.

### More devices will be added, to be continued!


***

## Advanced Tools / Recommended Tools - Windows:

Greetings to Jeff, all resepect!

[RWEverything - All versions](http://rweverything.com/download/)

![Screenshot](http://rweverything.com/wp-content/uploads/RWEverything.png)

... Alot more to be added very soon

## HP Urls:

* [HP BIOS Configuration Utility](http://ftp.ext.hp.com//pub/caps-softpaq/cmit/HP_BCU.html)
* [HP BIOS Configuration Utility FAQ](http://whp-hou4.cold.extweb.hp.com/pub/caps-softpaq/cmit/whitepapers/HP_BCU_FAQ.pdf)
* [Client Management Script Library](https://developers.hp.com/hp-client-management/doc/client-management-script-library?language=es-un)


### References

* [Daniel Enberg - How To Deploy HP BIOS Settings Using SCCM and HP BIOS Configuration Utility
](https://www.danielengberg.com/hp-bios-configuration-utility-sccm/)

* [Some HP Laptops Have A Hidden Keylogger That Hackers Can Activate](https://www.techtimes.com/articles/216912/20171212/some-hp-laptops-have-a-hidden-keylogger-that-hackers-can-activate.htm)

* [August, 2010 - Bios Password Hack for HP EliteBook Part 1
](https://syntaxerrorready.wordpress.com/2010/08/24/bios-password-hack-for-hp-elitebook-part-1/)

## Contact

  If you have problems, questions, ideas or suggestions please contact me on *_wuseman@nr1.nu_  - For faster contact visit Libera irc network or the webchat and type '/msg wuseman hi!' in the input bar and I will reply to you ASAP.
  
  Enter Libera's network via your own client 'chat.libera.chat:+6697 or use their new web client [here](https://web.libera.chat/).
