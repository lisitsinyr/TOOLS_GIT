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
chcp 1251

:Begin
echo ----------------------------------------------------------------------------
echo Check 1 parametr
echo ----------------------------------------------------------------------------
:P1
if "%1" == "" goto P1_Input
SET PathName=%1
goto P2
rem -------------------------------------------------------------------
:P1_Input
set /p PathName=PathName:
if "%PathName%" == "" goto P1_Error
echo Goto folder %PathName%
cd %PathName%
goto P2
rem -------------------------------------------------------------------
:P1_Error
echo Parametr PathName not set
echo Local Repository will create in current folder

echo ----------------------------------------------------------------------------
echo Check 2 parametr
echo ----------------------------------------------------------------------------
:P2
if "%2" == "" goto P2_Input
set Comment="%2"
goto Begin_git
:P2_Input
set /p Comment=Comment:
if "%Comment%" == "" goto P2_Error
goto Begin_git
:P2_Error
echo Parametr Comment not set
set Comment=Git Bash commit update

:Begin_git
pwd > LocalRepository
echo ----------------------------------------------------------------------------
echo Local Repository  =
type LocalRepository
del LocalRepository
echo ----------------------------------------------------------------------------

echo .gitignore
touch .gitignore
attrib +A +H .gitignore

echo .gitmodules
touch .gitmodules
attrib +A +H .gitmodules

echo README.md
touch README.md
attrib +A +H README.md
echo README >> README.md

echo ----------------------------------------------------------------------------
echo git init
echo git add --all
echo git commit -m "%Comment%"
echo git branch -M main
echo ----------------------------------------------------------------------------
git init
git add --all
git commit -m "%Comment%"
git branch -M main

:Exit
