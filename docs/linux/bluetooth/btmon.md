# btmon

### Dump and Log everything about bt connection to a file
```sh
btmon -w btmon-dump_data.log -M -t -T -A -S -B 115200
```

### Read our dumped data from above command
```sh
btmon -r  btmon-dump_data.log
```

### Bluetooth monitor (spamming alot)
```sh
btmon
```

### Manager for bluetooth
```sh
btmgbt
```

### Connected Bluetooth devices mac-addresses
```sh
ls /var/lib/bluetooth/
```

### Print settings for device, minimal output
```sh
cat /var/lib/bluetooth/E4\:B3\:18\:54\:E7\:59/settings
```

### Main Configuration file for bluetooth devices
```sh
cat /etc/bluetooth/main.conf
```

### General Configuration file for the input service
```sh
cat /etc/bluetooth/input.conf
```

### Configuration file for the network service
```sh
cat /etc/bluetooth/network.conf
```