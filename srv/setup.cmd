@echo off
start C:\Windows\Temp\unlocker.exe "C:\goodbyedpi"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip', 'C:\Windows\Temp\goodbyedpi.zip')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip -OutFile C:\Windows\Temp\good.zpi" > nul
powershell Expand-Archive C:\goodbyedpi.zip -DestinationPath C:\
Rename "C:\GoodbyeDPI-Mod-KR.Corp-main" "goodbyedpi"
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
start C:\Windows\Temp\unlocker.exe "C:\GoodbyeDPI-Mod-KR.Corp-main" "C:\goodbyedpi.zip"