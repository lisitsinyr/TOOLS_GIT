@echo off
rem -------------------------------------------------------------------
rem lyrgit_diff_Commit_Commit.bat
rem ----------------------------------------------------------------------------
rem Просмотр изменений между двумя произвольными коммитами
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
SET Commit_1=%1
goto P2
:P1_Input
set /p Commit_1=Commit_1:
if "%Commit_1%" == "" goto Error_1
goto P2
:Error_1
echo Parametr Commit_1 not set
goto Exit

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
SET Commit_2=%2
goto begin_git
:P2_Input
set /p Commit_2=Commit_2:
if "%Commit_2%" == "" goto P2_Error
goto begin_git
:P2_Error
echo Parametr Commit_2 not set
goto Exit
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git diff %Commit_1% %Commit_2%
echo ----------------------------------------------------------------------------
git diff %Commit_1% %Commit_2%

:Exit
