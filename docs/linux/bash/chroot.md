# chroot

!!! warning  "Important"

    Remember that if you subsequently use the target machine directly at its keyboard (rather than through the ssh/screen combination as here), you'll be working outside of the chroot, and all your paths will be incorrect (e.g. the new system will still appear at /mnt/gentoo/). It's an easy mistake to make, hence the renaming of the prompts. Once the kernel is built and the machine rebooted, we'll be 'natively' inside the new system, at which point this path issue will disappear.

``` sh
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
