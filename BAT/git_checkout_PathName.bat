@echo off
rem -------------------------------------------------------------------
rem git checkout %PathName%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p PathName=PathName:
if "%PathName%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра PathName не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git checkout %PathName%

:Exit
