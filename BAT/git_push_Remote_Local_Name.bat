@echo off
rem -------------------------------------------------------------------
rem git Name --track %Remote% %Local%:%Name%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p Remote=Remote:
if "%Remote%" == "" goto Error_1
goto P2
:Error_1
echo ???????? ????????? Remote ?? ???????????
goto Exit

rem -------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto Begin
:P2_Input
set /p Local=Local:
if "%Local%" == "" goto P2_Error
goto P3
:P2_Error
echo ???????? ????????? Local ?? ???????????
goto Exit
rem -------------------------------------------------------------------

rem -------------------------------------------------------------------
:P3
if "%3" == "" goto P3_Input
goto Begin
:P3_Input
set /p Name=Name:
if "%Name%" == "" goto P3_Error
goto Begin
:P3_Error
echo ???????? ????????? Name ?? ???????????
goto Exit
rem -------------------------------------------------------------------

:begin
echo git Name --track %Remote% %Local%:%Name%

:Exit
