@echo off
rem -------------------------------------------------------------------
rem git diff %Commit%
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
echo ???????? ????????? Commit ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git diff %Commit%

:Exit
