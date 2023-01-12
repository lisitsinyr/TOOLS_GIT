@echo off
rem -------------------------------------------------------------------
rem git diff %OldBranch% %NewBranch%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p OldBranch=OldBranch:
if "%OldBranch%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра OldBranch не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p NewBranch=NewBranch:
if "%NewBranch%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра NewBranch не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git branch -m %OldBranch% %NewBranch%

:Exit
