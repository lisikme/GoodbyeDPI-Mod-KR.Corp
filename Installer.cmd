@ECHO OFF
PUSHD "%~dp0"
start /b powershell -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=177;height=999};$w.windowsize=@{width=155;height=55};}"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
echo [90mровека установки службы GoodbyeDPI [0m------------------------------[91m
sc qdescription "GoodbyeDPI"
echo [0m-----------------------------------------------------------------
echo  [93mЭтот скрипт следует запускать с правами администратора.
echo [0m-----------------------------------------------------------------
pause
setlocal
cls
:begin
echo [90mУтилита настройки службы GoodbyeDPI [0m-----------------------------
echo   [93m1. [92mУстановить службу GoodbyeDPI
echo   [93m2. [92mУстановить службу GoodbyeDPллI с ЯндексDNS
echo   [93m3. [92mУстановить службу GoodbyeDPллI с GoogleDNS
echo;
echo   [93m8. [96mОбновить список доменов для GoodbyeDPI
echo   [93m9. [91mУдалить службу GoodbyeDPI
echo   [33m0. [31mЗакрыть панель настроек[0m
echo [0m-----------------------------------------------------------------
echo [90m Нажмите на кнопку из списка для продолжения...
choice /n /c 123890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%
pause
:run1
rem Установка службы
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "Блокировщик пассивной глубокой проверки пакетов и утилита обхода активного DPI"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI успешно установлена!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run2
rem Установка службы dns Яндекс
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 77.88.8.8 --dns-port 1253 --dnsv6-addr 2a02:6b8::feed:0ff --dnsv6-port 1253 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "Блокировщик пассивной глубокой проверки пакетов и утилита обхода активного DPI c ЯндексDNS"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI успешно установлена c ЯндексDNS!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run3
rem Установка службы dns Яндекс
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath= "\"%CD%\%_arch%\goodbyedpi.exe\" -7 -e1 --dns-addr 8.8.8.8 --dns-port 853 --dnsv6-addr 2001:4860:4860::8888 --dnsv6-port 853 --blacklist \"%CD%\russia-blacklist.txt\" --blacklist \"%CD%\russia-youtube.txt\"" start= "auto"
sc description "GoodbyeDPI" "Блокировщик пассивной глубокой проверки пакетов и утилита обхода активного DPI c GoogleDNS"
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI успешно установлена c GoogleDNS!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run4
rem Обновить список доменов для GoodbyeDPI
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo Оновление списка доменов от KetaruCorp...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\retaru-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mCписок доменов для GoodbyeDPI успешно обновлен!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run4
rem Обновить список доменов для GoodbyeDPI
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
echo Оновление списка доменов...
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\russia-blacklist.txt" > nul
POPD
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI"
sc query "GoodbyeDPI"
POPD
echo;
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mCписок доменов для GoodbyeDPI успешно обновлен!
echo [0m-----------------------------------------------------------------
echo;
goto begin

:run5
rem Удаление службы
cls
echo [90mЛог выполения [0m---------------------------------------------------[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
POPD
@REM cls
echo [90mСтатус выполения скрипта [0m----------------------------------------
echo  [93mСлужба GoodbyeDPI успешно удалена!
echo [0m-----------------------------------------------------------------
echo;
goto begin

pause
