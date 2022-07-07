# df 

### find the device when you only know the mount point
```sh
df /media/mountpoint |egrep -o '^[/a-z0-9]*'
```

### show physical disk using
```sh
df -x tmpfs | grep -vE "(gvfs|procbususb|rootfs)"
```

### Useful to check if the disks as of same size or not. Helpful in checking Raid configs
```sh
df | awk '{if ($2!=dspace) print "different"; dspace=$2;}'
```

### find the device when you only know the mount point
```sh
df | grep -w '/media/mountpoint' | cut -d " " -f 1
```

### find the device when you only know the mount point
```sh
df | grep -w '/media/armadillo' | cut -d " " -f 1
```

### find the device when you only know the mount point
```sh
df | grep -w /media/KINGSTON | awk {'print $1'}
```

### Show the amount of space left on mounted harddrives
```sh
df -h
```

### Listing the Size and usage of the connected Hard Disks
```sh
df -H
```

### df without line wrap on long FS name
```sh
df -P | column -t
```

### Convert df command to posix; uber GREPable
```sh
df -P
```

### Report full partitions from a cron
```sh
df -l | grep -e "9.%" -e "100%"
```

### df without line wrap on long FS name
```sh
df -PH|column -t
```

### View the current number of free/used inodes in a file system
```sh
df -i  <partition>
```

### Show total disk space on all partitions
```sh
df -h total | awk 'NR==1; END{print}'
```

### find the device when you only know the mount point
```sh
df -P | awk '$6=="/media/KINGSTON" {print $1}'
```

### Show all local disk and UFS mounts on Solaris
```sh
df -kFufs
```

### Remaining Disk space for important mounted drives
```sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom|none' | awk '{ print $5 " " $1 }'
```

### df output, sorted by Use% and correctly maintaining header row
```sh
df -h | sort -r -k 5 -i
```

### check hardisk volume
```sh
df -h
```

### Disk Free with column and Fs and Size human readble
```sh
df -PhT
```

### Check the age of the filesystem
```sh
df / | awk '{print $1}' | grep dev | xargs tune2fs -l | grep create
```

### Display the space used for all your mounted logical volume (LV)
```sh
df -kh /dev/vg0*/lv*
```

### df output, sorted by Use% and correctly maintaining header row
```sh
df -h | grep -v ^none | ( read header ; echo "$header" ; sort -rn -k 5)
```

### df without line wrap on long FS name
```sh
df -P | column -t
```

### Convert df command to posix; uber GREPable
```sh
df -P
```

### Report full partitions from a cron
```sh
df -l | grep -e "9.%" -e "100%"
```

### df without line wrap on long FS name
```sh
df -PH|column -t
```

### View the current number of free/used inodes in a file system
```sh
df -i  <partition>
```

### Show total disk space on all partitions
```sh
df -h total | awk 'NR==1; END{print}'
```

### find the device when you only know the mount point
```sh
df -P | awk '$6=="/media/KINGSTON" {print $1}'
```

### Show all local disk and UFS mounts on Solaris
```sh
df -kFufs
```

### Remaining Disk space for important mounted drives
```sh
df -H | grep -vE '^Filesystem|tmpfs|cdrom|none' | awk '{ print $5 " " $1 }'
```

### df output, sorted by Use% and correctly maintaining header row
```sh
df -h | sort -r -k 5 -i
```

### check hardisk volume
```sh
df -h
```

### Disk Free with column and Fs and Size human readble
```sh
df -PhT
```

### Check the age of the filesystem
```sh
df / | awk '{print $1}' | grep dev | xargs tune2fs -l | grep create
```
