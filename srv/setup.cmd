@REM @echo off
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip', 'C:\goodbyedpi.zip')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip -OutFile C:\goodbyedpi.zip" > nul
powershell Expand-Archive C:\goodbyedpi.zip -DestinationPath C:\
Rename "C:\GoodbyeDPI-Mod-KR.Corp-main" "goodbyedpi"
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
powershell Remove-Item -LiteralPath "C:\goodbyedpi\srv" -Force -Recurse > nul
rmdir /s /q "C:\GoodbyeDPI-Mod-KR.Corp-main"
pause