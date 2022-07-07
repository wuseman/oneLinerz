# hcitool

### Connect to device via hcitool
```sh
hcitool -i hci0 cc 14:3F:A6:35:AE:17
```

### Print transmit level
```sh
hcitool tpl 14:3F:A6:35:AE:17
```
### Print device name

```sh
hcitool name 14:3F:A6:35:AE:17
```
### Show manufacturer of dev ice
```sh
hcitool info 14:3F:A6:35:AE:17 |grep -i Company
```
### Print signal quality
```sh
hcitool lq 14:3F:A6:35:AE:17

```
### Display local devices
```sh
hcitool dev
```
### Inquire remote devices
```sh
hcitool inq
```
### Scan for remote devices
```sh
hcitool scan
```
### Get name from remote device
```sh
hcitool name
```
### Get information from remote device
```sh
hcitool info
```
### Start periodic inquiry
```sh
hcitool spinq
```
### Exit periodic inquiry
```sh
hcitool epinq
```
### Submit arbitrary HCI commands
```sh
hcitool cmd
```
### Display active connections
```sh
hcitool con
```
### Create connection to remote device
```sh
hcitool cc
```
### Disconnect from remote device
```sh
hcitool dc
```
### Switch master/slave role
```sh
hcitool sr
```
### Change connection packet type
```sh
hcitool cpt
```
### Display link quality
```sh
hcitool lq
```
### Display transmit power level
```sh
hcitool tpl
```
### Display AFH channel map
```sh
hcitool afh

```
### Display local devices
```sh
hcitool dev
```
### Inquire remote devices
```sh
hcitool inq
```
### Scan for remote devices
```sh
hcitool scan
```
### Get name from remote device
```sh
hcitool name
```
### Get information from remote device
```sh
hcitool info
```
### Start periodic inquiry
```sh
hcitool spinq
```
### Exit periodic inquiry
```sh
hcitool epinq
```
### Submit arbitrary HCI commands
```sh
hcitool cmd
```
### Display active connections
```sh
hcitool con
```
### Create connection to remote device
```sh
hcitool cc
```
### Disconnect from remote device
```sh
hcitool dc
```
### Switch master/slave role
```sh
hcitool sr
```
### Change connection packet type
```sh
hcitool cpt
```
### Display link quality
```sh
hcitool lq
```
### Display transmit power level
```sh
hcitool tpl
```
### Display AFH channel map
```sh
hcitool afh
