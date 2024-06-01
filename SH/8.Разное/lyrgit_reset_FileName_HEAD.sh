#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_reset_FileName_HEAD.bat
# ----------------------------------------------------------------------------
# Отмена индексации файла (исключение из индекса) [git reset HEAD <file(s)>]
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
echo '----------------------------------------------'
echo ' git reset HEAD $FileNames'
echo '----------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    FileNames="$1"
else
    FileNames=""
    read -p "FileNames: " FileNames
fi

if [ ! -z "$FileNames" ]; then
    git reset HEAD "$FileNames"
else
   echo 'Parametr $UserEmail not specified'
fi

#:exit
