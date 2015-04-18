@echo off
L:

goto cload

:new
echo default=0>>%config%.conf
echo timeout=5>>%config%.conf
goto :eof

:cload
for /f "delims=" %%x in (etc\cload.conf) do (set "%%x")