@echo off
L:
del tmp /q
goto main

:new
echo ------------------------------------------------------
echo.
echo.
echo NEW KERNAL-----
echo.
set n=0
:n
if not exist boot\kernal\%n%.bat goto continue
set /a n=n+1
goto n
:continue
set /p name=Name: 

echo --------------------------------------
echo RUNLEVELS
type etc\rc.d\rc.d.info
echo.
echo.
echoleave empty for defalt
set /p r=Number: 
echo echo %n%: %name%>etc\kernal\%n%.bat
echo set id=%r%>boot\kernal\%n%.bat
goto main

:main
call boot\cload.bat
echo Wait %timeout% seconds for [%default%] to be activated...
echo Press 'N' to create a new kernal option.
echo.
echo ##################################
call boot\kernal
echo ##################################
echo.
choice /c:n%options% /n /t:%timeout% /d:%default% /m:"Enter Number"
if %errorlevel%==255 goto new
if %errorlevel%==1 goto new
if %errorlevel%==0 set number=%default%
if not %errorlevel%==0 set /a number=%errorlevel%-2
call boot\kernal\%number%.bat
call etc\inittab %id%