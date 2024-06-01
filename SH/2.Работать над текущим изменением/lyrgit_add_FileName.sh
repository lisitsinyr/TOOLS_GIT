#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_add_FileName.bat
# ----------------------------------------------------
# Добавить файлы [M, D, ?] %FileName%
# ----------------------------------------------------
# M - (modified-измененные) отслеживаемые, изменились с прошлого коммита, еще не добавлены
# D - (deleted-удаленные) отслеживаемые, удалены после прошлого коммита, еще не добавлены
# ? - (untracked-новые) неотслеживаемые, не запрещены к добавлению
# ! - (ignored-игнорируемые) неотслеживаемые, запрещены к добавлению (например, в .gitignore)
# -------------------------------------------------------------------
# usage: git add [<options>] [--] <pathspec>...
# 
#     -n, --dry-run         dry run
#     -v, --verbose         be verbose
# 
#     -i, --interactive     interactive picking
#     -p, --patch           select hunks interactively
#     -e, --edit            edit current diff and apply
#     -f, --force           allow adding otherwise ignored files
#     -u, --update          update tracked files
#     --renormalize         renormalize EOL of tracked files (implies -u)
#     -N, --intent-to-add   record only the fact that the path will be added later
#     -A, --all             add changes from all tracked and untracked files
#     --ignore-removal      ignore paths removed in the working tree (same as --no-all)
#     --refresh             don't add, only refresh the index
#     --ignore-errors       just skip files which cannot be added because of errors
#     --ignore-missing      check if - even missing - files are ignored in dry run
#     --sparse              allow updating entries outside of the sparse-checkout cone
#     --chmod (+|-)x        override the executable bit of the listed files
#     --pathspec-from-file <file>
#                           read pathspec from file
#     --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character
# -------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo 'git add $FileName'
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
        git add "$FileName"
    else
        echo "$FileName" 'not exist'
    fi
else
    echo 'Parametr $FileName not specified'
fi

#:exit
