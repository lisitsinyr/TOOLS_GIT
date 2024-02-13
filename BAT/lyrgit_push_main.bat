@echo off
rem -------------------------------------------------------------------
rem lyrgit_push_main.bat
rem ----------------------------------------------------------------------------
rem ***��������� ���������
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

rem -------------------------------------------------------------------
rem ������� �������: �������
rem     LOG_DIR=
rem ���� �������: ���+����������
rem     LOG_BASEFILENAME=
rem ���� �������: ���
rem     LOG_FILENAME=
rem ������ ����� ����� �������: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem ��������� �������
rem     LOG_OPT=11
rem -------------------------------------------------------------------

rem echo -------------------------------------------------------
rem echo 0.DEFAULT
rem echo -------------------------------------------------------

set LOG_DIR=.
set LOG_DIR=D:\PROJECTS_LYR\LOGS
set LOG_FILENAME=GIT_CONFIG_list_so_ss_current
set LOG_FILENAME=

rem ...������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
echo BAT_DIR: %BAT_DIR%
rem ...DATETIME_STAMP
set DATETIME_STAMP=%date:~6,4%%date:~3,2%%date:~0,2%%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
rem echo DATETIME_STAMP: %DATETIME_STAMP%
rem ...������ ����� ����� �������: FILENAME,DT,...
if "%LOG_FILENAME_FORMAT%" == "" (
    set LOG_FILENAME_FORMAT=FILENAME
    rem set LOG_FILENAME_FORMAT=DATETIME
)
rem echo LOG_FILENAME_FORMAT: %LOG_FILENAME_FORMAT%
rem ...��������� �������
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
rem ...���� �������: �������+���+����������
set SCRIPT_FULLFILENAME=%~f0
rem echo SCRIPT_FULLFILENAME: %SCRIPT_FULLFILENAME%
rem ...���� �������: ���+����������
set SCRIPT_BASEFILENAME=%~n0%~x0
rem echo SCRIPT_BASEFILENAME: %SCRIPT_BASEFILENAME%
rem ...���� �������: ���
set SCRIPT_FILENAME=%~n0
rem echo SCRIPT_FILENAME: %SCRIPT_FILENAME%
rem echo -------------------------------------------------------
rem echo 2.������� ��������
rem echo -------------------------------------------------------
rem ������� �������: �������
if "%LOG_DIR%" == "" (
    rem set LOG_FULLFILENAME=%~d0%~p0LOGS
    set LOG_DIR=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\04_BAT\%PROJECTS%\LOGS
)
rem echo LOG_DIR: %LOG_DIR%
if exist %LOG_DIR% (
    rem echo ������� %LOG_DIR% ����������
) else (
    echo ERROR: ������� %LOG_DIR% �� ����������
    exit /b 1
)
rem ...���� �������: ���
if "%LOG_FILENAME%" == "" (
    if "%LOG_FILENAME_FORMAT%" == "FILENAME" (
        set LOG_FILENAME=%SCRIPT_FILENAME%
    ) else (
        if "%LOG_FILENAME_FORMAT%" == "DATETIME" (
            set LOG_FILENAME=%DATETIME_STAMP%
        ) else (
            echo ERROR: ���� ������� �� �����
            exit /b 1
        )
    )
)
rem echo LOG_FILENAME: %LOG_FILENAME%
rem ...���� �������: �������+���+����������
set LOG_FULLFILENAME=%LOG_DIR%\%LOG_FILENAME%.log
rem echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem ...��������� ������� LOG_OPT1
set LOG_OPT1=%LOG_OPT:~0,1%
if "%LOG_OPT1%" == "" (
    set LOG_OPT1=1
)
rem echo LOG_OPT1: %LOG_OPT1%
rem ...��������� ������� LOG_OPT2
set LOG_OPT2=%LOG_OPT:~1,1%
if "%LOG_OPT2%" == "" (
    set LOG_OPT2=1
)
rem echo LOG_OPT2: %LOG_OPT2%

echo -------------------------------------------------------
echo 5. ������ %SCRIPT_FULLFILENAME%
echo -------------------------------------------------------

:begin
echo --------------------------------------------------------------- > %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
echo Check 1 parametr >> %LOG_FULLFILENAME%
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%
if "%1" == "" (
    set /p Comment=Comment:
) else (
    set Comment=%1
)
if "%Comment%" == "" (
    echo Parametr Comment not set
    set Comment=Git Bash commit update
)

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
git push -u origin main >> %LOG_FULLFILENAME% >> %LOG_FULLFILENAME%
rem git push -u origin main
echo --------------------------------------------------------------- >> %LOG_FULLFILENAME%

rem pause
far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
