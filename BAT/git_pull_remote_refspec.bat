@echo off
rem -------------------------------------------------------------------
rem git pull %remote% %refspec%
rem -------------------------------------------------------------------
chcp 1251
pull <> <>
rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p remote=remote:
if "%Commit_1%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра remote не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p refspec=refspec:
if "%refspec%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра refspec не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git pull %remote% %refspec%

:Exit
