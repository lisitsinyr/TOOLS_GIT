#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_mv.bat
# ----------------------------------------------------------------------------
# Переместить или переименовать файл, каталог или символическую ссылку
# ----------------------------------------------------------------------------
# usage: git mv [<options>] <source>... <destination>
# 
#     -v, --[no-]verbose    be verbose
#     -n, --[no-]dry-run    dry run
#     -f, --[no-]force      force move/rename even if target exists
#     -k                    skip move/rename errors
#     --[no-]sparse         allow updating entries outside of the sparse-checkout cone
# ----------------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo ' git mv $source $destination'
echo '---------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    source="$1"
else
    source=""
    read -p "source: " source
fi
if [ -z $source ]; then
   echo 'Parametr $source not specified'
fi
echo 'Check 2 parametr'
if [ -n "$2" ]; then
    destination="$2"
else
    destination=""
    read -p "destination: " destination
fi
if [ -z $Commit_2 ]; then
    echo 'Parametr $destination not specified'
fi

if [ ! -z "$source" && ! -z "$destination" ]; then
    git mv $source $destination
fi

#:exit
