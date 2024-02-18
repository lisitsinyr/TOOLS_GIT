@echo off
rem -------------------------------------------------------------------
rem lyrgit_push_main.bat
rem ----------------------------------------------------------------------------
rem ***Отправить изменения
rem ----------------------------------------------------------------------------
rem usage: git push [<options>] [<repository> [<refspec>...]]
rem 
rem     -v, --verbose         be more verbose
rem     -q, --quiet           be more quiet
rem     --repo <repository>   repository
rem     --all                 push all refs
rem     --mirror              mirror all refs
rem     -d, --delete          delete refs
rem     --tags                push tags (can't be used with --all or --mirror)
rem     -n, --dry-run         dry run
rem     --porcelain           machine-readable output
rem     -f, --force           force updates
rem     --force-with-lease[=<refname>:<expect>]
rem                           require old value of ref to be at this value
rem     --force-if-includes   require remote updates to be integrated locally
rem     --recurse-submodules (check|on-demand|no)
rem                           control recursive pushing of submodules
rem     --thin                use thin pack
rem     --receive-pack <receive-pack>
rem                           receive pack program
rem     --exec <receive-pack>
rem                           receive pack program
rem     -u, --set-upstream    set upstream for git pull/status
rem     --progress            force progress reporting
rem     --prune               prune locally removed refs
rem     --no-verify           bypass pre-push hook
rem     --follow-tags         push missing but relevant tags
rem     --signed[=(yes|no|if-asked)]
rem                           GPG sign the push
rem     --atomic              request atomic transaction on remote side
rem     -o, --push-option <server-specific>
rem                           option to transmit
rem     -4, --ipv4            use IPv4 addresses only
rem     -6, --ipv6            use IPv6 addresses only
rem -------------------------------------------------------------------
chcp 1251>NUL

setlocal enabledelayedexpansion

:begin
rem -------------------------------------------------------------------
rem PROJECTS - имя проекта
set PROJECTS=PROJECTS_BAT
rem echo PROJECTS: %PROJECTS%
rem -------------------------------------------------------------------
rem PROJECTS_LYR_DIR - каталог проектов
set PROJECTS_LYR_DIR=D:\PROJECTS_LYR
rem echo PROJECTS_LYR_DIR: %PROJECTS_LYR_DIR%
rem -------------------------------------------------------------------
rem PROJECTS_DIR - каталог проекта
set PROJECTS_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%
rem echo PROJECTS_DIR: %PROJECTS_DIR%
rem -------------------------------------------------------------------
rem SCRIPT_FULLFILENAME - Файл скрипта [каталог+имя+расширение]
set SCRIPT_FULLFILENAME=%0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem -------------------------------------------------------------------
rem SCRIPTS_DIR - Каталог скриптов
if "%SCRIPTS_DIR%" == "" (
    set SCRIPTS_DIR=D:\TOOLS\TOOLS_BAT
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\TOOLS_BAT
    set SCRIPTS_DIR=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\04_BAT\PROJECTS_BAT\TOOLS_BAT
)
rem echo SCRIPTS_DIR: %SCRIPTS_DIR%
rem -------------------------------------------------------------------
rem LIB_BAT - каталог библиотеки скриптов
set LIB_BAT=%SCRIPTS_DIR%\LIB
if not exist %LIB_BAT%\ (
    echo ERROR: Каталог библиотеки LYR $LIB_BAT не существует...
    exit /b 0
)
rem -------------------------------------------------------------------
rem SCRIPTS_DIR_KIX - Каталог скриптов KIX
if "%SCRIPTS_DIR_KIX%" == "" (
    set SCRIPTS_DIR_KIX=D:\TOOLS\TOOLS_KIX
    set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\TOOLS_KIX
    set SCRIPTS_DIR_KIX=D:\PROJECTS_LYR\CHECK_LIST\03_SCRIPT\01_KIX\PROJECTS_KIX\TOOLS_KIX
)
rem echo SCRIPTS_DIR_KIX: %SCRIPTS_DIR_KIX%

echo ==================================================================
echo SET %SCRIPT_FULLFILENAME% ...
echo ==================================================================
call :__SET_VAR_SCRIPT %SCRIPT_FULLFILENAME% || exit /b 1
call :__SET_VAR_DEFAULT || exit /b 1
call :__SET_VAR_PROJECTS || exit /b 1
call :__SET_CHECK_REPO || exit /b 1
rem -------------------------------------------------------------------
rem LOG_DT_FORMAT -
set LOG_DT_FORMAT=
rem -------------------------------------------------------------------
rem LOG_FILENAME_FORMAT - Формат имени файла журнала [FILENAME,DATETIME,...]
set LOG_FILENAME_FORMAT=
rem -------------------------------------------------------------------
rem LOG_OPT - Параметры журнала [11]
set LOG_OPT=
rem  -------------------------------------------------------------------
rem LOG_DIR - Каталог журнала [каталог]
set LOG_DIR=
rem -------------------------------------------------------------------
rem LOG_FILENAME - Файл журнала [имя]
set LOG_FILENAME=

call :__SET_LOG || exit /b 1

call :StartLogFile || exit /b 1

echo ================================================================= >> %LOG_FULLFILENAME%
echo START %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

call :MAIN || exit /b 1

echo ================================================================= >> %LOG_FULLFILENAME%
echo STOP %SCRIPT_BASEFILENAME% ... >> %LOG_FULLFILENAME%
echo ================================================================== >> %LOG_FULLFILENAME%

cd /D %DIR_SAVE%
rem far -v %LOG_FULLFILENAME%

call :StopLogFile || exit /b 1

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ LIB
rem =================================================
:__SET_VAR_SCRIPT
%LIB_BAT%\__SET_LIB.bat %*
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
:StartLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:StopLogFile
%LIB_BAT%\LYRLog.bat %*
exit /b 0
:Check_P
%LIB_BAT%\LYRSupport.bat %*
exit /b 0

rem =================================================
rem ФУНКЦИЯ :MAIN
rem =================================================
:MAIN
rem beginfunction
    set Comment="Git Bash commit update"
    set Comment=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

    call :Check_P Comment %Comment% || exit /b 1
    echo Comment: %Comment%

    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    echo ...git add --all >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    git add --all >> %LOG_FULLFILENAME%
    
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    echo ...git commit -m "%Comment%" >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    git commit -m "%Comment%" >> %LOG_FULLFILENAME%

    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    echo ...git push -u origin main >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    git push -u origin main >> %LOG_FULLFILENAME%
    echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
    exit /b 0
rem endfunction
