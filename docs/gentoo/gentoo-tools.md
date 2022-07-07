# gentoo-cheatsheet 

Here is my personal wiki I created during years when I worked with Gentoo shell, 
feel free to use/copy/link this wiki as you wish but please add a url to my wiki.

### qxpak

*  manipulate xpak archives

![qxpak](https://user-images.githubusercontent.com/26827453/168084001-d3a5e16c-511e-4217-93d3-7d49434cd3a8.png)


### qkeyword

* list packages based on keywords

![qkeyword](https://user-images.githubusercontent.com/26827453/168083420-98873763-dc35-4189-8c79-0d2c1437cf59.png)
![qkeyword2](https://user-images.githubusercontent.com/26827453/168083432-4a31fd26-ec85-4df5-a3d4-fd38d1989997.png)

![qdropped](https://user-images.githubusercontent.com/26827453/168083658-b6c555a0-bb3f-4777-b68b-0360254b6e66.png)

### qsize

* calculate size usage

![1](https://user-images.githubusercontent.com/26827453/168079721-0b851f77-ed62-40fb-9fd4-9bb095602caf.png)

### qlop 

* emerge log analyzer

![Screenshot_20220512_124333](https://user-images.githubusercontent.com/26827453/168077349-f38fe013-ebaf-4046-8225-0da762e79c5f.png)


![qlop](https://user-images.githubusercontent.com/26827453/168076806-a75790c1-1445-446a-8ea2-69878190dc8d.png)

### quse 

* find pkgs using useflags & print useflag description and much more

![13221313](https://user-images.githubusercontent.com/26827453/168077908-b50dac67-777b-4acf-81c6-e0286cdda8f6.png)

### qtegrity

* verify files with IMA

![qtegrity](https://user-images.githubusercontent.com/26827453/168084318-9f4fc6c4-858f-400b-8d81-311f602870d9.png)

### qsearch 

* search packages and descriptions and much more really really quick but its not faster then eix yet

![2313131](https://user-images.githubusercontent.com/26827453/168079053-47b2bcff-743e-4da7-a0ab-666a4765ae15.png)

* qsearch vs eix

![21312313112313](https://user-images.githubusercontent.com/26827453/168078555-7f72d3ef-0a1c-4275-b0cb-9edc6fac0d59.png)

### qcheck

* verify integrity of installed packages

![qcheck](https://user-images.githubusercontent.com/26827453/168080040-1d80a0b4-3f81-4253-954f-c40c575d21d8.png)

### qwhich

* as which but for gentoo ebuild and packages

![22](https://user-images.githubusercontent.com/26827453/168080606-022b0955-12d5-410c-a70a-4cfe0df01261.png)

### qgrep 

* like RipGrep or The Silver Searcherbut for Gentoo ebuilds

![qgrep](https://user-images.githubusercontent.com/26827453/168080917-ee2f34e3-aa41-44f2-9a1c-97fe088070e3.png)

### qmanifest 

*  verify or generate thick Manifest files

### gpg signature is invalid 

* I doing this readme while I wait for portage to be finished  and all is cool :)

![qmanifest](https://user-images.githubusercontent.com/26827453/168081676-18597ffb-6085-489e-8e93-2dc37039a58e.png)

### qatom

![1231](https://user-images.githubusercontent.com/26827453/168081307-db140f84-63b0-484d-9bc8-47af7ca3d523.png)

### qfile

* list all pkgs owning files

![qfile](https://user-images.githubusercontent.com/26827453/168082244-be6061b6-2c59-4756-b81a-d0ba2401d61d.png)

### qpkg

*  create or manipulate Gentoo binpkgs

![qpkg](https://user-images.githubusercontent.com/26827453/168082423-b5d80944-dfe8-4cd0-864c-248fa3ac3ab3.png)

### qtbz2

![qtbz2](https://user-images.githubusercontent.com/26827453/168082592-58f09cd0-b2c6-47c2-a6d2-7f1ba22f0f0b.png)

### qdepends

* show dependency info

![qdepends](https://user-images.githubusercontent.com/26827453/168082947-4c6f6b75-8c7e-4ac0-9c0c-8ba10e625d49.png)


### eshowkw

*  Display keywords for specified package or for package that is in pwd
*  eshowkw is i from gentoolkit package and is not in stage3

![gentoolkit eshowkw](https://user-images.githubusercontent.com/26827453/168084691-ef2e63da-a129-4746-bcb0-2e1dfa06866e.png)


### Sync and update Portage tree via emerge

```sh
emerge --sync                                                                                              
```

### Sync and update Portage tree via eix

```sh
eix-sync -a; eix-update -a      
```

### Sync all repositories that are set to auto-sync including the Gentoo ebuild repository

```sh
emaint -a sync                                                                                             
```

### Sync the Gentoo ebuild repository using the mirrors by obtaining a snapshot that is (at most) a day old: 

```sh
emerge-webrsync                                 
```

### Upgrade entire system                                                           

```sh
emerge -avuDN --with-bdeps y --keep-going world                                                            
```

### Upgrade all installed packages, dependencies, and deep dependencies that are outdated or have USE flag changes

```sh
emerge -uDU --keep-going --with-bdeps=y @world                                                             
```

### Run if you edited any use flags

```sh
emerge --update --changed-use --deep --quiet @world                                                        
```

### Install a package but excluding it from the world file

```sh
emerge --oneshot www-client/firefox                                                                       
```

### List what packages would be installed without installing them: 

```sh
emerge -pv www-client/firefox                                                                              
```

### Ask portage what would be installed when installing firefox

```sh
emerge -a www-client/firefox                                                                               
```

### Make configuration files up-2-date if needed

```sh
etc-update                                                                                                 
```

### Fix static library

```sh
lafilefixer --justfixit | grep -v skipping                                                                 
```

### Remove packages no longer needed: 

```sh
emerge -av --depclean                                                                                      
```

### Reverse dynamic library Dependency

```sh
revdep-rebuild                                                                                             
```

### Clean old distfiles

```sh
eclean -d distfiles                                                                                        
```

### List installed packages

```sh
qlist -IRv                                                                                                 
```

### List installed packages more clean

```sh
qlist -I           
```

### Obtain descriptions and usage of the USE flag X using euse: 

```sh
euse -i X                                                                                                  
```

### Obtain a description of the png USE flag: 

```sh
euse -i | grep png                                                                                         
```

### Show what packages have the mysql USE flag:

```sh 
equery hasuse mysql                                                                                        
```

### Show what packages are currently built with the mysql USE flag: 

```sh
eix --installed-with-use mysql                                                                             
```

### Show what USE flags are available for a specific package: 

```sh
equery uses <package-name>                                                                                 
```

### View the last 10 emerges (installs): 

```sh
genlop -l | tail -n 10                                                                                     
```

### View how long emerging LibreOffice took: 

```sh
genlop -t libreoffice                                                                                      
```

### Estimate how long emerge -uND --with-bdeps=y @world will take: 

```sh
emerge -pU @world | genlop --pretend                                                                       
```

### Watch the latest merging ebuild during system upgrades: 

```sh
watch genlop -unc             
```

### List all existing overlays: 

```sh
eselect repository list         
```

### List all installed overlays:  

```sh
eselect repository list -i                                                                                
```

### Sync layman repos

```sh
layman -S            
```

### List all existing overlays: 

```sh
layman -L                                                                                                  
```

### List all installed overlays: 

```sh
layman -l                      
```

### Show packages explicitly installed.    

```sh                                                                         
cat /var/lib/portage/world   
```

### to show all the installed packages, including dependencies.  

```sh                                                                          
equery list *
```

### Read news about Portage updates.

```sh
eselect news read                                                                                         
```

### Search for a package to see what exists.

```sh
emerge -s package                              
```

### Like above, except it will search all the descriptive text in addition to the package name. Note that Regular Expressions are used for this search.

```sh
emerge -S package                                                                                        
```

### To see the effect of USE flags on the specified package (requires gentoolkit).

```sh
equery uses package
```

### Pretend to install a package, in order to show a preview of the dependencies, etc. that will be installed in total.                                                 

```sh
emerge -p package
```

### Like above, except it will ask to proceed after showing a preview of what will happen.                                                                                  
```sh
emerge -a package   
```

### to install quietly, omitting all the technical compilation output.                                                                                       

```sh
emerge -q package                                                                                         
```

### to update all packages explicitly installed, as well as their dependencies and their build dependencies, pretending at first.

 ```sh
emerge -uD --with-bdeps=y @world -p                      
```

### like above, except changes to USE flags will also be considered in determining what needs to be re-built.
emerge -uDN --with-bdeps=y @world -p                                                                       #
```

### to resolve changes to config files made by Portage updates.

```sh
etc-update                                                                                                
```

### View Portage logs.

```sh
eread
```

### Choose which version of C++ compiler to use.

```sh                                                                                                   
gcc-config           
```

### Rebuild the "toolchain" after changing which version of C++ compiler to use.

```sh
env-update && source /etc/profile && emerge binutils glibc -1q                                            
emerge -Ca package       
```

### Remove a package.                                                                                

```sh
emerge -ca (--depclean --ask)                           
```

### Remove unneeded dependencies.                                                  

```sh
emerge @preserved-rebuild
```

### Rebuild packages whose (dynamically linked) dependencies are no longer needed and have been removed (requires gentoolkit), pretending at first.                                                                                  
```sh
revdep-rebuild -p                                                                                          #
```

### to delete leftover package installation/build files; destructive means to remove stuff except for packages explicitly installed, pretending at first.

```sh
eclean -d -p distfiles                                                                                     
```

### Delete leftover package installation/build files, regardless of whether you might want them again.

```sh
rm /usr/portage/distfiles/*                                                                              
```

### Choose a version of the kernel source.

```sh
eselect kernel                                                                                            
```

### Configure kernel.

```sh
cd /usr/src/linux && make menuconfig                                                                      
```

### Show which services are started in which runlevels, including those inactive.

```sh
rc-config list                                                                                            
```

### Show which services are started in which runlevels, in a slightly different format.

```sh
rc-update                                                                                                 
```

### Add a service, such as apache2, to a runlevel, such as default, so that it gets started when the computer boots up.

```sh
rc-update add service runlevel                                                                             
```

### Show which services are currently running.

```sh
rc-status                          
```

### Restart a service. Besides restart, you can also start, stop, etc.

```sh
/etc/init.d/service restart                                                                                
```

### Find packages not installed by portage                 

```sh
find /usr/bin | xargs -I{} qfile -o {}                                                                    
```

```sh
root # quse -D terminal

app-editors/gedit-plugins[terminal] Embed a terminal in the bottom pane
app-editors/vim[terminal] Enable terminal emulation support
dev-qt/qt-creator[serialterminal] Build the serial terminal plugin
dev-util/anjuta[terminal] Enable terminal plugin based on x11-libs/vte
lxqt-base/lxqt-meta[terminal] Install x11-terms/qterminal package
mate-extra/caja-extensions[open-terminal] Add an extension to support an open terminal.
```


!!! warn "Warning"

Remember that if you subsequently use the target machine directly at its keyboard, you'll be working outside of the chroot, and all your paths will be incorrect (e.g. the new system will still appear at /mnt/gentoo/). It's an easy mistake to make, hence the renaming of the prompts. Once the kernel is built and the machine rebooted, we'll be 'natively' inside the new system, at which point this path issue will disappear.

```bash
#!/bin/bash

mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run 
    
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) $PS1"
``` 

![23213213](https://user-images.githubusercontent.com/26827453/168069798-7c238f62-d353-4fc2-a1cf-081524512981.png)

> Doing same things over and over and over again is boring, adding this part for myself so I can copy and paste when I installing Gentoo 
Doing this 1 time / month for different users/companies so if you reading this and installing gentoo. 
This is the last part beforing we we mounting the folders above and jumping in to our new enviroment/setup

``` bash
cp /mnt/usb/install/portage/make.conf /mnt/gentoo/etc/portage/
mkdir -p -v /mnt/gentoo/etc/portage/repos.conf 
cp -v /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
```

![23213213](https://user-images.githubusercontent.com/26827453/168069798-7c238f62-d353-4fc2-a1cf-081524512981.png)

``` bash
emerge sys-kernel/gentoo-sources sys-kernel/genkernel sys-boot/grub:2 app-portage/gentoolkit app-editors/vim sys-apps/ripgrep-all sys-process/parallel  sys-fs/cryptsetup wpa_supplicant net-analyzer/netcat  app-arch/atool app-arch/p7zip
```

![Screenshot_20220512_122818](https://user-images.githubusercontent.com/26827453/168074931-ed69c98d-d842-4c2a-87c8-05e63aaa4954.png)

``` bash
printf '### Gentoo Kernel\n%s\n\n### Genkernel for initramfs \n%s\n\n### Grub:2 as bootloader\n%s\n\n' \
       'sys-kernel/gentoo-sources symlink' \
       'sys-kernel/genkernel cryptsetup' \
       'sys-boot/grub:2 device-mapper' \
       'app-arch/p7zip rar' > /etc/portage/package.use/elitebook_useflags 
``` 
![21321](https://user-images.githubusercontent.com/26827453/168071643-19305b7a-d504-4a82-bd71-73ac59e73f89.png)



```bash
eix-update
eix-sync -a
emerge --oneshot sys-apps/portage
```

![3123213213](https://user-images.githubusercontent.com/26827453/168075079-5b49512d-8d33-4ea0-9ab0-18d36690728f.png)

