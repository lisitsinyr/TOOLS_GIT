@echo off
rem -------------------------------------------------------------------
rem git remote add %LocalRepository% https://github.com/lisitsinyr/%GlobalRepository%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto P2
:P1_Input
set /p LocalRepository=LocalRepository:
if "%LocalRepository%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра LocalRepository не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
set /p GlobalRepository="%2"
goto Begin1
:P2_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P2_Error
goto Begin1
:P2_Error
echo Значение параметра GlobalRepository не установлено
rem -------------------------------------------------------------------

:begin1
git remote add %LocalRepository% https://github.com/lisitsinyr/%GlobalRepository%

:Exit
