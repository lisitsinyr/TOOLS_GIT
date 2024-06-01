#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_diff.bat
# ----------------------------------------------------------------------------
# Просмотр разницы между рабочим каталогом и индексом (staged area)
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
echo ' git diff'
echo '---------------------------------------------'
git diff

#:exit
