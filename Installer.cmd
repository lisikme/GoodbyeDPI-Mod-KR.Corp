@echo off
cd C:\goodbyedpi > nul
PUSHD "%~dp0"

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
    pause > nul
    exit
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
echo [90m�⨫�� ����ன�� �㦡� GoodbyeDPI [0m-----------------------------
echo   [93m1 - [92m��⠭����� �㦡� GoodbyeDPI ��� DNS
echo   [93m2 - [92m��⠭����� �㦡� GoodbyeDPI � ������DNS
echo;
echo   [93m6 - [33m�������� ������ ����஥� �㦡� GoodbyeDPI
echo   [93m7 - [94m�������� ���� ��室� �� KetaruCorp
echo   [93m8 - [96m�������� ���� ��室� �� ValdikSS
echo   [93m9 - [91m������� �㦡� GoodbyeDPI
echo   [93m0 - [31m������� ������ ����஥� �㦡� GoodbyeDPI
echo [0m------------------------------------- [90m[[96mv2.7.3 [90m- [94m09.14.2024 14:47[90m]
echo [90m ������ �� ������ �� ᯨ᪠ ��� �த�������...
choice /n /c 1267890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%
pause
:run1
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc description "GoodbyeDPI" "��㦡� �⨫��� GoodbyeDPI ��� ��室� ���ᨢ���� � ��⨢���� DPI �஢����஢ � ��室� �����஢�� ���୥� ᠩ⮢."
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 ��⠭������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run2
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc description "GoodbyeDPI" "��㦡� �⨫��� GoodbyeDPI ��� ��室� ���ᨢ���� � ��⨢���� DPI �஢����஢ � ��室� �����஢�� ���୥� ᠩ⮢. c ������DNS"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 ��⠭������ c ������DNS!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run3
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ���������� �㦡� GoodbyeDPI...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KR.Corp/main/srv/setup.cmd "C:\goodsetup.cmd" > nul
start cmd /k powershell Start-Process -FilePath "C:\goodsetup.cmd"
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 ���������!
echo [0m-----------------------------------------------------------------
echo;
exit
goto begin

:run4
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ��������� ��� ��室� �����஢�� �� KetaruCorp...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KR.Corp/main/retaru-blacklist.txt "%CD%\ketaru-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��� ��室� �����஢�� �� KetaruCorp �ᯥ譮 ���������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run5
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo  ��������� ��� ��室� �����஢�� ValdikSS...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\russia-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��� ��室� �����஢�� �� ValdikSS �ᯥ譮 ���������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run6
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
POPD
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 㤠����!
echo [0m-----------------------------------------------------------------
echo;
goto begin

pause