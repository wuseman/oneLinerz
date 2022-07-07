# sys

### Check if harddrive is read-only
```sh
cat /sys/block/sda/ro
```
### Print size of disk
```sh
cat /sys/block/sda/size
```
### Print hidden status
```sh
cat /sys/block/sda/hidden
```
### Print mac address
```sh
cat /sys/class/net/eno1/address 
```
### Print duplex
```sh
cat /sys/class/net/eno1/duplex
```
### Print opperstate if its up or down
```sh
cat /sys/class/net/eno1/operstate 
```
### Print BIOS settings
```sh
strings /sys/firmware/dmi/tables/DMI
```
### Check if drive is removab le
```sh
cat /sys/block/nvme0n1/removable 
```
### Print uuid of drive:
```sh
cat /sys/block/nvme0n1/uuid
```
### Get devname and devtype
```sh
cat /sys/block/nvme0n1/device/nvme0n1/nvme0n1p1/uevent
```
To run many (>100) push Watch Folders on Linux computers, adjust three system settings and then reload the sysctl.conf file to activate them.

### Increase the maximum number of watches allowed by the system. 

```sh
cat /proc/sys/fs/inotify/max_user_watches
```

### To permanently increase the number of available watches (to a value that is greater than the number of files to watch, such as 524288), add the configuration to /etc/sysctl.conf:

```sh	
echo "fs.inotify.max_user_watches=524288" >> /etc/sysctl.conf
```

### Increase the maximum number of inotify instances, which correspond to the number of allowed Watch Services instances.Retrieve the current value by running the following command:

```sh	
cat /proc/sys/fs/inotify/max_user_instances
```

### On many systems, the default value is 128, meaning only 128 watches can be created. To permanently increase the number available (to a value that is greater than the number of desired Watch Folder instances, such as 1024), add the configuration to /etc/sysctl.conf:

```sh
sudo echo "fs.inotify.max_user_instances=1024" >> /etc/sysctl.conf
```

### Increase the open file limit. Retrieve the current value by running the following command:

```sh
cat /proc/sys/fs/file-max
```

### To permanently increase the open file limit (to a value that is greater than the number of desired watches, such as 2097152), add the configuration to /etc/sysctl.conf:

```sh
echo "fs.file-max=2097152" >> /etc/sysctl.conf
```

### Reload systemd settings to activate the new settings. To reload systemd settings, either reboot the machine or run the following command:

```sh
sudo sysctl -p /etc/sysctl.conf
```
### Resources

https://www.ibm.com/docs/en/aspera-on-demand/3.9?topic=line-configuring-linux-many-watch-folders
