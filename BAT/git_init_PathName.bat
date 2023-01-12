@echo off
rem -------------------------------------------------------------------
rem git init %PathName%
rem -------------------------------------------------------------------
chcp 1251

rem -------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
goto Begin
:P1_Input
set /p PathName=PathName:
if "%PathName%" == "" goto P1_Error
goto Begin
:P1_Error
echo Значение параметра PathName не установлено
goto Exit
rem -------------------------------------------------------------------

:begin
git init %PathName%


touch %PathName%\.gitignore
attrib +A +H %PathName%\.gitignore

touch %PathName%\.gitmodules
attrib +A +H %PathName%\.gitmodules

touch %PathName%\.README.md
attrib +A +H %PathName%\.README.md

:Exit
