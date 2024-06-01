#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_diff_Commit_Commit.bat
# ----------------------------------------------------------------------------
# Просмотр изменений между двумя произвольными коммитами
# ----------------------------------------------------------------------------
# git diff [<options>] [<commit>] [--] [<path>...]
# git diff [<options>] --cached [--merge-base] [<commit>] [--] [<path>...]
# git diff [<options>] [--merge-base] <commit> [<commit>...] <commit> [--] [<path>...]
# git diff [<options>] <commit>...<commit> [--] [<path>...]
# git diff [<options>] <blob> <blob>
# git diff [<options>] --no-index [--] <path> <path>
# ----------------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo ' git diff $Commit_1 $Commit_2'
echo '---------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    Commit_1="$1"
else
    Commit=""
    read -p "Commit_1: " Commit_1
fi
if [ -z $Commit_1 ]; then
   echo 'Parametr $Commit_1 not specified'
fi
echo 'Check 2 parametr'
if [ -n "$2" ]; then
    Commit_2="$2"
else
    Commit=""
    read -p "Commit_2: " Commit_2
fi
if [ -z $Commit_2 ]; then
   echo 'Parametr $Commit_2 not specified'
fi

if [ ! -z "$Commit_1" && ! -z "$Commit_2" ]; then
    git diff "$Commit_1" "$Commit_2"
fi

#:exit
