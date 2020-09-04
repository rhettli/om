@echo off

echo  %0 %1 %2
::echo END====

::  echo -- cw == cwjit oshine/install cw
::  echo -- cw login== cwjit oshine/install cw login
::  echo -- cw install== cwjit oshine/install install
::  %cd%

set program=%CW_PATH%
if "%p1%"=="" (
    echo not find cwjit env path [CW_PATH]
    goto end
)

echo "got cw path:%program%"

::  SET Path=D:\phpStudy\mysql\bin;%Path%




set p1=%1
if "%p1%"=="" (
    goto end
)

echo "you want %p1%"



exit
:end
echo end...