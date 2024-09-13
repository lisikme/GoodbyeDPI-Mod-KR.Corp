@echo off
ren C:\GoodbyeDPI-Mod-KR.Corp-main goodbyedpi
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip', 'C:\goodbyedpi.zip')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip -OutFile C:\goodbyedpi.zip" > nul
powershell Expand-Archive C:\goodbyedpi.zip -DestinationPath C:\
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
powershell Remove-Item -LiteralPath "C:\goodbyedpi\srv" -Force -Recurse > nul
@REM @RD /S /Q "C:\GoodbyeDPI-Mod-KR.Corp-main"
pause