@echo off
L:
set n=0

:kernal
if not exist boot\kernal\%n%.bat goto end
if exist etc\kernal\%n%.bat call etc\kernal\%n%.bat && set options=%options%%n%
if not exist etc\kernal\%n%.bat echo %n%:--unknown--
set /a n=%n%+1
goto kernal

:end
set n=