#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_log.bat
# ----------------------------------------------------------------------------
# Показать журналы коммитов
# ----------------------------------------------------------------------------
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
echo 'git log'
echo '---------------------------------------------'
git log

#:exit
