@echo off
rem -------------------------------------------------------------------
rem git reset HEAD %FileNames%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p FileNames=FileNames:
if "%FileNames%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра FileNames не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git reset HEAD %FileNames%

:Exit
