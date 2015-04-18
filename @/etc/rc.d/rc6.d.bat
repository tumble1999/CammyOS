@echo off
L:
echo Restarting...
timeout /t 5 /nobreak
set /p restart=<etc\rebootpath.conf
c:
cd %restart%
start PowerOn.bat
exit