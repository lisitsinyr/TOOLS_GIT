#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_diff_Commit_cached.bat
# ----------------------------------------------------------------------------
# Просмотрите внесенные вами изменения по сравнению с последней фиксацией
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
echo ' git diff $Commit'
echo '---------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    Commit="$1"
else
    Commit=""
    read -p "Commit: " Commit
fi

if [ ! -z "$Commit" ]; then
    git diff --cached "$Commit"
else
    git diff --cached
fi

#:exit
