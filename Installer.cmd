@echo off
start /min sc start "GoodbyeDPI" > nul
cd C:\goodbyedpi > nul
PUSHD "%~dp0"

echo [93mПроверка прав администратора...
echo [0m-----------------------------------------------------------------
net session >nul 2>&1
if %errorLevel% == 0 (
    echo  Успех: [92mПрава администратора получены.[0m
    echo [0m-----------------------------------------------------------------
) else (
    echo  Ошибка: [91mПрава администратора не получены.[0m
    echo [0m-----------------------------------------------------------------
    echo;
    echo [90mВы должны открыть этот скрипт от имени администратора
    pause > nul
    exit
)

echo;
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
setlocal
echo [90mПровека установки службы GoodbyeDPI [0m-----------------------------[91m
sc qdescription "GoodbyeDPI"
:begin
echo [90mНастройки службы GoodbyeDPI [0m-------------------------------------
echo   [93m1 - [92mУстановить службу GoodbyeDPI - [93mUnivesal
echo   [93m2 - [92mУстановить службу GoodbyeDPI - [93mModify by KetaruCorp
echo;
echo   [93m5 - [33mОбновить панель настроек службы GoodbyeDPI
echo   [93m6 - [92mLauncher GoodbyeDPI
echo   [93m7 - [94mОбновить базу обхода от KetaruCorp
echo   [93m8 - [96mОбновить базу обхода от ValdikSS
echo   [93m9 - [91mУдалить службу GoodbyeDPI
echo   [93m0 - [31mЗакрыть панель настроек службы GoodbyeDPI
echo [0m---------------------------------------- [90m[[96mv2.7 [90m- [94m09.14.2024 17:47[90m]
echo [90m Нажмите на кнопку из списка для продолжения...
choice /n /c 12567890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%
pause
:run1
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -f 2 -e 2 --reverse-frag" start= "auto"
sc description "GoodbyeDPI" "Служба утилиты GoodbyeDPI для обхода блокировок интернет сайтов. - Univesal"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI (Univesal) успешно установлена!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run2
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
@REM sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -p -r -s -f2 -e2 -m --reverse-frag --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -f 2 -e 2 --reverse-frag --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\ketaru-blacklist.txt\"" start= "auto"
sc description "GoodbyeDPI" "Служба утилиты GoodbyeDPI для обхода блокировок интернет сайтов. - Modify by KetaruCorp"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI (Mod by KetaruCorp) успешно установлена!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run3
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo  Обновление утилиты GoodbyeDPI...
echo [93m  Скачивание утилиты для управления репозиторием c github...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd', 'C:\Windows\Temp\setup.cmd')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd -OutFile C:\Windows\Temp\setup.cmd" > nul
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.lnk', 'C:\Windows\Temp\setup.lnk')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.lnk -OutFile C:\Windows\Temp\setup.lnk" > nul
START "H5" "C:\Windows\Temp\setup.lnk" > nul
exit

:run4
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo  Launcher GoodbyeDPI...
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mLauncher GoodbyeDPI запущен!
echo [0m-----------------------------------------------------------------
echo;
sc stop "GoodbyeDPI" > nul
START "H5" "E:\documents\GoodbyeDPI-Mod-KR.Corp\LauncherforGoodbyeDPI.lnk" > nul
goto begin

:run5
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo  Оновление бызы обхода блокировок от KetaruCorp...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KRCorp/main/retaru-blacklist.txt "%CD%\ketaru-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mБызы обхода блокировок от KetaruCorp успешно обновлены!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run6
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo  Оновление бызы обхода блокировок ValdikSS...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\russia-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mБызы обхода блокировок от ValdikSS успешно обновлены!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run7
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
POPD
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI успешно удалена!
echo [0m-----------------------------------------------------------------
echo;
goto begin

pause