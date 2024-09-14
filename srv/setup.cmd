@echo off
start C:\Windows\Temp\unlocker.exe "C:\goodbyedpi"
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip" C:\Windows\Temp\goodbyedpi.zip > nul
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/Unlocker.exe" C:\Windows\Temp\unlocker.exe > nul
powershell Expand-Archive C:\Windows\Temp\goodbyedpi.zip -DestinationPath C:\
Rename "C:\GoodbyeDPI-Mod-KR.Corp-main" "goodbyedpi"
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
start C:\Windows\Temp\unlocker.exe "C:\GoodbyeDPI-Mod-KR.Corp-main" "C:\Windows\Temp\goodbyedpi.zip" 
@REM pause 