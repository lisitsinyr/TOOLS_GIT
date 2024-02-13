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

rem -------------------------------------------------------------------
rem Каталог журнала: каталог
rem     LOG_DIR=
rem Файл журнала: имя+расширение
rem     LOG_BASEFILENAME=
rem Файл журнала: имя
rem     LOG_FILENAME=
rem Формат имени файлф журнала: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem Параметры журнала
rem     LOG_OPT=11
rem -------------------------------------------------------------------

rem echo -------------------------------------------------------
rem echo 0.DEFAULT
rem echo -------------------------------------------------------

set REPO_CONFIG=.git\config
rem Проверка существования файла REPO_CONFIG
if not exist %REPO_CONFIG% (
    echo ERROR: Файл %REPO_CONFIG% с настройками отсутствует
    exit /b 1
)
rem for /f "eol=# delims== tokens=1,2" %%i in (%REPO_CONFIG%) do (
rem     rem В переменной i - ключ
rem     rem В переменной j - значение
rem     set %%i=%%j
rem     echo %%j
rem )

set REPO=REPO.ini
rem Проверка существования файла REPO
if not exist %REPO% (
    echo ERROR: Файл %REPO% с настройками отсутствует
    exit /b 1
)
for /f "eol=# delims== tokens=1,2" %%i in (%REPO%) do (
   rem В переменной i - ключ
   rem В переменной j - значение
   set %%i=%%j
)
rem echo REPO_NAME: %REPO_NAME%

set LOG_DIR=.
set LOG_DIR=D:\PROJECTS_LYR\LOGS
set LOG_FILENAME=%REPO_NAME%_CONFIG_list_so_ss_current
rem echo LOG_FILENAME: %LOG_FILENAME%

rem ...Каталог BAT_DIR: каталог
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%
rem ...DATETIME_STAMP
set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem echo DATETIME_STAMP: %DATETIME_STAMP%
rem ...Формат имени файлф журнала: FILENAME,DT,...
if "%LOG_FILENAME_FORMAT%" == "" (
    set LOG_FILENAME_FORMAT=FILENAME
    rem set LOG_FILENAME_FORMAT=DATETIME
)
rem echo LOG_FILENAME_FORMAT: %LOG_FILENAME_FORMAT%
rem ...Параметры журнала
if "%LOG_OPT%" == "" (
    set LOG_OPT=11
)
rem echo LOG_OPT: %LOG_OPT%
rem echo -------------------------------------------------------
rem echo 1.PROJECTS
rem echo -------------------------------------------------------
set PROJECTS=PROJECTS_BAT
rem echo PROJECTS: %PROJECTS%
set CURRENT_SYSTEM=%OS%
rem echo CURRENT_SYSTEM: %CURRENT_SYSTEM%
set UNAME=%COMPUTERNAME%
rem echo UNAME: %UNAME%
set USERNAME=%USERNAME%
rem echo USERNAME: %USERNAME%
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
rem echo PROJECTS_DIR: %PROJECTS_DIR%
rem ...Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ...Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ...Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem echo -------------------------------------------------------
rem echo 2.Каталог журналов
rem echo -------------------------------------------------------
rem Каталог журнала: каталог
if "%LOG_DIR%" == "" (
    rem set LOG_FULLFILENAME=%~d0%~p0LOGS
    set LOG_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%\LOGS
)
rem echo LOG_DIR: %LOG_DIR%
if exist %LOG_DIR% (
    rem echo Каталог %LOG_DIR% существует
) else (
    echo ERROR: Каталог %LOG_DIR% не существует
    exit /b 1
)
rem ...Файл журнала: имя
if "%LOG_FILENAME%" == "" (
    if "%LOG_FILENAME_FORMAT%" == "FILENAME" (
        set LOG_FILENAME=%SCRIPT_FILENAME%
    ) else (
        if "%LOG_FILENAME_FORMAT%" == "DATETIME" (
            set LOG_FILENAME=%DATETIME_STAMP%
        ) else (
            echo ERROR: Файл журнала не задан
            exit /b 1
        )
    )
)
rem echo LOG_FILENAME: %LOG_FILENAME%
rem ...Файл журнала: каталог+имя+расширение
set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem ...Параметры журнала LOG_OPT1
set LOG_OPT1=%LOG_OPT:~0,1%
if "%LOG_OPT1%" == "" (
    set LOG_OPT1=1
)
rem echo LOG_OPT1: %LOG_OPT1%
rem ...Параметры журнала LOG_OPT2
set LOG_OPT2=%LOG_OPT:~1,1%
if "%LOG_OPT2%" == "" (
    set LOG_OPT2=1
)
rem echo LOG_OPT2: %LOG_OPT2%

echo -------------------------------------------------------
echo 5. Запуск
echo -------------------------------------------------------

:begin
echo --------------------------------------------------------------- > %LOG_FULLFILENAME%
echo ...git config --list --show-origin --show-scope >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
git config --list --show-origin --show-scope  >> %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
