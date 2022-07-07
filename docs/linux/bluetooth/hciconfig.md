# hciconfig

### Open and initialize HCI device
```sh
hciconfig -a <hci0> up
```
### Close HCI device
```sh
hciconfig -a <hci0> down
```
### Reset HCI device
```sh
hciconfig -a <hci0> reset
```
### Reset statistic counters
```sh
hciconfig -a <hci0> rstat
```
### Enable Authentication
```sh
hciconfig -a <hci0> auth
```
### Disable Authentication
```sh
hciconfig -a <hci0> noauth
```
### Enable Encryption
```sh
hciconfig -a <hci0> encrypt
```
### Disable Encryption
```sh
hciconfig -a <hci0> noencrypt
```
### Enable Page and Inquiry scan
```sh
hciconfig -a <hci0> piscan
```
### Disable scan
```sh
hciconfig -a <hci0> noscan
```
### Enable Inquiry scan
```sh
hciconfig -a <hci0>  iscan
```
### Enable Page scan
```sh
hciconfig -a <hci0> pscan
```
### Get/Set default packet type
```sh
hciconfig -a <hci0> ptype      [type]
```
### Get/Set default link mode
```sh
hciconfig -a <hci0> lm         [mode]
```
### Get/Set default link policy
```sh
hciconfig -a <hci0> lp         [policy]
```
### Get/Set local name
```sh
hciconfig -a <hci0> name       [name]
```
### Get/Set class of device
```sh
hciconfig -a <hci0> class      [class]
```
### Get/Set voice setting
```sh
hciconfig -a <hci0> voice      [voice]
```
### Get/Set inquiry access code
```sh
hciconfig -a <hci0> iac        [iac]
```
### Get/Set inquiry transmit power level
```sh
hciconfig -a <hci0> nqtpl     [level]
```
### Get/Set inquiry mode
```sh
hciconfig -a <hci0> inqmode    [mode]
```
### Get/Set inquiry data
```sh
hciconfig -a <hci0> inqdata    [data]
```
### Get/Set inquiry scan type
```sh
hciconfig -a <hci0> inqtype    [type]
```
### Get/Set inquiry scan window and interval
```sh
hciconfig -a <hci0> inqparms   [win:int]
```
### Get/Set page scan window and interval
```sh
hciconfig -a <hci0> pageparms  [win:int]
```
### Get/Set page timeout
```sh
hciconfig -a <hci0> ageto     [to]
```
### Get/Set AFH mode
```sh
hciconfig -a <hci0> afhmode    [mode]
```
### Get/Set Simple Pairing Mode
```sh
hciconfig -a <hci0> sspmode    [mode]
```
### Set ACL MTU and number of packets
```sh
hciconfig -a <hci0> clmtu     <mtu:pkt>
```
### Set SCO MTU and number of packets
```sh
hciconfig -a <hci0> scomtu     <mtu:pkt>
```
### Delete link key from the device
```sh
hciconfig -a <hci0> delkey     <bdaddr>
```
### Get local OOB data
```sh
hciconfig -a <hci0> oobdata
```
### Display supported commands
```sh
hciconfig -a <hci0> commands
```
### Display device features
```sh
hciconfig -a <hci0> eatures
```
### Display version information
```sh
hciconfig -a <hci0> version
```
### Display revision information
```sh
hciconfig -a <hci0> revision
```
### Add a device to the blacklist
```sh
hciconfig -a <hci0> block      <bdaddr>
```
### Remove a device from the blacklist
```sh
hciconfig -a <hci0> unblock    <bdaddr>
```
### Set LE Random Address
```sh
hciconfig -a <hci0> lerandaddr <bdaddr>
```
### Enable LE advertising
```sh
hciconfig -a <hci0> leadv      [type]
```
### Show all commands device has support for

```sh
hciconfig get commands
```