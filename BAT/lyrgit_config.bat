@echo off
rem -------------------------------------------------------------------
rem lyrgit_config.bat
rem ----------------------------------------------------------------------------
rem GIT_CONFIG_list_so_ss_current
rem ----------------------------------------------------------------------------
rem usage: git config [<options>]
rem 
rem Config file location
rem     --[no-]global         use global config file
rem     --[no-]system         use system config file
rem     --[no-]local          use repository config file
rem     --[no-]worktree       use per-worktree config file
rem     -f, --[no-]file <file>
rem                           use given config file
rem     --[no-]blob <blob-id> read config from given blob object
rem 
rem Action
rem     --[no-]get            get value: name [value-pattern]
rem     --[no-]get-all        get all values: key [value-pattern]
rem     --[no-]get-regexp     get values for regexp: name-regex [value-pattern]
rem     --[no-]get-urlmatch   get value specific for the URL: section[.var] URL
rem     --[no-]replace-all    replace all matching variables: name value [value-pattern]
rem     --[no-]add            add a new variable: name value
rem     --[no-]unset          remove a variable: name [value-pattern]
rem     --[no-]unset-all      remove all matches: name [value-pattern]
rem     --[no-]rename-section rename section: old-name new-name
rem     --[no-]remove-section remove a section: name
rem     -l, --[no-]list       list all
rem     --[no-]fixed-value    use string equality when comparing values to 'value-pattern'
rem     -e, --[no-]edit       open an editor
rem     --[no-]get-color      find the color configured: slot [default]
rem     --[no-]get-colorbool  find the color setting: slot [stdout-is-tty]
rem 
rem Type
rem     -t, --[no-]type <type>
rem                           value is given this type
rem     --bool                value is "true" or "false"
rem     --int                 value is decimal number
rem     --bool-or-int         value is --bool or --int
rem     --bool-or-str         value is --bool or string
rem     --path                value is a path (file or directory name)
rem     --expiry-date         value is an expiry date
rem 
rem Other
rem     -z, --[no-]null       terminate values with NUL byte
rem     --[no-]name-only      show variable names only
rem     --[no-]includes       respect include directives on lookup
rem     --[no-]show-origin    show origin of config (file, standard input, blob, command line)
rem     --[no-]show-scope     show scope of config (worktree, local, global, system, command)
rem     --[no-]default <value>
rem                           with --get, use default value when missing entry
rem ----------------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 
rem echo -------------------------------------------------------
rem CURRENT_DIR - Текущий каталог
set CURRENT_DIR=%CD%
rem echo Текущий каталог %CURRENT_DIR%
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem Каталог BAT_DIR: каталог
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
    set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT\BAT\99.[lyr]LYR
)
rem echo BAT_DIR: %BAT_DIR%

call %BAT_DIR%\__SET__.bat

:begin
echo ------------------------------------------------------- > %LOG_FULLFILENAME%
echo Запуск %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Текущий каталог %CURRENT_DIR% >> %LOG_FULLFILENAME%
echo ТЕЛО СКРИПТА %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- > %LOG_FULLFILENAME%
echo ...git config --list --show-origin --show-scope >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
git config --list --show-origin --show-scope  >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
