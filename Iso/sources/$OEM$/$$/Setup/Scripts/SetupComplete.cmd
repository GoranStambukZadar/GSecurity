@echo off
>nul 2>&1 fsutil dirty query %systemdrive% || echo CreateObject^("Shell.Application"^).ShellExecute "%~0", "ELEVATED", "", "runas", 1 > "%temp%\uac.vbs" && "%temp%\uac.vbs" && exit /b
DEL /F /Q "%temp%\uac.vbs"
setlocal EnableExtensions EnableDelayedExpansion
cd /d %~dp0
cd Bin
for /f "tokens=*" %%A in ('dir /b /o:n *.cmd') do (
     call "%%A"
)
