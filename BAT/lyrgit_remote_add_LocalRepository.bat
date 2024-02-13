@echo off
rem -------------------------------------------------------------------
rem lyrgit_remote_add_LocalRepository.bat
rem ----------------------------------------------------------------------------
rem Связываем локальный репозитарий с удаленным
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
SET LocalRepository=%1
goto P2
:P1_Input
set /p LocalRepository=LocalRepository:
if "%LocalRepository%" == "" goto P1_Error
goto P2
:P1_Error
echo Parametr LocalRepository not set
goto Exit

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
SET GlobalRepository=%2
goto begin_git
:P2_Input
set /p GlobalRepository=GlobalRepository:
if "%GlobalRepository%" == "" goto P2_Error
goto begin_git
:P2_Error
echo Parametr GlobalRepository not set
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git remote add %LocalRepository% %GlobalRepository%
echo ----------------------------------------------------------------------------
git remote add %LocalRepository% %GlobalRepository%

:Exit
