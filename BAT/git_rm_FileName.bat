@echo off
rem -------------------------------------------------------------------
rem git rm %FileName%
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
echo ???????? ????????? FileName ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git rm %FileName%

:Exit
