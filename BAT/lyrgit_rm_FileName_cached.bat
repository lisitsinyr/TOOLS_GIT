@echo off
rem -------------------------------------------------------------------
rem lyrgit_rm_FileName_cached.bat
rem ----------------------------------------------------------------------------
rem Удаление файла из индекса, но сохранение его в рабочем каталоге
rem ----------------------------------------------------------------------------
rem usage: git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch]
rem               [--quiet] [--pathspec-from-file=<file> [--pathspec-file-nul]]
rem               [--] [<pathspec>...]
rem 
rem     -n, --[no-]dry-run    dry run
rem     -q, --[no-]quiet      do not list removed files
rem     --[no-]cached         only remove from the index
rem     -f, --[no-]force      override the up-to-date check
rem     -r                    allow recursive removal
rem     --[no-]ignore-unmatch exit with a zero status even if nothing matched
rem     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
rem     --[no-]pathspec-from-file <file>
rem                           read pathspec from file
rem     --[no-]pathspec-file-nul
rem                           with --pathspec-from-file, pathspec elements are separated with NUL character
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET FileName=%1
goto begin_git
:P1_Input
set /p FileName=FileName:
if "%FileName%" == "" goto P1_Error
goto begin_git
:P1_Error
echo Parametr FileName not set
goto Exit
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git rm -cached %FileName%
echo ----------------------------------------------------------------------------
git rm -cached %FileName%

:Exit
