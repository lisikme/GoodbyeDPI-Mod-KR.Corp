@echo off
powershell Remove-Item -LiteralPath "C:\GoodbyeDPI-Mod-KR.Corp-main" -Force -Recurse > nul
powershell Remove-Item -LiteralPath "C:\goodbyedpi" -Force -Recurse > nul
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip', 'C:\goodbyedpi.zip')"
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip -OutFile C:\goodbyedpi.zip"
powershell Expand-Archive C:\goodbyedpi.zip -DestinationPath C:\
powershell Rename-Item -path "C:\GoodbyeDPI-Mod-KR.Corp-main" -NewName "goodbyedpi" > nul
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd"
powershell Remove-Item -LiteralPath "C:\goodbyedpi\srv" -Force -Recurse > nul