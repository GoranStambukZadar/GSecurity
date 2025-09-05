:: Perms
takeown /f %windir%\System32\Oobe\useroobe.dll /A
icacls %windir%\System32\Oobe\useroobe.dll /reset
icacls %windir%\System32\Oobe\useroobe.dll /inheritance:r

:: Services
sc stop seclogon
sc config seclogon start= disabled

:: Users
net user defaultuser0 /delete

:: Restrictions
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Appx" /v "AllowWindows" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Dll" /v "AllowWindows" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Exe" /v "EnforcementMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Exe" /v "AllowWindows" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Exe\19b6758b-09e9-4bd6-9e9a-c26d9e65fd8c" /v "Value" /t REG_SZ /d "<FilePublisherRule Id=\"19b6758b-09e9-4bd6-9e9a-c26d9e65fd8c\" Name=\"Signed by *\" Description=\"\" UserOrGroupSid=\"S-1-2-1\" Action=\"Allow\"><Conditions><FilePublisherCondition PublisherName=\"*\" ProductName=\"*\" BinaryName=\"*\"><BinaryVersionRange LowSection=\"*\" HighSection=\"*\"/></FilePublisherCondition></Conditions></FilePublisherRule>" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Msi" /v "AllowWindows" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Script" /v "EnforcementMode" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Software\Policies\Microsoft\Windows\SrpV2\Script" /v "AllowWindows" /t REG_DWORD /d "0" /f

:: Restart
shutdown /r /t 0
