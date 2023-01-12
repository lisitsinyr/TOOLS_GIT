@echo off
rem -------------------------------------------------------------------
rem git rm -cached %FileName%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p FileName=FileName:
if "%FileName%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра FileName не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git rm -cached %FileName%

:Exit
