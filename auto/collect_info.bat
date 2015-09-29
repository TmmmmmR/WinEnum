REM : AUTHOR ATEM

@ECHO OFF
@setlocal enableextensions
@cd /d "%~dp0"

IF NOT EXIST %ComputerName%-%USERNAME% (
mkdir %ComputerName%-%USERNAME%
)

echo ***************************************************
echo WINDOWS AUDIT TOOL
echo ***************************************************

echo [!] Getting sys date
echo [*]
date /t & time /t > .\%ComputerName%-%USERNAME%\date.log

echo [!] Getting Network Configuration
echo [*]
ipconfig /all > .\%ComputerName%-%USERNAME%\ipconfig.log
netstat -r > .\%ComputerName%-%USERNAME%\netstat-r.log
netsh firewall show config > .\%ComputerName%-%USERNAME%\firewall-show-config.log
netsh advfirewall show private > .\%ComputerName%-%USERNAME%\advfirewall-show-private.log
netsh advfirewall show public > .\%ComputerName%-%USERNAME%\advfirewall-show-public.log
netsh advfirewall show domain > .\%ComputerName%-%USERNAME%\advfirewall-show-domain.log



echo [!] Checking System Integrity
echo [*]
sfc /verifyonly > .\%ComputerName%-%USERNAME%\sfc-verifyonly.log



echo [!] Unusual Process & Services
echo [*]
.\tools\pslist.exe > .\%ComputerName%-%USERNAME%\pslist.log
.\tools\pslist.exe -t > .\%ComputerName%-%USERNAME%\pslist-t.log
.\tools\pslist.exe -x > .\%ComputerName%-%USERNAME%\pslist-x.log

tasklist > .\%ComputerName%-%USERNAME%\tasklist.log
tasklist /svc > .\%ComputerName%-%USERNAME%\tasklist-svc.log
tasklist /v > .\%ComputerName%-%USERNAME%\tasklist-v.log

WMIC PROCESS get Caption,Commandline,Processid > .\%ComputerName%-%USERNAME%\wmci-process-list.log
WMIC process list full > .\%ComputerName%-%USERNAME%\wmci-process-list-full.log

.\tools\PsService > .\%ComputerName%-%USERNAME%\PsService.log

echo [!] Dumping Process
echo [*]
.\tools\procdump\ProcessInfo.exe > .\%ComputerName%-%USERNAME%\process-dump.log

echo [!] Unusual Application or Product
echo [*]
wmic product get /format:csv > .\%ComputerName%-%USERNAME%\installed-software.csv

echo [!] Check Permission on Critical/Sensitive Directories
echo [*]
.\tools\accesschk.exe -dqv "C:\Windows" > .\%ComputerName%-%USERNAME%\accesschk-bat-windows.log
.\tools\accesschk.exe -dqv "C:\Windows\system32" > .\%ComputerName%-%USERNAME%\accesschk-bat-system32.log


echo [!] Unusual DLL
echo [*]
.\tools\Listdlls.exe > .\%ComputerName%-%USERNAME%\listdlls.log
.\tools\Listdlls.exe -vu > .\%ComputerName%-%USERNAME%\listdlls-vu.log



echo [!] Remote Opened Files
echo [*]
.\tools\psfile.exe > .\%ComputerName%-%USERNAME%\psfile.log



echo [!] Unusual Auto Run programs
echo [*]
.\tools\autorunsc.exe > .\%ComputerName%-%USERNAME%\autorunsc.log
.\tools\autorunsc.exe > .\%ComputerName%-%USERNAME%\autorunsc.xml



echo [!] Unusual Accounts
echo [*]
.\tools\PsLoggedon.exe > .\%ComputerName%-%USERNAME%\psloggedon.log
.\tools\logonsessions.exe > .\%ComputerName%-%USERNAME%\logonsessions.log
net users .\%ComputerName%-%USERNAME%\net-user.log
net localgroup administrators > .\%ComputerName%-%USERNAME%\localgroup-administrators.log
net localgroup administrateurs > .\%ComputerName%-%USERNAME%\localgroup-administrateurs.log

echo [!] Unusual Network Usage
echo [*]
.\tools\Tcpvcon.exe > .\%ComputerName%-%USERNAME%\tcpvcon.log
.\tools\Tcpvcon.exe -an > .\%ComputerName%-%USERNAME%\tcpvcon-an.log

netstat.exe -ano > .\%ComputerName%-%USERNAME%\netstat-ano.log
netstat.exe -naob > .\%ComputerName%-%USERNAME%\netstat-naob.log



echo [!] Unusual Scheduled Tasks
echo [*]
wmic startup list full > .\%ComputerName%-%USERNAME%\startup-list-full.log



echo [!] Unusual Local Shares
echo [*]
net view \\127.0.0.1 > .\%ComputerName%-%USERNAME%\net-view-127.0.0.1.log



echo [!] Unusual key Entries
echo [*]
REG EXPORT HKEY_CLASSES_ROOT .\%ComputerName%-%USERNAME%\HKEY_CLASSES_ROOT
REG EXPORT HKEY_CURRENT_USER .\%ComputerName%-%USERNAME%\HKEY_CURRENT_USER
REG EXPORT HKEY_LOCAL_MACHINE .\%ComputerName%-%USERNAME%\HKEY_LOCAL_MACHINE
REG EXPORT HKEY_USERS .\%ComputerName%-%USERNAME%\HKEY_USERS
REG EXPORT HKEY_CURRENT_CONFIG .\%ComputerName%-%USERNAME%\HKEY_CURRENT_CONFIG

PAUSE