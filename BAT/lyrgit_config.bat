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
chcp 1251>NUL

setlocal enabledelayedexpansion

rem --------------------------------------------------------------------------------
rem 
rem --------------------------------------------------------------------------------
:begin
    call :MAIN_INIT %0 || exit /b 1
    call :MAIN_SET || exit /b 1
    call :StartLogFile || exit /b 1
    rem set DIR_SAVE=%CURRENT_DIR%
    rem call :MAIN_CHECK_PARAMETR || exit /b 1
    rem call :MAIN_SYNTAX || exit /b 1
    call :MAIN || exit /b 1
    call :StopLogFile || exit /b 1
    rem far -v %LOG_FULLFILENAME%
    rem cd /D %DIR_SAVE%
:Exit
exit /b 0
rem --------------------------------------------------------------------------------

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:__SET_VAR_SCRIPT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_DEFAULT
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_VAR_PROJECTS
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_CHECK_REPO
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:__SET_LOG
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
:FormatStr
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLog
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:AddLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem PROJECTS - имя проекта
    rem -------------------------------------------------------------------
    set PROJECTS=PROJECTS_BAT

    rem -------------------------------------------------------------------
    rem PROJECTS_LYR_DIR - каталог проектов
    rem -------------------------------------------------------------------
    set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if "%SCRIPTS_DIR%" == "" (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem -------------------------------------------------------------------
    rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
    rem -------------------------------------------------------------------
    set SCRIPT_FULLFILENAME=%1
    rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
  
    rem -------------------------------------------------------------------
    rem PROJECTS_DIR - каталог проекта
    rem -------------------------------------------------------------------
    set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
    rem echo PROJECTS_DIR: %PROJECTS_DIR%

    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if "%LIB_BAT%" == "" (
        set LIB_BAT=%SCRIPTS_DIR%\LIB
        rem echo LIB_BAT: %LIB_BAT%
    )
    if not exist %LIB_BAT%\ (
        echo ERROR: Каталог библиотеки LYR $LIB_BAT не существует...
        exit /b 0
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    if "%SCRIPTS_DIR_KIX%" == "" (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
    )
    rem echo SCRIPTS_DIR_KIX: %SCRIPTS_DIR_KIX%

    exit /b 0
rem endfunction

rem -----------------------------------------------
rem procedure MAIN_SET ()
rem -----------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :__SET_VAR_DEFAULT %DEBUG% || exit /b 1
    call :__SET_VAR_SCRIPT %SCRIPT_FULLFILENAME% || exit /b 1
    call :__SET_VAR_PROJECTS || exit /b 1
    call :__SET_CHECK_REPO || exit /b 1
    rem -------------------------------------------------------------------
    rem LOG_DT_FORMAT -
    rem set LOG_DT_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
    rem set LOG_FILENAME_FORMAT=
    rem -------------------------------------------------------------------
    rem LOG_FILE_ADD - Параметры журнала [0]
    if "%LOG_FILE_ADD%"=="" set LOG_FILE_ADD=0
    rem echo LOG_FILE_ADD: %LOG_FILE_ADD%
    rem -------------------------------------------------------------------
    rem LOG_FILE_DT - Параметры журнала [0]
    if "%LOG_FILE_DT%"=="" set LOG_FILE_DT=0
    rem  -------------------------------------------------------------------
    rem LOG_DIR - Каталог журнала [каталог]
    rem set LOG_DIR=
    rem -------------------------------------------------------------------
    rem LOG_FILENAME - Файл журнала [имя]
    rem set LOG_FILENAME=
    call :__SET_LOG || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    set P1=P1_default
    call :Check_P P1 %1 || exit /b 1

    rem call :AddLog %loStandard% %TEXT% "P1: %P1%" || exit /b 1
    rem call :AddLog %loTextFile% %TEXT% "P1: %P1%" || exit /b 1
    call :AddLog %loAll% %TEXT% P1: %P1% || exit /b 1
    call :AddLog %loAll% %INFO% P1: %P1% || exit /b 1

    rem set F=LYRLog.txt
    rem call :AddLogFile %loAll% %F%

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SYNTAX ()
rem --------------------------------------------------------------------------------
:MAIN_SYNTAX
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN ()
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :MAIN_FUNC || exit /b 1

    rem call :Pause %SLEEP% || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_FUNC ()
rem --------------------------------------------------------------------------------
:MAIN_FUNC
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :GIT_RUN || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem procedure GIT_RUN ()
rem =================================================
:GIT_RUN
rem beginfunction
    set FUNCNAME=%0
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo --------------------------------------------------------------- > %LOG_FULLFILENAME%
    echo ...git config --list --show-origin --show-scope >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    git config --list --show-origin --show-scope  >> %LOG_FULLFILENAME%

    exit /b 0
rem endfunction
