#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_remote_rename.bat
# ----------------------------------------------------------------------------
# Переименование удаленных репозитариев (по существу переименование локальной ссылки на удаленный репозитарий)
# ----------------------------------------------------------------------------
# usage: git remote [-v | --verbose]
#    or: git remote add [-t <branch>] [-m <master>] [-f] [--tags | --no-tags] [--mirror=<fetch|push>] <name> <url>
#    or: git remote rename [--[no-]progress] <old> <new>
#    or: git remote remove <name>
#    or: git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
#    or: git remote [-v | --verbose] show [-n] <name>
#    or: git remote prune [-n | --dry-run] <name>
#    or: git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)...]
#    or: git remote set-branches [--add] <name> <branch>...
#    or: git remote get-url [--push] [--all] <name>
#    or: git remote set-url [--push] <name> <newurl> [<oldurl>]
#    or: git remote set-url --add <name> <newurl>
#    or: git remote set-url --delete <name> <url>
# 
#     -v, --[no-]verbose    be verbose; must be placed before a subcommand
# ----------------------------------------------------------------------------

#:begin
echo '-----------------------------------------------------'
echo ' git remote rename $Repository_old $Repository_new'
echo '-----------------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    Repository_old="$1"
else
    Repository_old=""
    read -p "Repository_old: " Repository_old
fi
if [ -z "$Repository_old" ]; then
   echo 'Parametr $Repository_old not specified'
fi

echo 'Check 2 parametr'
if [ -n "$2" ]; then
    Repository_new="$2"
else
    Repository_new=""
    read -p "Repository_new: " Repository_new
fi
if [ -z "$Repository_new" ]; then
   echo 'Parametr $Repository_new not specified'
fi

if [ ! -z "$LocalRepository" && ! -z "$GlobalRepository" ]; then
    git remote rename "$Repository_old" "$Repository_new"
fi

#:exit
