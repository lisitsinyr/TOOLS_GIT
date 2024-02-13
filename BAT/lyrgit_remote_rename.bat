@echo off
rem -------------------------------------------------------------------
rem lyrgit_remote_rename.bat
rem ----------------------------------------------------------------------------
rem Переименование удаленных репозитариев (по существу переименование локальной ссылки на удаленный репозитарий)
rem ----------------------------------------------------------------------------
rem usage: git remote [-v | --verbose]
rem    or: git remote add [-t <branch>] [-m <master>] [-f] [--tags | --no-tags] [--mirror=<fetch|push>] <name> <url>
rem    or: git remote rename [--[no-]progress] <old> <new>
rem    or: git remote remove <name>
rem    or: git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
rem    or: git remote [-v | --verbose] show [-n] <name>
rem    or: git remote prune [-n | --dry-run] <name>
rem    or: git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)...]
rem    or: git remote set-branches [--add] <name> <branch>...
rem    or: git remote get-url [--push] [--all] <name>
rem    or: git remote set-url [--push] <name> <newurl> [<oldurl>]
rem    or: git remote set-url --add <name> <newurl>
rem    or: git remote set-url --delete <name> <url>
rem 
rem     -v, --[no-]verbose    be verbose; must be placed before a subcommand
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET Repository_old=%1
goto P2
:P1_Input
set /p Repository_old=Repository_old:
if "%Repository_old%" == "" goto P1_Error
goto P2
:P1_Error
echo Parametr Repository_old not set
goto Exit
rem -------------------------------------------------------------------

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
SET Repository_new=%2
goto begin_git
:P2_Input
set /p Repository_new=Repository_new:
if "%Repository_new%" == "" goto P2_Error
goto begin_git
:P2_Error
echo Parametr Repository_new not set
goto Exit
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git remote rename %Repository_old% %Repository_new%
echo ----------------------------------------------------------------------------
git remote rename %Repository_old% %Repository_new%

:Exit
