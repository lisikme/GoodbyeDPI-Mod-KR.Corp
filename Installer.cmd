@echo off

powershell -command "&{(get-host).ui.rawui.windowsize=@{width=67;height=35};}" > nul
set ver=25.0.1
title KR.Corp Tweaker DPI v%ver%
cd C:\goodbyedpi > nul
@REM start /min sc start "GoodbyeDPI" > nul
PUSHD "%~dp0"

set dirtemp=%appdata%\KetaruCorp\download

@REM set hexgen=5
@REM set hex=160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000

@REM set hexgen=29
@REM set hex=4e4e2156ccb0334129a8788a4ecc34c92c0ef786952596e39d42d3f4d57eb850f0dfd52da3ad7d9690b13e443013b971aa765321d3f746a5a8963f2e033878a3a7a1ffeb41fff60da6a13bbcf10100d52e2b0b5ca73081876be05c57e9a75ef8ef72d1467f85f8be1bb70bf376993367bdfa2c147a0327ca4a4400ab98ffd40809876e98df37c1604e7649743ab37675b663f0c4fc06c4b7c6553d2f1dab53b7f55ed753ed2576daceb3d498db83519140d98289d4fc1b9a181315243069a21eae1848390539c844dcdc0a6040f56e054f8fdeb45359c5d9efbb7c39545f20ce37145b1ed9ecd101d46e143d16c69e2226576f99f0f4fb86bc6316f911c576459b3539e14abe617126c7239c43439baa5375c0685b465773a3b094754edb65a2df9a

@REM set hexgen=5
@REM set hex=160301FFFF01FFFFFF0303594F5552204144564552544953454D454E542048455245202D202431302F6D6F000000000009000000050003000000

set hexgen=5
set hex=1603030135010001310303424143facf5c983ac8ff20b819cfd634cbf5143c0005b2b8b142a6cd335012c220008969b6b387683dedb4114d466ca90be3212b2bde0c4f56261a9801

set blacklist=--blacklist "%~dp0list-GoodbyeDPI.txt" --blacklist "%~dp0ketaru-GoodbyeDPI.txt"
set GBDParam=-e1 --reverse-frag --wrong-chksum --fake-from-hex %hex% --fake-gen %hexgen% --set-ttl 3 -q %blacklist%
set par_youtube=--fake-gen %hexgen% --fake-from-hex %hex% %blacklist%
set AZParam=--wf-tcp=443-65535 --wf-udp=443-65535 ^
--wf-tcp=443 --wf-udp=443,50000-65535 ^
--filter-udp=443 --hostlist="%~dp0ketaru-AntiZapret.txt" --dpi-desync=fake --dpi-desync-udplen-increment=10 --dpi-desync-repeats=6 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-udp=50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-fake-quic="%~dp0quic_initial_www_google_com.bin" --new ^
--filter-tcp=443 --hostlist="%~dp0ketaru-AntiZapret.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls="%~dp0tls_clienthello_www_google_com.bin"

@REM -5 -e 1 --reverse-frag --wrong-chksum --fake-from-hex 1603030135010001310303424143facf5c983ac8ff20b819cfd634cbf5143c0005b2b8b142a6cd335012c220008969b6b387683dedb4114d466ca90be3212b2bde0c4f56261a9801 --fake-gen 5 --set-ttl 3 -q

net session >nul 2>&1
if %errorLevel% == 0 (
    echo [90m �����������������������������������������������������������������
    echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    echo [90m �����������������������������������������������������������������
) else (
    echo [90m �����������������������������������������������������������������
    echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    echo [90m �����������������������������������������������������������������
    echo;
    echo [90m�⨫�� ࠡ�⠥� ⮫쪮 �� ����� �����������
    where wt && (
        @REM cmd /c wt --title "KR.Corp Tweaker DPI v%ver%" --suppressApplicationTitle --tabColor #ff555555 "%0" & exit
        powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" > nul
        exit
    ) || (
        powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'" > nul
        exit
    )

)
echo;
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)
setlocal
echo [1m
echo [90m � �஢��� ��⠭���� �㦡 [90m���������������������������������������[91m
sc qdescription "GoodbyeDPI"
@REM start cmd /c "sc qc "GoodbyeDPI" & pause"
:begin
powershell -command "&{(get-host).ui.rawui.windowsize=@{width=67;height=45};}" > nul
echo [90m�� [90m����ன�� KR.Corp Tweaker DPI [90m��������������������������������Ŀ
echo [90m�  [93m1 - [92m��⠭����� [93mAntiZapret[90m/[93mGoodbyeDPI [90m- [91mUltraPlus [33m��⨐��       [90m�
echo [90m�  [93m2 - [92m��⠭����� [93mGoodbyeDPI            [90m- [96mYouTube [33m��⨐��         [90m�
echo [90m�  [93m3 - [92m��⠭����� [93mAntiZapret            [90m- [96mDiscord [33m��⨐��         [90m�
echo [90m�  [93m4 - [91m������� [93mGoodbyeDPI               [90m- [96m�⪫�祭�� �㦡�       [90m�
echo [90m�  [93m5 - [91m������� [93mAntiZapret               [90m- [96m�⪫�祭�� �㦡�       [90m�
echo [90m�����������������������������������������������������������������Ĵ
echo [90m�  [93m6 - [92mLauncher [93mGoodbyeDPI              [90m- [96m��� ����ன��           [90m�
echo [90m�  [93m7 - [94m�������� [93mᯨ᮪ ��� AntiZapret   [90m- [96m���᮪ �������          [90m�
echo [90m�  [93m8 - [94m�������� [93mᯨ᮪ ��� GoodbyeDPI   [90m- [96m���᮪ �������          [90m�
echo [90m�  [93m9 - [36m�������� [93mKR.Corp Tweaker DPI     [90m- [96m����㧪� ����������     [90m�
echo [90m�����������������������������������������������������������������Ĵ
echo [90m�  [93m0 - [91m������� ����                                               [90m�
echo [90m������������������������������������������������������������������� 
echo [90m ������ �� ���� ���� ��� ����ன��...    [90m[[96mv%ver% [90m- [94m10.10.2024[90m]
choice /n /c 1234567890 > nul
set rmFunc=%errorlevel%
for %%I in (1 2 3 4 5 6 7 8 9 0) do if #%rmFunc%==#%%I goto run%%I
echo %rmFunc%





:run1
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
sc stop "GoodbyeDPI" > nul
sc stop "AntiZapret" > nul
sc delete "GoodbyeDPI" > nul
sc delete "AntiZapret" > nul
sc create "GoodbyeDPI" binPath="\"%~dp0%_arch%\goodbyedpi.exe\" %GBDParam%" DisplayName="AZ - KR.Corp.Ulils GoodbyeDPI" start="auto" > nul
sc create "AntiZapret" binPath="\"%~dp0winws.exe\" %AZParam%" DisplayName="AZ - KR.Corp.Ulils AntiZapret" start="auto"  > nul
sc description "GoodbyeDPI" "��㦡� UltraPlus ��� ��室� �����஢�� ���୥� �१ DPI" > nul
sc description "AntiZapret" "��㦡� UltraPlus ��� ��室� �����஢�� ���୥� �१ DPI" > nul
start /min sc start "GoodbyeDPI" > nul
start /min sc start "AntiZapret" > nul
sc query "GoodbyeDPI"
sc query "AntiZapret"

echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m��㦡� [91mUltraPlus [33m��⨐�� [93m�ᯥ譮 ��⠭������!                  [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run2
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc create "GoodbyeDPI" binPath="\"%~dp0%_arch%\goodbyedpi.exe\" %GBDParam%" DisplayName="AZ - KR.Corp.Ulils GoodbyeDPI" start="auto" > nul
sc description "GoodbyeDPI" "��㦡� YouTubeFix ��� ��室� �����஢�� ���୥� �१ DPI" > nul
start /min sc start "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m��㦡� [96mYouTube [33m��⨐�� [93m�ᯥ譮 ��⠭������!                    [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run3
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
sc stop "AntiZapret" > nul
sc delete "AntiZapret" > nul
sc create "AntiZapret" binPath="\"%~dp0winws.exe\" %AZParam%" DisplayName="AZ - KR.Corp.Ulils AntiZapret" start="auto" > nul
sc description "AntiZapret" "��㦡� DiscordFix ��� ��室� �����஢�� ���୥� �१ DPI" > nul
start /min sc start "AntiZapret" > nul
sc query "AntiZapret"

echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m��㦡� [96mDiscord [33m��⨐�� [93m�ᯥ譮 ��⠭������!                    [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run4
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
sc stop "GoodbyeDPI" > nul
sc delete "GoodbyeDPI" > nul
sc query "GoodbyeDPI"

echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m��㦡� [96mYouTube [33m��⨐�� [93m�ᯥ譮 㤠����!                        [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run5
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
sc stop "AntiZapret" > nul
sc delete "AntiZapret" > nul
sc create "AntiZapret" binPath="\"%~dp0winws.exe\" %AZParam%" DisplayName="AZ - KR.Corp.Ulils AntiZapret" start="auto" > nul
sc description "AntiZapret" "��㦡� DiscordFix ��� ��室� �����஢�� ���୥� �१ DPI" > nul
start /min sc start "AntiZapret" > nul
sc query "AntiZapret"

echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m��㦡� [96mDiscord [33m��⨐�� [93m�ᯥ譮 㤠����!                        [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run6
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93mLauncher GoodbyeDPI ����饭!
echo [90m������������������������������������������������������������������� 
sc stop "GoodbyeDPI" > nul
START "LauncherforGoodbyeDPI" "%~dp0%_arch%\Launcher for GoodbyeDPI.exe" > nul
goto begin





:run7
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
echo  ���������� ᯨ᪠ ��室� �����஢�� ��� GoodbyeDPI...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KRCorp/main/ketaru-GoodbyeDPI.txt "%CD%\ketaru-GoodbyeDPI.txt" > nul
bitsadmin /transfer blacklist https://p.thenewone.lol/domains-export.txt "%CD%\list-GoodbyeDPI.txt" > nul
popd
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
popd
echo;
echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m���������� ᯨ᪠ ��� [96mGoodbyeDPI [93m�ᯥ譮 ���������!                        [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run8
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
echo  ���������� ᯨ᪠ ��室� �����஢�� ��� AntiZapret...
bitsadmin /transfer blacklist https://raw.githubusercontent.com/lisikme/GoodbyeDPI-Mod-KRCorp/main/ketaru-AntiZapret.txt "%CD%\ketaru-AntiZapret.txt" > nul
popd
sc stop "GoodbyeDPI" > nul
start /min sc start "GoodbyeDPI" > nul
sc query "GoodbyeDPI"
popd
echo;
echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m���������� ᯨ᪠ ��� [96mAntiZapret [93m�ᯥ譮 ���������!                        [90m�
echo [90m������������������������������������������������������������������� 
goto begin





:run9
cls
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo [90m �����������������������������������������������������������������
        echo [93m  �ᯥ�: [92m�ࠢ� ����������� ����祭�.[0m
    ) else (
        echo [90m �����������������������������������������������������������������
        echo  �訡��: [91m�ࠢ� ����������� �� ����祭�.[0m
    )
echo [90m � ��� �믮�����  [90m������������������������������������������������[91m
echo  ���������� ᯨ᪠ ��室� �����஢�� ��� AntiZapret...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd', 'C:\Windows\Temp\setup.cmd')" > nul
powershell -Command "Invoke-WebRequest https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/raw/main/srv/setup.cmd -OutFile C:\Windows\Temp\setup.cmd" > nul
START "Updater" "C:\Windows\Temp\setup.cmd" > nul
exit
echo;
echo [90m�� [90m����� �믮����� [90m���������������������������������������������Ŀ
echo [90m�  [93m���������� ᯨ᪠ ��� [96mAntiZapret [93m�ᯥ譮 ���������!                        [90m�
echo [90m������������������������������������������������������������������� 
goto begin

pause