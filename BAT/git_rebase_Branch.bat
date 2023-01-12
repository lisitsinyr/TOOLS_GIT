@echo off
rem -------------------------------------------------------------------
rem git rebase %upstream_branch%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p upstream_branch=upstream_branch:
if "%branch%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра upstream_branch не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git rebase %upstream_branch%

:Exit
