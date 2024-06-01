#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_reset_origin_branch.sh
# ----------------------------------------------------------------------------
# Сбросьте локальное репо и рабочее дерево, чтобы они соответствовали ветке удаленного отслеживания [git reset %remote% %branch%]
# ----------------------------------------------------------------------------
# usage: git reset [--mixed | --soft | --hard | --merge | --keep] [-q] [<commit>]
#    or: git reset [-q] [<tree-ish>] [--] <pathspec>...
#    or: git reset [-q] [--pathspec-from-file [--pathspec-file-nul]] [<tree-ish>]
#    or: git reset --patch [<tree-ish>] [--] [<pathspec>...]
#    or: DEPRECATED: git reset [-q] [--stdin [-z]] [<tree-ish>]
# 
#     -q, --[no-]quiet      be quiet, only report errors
#     --no-refresh          skip refreshing the index after reset
#     --refresh             opposite of --no-refresh
#     --mixed               reset HEAD and index
#     --soft                reset only HEAD
#     --hard                reset HEAD, index and working tree
#     --merge               reset HEAD, index and working tree
#     --keep                reset HEAD but keep local changes
#     --[no-]recurse-submodules[=<reset>]
#                           control recursive updating of submodules
#     -p, --[no-]patch      select hunks interactively
#     -N, --[no-]intent-to-add
#                           record only the fact that removed paths will be added later
#     --[no-]pathspec-from-file <file>
#                           read pathspec from file
#     --[no-]pathspec-file-nul
#                           with --pathspec-from-file, pathspec elements are separated with NUL character
#     -z                    DEPRECATED (use --pathspec-file-nul instead): paths are separated with NUL character
#     --[no-]stdin          DEPRECATED (use --pathspec-from-file=- instead): read paths from <stdin>
# ----------------------------------------------------------------------------

#:begin
echo '--------------------------------------------------'
echo ' git reset origin $branch'
echo '--------------------------------------------------'
echo Check 1 parametr
if [ -n "$1" ]; then
    branch="$1"
else
    branch=""
    read -p "branch: " branch
fi
if [ -z "$branch" ]; then
   echo 'Parametr $branch not specified'
fi

if [ ! -z "$branch" ]; then
    git reset origin "$branch"
fi

#:exit
