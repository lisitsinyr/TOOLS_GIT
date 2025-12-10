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
    set BATNAME=%~nx0
    echo Start !BATNAME! ...

    set DEBUG=

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem LIB_BAT - каталог библиотеки скриптов
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    call :MAIN_INIT %* || exit /b 1

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

    call :SET_LIB %0 || exit /b 1
    rem echo CURRENT_DIR: !CURRENT_DIR!

    call :StartLogFile || exit /b 1
    
    set OK=yes
    
    call :MAIN_SET %* || exit /b 1

    call :MAIN_CHECK_PARAMETR %* || exit /b 1

    if defined OK (
        call :MAIN %* || exit /b 1
    )
    call :StopLogFile || exit /b 1

    exit /b 0
:end
rem --------------------------------------------------------------------------------

rem -----------------------------------------------
rem procedure MAIN_INIT (FULLFILENAME, DEBUG)
rem -----------------------------------------------
:MAIN_INIT
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_INIT
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR - Каталог скриптов
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR (
        set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\BAT\PROJECTS_BAT\TOOLS_SRC_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\SRC\LIB
        rem echo LIB_BAT: !LIB_BAT!
    )
    if not exist !LIB_BAT!\ (
        echo ERROR: Каталог библиотеки LYR !LIB_BAT! не существует...
        exit /b 0
    )
    rem -------------------------------------------------------------------
    rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
    rem -------------------------------------------------------------------
    if not defined SCRIPTS_DIR_KIX (
        set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\SCRIPT\KIX\PROJECTS_KIX\TOOLS_SRC_KIX
    )
    rem echo SCRIPTS_DIR_KIX: !SCRIPTS_DIR_KIX!

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_SET ()
rem --------------------------------------------------------------------------------
:MAIN_SET
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_SET
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    exit /b 0
rem endfunction

rem --------------------------------------------------------------------------------
rem procedure MAIN_CHECK_PARAMETR ()
rem --------------------------------------------------------------------------------
:MAIN_CHECK_PARAMETR
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_CHECK_PARAMETR
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    rem -------------------------------------
    rem OPTION
    rem -------------------------------------

    rem -------------------------------------
    rem ARGS
    rem -------------------------------------
    rem Проверка на обязательные аргументы

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN ()
rem =================================================
:MAIN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    call :MAIN_GIT_RUN || exit /b 1

    rem call :Pause !SLEEP! || exit /b 1
    rem call :PressAnyKey || exit /b 1

    exit /b 0
rem endfunction

rem =================================================
rem procedure MAIN_GIT_RUN ()
rem =================================================
:MAIN_GIT_RUN
rem beginfunction
    set FUNCNAME=%0
    set FUNCNAME=MAIN_GIT_RUN
    if defined DEBUG (
        echo DEBUG: procedure !FUNCNAME! ...
    )

    echo ...git config --list --show-origin --show-scope
    git config --list --show-origin --show-scope  >> !LOG_FULLFILENAME!

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem =================================================
rem LYRConst.bat
rem =================================================
:SET_LIB
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
:SET_KIX
%LIB_BAT%\LYRLIB.bat %*
exit /b 0
rem =================================================
rem LYRDateTime.bat
rem =================================================
:YYYYMMDDHHMMSS
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
:DateTime
%LIB_BAT%\LYRDateTime.bat %*
exit /b 0
rem =================================================
rem LYRFileUtils.bat
rem =================================================
:ExtractFileDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FullFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileName
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileNameWithoutExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:ExtractFileExt
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileAttr
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:FileSize
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CreateFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CheckFile
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
:CurrentDir
%LIB_BAT%\LYRFileUtils.bat %*
exit /b 0
rem =================================================
rem LYRLog.bat
rem =================================================
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
rem =================================================
rem LYRStrUtils.bat
rem =================================================
rem =================================================
rem LYRSupport.bat
rem =================================================
:Pause
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_F
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
