@echo off
rem -------------------------------------------------------------------
rem lyrgit_diff_Commit_cached.bat
rem ----------------------------------------------------------------------------
rem Просмотрите внесенные вами изменения по сравнению с последней фиксацией
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
SET Commit=%1
goto begin_git_1
:P1_Input
set /p Commit=Commit:
if "%Commit%" == "" goto Begin1
goto begin_git_2
rem -------------------------------------------------------------------

:begin_git_1
echo ----------------------------------------------------------------------------
echo git diff --cached
echo ----------------------------------------------------------------------------
git diff --cached
goto Exit

:begin_git_2
echo ----------------------------------------------------------------------------
echo git diff --cached %Commit%
echo ----------------------------------------------------------------------------
echo %Commit%
git diff --cached %Commit%

:Exit
