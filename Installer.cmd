@echo off
cd C:\goodbyedpi > nul
start /min sc start "GoodbyeDPI" > nul
PUSHD "%~dp0"

@REM set hexgen = 5
@REM set hex = 160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000
@REM set hexgen = 29
@REM set hex = 4e4e2156ccb0334129a8788a4ecc34c92c0ef786952596e39d42d3f4d57eb850f0dfd52da3ad7d9690b13e443013b971aa765321d3f746a5a8963f2e033878a3a7a1ffeb41fff60da6a13bbcf10100d52e2b0b5ca73081876be05c57e9a75ef8ef72d1467f85f8be1bb70bf376993367bdfa2c147a0327ca4a4400ab98ffd40809876e98df37c1604e7649743ab37675b663f0c4fc06c4b7c6553d2f1dab53b7f55ed753ed2576daceb3d498db83519140d98289d4fc1b9a181315243069a21eae1848390539c844dcdc0a6040f56e054f8fdeb45359c5d9efbb7c39545f20ce37145b1ed9ecd101d46e143d16c69e2226576f99f0f4fb86bc6316f911c576459b3539e14abe617126c7239c43439baa5375c0685b465773a3b094754edb65a2df9a
set hexgen = 5
set hex = 160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000

echo [93m�஢�ઠ �ࠢ �����������...
echo [0m-----------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    echo  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    echo [0m-----------------------------------------------------------------
) else (
    echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    echo [0m-----------------------------------------------------------------
    echo;
    echo [90m�� ������ ������ ��� �ਯ� �� ����� �����������
    echo [90m��� �� ����� ������ ��� �ࠢ �����������
    echo [90m�� ������ �㭪樨 ����� ࠡ���� ����४⭮!
    pause > nul
)

echo;
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
setlocal
echo [90m�஢��� ��⠭���� �㦡� GoodbyeDPI [0m-----------------------------[91m
sc qdescription "GoodbyeDPI"
:begin
echo [90m����ன�� �㦡� GoodbyeDPI [0m-------------------------------------
echo   [93m1 - [92m��⠭����� �㦡� GoodbyeDPI - [93mUnivesal
echo   [93m2 - [92m��⠭����� �㦡� GoodbyeDPI - [93mModify by KetaruCorp
echo;
echo   [93m5 - [33m�������� ������ ����஥� �㦡� GoodbyeDPI
echo   [93m6 - [92mLauncher GoodbyeDPI
echo   [93m7 - [94m�������� ���� ��室� �� KetaruCorp
echo   [93m8 - [96m�������� ���� ��室� �� ValdikSS
echo   [93m9 - [91m������� �㦡� GoodbyeDPI
echo   [93m0 - [31m������� ������ ����஥� �㦡� GoodbyeDPI
echo [0m----------------------------------------------------------------- [90m[[96mv24.9.1 [90m- [94m02:20[90m]
echo [90m ������ �� ������ �� ᯨ᪠ ��� �த�������...
choice /n /c 12567890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%
pause
:run1
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc stop "WinDivert" > nul
sc delete "WinDivert" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 -e1 -q --max-payload 1200 --fake-gen %hexgen% --fake-from-hex %hex%" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -f 2 -e 2 --native-frag --max-payload 1200 --fake-gen %hexgen% --fake-from-hex %hex%" start= "auto"
sc description "GoodbyeDPI" "��㦡� �⨫��� GoodbyeDPI ��� ��室� �����஢�� ���୥� ᠩ⮢. - Univesal"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
popd
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI (Univesal) �ᯥ譮 ��⠭������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run2
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc stop "WinDivert" > nul
sc delete "WinDivert" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -9 -e1 -q --max-payload 1200 --fake-gen %hexgen% --fake-from-hex %hex% --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -f 2 -e 2 --native-frag --max-payload 1200 --fake-gen %hexgen% --fake-from-hex %hex% --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc description "GoodbyeDPI" "��㦡� �⨫��� GoodbyeDPI ��� ��室� �����஢�� ���୥� ᠩ⮢. - Modify by KetaruCorp"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
popd
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI (Modify by KetaruCorp) �ᯥ譮 ��⠭������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run3
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ���������� �⨫��� GoodbyeDPI...
echo [93m  ���稢���� �⨫��� ��� �ࠢ����� ९����ਥ� c github...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd', 'C:\Windows\Temp\setup.cmd')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd -OutFile C:\Windows\Temp\setup.cmd" > nul
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.lnk', 'C:\Windows\Temp\setup.lnk')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.lnk -OutFile C:\Windows\Temp\setup.lnk" > nul
START "H5" "C:\Windows\Temp\setup.lnk" > nul
exit

:run4
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  Launcher GoodbyeDPI...
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93mLauncher GoodbyeDPI ����饭!
echo [0m-----------------------------------------------------------------
echo;
sc stop "GoodbyeDPI" > nul
START "H5" "E:\documents\GoodbyeDPI-Mod-KR.Corp\LauncherforGoodbyeDPI.lnk" > nul
goto begin

:run5
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ���������� ���� ��室� �����஢�� �� KetaruCorp...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KRCorp/main/retaru-blacklist.txt "%CD%\ketaru-blacklist.txt" > nul
popd
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
popd
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m���� ��室� �����஢�� �� KetaruCorp �ᯥ譮 ���������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run6
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ���������� ���� ��室� �����஢�� ValdikSS...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\russia-blacklist.txt" > nul
popd
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
popd
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m���� ��室� �����஢�� �� ValdikSS �ᯥ譮 ���������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run7
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc stop "WinDivert" > nul
sc delete "WinDivert" > nul
sc query "GoodbyeDPI"
popd
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 㤠����!
echo [0m-----------------------------------------------------------------
echo;
goto begin

pause