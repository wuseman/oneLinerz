# Acer (Chromebook) - C740

This repo is far from done, it can be updated any time.

This repository is created for To share with me knowledge and everything is done for educational purposes. I take no responsibility whatsoever over other users' responsibility and I urge no one to use these methods to bypass and remotely lock the chromebook.

*All pictures is from my Google Pixel 4 device, got few q about that* 🤖

![banner](https://user-images.githubusercontent.com/26827453/174461711-87e5c8db-fb6d-49c2-a161-2a38fd2691cd.jpg)
![banner_2](https://user-images.githubusercontent.com/26827453/174461713-b42fd85d-271d-4f92-9330-73a424c45389.jpg)

### Unbrick a bad flash 
Bypass a remote locked Chromebook (Acer C740) wich will be my device for show and give you examples, it works same for all laptops no matter what sytem you run.

I always want to find out what's going on on the other side and not only know how to get things done but because I love learning new things and then I need to know how it goes when locking a chromebook as an administrator, so if if you want to learn more, you can create a Google Admin account that costs some money, but it's worth it, so you do not have to speculate about what your chef / teacher can see, but I will not address that here and now. until later. A chromebook that is first via the remote control and leaves a message on the screen that the device should te.x return to X and on the phone number X so the serial number must be changed, this is how they lock the device and it is possible to get past by flashing bios with a new rom. For this you need three things.

1. Bios Programmer (I use ch341a myself) 
2. One 8 soic clip (recommended: don't buy a cheap one, they will last 1-3 times then you wont be able to attach the clipper again and it is annoying something extreme so go for a 3M one)
3. A new rom (this can be found on variou places online)

Either you can buy a fixed clip or you can connect cables as I do in the banner.

### A pre-fixed clip + contact (price for this is usually ~1€->3€, you can get over them cheaper but in avg this is the price)

![8_soic_clip-done](https://user-images.githubusercontent.com/26827453/174461718-cf19682b-e661-48da-9b5b-6267afa7baa2.jpg)

### A custom made clip if you are really poor you can get a clip from ~0.1$

![8_soic_clip-done-custom](https://user-images.githubusercontent.com/26827453/174461720-69add387-cc68-4448-9313-975c3f98be81.jpg)

### How should i place pins?

![8_soic_clip-done-custom_pins](https://user-images.githubusercontent.com/26827453/174461724-4e38ab76-2cf5-4670-b1cd-1d1f02f3ca03.jpg)
![8_soic_clip-done-custom_pins2](https://user-images.githubusercontent.com/26827453/174461726-717de3a4-c66d-4a23-9c74-3b3af1d99b40.jpg)

### CH341 as a programmer OR a reader

From store, you will get a jumper for pins, hence my own jump on the picture but when 1&2 are bracked the device is conifgured as a programmer:

![Screenshot](ch3441_as_a_ftdi_sio_reader.jpg)

If you remove the jumper the ch341 is a serial console reader, as a TTL Serial Converter (ftdi rs232, for example) adapter:

![Screenshot](ch341a_dmesg_jumpered.png)

The dot i marked is were the VOLTAGE should be, this is really really important otherwise your ship may burn:
![Screenshot](ch341_programmer_voltage_dots.jpg)

## Flashing

##### First we need flashrom, install as below: 

Gentoo:

    emerge --ask flashrom

Ubuntu/Debian/Kali/Mint: 

    apt-get install flashrom
     
MrChromebox:

    wget https://mrchromebox.tech/files/util/flashrom_20200918.tar.gz && tar -zxf flashrom_20200918.tar.gz

#### Test connectivity and ensure the flash chip is properly identified:

    flashrom -p ch341a_spi

#### Extract old BIOS:

    flashrom -p ch341a_spi -r old_bios.rom
    
#### Write new BIOS: 

It's really important to wait until whole process is done, it will also VERIFY the new bios

    flashrom -p ch341a_spi -w new_bios.rom
    
##### Thats it :) 

# ChromeOS Hacking

##### Change serial/service number/tag

     vpd -i RO_VPD -s serial_number=xxxxxxx" (xxxxxxx is the Service Tag of the system

##### Verify that things has been written:

      vpd -l

# Misc:

We are not allowed to browse mrchromebox archive site but after some digging I found 'cbmodels.json' and from here we can get all files (sorry if you don't like this), so with below command you can download all roms from mrchromebox wiki (they all are stored under roms)

     curl -sL https://nr1.nu/archive/chromebook/misc/cbmodels.json|grep -Eo '(http|https)://[^/"].*rom'| xargs wget -q --show-progress

Also available from: 
 
     https://github.com/wuseman/Acer_Chromebook-C740/tree/main/roms
     
##### Firmware Sources for Google ChromeOS

    https://cros.tech/
    https://cros.tech/table
    https://cros-updates-serving.appspot.com/

##### GREP latest firmwares for your chromebook model (grunt in this example): 

    elinks -dump https://cros-updates-serving.appspot.com/|grep -i grun |cut -d' ' -f3|xargs wget -q --show-progress

##### Very good explanation from Raymond Genovese how to reset the pins so I decided to include this in this repo: 

    https://forum.allaboutcircuits.com/threads/resetting-a-bios-chip-very-manually.153848/#post-1322752

"Resetting that chip is very simple. Find the reset pin. It is active low. Connect that pin to ground for at least a us. Of course the chip has to be powered and you have to make sure that you are not applying a ground signal to the pin if it is being held high, unless the circuitry can support that. A reset returns the chip to the power on state. A reset does not erase the flash memory.

On the 8-pin package it is a little more complicated and it depends on some other factors. In fact, the pin that you would use to perform the reset can be programed as an I/O pin and not a reset pin.

I know your question specifically asks if you should do that with or without power and I am intentionally avoiding answering that at this point except to say that if no power is on anywhere, you will not be resetting the chip.

My guess is that you do not really want to reset the chip; you want to reset a portion of your BIOS that is stored on the chip and you hope that you can do that by simply resetting the chip. It is possible that when the system boots up, it looks at that pin/line (which again can be configured as I/O) and if it reads as GND while it is booting up (i.e., it would normally be high); it interrupts the normal boot and executes special code that re-writes dedicated areas of memory that hold configuration data (exactly the kind of data that can appear to brick the machine if it gets corrupted). That could, therefore, be a way that a technician might be able to restore the factory defaults  if the code exists to do so. That is possible, but you would need to make certain it is the case and not just hope it is because it is also possible to do additional damage, especially if you very little experience with such matters.

In my opinion, it is not possible to clear the BIOS by resetting the chip alone. I had an unpleasant experience attempting to help someone who was following such a train of thought (with a different computer) and it was a one way trip. I regret that I ever had attempted to help him at all. But that was my choice and I am willing to help you if I can, as are many others on here.

So, to cut to the chase, how did the computer get trashed and what is it doing or not doing? Why did you decide that you needed to perform the reset to reinstall the factory BIOS settings? Have you already tried any of the many fixes on YouTube and the like?"

### Requirements

A chromebook device, soic 8 clip and a ch341 eeprom/bios reader

### Contact

If you have problems, questions, ideas or suggestions please contact me by posting to wuseman@nr1.nu

### Web

Visit my websites and profiles for the latest info and updated tools

https://github.com/wuseman/ && https://nr1.nu && https://stackoverflow.com/users/9887151/wuseman
