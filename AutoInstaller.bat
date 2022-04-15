@echo off
color 0a
set tempRandomID=A82254C30B07
set tempLoc=%TEMP%\%tempRandomID%\

rd /S /Q %tempLoc% 2>nul
mkdir %tempLoc%

title ClientSMPMods AutoInstaller
echo WARNING! THIS PROGRAM IS ONLY IN ENGLISH!
echo.
echo.
echo Welcome to ClientSMPMods AutoInstaller!
echo This will install ClientSMPMods AUTOMATICALLY for you!
echo WARNING! THIS ONLY WORKS ON WINDOWS 7 AND ABOVE!
echo Downloading modpack..
set tmp=^"Invoke-WebRequest -Uri ^'https://github.com/PatrickMSM/ClientSMPMods/raw/master/clientmods.zip^' -OutFile ^'%tempLoc%\clientmods.zip^'^"
powershell -c %tmp%
echo Downloaded modpack!
echo Searching for minecraft..
if exist %appdata%\.minecraft\ (
  echo Found Minecraft!
) else (
  echo MINECRAFT NOT FOUND! PRESS ANY KEY TO EXIT
  pause >nul
  exit
)
echo Expanding archive..
set tmp=^"Expand-Archive ^'%tempLoc%\clientmods.zip^' ^'%tempLoc%\clientmods\^'^"
powershell -c %tmp%
echo WARNING! ALL OTHER MODS AND MOD SETTINGS WILL BE DELETED! PRESS ANY KEY TO CONTINUE!
pause >nul
echo Deleting all old mods and old mod settings..
rd /S /Q %appdata%\.minecraft\mods\ 2>nul
rd /S /Q %appdata%\.minecraft\config\ 2>nul
echo Copying over new mods and mod settings..
xcopy %tempLoc%\clientmods\ %appdata%\.minecraft\ /s/e/y/k/c/q
echo Cleaning up..
rd /S /Q %tempLoc% 2>nul
echo Done! PRESS ANY KEY TO EXIT
pause >nul
exit
