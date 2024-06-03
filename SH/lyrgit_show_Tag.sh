#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_show_Tag.bat
# ----------------------------------------------------------------------------
# Показать различные типы объектов
# -------------------------------------------------------------------
# usage: git log [<options>] [<revision-range>] [[--] <path>...]
#    or: git show [<options>] <object>...
# 
#     -q, --[no-]quiet      suppress diff output
#     --[no-]source         show source
#     --[no-]use-mailmap    use mail map file
#     --[no-]mailmap        alias of --use-mailmap
#     --clear-decorations   clear all previously-defined decoration filters
#     --[no-]decorate-refs <pattern>
#                           only decorate refs that match <pattern>
#     --[no-]decorate-refs-exclude <pattern>
#                           do not decorate refs that match <pattern>
#     --[no-]decorate[=...] decorate options
#     -L <range:file>       trace the evolution of line range <start>,<end> or function :<funcname> in <file>
# ----------------------------------------------------------------------------

#:begin
echo '---------------------------------------------'
echo ' git show $Tag'
echo '---------------------------------------------'
echo 'Check 1 parametr'
if [ -n "$1" ]; then
    Tag="$1"
else
    Tag=""
    read -p "Tag: " Tag
fi

if [ ! -z "$Tag" ]; then
    git show "$Tag"
else
    echo 'Parametr $Tag not specified'
fi

#:exit
