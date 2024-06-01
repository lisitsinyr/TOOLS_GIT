#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_diff_Branch.bat
# ----------------------------------------------------------------------------
# Просмотр изменения, которые у вас есть в вашей рабочей области относительно ветки
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
echo ' git diff $branch'
echo '---------------------------------------------'
echo Check 1 parametr
if [ -n "$1" ]; then
    branch="$1"
else
    branch=""
    read -p "branch: " branch
fi

if [ ! -z "$branch" ]; then
    git diff "$branch"
else
    echo 'Parametr $branch not specified'
fi

#:exit
