@echo off
rem -------------------------------------------------------------------
rem git diff %branch%
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
echo ???????? ????????? branch ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git diff %branch%

:Exit
