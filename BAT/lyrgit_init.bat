@echo off
rem -------------------------------------------------------------------
rem lyrgit_init.bat
rem ----------------------------------------------------------------------------
rem 1.Запустить рабочую зону [***]
rem ----------------------------------------------------------------------------
rem Инициализация репозитария в текущем катологе или в заданном каталоге       
rem ----------------------------------------------------------------------------
rem usage: git init [-q | --quiet] [--bare] [--template=<template-directory>]
rem                 [--separate-git-dir <git-dir>] [--object-format=<format>]
rem                 [-b <branch-name> | --initial-branch=<branch-name>]
rem                 [--shared[=<permissions>]] [<directory>]
rem 
rem     --[no-]template <template-directory>
rem                           directory from which templates will be used
rem     --[no-]bare           create a bare repository
rem     --shared[=<permissions>]
rem                           specify that the git repository is to be shared amongst several users
rem     -q, --[no-]quiet      be quiet
rem     --[no-]separate-git-dir <gitdir>
rem                           separate git dir from working tree
rem     -b, --[no-]initial-branch <name>
rem                           override the name of the initial branch
rem     --[no-]object-format <hash>
rem                           specify the hash algorithm to use
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
    set OK=yes

    call :MAIN_INIT %0 || exit /b 1
    call :__SET_MAIN %0 || exit /b 1
    echo CURRENT_DIR: !CURRENT_DIR!
    call :StartLogFile || exit /b 1
    call :MAIN_SET || exit /b 1
    if defined OK if not defined Read_N (
        call :MAIN_CHECK_PARAMETR %* || exit /b 1
    )
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
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
        set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
    )
    rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
    rem -------------------------------------------------------------------
    rem LIB_BAT - каталог библиотеки скриптов
    rem -------------------------------------------------------------------
    if not defined LIB_BAT (
        set LIB_BAT=!SCRIPTS_DIR!\LIB
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
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
        set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
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

    rem Количество аргументов
    call :Read_N %* || exit /b 1
    rem echo Read_N: !Read_N!

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

    set PN_CAPTION=Ввод значения directory
    set directory=
    call :Read_P directory %1 || exit /b 1
    echo directory: !directory!

    set PN_CAPTION=Comment
    set Comment="Git Bash commit update"
    set Comment=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
    call :Check_P Comment !Comment! || exit /b 1
    rem echo Comment: !Comment!
    rem call :AddLog !loStandard! !TEXT! Comment: !Comment! || exit /b 1
    rem call :AddLog !loTextFile! !TEXT! Comment: !Comment! || exit /b 1
    call :AddLog !loAll! !TEXT! Comment: !Comment! || exit /b 1
    call :AddLog !loAll! !INFO! Comment: !Comment! || exit /b 1

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

    if defined directory (
        if not exist "!directory!\" (
            echo INFO: directory "!directory!\" not exist ...
            mkdir "!directory!"
        )
        cd "!directory!"
    )
    rem Создание и настройка репозитория
    if not exist ".git\" (
        if defined OK (
            call :MAIN_GIT_RUN || exit /b 1
        )
    ) else (
        echo ERROR: Repository exist ...
    )

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

    rem set touchRUN=D:\TOOLS\EXE\touch.exe
    rem echo touchRUN: !touchRUN!

    set FileName=.gitignore
    if not exist !FileName! (
        echo Create !FileName! ...
        %touchRUN% !FileName!
        attrib +A !FileName!
    )
    set FileName=.gitmodules
    if not exist !FileName! (
        echo Create !FileName! ...
        %touchRUN% !FileName!
        attrib +A !FileName!
    )
    set file=README.md
    if not exist !FileName! (
        echo Create !FileName! ...
        %touchRUN% !FileName!
        attrib +A !FileName!
        echo PROJECT_NAME > !FileName!
        echo ------------ >> !FileName!
    )

    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    echo ...git init >> !LOG_FULLFILENAME!
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    git init
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    echo ...git add --all >> !LOG_FULLFILENAME!
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    git add --all
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    echo ...git commit -m "!Comment!" >> !LOG_FULLFILENAME!
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    git commit -m "!Comment!"
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    echo ...git branch -M main >> !LOG_FULLFILENAME!
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!
    git branch -M main
    echo --------------------------------------------------------------- >> !LOG_FULLFILENAME!

    exit /b 0
rem endfunction

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
rem __SET_LIB.bat
rem =================================================
:__SET_MAIN
%LIB_BAT%\__SET_LIB.bat %*
exit /b 0
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
rem =================================================
rem LYRConst.bat
rem =================================================
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
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:Read_N
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
:PressAnyKey
%LIB_BAT%\LYRSupport.bat %*
exit /b 0
rem =================================================
