@echo off
rem -------------------------------------------------------------------
rem git revert %commite%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p commite=commite:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo ???????? ????????? commite ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git revert %commite%

:Exit
