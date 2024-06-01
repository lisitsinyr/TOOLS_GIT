@echo off
rem -------------------------------------------------------------------
rem lyrgit_init_Sharedproject.bat
rem ----------------------------------------------------------------------------
rem Инициализация репозитария [git init -bare -share sharedproject.git]
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

:begin
echo ----------------------------------------------------------------------------
echo git init -bare -share sharedproject.git
echo ----------------------------------------------------------------------------
git init -bare -share sharedproject.git

:Exit
