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
chcp 1251

rem echo -------------------------------------------------------
rem Файл скрипта: каталог+имя+расширение
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem Файл скрипта: имя+расширение
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem Файл скрипта: имя
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%

call %BAT_DIR%\LIB\__SET__.bat

:begin
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Start %SCRIPT_BASEFILENAME% ...       >> %LOG_FULLFILENAME%
echo ------------------------------------------------------- >> %LOG_FULLFILENAME%
echo CURRENT_DIR: %CURRENT_DIR%            >> %LOG_FULLFILENAME%
set DIR_SAVE=%CURRENT_DIR%

call :Check_P1 || exit /b 1

rem echo BODY script %SCRIPT_BASEFILENAME% ... 
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
echo ...git add --all >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
git add --all >> %LOG_FULLFILENAME%

echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
echo ...git commit -m "%Comment%" >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
git commit -m "%Comment%" >> %LOG_FULLFILENAME%
rem git commit -m "%Comment%"

echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
echo ...git push -u origin main >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
git push -u origin main >> %LOG_FULLFILENAME%
rem git push -u origin main
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%

rem far -v %LOG_FULLFILENAME%

cd /D %DIR_SAVE%

rem Выход из сценария. Дальше - только функции.
:Exit
exit /b 0

rem =================================================
rem ФУНКЦИИ
rem =================================================

:Check_P1
echo ---------------------------------------------------------------
echo Check_P1 [Comment]
echo ---------------------------------------------------------------
if "%1"=="" (
    rem set /p Comment=Comment:
    set Comment=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
) else (
    set Comment=%1
)
if "%Comment%"=="" (
    set Comment=Git Bash commit update
)
echo Comment: %Comment%
exit /b 0
