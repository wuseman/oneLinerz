# lenovo and dell bios

## General

### Show allthing about hp bootings
```sh
Get-HPBIOSUUID           
```
### Get general info
```sh
Get-WmiObject -Class Win32_BIOS | Format-List *
```
### Print smbiosversion
```sh
Get-WmiObject -Class Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion 
```
```sh
Get-CimClass -NameSpace  root/HP/InstrumentedBIOS
if (gwmi HP_BIOSPassword -Namespace "root\HP\InstrumentedBIOS" -Filter "Name = 'Setup Password' AND IsSet = 1") {"setup password set"} else {"setup password not set"}
Get-CimInstance -ClassName hp_biossetting -Namespace "root\hp\instrumentedbios" | where name -eq "Numlock state at boot"
```
### You can use PowerShell to view or change BIOS settings on your computer running Windows. 

Let’s consider some examples you can use to get or modify some BIOS settings with PowerShell through the WMI classes (Windows Management Instrumentation) on the computers of popular vendors: HP, Lenovo, Dell.

### Contents:

    Lenovo BIOS Settings Management from PowerShell
    Change BIOS Setting from PowerShell on Hewlett-Packard Computers
    Configuring DELL BIOS Settings with PowerShell

### You can view basic BIOS parameters on your computer using the Get-WmiObject cmdlet from the Win32_BIOS class:
```sh
Get-WmiObject -Class Win32_BIOS | Format-List *
```
### This command allows you to view your BIOS version (SMBIOSBIOSVersion, BIOSVersion), hardware manufacturer, computer serial number, the ReleaseDate and some other information.
```sh
Get-WmiObject Win32_BIOS
```
### You can list only some of these BIOS parameters:
```sh
Get-WmiObject -Class Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion
```
### You can use the Win32_BIOS class to view some BIOS information on any computer running Windows. 

However, some hardware vendors provide special WMI classes to direct access BIOS from Windows OS (the native drivers by your hardware manufacturer must be installed on a computer).

## Lenovo BIOS Settings Management from PowerShell

You can get the list of BIOS parameters and their values on Lenovo computers like this:

```sh
Get-WmiObject -class Lenovo_BiosSetting -namespace root\wmi
```
### To display only the names of BIOS settings and their current values:
```sh
Get-WmiObject -class Lenovo_BiosSetting -namespace root\wmi | select-object InstanceName, currentsetting
```
### List all Lenovo_BiosSetting using powershell

### Let’s check if the password to access BIOS is set on your Lenovo computer:
```sh
(gwmi -Class Lenovo_BiosPasswordSettings -Namespace root\wmi).PasswordState
```
### If the command returned 0, then the password to enter BIOS is not set.
```sh
powershell Lenovo_BiosPasswordSettings
```
### You can change some BIOS parameters on Lenovo computers. For example, let’s enable WOL (Wake-On-LAN):
```sh
$getLenovoBIOS = gwmi -class Lenovo_SetBiosSetting -namespace root\wmi
$getLenovoBIOS.SetBiosSetting("WakeOnLAN,Enable")
$SaveLenovoBIOS = (gwmi -class Lenovo_SaveBiosSettings -namespace root\wmi)
$SaveLenovoBIOS.SaveBiosSettings()
```
## Change BIOS Setting from PowerShell on Hewlett-Packard Computers

### To get BIOS settings, their values and available options on HP computers, you can use the following command:
```sh
Get-WmiObject -Namespace root/hp/instrumentedBIOS -Class hp_biosEnumeration | select Name, value, possiblevalues –AutoSize
```
### You can change some BIOS settings on HP computers from PowerShell. For example, you want to disable booting your computer from USB devices.
```sh
$getHPBios = gwmi -class hp_biossettinginterface -Namespace "root\hp\instrumentedbios"
$getHPBios.SetBIOSSetting('USB Storage Boot','Disable')
```
### If a password is required to change BIOS settings, you can use this script:
```sh
$HPBIOSPassword = "<utf-16/>"+"Passw0rd!1"
$getHPBios = gwmi -class hp_biossettinginterface -Namespace "root\hp\instrumentedbios"
$getHPBios.SetBIOSSetting(‘Network (PXE) Boot','Disable',$HPBIOSPassword)
```
### If the last command has returned “0”, it has been executed successfully. You can use a simple PowerShell handler:
```sh
$ChangeBIOS_State = $bios.setbiossetting(Network (PXE) Boot', 'Disable' , $HPBIOSPassword)
$ChangeBIOS_State_Code = $ChangeBIOS_State.return
If(($ChangeBIOS_State_Code) -eq 0)
{
write-host "OK"
}
Else
{
write-host "Error - (Return code $ChangeBIOS_State_Code)" -Foreground Red
}
```

### If you want to enable LAN/WLAN Switching in BIOS on an HP laptop to automatically disconnect from Wi-Fi when an Ethernet connection is available, run this command:
```sh
$getHPBios.SetBIOSSetting('LAN/WLAN Switching','Enable')
```
## DELL BIOS Settings with PowerShell

To view and manage BIOS settings on DELL computers, you can use the DCIM-BIOSService WMI class or the more modern root\dellomci class (available after the installation of the OMCI package — Open Manage Client Instrumentation).

### To view the boot device order in BIOS on Dell computers, run the following command:
```sh
Get-WmiObject -NameSpace root\dellomci Dell_BootDeviceSequence | sort bootorder | select BootDeviceName, BootOrder
```
### dellomci class to view and change bios setting on dell computers with powershell For example, you can enable Wake on LAN in BIOS like that:
```sh
(Get-WmiObject DCIM-BIOSService -namespace rootdcimsysman).SetBIOSAttributes($null,$null,"Wake-On-LAN","4")
```
### Also, Dell released a separate PowerShell module, DellBIOSProvider, which is installed alongside driver installation or you can install it manually with this command:
```sh
Install-Module -Name DellBIOSProvider -Force
```
### You can use this module to view the boot sequence on a Dell computer:
```sh
Get-ChildItem DellSmbios:\BootSequence\Bootsequence
```
### To change a specific BIOS setting, use the Set-Item cmdlet. For example, to change the BIOS password:
```sh
Set-Item -Path Dellsmbios\Security\AdminPassword –Value BadDellPa$$ –Password G00dDe11P@ss
```

Using the methods described above, you can create a PowerShell script to export the current BIOS settings from a reference computer (e. g., to a CSV file). Then, you can use PowerShell to deploy the same BIOS settings on all computers in your company.
