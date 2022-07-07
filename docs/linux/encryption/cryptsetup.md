# cryptsetup/luks/lvm

Encrypt, format, overwrite, zeroing and alot more for secure your system / drives

!!! warning "I will use DRIVE="<disk>" fyi, change <disk> to your disk before you using any of the below commands, they are very powerful and will break your system if you doing it wrong! Be careful"

### `DISK` is entire HDD andm `1`,`2` and `3` is partition in this wiki

	1 = `Grub`
	2 = `Boot/Esp`
	3 = `Root`
	K = `KeyFile`
	U = `USB Drive For Keep Our KEY!`
	H = `Header Backup`
	E = `External Encrypted Drive`

* Variables

```sh
DISKU="/dev/sda"
DISKE="/dev/sdb"
DISK1="/dev/nvme0n1"
DISK1_1="/dev/nvme0n1p3p1" 
DISK1_2="/dev/nvme0n1p3p2" 
DISK1_3="/dev/nvme0n1p3p3" 
DISK1_K="$(hostname)"
DISK1_H="$(hostname)_header_backup"
```

### Generate 4096-bit random key file

```sh
dd if=/dev/urandom of=${DISK1_K} bs=8M count=1
```

### Add a key file to next free key slot. This will prompt for a passphrase. 

!!! notice "You can have up to 8 slots."

```sh
cryptsetup luksAddKey /dev/${DISK1} ${DISK1_K}
```

### Add a key file to specific key slot, e.g slot 2

```sh
cryptsetup luksAddKey --key-slot 7 /dev/${DISK1_3} ${DISK1_K}.key
```

### View key Slots

!!! tip "(use | `grep Slot if needed`)"

```sh
cryptsetup luksDump ${DISK1_3}
```

### Remove key from key slot. Enter pasphrase or specify key file to remove. 

!!! notice "The slot will automatically be detected and slot key removed."

```sh
cryptsetup luksRemoveKey ${DISK1_3}
cryptsetup luksRemoveKey ${DISK1_3} ${DISK1_K}.key
```

### Add password to a luks volume when we only have a keyfile

```sh
cryptsetup -d ${DISK1_K}.key luksAddKey ${DISK1_3}
```

### Create header backup

```sh
cryptsetup luksHeaderBackup ${DISK1_3} --header-backup-file ${DISK1_H}.img
```

### Encrypt Dríve

```sh
cryptsetup -d ${DISK1_K}.key --key-description kiss_my_fucking_ass --cipher twofish-xts-plain64 --hash sha512 --iter-time 5000 --use-urandom luksFormat ${DISK1}
```

### Decrypt and luksOpen our Drive With keyFile 

```sh
cryptsetup -d ${DISK1_K}.key luksOpen /dev/sdc usb
```

### View status of the map

```sh
cryptsetup -v status /dev/mapper/rootfs'
```

### Zero the partition prior to formatting

```sh
dd if=/dev/zero of=/dev/mapper/${DISK1_VGName} status=progress
```

### Urandomize the partition prior to formatting

```sh
dd if=/dev/urandom of=/dev/mapper/${DISK1_VGName} status=progress
```

### Format LUKS and use ext4 filesystem

```sh
mkfs.ext4 /dev/mapper/${DISK1_VGName}
```

### Decrypt and Mount

```sh
cryptsetup luksOpen ${DISK1_3} <choosen_name>
mount /dev/mapper/${DISK1_3} /mnt/<choosen_name>
```
### Close and Unmount the LUKS partition

```sh
cryptsetup luksClose /dev/mapper/${DISK1_VGname}
```
	
### For lazy cows! Just edit the drivename or partition (BE CAREFUL)


```sh
#!/bin/bash
### Author: wuseman
### Encrypt and mount hdd

DRIVE=""/dev/nvme0n1p4"
KEY=".key_files/virtual-vmware.key"
PVNAME="/dev/mapper/vmware"
LVMDRIVE="/dev/mapper/virtual-vmware"
MOUNTPATH="/mnt/vmware"
	
mkdir ~/.key_files
dd if=/dev/urandom of=${KEY} bs=8M count=1

cryptsetup -d ${KEY} \
	--iter-time 5000 \
	--use-random \
	--cipher twofish-xts-plain64 \
	--hash sha512 luksFormat ${DRIVE}

cryptsetup -d ${KEY} \
	luksOpen ${DRIVE} vmware

pvcreate ${PVNAME}
vgcreate virtual  ${PVNAME}
lvcreate -l1100%FREE -nvmware virtual
mkfs.ext4 ${LVMDRIVE}
mkdir ${MOUNTPATH}
mount ${LVMDRIVE} ${MOUNTPATH}
```	

	
	
