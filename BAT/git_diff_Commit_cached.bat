@echo off
rem -------------------------------------------------------------------
rem git diff --cached
rem git diff %Commit%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Commit=Commit:
if "%Commit%" == "" goto Begin1
goto Begin2
rem :P1_Error
rem echo Значение параметра Commit не установлено
rem goto Exit
rem -------------------------------------------------------------------

:begin1
git diff --cached
goto Exit

:begin2
git diff --cached %Commit%
goto Exit

:Exit
