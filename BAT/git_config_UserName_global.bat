@echo off
rem -------------------------------------------------------------------
rem git config -global user.name "%UserName%"
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p UserName=UserName:
if "%UserName%" == "" goto P1_Error
goto Begin
:P1_Error
echo ???????? ????????? UserName ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git config -global user.name "%UserName%"

:Exit
