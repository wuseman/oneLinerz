# bluetoothctl

### List available controllers
```sh
bluetoothctl list
```
### Controller information
```sh
bluetoothctl show
```
### Select default controller
```sh
bluetoothctl select
```
### List available devices
```sh
bluetoothctl devices
```
### List paired devices
```sh
bluetoothctl paired-devices
```
### Set controller alias
```sh
bluetoothctl system-alias
```
### Reset controller alias
```sh
bluetoothctl reset-alias
```
### Set controller power on
```sh
bluetoothctl power on
```
### Set controller power off
```sh
bluetoothctl power off
```
### Set controller pairable mode
```sh
bluetoothctl pairable
```
### Set controller discoverable mode
```sh
bluetoothctl discoverable
```
### Set discoverable timeout
```sh
bluetoothctl discoverable-timeout
```
### Enable/disable agent with given capability
```sh
bluetoothctl agent
```
### Set agent as the default one
```sh
bluetoothctl default-agent
```
### Enable/disable advertising with given type
```sh
bluetoothctl advertise
```
### Set device alias
```sh
bluetoothctl set-alias
```
### Scan for devices
```sh
bluetoothctl scan on
```
### Device information
```sh
bluetoothctl info
```
### Pair with device
```sh
bluetoothctl pair <mac> OR <device_name>
```
### Cancel pairing with device
```sh
bluetoothctl cancel-pairing
```
### Trust device
```sh
bluetoothctl trust
```
###hciconfig Untrust device
```sh
bluetoothctl untrust
```
### Block device
```sh
bluetoothctl block
```
### Unblock device
```sh
bluetoothctl unblock
```
### Remove device
```sh
bluetoothctl remove
```
### Connect device
```sh
bluetoothctl connect
```
### Disconnect device
```sh
bluetoothctl disconnect
```