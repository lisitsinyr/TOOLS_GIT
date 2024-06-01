#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_rm_FileName_f.bat
# ----------------------------------------------------------------------------
# Удаление проиндексированного измененного файла
# ----------------------------------------------------------------------------
# usage: git rm [-f | --force] [-n] [-r] [--cached] [--ignore-unmatch]
#               [--quiet] [--pathspec-from-file=<file> [--pathspec-file-nul]]
#               [--] [<pathspec>...]
# 
#     -n, --[no-]dry-run    dry run
#     -q, --[no-]quiet      do not list removed files
#     --[no-]cached         only remove from the index
#     -f, --[no-]force      override the up-to-date check
#     -r                    allow recursive removal
#     --[no-]ignore-unmatch exit with a zero status even if nothing matched
#     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
#     --[no-]pathspec-from-file <file>
#                           read pathspec from file
#     --[no-]pathspec-file-nul
#                           with --pathspec-from-file, pathspec elements are separated with NUL character
# ----------------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo ' git rm -f $FileName'
echo '---------------------------------------------'
echo Check 1 parametr
if [ -n "$1" ]; then
    FileName="$1"
else
    FileName=""
    read -p "FileName: " FileName
fi

if [ ! -z "$FileName" ]; then
    if [ -f "$FileName" ]; then
        echo "$FileName" 'not exist'
        git rm -f "$FileName"
    else
        echo "$FileName" 'not exist'
    fi
else
    echo 'Parametr $FileName not specified'
fi

#:exit
