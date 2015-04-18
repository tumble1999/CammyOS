@echo off
set runlevel=if %id%
set id=%1
if not defigned %id% (

:: runlevel 0 is Shutdown
:: runlevel 1 is Single user mode
:: runlevel 2 is Multiuser, without NFS
:: runlevel 3 is Full multiuser mode
:: runlevel 4 is unused
:: runlevel 5 is X11
:: runlevel 6 is reboot

::Setup the default runlevel here
	set id=2
)

call etc\rc.d\rc%id%.d

