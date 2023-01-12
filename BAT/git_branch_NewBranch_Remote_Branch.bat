@echo off
rem -------------------------------------------------------------------
rem git branch --track %Newbranch% %Remote%/%branch%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Newbranch=Newbranch:
if "%Newbranch%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра Newbranch не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Remote=Remote:
if "%Remote%" == "" goto P2_Error
goto P3
:P2_Error
echo Значение параметра remote не установлено
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P3
if "%3" == "" goto P3_Input
goto Begin
:P3_Input
set /p branch=branch:
if "%branch%" == "" goto P3_Error
goto Begin
:P3_Error
echo Значение параметра branch не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git branch --track %Newbranch% %Remote%/%branch%

:Exit
