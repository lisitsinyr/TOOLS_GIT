@echo off
rem -------------------------------------------------------------------
rem git clone https://github.com/lisitsinyr/%GlobalRepository%
rem git clone https://github.com/lisitsinyr/%GlobalRepository% %LocalRepository%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto P2
:P1_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P1_Error
goto P2
:P1_Error
echo Значение параметра GlobalRepository не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
set /p LocalRepository="%2"
goto Begin2
:P2_Input
set /p LocalRepository=LocalRepository:
if "%LocalRepository%" == "" goto Begin1
goto Begin2
rem -------------------------------------------------------------------

:begin1
git clone https://github.com/lisitsinyr/%GlobalRepository%
goto Exit

:begin2
git clone https://github.com/lisitsinyr/%GlobalRepository% %LocalRepository%
goto Exit

:Exit
