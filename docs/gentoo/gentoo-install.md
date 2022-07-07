# gentoo-install
```sh

#!/bin/bash
# Author: ${USER}

# EDIT BELOW #########################################################################
# System disk
SYSTEM_DISK="/dev/sda"                                                # System disk
ROOT_PARTITION="/dev/sda3"                                            # Root partitom
BOOT_PARTITION="/dev/sda2"                                            # Boot partition
KEY_FILE="latitude_e5450__key.txt"                                    # Keyfile                 # (EDIT THIS)
VGNAME="latitude"                                                     # VGName                  # (EDIT THIS)
LVNAME="rootfs"                                                       # LVMName
DECRYPTED_DRIVE="${VGNAME}"                                           # VGName
MOUNT_DIR="/mnt/gentoo"                                               # Mount dir
USER="${USER}"                                                        # Username to use
CIPHER="twofish-xts-plain64"                                          # Chiper

######################################################################################

### Create partitions
# Check data
parted -a optimal ${SYSTEM_DISK} -s "print"

# Create labe
parted -a optimal ${SYSTEM_DISK} -s "mklabel gpt"

echo "Yes"|parted -a optimal ${SYSTEM_DISK} -s "mkpart primary 1 2"
echo "Yes"|parted -a optimal ${SYSTEM_DISK} -s "mkpart primary 2 1000"
echo "Yes"|parted -a optimal ${SYSTEM_DISK} -s "mkpart primary 1000 -1"
# Create partitions + set boot partiton to boot
parted -a optimal ${SYSTEM_DISK} -s "name 1 1"
parted -a optimal ${SYSTEM_DISK} -s "name 2 2"
parted -a optimal ${SYSTEM_DISK} -s "name 3 3"
parted -a optimal ${SYSTEM_DISK} -s "set 1 bios_grub on"
parted -a optimal ${SYSTEM_DISK} -s "set 2 boot on"
parted -a optimal ${SYSTEM_DISK} -s "set 2 esp on"
# Print result from above
parted -a optimal ${SYSTEM_DISK} -s "print"

# Creat keyfile
dd if=/dev/urandom of=${KEY_FILE} bs=8M count=1   # Create keyfile

#Wirte random data 
dd if=/dev/urandom of=${BOOT_PARTITION} bs=128M   # Write over old data

# Set foöesuste, up prefer
mkfs.ext4  ${BOOT_PARTITION}       # LEVACY
mkfs.vfat -F32  ${BOOT_PARTITION}  #FI

# fi Backup Key
# Backup yoru usb key during install in boot dir
# it is really easy to forget this and then you are
# fucked when you will reboot, allways backup your
# keyfile on another device for your own safet
# remove keyfile frmo boot when you have made a backup on a usb or something
mkdir ./temp
mount /dev/sda1 ./temp
cp ${KEY_FILE} ./temp/
umount ./temp/

# Encrypt drive
echo "YES"|cryptsetup -d ${KEY_FILE} --hash sha512 --iter-time 5000 --use-random --cipher ${CIPHER} luksFormat /dev/sda2
echo "YES"|cryptsetup -d ${KEY_FILE} luksOpen /dev/sda3 ${LVNAME}

# SetupLVM
pvcreate /dev/mapper/${LVNAME}
vgcreate ${VGNAME} /dev/mapper/${LVNAME}
lvcreate -l100%FREE -n${LVNAME} ${VGNAME}

# Ignore annoying error mesage 
mkfs.ext4 /dev/mapper/latitude-rootfs


# Create filesystem on boot and root
mkfs.ext4 /dev/mapper/latitude-rootfs
# 
# Prepare for downloading stage3
mkdir ${MOUNT_DIR}
mount /dev/mapper/${VGNAME}-${LVNAME} ${MOUNT_DIR}
mkdir ${MOUNT_DIR}/boot
cd ${MOUNT_DIR}
mount /dev/sda2 ${MOUNT_DIR}/boot

# Downloading stage3 and extractin
# Find todays stage 3 package on below link
#https://mirror.leaseweb.com/gentoo/releases/amd64/autobuilds/current-stage3-amd64
wget https://mirror.leaseweb.com/gentoo/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20210317T214503Z.tar.xz
tar xvJpf stage3-amd64-*.tar.xz --xattrs-include='*.*' --numeric-owner

# We want .bashrc_pofile as default and we remove stage3 tarball
cp -v /mnt/gentoo/etc/skel/.bash_profile /mnt/gentoo/root/
rm -v -f ${MOUNT_DIR}/stage3-amd64-*

# Setup default bashrc
cat << 'EOF' > /mnt/gentoo/root/.bashrc
export NUMCPUS=$(nproc)
export NUMCPUSPLUSONE=$(( NUMCPUS + 1 ))
export MAKEOPTS="-j${NUMCPUSPLUSONE} -l${NUMCPUS}"
export EMERGE_DEFAULT_OPTS="--jobs=${NUMCPUSPLUSONE} --load-average=${NUMCPUS}"
EOF

# Setup make.conf
cat << 'EOF' > /mnt/gentoo/etc/portage/make.conf
COMMON_FLAGS="-march=native -O2 -pipe"
CFLAGS="${COMMON_FLAGS}"
CXXFLAGS="${COMMON_FLAGS}"
FCFLAGS="${COMMON_FLAGS}"
FFLAGS="${COMMON_FLAGS}"
ACCEPT_LICENSE="*"
CHOST="x86_64-pc-linux-gnu"
ACCEPT_KEYWORDS="amd64"
USE=""
CPU_FLAGS_X86="mmx mmxext sse sse2"
PORTDIR="/var/db/repos/gentoo"
DISTDIR="/var/cache/distfiles"
PKGDIR="/var/cache/binpkgs"
LC_MESSAGES=C
PORTAGE_ELOG_CLASSES="info warn error log qa"
PORTAGE_ELOG_SYSTEM="echo save"
FEATURES="split-elog buildpkg"
VIDEO_CARDS="intel i915"
INPUT_DEVICES="libinput"
GRUB_PLATFORMS="pc"
EOF

cp -v ${MOUNT_DIR}/etc/skel/.bash_profile ${MOUNT_DIR}/root/
mkdir -p -v ${MOUNT_DIR}/etc/portage/repos.conf
cp -v ${MOUNT_DIR}/usr/share/portage/config/repos.conf ${MOUNT_DIR}/etc/portage/repos.conf/gentoo.conf
cp -v -L /etc/resolv.conf ${MOUNT_DIR}/etc/

# Mounting required folders for chroot
mount -v -t proc none ${MOUNT_DIR}/proc
mount -v --rbind /sys ${MOUNT_DIR}/sys
mount -v --rbind /dev ${MOUNT_DIR}/dev
mount -v --make-rslave ${MOUNT_DIR}/sys
mount -v --make-rslave ${MOUNT_DIR}/dev

# Create folders needed for portage
mkdir -p -v ${MOUNT_DIR}/etc/portage/package.use
mkdir -p -v ${MOUNT_DIR}/etc/portage/package.unmask
mkdir -p -v ${MOUNT_DIR}/etc/portage/package.mask
mkdir -p -v ${MOUNT_DIR}/etc/portage/package.licemse
mkdir -p -v ${MOUNT_DIR}/etc/portage/package.accept_keywords

# Edit keyboard lang for cli
sed -i 's/us/sv-latin1/g' ${MOUNT_DIR}/etc/conf.d/keymaps
 

# CHROOT
chroot ${MOUNT_DIR} /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"

# Remove/Purge news from devs
eselect news purge

# Set time and region
echo "Europe/Stockholm" > /etc/timezone
emerge -v --config sys-libs/timezone-data

# Sync portage
emerge --sync

# Install cpuid2cpuflags for get correct flags in make.conf
emerge --verbose --oneshot app-portage/cpuid2cpuflags
FLAGS=$(cpuid2cpuflags|cut -d: -f2);echo -e $FLAGS|sed 's/^/CPU_FLAGS_X86="/g'|sed 's/$/"/g'

# We want be sure that portage is up to date
emerge --ask --verbose --oneshot portage

# Install needed packages before creating kernel
echo -e "# custom by ${USER}\nsys-kernel/gentoo-sources symlink\nsys-kernel/genkernel cryptsetup\nsys-boot/grub:2 device-mapper\nnet-misc/dhcpcd" > /etc/portage/package.use/kernel

# Emerge required packages
emerge --ask gentoo-sources genkernel grub:2 

### Genkernel settings
sed -i 's/#OLDCONFIG="yes"/OLDCONFIG="yes"/g' /etc/genkernel.conf
sed -i 's/#MENUCONFIG="no"/MENUCONFIG="yes"/g' /etc/genkernel.conf
sed -i 's/#SAVE_CONFIG="yes"/SAVE_CONFIG="yes"/g' /etc/genkernel.conf
sed -i 's/#LVM="no"/LVM="yes"/g' /etc/genkernel.conf
sed -i 's/#LUKS="no"/LUKS="yes"/g' /etc/genkernel.conf
sed -i 's/#NFS="no"/NFS="yes"/g' /etc/genkernel.conf

# Create initramfsd
genkernel --lvm --luks initramfs

## GRUB
#...OBS OBS......................................
### For EFI  (GRUB)
grub-install --target=x86_64-efi /dev/sda --efi-directory=/boot/efi --boot-directory=/boot

### For legacy
grub-install /dev/sda
#...OBS OBS......................................

### Generate grub config
grub-mkconfig -o /boot/grub/grub.cfg


###  Remove force of a good pw
sed -i 's/8,8,8,8,8/1,1,1,1,1/g' /etc/security/passwdqc.conf
useradd -m ${USER}
passwd ${USER}
passwd root

### Now change back for a required good password
sed -i 's/1,1,1,1,1/8,8,8,8,8/g' /etc/security/passwdqc.conf

### Add our new user to groups below
for groups in tty lp wheel audio cdrom video usb input portage sshd kvm ; do 
   gpasswd -a ${USER} $groups; 
done

### Enable several packages for openrc
for apps in dhcpcd iptables hostname keymaps; 
   do rc-update add $apps
done

################################### ADD LATER
is_boot_mounted() {
	  mount|grep -iq boot
if [[ $? -gt "0" ]]; then

     echo "You must mount boot partition before we create kernel";
 #    exit 1
fi
}

############## ADD STUFF LASTER ##############

# Setup boot partiton in fstab
BOOT_UUID="$(sed 's/#LABEL=boot//g' /etc/fstab)"
BOOT_PARTITION="$(parted -a optimal /dev/sda -s print|grep -i boot|awk '{print $1}')"
BBOOT_DRIVE="$(parted -a optimal /dev/sda -s print|grep -i boot|awk '{print $1}')"
sed -i "s/#LABEL=boot/${BOOT_PARTITIOB}${NEW_BBOOT_UUID}" /etc/fstab
sed -"s/#LABEL=boot/$BOOT_PARTITION/g" /etc/fstab


# Setup correct UUID in fstab (obs: root and boto only, for swap you need it yourself since I don´t use fstab
DISK_UUID="$(blkid|grep -e latitude|grep -i 'UUID.*"'|cut -d'"' -f2)"
FSTAB_DISK="$(cat /etc/fstab |grep -i -i UUID|cut -d"=" -f2|grep -i ext4|cut -d' ' -f1|cut -d'/' -f1)"
sed -i "s/DISK_UUID/|FSTAB_DISK/g" /etc/fstab
sed -i 's/#UUID/UUID/g' /etc/fstab
```
