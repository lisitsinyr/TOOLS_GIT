@echo off
rem -------------------------------------------------------------------
rem git branch %remote% %fetch%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p remote=remote:
if "%remote%" == "" goto Error_1
goto P2
:Error_1
echo ???????? ????????? remote ?? ???????????
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p fetch=fetch:
if "%fetch%" == "" goto P2_Error
goto Begin
:P2_Error
echo ???????? ????????? fetch ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
git branch %remote% %fetch%

:Exit
