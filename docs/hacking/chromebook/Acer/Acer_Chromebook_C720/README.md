# Acer C720

How to hack any Acer C7(4)20 Chromebook that has been locked remotely by admin and how easy it is to take control over a chromebook

![c720](https://user-images.githubusercontent.com/26827453/174461655-7e6872f6-2fa1-4cfa-a027-40bb8e1e20e0.jpg)

Whole process from the first time we start this device until device will enter enrollment and there is nothing we can do more then see the process happening and then its out of our control (if we are not the admin)

![1](https://user-images.githubusercontent.com/26827453/174461657-5f8cea41-07d7-436d-8fd1-ae54fa64b41f.jpg)
![2](https://user-images.githubusercontent.com/26827453/174461659-afe20964-e264-48b8-84f5-b31832500eda.jpg)
![3](https://user-images.githubusercontent.com/26827453/174461660-08ed4809-1f21-4f07-8445-e27acd2446da.jpg)
![4](https://user-images.githubusercontent.com/26827453/174461661-fcf2018c-67bc-42d3-ab57-7730e485af7a.jpg)
![5](https://user-images.githubusercontent.com/26827453/174461662-b9a6f5c1-6220-4669-96c7-101573a9f850.jpg)
![6](https://user-images.githubusercontent.com/26827453/174461665-cb379918-9a6e-43b6-97e9-2194951983b9.jpg)
![7](https://user-images.githubusercontent.com/26827453/174461666-ab14f741-3e95-4503-b9a3-1015ffc5edeb.jpg)


So, are we pwned? Of course not nothing is impossible!! Now let us hack this device

* First of all, you must unscrew all screws and then when you opened the bottom of the laptop you must now remove the write-protection screw. Also, remove the battery:
* 
![wp](https://user-images.githubusercontent.com/26827453/174461667-ba02f146-f8a9-4ea5-8688-b4d8a3164b7d.jpg)
![wp2](https://user-images.githubusercontent.com/26827453/174461668-998b04d4-6b11-40f2-a0f4-99fd21e2c0a7.jpg)

* Now, with your bios/eeprom programmer you can read and overwrite the current bios. The bíos chip is the below one: 

![clip](https://user-images.githubusercontent.com/26827453/174461669-2513ea3a-3778-495b-8a86-aebf9fa52126.jpg)

Once clip is conncted and your programmer found the clip, backup the current data on the chip:

```sh
flashrom -p ch341a_spi -r acer_c720p-locked.bin
```

# Write a clean bios to the chip:

```sh
flashrom -p ch341a_spi -w new_bios.bin
```

### Kernel commandline:

	cros_secure console= loglevel=7 init=/sbin/init cros_secure root=PARTUUID=7154669e-fca8-7e42-a967-fb4d9fa17343/PARTNROFF=1 rootwait rw dm_verity.error_behavior=3 dm_verity.max_bios=-1 dm_verity.dev_wait=0 dm="1 vroot none ro 1,0 2539520 verity payload=ROOT_DEV hashtree=HASH_DEV hashstart=2539520 alg=sha1 root_hexdigest=9c99ef74f8143304bad67f5ca941b0c0ccda3b0f salt=e5c44164a1e83b080c2d60e769953ba0a6138c654da4e929a1500825363be829" noinitrd vt.global_cursor_default=0 kern_guid=7154669e-fca8-7e42-a967-fb4d9fa17343 add_efi_memmap boot=local noresume noswap i915.modeset=1 tpm_tis.force=1 tpm_tis.interrupts=0 nmi_watchdog=panic,lapic iTCO_vendor_support.vendorsupport=3 

### Modules

Default modules for C720


```sh
Module                  Size  Used by
cmac                   12903  2
rfcomm                 28294  4
i2c_dev                13075  0
uinput                 17359  0
memconsole             12517  0
ath3k                  16819  0
snd_hda_codec_realtek    36389  1
btusb                  38875  0
btrtl                  12493  1 btusb
btbcm                  12876  1 btusb
btintel                13157  1 btusb
bluetooth             316837  33 ath3k,btbcm,btrtl,btusb,rfcomm,btintel
zram                   17580  1
zsmalloc               13082  1 zram
snd_hda_codec_hdmi     35766  1
uvcvideo               70677  0
videobuf2_vmalloc      12897  1 uvcvideo
videobuf2_memops       12617  1 videobuf2_vmalloc
videobuf2_core         31555  1 uvcvideo
snd_hda_intel          39591  5
snd_hda_codec         138464  3 snd_hda_codec_realtek,snd_hda_codec_hdmi,snd_hda_intel
snd_hwdep              13442  1 snd_hda_codec
snd_pcm                76877  3 snd_hda_codec_hdmi,snd_hda_codec,snd_hda_intel
snd_page_alloc         17260  2 snd_pcm,snd_hda_intel
fuse                   70564  2
nf_conntrack_ipv6      13689  2
nf_defrag_ipv6         12884  1 nf_conntrack_ipv6
ip6table_filter        12540  1
ip6_tables             21995  1 ip6table_filter
snd_seq_midi           12848  0
snd_seq_midi_event     13511  1 snd_seq_midi
snd_rawmidi            22993  1 snd_seq_midi
snd_seq                53235  2 snd_seq_midi_event,snd_seq_midi
snd_seq_device         13234  3 snd_seq,snd_rawmidi,snd_seq_midi
snd_timer              27201  2 snd_pcm,snd_seq
ath9k_btcoex          120187  0
ath9k_common_btcoex    12819  1 ath9k_btcoex
ath9k_hw_btcoex       375415  2 ath9k_btcoex,ath9k_common_btcoex
ath                    22041  3 ath9k_btcoex,ath9k_hw_btcoex,ath9k_common_btcoex
mac80211              377318  1 ath9k_btcoex
cfg80211              159864  3 ath,ath9k_btcoex,mac80211
joydev                 17112  0
```

### lspci

```sh
00:00.0 Host bridge: Intel Corporation Haswell-ULT DRAM Controller (rev 0b)
00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT Integrated Graphics Controller (rev 0b)
00:03.0 Audio device: Intel Corporation Haswell-ULT HD Audio Controller (rev 0b)
00:14.0 USB controller: Intel Corporation 8 Series USB xHCI HC (rev 04)
00:15.0 DMA controller: Intel Corporation 8 Series Low Power Sub-System DMA (rev 04)
00:15.1 Serial bus controller [0c80]: Intel Corporation 8 Series I2C Controller #0 (rev 04)
00:15.2 Serial bus controller [0c80]: Intel Corporation 8 Series I2C Controller #1 (rev 04)
00:1b.0 Audio device: Intel Corporation 8 Series HD Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 1 (rev e4)
00:1f.0 ISA bridge: Intel Corporation 8 Series LPC Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 8 Series SATA Controller 1 [AHCI mode] (rev 04)
00:1f.3 SMBus: Intel Corporation 8 Series SMBus Controller (rev 04)
00:1f.6 Signal processing controller: Intel Corporation 8 Series Thermal (rev 04)
01:00.0 Network controller: Qualcomm Atheros AR9462 Wireless Network Adapter (rev 01)
```


### SSHD

sshd is already installed and running but you wont be able to ssh into the device from another device because iptables is active and is set to DROP everything as default:

```sh
Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             state RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     icmp --  anywhere             anywhere            
ACCEPT     udp  --  anywhere             224.0.0.251          udp dpt:mdns
ACCEPT     udp  --  anywhere             239.255.255.250      udp dpt:1900
NFQUEUE    udp  --  anywhere             anywhere             NFQUEUE num 10000
ACCEPT     tcp  --  anywhere             anywhere             tcp dpt:ssh

Chain FORWARD (policy DROP)
target     prot opt source               destination         

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
NFQUEUE    udp  --  anywhere             224.0.0.251          udp dpt:mdns NFQUEUE num 10001
NFQUEUE    udp  --  anywhere             239.255.255.250      udp dpt:1900 NFQUEUE num 10001
ACCEPT     all  --  anywhere             anywhere             state NEW,RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere    
```

Just allow port 22 or clear iptables:

```sh
iPV4="$(grep . /proc/net/fib_trie)"
iPV6="$(grep  '.' /proc/net/if_inet6)"; 

if [[ -n "${iPV4}" ]]; then 
printf "%25s\n" | tr ' ' '-'
printf "%s\n" "Removing all ipv4 rules"
iptables -P INPUT ACCEPT 
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F &> /dev/null
iptables -t mangle -F &> /dev/null
iptables -F
iptables -X
printf "%s\n" "...Done"
fi

if [[ -n "${iPV6}" ]]; then 
printf "%25s\n" | tr ' ' '-'
printf "%s\n" "Removing all ipv6 rules"
ip6tables -P INPUT ACCEPT
ip6tables -P FORWARD ACCEPT
ip6tables -P OUTPUT ACCEPT
ip6tables -t nat -F &> /dev/null
ip6tables -t mangle -F &> /dev/null
ip6tables -F
ip6tables -X
printf "%s\n" "...Done"
fi
printf "%25s\n" | tr ' ' '-'
```

Try ssh again, root works fine.

NOTICE: You must set a root password before you can ssh into the device


### Set chromeos devpassword:

```sh
PASSWD_FILE='/mnt/stateful_partition/etc/devmode.passwd'
pass=$(openssl passwd -1)

mkdir -p "${PASSWD_FILE%/*}"
chmod 600 "${PASSWD_FILE}"
echo "chronos:${pass}" > "${PASSWD_FILE}
```

### VPD:

This is funny. The remote lock is locking devices via the serial number and as root we can list the currect info about device via vpd -l and we are also allowed to write new serial number without any hacking needed, the screw must be removed (see the top of post, WP-Screw)


* vpd -i RO_VPD -s serial_number=xxxxxxx
* hit enter
* verify that our new serial has been written:
* vpd -l

Read more about VPD and how it works on url: https://chromium.googlesource.com/chromiumos/platform/vpd/

Touche! :) 


