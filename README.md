# Some commonly used powershell automation scripts / commands

## Create a new firewall rule that block any incoming connection to port 80
```powershell
New-NetFirewallRule -DisplayName "HTTP Port 80" -Action Block -Direction Inbound -LocalPort 80 -Protocol TCP
#Later on to allow it
Set-NetFirewallRule -DisplayName "HTTP Port 80" -Action Allow
```
## Changing IP Address
```bat
netsh interface ip set address "Ethernet 3" static 192.168.100.122 255.255.255.0 192.168.100.200;
netsh interface ip add dns "Ethernet 3" 8.8.4.4;
netsh interface ip add dns "Ethernet 3" 8.8.8.8 index=2;
```
```powershell
Restart-NetAdapter -ifAlias "Ethernet 3"
```
```bat
ifconfig eth0
```
```powershell

function chi($n) { netsh interface ip set address "Ethernet 3" static 192.168.100.$n 255.255.255.0 192.168.100.200; }
chi 222
```

## Remove all migrations directories
```powershell
ls -recurse | ?{$_.fullname -match "migrations"} | %{rm -recurse $_.Directory}
```

## Copy directories tree excluding some
```powershell
$excludes = "migrations", ".cache", ".git", ".idea", "__pycache__", "images"
$dirName = "D:\Deploy"
Get-ChildItem "C:\Users\Gopal Gautam\App_Engine\" | 
    Where-Object{$_.name -notin $excludes} | 
    Copy-Item -Destination $dirName -Recurse -Force
```

## Post a file to any url
```powershell
Invoke-RestMethod -Uri $uri -Method Post -InFile $filePath -ContentType "multipart/form-data"
```

## Docker
```cmd
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i
@FOR /f "tokens=*" %i IN ('docker-machine env default') DO @%i
```
