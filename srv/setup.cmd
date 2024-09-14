@echo off
echo [93mУстановка...

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/Unlocker.exe', 'C:\Windows\Temp\Unlocker.exe')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/Unlocker.exe -OutFile C:\Windows\Temp\Unlocker.exe" > nul
C:\Windows\Temp\Unlocker.exe "C:\goodbyedpi"  > nul

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip', 'C:\Windows\Temp\goodtemp.zip')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip -OutFile C:\Windows\Temp\goodtemp.zip" > nul

powershell Expand-Archive C:\Windows\Temp\goodtemp.zip -DestinationPath C:\Windows\Temp\ -Force > nul
powershell Move-Item -Path C:\Windows\Temp\GoodbyeDPI-Mod-KRCorp-main -Destination C:\goodbyedpi -Force  > nul

powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul