@echo off
color 0a
set tempRandomID=A82254C30B07
set tempLoc=%TEMP%\%tempRandomID%\

rd /S /Q %tempLoc% 2>nul
mkdir %tempLoc%

title AutoInstaller
echo WARNING! THIS APP IS ONLY IN ENGLISH EXCEPT SOME IMPORTANT OPTIONS!
echo FIGYELEM! EZ AZ ALKALMAZAS CSAK ANGOLBAN VAN MEG A FONTOS VALASZTASOKON KIVUL!
echo AVERTIZMENT! ACEASTA APLICATIE ESTE NUMAI IN ENGLEZA IN AFARA DE OPTIUNILE IMPORTANTE!
echo.
echo.
echo Welcome to AutoInstaller!
echo This app will install PatSMP's modpack AUTOMATICALLY for you!
echo WARNING! THIS ONLY WORKS ON WINDOWS 7 AND ABOVE!
echo Downloading modpack..
set tmp=^"Invoke-WebRequest -Uri ^'https://github.com/PatrickMSM/patsmp-clientmods/raw/master/clientmods.zip^' -OutFile ^'%tempLoc%\clientmods.zip^'^"
powershell -c %tmp%
echo Downloaded modpack!
echo Searching for minecraft..
if exist %appdata%\.minecraft\ (
  echo Found Minecraft!
) else (
  echo MINECRAFT NOT FOUND! PRESS ANY KEY TO EXIT
  echo MINECRAFT NEM TALALHATO! NYOMD MEG BARMILYEN GOMBOT HOGY LEPJ KI
  echo MINECRAFT NU POATE FI GASIT! APASA ORICE TASTA PENTRU A IESI
  pause >nul
  exit
)
echo Expanding archive..
set tmp=^"Expand-Archive ^'%tempLoc%\clientmods.zip^' ^'%tempLoc%\clientmods\^'^"
powershell -c %tmp%
echo Expanded archive!
echo WARNING! ALL OTHER MODS AND MOD SETTINGS WILL BE DELETED! PRESS ANY KEY TO CONTINUE!
echo FIGYELEM! MINDEN MAS MOD ES MOD BEALLITAS LE LESSZ TOROLVE! NYOMD MEG BARMILYEN GOMBOT A FOLYTATASHOZ!
echo AVERTIZARE! TOATE CELALALTE MODURI SI SETARI DE MODURI VOR FI STERSE! APASA ORICE TASTA PENTRU A CONTINUA!
pause >nul
echo ARE YOU SURE? BIZTOS VAGY? ESTI SIGUR?
pause >nul
echo Deleting all old mods and old mod settings..
rd /S /Q %appdata%\.minecraft\mods\ 2>nul
rd /S /Q %appdata%\.minecraft\config\ 2>nul
echo Deleted all old mods and old mod settings!
echo Copying over new mods and mod settings..
xcopy %tempLoc%\clientmods\mods %appdata%\.minecraft\ /s/e/y/k/c
xcopy %tempLoc%\clientmods\config %appdata%\.minecraft\ /s/e/y/k/c
echo Copied over new mods and mod settings!
echo Done! PRESS ANY KEY TO EXIT
echo Kesz! NYOMD MEG BARMILYEN GOMBOT HOGY LEPJ KI
echo Gata! APASA ORICE TASTA PENTRU A IESI
pause >nul
exit
