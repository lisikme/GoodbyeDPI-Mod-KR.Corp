@echo off
echo [93mУстановка последней версии...

set appname=KR.Corp-Tweaker-DPI

set dirtemp=%appdata%\KetaruCorp\download
set dir=%appdata%\KetaruCorp

set update_link=https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip

@REM powershell -Command "(New-Object Net.WebClient).DownloadFile('%update_link%', 'C:\Windows\Temp\goodtemp.zip')" > nul
@REM powershell -Command "Invoke-WebRequest %update_link% -OutFile C:\Windows\Temp\goodtemp.zip" > nul

@REM powershell Move-Item -Path C:\Windows\Temp\GoodbyeDPI-Mod-KRCorp-main -Destination C:\goodbyedpi -Force  > nul

@REM powershell Start-Process -FilePath "%PPATH%\KRcorpDPI\Installer.cmd" > nul

@REM xcopy /E /Y %update_link%

@REM powershell -Command "(New-Object Net.WebClient).DownloadFile('%update_link%', 'packageDPI.zip')"
@REM powershell -Command "Invoke-WebRequest %update_link% -OutFile packageDPI.zip"

set folder=GoodbyeDPI-Mod-KRCorp-main

sc stop "GoodbyeDPI" > nul
sc stop "AntiZapret" > nul
sc delete "GoodbyeDPI" > nul
sc delete "AntiZapret" > nul
del "%dir%\*.*" /f /q /s
@REM powershell -Command "Remove-Item '%dir%\*' -Recurse -Force"
@REM rmdir /s /q "%dir%"
set file=DPIapp.zip
certutil -urlcache -split -f %update_link% %file%> NUL
echo [93mРаспаковка файлов...
powershell Expand-Archive %file% -DestinationPath %dir% -Force
Rename %dir%\%folder% %appname%
PAUSE