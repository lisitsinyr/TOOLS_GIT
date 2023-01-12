@echo off
rem -------------------------------------------------------------------
rem git diff %Commit_1% %Commit_2%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Commit_1=Commit_1:
if "%Commit_1%" == "" goto Error_1
goto P2
:Error_1
echo Значение параметра Commit_1 не установлено
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Commit_2=Commit_2:
if "%Commit_2%" == "" goto P2_Error
goto Begin
:P2_Error
echo Значение параметра Commit_2 не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git diff %Commit_1% %Commit_2%

:Exit
