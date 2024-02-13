@echo off
rem -------------------------------------------------------------------
rem lyrgit_config.bat
rem -------------------------------------------------------------------
rem ������� �������: �������
rem     LOG_DIR=
rem ���� �������: ���+����������
rem     LOG_BASEFILENAME=
rem ������� ���������� KIX: �������
rem     LIB_KIX=
rem ������� APP_KIX: �������
rem     KIX_DIR=
rem ������ APP_KIX: ���+����������
rem     APP_KIX=lyrxxx_������.kix
rem ���� �������: ���
rem     LOG_FILENAME=
rem ������ ����� ����� �������: FILENAME,DT,...
rem     LOG_FILENAME_FORMAT=
rem ��������� �������
rem     LOG_OPT=11
rem -------------------------------------------------------------------
chcp 1251

rem echo -------------------------------------------------------
rem echo 0.DEFAULT
rem echo -------------------------------------------------------

set LOG_DIR=D:\PROJECTS_LYR\LOGS
set LOG_FILENAME=GIT_CONFIG_list_so_ss_current
set BAT_DIR=D:\PROJECTS_LYR\CHECK_LIST\07_GIT\PROJECTS_GIT\BAT_GIT_KIX

rem ...������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT_GIT_KIX
)
rem echo BAT_DIR: %BAT_DIR%

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
rem -------------------------------------------------------------------
rem ...������� APP_KIX: �������
set KIX_DIR=
rem ...������ APP_KIX: ���+����������
set APP_KIX=lyrxxx_������.kix
set APP_KIX=GITKIX.kix
rem -------------------------------------------------------------------

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
rem ...������� BAT_DIR: �������
if "%BAT_DIR%" == "" (
    set BAT_DIR=D:\TOOLS\TOOLS_BAT\BAT
)
rem echo BAT_DIR: %BAT_DIR%
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
echo LOG_FULLFILENAME: %LOG_FULLFILENAME%
rem ...��������� �������
set LOG_OPT1=%LOG_OPT:~0,1%
if "%LOG_OPT1%" == "" (
    set LOG_OPT1=1
)
rem echo LOG_OPT1: %LOG_OPT1%
set LOG_OPT2=%LOG_OPT:~1,1%
if "%LOG_OPT2%" == "" (
    set LOG_OPT2=1
)
rem echo LOG_OPT2: %LOG_OPT2%
rem echo -------------------------------------------------------
rem echo 3.���������� LYR
rem echo -------------------------------------------------------
rem ...������� ���������� KIX: �������
if "%LIB_KIX%" == "" (
    rem echo ������� LIB_KIX �� ����������
    if "%COMPUTERNAME%" == "%USERDOMAIN%" (
        set LIB_KIX=%PROJECTS_LYR_DIR%\CHECK_LIST\03_SCRIPT\01_KIX\%PROJECTS%\TOOLS_KIX\LIB
        set LIB_KIX=D:\TOOLS\TOOLS_BAT\TOOLS_KIX\LIB
    ) else (
        set LIB_KIX=\\S73FS01\APPInfo\tools\LIB
    )
)
rem echo LIB_KIX: %LIB_KIX%
if exist %LIB_KIX% (
    rem echo ������� %LIB_KIX% ����������
) else (
    echo ERROR: ������� %LIB_KIX% �� ����������
    exit /b 1
)
rem echo -------------------------------------------------------
rem echo 4.APP_KIX
rem echo -------------------------------------------------------
if exist %APP_KIX% (
    rem echo ���� %APP_KIX% ����������
    set KIX_DIR=.\
) else (
    rem echo ���� %APP_KIX% �� ����������
    if exist KIX\%APP_KIX% (
        rem echo ���� KIX\%APP_KIX% ����������
        set KIX_DIR=KIX
    ) else (
        rem echo ���� KIX\%APP_KIX% �� ����������
        if exist %BAT_DIR%\KIX\%APP_KIX% (
            rem echo ���� %BAT_DIR%\KIX\%APP_KIX% ����������
            set KIX_DIR=%BAT_DIR%\KIX
        ) else (
            echo ERROR: ���� %BAT_DIR%\KIX\%APP_KIX% �� ����������
            exit /b 1
        )
    )
)
rem echo KIX_DIR: %KIX_DIR%

echo -------------------------------------------------------
echo 5. ������ APP_KIX
echo -------------------------------------------------------
kix32.exe %KIX_DIR%\%APP_KIX% "$P1=%1" "$P2=%2" "$P3=%3" "$P4=%4" "$P5=%5" "$P6=%6" "$P7=%7" "$P8=%8" "$P9=%9" > %LOG_FULLFILENAME%

far -v %LOG_FULLFILENAME%

exit /b 0

:Exit
