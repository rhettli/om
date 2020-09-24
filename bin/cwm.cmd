@echo off

echo  %0 %1 %2
::echo END====



set p1=%CWM_PATH%
if "%p1%"=="" (
    echo not find cwjit env path [CWM_PATH]
    setx CWM_PATH %~dp0
)

if not exist %p1%cwm.cmd (
    echo cwm install not correct repair
    setx CWM_PATH %~dp0
)

set allparam=

:param
set str=%1
if "%str%"=="" (
    goto end
)

set allparam=%allparam% %str%
shift /0
goto param

:end
if "%allparam%"=="" (
    goto eof
)

rem remove left right blank
:intercept_left
if "%allparam:~0,1%"==" " set "allparam=%allparam:~1%"&goto intercept_left

:intercept_right
if "%allparam:~-1%"==" " set "allparam=%allparam:~0,-1%"&goto intercept_right

:eof

echo %allparam%

::  echo -- cw == cwjit   /cwm  cw
::  echo -- cw login==    cwjit /cwm login
::  echo -- cw install==  cwjit /cwm install

echo allparam is  %allparam%

if exist %CW_PATH%\cw.exe (
    %CW_PATH%\cw.exe   %CWM_PATH%\..\cwm.lua  %allparam%
)
