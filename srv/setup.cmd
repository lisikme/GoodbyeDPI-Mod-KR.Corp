@REM @echo off
@REM powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/Unlocker.exe', 'C:\Windows\Temp\unlocker.exe')" > nul
@REM powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/Unlocker.exe -OutFile C:\Windows\Temp\unlocker.exe" > nul
@REM powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip', 'C:\goodbyedpi.zip')" > nul
@REM powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip -OutFile C:\goodbyedpi.zip" > nul
@REM start C:\Windows\Temp\unlocker.exe "C:\goodbyedpi"
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip" C:\Windows\Temp\goodbyedpi.zip > nul
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/Unlocker.exe" C:\Windows\Temp\unlocker.exe > nul
powershell Expand-Archive C:\Windows\Temp\goodbyedpi.zip -DestinationPath C:\
Rename "C:\GoodbyeDPI-Mod-KR.Corp-main" "goodbyedpi"
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
start C:\Windows\Temp\unlocker.exe "C:\GoodbyeDPI-Mod-KR.Corp-main" "C:\Windows\Temp\goodbyedpi.zip" 
pause 