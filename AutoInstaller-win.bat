@echo off
color 0a

rd /S /Q %temp%\ClientSMPMods 2>nul
mkdir %temp%\ClientSMPMods

title ClientSMPMods AutoInstaller
echo WARNING! THIS PROGRAM IS ONLY IN ENGLISH!
echo.
echo.
echo Welcome to ClientSMPMods AutoInstaller!
echo This will install ClientSMPMods AUTOMATICALLY for you!
echo WARNING! THIS ONLY WORKS ON WINDOWS 7 AND ABOVE!
echo Downloading modpack..
powershell -c (New-Object Net.WebClient).DownloadFile('https://github.com/PatrickMSM/ClientSMPMods/raw/master/clientmods.zip', '%TEMP%\ClientSMPMods\clientmods.zip')
echo Searching for minecraft..
if exist %appdata%\.minecraft\ (
  echo Found Minecraft!
) else (
  echo MINECRAFT NOT FOUND! PRESS ANY KEY TO EXIT
  pause >nul
  exit
)
echo Expanding archive..
powershell -c Expand-Archive '%TEMP%\ClientSMPMods\clientmods.zip' '%TEMP%\ClientSMPMods\clientmods.zip'
echo WARNING! ALL OTHER MODS AND MOD SETTINGS WILL BE DELETED! PRESS ANY KEY TO CONTINUE!
pause >nul
echo Deleting all old mods and old mod settings..
rd /S /Q %appdata%\.minecraft\mods\ 2>nul
rd /S /Q %appdata%\.minecraft\config\ 2>nul
echo Copying over new mods and mod settings..
xcopy %TEMP%\ClientSMPMods\clientmods\ %appdata%\.minecraft\ /s/e/y/k/c/q
echo Cleaning up..
rd /S /Q %TEMP%\ClientSMPMods 2>nul
echo Done! PRESS ANY KEY TO EXIT
pause >nul
exit
