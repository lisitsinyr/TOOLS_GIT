#!/bin/bash
# -------------------------------------------------------------------
# lyrgit_diff_staged.bat
# ----------------------------------------------------------------------------
# Просмотр разницы между последним коммитом и индексом
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
echo ' git diff -staged'
echo '---------------------------------------------'
git diff -staged

#:exit
