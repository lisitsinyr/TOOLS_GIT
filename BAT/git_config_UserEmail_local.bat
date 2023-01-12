@echo off
rem -------------------------------------------------------------------
rem git config -local user.name "%UserEmail%"
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p UserEmail=UserEmail:
if "%UserEmail%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра UserEmail не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git config -local user.name "%UserEmail%"

:Exit
