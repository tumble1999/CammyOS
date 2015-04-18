@setlocal & @echo off
set /a time=%1*1000
ping 1.1.1.1 -n 1 -w %time%>nul