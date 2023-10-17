@echo off
Set wshShell = wscript.CreateObject("WScript.Shell")
color 0A
setlocal enabledelayedexpansion

set winwidth=120
set winheight=30

:: blankchar set to one blank char ' '
set blankchar= 

:: mystring blank for now
set mystring=

:: mystring gets 3600 blank characters
For /L %%v In (1, 1, 3600) Do (
  set "mystring=!mystring!!blankchar!"
)

:: start looping here
For /L %%v In (1, 1, 3600) Do (
set newtoplinestring=
For /L %%v In (0, 1, 119) Do (
  set currentChar=!mystring:~%%v,1!
  set randomNum=!RANDOM!
  If !currentChar!==!blankchar! (
    If !randomNum! lss 327 (
      set "newtoplinestring=!newtoplinestring!u"
	) Else (
	  set "newtoplinestring=!newtoplinestring!!blankchar!"
	)
  ) Else (
    If !randomNum! lss 3276 (
	  set "newtoplinestring=!newtoplinestring!!blankchar!"
	) Else (
	  set "newtoplinestring=!newtoplinestring!u"
	)
  )
)
set substring=!mystring:~0,3480!
set "mystring=!newtoplinestring!!substring!"
cls
echo !mystring!
:: sleep for one second before looping again
PING 1.1.1.1 -n 1 -w 1.0 >NUL
)
