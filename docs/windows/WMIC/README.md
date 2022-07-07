# wmic 

### Get info about Pshical disks

```sh
wmic diskdrive get model,name,freespace,size        
```
# Get info about Logical disks
```sh
wmic logicaldisk get name                           
```
### Get info about Printer
```sh
wmic printer list status
```
### Printconfig
```sh
wmci printerconfig list
```
### Windows version incl. serial
```sh
wmic os list brief  
```
### Print installed products
```sh
wmic product list brief                  
```
### Print startuplist, full
```sh
wmic startup list full
```
### List running processes
```sh
wmic process list
wmic process list brief
wmic process list brief find "calc.exe"
wmic process list full
```
### Start and Stop
```sh
wmic process call create "calc.exe"
```

```sh
wmic process where name="calc.exe" call terminate
```

### Change process priority
```sh
wmic process where name="calc.exe" call setpriority 64
```
### Check environment variables
```sh
wmic environment list
```
### User Management
```sh
wmic group list brief
```
```sh
wmic useraccount list
```
```sh
wmic sysaccount list
```
### # List of missing patches
```sh
wmic qfe list   
```