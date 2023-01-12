@echo off
rem -------------------------------------------------------------------
rem git branch -d %branch%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p branch=branch:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра branch не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git branch -d %branch%

:Exit
