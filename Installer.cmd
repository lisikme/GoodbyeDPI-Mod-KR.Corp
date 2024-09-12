@ECHO OFF
PUSHD "%~dp0"
start /b powershell -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=177;height=999};$w.windowsize=@{width=155;height=55};}"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
echo [90m஢��� ��⠭���� �㦡� GoodbyeDPI [0m------------------------------[91m
sc qdescription "GoodbyeDPI"
echo [0m-----------------------------------------------------------------
echo  [93m��� �ਯ� ᫥��� ����᪠�� � �ࠢ��� �����������.
echo [0m-----------------------------------------------------------------
pause
setlocal
cls
:begin
echo [90m�⨫�� ����ன�� �㦡� GoodbyeDPI [0m-----------------------------
echo   [93m1. [92m��⠭����� �㦡� GoodbyeDPI
echo   [93m2. [92m��⠭����� �㦡� GoodbyeDP��I � ������DNS
echo   [93m3. [92m��⠭����� �㦡� GoodbyeDP��I � GoogleDNS
echo;
echo   [93m8. [96m�������� ᯨ᮪ ������� ��� GoodbyeDPI
echo   [93m9. [91m������� �㦡� GoodbyeDPI
echo   [33m0. [31m������� ������ ����஥�[0m
echo [0m-----------------------------------------------------------------
echo [90m ������ �� ������ �� ᯨ᪠ ��� �த�������...
choice /n /c 123890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%
pause
:run1
rem ��⠭���� �㦡�
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "�����஢騪 ���ᨢ��� ��㡮��� �஢�ન ����⮢ � �⨫�� ��室� ��⨢���� DPI"
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
rem ��⠭���� �㦡� dns ������
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "�����஢騪 ���ᨢ��� ��㡮��� �஢�ન ����⮢ � �⨫�� ��室� ��⨢���� DPI c ������DNS"
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
rem ��⠭���� �㦡� dns ������
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 8.8.8.8 --dns-port 853 --dnsv6-addr 2001:4860:4860::8888 --dnsv6-port 853 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "�����஢騪 ���ᨢ��� ��㡮��� �஢�ન ����⮢ � �⨫�� ��室� ��⨢���� DPI c GoogleDNS"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 ��⠭������ c GoogleDNS!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run4
rem �������� ᯨ᮪ ������� ��� GoodbyeDPI
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo ��������� ᯨ᪠ ������� �� KetaruCorp...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\retaru-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93mC��᮪ ������� ��� GoodbyeDPI �ᯥ譮 ��������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run4
rem �������� ᯨ᮪ ������� ��� GoodbyeDPI
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
echo ��������� ᯨ᪠ �������...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\russia-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93mC��᮪ ������� ��� GoodbyeDPI �ᯥ譮 ��������!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run5
rem �������� �㦡�
cls
echo [90m��� �믮����� [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
POPD
@REM cls
echo [90m����� �믮����� �ਯ� [0m----------------------------------------
echo  [93m��㦡� GoodbyeDPI �ᯥ譮 㤠����!
echo [0m-----------------------------------------------------------------
echo;
goto begin

pause
