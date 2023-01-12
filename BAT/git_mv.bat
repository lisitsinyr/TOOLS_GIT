@echo off
rem -------------------------------------------------------------------
rem git mv %source% %destination%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p source=source:
if "%source%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра source не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p destination=destination:
if "%destination%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git mv %source% %destination%

:Exit
