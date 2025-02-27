@echo off
rem -------------------------------------------------------------------
rem lyrgit_diff_Commit.bat
rem ----------------------------------------------------------------------------
rem Просмотр изменения, которые у вас есть в вашей рабочей области относительно коммита
rem ----------------------------------------------------------------------------
rem git diff [<options>] [<commit>] [--] [<path>...]
rem git diff [<options>] --cached [--merge-base] [<commit>] [--] [<path>...]
rem git diff [<options>] [--merge-base] <commit> [<commit>...] <commit> [--] [<path>...]
rem git diff [<options>] <commit>...<commit> [--] [<path>...]
rem git diff [<options>] <blob> <blob>
rem git diff [<options>] --no-index [--] <path> <path>
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET Commit= %1
goto begin_git
:P1_Input
set /p Commit=Commit:
if "%Commit%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Paremetr Commit not set
goto Exit

:begin_git
echo ----------------------------------------------------------------------------
echo git diff %Commit%
echo ----------------------------------------------------------------------------
git diff %Commit%

:Exit
