@echo off
rem -------------------------------------------------------------------
rem git clone https://github.com/lisitsinyr/%GlobalRepository%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра GlobalRepository не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git clone https://github.com/lisitsinyr/%GlobalRepository%

:Exit
