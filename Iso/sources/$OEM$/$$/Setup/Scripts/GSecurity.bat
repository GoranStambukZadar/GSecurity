:: Perms
takeown /f %windir%\System32\Oobe\useroobe.dll /A
icacls %windir%\System32\Oobe\useroobe.dll /reset
icacls %windir%\System32\Oobe\useroobe.dll /inheritance:r

:: Services
sc stop seclogon
sc config seclogon start= disabled

:: Users
net user defaultuser0 /delete

:: Restart
shutdown /r /t 0
