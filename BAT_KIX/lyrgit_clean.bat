@echo off
rem -------------------------------------------------------------------
rem lyrgit_clean.bat
rem ----------------------------------------------------------------------------
rem 
rem ----------------------------------------------------------------------------
rem usage: git clean [-d] [-f] [-i] [-n] [-q] [-e <pattern>] [-x | -X] [--] [<pathspec>...]
rem 
rem     -q, --[no-]quiet      do not print names of files removed
rem     -n, --[no-]dry-run    dry run
rem     -f, --[no-]force      force
rem     -i, --[no-]interactive
rem                           interactive cleaning
rem     -d                    remove whole directories
rem     -e, --exclude <pattern>
rem                           add <pattern> to ignore rules
rem     -x                    remove ignored files, too
rem     -X                    remove only ignored files
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo git clean
echo ----------------------------------------------------------------------------
git clean

:Exit
