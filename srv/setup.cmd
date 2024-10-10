@echo off
echo [93mУстановка последней версии...

set appname=KR.Corp-Tweaker-DPI
title %appname% - Updater

set dirtemp=%appdata%\KetaruCorp\download
set dir=%appdata%\KetaruCorp

set update_link=https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip

set folder=GoodbyeDPI-Mod-KRCorp-main
sc stop "GoodbyeDPI" > nul
sc stop "AntiZapret" > nul
sc delete "GoodbyeDPI" > nul
sc delete "AntiZapret" > nul
del "%dir%\*.*" /f /q /s > nul
set file=DPIapp.zip
certutil -urlcache -split -f %update_link% %file%> NUL
powershell -Command "(New-Object Net.WebClient).DownloadFile('%update_link%', '%dirtemp%\%file%')" > nul
powershell -Command "Invoke-WebRequest %update_link% -OutFile %dirtemp%\%file%" > nul
echo [93mРаспаковка файлов...
powershell Expand-Archive %file% -DestinationPath %dir% -Force
start %dir%\%folder%\Installer.cmd
del %~dp0%file%
@REM PAUSE

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%userprofile%\desktop\DPI Tweaker.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%dir%\%folder%\Installer.cmd" >> %SCRIPT%
echo oLink.TargetPath = "%dir%\%folder%\Installer.cmd" >> %SCRIPT%
echo oLink.IconLocation = "%dir%\%folder%\x86\goodbyedpi.exe" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

set SCRIP="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIP%
echo sLinkFile = "%userprofile%\desktop\DPI Tweaker.lnk" >> %SCRIP%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIP%
echo oLink.TargetPath = "%dir%\%folder%\Installer.cmd" >> %SCRIP%
echo oLink.TargetPath = "%dir%\%folder%\Installer.cmd" >> %SCRIP%
echo oLink.IconLocation = "%dir%\%folder%\x86\goodbyedpi.exe" >> %SCRIP%
echo oLink.Save >> %SCRIP%
cscript /nologo %SCRIP%
del %SCRIP%


@REM powershell ^
@REM "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk');$s.TargetPath='%~f0';$s.Save()")
@REM $Shell = New-Object -ComObject ("WScript.Shell")
@REM $Shortcut = $Shell.CreateShortcut($ShortcutPath)
@REM $Shortcut.IconLocation = "$IconLocation, $IconArrayIndex"
@REM $Shortcut.Save()
@REM Set Shell = (New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Start Menu\Programs\Startup\%~n0.lnk')
@REM link.Arguments = ""
@REM link.Description = "ДубльГИС"
@REM link.HotKey = ""
@REM link.TargetPath = "\\vserver\GroupPolicy\2gis\3.0\grym.exe"
@REM link.WindowStyle = 2
@REM link.WorkingDirectory = "\\vserver\GroupPolicy\2gis\3.0"
@REM link.Save

@REM pause