@echo off

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip', 'C:\Windows\Temp\goodtemp.zip')"
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip -OutFile C:\Windows\Temp\goodtemp.zip"
@REM cmd /k C:\Windows\Temp\Unlocker.exe "C:\goodbyedpi"

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip', 'C:\Windows\Temp\goodtemp.zip')"
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip -OutFile C:\Windows\Temp\goodtemp.zip"

powershell Expand-Archive C:\Windows\Temp\goodtemp.zip -DestinationPath C:\Windows\Temp\ -Force
powershell Move-Item -Path C:\Windows\Temp\GoodbyeDPI-Mod-KRCorp-main -Destination C:\goodbyedpi -Force

powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul

pause