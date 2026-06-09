@echo off
title PSI Process Killer
echo Monitoring and killing processes...
echo.

:loop
taskkill /F /IM psi-bastion.exe >nul 2>&1
taskkill /F /IM psi-keygrab.exe >nul 2>&1
timeout /t 1 /nobreak >nul
goto loop
