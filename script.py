import os
import shutil 

path = 'https://github.com/lisikme/GoodbyeDPI-Mod-KR.Corp/archive/refs/heads/main.zip'
p1 = 'C:/Windows/Temp/GoodbyePI-Mod-KR.Corp-main'
p2 = 'C:/goodbyedpi'

os.system('start C:/Windows/Temp/unlocker.exe "C:/goodbyedpi" "C:/Windows/Temp/GoodbyeDPI-Mod-KRCorp-main"')
os.system('cls')
print('[90mЛог выполения [0m---------------------------------------------------[91m')
print(' Обновление утилиты GoodbyeDPI...')
print('  [93mЗагрузка последней версии...')
print()
print('  [93m Скачивание репозитория c github...')
os.system('certutil -urlcache -split -f "https://github.com/lisikme/GoodbyeDPI-Mod-KRCorp/archive/refs/heads/main.zip" C:/Windows/Temp/goodtemp.zip > nul')
print('  [93m распаковка архива...')
os.system('powershell Expand-Archive -Path C:/Windows/Temp/goodtemp.zip -DestinationPath C:/Windows/Temp/ -Force')
print('  [93m Компеляция утилиты...')
os.system('rename C:/Windows/Temp/GoodbyeDPI-Mod-KR.Corp-main doodbyedpi')
# os.rename(p1, p2)
# os.replace(p1, p2)
# shutil.move(p1, p2)
os.system('powershell Start-Process -FilePath "C:/goodbyedpi/Installer.cmd" > nul')

print('  [93m Открытие утилиты...')
print()
print('[90mСтатус выполения скрипта [0m----------------------------------------')
print('  [93mПанель настроек службы GoodbyeDPI успешно обновлена!')
print('[0m-----------------------------------------------------------------')
os.system('echo;')