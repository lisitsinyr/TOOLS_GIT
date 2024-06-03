@echo off
rem -------------------------------------------------------------------
rem lyrgit_mv.bat
rem ----------------------------------------------------------------------------
rem Переместить или переименовать файл, каталог или символическую ссылку
rem ----------------------------------------------------------------------------
rem usage: git mv [<options>] <source>... <destination>
rem 
rem     -v, --[no-]verbose    be verbose
rem     -n, --[no-]dry-run    dry run
rem     -f, --[no-]force      force move/rename even if target exists
rem     -k                    skip move/rename errors
rem     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
rem ----------------------------------------------------------------------------
chcp 1251

:begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto P2
:P1_Input
set /p source=source:
if "%source%" == "" goto Error_1
goto P2
:Error_1
echo Parametr source not set
goto Exit

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
goto begin_git
:P2_Input
set /p destination=destination:
if "%destination%" == "" goto P2_Error
goto begin_git
:P2_Error
echo Parametr destination not set
goto Exit
rem -------------------------------------------------------------------

:begin_git
echo ----------------------------------------------------------------------------
echo git mv %source% %destination%
echo ----------------------------------------------------------------------------
git mv %source% %destination%

:Exit
