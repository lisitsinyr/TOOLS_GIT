@echo off
rem -------------------------------------------------------------------
rem git merge %Commit%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Commit=Commit:
if "%Commit%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра Commit не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git merge %Commit%

:Exit
