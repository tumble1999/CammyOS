@echo off
set root=%0
cd %root:~1,35%
echo %root:~1,35%>L:\etc\rebootpath.conf
set root=

set boot=boot\loader

title ...
echo [...] Starting BIOS.
set BIOS=%cd%\bios
call :sleep 1
title [BIOS]
if not exist @ goto error
echo [BIOS] Hard Drive Found.
call :sleep 1
L:
goto bios

:sleep
call %BIOS%\sleep %1
goto :eof

:cboot
call %BIOS%\cboot %1
goto :eof

:error
cls
title [BIOS:ERROR]
echo No bootable devices found.
pause>nul
goto :eof

:errorone
cls
title [BIOS:ERROR]
echo Missing operating system.
pause>nul
goto :eof

:errortwo
cls
title [MBR:ERROR]
echo Error loading operationg system.
pause>nul
goto :eof

:bios
title [BIOS] Starting MBR...
echo [BIOS] Starting MBR (Master Boot Record)...
call :sleep 1
if not exist boot goto errorone
if not exist %boot%.bat goto errortwo

title [MBR] Loading...
call :sleep 1
start %boot%.bat

set BIOS=
set boot=