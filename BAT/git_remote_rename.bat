@echo off
rem -------------------------------------------------------------------
rem git remote rename https://github.com/lisitsinyr/%Repository_old% https://github.com/lisitsinyr/%Repository_new%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto P2
:P1_Input
set /p Repository_old=Repository_old:
if "%Repository_old%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра Repository_old не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Repository_new=Repository_new:
if "%Repository_new%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра Repository_new не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git remote rename https://github.com/lisitsinyr/%Repository_old% https://github.com/lisitsinyr/%Repository_new%

:Exit
