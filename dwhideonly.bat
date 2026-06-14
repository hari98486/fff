@echo off
:: ============================================================
::  remove_dwagent_ui.bat
::  - Stops DWAgent, deletes its UI & images folders, restarts
::    the service.  Must be run with administrative privileges.
:: ============================================================

cd C:\Program Files\DWAgent
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgent1
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgent12
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgent123
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgent1234
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgent12345
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAgen
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAge
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWAg
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DWA
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\DW
rmdir /q /s images
rmdir /q /s ui
cd C:\Program Files\D
rmdir /q /s images
rmdir /q /s ui


















set "ROOT=C:\Program Files\DWAgent"

echo.
echo === Stopping DWAgent service ===
sc stop DWAgent >nul 2>&1

:: Kill any leftover DWAgent processes (just in case)
taskkill /F /IM dwagent.exe  >nul 2>&1
taskkill /F /IM dwagsvc.exe  >nul 2>&1
taskkill /F /IM monitor.exe  >nul 2>&1
taskkill /F /IM dwaglnc.exe  >nul 2>&1

echo.
echo === Removing UI and images folders ===
rmdir /S /Q "%ROOT%\ui"     >nul 2>&1
rmdir /S /Q "%ROOT%\images" >nul 2>&1

echo.
echo === Restarting DWAgent service ===
sc start DWAgent


sc config DWAgent start= auto
sc start DWAgent


echo.
echo Done.
pause
