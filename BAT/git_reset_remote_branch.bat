@echo off
rem -------------------------------------------------------------------
rem git reset %remote% %branch%
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
echo Значение параметра remote не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p branch=branch:
if "%branch%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра branch не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git reset %remote% %branch%

:Exit
