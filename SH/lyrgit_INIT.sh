#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_INIT.sh
# ----------------------------------------------------------------------------
# 1.Запустить рабочую зону [***]
# ----------------------------------------------------------------------------
# Инициализация репозитария в текущем катологе или в заданном каталоге
# ----------------------------------------------------------------------------
# usage: git init [-q | --quiet] [--bare] [--template=<template-directory>]
#                 [--separate-git-dir <git-dir>] [--object-format=<format>]
#                 [-b <branch-name> | --initial-branch=<branch-name>]
#                 [--shared[=<permissions>]] [<directory>]
#
#     --[no-]template <template-directory>
#                           directory from which templates will be used
#     --[no-]bare           create a bare repository
#     --shared[=<permissions>]
#                           specify that the git repository is to be shared amongst several users
#     -q, --[no-]quiet      be quiet
#     --[no-]separate-git-dir <gitdir>
#                           separate git dir from working tree
#     -b, --[no-]initial-branch <name>
#                           override the name of the initial branch
#     --[no-]object-format <hash>
#                           specify the hash algorithm to use
# ----------------------------------------------------------------------------

# -------------------------------------------------------------------
#:begin
# -------------------------------------------------------------------
echo '---------------------------------------------------------------------------'
echo ' Инициализация репозитария в текущем катологе или в заданном каталоге'
echo '---------------------------------------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    PathName="$1"
else
    PathName=""
    read -p "PathName: " PathName
fi
if [ ! -z "$PathName" ]; then
    if [ -d "$PathName" ]; then
        echo "$PathName" 'not exist'
        rm -R "$PathName"
    else
        echo "$PathName" 'not exist'
    fi
    mkdir "$PathName"
    cd "$PathName"
    echo 'goto' "$PathName"
fi
pwd

echo 'Check 2 parametr'
if [ -n "$2" ]; then
    Comment="$2"
else
    Comment=""
    read -p "Comment: " Comment
fi
if [ -z $Comment ]; then
    echo 'Parametr $Comment not specified'
    set Comment='Git Bash commit update'
    echo $Comment
fi

#:GIT_create_Repository

git config --global init.defaultBranch main

touch .gitignore
chmod 664 .gitignore

touch .gitmodules
chmod 664 .gitmodules

touch README.md
chmod 664 README.md
echo '*' >> README.md

git init
git add --all
git commit -m "$Comment"
git branch -M main

#:Exit
