@echo off
echo [93m����㧪� ��᫥���� ���ᨨ...
echo;
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/Unlocker.exe" C:\Windows\Temp\unlocker.exe > nul
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/raw/main/srv/7z.exe" C:\Windows\Temp\7z.exe > nul
echo [93m ���稢���� �⨫��� ��� �ࠢ����� ९����ਥ� c github...
certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip" C:\Windows\Temp\goodbyedpi.zip > nul
echo [93m ���稢���� ९������ c github...
@REM pause
C:\Windows\Temp\unlocker.exe "C:\goodbyedpi"
powershell Expand-Archive -Path C:\Windows\Temp\goodbyedpi.zip -DestinationPath C:\Windows\Temp\ -Force
cmd /k C:\Windows\Temp\7z.exe a -tzip -mx5 c:\temp\goodbyedpi.zip C:\Windows\Temp\GoodbyeDPI-Mod-KR.Corp-main
@REM cmd /k C:\Windows\Temp\7z.exe e C:\Windows\Temp\goodbyedpi.zip -aoa -o"C:\"
echo [93m �ᯠ����� ��娢�...
Rename "C:\GoodbyeDPI-Mod-KR.Corp-main" "goodbyedpi"
echo [93m ��������� �⨫���...
powershell Start-Process -FilePath "C:\goodbyedpi\Installer.cmd" > nul
echo [93m ����⨥ �⨫���...
@REM start C:\Windows\Temp\unlocker.exe "C:\GoodbyeDPI-Mod-KR.Corp-main" "C:\Windows\Temp\goodbyedpi.zip" 
pause 